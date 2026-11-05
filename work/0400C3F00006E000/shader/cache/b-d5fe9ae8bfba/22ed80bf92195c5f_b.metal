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
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_29 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_49 [[attribute(5)]];
    float4 m_41 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_35 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _880 = false;
    bool _652 = false;
    bool _566 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_26.w;
    float _73 = trunc(_71);
    int _76 = int(_73);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    if (!_80)
    {
        out.m_29.x = 0.0;
    }
    int _86 = 0;
    if (!_80)
    {
        float _88 = _84 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    float _92 = as_type<float>(_90);
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2287 = as_type<float>(_90);
        out.gl_Position.z = _2287;
    }
    if (!_80)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _94 = in.m_31.w;
    float _96 = float(_76);
    float _98 = 1.0 / _96;
    float _100 = -_94;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_94);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = _102 * _98;
    bool _116 = _102 >= _96;
    bool _118 = !_112;
    bool _120 = _116 || _118;
    out.m_33.x = _114;
    float _122 = _94;
    float _124 = _114;
    float _126 = _102;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (_120)
    {
        out.m_29.x = 0.0;
    }
    int _130 = 0;
    if (_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2360 = as_type<float>(_134);
        out.gl_Position.z = _2360;
    }
    if (_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_35.x;
    float _138 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _140 = in.m_35.y;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = in.m_37.w;
    float _154 = in.m_31.x;
    float _156 = in.m_31.y;
    float _158 = in.m_31.z;
    float _160 = in.m_26.x;
    float _162 = in.m_26.y;
    float _164 = in.m_26.z;
    float _166 = _138;
    if (!_150)
    {
        float _168 = _138 * _138;
        float _170 = _168 * 0.5;
        _92 = _170;
    }
    float _172 = _92;
    float _174 = _172;
    if (!_150)
    {
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _176;
    }
    float _178 = _174;
    out.m_39.x = _136;
    out.m_39.y = _140;
    bool _180 = !_150;
    float _182 = _178;
    float _184 = _140;
    float _186 = _136;
    if (!_180)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _138 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _138);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _216;
    }
    float _218 = _182;
    bool _220 = !_150;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _138 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _166 = _240;
    }
    float _242 = _166;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _154, _246);
    float _254 = fma(_242, _156, _248);
    float _256 = fma(_242, _158, _250);
    float _258 = fma(_252, _152, _160);
    float _260 = fma(_254, _152, _162);
    float _262 = fma(_256, _152, _164);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_41.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        _282 = _114;
    }
    _284 = false;
    float _286 = _282;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = _286 + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _294 = _286 + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = _286 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _316 = 1.0 / _302;
    bool _318 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_286);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    bool _330 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _332 = isnan(_286);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = 1.0 / _306;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _346 = 1.0 / _310;
    float _348 = _290 * _316;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _352 = _286 + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _354;
    float _358 = fma(_356, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _360 = 1.0 / _314;
    float _362 = _294 * _342;
    bool _364 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _366 = isnan(_286);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = -_374;
    float _378 = _376 + 1.0;
    float _380 = _298 * _346;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = fma(_384, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _388 = _352 * _360;
    bool _390 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _392 = isnan(_286);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    bool _402 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _404 = isnan(_286);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _418 = -_400;
    float _420 = _418 + 1.0;
    float _422 = _400 * _378;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _424;
    float _428 = -_340;
    float _430 = _428 + 1.0;
    float _432 = _412 * _420;
    float _434 = -_412;
    float _436 = _434 + 1.0;
    float _438 = fma(_426, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _440 = -_328;
    float _442 = _440 + 1.0;
    float _444 = fma(_416, _362, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _446 = _328 * _436;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _456 = _340 * _442;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_450, _362, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _464 = fma(_454, _362, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _466 = _438 * _456;
    float _468 = _358 * _456;
    float _470 = _386 * _456;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _472;
    float _476 = in.m_37.x;
    float _478 = in.m_37.y;
    float _480 = in.m_37.z;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _482;
    float _486 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _468);
    float _488 = fma(_474, _380, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _490 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _466);
    float _492 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].z, _470);
    float _494 = fma(_484, _380, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = fma(_460, _380, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _498 = fma(_444, _446, _490);
    float _500 = fma(_462, _446, _486);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _514 = fma(_464, _446, _492);
    float _516 = fma(_504, _388, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _518 = fma(_508, _388, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _520 = fma(_512, _388, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _522 = fma(_496, _432, _514);
    float _524 = fma(_488, _432, _500);
    float _526 = fma(_494, _432, _498);
    float _528 = fma(_520, _422, _522);
    float _530 = fma(_518, _422, _524);
    float _532 = fma(_516, _422, _526);
    float _534 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[147].z, _528);
    float _536 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[147].y, _530);
    float _538 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[147].x, _532);
    float _540 = _534 * _480;
    float _542 = _536 * _478;
    float _544 = _538 * _476;
    bool _546 = !_344;
    float _564;
    if (!_546)
    {
        float _548 = in.m_41.x;
        float _550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _552 = _548 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _554 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _556 = _554 * _550;
        float _558 = floor(_556);
        float _560 = -_558;
        float _562 = _556 + _560;
        _564 = _562;
        _566 = true;
    }
    else
    {
        _564 = _114;
    }
    _566 = false;
    float _568 = _564;
    bool _570 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _572 = isnan(_568);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _586 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _588 = isnan(_568);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _568 + _602;
    float _606 = -_580;
    float _608 = _606 + 1.0;
    bool _610 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _612 = 1.0 / _584;
    float _614 = _596 * _608;
    float _616 = -_596;
    float _618 = _616 + 1.0;
    float _620 = _600 * _612;
    float _622 = fma(_620, _604, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _624 = _622 * _614;
    float _626 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[115].x, _624);
    float _628 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[116].x, _626);
    float _630 = _628 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.w = _630;
    bool _632 = !_610;
    float _650;
    if (!_632)
    {
        float _634 = in.m_41.x;
        float _636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _638 = _634 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _642 = _640 * _636;
        float _644 = floor(_642);
        float _646 = -_644;
        float _648 = _642 + _646;
        _650 = _648;
        _652 = true;
    }
    else
    {
        _650 = _114;
    }
    _652 = false;
    float _654 = _650;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _658 = _654 + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _662 = _654 + _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _666 = _654 + _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _680 = 1.0 / _670;
    bool _682 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _684 = isnan(_654);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = 1.0 / _674;
    bool _696 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _698 = 1.0 / _678;
    bool _700 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _702 = isnan(_654);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = _658 * _680;
    bool _714 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _716 = isnan(_654);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = -_710;
    float _728 = _726 + 1.0;
    float _730 = _662 * _694;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _732;
    float _736 = -_724;
    float _738 = _736 + 1.0;
    float _740 = _724 * _728;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _746 = fma(_734, _730, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _752 = _666 * _698;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _758;
    float _762 = _692 * _738;
    float _764 = -_692;
    float _766 = _764 + 1.0;
    float _768 = fma(_756, _730, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _770 = fma(_760, _730, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _772 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _774 = isnan(_654);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _780 = _776 || _778;
    float _782 = float(_780);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _788 = fma(_744, _752, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _790 = fma(_750, _752, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _792 = _782 * _766;
    float _794 = fma(_786, _752, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _796 = -_782;
    float _798 = _796 + 1.0;
    float _800 = _746 * _792;
    float _802 = _768 * _792;
    float _804 = _770 * _792;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _806;
    float _810 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].x, _800);
    float _812 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].y, _802);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _814;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _818;
    float _822 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].z, _804);
    float _824 = fma(_808, _712, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _826 = fma(_794, _762, _810);
    float _828 = fma(_816, _712, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _830 = fma(_820, _712, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _832 = fma(_788, _762, _812);
    float _834 = fma(_790, _762, _822);
    float _836 = fma(_824, _740, _826);
    float _838 = fma(_828, _740, _832);
    float _840 = fma(_830, _740, _834);
    float _842 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[126].x, _836);
    float _844 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[126].y, _838);
    float _846 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[126].z, _840);
    float _848 = _842 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _850 = _844 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _852 = _846 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _854 = _848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _856 = _850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = _852 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _854;
    out.m_45.y = _856;
    out.m_45.z = _858;
    bool _860 = !_696;
    float _878;
    if (!_860)
    {
        float _862 = in.m_41.x;
        float _864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _866 = _862 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _870 = _868 * _864;
        float _872 = floor(_870);
        float _874 = -_872;
        float _876 = _870 + _874;
        _878 = _876;
        _880 = true;
    }
    else
    {
        _878 = _114;
    }
    _880 = false;
    float _882 = _878;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _886 = _882 + _884;
    bool _888 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _890 = isnan(_882);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _904 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _906 = isnan(_882);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _916;
    bool _920 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _922 = isnan(_882);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = 1.0 / _902;
    bool _934 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _936 = isnan(_882);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    bool _946 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _948 = isnan(_882);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _962 = 1.0 / _960;
    bool _964 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _966 = _918 * _932;
    float _968 = -_898;
    float _970 = _968 + 1.0;
    float _972 = -_930;
    float _974 = _972 + 1.0;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _980 = fma(_966, _886, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _982 = _914 * _970;
    float _984 = -_914;
    float _986 = _984 + 1.0;
    float _988 = _898 * _974;
    float _990 = 1.0 / _978;
    float _992 = _944 * _986;
    float _994 = -_944;
    float _996 = _994 + 1.0;
    bool _998 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1000 = isnan(_882);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1014 = _956 * _996;
    float _1016 = -_956;
    float _1018 = _1016 + 1.0;
    bool _1020 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1022 = isnan(_882);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1028 = _1024 || _1026;
    float _1030 = float(_1028);
    float _1032 = 1.0 / _1012;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1034;
    float _1038 = _1008 * _1018;
    float _1040 = -_1008;
    float _1042 = _1040 + 1.0;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1048 = _1030 * _1042;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1054 = _1046 * _962;
    float _1056 = _980 * _1048;
    float _1058 = -_1030;
    float _1060 = _1058 + 1.0;
    float _1062 = 1.0 / _1052;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1066 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1070 = _882 + _1068;
    float _1072 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1056);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1076 = _1074 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1078 = _1036 * _1032;
    float _1080 = fma(_1054, _1070, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1084 = _882 + _1082;
    float _1086 = 1.0 / _1066;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1092 = fma(_1078, _1084, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1094 = fma(_1080, _1038, _1072);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1098 = _882 + _1096;
    float _1100 = _1090 * _990;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1102;
    float _1106 = 1.0 / _1076;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1112 = fma(_1092, _1014, _1094);
    float _1114 = _1104 * _1062;
    float _1116 = fma(_1100, _1098, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1120 = _882 + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1122;
    bool _1126 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1128 = isnan(_882);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = _1110 * _1086;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1142 = _882 + _1140;
    float _1144 = fma(_1114, _1120, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1146 = fma(_1116, _992, _1112);
    float _1148 = -_1136;
    float _1150 = _1148 + 1.0;
    float _1152 = fma(_1138, _1142, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1156 = _882 + _1154;
    float _1158 = _1124 * _1106;
    float _1160 = fma(_1144, _982, _1146);
    float _1162 = _930 * _1150;
    float _1164 = fma(_1158, _1156, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1166 = fma(_1152, _988, _1160);
    float _1168 = fma(_1164, _1162, _1166);
    float _1170 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1168);
    out.m_47.x = _1170;
    bool _1172 = !_964;
    if (!_1172)
    {
        float _1174 = in.m_41.x;
        float _1176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1178 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[14].y, _102);
        float _1182 = _1180 * _1176;
        float _1184 = floor(_1182);
        float _1186 = -_1184;
        float _1188 = _1182 + _1186;
        _124 = _1188;
    }
    float _1190 = _124;
    float _1192 = in.m_41.w;
    float _1194 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1196 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1198 = in.m_35.w;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1202 = _1200 != 0;
    float _1204 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1206 = in.m_41.y;
    float _1208 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1194);
    float _1210 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1196);
    float _1212 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1204);
    float _1214 = in.m_41.z;
    float _1216 = -_140;
    float _1218 = _1216 + 1.0;
    float _1220 = in.m_41.x;
    float _1222 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1224;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1230 = _1228 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1240 = _1192 > 0.5;
    float _1242 = 1.0 / _1226;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1246 = -_1198;
    float _1248 = _1246 + 1.0;
    float _1250 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1254 = _1252 != 0;
    float _1256 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1260 = _1258 != 0;
    float _1262 = 1.0 / _1230;
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1266 = _1264 != 0;
    float _1268 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1272 = _1270 != 0;
    float _1274 = in.m_49.x;
    float _1276 = in.m_49.y;
    float _1278 = in.m_49.z;
    bool _1280 = _1206 > 0.5;
    float _1282 = 1.0 / _1234;
    float _1284 = _1198;
    if (_1254)
    {
        float _1286 = _1240 ? _1218 : _140;
        _184 = _1286;
    }
    float _1288 = _184;
    float _1290 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1292 = 1.0 / _1238;
    if (_1272)
    {
        float _1294 = _1280 ? _1248 : _1198;
        _1284 = _1294;
    }
    float _1296 = _1284;
    float _1298 = -_1244;
    float _1300 = fma(_1290, 2.0, _1298);
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1304 = _1302 != 0;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1308 = _1306 != 0;
    int _1310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1312 = _1310 != 0;
    float _1314 = -_102;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1300);
    float _1318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1322 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1278);
    float _1324 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1274);
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1276);
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1336;
    float _1340 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1208);
    float _1342 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1210);
    float _1344 = _1222 * _1322;
    float _1346 = _1214 * 2.0;
    float _1348 = fma(_1268, -2.0, _1320);
    float _1350 = 1.0 / _1338;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1354 = _1190 + _1352;
    float _1356 = _1250 * _1324;
    float _1358 = _1256 * _1326;
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1362 = _1190 + _1360;
    float _1364 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1212);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1368 = _1190 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1372 = _1190 + _1370;
    float _1374 = floor(_1346);
    float _1376 = _1362 * _1242;
    float _1378 = _1354 * _1350;
    float _1380 = 1.0 / _1334;
    float _1382 = _1206 + _1214;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1388 = _1382 + (-1.0);
    bool _1390 = _1374 >= 0.0;
    bool _1392 = isnan(_1374);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan(0.0);
    bool _1398 = _1394 || _1396;
    float _1400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1404 = _1190 + _1402;
    float _1406 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1408 = _1220 * 2.0;
    int _1410 = _1398 ? 0 : 1;
    float _1412 = _1404 * _1262;
    bool _1414 = _1374 > 0.0;
    float _1416 = 1.0 / _1330;
    float _1418 = _1372 * _1380;
    float _1420 = _1380;
    float _1422 = _1408;
    if (!_1202)
    {
        _1420 = _1206;
    }
    float _1424 = _1420;
    float _1426 = _1424;
    if (_1202)
    {
        _1426 = _1220;
    }
    float _1428 = _1426;
    float _1430 = floor(_1408);
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1434 = _1190 + _1432;
    float _1436 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1438 = _1434 * _1282;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1442 = _1190 + _1440;
    float _1444 = fma(_1436, _1288, -0.5);
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1448 = _1220 + _1214;
    float _1450 = _1442 * _1292;
    float _1452 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1454 = _1206 * 2.0;
    float _1456 = _1368 * _1416;
    float _1458 = _1416;
    if (!_1202)
    {
        _1458 = _1214;
    }
    float _1460 = _1458;
    float _1462 = fma(_1452, _1296, -0.5);
    float _1464 = _1220 + _1206;
    float _1466 = _1460;
    if (!_1202)
    {
        _1422 = _1214;
    }
    float _1468 = _1422;
    float _1470 = floor(_1454);
    float _1472 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1446);
    float _1474 = _1464 + (-1.0);
    int _1476 = ~_1410;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    float _1482 = _1448 + (-1.0);
    int _1484 = _1480;
    float _1486 = _1468;
    if (!_1414)
    {
        int _1488 = ~_1410;
        int _1490 = _1488 + 1;
        _1484 = _1490;
    }
    int _1492 = _1484;
    float _1494 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1472);
    if (_1202)
    {
        _1466 = _1206;
    }
    float _1496 = _1466;
    float _1498 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_1202)
    {
        _1486 = _1206;
    }
    float _1500 = _1486;
    float _1502 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1504 = log2(_1502);
    bool _1506 = _1430 > 0.0;
    float _1508 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1510 = _1430 >= 0.0;
    bool _1512 = isnan(_1430);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan(0.0);
    bool _1518 = _1514 || _1516;
    float _1520 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1348);
    float _1522 = fma(_1508, -2.0, _1384);
    float _1524 = -_1520;
    float _1526 = fma(_1494, _1462, _1524);
    bool _1528 = !_1304;
    int _1530 = _1528 ? 0 : 1;
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1532;
    int _1536 = _1518 ? 0 : 1;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1540 = _1538 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _1542 = _1470 > 0.0;
    float _1544 = fma(_1534, _1376, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _1546 = _1470 >= 0.0;
    bool _1548 = isnan(_1470);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1556;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1562 = _1560 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1564 = float(_1492);
    float _1566 = fma(_1558, _1376, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1568 = fma(_1540, _1412, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1570 = fma(_1562, _1412, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1572 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1580 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1578;
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1584 = _1582 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1588 = _1586 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1590 = fma(_1576, _1438, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1592;
    float _1596 = fma(_1580, _1438, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1598;
    float _1602 = fma(_1584, _1450, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1604 = fma(_1588, _1450, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1606 = fma(_1594, _1456, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1608 = fma(_1600, _1456, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1612 = _1610 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1616 = _1614 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1618 = fma(_1612, _1418, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1620 = fma(_1616, _1418, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1626;
    float _1630 = _1504 * _102;
    float _1632 = fma(_1624, _1378, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    int _1634 = _1554 ? 0 : 1;
    float _1636 = fma(_1628, _1378, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1642 = ~_1634;
    int _1644 = _1642 + 1;
    int _1646 = _1644 + 1;
    float _1648 = _1206 + (-0.5);
    float _1650 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1638);
    float _1652 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1640);
    int _1654 = abs(_1530);
    float _1656 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1658 = !_1308;
    int _1660 = _1658 ? 0 : 1;
    float _1662 = -_1386;
    float _1664 = fma(_1656, 2.0, _1662);
    int _1666 = abs(_1660);
    float _1668 = exp2(_1630);
    int _1670 = ~_1536;
    int _1672 = _1670 + 1;
    int _1674 = _1672 + 1;
    float _1676 = float(_1654);
    int _1678 = _1674;
    int _1680 = _1646;
    if (!_1506)
    {
        int _1682 = ~_1536;
        int _1684 = _1682 + 1;
        _1678 = _1684;
    }
    int _1686 = _1678;
    float _1688 = _1676 * _1564;
    float _1690 = float(_1686);
    float _1692 = in.m_51.x;
    float _1694 = in.m_51.y;
    float _1696 = in.m_51.z;
    float _1698 = float(_1666);
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_1542)
    {
        int _1702 = ~_1634;
        int _1704 = _1702 + 1;
        _1680 = _1704;
    }
    int _1706 = _1680;
    float _1708 = _1688 * (-2.0);
    bool _1710 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1712 = isnan(1.0);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1718 = _1714 || _1716;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1722 = 1.0 + _1720;
    float _1724 = _1698 * _1690;
    bool _1726 = !_1312;
    int _1728 = _1726 ? 0 : 1;
    float _1730 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1700);
    float _1732 = 1.0 / _1722;
    float _1734 = -_1668;
    float _1736 = _1734 + 1.0;
    int _1738 = abs(_1728);
    float _1740 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1730);
    bool _1742 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1744 = isnan(0.0);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1750 = _1746 || _1748;
    float _1752 = fma(_1572, _1708, _1572);
    float _1754 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1652);
    float _1756 = _1750 ? _1736 : 0.0;
    float _1758 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1650);
    float _1760 = float(_1738);
    float _1762 = _1724 * (-2.0);
    float _1764 = float(_1706);
    float _1766 = -_102;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1664);
    float _1770 = fma(_1708, _1692, _1692);
    float _1772 = _1220 + (-0.5);
    float _1774 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1522);
    float _1776 = _1732;
    if (_1718)
    {
        float _1778 = _1756 * _1732;
        _126 = _1778;
    }
    float _1780 = _126;
    float _1782 = _1760 * _1764;
    float _1784 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1770);
    bool _1786 = _1220 > 0.5;
    bool _1788 = _1786 && _1260;
    float _1790 = fma(_1406, _1762, _1406);
    float _1792 = fma(_1762, _1694, _1694);
    float _1794 = _1782 * (-2.0);
    float _1796 = fma(_1752, _1780, _1784);
    float _1798 = in.m_35.z;
    float _1800 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1792);
    float _1802 = fma(_1498, _1794, _1498);
    float _1804 = _1796 * 0.15915493667125701904296875;
    float _1806 = fma(_1794, _1696, _1696);
    bool _1808 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1810 = isnan(_1190);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1816 = _1812 || _1814;
    float _1818 = float(_1816);
    float _1820 = _1214 + (-0.5);
    float _1822 = fma(_1790, _1780, _1800);
    bool _1824 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1826 = isnan(_1190);
    bool _1828 = _1824 || _1826;
    bool _1830 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1832 = _1828 || _1830;
    float _1834 = float(_1832);
    float _1836 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1838 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1806);
    float _1840 = -_1818;
    float _1842 = _1840 + 1.0;
    bool _1844 = _1214 > 0.5;
    bool _1846 = _1844 && _1266;
    float _1848 = _1822 * 0.15915493667125701904296875;
    float _1850 = fma(_1802, _1780, _1838);
    bool _1852 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1854 = isnan(_1190);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1860 = _1856 || _1858;
    float _1862 = float(_1860);
    float _1864 = _1834 * _1842;
    bool _1866 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1868 = isnan(_1190);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1874 = _1870 || _1872;
    float _1876 = float(_1874);
    float _1878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1880 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1882 = isnan(_1190);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    float _1892 = -_1862;
    float _1894 = _1892 + 1.0;
    bool _1896 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1898 = isnan(_1190);
    bool _1900 = _1896 || _1898;
    bool _1902 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1904 = _1900 || _1902;
    float _1906 = float(_1904);
    float _1908 = -_1876;
    float _1910 = _1908 + 1.0;
    bool _1912 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1914 = isnan(_1190);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1920 = _1916 || _1918;
    float _1922 = float(_1920);
    float _1924 = -_1834;
    float _1926 = _1924 + 1.0;
    bool _1928 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1930 = isnan(_1190);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1936 = _1932 || _1934;
    float _1938 = float(_1936);
    float _1940 = _1876 * _1894;
    float _1942 = _1894;
    float _1944 = _1926;
    if (!_1266)
    {
        _1942 = _136;
    }
    float _1946 = _1942;
    float _1948 = _1890 * _1910;
    float _1950 = _1946;
    if (_1846)
    {
        float _1952 = -_136;
        float _1954 = _1952 + 1.0;
        _186 = _1954;
    }
    float _1956 = _186;
    float _1958 = -_1890;
    float _1960 = _1958 + 1.0;
    float _1962 = -_1906;
    float _1964 = _1962 + 1.0;
    float _1966 = -_1922;
    float _1968 = _1966 + 1.0;
    float _1970 = _1850 * 0.15915493667125701904296875;
    float _1972 = _1862 * _1926;
    float _1974 = _1938 * _1960;
    float _1976 = _1922 * _1964;
    float _1978 = _1818 * _1968;
    if (_1260)
    {
        _1776 = _1798;
    }
    float _1980 = _1776;
    float _1982 = _1804 * 6.283185482025146484375;
    float _1984 = sin(_1982);
    float _1986 = _1980;
    if (!_1260)
    {
        _1944 = _1798;
    }
    float _1988 = _1944;
    float _1990 = _1544 * _1974;
    float _1992 = _1988;
    if (_1266)
    {
        _1950 = _1956;
    }
    float _1994 = _1950;
    float _1996 = -_1938;
    float _1998 = _1996 + 1.0;
    float _2000 = _1566 * _1974;
    float _2002 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2004 = _1878 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2006 = _1804 * 6.283185482025146484375;
    float _2008 = cos(_2006);
    float _2010 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1990);
    float _2012 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[167].y, _2000);
    if (_1788)
    {
        float _2014 = -_1980;
        float _2016 = _2014 + 1.0;
        _1986 = _2016;
    }
    float _2018 = _1986;
    float _2020 = fma(_2004, _1994, -0.5);
    float _2022 = fma(_1568, _1948, _2010);
    float _2024 = fma(_1570, _1948, _2012);
    float _2026 = -_1774;
    float _2028 = fma(_1754, _1444, _2026);
    float _2030 = _1848 * 6.283185482025146484375;
    float _2032 = sin(_2030);
    if (_1260)
    {
        _1992 = _2018;
    }
    float _2034 = _1992;
    float _2036 = fma(_1758, _2020, _1768);
    float _2038 = fma(_1590, _1940, _2022);
    float _2040 = fma(_1596, _1940, _2024);
    float _2042 = fma(_2002, _2034, -0.5);
    float _2044 = fma(_1602, _1972, _2038);
    float _2046 = _1848 * 6.283185482025146484375;
    float _2048 = cos(_2046);
    float _2050 = fma(_1604, _1972, _2040);
    float _2052 = fma(_1740, _2042, _1316);
    float _2054 = fma(_1606, _1864, _2044);
    float _2056 = _1526 + 0.5;
    float _2058 = fma(_1608, _1864, _2050);
    float _2060 = _2052 + 0.5;
    float _2062 = fma(_1618, _1978, _2054);
    float _2064 = _1970 * 6.283185482025146484375;
    float _2066 = cos(_2064);
    float _2068 = _1984 * _2032;
    float _2070 = _2008 * _2032;
    float _2072 = fma(_1620, _1978, _2058);
    float _2074 = fma(_1632, _1976, _2062);
    float _2076 = _2036 + 0.5;
    float _2078 = fma(_1636, _1976, _2072);
    float _2080 = _1970 * 6.283185482025146484375;
    float _2082 = sin(_2080);
    float _2084 = _2008 * _2048;
    float _2086 = _1984 * _2048;
    float _2088 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2074);
    float _2090 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2078);
    float _2092 = _2066 * _1358;
    out.m_53.x = _2088;
    out.m_53.y = _2090;
    float _2094 = _2008 * _2092;
    float _2096 = _2032 * _2066;
    float _2098 = _2048 * _2066;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2100 = fma(_2082, _2084, _2068);
    float _2102 = fma(_2082, _2068, _2084);
    float _2104 = fma(_2100, _1356, _2094);
    float _2106 = _2082 * _1358;
    float _2108 = -_2086;
    float _2110 = fma(_2082, _2070, _2108);
    float _2112 = -_2070;
    float _2114 = fma(_2082, _2086, _2112);
    float _2116 = _1984 * _2092;
    float _2118 = -_2106;
    float _2120 = fma(_2098, _1356, _2118);
    float _2122 = fma(_2110, _1344, _2104);
    float _2124 = fma(_2114, _1356, _2116);
    float _2126 = fma(_2096, _1344, _2120);
    float _2128 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2130 = _2028 + 0.5;
    float _2132 = fma(_2102, _1344, _2124);
    float _2134 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2136 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2128);
    float _2138 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_55.x = _2060;
    out.m_55.y = _2056;
    out.m_55.z = _2076;
    out.m_55.w = _2130;
    float _2140 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2134);
    float _2142 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2136);
    float _2144 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2138);
    float _2146 = _1342 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2148 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2140);
    float _2150 = _2142 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2152 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2144);
    float _2154 = _1340 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2156 = _2148 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2158 = _2146 + _2150;
    float _2160 = _1364 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2162 = _2152 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2164 = _2154 + _2156;
    float _2166 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2168 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2170 = _2160 + _2162;
    float _2172 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2174 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2166);
    float _2176 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2168);
    float _2178 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2180 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2172);
    float _2182 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2174);
    float _2184 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2176);
    float _2186 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2178);
    float _2188 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2180);
    float _2190 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2192 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2194 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2186);
    float _2196 = _2188 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2198 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2200 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2202 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2204 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2206 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2198);
    float _2208 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2200);
    float _2210 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2202);
    float _2212 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2204);
    float _2214 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2206);
    float _2216 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2218 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2208);
    float _2220 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2210);
    float _2222 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2212);
    float _2224 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2214);
    float _2226 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2218);
    float _2228 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2220);
    float _2230 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2222);
    out.m_57.x = _2164;
    out.m_57.y = _2158;
    out.m_57.z = _2170;
    out.gl_Position.x = _2226;
    out.gl_Position.y = _2224;
    out.gl_Position.z = _2228;
    out.gl_Position.w = _2230;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _880 = false;
    bool _652 = false;
    bool _566 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_26.w;
    float _73 = trunc(_71);
    int _76 = int(_73);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    if (!_80)
    {
        out.m_29.x = 0.0;
    }
    int _86 = 0;
    if (!_80)
    {
        float _88 = _84 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    float _92 = as_type<float>(_90);
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2287 = as_type<float>(_90);
        out.gl_Position.z = _2287;
    }
    if (!_80)
    {
        return out;
    }
    float _94 = in.m_31.w;
    float _96 = float(_76);
    float _98 = 1.0 / _96;
    float _100 = -_94;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_94);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = _102 * _98;
    bool _116 = _102 >= _96;
    bool _118 = !_112;
    bool _120 = _116 || _118;
    out.m_33.x = _114;
    float _122 = _94;
    float _124 = _114;
    float _126 = _102;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (_120)
    {
        out.m_29.x = 0.0;
    }
    int _130 = 0;
    if (_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2360 = as_type<float>(_134);
        out.gl_Position.z = _2360;
    }
    if (_120)
    {
        return out;
    }
    float _136 = in.m_35.x;
    float _138 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _140 = in.m_35.y;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = in.m_37.w;
    float _154 = in.m_31.x;
    float _156 = in.m_31.y;
    float _158 = in.m_31.z;
    float _160 = in.m_26.x;
    float _162 = in.m_26.y;
    float _164 = in.m_26.z;
    float _166 = _138;
    if (!_150)
    {
        float _168 = _138 * _138;
        float _170 = _168 * 0.5;
        _92 = _170;
    }
    float _172 = _92;
    float _174 = _172;
    if (!_150)
    {
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _176;
    }
    float _178 = _174;
    out.m_39.x = _136;
    out.m_39.y = _140;
    bool _180 = !_150;
    float _182 = _178;
    float _184 = _140;
    float _186 = _136;
    if (!_180)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _138 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _138);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _216;
    }
    float _218 = _182;
    bool _220 = !_150;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _138 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _166 = _240;
    }
    float _242 = _166;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _154, _246);
    float _254 = fma(_242, _156, _248);
    float _256 = fma(_242, _158, _250);
    float _258 = fma(_252, _152, _160);
    float _260 = fma(_254, _152, _162);
    float _262 = fma(_256, _152, _164);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_41.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        _282 = _114;
    }
    _284 = false;
    float _286 = _282;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = _286 + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _294 = _286 + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = _286 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _316 = 1.0 / _302;
    bool _318 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_286);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    bool _330 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _332 = isnan(_286);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = 1.0 / _306;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _346 = 1.0 / _310;
    float _348 = _290 * _316;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _352 = _286 + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _354;
    float _358 = fma(_356, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _360 = 1.0 / _314;
    float _362 = _294 * _342;
    bool _364 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _366 = isnan(_286);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = -_374;
    float _378 = _376 + 1.0;
    float _380 = _298 * _346;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = fma(_384, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _388 = _352 * _360;
    bool _390 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _392 = isnan(_286);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    bool _402 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _404 = isnan(_286);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _418 = -_400;
    float _420 = _418 + 1.0;
    float _422 = _400 * _378;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _424;
    float _428 = -_340;
    float _430 = _428 + 1.0;
    float _432 = _412 * _420;
    float _434 = -_412;
    float _436 = _434 + 1.0;
    float _438 = fma(_426, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _440 = -_328;
    float _442 = _440 + 1.0;
    float _444 = fma(_416, _362, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _446 = _328 * _436;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _456 = _340 * _442;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_450, _362, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _464 = fma(_454, _362, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _466 = _438 * _456;
    float _468 = _358 * _456;
    float _470 = _386 * _456;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _472;
    float _476 = in.m_37.x;
    float _478 = in.m_37.y;
    float _480 = in.m_37.z;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _482;
    float _486 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _468);
    float _488 = fma(_474, _380, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _490 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _466);
    float _492 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].z, _470);
    float _494 = fma(_484, _380, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = fma(_460, _380, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _498 = fma(_444, _446, _490);
    float _500 = fma(_462, _446, _486);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _514 = fma(_464, _446, _492);
    float _516 = fma(_504, _388, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _518 = fma(_508, _388, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _520 = fma(_512, _388, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _522 = fma(_496, _432, _514);
    float _524 = fma(_488, _432, _500);
    float _526 = fma(_494, _432, _498);
    float _528 = fma(_520, _422, _522);
    float _530 = fma(_518, _422, _524);
    float _532 = fma(_516, _422, _526);
    float _534 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[147].z, _528);
    float _536 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[147].y, _530);
    float _538 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[147].x, _532);
    float _540 = _534 * _480;
    float _542 = _536 * _478;
    float _544 = _538 * _476;
    bool _546 = !_344;
    float _564;
    if (!_546)
    {
        float _548 = in.m_41.x;
        float _550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _552 = _548 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _554 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _556 = _554 * _550;
        float _558 = floor(_556);
        float _560 = -_558;
        float _562 = _556 + _560;
        _564 = _562;
        _566 = true;
    }
    else
    {
        _564 = _114;
    }
    _566 = false;
    float _568 = _564;
    bool _570 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _572 = isnan(_568);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _586 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _588 = isnan(_568);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _568 + _602;
    float _606 = -_580;
    float _608 = _606 + 1.0;
    bool _610 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _612 = 1.0 / _584;
    float _614 = _596 * _608;
    float _616 = -_596;
    float _618 = _616 + 1.0;
    float _620 = _600 * _612;
    float _622 = fma(_620, _604, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _624 = _622 * _614;
    float _626 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[115].x, _624);
    float _628 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[116].x, _626);
    float _630 = _628 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.w = _630;
    bool _632 = !_610;
    float _650;
    if (!_632)
    {
        float _634 = in.m_41.x;
        float _636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _638 = _634 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _642 = _640 * _636;
        float _644 = floor(_642);
        float _646 = -_644;
        float _648 = _642 + _646;
        _650 = _648;
        _652 = true;
    }
    else
    {
        _650 = _114;
    }
    _652 = false;
    float _654 = _650;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _658 = _654 + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _662 = _654 + _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _666 = _654 + _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _680 = 1.0 / _670;
    bool _682 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _684 = isnan(_654);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = 1.0 / _674;
    bool _696 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _698 = 1.0 / _678;
    bool _700 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _702 = isnan(_654);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = _658 * _680;
    bool _714 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _716 = isnan(_654);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = -_710;
    float _728 = _726 + 1.0;
    float _730 = _662 * _694;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _732;
    float _736 = -_724;
    float _738 = _736 + 1.0;
    float _740 = _724 * _728;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _746 = fma(_734, _730, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _752 = _666 * _698;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _758;
    float _762 = _692 * _738;
    float _764 = -_692;
    float _766 = _764 + 1.0;
    float _768 = fma(_756, _730, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _770 = fma(_760, _730, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _772 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _774 = isnan(_654);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _780 = _776 || _778;
    float _782 = float(_780);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _788 = fma(_744, _752, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _790 = fma(_750, _752, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _792 = _782 * _766;
    float _794 = fma(_786, _752, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _796 = -_782;
    float _798 = _796 + 1.0;
    float _800 = _746 * _792;
    float _802 = _768 * _792;
    float _804 = _770 * _792;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _806;
    float _810 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].x, _800);
    float _812 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].y, _802);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _814;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _818;
    float _822 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].z, _804);
    float _824 = fma(_808, _712, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _826 = fma(_794, _762, _810);
    float _828 = fma(_816, _712, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _830 = fma(_820, _712, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _832 = fma(_788, _762, _812);
    float _834 = fma(_790, _762, _822);
    float _836 = fma(_824, _740, _826);
    float _838 = fma(_828, _740, _832);
    float _840 = fma(_830, _740, _834);
    float _842 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[126].x, _836);
    float _844 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[126].y, _838);
    float _846 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[126].z, _840);
    float _848 = _842 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _850 = _844 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _852 = _846 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _854 = _848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _856 = _850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = _852 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _854;
    out.m_45.y = _856;
    out.m_45.z = _858;
    bool _860 = !_696;
    float _878;
    if (!_860)
    {
        float _862 = in.m_41.x;
        float _864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _866 = _862 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _870 = _868 * _864;
        float _872 = floor(_870);
        float _874 = -_872;
        float _876 = _870 + _874;
        _878 = _876;
        _880 = true;
    }
    else
    {
        _878 = _114;
    }
    _880 = false;
    float _882 = _878;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _886 = _882 + _884;
    bool _888 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _890 = isnan(_882);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _904 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _906 = isnan(_882);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _916;
    bool _920 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _922 = isnan(_882);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = 1.0 / _902;
    bool _934 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _936 = isnan(_882);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    bool _946 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _948 = isnan(_882);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _962 = 1.0 / _960;
    bool _964 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _966 = _918 * _932;
    float _968 = -_898;
    float _970 = _968 + 1.0;
    float _972 = -_930;
    float _974 = _972 + 1.0;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _980 = fma(_966, _886, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _982 = _914 * _970;
    float _984 = -_914;
    float _986 = _984 + 1.0;
    float _988 = _898 * _974;
    float _990 = 1.0 / _978;
    float _992 = _944 * _986;
    float _994 = -_944;
    float _996 = _994 + 1.0;
    bool _998 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1000 = isnan(_882);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1014 = _956 * _996;
    float _1016 = -_956;
    float _1018 = _1016 + 1.0;
    bool _1020 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1022 = isnan(_882);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1028 = _1024 || _1026;
    float _1030 = float(_1028);
    float _1032 = 1.0 / _1012;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1034;
    float _1038 = _1008 * _1018;
    float _1040 = -_1008;
    float _1042 = _1040 + 1.0;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1048 = _1030 * _1042;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1054 = _1046 * _962;
    float _1056 = _980 * _1048;
    float _1058 = -_1030;
    float _1060 = _1058 + 1.0;
    float _1062 = 1.0 / _1052;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1066 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1070 = _882 + _1068;
    float _1072 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1056);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1076 = _1074 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1078 = _1036 * _1032;
    float _1080 = fma(_1054, _1070, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1084 = _882 + _1082;
    float _1086 = 1.0 / _1066;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1092 = fma(_1078, _1084, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1094 = fma(_1080, _1038, _1072);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1098 = _882 + _1096;
    float _1100 = _1090 * _990;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1102;
    float _1106 = 1.0 / _1076;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1112 = fma(_1092, _1014, _1094);
    float _1114 = _1104 * _1062;
    float _1116 = fma(_1100, _1098, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1120 = _882 + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1122;
    bool _1126 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1128 = isnan(_882);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = _1110 * _1086;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1142 = _882 + _1140;
    float _1144 = fma(_1114, _1120, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1146 = fma(_1116, _992, _1112);
    float _1148 = -_1136;
    float _1150 = _1148 + 1.0;
    float _1152 = fma(_1138, _1142, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1156 = _882 + _1154;
    float _1158 = _1124 * _1106;
    float _1160 = fma(_1144, _982, _1146);
    float _1162 = _930 * _1150;
    float _1164 = fma(_1158, _1156, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1166 = fma(_1152, _988, _1160);
    float _1168 = fma(_1164, _1162, _1166);
    float _1170 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1168);
    out.m_47.x = _1170;
    bool _1172 = !_964;
    if (!_1172)
    {
        float _1174 = in.m_41.x;
        float _1176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1178 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[14].y, _102);
        float _1182 = _1180 * _1176;
        float _1184 = floor(_1182);
        float _1186 = -_1184;
        float _1188 = _1182 + _1186;
        _124 = _1188;
    }
    float _1190 = _124;
    float _1192 = in.m_41.w;
    float _1194 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1196 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1198 = in.m_35.w;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1202 = _1200 != 0;
    float _1204 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1206 = in.m_41.y;
    float _1208 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1194);
    float _1210 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1196);
    float _1212 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1204);
    float _1214 = in.m_41.z;
    float _1216 = -_140;
    float _1218 = _1216 + 1.0;
    float _1220 = in.m_41.x;
    float _1222 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1224;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1230 = _1228 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1240 = _1192 > 0.5;
    float _1242 = 1.0 / _1226;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1246 = -_1198;
    float _1248 = _1246 + 1.0;
    float _1250 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1254 = _1252 != 0;
    float _1256 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1260 = _1258 != 0;
    float _1262 = 1.0 / _1230;
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1266 = _1264 != 0;
    float _1268 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1272 = _1270 != 0;
    float _1274 = in.m_49.x;
    float _1276 = in.m_49.y;
    float _1278 = in.m_49.z;
    bool _1280 = _1206 > 0.5;
    float _1282 = 1.0 / _1234;
    float _1284 = _1198;
    if (_1254)
    {
        float _1286 = _1240 ? _1218 : _140;
        _184 = _1286;
    }
    float _1288 = _184;
    float _1290 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1292 = 1.0 / _1238;
    if (_1272)
    {
        float _1294 = _1280 ? _1248 : _1198;
        _1284 = _1294;
    }
    float _1296 = _1284;
    float _1298 = -_1244;
    float _1300 = fma(_1290, 2.0, _1298);
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1304 = _1302 != 0;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1308 = _1306 != 0;
    int _1310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1312 = _1310 != 0;
    float _1314 = -_102;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1300);
    float _1318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1322 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1278);
    float _1324 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1274);
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1276);
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1336;
    float _1340 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1208);
    float _1342 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1210);
    float _1344 = _1222 * _1322;
    float _1346 = _1214 * 2.0;
    float _1348 = fma(_1268, -2.0, _1320);
    float _1350 = 1.0 / _1338;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1354 = _1190 + _1352;
    float _1356 = _1250 * _1324;
    float _1358 = _1256 * _1326;
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1362 = _1190 + _1360;
    float _1364 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1212);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1368 = _1190 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1372 = _1190 + _1370;
    float _1374 = floor(_1346);
    float _1376 = _1362 * _1242;
    float _1378 = _1354 * _1350;
    float _1380 = 1.0 / _1334;
    float _1382 = _1206 + _1214;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1388 = _1382 + (-1.0);
    bool _1390 = _1374 >= 0.0;
    bool _1392 = isnan(_1374);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan(0.0);
    bool _1398 = _1394 || _1396;
    float _1400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1404 = _1190 + _1402;
    float _1406 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1408 = _1220 * 2.0;
    int _1410 = _1398 ? 0 : 1;
    float _1412 = _1404 * _1262;
    bool _1414 = _1374 > 0.0;
    float _1416 = 1.0 / _1330;
    float _1418 = _1372 * _1380;
    float _1420 = _1380;
    float _1422 = _1408;
    if (!_1202)
    {
        _1420 = _1206;
    }
    float _1424 = _1420;
    float _1426 = _1424;
    if (_1202)
    {
        _1426 = _1220;
    }
    float _1428 = _1426;
    float _1430 = floor(_1408);
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1434 = _1190 + _1432;
    float _1436 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1438 = _1434 * _1282;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1442 = _1190 + _1440;
    float _1444 = fma(_1436, _1288, -0.5);
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1448 = _1220 + _1214;
    float _1450 = _1442 * _1292;
    float _1452 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1454 = _1206 * 2.0;
    float _1456 = _1368 * _1416;
    float _1458 = _1416;
    if (!_1202)
    {
        _1458 = _1214;
    }
    float _1460 = _1458;
    float _1462 = fma(_1452, _1296, -0.5);
    float _1464 = _1220 + _1206;
    float _1466 = _1460;
    if (!_1202)
    {
        _1422 = _1214;
    }
    float _1468 = _1422;
    float _1470 = floor(_1454);
    float _1472 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1446);
    float _1474 = _1464 + (-1.0);
    int _1476 = ~_1410;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    float _1482 = _1448 + (-1.0);
    int _1484 = _1480;
    float _1486 = _1468;
    if (!_1414)
    {
        int _1488 = ~_1410;
        int _1490 = _1488 + 1;
        _1484 = _1490;
    }
    int _1492 = _1484;
    float _1494 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1472);
    if (_1202)
    {
        _1466 = _1206;
    }
    float _1496 = _1466;
    float _1498 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_1202)
    {
        _1486 = _1206;
    }
    float _1500 = _1486;
    float _1502 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1504 = log2(_1502);
    bool _1506 = _1430 > 0.0;
    float _1508 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1510 = _1430 >= 0.0;
    bool _1512 = isnan(_1430);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan(0.0);
    bool _1518 = _1514 || _1516;
    float _1520 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1348);
    float _1522 = fma(_1508, -2.0, _1384);
    float _1524 = -_1520;
    float _1526 = fma(_1494, _1462, _1524);
    bool _1528 = !_1304;
    int _1530 = _1528 ? 0 : 1;
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1532;
    int _1536 = _1518 ? 0 : 1;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1540 = _1538 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _1542 = _1470 > 0.0;
    float _1544 = fma(_1534, _1376, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _1546 = _1470 >= 0.0;
    bool _1548 = isnan(_1470);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1556;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1562 = _1560 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1564 = float(_1492);
    float _1566 = fma(_1558, _1376, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1568 = fma(_1540, _1412, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1570 = fma(_1562, _1412, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1572 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1580 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1578;
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1584 = _1582 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1588 = _1586 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1590 = fma(_1576, _1438, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1592;
    float _1596 = fma(_1580, _1438, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1598;
    float _1602 = fma(_1584, _1450, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1604 = fma(_1588, _1450, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1606 = fma(_1594, _1456, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1608 = fma(_1600, _1456, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1612 = _1610 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1616 = _1614 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1618 = fma(_1612, _1418, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1620 = fma(_1616, _1418, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1626;
    float _1630 = _1504 * _102;
    float _1632 = fma(_1624, _1378, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    int _1634 = _1554 ? 0 : 1;
    float _1636 = fma(_1628, _1378, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1642 = ~_1634;
    int _1644 = _1642 + 1;
    int _1646 = _1644 + 1;
    float _1648 = _1206 + (-0.5);
    float _1650 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1638);
    float _1652 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1640);
    int _1654 = abs(_1530);
    float _1656 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1658 = !_1308;
    int _1660 = _1658 ? 0 : 1;
    float _1662 = -_1386;
    float _1664 = fma(_1656, 2.0, _1662);
    int _1666 = abs(_1660);
    float _1668 = exp2(_1630);
    int _1670 = ~_1536;
    int _1672 = _1670 + 1;
    int _1674 = _1672 + 1;
    float _1676 = float(_1654);
    int _1678 = _1674;
    int _1680 = _1646;
    if (!_1506)
    {
        int _1682 = ~_1536;
        int _1684 = _1682 + 1;
        _1678 = _1684;
    }
    int _1686 = _1678;
    float _1688 = _1676 * _1564;
    float _1690 = float(_1686);
    float _1692 = in.m_51.x;
    float _1694 = in.m_51.y;
    float _1696 = in.m_51.z;
    float _1698 = float(_1666);
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_1542)
    {
        int _1702 = ~_1634;
        int _1704 = _1702 + 1;
        _1680 = _1704;
    }
    int _1706 = _1680;
    float _1708 = _1688 * (-2.0);
    bool _1710 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1712 = isnan(1.0);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1718 = _1714 || _1716;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1722 = 1.0 + _1720;
    float _1724 = _1698 * _1690;
    bool _1726 = !_1312;
    int _1728 = _1726 ? 0 : 1;
    float _1730 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1700);
    float _1732 = 1.0 / _1722;
    float _1734 = -_1668;
    float _1736 = _1734 + 1.0;
    int _1738 = abs(_1728);
    float _1740 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1730);
    bool _1742 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1744 = isnan(0.0);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1750 = _1746 || _1748;
    float _1752 = fma(_1572, _1708, _1572);
    float _1754 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1652);
    float _1756 = _1750 ? _1736 : 0.0;
    float _1758 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1650);
    float _1760 = float(_1738);
    float _1762 = _1724 * (-2.0);
    float _1764 = float(_1706);
    float _1766 = -_102;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1664);
    float _1770 = fma(_1708, _1692, _1692);
    float _1772 = _1220 + (-0.5);
    float _1774 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1522);
    float _1776 = _1732;
    if (_1718)
    {
        float _1778 = _1756 * _1732;
        _126 = _1778;
    }
    float _1780 = _126;
    float _1782 = _1760 * _1764;
    float _1784 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1770);
    bool _1786 = _1220 > 0.5;
    bool _1788 = _1786 && _1260;
    float _1790 = fma(_1406, _1762, _1406);
    float _1792 = fma(_1762, _1694, _1694);
    float _1794 = _1782 * (-2.0);
    float _1796 = fma(_1752, _1780, _1784);
    float _1798 = in.m_35.z;
    float _1800 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1792);
    float _1802 = fma(_1498, _1794, _1498);
    float _1804 = _1796 * 0.15915493667125701904296875;
    float _1806 = fma(_1794, _1696, _1696);
    bool _1808 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1810 = isnan(_1190);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1816 = _1812 || _1814;
    float _1818 = float(_1816);
    float _1820 = _1214 + (-0.5);
    float _1822 = fma(_1790, _1780, _1800);
    bool _1824 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1826 = isnan(_1190);
    bool _1828 = _1824 || _1826;
    bool _1830 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1832 = _1828 || _1830;
    float _1834 = float(_1832);
    float _1836 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1838 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1806);
    float _1840 = -_1818;
    float _1842 = _1840 + 1.0;
    bool _1844 = _1214 > 0.5;
    bool _1846 = _1844 && _1266;
    float _1848 = _1822 * 0.15915493667125701904296875;
    float _1850 = fma(_1802, _1780, _1838);
    bool _1852 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1854 = isnan(_1190);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1860 = _1856 || _1858;
    float _1862 = float(_1860);
    float _1864 = _1834 * _1842;
    bool _1866 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1868 = isnan(_1190);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1874 = _1870 || _1872;
    float _1876 = float(_1874);
    float _1878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1880 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1882 = isnan(_1190);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    float _1892 = -_1862;
    float _1894 = _1892 + 1.0;
    bool _1896 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1898 = isnan(_1190);
    bool _1900 = _1896 || _1898;
    bool _1902 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1904 = _1900 || _1902;
    float _1906 = float(_1904);
    float _1908 = -_1876;
    float _1910 = _1908 + 1.0;
    bool _1912 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1914 = isnan(_1190);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1920 = _1916 || _1918;
    float _1922 = float(_1920);
    float _1924 = -_1834;
    float _1926 = _1924 + 1.0;
    bool _1928 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1930 = isnan(_1190);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1936 = _1932 || _1934;
    float _1938 = float(_1936);
    float _1940 = _1876 * _1894;
    float _1942 = _1894;
    float _1944 = _1926;
    if (!_1266)
    {
        _1942 = _136;
    }
    float _1946 = _1942;
    float _1948 = _1890 * _1910;
    float _1950 = _1946;
    if (_1846)
    {
        float _1952 = -_136;
        float _1954 = _1952 + 1.0;
        _186 = _1954;
    }
    float _1956 = _186;
    float _1958 = -_1890;
    float _1960 = _1958 + 1.0;
    float _1962 = -_1906;
    float _1964 = _1962 + 1.0;
    float _1966 = -_1922;
    float _1968 = _1966 + 1.0;
    float _1970 = _1850 * 0.15915493667125701904296875;
    float _1972 = _1862 * _1926;
    float _1974 = _1938 * _1960;
    float _1976 = _1922 * _1964;
    float _1978 = _1818 * _1968;
    if (_1260)
    {
        _1776 = _1798;
    }
    float _1980 = _1776;
    float _1982 = _1804 * 6.283185482025146484375;
    float _1984 = sin(_1982);
    float _1986 = _1980;
    if (!_1260)
    {
        _1944 = _1798;
    }
    float _1988 = _1944;
    float _1990 = _1544 * _1974;
    float _1992 = _1988;
    if (_1266)
    {
        _1950 = _1956;
    }
    float _1994 = _1950;
    float _1996 = -_1938;
    float _1998 = _1996 + 1.0;
    float _2000 = _1566 * _1974;
    float _2002 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2004 = _1878 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2006 = _1804 * 6.283185482025146484375;
    float _2008 = cos(_2006);
    float _2010 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1990);
    float _2012 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[167].y, _2000);
    if (_1788)
    {
        float _2014 = -_1980;
        float _2016 = _2014 + 1.0;
        _1986 = _2016;
    }
    float _2018 = _1986;
    float _2020 = fma(_2004, _1994, -0.5);
    float _2022 = fma(_1568, _1948, _2010);
    float _2024 = fma(_1570, _1948, _2012);
    float _2026 = -_1774;
    float _2028 = fma(_1754, _1444, _2026);
    float _2030 = _1848 * 6.283185482025146484375;
    float _2032 = sin(_2030);
    if (_1260)
    {
        _1992 = _2018;
    }
    float _2034 = _1992;
    float _2036 = fma(_1758, _2020, _1768);
    float _2038 = fma(_1590, _1940, _2022);
    float _2040 = fma(_1596, _1940, _2024);
    float _2042 = fma(_2002, _2034, -0.5);
    float _2044 = fma(_1602, _1972, _2038);
    float _2046 = _1848 * 6.283185482025146484375;
    float _2048 = cos(_2046);
    float _2050 = fma(_1604, _1972, _2040);
    float _2052 = fma(_1740, _2042, _1316);
    float _2054 = fma(_1606, _1864, _2044);
    float _2056 = _1526 + 0.5;
    float _2058 = fma(_1608, _1864, _2050);
    float _2060 = _2052 + 0.5;
    float _2062 = fma(_1618, _1978, _2054);
    float _2064 = _1970 * 6.283185482025146484375;
    float _2066 = cos(_2064);
    float _2068 = _1984 * _2032;
    float _2070 = _2008 * _2032;
    float _2072 = fma(_1620, _1978, _2058);
    float _2074 = fma(_1632, _1976, _2062);
    float _2076 = _2036 + 0.5;
    float _2078 = fma(_1636, _1976, _2072);
    float _2080 = _1970 * 6.283185482025146484375;
    float _2082 = sin(_2080);
    float _2084 = _2008 * _2048;
    float _2086 = _1984 * _2048;
    float _2088 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2074);
    float _2090 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2078);
    float _2092 = _2066 * _1358;
    out.m_53.x = _2088;
    out.m_53.y = _2090;
    float _2094 = _2008 * _2092;
    float _2096 = _2032 * _2066;
    float _2098 = _2048 * _2066;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2100 = fma(_2082, _2084, _2068);
    float _2102 = fma(_2082, _2068, _2084);
    float _2104 = fma(_2100, _1356, _2094);
    float _2106 = _2082 * _1358;
    float _2108 = -_2086;
    float _2110 = fma(_2082, _2070, _2108);
    float _2112 = -_2070;
    float _2114 = fma(_2082, _2086, _2112);
    float _2116 = _1984 * _2092;
    float _2118 = -_2106;
    float _2120 = fma(_2098, _1356, _2118);
    float _2122 = fma(_2110, _1344, _2104);
    float _2124 = fma(_2114, _1356, _2116);
    float _2126 = fma(_2096, _1344, _2120);
    float _2128 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2130 = _2028 + 0.5;
    float _2132 = fma(_2102, _1344, _2124);
    float _2134 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2136 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2128);
    float _2138 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_55.x = _2060;
    out.m_55.y = _2056;
    out.m_55.z = _2076;
    out.m_55.w = _2130;
    float _2140 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2134);
    float _2142 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2136);
    float _2144 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2138);
    float _2146 = _1342 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2148 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2140);
    float _2150 = _2142 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2152 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2144);
    float _2154 = _1340 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2156 = _2148 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2158 = _2146 + _2150;
    float _2160 = _1364 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2162 = _2152 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2164 = _2154 + _2156;
    float _2166 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2168 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2170 = _2160 + _2162;
    float _2172 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2174 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2166);
    float _2176 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2168);
    float _2178 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2180 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2172);
    float _2182 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2174);
    float _2184 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2176);
    float _2186 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2178);
    float _2188 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2180);
    float _2190 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2192 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2194 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2186);
    float _2196 = _2188 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2198 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2200 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2202 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2204 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2206 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2198);
    float _2208 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2200);
    float _2210 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2202);
    float _2212 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2204);
    float _2214 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2206);
    float _2216 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2218 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2208);
    float _2220 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2210);
    float _2222 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2212);
    float _2224 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2214);
    float _2226 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2218);
    float _2228 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2220);
    float _2230 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2222);
    out.m_57.x = _2164;
    out.m_57.y = _2158;
    out.m_57.z = _2170;
    out.gl_Position.x = _2226;
    out.gl_Position.y = _2224;
    out.gl_Position.z = _2228;
    out.gl_Position.w = _2230;
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _880 = false;
    bool _652 = false;
    bool _566 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_26.w;
    float _73 = trunc(_71);
    int _76 = int(_73);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    if (!_80)
    {
        out.m_29.x = 0.0;
    }
    int _86 = 0;
    if (!_80)
    {
        float _88 = _84 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    float _92 = as_type<float>(_90);
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2287 = as_type<float>(_90);
        out.gl_Position.z = _2287;
    }
    if (!_80)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _94 = in.m_31.w;
    float _96 = float(_76);
    float _98 = 1.0 / _96;
    float _100 = -_94;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = isnan(_94);
    bool _108 = _104 || _106;
    bool _110 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _112 = _108 || _110;
    float _114 = _102 * _98;
    bool _116 = _102 >= _96;
    bool _118 = !_112;
    bool _120 = _116 || _118;
    out.m_33.x = _114;
    float _122 = _94;
    float _124 = _114;
    float _126 = _102;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (_120)
    {
        out.m_29.x = 0.0;
    }
    int _130 = 0;
    if (_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2360 = as_type<float>(_134);
        out.gl_Position.z = _2360;
    }
    if (_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_35.x;
    float _138 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _140 = in.m_35.y;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = in.m_37.w;
    float _154 = in.m_31.x;
    float _156 = in.m_31.y;
    float _158 = in.m_31.z;
    float _160 = in.m_26.x;
    float _162 = in.m_26.y;
    float _164 = in.m_26.z;
    float _166 = _138;
    if (!_150)
    {
        float _168 = _138 * _138;
        float _170 = _168 * 0.5;
        _92 = _170;
    }
    float _172 = _92;
    float _174 = _172;
    if (!_150)
    {
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _176;
    }
    float _178 = _174;
    out.m_39.x = _136;
    out.m_39.y = _140;
    bool _180 = !_150;
    float _182 = _178;
    float _184 = _140;
    float _186 = _136;
    if (!_180)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _138 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _138);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _216;
    }
    float _218 = _182;
    bool _220 = !_150;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _138 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _166 = _240;
    }
    float _242 = _166;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _154, _246);
    float _254 = fma(_242, _156, _248);
    float _256 = fma(_242, _158, _250);
    float _258 = fma(_252, _152, _160);
    float _260 = fma(_254, _152, _162);
    float _262 = fma(_256, _152, _164);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_41.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        _282 = _114;
    }
    _284 = false;
    float _286 = _282;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = _286 + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _294 = _286 + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = _286 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _316 = 1.0 / _302;
    bool _318 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_286);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    bool _330 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _332 = isnan(_286);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = 1.0 / _306;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _346 = 1.0 / _310;
    float _348 = _290 * _316;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _352 = _286 + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _354;
    float _358 = fma(_356, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _360 = 1.0 / _314;
    float _362 = _294 * _342;
    bool _364 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _366 = isnan(_286);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = -_374;
    float _378 = _376 + 1.0;
    float _380 = _298 * _346;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = fma(_384, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _388 = _352 * _360;
    bool _390 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _392 = isnan(_286);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    bool _402 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _404 = isnan(_286);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _418 = -_400;
    float _420 = _418 + 1.0;
    float _422 = _400 * _378;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _424;
    float _428 = -_340;
    float _430 = _428 + 1.0;
    float _432 = _412 * _420;
    float _434 = -_412;
    float _436 = _434 + 1.0;
    float _438 = fma(_426, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _440 = -_328;
    float _442 = _440 + 1.0;
    float _444 = fma(_416, _362, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _446 = _328 * _436;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _456 = _340 * _442;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _458;
    float _462 = fma(_450, _362, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _464 = fma(_454, _362, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _466 = _438 * _456;
    float _468 = _358 * _456;
    float _470 = _386 * _456;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _472;
    float _476 = in.m_37.x;
    float _478 = in.m_37.y;
    float _480 = in.m_37.z;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _482;
    float _486 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _468);
    float _488 = fma(_474, _380, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _490 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _466);
    float _492 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].z, _470);
    float _494 = fma(_484, _380, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = fma(_460, _380, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _498 = fma(_444, _446, _490);
    float _500 = fma(_462, _446, _486);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _514 = fma(_464, _446, _492);
    float _516 = fma(_504, _388, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _518 = fma(_508, _388, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _520 = fma(_512, _388, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _522 = fma(_496, _432, _514);
    float _524 = fma(_488, _432, _500);
    float _526 = fma(_494, _432, _498);
    float _528 = fma(_520, _422, _522);
    float _530 = fma(_518, _422, _524);
    float _532 = fma(_516, _422, _526);
    float _534 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[147].z, _528);
    float _536 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[147].y, _530);
    float _538 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[147].x, _532);
    float _540 = _534 * _480;
    float _542 = _536 * _478;
    float _544 = _538 * _476;
    bool _546 = !_344;
    float _564;
    if (!_546)
    {
        float _548 = in.m_41.x;
        float _550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _552 = _548 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _554 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _556 = _554 * _550;
        float _558 = floor(_556);
        float _560 = -_558;
        float _562 = _556 + _560;
        _564 = _562;
        _566 = true;
    }
    else
    {
        _564 = _114;
    }
    _566 = false;
    float _568 = _564;
    bool _570 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _572 = isnan(_568);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _586 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _588 = isnan(_568);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _568 + _602;
    float _606 = -_580;
    float _608 = _606 + 1.0;
    bool _610 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _612 = 1.0 / _584;
    float _614 = _596 * _608;
    float _616 = -_596;
    float _618 = _616 + 1.0;
    float _620 = _600 * _612;
    float _622 = fma(_620, _604, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _624 = _622 * _614;
    float _626 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[115].x, _624);
    float _628 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[116].x, _626);
    float _630 = _628 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.w = _630;
    bool _632 = !_610;
    float _650;
    if (!_632)
    {
        float _634 = in.m_41.x;
        float _636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _638 = _634 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _642 = _640 * _636;
        float _644 = floor(_642);
        float _646 = -_644;
        float _648 = _642 + _646;
        _650 = _648;
        _652 = true;
    }
    else
    {
        _650 = _114;
    }
    _652 = false;
    float _654 = _650;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _658 = _654 + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _662 = _654 + _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _666 = _654 + _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _680 = 1.0 / _670;
    bool _682 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _684 = isnan(_654);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = 1.0 / _674;
    bool _696 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _698 = 1.0 / _678;
    bool _700 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _702 = isnan(_654);
    bool _704 = _700 || _702;
    bool _706 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _708 = _704 || _706;
    float _710 = float(_708);
    float _712 = _658 * _680;
    bool _714 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _716 = isnan(_654);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = -_710;
    float _728 = _726 + 1.0;
    float _730 = _662 * _694;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _732;
    float _736 = -_724;
    float _738 = _736 + 1.0;
    float _740 = _724 * _728;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _746 = fma(_734, _730, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _752 = _666 * _698;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _758;
    float _762 = _692 * _738;
    float _764 = -_692;
    float _766 = _764 + 1.0;
    float _768 = fma(_756, _730, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _770 = fma(_760, _730, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _772 = _654 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _774 = isnan(_654);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _780 = _776 || _778;
    float _782 = float(_780);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _788 = fma(_744, _752, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _790 = fma(_750, _752, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _792 = _782 * _766;
    float _794 = fma(_786, _752, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _796 = -_782;
    float _798 = _796 + 1.0;
    float _800 = _746 * _792;
    float _802 = _768 * _792;
    float _804 = _770 * _792;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _806;
    float _810 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].x, _800);
    float _812 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].y, _802);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _814;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _818;
    float _822 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].z, _804);
    float _824 = fma(_808, _712, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _826 = fma(_794, _762, _810);
    float _828 = fma(_816, _712, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _830 = fma(_820, _712, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _832 = fma(_788, _762, _812);
    float _834 = fma(_790, _762, _822);
    float _836 = fma(_824, _740, _826);
    float _838 = fma(_828, _740, _832);
    float _840 = fma(_830, _740, _834);
    float _842 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[126].x, _836);
    float _844 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[126].y, _838);
    float _846 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[126].z, _840);
    float _848 = _842 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _850 = _844 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _852 = _846 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _854 = _848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _856 = _850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = _852 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _854;
    out.m_45.y = _856;
    out.m_45.z = _858;
    bool _860 = !_696;
    float _878;
    if (!_860)
    {
        float _862 = in.m_41.x;
        float _864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _866 = _862 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _870 = _868 * _864;
        float _872 = floor(_870);
        float _874 = -_872;
        float _876 = _870 + _874;
        _878 = _876;
        _880 = true;
    }
    else
    {
        _878 = _114;
    }
    _880 = false;
    float _882 = _878;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _886 = _882 + _884;
    bool _888 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _890 = isnan(_882);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _904 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _906 = isnan(_882);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _916;
    bool _920 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _922 = isnan(_882);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = 1.0 / _902;
    bool _934 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _936 = isnan(_882);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    bool _946 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _948 = isnan(_882);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _962 = 1.0 / _960;
    bool _964 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _966 = _918 * _932;
    float _968 = -_898;
    float _970 = _968 + 1.0;
    float _972 = -_930;
    float _974 = _972 + 1.0;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _980 = fma(_966, _886, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _982 = _914 * _970;
    float _984 = -_914;
    float _986 = _984 + 1.0;
    float _988 = _898 * _974;
    float _990 = 1.0 / _978;
    float _992 = _944 * _986;
    float _994 = -_944;
    float _996 = _994 + 1.0;
    bool _998 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1000 = isnan(_882);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1014 = _956 * _996;
    float _1016 = -_956;
    float _1018 = _1016 + 1.0;
    bool _1020 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1022 = isnan(_882);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1028 = _1024 || _1026;
    float _1030 = float(_1028);
    float _1032 = 1.0 / _1012;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1034;
    float _1038 = _1008 * _1018;
    float _1040 = -_1008;
    float _1042 = _1040 + 1.0;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1048 = _1030 * _1042;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1054 = _1046 * _962;
    float _1056 = _980 * _1048;
    float _1058 = -_1030;
    float _1060 = _1058 + 1.0;
    float _1062 = 1.0 / _1052;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1066 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1070 = _882 + _1068;
    float _1072 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1056);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1076 = _1074 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1078 = _1036 * _1032;
    float _1080 = fma(_1054, _1070, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1084 = _882 + _1082;
    float _1086 = 1.0 / _1066;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1092 = fma(_1078, _1084, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1094 = fma(_1080, _1038, _1072);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1098 = _882 + _1096;
    float _1100 = _1090 * _990;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1102;
    float _1106 = 1.0 / _1076;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1112 = fma(_1092, _1014, _1094);
    float _1114 = _1104 * _1062;
    float _1116 = fma(_1100, _1098, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1120 = _882 + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1122;
    bool _1126 = _882 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1128 = isnan(_882);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = _1110 * _1086;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1142 = _882 + _1140;
    float _1144 = fma(_1114, _1120, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1146 = fma(_1116, _992, _1112);
    float _1148 = -_1136;
    float _1150 = _1148 + 1.0;
    float _1152 = fma(_1138, _1142, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1156 = _882 + _1154;
    float _1158 = _1124 * _1106;
    float _1160 = fma(_1144, _982, _1146);
    float _1162 = _930 * _1150;
    float _1164 = fma(_1158, _1156, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1166 = fma(_1152, _988, _1160);
    float _1168 = fma(_1164, _1162, _1166);
    float _1170 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1168);
    out.m_47.x = _1170;
    bool _1172 = !_964;
    if (!_1172)
    {
        float _1174 = in.m_41.x;
        float _1176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1178 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[14].y, _102);
        float _1182 = _1180 * _1176;
        float _1184 = floor(_1182);
        float _1186 = -_1184;
        float _1188 = _1182 + _1186;
        _124 = _1188;
    }
    float _1190 = _124;
    float _1192 = in.m_41.w;
    float _1194 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1196 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1198 = in.m_35.w;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1202 = _1200 != 0;
    float _1204 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1206 = in.m_41.y;
    float _1208 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1194);
    float _1210 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1196);
    float _1212 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1204);
    float _1214 = in.m_41.z;
    float _1216 = -_140;
    float _1218 = _1216 + 1.0;
    float _1220 = in.m_41.x;
    float _1222 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1224;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1230 = _1228 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1240 = _1192 > 0.5;
    float _1242 = 1.0 / _1226;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1246 = -_1198;
    float _1248 = _1246 + 1.0;
    float _1250 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1254 = _1252 != 0;
    float _1256 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1260 = _1258 != 0;
    float _1262 = 1.0 / _1230;
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1266 = _1264 != 0;
    float _1268 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1272 = _1270 != 0;
    float _1274 = in.m_49.x;
    float _1276 = in.m_49.y;
    float _1278 = in.m_49.z;
    bool _1280 = _1206 > 0.5;
    float _1282 = 1.0 / _1234;
    float _1284 = _1198;
    if (_1254)
    {
        float _1286 = _1240 ? _1218 : _140;
        _184 = _1286;
    }
    float _1288 = _184;
    float _1290 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1292 = 1.0 / _1238;
    if (_1272)
    {
        float _1294 = _1280 ? _1248 : _1198;
        _1284 = _1294;
    }
    float _1296 = _1284;
    float _1298 = -_1244;
    float _1300 = fma(_1290, 2.0, _1298);
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1304 = _1302 != 0;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1308 = _1306 != 0;
    int _1310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1312 = _1310 != 0;
    float _1314 = -_102;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1300);
    float _1318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1322 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1278);
    float _1324 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1274);
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1276);
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1336;
    float _1340 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1208);
    float _1342 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1210);
    float _1344 = _1222 * _1322;
    float _1346 = _1214 * 2.0;
    float _1348 = fma(_1268, -2.0, _1320);
    float _1350 = 1.0 / _1338;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1354 = _1190 + _1352;
    float _1356 = _1250 * _1324;
    float _1358 = _1256 * _1326;
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1362 = _1190 + _1360;
    float _1364 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1212);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1368 = _1190 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1372 = _1190 + _1370;
    float _1374 = floor(_1346);
    float _1376 = _1362 * _1242;
    float _1378 = _1354 * _1350;
    float _1380 = 1.0 / _1334;
    float _1382 = _1206 + _1214;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1388 = _1382 + (-1.0);
    bool _1390 = _1374 >= 0.0;
    bool _1392 = isnan(_1374);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan(0.0);
    bool _1398 = _1394 || _1396;
    float _1400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1404 = _1190 + _1402;
    float _1406 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1408 = _1220 * 2.0;
    int _1410 = _1398 ? 0 : 1;
    float _1412 = _1404 * _1262;
    bool _1414 = _1374 > 0.0;
    float _1416 = 1.0 / _1330;
    float _1418 = _1372 * _1380;
    float _1420 = _1380;
    float _1422 = _1408;
    if (!_1202)
    {
        _1420 = _1206;
    }
    float _1424 = _1420;
    float _1426 = _1424;
    if (_1202)
    {
        _1426 = _1220;
    }
    float _1428 = _1426;
    float _1430 = floor(_1408);
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1434 = _1190 + _1432;
    float _1436 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1438 = _1434 * _1282;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1442 = _1190 + _1440;
    float _1444 = fma(_1436, _1288, -0.5);
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1448 = _1220 + _1214;
    float _1450 = _1442 * _1292;
    float _1452 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1454 = _1206 * 2.0;
    float _1456 = _1368 * _1416;
    float _1458 = _1416;
    if (!_1202)
    {
        _1458 = _1214;
    }
    float _1460 = _1458;
    float _1462 = fma(_1452, _1296, -0.5);
    float _1464 = _1220 + _1206;
    float _1466 = _1460;
    if (!_1202)
    {
        _1422 = _1214;
    }
    float _1468 = _1422;
    float _1470 = floor(_1454);
    float _1472 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1446);
    float _1474 = _1464 + (-1.0);
    int _1476 = ~_1410;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    float _1482 = _1448 + (-1.0);
    int _1484 = _1480;
    float _1486 = _1468;
    if (!_1414)
    {
        int _1488 = ~_1410;
        int _1490 = _1488 + 1;
        _1484 = _1490;
    }
    int _1492 = _1484;
    float _1494 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1472);
    if (_1202)
    {
        _1466 = _1206;
    }
    float _1496 = _1466;
    float _1498 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_1202)
    {
        _1486 = _1206;
    }
    float _1500 = _1486;
    float _1502 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1504 = log2(_1502);
    bool _1506 = _1430 > 0.0;
    float _1508 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1510 = _1430 >= 0.0;
    bool _1512 = isnan(_1430);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan(0.0);
    bool _1518 = _1514 || _1516;
    float _1520 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1348);
    float _1522 = fma(_1508, -2.0, _1384);
    float _1524 = -_1520;
    float _1526 = fma(_1494, _1462, _1524);
    bool _1528 = !_1304;
    int _1530 = _1528 ? 0 : 1;
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1532;
    int _1536 = _1518 ? 0 : 1;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1540 = _1538 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _1542 = _1470 > 0.0;
    float _1544 = fma(_1534, _1376, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _1546 = _1470 >= 0.0;
    bool _1548 = isnan(_1470);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1556;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1562 = _1560 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1564 = float(_1492);
    float _1566 = fma(_1558, _1376, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1568 = fma(_1540, _1412, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1570 = fma(_1562, _1412, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1572 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1580 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1578;
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1584 = _1582 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1588 = _1586 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1590 = fma(_1576, _1438, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1592;
    float _1596 = fma(_1580, _1438, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1598;
    float _1602 = fma(_1584, _1450, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1604 = fma(_1588, _1450, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1606 = fma(_1594, _1456, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1608 = fma(_1600, _1456, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1612 = _1610 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1616 = _1614 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1618 = fma(_1612, _1418, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1620 = fma(_1616, _1418, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1626;
    float _1630 = _1504 * _102;
    float _1632 = fma(_1624, _1378, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    int _1634 = _1554 ? 0 : 1;
    float _1636 = fma(_1628, _1378, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1642 = ~_1634;
    int _1644 = _1642 + 1;
    int _1646 = _1644 + 1;
    float _1648 = _1206 + (-0.5);
    float _1650 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1638);
    float _1652 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1640);
    int _1654 = abs(_1530);
    float _1656 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1658 = !_1308;
    int _1660 = _1658 ? 0 : 1;
    float _1662 = -_1386;
    float _1664 = fma(_1656, 2.0, _1662);
    int _1666 = abs(_1660);
    float _1668 = exp2(_1630);
    int _1670 = ~_1536;
    int _1672 = _1670 + 1;
    int _1674 = _1672 + 1;
    float _1676 = float(_1654);
    int _1678 = _1674;
    int _1680 = _1646;
    if (!_1506)
    {
        int _1682 = ~_1536;
        int _1684 = _1682 + 1;
        _1678 = _1684;
    }
    int _1686 = _1678;
    float _1688 = _1676 * _1564;
    float _1690 = float(_1686);
    float _1692 = in.m_51.x;
    float _1694 = in.m_51.y;
    float _1696 = in.m_51.z;
    float _1698 = float(_1666);
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_1542)
    {
        int _1702 = ~_1634;
        int _1704 = _1702 + 1;
        _1680 = _1704;
    }
    int _1706 = _1680;
    float _1708 = _1688 * (-2.0);
    bool _1710 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1712 = isnan(1.0);
    bool _1714 = _1710 || _1712;
    bool _1716 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1718 = _1714 || _1716;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1722 = 1.0 + _1720;
    float _1724 = _1698 * _1690;
    bool _1726 = !_1312;
    int _1728 = _1726 ? 0 : 1;
    float _1730 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1700);
    float _1732 = 1.0 / _1722;
    float _1734 = -_1668;
    float _1736 = _1734 + 1.0;
    int _1738 = abs(_1728);
    float _1740 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1730);
    bool _1742 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1744 = isnan(0.0);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1750 = _1746 || _1748;
    float _1752 = fma(_1572, _1708, _1572);
    float _1754 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1652);
    float _1756 = _1750 ? _1736 : 0.0;
    float _1758 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1650);
    float _1760 = float(_1738);
    float _1762 = _1724 * (-2.0);
    float _1764 = float(_1706);
    float _1766 = -_102;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1664);
    float _1770 = fma(_1708, _1692, _1692);
    float _1772 = _1220 + (-0.5);
    float _1774 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1522);
    float _1776 = _1732;
    if (_1718)
    {
        float _1778 = _1756 * _1732;
        _126 = _1778;
    }
    float _1780 = _126;
    float _1782 = _1760 * _1764;
    float _1784 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1770);
    bool _1786 = _1220 > 0.5;
    bool _1788 = _1786 && _1260;
    float _1790 = fma(_1406, _1762, _1406);
    float _1792 = fma(_1762, _1694, _1694);
    float _1794 = _1782 * (-2.0);
    float _1796 = fma(_1752, _1780, _1784);
    float _1798 = in.m_35.z;
    float _1800 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1792);
    float _1802 = fma(_1498, _1794, _1498);
    float _1804 = _1796 * 0.15915493667125701904296875;
    float _1806 = fma(_1794, _1696, _1696);
    bool _1808 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1810 = isnan(_1190);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1816 = _1812 || _1814;
    float _1818 = float(_1816);
    float _1820 = _1214 + (-0.5);
    float _1822 = fma(_1790, _1780, _1800);
    bool _1824 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1826 = isnan(_1190);
    bool _1828 = _1824 || _1826;
    bool _1830 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1832 = _1828 || _1830;
    float _1834 = float(_1832);
    float _1836 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1838 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1806);
    float _1840 = -_1818;
    float _1842 = _1840 + 1.0;
    bool _1844 = _1214 > 0.5;
    bool _1846 = _1844 && _1266;
    float _1848 = _1822 * 0.15915493667125701904296875;
    float _1850 = fma(_1802, _1780, _1838);
    bool _1852 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1854 = isnan(_1190);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1860 = _1856 || _1858;
    float _1862 = float(_1860);
    float _1864 = _1834 * _1842;
    bool _1866 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1868 = isnan(_1190);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1874 = _1870 || _1872;
    float _1876 = float(_1874);
    float _1878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1880 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1882 = isnan(_1190);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    float _1892 = -_1862;
    float _1894 = _1892 + 1.0;
    bool _1896 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1898 = isnan(_1190);
    bool _1900 = _1896 || _1898;
    bool _1902 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1904 = _1900 || _1902;
    float _1906 = float(_1904);
    float _1908 = -_1876;
    float _1910 = _1908 + 1.0;
    bool _1912 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1914 = isnan(_1190);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1920 = _1916 || _1918;
    float _1922 = float(_1920);
    float _1924 = -_1834;
    float _1926 = _1924 + 1.0;
    bool _1928 = _1190 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1930 = isnan(_1190);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1936 = _1932 || _1934;
    float _1938 = float(_1936);
    float _1940 = _1876 * _1894;
    float _1942 = _1894;
    float _1944 = _1926;
    if (!_1266)
    {
        _1942 = _136;
    }
    float _1946 = _1942;
    float _1948 = _1890 * _1910;
    float _1950 = _1946;
    if (_1846)
    {
        float _1952 = -_136;
        float _1954 = _1952 + 1.0;
        _186 = _1954;
    }
    float _1956 = _186;
    float _1958 = -_1890;
    float _1960 = _1958 + 1.0;
    float _1962 = -_1906;
    float _1964 = _1962 + 1.0;
    float _1966 = -_1922;
    float _1968 = _1966 + 1.0;
    float _1970 = _1850 * 0.15915493667125701904296875;
    float _1972 = _1862 * _1926;
    float _1974 = _1938 * _1960;
    float _1976 = _1922 * _1964;
    float _1978 = _1818 * _1968;
    if (_1260)
    {
        _1776 = _1798;
    }
    float _1980 = _1776;
    float _1982 = _1804 * 6.283185482025146484375;
    float _1984 = sin(_1982);
    float _1986 = _1980;
    if (!_1260)
    {
        _1944 = _1798;
    }
    float _1988 = _1944;
    float _1990 = _1544 * _1974;
    float _1992 = _1988;
    if (_1266)
    {
        _1950 = _1956;
    }
    float _1994 = _1950;
    float _1996 = -_1938;
    float _1998 = _1996 + 1.0;
    float _2000 = _1566 * _1974;
    float _2002 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2004 = _1878 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2006 = _1804 * 6.283185482025146484375;
    float _2008 = cos(_2006);
    float _2010 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1990);
    float _2012 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[167].y, _2000);
    if (_1788)
    {
        float _2014 = -_1980;
        float _2016 = _2014 + 1.0;
        _1986 = _2016;
    }
    float _2018 = _1986;
    float _2020 = fma(_2004, _1994, -0.5);
    float _2022 = fma(_1568, _1948, _2010);
    float _2024 = fma(_1570, _1948, _2012);
    float _2026 = -_1774;
    float _2028 = fma(_1754, _1444, _2026);
    float _2030 = _1848 * 6.283185482025146484375;
    float _2032 = sin(_2030);
    if (_1260)
    {
        _1992 = _2018;
    }
    float _2034 = _1992;
    float _2036 = fma(_1758, _2020, _1768);
    float _2038 = fma(_1590, _1940, _2022);
    float _2040 = fma(_1596, _1940, _2024);
    float _2042 = fma(_2002, _2034, -0.5);
    float _2044 = fma(_1602, _1972, _2038);
    float _2046 = _1848 * 6.283185482025146484375;
    float _2048 = cos(_2046);
    float _2050 = fma(_1604, _1972, _2040);
    float _2052 = fma(_1740, _2042, _1316);
    float _2054 = fma(_1606, _1864, _2044);
    float _2056 = _1526 + 0.5;
    float _2058 = fma(_1608, _1864, _2050);
    float _2060 = _2052 + 0.5;
    float _2062 = fma(_1618, _1978, _2054);
    float _2064 = _1970 * 6.283185482025146484375;
    float _2066 = cos(_2064);
    float _2068 = _1984 * _2032;
    float _2070 = _2008 * _2032;
    float _2072 = fma(_1620, _1978, _2058);
    float _2074 = fma(_1632, _1976, _2062);
    float _2076 = _2036 + 0.5;
    float _2078 = fma(_1636, _1976, _2072);
    float _2080 = _1970 * 6.283185482025146484375;
    float _2082 = sin(_2080);
    float _2084 = _2008 * _2048;
    float _2086 = _1984 * _2048;
    float _2088 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2074);
    float _2090 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2078);
    float _2092 = _2066 * _1358;
    out.m_53.x = _2088;
    out.m_53.y = _2090;
    float _2094 = _2008 * _2092;
    float _2096 = _2032 * _2066;
    float _2098 = _2048 * _2066;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2100 = fma(_2082, _2084, _2068);
    float _2102 = fma(_2082, _2068, _2084);
    float _2104 = fma(_2100, _1356, _2094);
    float _2106 = _2082 * _1358;
    float _2108 = -_2086;
    float _2110 = fma(_2082, _2070, _2108);
    float _2112 = -_2070;
    float _2114 = fma(_2082, _2086, _2112);
    float _2116 = _1984 * _2092;
    float _2118 = -_2106;
    float _2120 = fma(_2098, _1356, _2118);
    float _2122 = fma(_2110, _1344, _2104);
    float _2124 = fma(_2114, _1356, _2116);
    float _2126 = fma(_2096, _1344, _2120);
    float _2128 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2130 = _2028 + 0.5;
    float _2132 = fma(_2102, _1344, _2124);
    float _2134 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2136 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2128);
    float _2138 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_55.x = _2060;
    out.m_55.y = _2056;
    out.m_55.z = _2076;
    out.m_55.w = _2130;
    float _2140 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2134);
    float _2142 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2136);
    float _2144 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2138);
    float _2146 = _1342 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2148 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2140);
    float _2150 = _2142 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2152 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2144);
    float _2154 = _1340 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2156 = _2148 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2158 = _2146 + _2150;
    float _2160 = _1364 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2162 = _2152 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2164 = _2154 + _2156;
    float _2166 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2168 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2170 = _2160 + _2162;
    float _2172 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2174 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2166);
    float _2176 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2168);
    float _2178 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2180 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2172);
    float _2182 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2174);
    float _2184 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2176);
    float _2186 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2178);
    float _2188 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2180);
    float _2190 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2192 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2194 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2186);
    float _2196 = _2188 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2198 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2200 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2202 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2204 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2206 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2198);
    float _2208 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2200);
    float _2210 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2202);
    float _2212 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2204);
    float _2214 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2206);
    float _2216 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2218 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2208);
    float _2220 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2210);
    float _2222 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2212);
    float _2224 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2214);
    float _2226 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2218);
    float _2228 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2220);
    float _2230 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2222);
    out.m_57.x = _2164;
    out.m_57.y = _2158;
    out.m_57.z = _2170;
    out.gl_Position.x = _2226;
    out.gl_Position.y = _2224;
    out.gl_Position.z = _2228;
    out.gl_Position.w = _2230;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

