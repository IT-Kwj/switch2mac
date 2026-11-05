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
    bool _918 = false;
    bool _690 = false;
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
        float _2325 = as_type<float>(_90);
        out.gl_Position.z = _2325;
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
        float _2398 = as_type<float>(_134);
        out.gl_Position.z = _2398;
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
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _572 = _568 + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _580 = isnan(_568);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _594 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _596 = isnan(_568);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _606;
    bool _610 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _612 = isnan(_568);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = 1.0 / _576;
    float _624 = -_588;
    float _626 = _624 + 1.0;
    bool _628 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _630 = _604 * _626;
    float _632 = -_604;
    float _634 = _632 + 1.0;
    float _636 = 1.0 / _592;
    float _638 = _608 * _622;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _644 = fma(_638, _572, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _646 = _642 * _636;
    float _648 = _644 * _630;
    float _650 = -_620;
    float _652 = _650 + 1.0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _656 = _568 + _654;
    float _658 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[115].x, _648);
    float _660 = _588 * _652;
    float _662 = fma(_646, _656, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _664 = fma(_662, _660, _658);
    float _666 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[117].x, _664);
    float _668 = _666 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.w = _668;
    bool _670 = !_628;
    float _688;
    if (!_670)
    {
        float _672 = in.m_41.x;
        float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _676 = _672 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _680 = _678 * _674;
        float _682 = floor(_680);
        float _684 = -_682;
        float _686 = _680 + _684;
        _688 = _686;
        _690 = true;
    }
    else
    {
        _688 = _114;
    }
    _690 = false;
    float _692 = _688;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _696 = _692 + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _700 = _692 + _698;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _704 = _692 + _702;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _710;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _718 = 1.0 / _708;
    bool _720 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _722 = isnan(_692);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = 1.0 / _712;
    bool _734 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _736 = 1.0 / _716;
    bool _738 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _740 = isnan(_692);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = _696 * _718;
    bool _752 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _754 = isnan(_692);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -_748;
    float _766 = _764 + 1.0;
    float _768 = _700 * _732;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _770;
    float _774 = -_762;
    float _776 = _774 + 1.0;
    float _778 = _762 * _766;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _784 = fma(_772, _768, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _790 = _704 * _736;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _796;
    float _800 = _730 * _776;
    float _802 = -_730;
    float _804 = _802 + 1.0;
    float _806 = fma(_794, _768, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _808 = fma(_798, _768, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _810 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _812 = isnan(_692);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _826 = fma(_782, _790, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _828 = fma(_788, _790, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _830 = _820 * _804;
    float _832 = fma(_824, _790, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _834 = -_820;
    float _836 = _834 + 1.0;
    float _838 = _784 * _830;
    float _840 = _806 * _830;
    float _842 = _808 * _830;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _844;
    float _848 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[123].x, _838);
    float _850 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[123].y, _840);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _852;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _856;
    float _860 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[123].z, _842);
    float _862 = fma(_846, _750, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _864 = fma(_832, _800, _848);
    float _866 = fma(_854, _750, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _868 = fma(_858, _750, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _870 = fma(_826, _800, _850);
    float _872 = fma(_828, _800, _860);
    float _874 = fma(_862, _778, _864);
    float _876 = fma(_866, _778, _870);
    float _878 = fma(_868, _778, _872);
    float _880 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[126].x, _874);
    float _882 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[126].y, _876);
    float _884 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[126].z, _878);
    float _886 = _880 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _888 = _882 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _890 = _884 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _892 = _886 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _894 = _888 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _896 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _892;
    out.m_45.y = _894;
    out.m_45.z = _896;
    bool _898 = !_734;
    float _916;
    if (!_898)
    {
        float _900 = in.m_41.x;
        float _902 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _904 = _900 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _906 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _908 = _906 * _902;
        float _910 = floor(_908);
        float _912 = -_910;
        float _914 = _908 + _912;
        _916 = _914;
        _918 = true;
    }
    else
    {
        _916 = _114;
    }
    _918 = false;
    float _920 = _916;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _924 = _920 + _922;
    bool _926 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _928 = isnan(_920);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _942 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _944 = isnan(_920);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _954;
    bool _958 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _960 = isnan(_920);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = 1.0 / _940;
    bool _972 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _974 = isnan(_920);
    bool _976 = _972 || _974;
    bool _978 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _980 = _976 || _978;
    float _982 = float(_980);
    bool _984 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _986 = isnan(_920);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1000 = 1.0 / _998;
    bool _1002 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1004 = _956 * _970;
    float _1006 = -_936;
    float _1008 = _1006 + 1.0;
    float _1010 = -_968;
    float _1012 = _1010 + 1.0;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1018 = fma(_1004, _924, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1020 = _952 * _1008;
    float _1022 = -_952;
    float _1024 = _1022 + 1.0;
    float _1026 = _936 * _1012;
    float _1028 = 1.0 / _1016;
    float _1030 = _982 * _1024;
    float _1032 = -_982;
    float _1034 = _1032 + 1.0;
    bool _1036 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1038 = isnan(_920);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1052 = _994 * _1034;
    float _1054 = -_994;
    float _1056 = _1054 + 1.0;
    bool _1058 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1060 = isnan(_920);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1066 = _1062 || _1064;
    float _1068 = float(_1066);
    float _1070 = 1.0 / _1050;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1072;
    float _1076 = _1046 * _1056;
    float _1078 = -_1046;
    float _1080 = _1078 + 1.0;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1086 = _1068 * _1080;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1092 = _1084 * _1000;
    float _1094 = _1018 * _1086;
    float _1096 = -_1068;
    float _1098 = _1096 + 1.0;
    float _1100 = 1.0 / _1090;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1108 = _920 + _1106;
    float _1110 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1094);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1116 = _1074 * _1070;
    float _1118 = fma(_1092, _1108, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1122 = _920 + _1120;
    float _1124 = 1.0 / _1104;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1128 = _1126 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1130 = fma(_1116, _1122, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1132 = fma(_1118, _1076, _1110);
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1136 = _920 + _1134;
    float _1138 = _1128 * _1028;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1140;
    float _1144 = 1.0 / _1114;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1148 = _1146 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1150 = fma(_1130, _1052, _1132);
    float _1152 = _1142 * _1100;
    float _1154 = fma(_1138, _1136, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1158 = _920 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1160;
    bool _1164 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1166 = isnan(_920);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = _1148 * _1124;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1180 = _920 + _1178;
    float _1182 = fma(_1152, _1158, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1184 = fma(_1154, _1030, _1150);
    float _1186 = -_1174;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_1176, _1180, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1194 = _920 + _1192;
    float _1196 = _1162 * _1144;
    float _1198 = fma(_1182, _1020, _1184);
    float _1200 = _968 * _1188;
    float _1202 = fma(_1196, _1194, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1204 = fma(_1190, _1026, _1198);
    float _1206 = fma(_1202, _1200, _1204);
    float _1208 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1206);
    out.m_47.x = _1208;
    bool _1210 = !_1002;
    if (!_1210)
    {
        float _1212 = in.m_41.x;
        float _1214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1216 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[14].y, _102);
        float _1220 = _1218 * _1214;
        float _1222 = floor(_1220);
        float _1224 = -_1222;
        float _1226 = _1220 + _1224;
        _124 = _1226;
    }
    float _1228 = _124;
    float _1230 = in.m_41.w;
    float _1232 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1234 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1236 = in.m_35.w;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1240 = _1238 != 0;
    float _1242 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1244 = in.m_41.y;
    float _1246 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1232);
    float _1248 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1234);
    float _1250 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1242);
    float _1252 = in.m_41.z;
    float _1254 = -_140;
    float _1256 = _1254 + 1.0;
    float _1258 = in.m_41.x;
    float _1260 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1262;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1276 = _1274 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1278 = _1230 > 0.5;
    float _1280 = 1.0 / _1264;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1284 = -_1236;
    float _1286 = _1284 + 1.0;
    float _1288 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1292 = _1290 != 0;
    float _1294 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1298 = _1296 != 0;
    float _1300 = 1.0 / _1268;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1304 = _1302 != 0;
    float _1306 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1310 = _1308 != 0;
    float _1312 = in.m_49.x;
    float _1314 = in.m_49.y;
    float _1316 = in.m_49.z;
    bool _1318 = _1244 > 0.5;
    float _1320 = 1.0 / _1272;
    float _1322 = _1236;
    if (_1292)
    {
        float _1324 = _1278 ? _1256 : _140;
        _184 = _1324;
    }
    float _1326 = _184;
    float _1328 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1330 = 1.0 / _1276;
    if (_1310)
    {
        float _1332 = _1318 ? _1286 : _1236;
        _1322 = _1332;
    }
    float _1334 = _1322;
    float _1336 = -_1282;
    float _1338 = fma(_1328, 2.0, _1336);
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1342 = _1340 != 0;
    int _1344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1346 = _1344 != 0;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1350 = _1348 != 0;
    float _1352 = -_102;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1338);
    float _1356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1360 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1316);
    float _1362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1312);
    float _1364 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1314);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1372 = _1370 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1374;
    float _1378 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1246);
    float _1380 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1248);
    float _1382 = _1260 * _1360;
    float _1384 = _1252 * 2.0;
    float _1386 = fma(_1306, -2.0, _1358);
    float _1388 = 1.0 / _1376;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1392 = _1228 + _1390;
    float _1394 = _1288 * _1362;
    float _1396 = _1294 * _1364;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1400 = _1228 + _1398;
    float _1402 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1250);
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1406 = _1228 + _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1410 = _1228 + _1408;
    float _1412 = floor(_1384);
    float _1414 = _1400 * _1280;
    float _1416 = _1392 * _1388;
    float _1418 = 1.0 / _1372;
    float _1420 = _1244 + _1252;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1426 = _1420 + (-1.0);
    bool _1428 = _1412 >= 0.0;
    bool _1430 = isnan(_1412);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan(0.0);
    bool _1436 = _1432 || _1434;
    float _1438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1442 = _1228 + _1440;
    float _1444 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1446 = _1258 * 2.0;
    int _1448 = _1436 ? 0 : 1;
    float _1450 = _1442 * _1300;
    bool _1452 = _1412 > 0.0;
    float _1454 = 1.0 / _1368;
    float _1456 = _1410 * _1418;
    float _1458 = _1418;
    float _1460 = _1446;
    if (!_1240)
    {
        _1458 = _1244;
    }
    float _1462 = _1458;
    float _1464 = _1462;
    if (_1240)
    {
        _1464 = _1258;
    }
    float _1466 = _1464;
    float _1468 = floor(_1446);
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1472 = _1228 + _1470;
    float _1474 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1476 = _1472 * _1320;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1480 = _1228 + _1478;
    float _1482 = fma(_1474, _1326, -0.5);
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1486 = _1258 + _1252;
    float _1488 = _1480 * _1330;
    float _1490 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1492 = _1244 * 2.0;
    float _1494 = _1406 * _1454;
    float _1496 = _1454;
    if (!_1240)
    {
        _1496 = _1252;
    }
    float _1498 = _1496;
    float _1500 = fma(_1490, _1334, -0.5);
    float _1502 = _1258 + _1244;
    float _1504 = _1498;
    if (!_1240)
    {
        _1460 = _1252;
    }
    float _1506 = _1460;
    float _1508 = floor(_1492);
    float _1510 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1484);
    float _1512 = _1502 + (-1.0);
    int _1514 = ~_1448;
    int _1516 = _1514 + 1;
    int _1518 = _1516 + 1;
    float _1520 = _1486 + (-1.0);
    int _1522 = _1518;
    float _1524 = _1506;
    if (!_1452)
    {
        int _1526 = ~_1448;
        int _1528 = _1526 + 1;
        _1522 = _1528;
    }
    int _1530 = _1522;
    float _1532 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1510);
    if (_1240)
    {
        _1504 = _1244;
    }
    float _1534 = _1504;
    float _1536 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_1240)
    {
        _1524 = _1244;
    }
    float _1538 = _1524;
    float _1540 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1542 = log2(_1540);
    bool _1544 = _1468 > 0.0;
    float _1546 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1548 = _1468 >= 0.0;
    bool _1550 = isnan(_1468);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan(0.0);
    bool _1556 = _1552 || _1554;
    float _1558 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1386);
    float _1560 = fma(_1546, -2.0, _1422);
    float _1562 = -_1558;
    float _1564 = fma(_1532, _1500, _1562);
    bool _1566 = !_1342;
    int _1568 = _1566 ? 0 : 1;
    float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1572 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1570;
    int _1574 = _1556 ? 0 : 1;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1578 = _1576 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _1580 = _1508 > 0.0;
    float _1582 = fma(_1572, _1414, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _1584 = _1508 >= 0.0;
    bool _1586 = isnan(_1508);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan(0.0);
    bool _1592 = _1588 || _1590;
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1596 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1594;
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1600 = _1598 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1602 = float(_1530);
    float _1604 = fma(_1596, _1414, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1606 = fma(_1578, _1450, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1608 = fma(_1600, _1450, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1610 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1616;
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1628 = fma(_1614, _1476, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1630;
    float _1634 = fma(_1618, _1476, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1636;
    float _1640 = fma(_1622, _1488, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1642 = fma(_1626, _1488, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1644 = fma(_1632, _1494, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1646 = fma(_1638, _1494, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1654 = _1652 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1656 = fma(_1650, _1456, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1658 = fma(_1654, _1456, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1664;
    float _1668 = _1542 * _102;
    float _1670 = fma(_1662, _1416, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    int _1672 = _1592 ? 0 : 1;
    float _1674 = fma(_1666, _1416, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1680 = ~_1672;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = _1244 + (-0.5);
    float _1688 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1676);
    float _1690 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1678);
    int _1692 = abs(_1568);
    float _1694 = _1466 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1696 = !_1346;
    int _1698 = _1696 ? 0 : 1;
    float _1700 = -_1424;
    float _1702 = fma(_1694, 2.0, _1700);
    int _1704 = abs(_1698);
    float _1706 = exp2(_1668);
    int _1708 = ~_1574;
    int _1710 = _1708 + 1;
    int _1712 = _1710 + 1;
    float _1714 = float(_1692);
    int _1716 = _1712;
    int _1718 = _1684;
    if (!_1544)
    {
        int _1720 = ~_1574;
        int _1722 = _1720 + 1;
        _1716 = _1722;
    }
    int _1724 = _1716;
    float _1726 = _1714 * _1602;
    float _1728 = float(_1724);
    float _1730 = in.m_51.x;
    float _1732 = in.m_51.y;
    float _1734 = in.m_51.z;
    float _1736 = float(_1704);
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_1580)
    {
        int _1740 = ~_1672;
        int _1742 = _1740 + 1;
        _1718 = _1742;
    }
    int _1744 = _1718;
    float _1746 = _1726 * (-2.0);
    bool _1748 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1750 = isnan(1.0);
    bool _1752 = _1748 || _1750;
    bool _1754 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1756 = _1752 || _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1760 = 1.0 + _1758;
    float _1762 = _1736 * _1728;
    bool _1764 = !_1350;
    int _1766 = _1764 ? 0 : 1;
    float _1768 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1738);
    float _1770 = 1.0 / _1760;
    float _1772 = -_1706;
    float _1774 = _1772 + 1.0;
    int _1776 = abs(_1766);
    float _1778 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1768);
    bool _1780 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1782 = isnan(0.0);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1788 = _1784 || _1786;
    float _1790 = fma(_1610, _1746, _1610);
    float _1792 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1690);
    float _1794 = _1788 ? _1774 : 0.0;
    float _1796 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1688);
    float _1798 = float(_1776);
    float _1800 = _1762 * (-2.0);
    float _1802 = float(_1744);
    float _1804 = -_102;
    float _1806 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1702);
    float _1808 = fma(_1746, _1730, _1730);
    float _1810 = _1258 + (-0.5);
    float _1812 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1560);
    float _1814 = _1770;
    if (_1756)
    {
        float _1816 = _1794 * _1770;
        _126 = _1816;
    }
    float _1818 = _126;
    float _1820 = _1798 * _1802;
    float _1822 = fma(_1810, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1808);
    bool _1824 = _1258 > 0.5;
    bool _1826 = _1824 && _1298;
    float _1828 = fma(_1444, _1800, _1444);
    float _1830 = fma(_1800, _1732, _1732);
    float _1832 = _1820 * (-2.0);
    float _1834 = fma(_1790, _1818, _1822);
    float _1836 = in.m_35.z;
    float _1838 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1830);
    float _1840 = fma(_1536, _1832, _1536);
    float _1842 = _1834 * 0.15915493667125701904296875;
    float _1844 = fma(_1832, _1734, _1734);
    bool _1846 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1848 = isnan(_1228);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = _1252 + (-0.5);
    float _1860 = fma(_1828, _1818, _1838);
    bool _1862 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1864 = isnan(_1228);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1870 = _1866 || _1868;
    float _1872 = float(_1870);
    float _1874 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1876 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1844);
    float _1878 = -_1856;
    float _1880 = _1878 + 1.0;
    bool _1882 = _1252 > 0.5;
    bool _1884 = _1882 && _1304;
    float _1886 = _1860 * 0.15915493667125701904296875;
    float _1888 = fma(_1840, _1818, _1876);
    bool _1890 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1892 = isnan(_1228);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1898 = _1894 || _1896;
    float _1900 = float(_1898);
    float _1902 = _1872 * _1880;
    bool _1904 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1906 = isnan(_1228);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1912 = _1908 || _1910;
    float _1914 = float(_1912);
    float _1916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1918 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1920 = isnan(_1228);
    bool _1922 = _1918 || _1920;
    bool _1924 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1926 = _1922 || _1924;
    float _1928 = float(_1926);
    float _1930 = -_1900;
    float _1932 = _1930 + 1.0;
    bool _1934 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1936 = isnan(_1228);
    bool _1938 = _1934 || _1936;
    bool _1940 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1942 = _1938 || _1940;
    float _1944 = float(_1942);
    float _1946 = -_1914;
    float _1948 = _1946 + 1.0;
    bool _1950 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1952 = isnan(_1228);
    bool _1954 = _1950 || _1952;
    bool _1956 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1958 = _1954 || _1956;
    float _1960 = float(_1958);
    float _1962 = -_1872;
    float _1964 = _1962 + 1.0;
    bool _1966 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1968 = isnan(_1228);
    bool _1970 = _1966 || _1968;
    bool _1972 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1974 = _1970 || _1972;
    float _1976 = float(_1974);
    float _1978 = _1914 * _1932;
    float _1980 = _1932;
    float _1982 = _1964;
    if (!_1304)
    {
        _1980 = _136;
    }
    float _1984 = _1980;
    float _1986 = _1928 * _1948;
    float _1988 = _1984;
    if (_1884)
    {
        float _1990 = -_136;
        float _1992 = _1990 + 1.0;
        _186 = _1992;
    }
    float _1994 = _186;
    float _1996 = -_1928;
    float _1998 = _1996 + 1.0;
    float _2000 = -_1944;
    float _2002 = _2000 + 1.0;
    float _2004 = -_1960;
    float _2006 = _2004 + 1.0;
    float _2008 = _1888 * 0.15915493667125701904296875;
    float _2010 = _1900 * _1964;
    float _2012 = _1976 * _1998;
    float _2014 = _1960 * _2002;
    float _2016 = _1856 * _2006;
    if (_1298)
    {
        _1814 = _1836;
    }
    float _2018 = _1814;
    float _2020 = _1842 * 6.283185482025146484375;
    float _2022 = sin(_2020);
    float _2024 = _2018;
    if (!_1298)
    {
        _1982 = _1836;
    }
    float _2026 = _1982;
    float _2028 = _1582 * _2012;
    float _2030 = _2026;
    if (_1304)
    {
        _1988 = _1994;
    }
    float _2032 = _1988;
    float _2034 = -_1976;
    float _2036 = _2034 + 1.0;
    float _2038 = _1604 * _2012;
    float _2040 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2042 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2044 = _1842 * 6.283185482025146484375;
    float _2046 = cos(_2044);
    float _2048 = fma(_2036, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2028);
    float _2050 = fma(_2036, (*spvDescriptorSet0.vp_c9)._m0[167].y, _2038);
    if (_1826)
    {
        float _2052 = -_2018;
        float _2054 = _2052 + 1.0;
        _2024 = _2054;
    }
    float _2056 = _2024;
    float _2058 = fma(_2042, _2032, -0.5);
    float _2060 = fma(_1606, _1986, _2048);
    float _2062 = fma(_1608, _1986, _2050);
    float _2064 = -_1812;
    float _2066 = fma(_1792, _1482, _2064);
    float _2068 = _1886 * 6.283185482025146484375;
    float _2070 = sin(_2068);
    if (_1298)
    {
        _2030 = _2056;
    }
    float _2072 = _2030;
    float _2074 = fma(_1796, _2058, _1806);
    float _2076 = fma(_1628, _1978, _2060);
    float _2078 = fma(_1634, _1978, _2062);
    float _2080 = fma(_2040, _2072, -0.5);
    float _2082 = fma(_1640, _2010, _2076);
    float _2084 = _1886 * 6.283185482025146484375;
    float _2086 = cos(_2084);
    float _2088 = fma(_1642, _2010, _2078);
    float _2090 = fma(_1778, _2080, _1354);
    float _2092 = fma(_1644, _1902, _2082);
    float _2094 = _1564 + 0.5;
    float _2096 = fma(_1646, _1902, _2088);
    float _2098 = _2090 + 0.5;
    float _2100 = fma(_1656, _2016, _2092);
    float _2102 = _2008 * 6.283185482025146484375;
    float _2104 = cos(_2102);
    float _2106 = _2022 * _2070;
    float _2108 = _2046 * _2070;
    float _2110 = fma(_1658, _2016, _2096);
    float _2112 = fma(_1670, _2014, _2100);
    float _2114 = _2074 + 0.5;
    float _2116 = fma(_1674, _2014, _2110);
    float _2118 = _2008 * 6.283185482025146484375;
    float _2120 = sin(_2118);
    float _2122 = _2046 * _2086;
    float _2124 = _2022 * _2086;
    float _2126 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2112);
    float _2128 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2116);
    float _2130 = _2104 * _1396;
    out.m_53.x = _2126;
    out.m_53.y = _2128;
    float _2132 = _2046 * _2130;
    float _2134 = _2070 * _2104;
    float _2136 = _2086 * _2104;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2138 = fma(_2120, _2122, _2106);
    float _2140 = fma(_2120, _2106, _2122);
    float _2142 = fma(_2138, _1394, _2132);
    float _2144 = _2120 * _1396;
    float _2146 = -_2124;
    float _2148 = fma(_2120, _2108, _2146);
    float _2150 = -_2108;
    float _2152 = fma(_2120, _2124, _2150);
    float _2154 = _2022 * _2130;
    float _2156 = -_2144;
    float _2158 = fma(_2136, _1394, _2156);
    float _2160 = fma(_2148, _1382, _2142);
    float _2162 = fma(_2152, _1394, _2154);
    float _2164 = fma(_2134, _1382, _2158);
    float _2166 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2168 = _2066 + 0.5;
    float _2170 = fma(_2140, _1382, _2162);
    float _2172 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2174 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2166);
    float _2176 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_55.x = _2098;
    out.m_55.y = _2094;
    out.m_55.z = _2114;
    out.m_55.w = _2168;
    float _2178 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2172);
    float _2180 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2174);
    float _2182 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2176);
    float _2184 = _1380 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2186 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2178);
    float _2188 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2190 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2182);
    float _2192 = _1378 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2194 = _2186 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2196 = _2184 + _2188;
    float _2198 = _1402 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2200 = _2190 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2202 = _2192 + _2194;
    float _2204 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2206 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2208 = _2198 + _2200;
    float _2210 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2212 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2204);
    float _2214 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2206);
    float _2216 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2218 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2210);
    float _2220 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2212);
    float _2222 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2214);
    float _2224 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2216);
    float _2226 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2218);
    float _2228 = _2220 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2230 = _2222 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2232 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2224);
    float _2234 = _2226 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2236 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2238 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2240 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2242 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2244 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2236);
    float _2246 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2238);
    float _2248 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2240);
    float _2250 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2242);
    float _2252 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2244);
    float _2254 = _2232 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2256 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2246);
    float _2258 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2248);
    float _2260 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2250);
    float _2262 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2252);
    float _2264 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2256);
    float _2266 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2258);
    float _2268 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2260);
    out.m_57.x = _2202;
    out.m_57.y = _2196;
    out.m_57.z = _2208;
    out.gl_Position.x = _2264;
    out.gl_Position.y = _2262;
    out.gl_Position.z = _2266;
    out.gl_Position.w = _2268;
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
    bool _918 = false;
    bool _690 = false;
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
        float _2325 = as_type<float>(_90);
        out.gl_Position.z = _2325;
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
        float _2398 = as_type<float>(_134);
        out.gl_Position.z = _2398;
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
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _572 = _568 + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _580 = isnan(_568);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _594 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _596 = isnan(_568);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _606;
    bool _610 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _612 = isnan(_568);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = 1.0 / _576;
    float _624 = -_588;
    float _626 = _624 + 1.0;
    bool _628 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _630 = _604 * _626;
    float _632 = -_604;
    float _634 = _632 + 1.0;
    float _636 = 1.0 / _592;
    float _638 = _608 * _622;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _644 = fma(_638, _572, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _646 = _642 * _636;
    float _648 = _644 * _630;
    float _650 = -_620;
    float _652 = _650 + 1.0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _656 = _568 + _654;
    float _658 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[115].x, _648);
    float _660 = _588 * _652;
    float _662 = fma(_646, _656, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _664 = fma(_662, _660, _658);
    float _666 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[117].x, _664);
    float _668 = _666 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.w = _668;
    bool _670 = !_628;
    float _688;
    if (!_670)
    {
        float _672 = in.m_41.x;
        float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _676 = _672 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _680 = _678 * _674;
        float _682 = floor(_680);
        float _684 = -_682;
        float _686 = _680 + _684;
        _688 = _686;
        _690 = true;
    }
    else
    {
        _688 = _114;
    }
    _690 = false;
    float _692 = _688;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _696 = _692 + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _700 = _692 + _698;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _704 = _692 + _702;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _710;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _718 = 1.0 / _708;
    bool _720 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _722 = isnan(_692);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = 1.0 / _712;
    bool _734 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _736 = 1.0 / _716;
    bool _738 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _740 = isnan(_692);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = _696 * _718;
    bool _752 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _754 = isnan(_692);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -_748;
    float _766 = _764 + 1.0;
    float _768 = _700 * _732;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _770;
    float _774 = -_762;
    float _776 = _774 + 1.0;
    float _778 = _762 * _766;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _784 = fma(_772, _768, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _790 = _704 * _736;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _796;
    float _800 = _730 * _776;
    float _802 = -_730;
    float _804 = _802 + 1.0;
    float _806 = fma(_794, _768, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _808 = fma(_798, _768, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _810 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _812 = isnan(_692);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _826 = fma(_782, _790, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _828 = fma(_788, _790, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _830 = _820 * _804;
    float _832 = fma(_824, _790, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _834 = -_820;
    float _836 = _834 + 1.0;
    float _838 = _784 * _830;
    float _840 = _806 * _830;
    float _842 = _808 * _830;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _844;
    float _848 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[123].x, _838);
    float _850 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[123].y, _840);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _852;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _856;
    float _860 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[123].z, _842);
    float _862 = fma(_846, _750, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _864 = fma(_832, _800, _848);
    float _866 = fma(_854, _750, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _868 = fma(_858, _750, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _870 = fma(_826, _800, _850);
    float _872 = fma(_828, _800, _860);
    float _874 = fma(_862, _778, _864);
    float _876 = fma(_866, _778, _870);
    float _878 = fma(_868, _778, _872);
    float _880 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[126].x, _874);
    float _882 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[126].y, _876);
    float _884 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[126].z, _878);
    float _886 = _880 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _888 = _882 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _890 = _884 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _892 = _886 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _894 = _888 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _896 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _892;
    out.m_45.y = _894;
    out.m_45.z = _896;
    bool _898 = !_734;
    float _916;
    if (!_898)
    {
        float _900 = in.m_41.x;
        float _902 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _904 = _900 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _906 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _908 = _906 * _902;
        float _910 = floor(_908);
        float _912 = -_910;
        float _914 = _908 + _912;
        _916 = _914;
        _918 = true;
    }
    else
    {
        _916 = _114;
    }
    _918 = false;
    float _920 = _916;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _924 = _920 + _922;
    bool _926 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _928 = isnan(_920);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _942 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _944 = isnan(_920);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _954;
    bool _958 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _960 = isnan(_920);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = 1.0 / _940;
    bool _972 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _974 = isnan(_920);
    bool _976 = _972 || _974;
    bool _978 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _980 = _976 || _978;
    float _982 = float(_980);
    bool _984 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _986 = isnan(_920);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1000 = 1.0 / _998;
    bool _1002 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1004 = _956 * _970;
    float _1006 = -_936;
    float _1008 = _1006 + 1.0;
    float _1010 = -_968;
    float _1012 = _1010 + 1.0;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1018 = fma(_1004, _924, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1020 = _952 * _1008;
    float _1022 = -_952;
    float _1024 = _1022 + 1.0;
    float _1026 = _936 * _1012;
    float _1028 = 1.0 / _1016;
    float _1030 = _982 * _1024;
    float _1032 = -_982;
    float _1034 = _1032 + 1.0;
    bool _1036 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1038 = isnan(_920);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1052 = _994 * _1034;
    float _1054 = -_994;
    float _1056 = _1054 + 1.0;
    bool _1058 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1060 = isnan(_920);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1066 = _1062 || _1064;
    float _1068 = float(_1066);
    float _1070 = 1.0 / _1050;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1072;
    float _1076 = _1046 * _1056;
    float _1078 = -_1046;
    float _1080 = _1078 + 1.0;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1086 = _1068 * _1080;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1092 = _1084 * _1000;
    float _1094 = _1018 * _1086;
    float _1096 = -_1068;
    float _1098 = _1096 + 1.0;
    float _1100 = 1.0 / _1090;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1108 = _920 + _1106;
    float _1110 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1094);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1116 = _1074 * _1070;
    float _1118 = fma(_1092, _1108, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1122 = _920 + _1120;
    float _1124 = 1.0 / _1104;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1128 = _1126 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1130 = fma(_1116, _1122, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1132 = fma(_1118, _1076, _1110);
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1136 = _920 + _1134;
    float _1138 = _1128 * _1028;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1140;
    float _1144 = 1.0 / _1114;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1148 = _1146 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1150 = fma(_1130, _1052, _1132);
    float _1152 = _1142 * _1100;
    float _1154 = fma(_1138, _1136, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1158 = _920 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1160;
    bool _1164 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1166 = isnan(_920);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = _1148 * _1124;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1180 = _920 + _1178;
    float _1182 = fma(_1152, _1158, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1184 = fma(_1154, _1030, _1150);
    float _1186 = -_1174;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_1176, _1180, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1194 = _920 + _1192;
    float _1196 = _1162 * _1144;
    float _1198 = fma(_1182, _1020, _1184);
    float _1200 = _968 * _1188;
    float _1202 = fma(_1196, _1194, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1204 = fma(_1190, _1026, _1198);
    float _1206 = fma(_1202, _1200, _1204);
    float _1208 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1206);
    out.m_47.x = _1208;
    bool _1210 = !_1002;
    if (!_1210)
    {
        float _1212 = in.m_41.x;
        float _1214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1216 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[14].y, _102);
        float _1220 = _1218 * _1214;
        float _1222 = floor(_1220);
        float _1224 = -_1222;
        float _1226 = _1220 + _1224;
        _124 = _1226;
    }
    float _1228 = _124;
    float _1230 = in.m_41.w;
    float _1232 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1234 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1236 = in.m_35.w;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1240 = _1238 != 0;
    float _1242 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1244 = in.m_41.y;
    float _1246 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1232);
    float _1248 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1234);
    float _1250 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1242);
    float _1252 = in.m_41.z;
    float _1254 = -_140;
    float _1256 = _1254 + 1.0;
    float _1258 = in.m_41.x;
    float _1260 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1262;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1276 = _1274 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1278 = _1230 > 0.5;
    float _1280 = 1.0 / _1264;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1284 = -_1236;
    float _1286 = _1284 + 1.0;
    float _1288 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1292 = _1290 != 0;
    float _1294 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1298 = _1296 != 0;
    float _1300 = 1.0 / _1268;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1304 = _1302 != 0;
    float _1306 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1310 = _1308 != 0;
    float _1312 = in.m_49.x;
    float _1314 = in.m_49.y;
    float _1316 = in.m_49.z;
    bool _1318 = _1244 > 0.5;
    float _1320 = 1.0 / _1272;
    float _1322 = _1236;
    if (_1292)
    {
        float _1324 = _1278 ? _1256 : _140;
        _184 = _1324;
    }
    float _1326 = _184;
    float _1328 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1330 = 1.0 / _1276;
    if (_1310)
    {
        float _1332 = _1318 ? _1286 : _1236;
        _1322 = _1332;
    }
    float _1334 = _1322;
    float _1336 = -_1282;
    float _1338 = fma(_1328, 2.0, _1336);
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1342 = _1340 != 0;
    int _1344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1346 = _1344 != 0;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1350 = _1348 != 0;
    float _1352 = -_102;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1338);
    float _1356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1360 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1316);
    float _1362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1312);
    float _1364 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1314);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1372 = _1370 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1374;
    float _1378 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1246);
    float _1380 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1248);
    float _1382 = _1260 * _1360;
    float _1384 = _1252 * 2.0;
    float _1386 = fma(_1306, -2.0, _1358);
    float _1388 = 1.0 / _1376;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1392 = _1228 + _1390;
    float _1394 = _1288 * _1362;
    float _1396 = _1294 * _1364;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1400 = _1228 + _1398;
    float _1402 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1250);
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1406 = _1228 + _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1410 = _1228 + _1408;
    float _1412 = floor(_1384);
    float _1414 = _1400 * _1280;
    float _1416 = _1392 * _1388;
    float _1418 = 1.0 / _1372;
    float _1420 = _1244 + _1252;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1426 = _1420 + (-1.0);
    bool _1428 = _1412 >= 0.0;
    bool _1430 = isnan(_1412);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan(0.0);
    bool _1436 = _1432 || _1434;
    float _1438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1442 = _1228 + _1440;
    float _1444 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1446 = _1258 * 2.0;
    int _1448 = _1436 ? 0 : 1;
    float _1450 = _1442 * _1300;
    bool _1452 = _1412 > 0.0;
    float _1454 = 1.0 / _1368;
    float _1456 = _1410 * _1418;
    float _1458 = _1418;
    float _1460 = _1446;
    if (!_1240)
    {
        _1458 = _1244;
    }
    float _1462 = _1458;
    float _1464 = _1462;
    if (_1240)
    {
        _1464 = _1258;
    }
    float _1466 = _1464;
    float _1468 = floor(_1446);
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1472 = _1228 + _1470;
    float _1474 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1476 = _1472 * _1320;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1480 = _1228 + _1478;
    float _1482 = fma(_1474, _1326, -0.5);
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1486 = _1258 + _1252;
    float _1488 = _1480 * _1330;
    float _1490 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1492 = _1244 * 2.0;
    float _1494 = _1406 * _1454;
    float _1496 = _1454;
    if (!_1240)
    {
        _1496 = _1252;
    }
    float _1498 = _1496;
    float _1500 = fma(_1490, _1334, -0.5);
    float _1502 = _1258 + _1244;
    float _1504 = _1498;
    if (!_1240)
    {
        _1460 = _1252;
    }
    float _1506 = _1460;
    float _1508 = floor(_1492);
    float _1510 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1484);
    float _1512 = _1502 + (-1.0);
    int _1514 = ~_1448;
    int _1516 = _1514 + 1;
    int _1518 = _1516 + 1;
    float _1520 = _1486 + (-1.0);
    int _1522 = _1518;
    float _1524 = _1506;
    if (!_1452)
    {
        int _1526 = ~_1448;
        int _1528 = _1526 + 1;
        _1522 = _1528;
    }
    int _1530 = _1522;
    float _1532 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1510);
    if (_1240)
    {
        _1504 = _1244;
    }
    float _1534 = _1504;
    float _1536 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_1240)
    {
        _1524 = _1244;
    }
    float _1538 = _1524;
    float _1540 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1542 = log2(_1540);
    bool _1544 = _1468 > 0.0;
    float _1546 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1548 = _1468 >= 0.0;
    bool _1550 = isnan(_1468);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan(0.0);
    bool _1556 = _1552 || _1554;
    float _1558 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1386);
    float _1560 = fma(_1546, -2.0, _1422);
    float _1562 = -_1558;
    float _1564 = fma(_1532, _1500, _1562);
    bool _1566 = !_1342;
    int _1568 = _1566 ? 0 : 1;
    float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1572 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1570;
    int _1574 = _1556 ? 0 : 1;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1578 = _1576 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _1580 = _1508 > 0.0;
    float _1582 = fma(_1572, _1414, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _1584 = _1508 >= 0.0;
    bool _1586 = isnan(_1508);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan(0.0);
    bool _1592 = _1588 || _1590;
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1596 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1594;
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1600 = _1598 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1602 = float(_1530);
    float _1604 = fma(_1596, _1414, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1606 = fma(_1578, _1450, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1608 = fma(_1600, _1450, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1610 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1616;
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1628 = fma(_1614, _1476, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1630;
    float _1634 = fma(_1618, _1476, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1636;
    float _1640 = fma(_1622, _1488, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1642 = fma(_1626, _1488, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1644 = fma(_1632, _1494, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1646 = fma(_1638, _1494, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1654 = _1652 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1656 = fma(_1650, _1456, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1658 = fma(_1654, _1456, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1664;
    float _1668 = _1542 * _102;
    float _1670 = fma(_1662, _1416, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    int _1672 = _1592 ? 0 : 1;
    float _1674 = fma(_1666, _1416, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1680 = ~_1672;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = _1244 + (-0.5);
    float _1688 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1676);
    float _1690 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1678);
    int _1692 = abs(_1568);
    float _1694 = _1466 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1696 = !_1346;
    int _1698 = _1696 ? 0 : 1;
    float _1700 = -_1424;
    float _1702 = fma(_1694, 2.0, _1700);
    int _1704 = abs(_1698);
    float _1706 = exp2(_1668);
    int _1708 = ~_1574;
    int _1710 = _1708 + 1;
    int _1712 = _1710 + 1;
    float _1714 = float(_1692);
    int _1716 = _1712;
    int _1718 = _1684;
    if (!_1544)
    {
        int _1720 = ~_1574;
        int _1722 = _1720 + 1;
        _1716 = _1722;
    }
    int _1724 = _1716;
    float _1726 = _1714 * _1602;
    float _1728 = float(_1724);
    float _1730 = in.m_51.x;
    float _1732 = in.m_51.y;
    float _1734 = in.m_51.z;
    float _1736 = float(_1704);
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_1580)
    {
        int _1740 = ~_1672;
        int _1742 = _1740 + 1;
        _1718 = _1742;
    }
    int _1744 = _1718;
    float _1746 = _1726 * (-2.0);
    bool _1748 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1750 = isnan(1.0);
    bool _1752 = _1748 || _1750;
    bool _1754 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1756 = _1752 || _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1760 = 1.0 + _1758;
    float _1762 = _1736 * _1728;
    bool _1764 = !_1350;
    int _1766 = _1764 ? 0 : 1;
    float _1768 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1738);
    float _1770 = 1.0 / _1760;
    float _1772 = -_1706;
    float _1774 = _1772 + 1.0;
    int _1776 = abs(_1766);
    float _1778 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1768);
    bool _1780 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1782 = isnan(0.0);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1788 = _1784 || _1786;
    float _1790 = fma(_1610, _1746, _1610);
    float _1792 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1690);
    float _1794 = _1788 ? _1774 : 0.0;
    float _1796 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1688);
    float _1798 = float(_1776);
    float _1800 = _1762 * (-2.0);
    float _1802 = float(_1744);
    float _1804 = -_102;
    float _1806 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1702);
    float _1808 = fma(_1746, _1730, _1730);
    float _1810 = _1258 + (-0.5);
    float _1812 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1560);
    float _1814 = _1770;
    if (_1756)
    {
        float _1816 = _1794 * _1770;
        _126 = _1816;
    }
    float _1818 = _126;
    float _1820 = _1798 * _1802;
    float _1822 = fma(_1810, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1808);
    bool _1824 = _1258 > 0.5;
    bool _1826 = _1824 && _1298;
    float _1828 = fma(_1444, _1800, _1444);
    float _1830 = fma(_1800, _1732, _1732);
    float _1832 = _1820 * (-2.0);
    float _1834 = fma(_1790, _1818, _1822);
    float _1836 = in.m_35.z;
    float _1838 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1830);
    float _1840 = fma(_1536, _1832, _1536);
    float _1842 = _1834 * 0.15915493667125701904296875;
    float _1844 = fma(_1832, _1734, _1734);
    bool _1846 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1848 = isnan(_1228);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = _1252 + (-0.5);
    float _1860 = fma(_1828, _1818, _1838);
    bool _1862 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1864 = isnan(_1228);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1870 = _1866 || _1868;
    float _1872 = float(_1870);
    float _1874 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1876 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1844);
    float _1878 = -_1856;
    float _1880 = _1878 + 1.0;
    bool _1882 = _1252 > 0.5;
    bool _1884 = _1882 && _1304;
    float _1886 = _1860 * 0.15915493667125701904296875;
    float _1888 = fma(_1840, _1818, _1876);
    bool _1890 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1892 = isnan(_1228);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1898 = _1894 || _1896;
    float _1900 = float(_1898);
    float _1902 = _1872 * _1880;
    bool _1904 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1906 = isnan(_1228);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1912 = _1908 || _1910;
    float _1914 = float(_1912);
    float _1916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1918 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1920 = isnan(_1228);
    bool _1922 = _1918 || _1920;
    bool _1924 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1926 = _1922 || _1924;
    float _1928 = float(_1926);
    float _1930 = -_1900;
    float _1932 = _1930 + 1.0;
    bool _1934 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1936 = isnan(_1228);
    bool _1938 = _1934 || _1936;
    bool _1940 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1942 = _1938 || _1940;
    float _1944 = float(_1942);
    float _1946 = -_1914;
    float _1948 = _1946 + 1.0;
    bool _1950 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1952 = isnan(_1228);
    bool _1954 = _1950 || _1952;
    bool _1956 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1958 = _1954 || _1956;
    float _1960 = float(_1958);
    float _1962 = -_1872;
    float _1964 = _1962 + 1.0;
    bool _1966 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1968 = isnan(_1228);
    bool _1970 = _1966 || _1968;
    bool _1972 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1974 = _1970 || _1972;
    float _1976 = float(_1974);
    float _1978 = _1914 * _1932;
    float _1980 = _1932;
    float _1982 = _1964;
    if (!_1304)
    {
        _1980 = _136;
    }
    float _1984 = _1980;
    float _1986 = _1928 * _1948;
    float _1988 = _1984;
    if (_1884)
    {
        float _1990 = -_136;
        float _1992 = _1990 + 1.0;
        _186 = _1992;
    }
    float _1994 = _186;
    float _1996 = -_1928;
    float _1998 = _1996 + 1.0;
    float _2000 = -_1944;
    float _2002 = _2000 + 1.0;
    float _2004 = -_1960;
    float _2006 = _2004 + 1.0;
    float _2008 = _1888 * 0.15915493667125701904296875;
    float _2010 = _1900 * _1964;
    float _2012 = _1976 * _1998;
    float _2014 = _1960 * _2002;
    float _2016 = _1856 * _2006;
    if (_1298)
    {
        _1814 = _1836;
    }
    float _2018 = _1814;
    float _2020 = _1842 * 6.283185482025146484375;
    float _2022 = sin(_2020);
    float _2024 = _2018;
    if (!_1298)
    {
        _1982 = _1836;
    }
    float _2026 = _1982;
    float _2028 = _1582 * _2012;
    float _2030 = _2026;
    if (_1304)
    {
        _1988 = _1994;
    }
    float _2032 = _1988;
    float _2034 = -_1976;
    float _2036 = _2034 + 1.0;
    float _2038 = _1604 * _2012;
    float _2040 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2042 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2044 = _1842 * 6.283185482025146484375;
    float _2046 = cos(_2044);
    float _2048 = fma(_2036, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2028);
    float _2050 = fma(_2036, (*spvDescriptorSet0.vp_c9)._m0[167].y, _2038);
    if (_1826)
    {
        float _2052 = -_2018;
        float _2054 = _2052 + 1.0;
        _2024 = _2054;
    }
    float _2056 = _2024;
    float _2058 = fma(_2042, _2032, -0.5);
    float _2060 = fma(_1606, _1986, _2048);
    float _2062 = fma(_1608, _1986, _2050);
    float _2064 = -_1812;
    float _2066 = fma(_1792, _1482, _2064);
    float _2068 = _1886 * 6.283185482025146484375;
    float _2070 = sin(_2068);
    if (_1298)
    {
        _2030 = _2056;
    }
    float _2072 = _2030;
    float _2074 = fma(_1796, _2058, _1806);
    float _2076 = fma(_1628, _1978, _2060);
    float _2078 = fma(_1634, _1978, _2062);
    float _2080 = fma(_2040, _2072, -0.5);
    float _2082 = fma(_1640, _2010, _2076);
    float _2084 = _1886 * 6.283185482025146484375;
    float _2086 = cos(_2084);
    float _2088 = fma(_1642, _2010, _2078);
    float _2090 = fma(_1778, _2080, _1354);
    float _2092 = fma(_1644, _1902, _2082);
    float _2094 = _1564 + 0.5;
    float _2096 = fma(_1646, _1902, _2088);
    float _2098 = _2090 + 0.5;
    float _2100 = fma(_1656, _2016, _2092);
    float _2102 = _2008 * 6.283185482025146484375;
    float _2104 = cos(_2102);
    float _2106 = _2022 * _2070;
    float _2108 = _2046 * _2070;
    float _2110 = fma(_1658, _2016, _2096);
    float _2112 = fma(_1670, _2014, _2100);
    float _2114 = _2074 + 0.5;
    float _2116 = fma(_1674, _2014, _2110);
    float _2118 = _2008 * 6.283185482025146484375;
    float _2120 = sin(_2118);
    float _2122 = _2046 * _2086;
    float _2124 = _2022 * _2086;
    float _2126 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2112);
    float _2128 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2116);
    float _2130 = _2104 * _1396;
    out.m_53.x = _2126;
    out.m_53.y = _2128;
    float _2132 = _2046 * _2130;
    float _2134 = _2070 * _2104;
    float _2136 = _2086 * _2104;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2138 = fma(_2120, _2122, _2106);
    float _2140 = fma(_2120, _2106, _2122);
    float _2142 = fma(_2138, _1394, _2132);
    float _2144 = _2120 * _1396;
    float _2146 = -_2124;
    float _2148 = fma(_2120, _2108, _2146);
    float _2150 = -_2108;
    float _2152 = fma(_2120, _2124, _2150);
    float _2154 = _2022 * _2130;
    float _2156 = -_2144;
    float _2158 = fma(_2136, _1394, _2156);
    float _2160 = fma(_2148, _1382, _2142);
    float _2162 = fma(_2152, _1394, _2154);
    float _2164 = fma(_2134, _1382, _2158);
    float _2166 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2168 = _2066 + 0.5;
    float _2170 = fma(_2140, _1382, _2162);
    float _2172 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2174 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2166);
    float _2176 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_55.x = _2098;
    out.m_55.y = _2094;
    out.m_55.z = _2114;
    out.m_55.w = _2168;
    float _2178 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2172);
    float _2180 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2174);
    float _2182 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2176);
    float _2184 = _1380 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2186 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2178);
    float _2188 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2190 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2182);
    float _2192 = _1378 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2194 = _2186 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2196 = _2184 + _2188;
    float _2198 = _1402 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2200 = _2190 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2202 = _2192 + _2194;
    float _2204 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2206 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2208 = _2198 + _2200;
    float _2210 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2212 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2204);
    float _2214 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2206);
    float _2216 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2218 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2210);
    float _2220 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2212);
    float _2222 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2214);
    float _2224 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2216);
    float _2226 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2218);
    float _2228 = _2220 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2230 = _2222 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2232 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2224);
    float _2234 = _2226 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2236 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2238 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2240 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2242 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2244 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2236);
    float _2246 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2238);
    float _2248 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2240);
    float _2250 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2242);
    float _2252 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2244);
    float _2254 = _2232 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2256 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2246);
    float _2258 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2248);
    float _2260 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2250);
    float _2262 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2252);
    float _2264 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2256);
    float _2266 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2258);
    float _2268 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2260);
    out.m_57.x = _2202;
    out.m_57.y = _2196;
    out.m_57.z = _2208;
    out.gl_Position.x = _2264;
    out.gl_Position.y = _2262;
    out.gl_Position.z = _2266;
    out.gl_Position.w = _2268;
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
    bool _918 = false;
    bool _690 = false;
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
        float _2325 = as_type<float>(_90);
        out.gl_Position.z = _2325;
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
        float _2398 = as_type<float>(_134);
        out.gl_Position.z = _2398;
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
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _572 = _568 + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _580 = isnan(_568);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _594 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _596 = isnan(_568);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _606;
    bool _610 = _568 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _612 = isnan(_568);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = 1.0 / _576;
    float _624 = -_588;
    float _626 = _624 + 1.0;
    bool _628 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _630 = _604 * _626;
    float _632 = -_604;
    float _634 = _632 + 1.0;
    float _636 = 1.0 / _592;
    float _638 = _608 * _622;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _644 = fma(_638, _572, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _646 = _642 * _636;
    float _648 = _644 * _630;
    float _650 = -_620;
    float _652 = _650 + 1.0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _656 = _568 + _654;
    float _658 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[115].x, _648);
    float _660 = _588 * _652;
    float _662 = fma(_646, _656, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _664 = fma(_662, _660, _658);
    float _666 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[117].x, _664);
    float _668 = _666 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.w = _668;
    bool _670 = !_628;
    float _688;
    if (!_670)
    {
        float _672 = in.m_41.x;
        float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _676 = _672 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _680 = _678 * _674;
        float _682 = floor(_680);
        float _684 = -_682;
        float _686 = _680 + _684;
        _688 = _686;
        _690 = true;
    }
    else
    {
        _688 = _114;
    }
    _690 = false;
    float _692 = _688;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _696 = _692 + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _700 = _692 + _698;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _704 = _692 + _702;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _710;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _718 = 1.0 / _708;
    bool _720 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _722 = isnan(_692);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = 1.0 / _712;
    bool _734 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _736 = 1.0 / _716;
    bool _738 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _740 = isnan(_692);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = _696 * _718;
    bool _752 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _754 = isnan(_692);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -_748;
    float _766 = _764 + 1.0;
    float _768 = _700 * _732;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _770;
    float _774 = -_762;
    float _776 = _774 + 1.0;
    float _778 = _762 * _766;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _784 = fma(_772, _768, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _790 = _704 * _736;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _796;
    float _800 = _730 * _776;
    float _802 = -_730;
    float _804 = _802 + 1.0;
    float _806 = fma(_794, _768, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _808 = fma(_798, _768, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _810 = _692 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _812 = isnan(_692);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _826 = fma(_782, _790, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _828 = fma(_788, _790, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _830 = _820 * _804;
    float _832 = fma(_824, _790, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _834 = -_820;
    float _836 = _834 + 1.0;
    float _838 = _784 * _830;
    float _840 = _806 * _830;
    float _842 = _808 * _830;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _844;
    float _848 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[123].x, _838);
    float _850 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[123].y, _840);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _852;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _856;
    float _860 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[123].z, _842);
    float _862 = fma(_846, _750, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _864 = fma(_832, _800, _848);
    float _866 = fma(_854, _750, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _868 = fma(_858, _750, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _870 = fma(_826, _800, _850);
    float _872 = fma(_828, _800, _860);
    float _874 = fma(_862, _778, _864);
    float _876 = fma(_866, _778, _870);
    float _878 = fma(_868, _778, _872);
    float _880 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[126].x, _874);
    float _882 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[126].y, _876);
    float _884 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[126].z, _878);
    float _886 = _880 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _888 = _882 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _890 = _884 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _892 = _886 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _894 = _888 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _896 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _892;
    out.m_45.y = _894;
    out.m_45.z = _896;
    bool _898 = !_734;
    float _916;
    if (!_898)
    {
        float _900 = in.m_41.x;
        float _902 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _904 = _900 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _906 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _908 = _906 * _902;
        float _910 = floor(_908);
        float _912 = -_910;
        float _914 = _908 + _912;
        _916 = _914;
        _918 = true;
    }
    else
    {
        _916 = _114;
    }
    _918 = false;
    float _920 = _916;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _924 = _920 + _922;
    bool _926 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _928 = isnan(_920);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _942 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _944 = isnan(_920);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _954;
    bool _958 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _960 = isnan(_920);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = 1.0 / _940;
    bool _972 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _974 = isnan(_920);
    bool _976 = _972 || _974;
    bool _978 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _980 = _976 || _978;
    float _982 = float(_980);
    bool _984 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _986 = isnan(_920);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1000 = 1.0 / _998;
    bool _1002 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1004 = _956 * _970;
    float _1006 = -_936;
    float _1008 = _1006 + 1.0;
    float _1010 = -_968;
    float _1012 = _1010 + 1.0;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1018 = fma(_1004, _924, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1020 = _952 * _1008;
    float _1022 = -_952;
    float _1024 = _1022 + 1.0;
    float _1026 = _936 * _1012;
    float _1028 = 1.0 / _1016;
    float _1030 = _982 * _1024;
    float _1032 = -_982;
    float _1034 = _1032 + 1.0;
    bool _1036 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1038 = isnan(_920);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1052 = _994 * _1034;
    float _1054 = -_994;
    float _1056 = _1054 + 1.0;
    bool _1058 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1060 = isnan(_920);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1066 = _1062 || _1064;
    float _1068 = float(_1066);
    float _1070 = 1.0 / _1050;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1072;
    float _1076 = _1046 * _1056;
    float _1078 = -_1046;
    float _1080 = _1078 + 1.0;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1086 = _1068 * _1080;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1092 = _1084 * _1000;
    float _1094 = _1018 * _1086;
    float _1096 = -_1068;
    float _1098 = _1096 + 1.0;
    float _1100 = 1.0 / _1090;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1108 = _920 + _1106;
    float _1110 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1094);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1116 = _1074 * _1070;
    float _1118 = fma(_1092, _1108, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1122 = _920 + _1120;
    float _1124 = 1.0 / _1104;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1128 = _1126 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1130 = fma(_1116, _1122, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1132 = fma(_1118, _1076, _1110);
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1136 = _920 + _1134;
    float _1138 = _1128 * _1028;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1140;
    float _1144 = 1.0 / _1114;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1148 = _1146 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1150 = fma(_1130, _1052, _1132);
    float _1152 = _1142 * _1100;
    float _1154 = fma(_1138, _1136, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1158 = _920 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1160;
    bool _1164 = _920 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1166 = isnan(_920);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = _1148 * _1124;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1180 = _920 + _1178;
    float _1182 = fma(_1152, _1158, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1184 = fma(_1154, _1030, _1150);
    float _1186 = -_1174;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_1176, _1180, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1194 = _920 + _1192;
    float _1196 = _1162 * _1144;
    float _1198 = fma(_1182, _1020, _1184);
    float _1200 = _968 * _1188;
    float _1202 = fma(_1196, _1194, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1204 = fma(_1190, _1026, _1198);
    float _1206 = fma(_1202, _1200, _1204);
    float _1208 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1206);
    out.m_47.x = _1208;
    bool _1210 = !_1002;
    if (!_1210)
    {
        float _1212 = in.m_41.x;
        float _1214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1216 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[14].y, _102);
        float _1220 = _1218 * _1214;
        float _1222 = floor(_1220);
        float _1224 = -_1222;
        float _1226 = _1220 + _1224;
        _124 = _1226;
    }
    float _1228 = _124;
    float _1230 = in.m_41.w;
    float _1232 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1234 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1236 = in.m_35.w;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1240 = _1238 != 0;
    float _1242 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1244 = in.m_41.y;
    float _1246 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1232);
    float _1248 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1234);
    float _1250 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1242);
    float _1252 = in.m_41.z;
    float _1254 = -_140;
    float _1256 = _1254 + 1.0;
    float _1258 = in.m_41.x;
    float _1260 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1262;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1276 = _1274 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1278 = _1230 > 0.5;
    float _1280 = 1.0 / _1264;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1284 = -_1236;
    float _1286 = _1284 + 1.0;
    float _1288 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1292 = _1290 != 0;
    float _1294 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1298 = _1296 != 0;
    float _1300 = 1.0 / _1268;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1304 = _1302 != 0;
    float _1306 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1310 = _1308 != 0;
    float _1312 = in.m_49.x;
    float _1314 = in.m_49.y;
    float _1316 = in.m_49.z;
    bool _1318 = _1244 > 0.5;
    float _1320 = 1.0 / _1272;
    float _1322 = _1236;
    if (_1292)
    {
        float _1324 = _1278 ? _1256 : _140;
        _184 = _1324;
    }
    float _1326 = _184;
    float _1328 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1330 = 1.0 / _1276;
    if (_1310)
    {
        float _1332 = _1318 ? _1286 : _1236;
        _1322 = _1332;
    }
    float _1334 = _1322;
    float _1336 = -_1282;
    float _1338 = fma(_1328, 2.0, _1336);
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1342 = _1340 != 0;
    int _1344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1346 = _1344 != 0;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1350 = _1348 != 0;
    float _1352 = -_102;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1338);
    float _1356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1360 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1316);
    float _1362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1312);
    float _1364 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1314);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1372 = _1370 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1374;
    float _1378 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1246);
    float _1380 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1248);
    float _1382 = _1260 * _1360;
    float _1384 = _1252 * 2.0;
    float _1386 = fma(_1306, -2.0, _1358);
    float _1388 = 1.0 / _1376;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1392 = _1228 + _1390;
    float _1394 = _1288 * _1362;
    float _1396 = _1294 * _1364;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1400 = _1228 + _1398;
    float _1402 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1250);
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1406 = _1228 + _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1410 = _1228 + _1408;
    float _1412 = floor(_1384);
    float _1414 = _1400 * _1280;
    float _1416 = _1392 * _1388;
    float _1418 = 1.0 / _1372;
    float _1420 = _1244 + _1252;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1426 = _1420 + (-1.0);
    bool _1428 = _1412 >= 0.0;
    bool _1430 = isnan(_1412);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan(0.0);
    bool _1436 = _1432 || _1434;
    float _1438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1442 = _1228 + _1440;
    float _1444 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1446 = _1258 * 2.0;
    int _1448 = _1436 ? 0 : 1;
    float _1450 = _1442 * _1300;
    bool _1452 = _1412 > 0.0;
    float _1454 = 1.0 / _1368;
    float _1456 = _1410 * _1418;
    float _1458 = _1418;
    float _1460 = _1446;
    if (!_1240)
    {
        _1458 = _1244;
    }
    float _1462 = _1458;
    float _1464 = _1462;
    if (_1240)
    {
        _1464 = _1258;
    }
    float _1466 = _1464;
    float _1468 = floor(_1446);
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1472 = _1228 + _1470;
    float _1474 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1476 = _1472 * _1320;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1480 = _1228 + _1478;
    float _1482 = fma(_1474, _1326, -0.5);
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1486 = _1258 + _1252;
    float _1488 = _1480 * _1330;
    float _1490 = _1356 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1492 = _1244 * 2.0;
    float _1494 = _1406 * _1454;
    float _1496 = _1454;
    if (!_1240)
    {
        _1496 = _1252;
    }
    float _1498 = _1496;
    float _1500 = fma(_1490, _1334, -0.5);
    float _1502 = _1258 + _1244;
    float _1504 = _1498;
    if (!_1240)
    {
        _1460 = _1252;
    }
    float _1506 = _1460;
    float _1508 = floor(_1492);
    float _1510 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1484);
    float _1512 = _1502 + (-1.0);
    int _1514 = ~_1448;
    int _1516 = _1514 + 1;
    int _1518 = _1516 + 1;
    float _1520 = _1486 + (-1.0);
    int _1522 = _1518;
    float _1524 = _1506;
    if (!_1452)
    {
        int _1526 = ~_1448;
        int _1528 = _1526 + 1;
        _1522 = _1528;
    }
    int _1530 = _1522;
    float _1532 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1510);
    if (_1240)
    {
        _1504 = _1244;
    }
    float _1534 = _1504;
    float _1536 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_1240)
    {
        _1524 = _1244;
    }
    float _1538 = _1524;
    float _1540 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1542 = log2(_1540);
    bool _1544 = _1468 > 0.0;
    float _1546 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1548 = _1468 >= 0.0;
    bool _1550 = isnan(_1468);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan(0.0);
    bool _1556 = _1552 || _1554;
    float _1558 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1386);
    float _1560 = fma(_1546, -2.0, _1422);
    float _1562 = -_1558;
    float _1564 = fma(_1532, _1500, _1562);
    bool _1566 = !_1342;
    int _1568 = _1566 ? 0 : 1;
    float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1572 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1570;
    int _1574 = _1556 ? 0 : 1;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1578 = _1576 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _1580 = _1508 > 0.0;
    float _1582 = fma(_1572, _1414, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _1584 = _1508 >= 0.0;
    bool _1586 = isnan(_1508);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan(0.0);
    bool _1592 = _1588 || _1590;
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1596 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1594;
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1600 = _1598 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1602 = float(_1530);
    float _1604 = fma(_1596, _1414, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1606 = fma(_1578, _1450, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1608 = fma(_1600, _1450, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1610 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1616;
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1628 = fma(_1614, _1476, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1630;
    float _1634 = fma(_1618, _1476, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1636;
    float _1640 = fma(_1622, _1488, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1642 = fma(_1626, _1488, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1644 = fma(_1632, _1494, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1646 = fma(_1638, _1494, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1654 = _1652 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1656 = fma(_1650, _1456, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1658 = fma(_1654, _1456, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1664;
    float _1668 = _1542 * _102;
    float _1670 = fma(_1662, _1416, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    int _1672 = _1592 ? 0 : 1;
    float _1674 = fma(_1666, _1416, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1680 = ~_1672;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = _1244 + (-0.5);
    float _1688 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1676);
    float _1690 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1678);
    int _1692 = abs(_1568);
    float _1694 = _1466 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1696 = !_1346;
    int _1698 = _1696 ? 0 : 1;
    float _1700 = -_1424;
    float _1702 = fma(_1694, 2.0, _1700);
    int _1704 = abs(_1698);
    float _1706 = exp2(_1668);
    int _1708 = ~_1574;
    int _1710 = _1708 + 1;
    int _1712 = _1710 + 1;
    float _1714 = float(_1692);
    int _1716 = _1712;
    int _1718 = _1684;
    if (!_1544)
    {
        int _1720 = ~_1574;
        int _1722 = _1720 + 1;
        _1716 = _1722;
    }
    int _1724 = _1716;
    float _1726 = _1714 * _1602;
    float _1728 = float(_1724);
    float _1730 = in.m_51.x;
    float _1732 = in.m_51.y;
    float _1734 = in.m_51.z;
    float _1736 = float(_1704);
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_1580)
    {
        int _1740 = ~_1672;
        int _1742 = _1740 + 1;
        _1718 = _1742;
    }
    int _1744 = _1718;
    float _1746 = _1726 * (-2.0);
    bool _1748 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1750 = isnan(1.0);
    bool _1752 = _1748 || _1750;
    bool _1754 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1756 = _1752 || _1754;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1760 = 1.0 + _1758;
    float _1762 = _1736 * _1728;
    bool _1764 = !_1350;
    int _1766 = _1764 ? 0 : 1;
    float _1768 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1738);
    float _1770 = 1.0 / _1760;
    float _1772 = -_1706;
    float _1774 = _1772 + 1.0;
    int _1776 = abs(_1766);
    float _1778 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1768);
    bool _1780 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1782 = isnan(0.0);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1788 = _1784 || _1786;
    float _1790 = fma(_1610, _1746, _1610);
    float _1792 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1690);
    float _1794 = _1788 ? _1774 : 0.0;
    float _1796 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1688);
    float _1798 = float(_1776);
    float _1800 = _1762 * (-2.0);
    float _1802 = float(_1744);
    float _1804 = -_102;
    float _1806 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1702);
    float _1808 = fma(_1746, _1730, _1730);
    float _1810 = _1258 + (-0.5);
    float _1812 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1560);
    float _1814 = _1770;
    if (_1756)
    {
        float _1816 = _1794 * _1770;
        _126 = _1816;
    }
    float _1818 = _126;
    float _1820 = _1798 * _1802;
    float _1822 = fma(_1810, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1808);
    bool _1824 = _1258 > 0.5;
    bool _1826 = _1824 && _1298;
    float _1828 = fma(_1444, _1800, _1444);
    float _1830 = fma(_1800, _1732, _1732);
    float _1832 = _1820 * (-2.0);
    float _1834 = fma(_1790, _1818, _1822);
    float _1836 = in.m_35.z;
    float _1838 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1830);
    float _1840 = fma(_1536, _1832, _1536);
    float _1842 = _1834 * 0.15915493667125701904296875;
    float _1844 = fma(_1832, _1734, _1734);
    bool _1846 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1848 = isnan(_1228);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = _1252 + (-0.5);
    float _1860 = fma(_1828, _1818, _1838);
    bool _1862 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1864 = isnan(_1228);
    bool _1866 = _1862 || _1864;
    bool _1868 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1870 = _1866 || _1868;
    float _1872 = float(_1870);
    float _1874 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1876 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1844);
    float _1878 = -_1856;
    float _1880 = _1878 + 1.0;
    bool _1882 = _1252 > 0.5;
    bool _1884 = _1882 && _1304;
    float _1886 = _1860 * 0.15915493667125701904296875;
    float _1888 = fma(_1840, _1818, _1876);
    bool _1890 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1892 = isnan(_1228);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1898 = _1894 || _1896;
    float _1900 = float(_1898);
    float _1902 = _1872 * _1880;
    bool _1904 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1906 = isnan(_1228);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1912 = _1908 || _1910;
    float _1914 = float(_1912);
    float _1916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1918 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1920 = isnan(_1228);
    bool _1922 = _1918 || _1920;
    bool _1924 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1926 = _1922 || _1924;
    float _1928 = float(_1926);
    float _1930 = -_1900;
    float _1932 = _1930 + 1.0;
    bool _1934 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1936 = isnan(_1228);
    bool _1938 = _1934 || _1936;
    bool _1940 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1942 = _1938 || _1940;
    float _1944 = float(_1942);
    float _1946 = -_1914;
    float _1948 = _1946 + 1.0;
    bool _1950 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1952 = isnan(_1228);
    bool _1954 = _1950 || _1952;
    bool _1956 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1958 = _1954 || _1956;
    float _1960 = float(_1958);
    float _1962 = -_1872;
    float _1964 = _1962 + 1.0;
    bool _1966 = _1228 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1968 = isnan(_1228);
    bool _1970 = _1966 || _1968;
    bool _1972 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1974 = _1970 || _1972;
    float _1976 = float(_1974);
    float _1978 = _1914 * _1932;
    float _1980 = _1932;
    float _1982 = _1964;
    if (!_1304)
    {
        _1980 = _136;
    }
    float _1984 = _1980;
    float _1986 = _1928 * _1948;
    float _1988 = _1984;
    if (_1884)
    {
        float _1990 = -_136;
        float _1992 = _1990 + 1.0;
        _186 = _1992;
    }
    float _1994 = _186;
    float _1996 = -_1928;
    float _1998 = _1996 + 1.0;
    float _2000 = -_1944;
    float _2002 = _2000 + 1.0;
    float _2004 = -_1960;
    float _2006 = _2004 + 1.0;
    float _2008 = _1888 * 0.15915493667125701904296875;
    float _2010 = _1900 * _1964;
    float _2012 = _1976 * _1998;
    float _2014 = _1960 * _2002;
    float _2016 = _1856 * _2006;
    if (_1298)
    {
        _1814 = _1836;
    }
    float _2018 = _1814;
    float _2020 = _1842 * 6.283185482025146484375;
    float _2022 = sin(_2020);
    float _2024 = _2018;
    if (!_1298)
    {
        _1982 = _1836;
    }
    float _2026 = _1982;
    float _2028 = _1582 * _2012;
    float _2030 = _2026;
    if (_1304)
    {
        _1988 = _1994;
    }
    float _2032 = _1988;
    float _2034 = -_1976;
    float _2036 = _2034 + 1.0;
    float _2038 = _1604 * _2012;
    float _2040 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2042 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2044 = _1842 * 6.283185482025146484375;
    float _2046 = cos(_2044);
    float _2048 = fma(_2036, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2028);
    float _2050 = fma(_2036, (*spvDescriptorSet0.vp_c9)._m0[167].y, _2038);
    if (_1826)
    {
        float _2052 = -_2018;
        float _2054 = _2052 + 1.0;
        _2024 = _2054;
    }
    float _2056 = _2024;
    float _2058 = fma(_2042, _2032, -0.5);
    float _2060 = fma(_1606, _1986, _2048);
    float _2062 = fma(_1608, _1986, _2050);
    float _2064 = -_1812;
    float _2066 = fma(_1792, _1482, _2064);
    float _2068 = _1886 * 6.283185482025146484375;
    float _2070 = sin(_2068);
    if (_1298)
    {
        _2030 = _2056;
    }
    float _2072 = _2030;
    float _2074 = fma(_1796, _2058, _1806);
    float _2076 = fma(_1628, _1978, _2060);
    float _2078 = fma(_1634, _1978, _2062);
    float _2080 = fma(_2040, _2072, -0.5);
    float _2082 = fma(_1640, _2010, _2076);
    float _2084 = _1886 * 6.283185482025146484375;
    float _2086 = cos(_2084);
    float _2088 = fma(_1642, _2010, _2078);
    float _2090 = fma(_1778, _2080, _1354);
    float _2092 = fma(_1644, _1902, _2082);
    float _2094 = _1564 + 0.5;
    float _2096 = fma(_1646, _1902, _2088);
    float _2098 = _2090 + 0.5;
    float _2100 = fma(_1656, _2016, _2092);
    float _2102 = _2008 * 6.283185482025146484375;
    float _2104 = cos(_2102);
    float _2106 = _2022 * _2070;
    float _2108 = _2046 * _2070;
    float _2110 = fma(_1658, _2016, _2096);
    float _2112 = fma(_1670, _2014, _2100);
    float _2114 = _2074 + 0.5;
    float _2116 = fma(_1674, _2014, _2110);
    float _2118 = _2008 * 6.283185482025146484375;
    float _2120 = sin(_2118);
    float _2122 = _2046 * _2086;
    float _2124 = _2022 * _2086;
    float _2126 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2112);
    float _2128 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2116);
    float _2130 = _2104 * _1396;
    out.m_53.x = _2126;
    out.m_53.y = _2128;
    float _2132 = _2046 * _2130;
    float _2134 = _2070 * _2104;
    float _2136 = _2086 * _2104;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2138 = fma(_2120, _2122, _2106);
    float _2140 = fma(_2120, _2106, _2122);
    float _2142 = fma(_2138, _1394, _2132);
    float _2144 = _2120 * _1396;
    float _2146 = -_2124;
    float _2148 = fma(_2120, _2108, _2146);
    float _2150 = -_2108;
    float _2152 = fma(_2120, _2124, _2150);
    float _2154 = _2022 * _2130;
    float _2156 = -_2144;
    float _2158 = fma(_2136, _1394, _2156);
    float _2160 = fma(_2148, _1382, _2142);
    float _2162 = fma(_2152, _1394, _2154);
    float _2164 = fma(_2134, _1382, _2158);
    float _2166 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2168 = _2066 + 0.5;
    float _2170 = fma(_2140, _1382, _2162);
    float _2172 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2174 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2166);
    float _2176 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_55.x = _2098;
    out.m_55.y = _2094;
    out.m_55.z = _2114;
    out.m_55.w = _2168;
    float _2178 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2172);
    float _2180 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2174);
    float _2182 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2176);
    float _2184 = _1380 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2186 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2178);
    float _2188 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2190 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2182);
    float _2192 = _1378 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2194 = _2186 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2196 = _2184 + _2188;
    float _2198 = _1402 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2200 = _2190 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2202 = _2192 + _2194;
    float _2204 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2206 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2208 = _2198 + _2200;
    float _2210 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2212 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2204);
    float _2214 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2206);
    float _2216 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2218 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2210);
    float _2220 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2212);
    float _2222 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2214);
    float _2224 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2216);
    float _2226 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2218);
    float _2228 = _2220 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2230 = _2222 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2232 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2224);
    float _2234 = _2226 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2236 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2238 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2240 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2242 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2244 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2236);
    float _2246 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2238);
    float _2248 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2240);
    float _2250 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2242);
    float _2252 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2244);
    float _2254 = _2232 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2256 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2246);
    float _2258 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2248);
    float _2260 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2250);
    float _2262 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2252);
    float _2264 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2256);
    float _2266 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2258);
    float _2268 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2260);
    out.m_57.x = _2202;
    out.m_57.y = _2196;
    out.m_57.z = _2208;
    out.gl_Position.x = _2264;
    out.gl_Position.y = _2262;
    out.gl_Position.z = _2266;
    out.gl_Position.w = _2268;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

