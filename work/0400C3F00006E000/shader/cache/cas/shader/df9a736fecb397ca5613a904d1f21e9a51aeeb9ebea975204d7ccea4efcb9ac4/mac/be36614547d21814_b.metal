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
    bool _864 = false;
    bool _636 = false;
    bool _512 = false;
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
        float _2271 = as_type<float>(_90);
        out.gl_Position.z = _2271;
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
        float _2344 = as_type<float>(_134);
        out.gl_Position.z = _2344;
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
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _290 = _286 + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = _286 + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = _286 + _308;
    float _312 = 1.0 / _298;
    bool _314 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _316 = isnan(_286);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    bool _326 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _328 = isnan(_286);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = 1.0 / _302;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _342 = 1.0 / _306;
    float _344 = _294 * _312;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _350;
    float _354 = _290 * _338;
    bool _356 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _358 = isnan(_286);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _368;
    float _372 = -_366;
    float _374 = _372 + 1.0;
    float _376 = fma(_370, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _378 = _310 * _342;
    float _380 = fma(_348, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = fma(_352, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _384 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _386 = isnan(_286);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = _324 * _374;
    float _398 = -_324;
    float _400 = _398 + 1.0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = -_394;
    float _416 = _414 + 1.0;
    float _418 = _394 * _400;
    float _420 = fma(_404, _354, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_408, _354, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = fma(_412, _354, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = _336 * _416;
    float _428 = in.m_37.x;
    float _430 = in.m_37.y;
    float _432 = in.m_37.z;
    float _434 = -_336;
    float _436 = _434 + 1.0;
    float _438 = _380 * _426;
    float _440 = _382 * _426;
    float _442 = _376 * _426;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _444;
    float _448 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[143].x, _438);
    float _450 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[143].y, _440);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _456;
    float _460 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[143].z, _442);
    float _462 = fma(_446, _378, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _464 = fma(_454, _378, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _466 = fma(_458, _378, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _468 = fma(_424, _418, _460);
    float _470 = fma(_422, _418, _450);
    float _472 = fma(_420, _418, _448);
    float _474 = fma(_466, _396, _468);
    float _476 = fma(_464, _396, _470);
    float _478 = fma(_462, _396, _472);
    float _480 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[146].z, _474);
    float _482 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[146].y, _476);
    float _484 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[146].x, _478);
    float _486 = _480 * _432;
    float _488 = _482 * _430;
    float _490 = _484 * _428;
    bool _492 = !_340;
    float _510;
    if (!_492)
    {
        float _494 = in.m_41.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _510 = _508;
        _512 = true;
    }
    else
    {
        _510 = _114;
    }
    _512 = false;
    float _514 = _510;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _518 = _514 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _524 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _526 = isnan(_514);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _540 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _542 = isnan(_514);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _552;
    bool _556 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _558 = isnan(_514);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = 1.0 / _522;
    float _570 = -_534;
    float _572 = _570 + 1.0;
    bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _576 = _550 * _572;
    float _578 = -_550;
    float _580 = _578 + 1.0;
    float _582 = 1.0 / _538;
    float _584 = _554 * _568;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _590 = fma(_584, _518, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _592 = _588 * _582;
    float _594 = _590 * _576;
    float _596 = -_566;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _602 = _514 + _600;
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[115].x, _594);
    float _606 = _534 * _598;
    float _608 = fma(_592, _602, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _610 = fma(_608, _606, _604);
    float _612 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[117].x, _610);
    float _614 = _612 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.w = _614;
    bool _616 = !_574;
    float _634;
    if (!_616)
    {
        float _618 = in.m_41.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        _634 = _114;
    }
    _636 = false;
    float _638 = _634;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _642 = _638 + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _646 = _638 + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _650 = _638 + _648;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _664 = 1.0 / _654;
    bool _666 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _668 = isnan(_638);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = 1.0 / _658;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _682 = 1.0 / _662;
    bool _684 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _686 = isnan(_638);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = _642 * _664;
    bool _698 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _700 = isnan(_638);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -_694;
    float _712 = _710 + 1.0;
    float _714 = _646 * _678;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _716;
    float _720 = -_708;
    float _722 = _720 + 1.0;
    float _724 = _708 * _712;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _730 = fma(_718, _714, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _736 = _650 * _682;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _742;
    float _746 = _676 * _722;
    float _748 = -_676;
    float _750 = _748 + 1.0;
    float _752 = fma(_740, _714, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _754 = fma(_744, _714, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _756 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _758 = isnan(_638);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _764 = _760 || _762;
    float _766 = float(_764);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _772 = fma(_728, _736, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _774 = fma(_734, _736, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _776 = _766 * _750;
    float _778 = fma(_770, _736, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _780 = -_766;
    float _782 = _780 + 1.0;
    float _784 = _730 * _776;
    float _786 = _752 * _776;
    float _788 = _754 * _776;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _790;
    float _794 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[123].x, _784);
    float _796 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[123].y, _786);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _802;
    float _806 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[123].z, _788);
    float _808 = fma(_792, _696, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _810 = fma(_778, _746, _794);
    float _812 = fma(_800, _696, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _814 = fma(_804, _696, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _816 = fma(_772, _746, _796);
    float _818 = fma(_774, _746, _806);
    float _820 = fma(_808, _724, _810);
    float _822 = fma(_812, _724, _816);
    float _824 = fma(_814, _724, _818);
    float _826 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[126].x, _820);
    float _828 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[126].y, _822);
    float _830 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[126].z, _824);
    float _832 = _826 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _834 = _828 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _836 = _830 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _838 = _832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _840 = _834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _842 = _836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _838;
    out.m_45.y = _840;
    out.m_45.z = _842;
    bool _844 = !_680;
    float _862;
    if (!_844)
    {
        float _846 = in.m_41.x;
        float _848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _850 = _846 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _854 = _852 * _848;
        float _856 = floor(_854);
        float _858 = -_856;
        float _860 = _854 + _858;
        _862 = _860;
        _864 = true;
    }
    else
    {
        _862 = _114;
    }
    _864 = false;
    float _866 = _862;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _870 = _866 + _868;
    bool _872 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _874 = isnan(_866);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _886 = _884 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _888 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _890 = isnan(_866);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _900;
    bool _904 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _906 = isnan(_866);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = 1.0 / _886;
    bool _918 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _920 = isnan(_866);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    bool _930 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _932 = isnan(_866);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _946 = 1.0 / _944;
    bool _948 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _950 = _902 * _916;
    float _952 = -_882;
    float _954 = _952 + 1.0;
    float _956 = -_914;
    float _958 = _956 + 1.0;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _964 = fma(_950, _870, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _966 = _898 * _954;
    float _968 = -_898;
    float _970 = _968 + 1.0;
    float _972 = _882 * _958;
    float _974 = 1.0 / _962;
    float _976 = _928 * _970;
    float _978 = -_928;
    float _980 = _978 + 1.0;
    bool _982 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _984 = isnan(_866);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _998 = _940 * _980;
    float _1000 = -_940;
    float _1002 = _1000 + 1.0;
    bool _1004 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1006 = isnan(_866);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1012 = _1008 || _1010;
    float _1014 = float(_1012);
    float _1016 = 1.0 / _996;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1018;
    float _1022 = _992 * _1002;
    float _1024 = -_992;
    float _1026 = _1024 + 1.0;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1030 = _1028 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1032 = _1014 * _1026;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1038 = _1030 * _946;
    float _1040 = _964 * _1032;
    float _1042 = -_1014;
    float _1044 = _1042 + 1.0;
    float _1046 = 1.0 / _1036;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1054 = _866 + _1052;
    float _1056 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1040);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1062 = _1020 * _1016;
    float _1064 = fma(_1038, _1054, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1068 = _866 + _1066;
    float _1070 = 1.0 / _1050;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1076 = fma(_1062, _1068, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1078 = fma(_1064, _1022, _1056);
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1082 = _866 + _1080;
    float _1084 = _1074 * _974;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1086;
    float _1090 = 1.0 / _1060;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1094 = _1092 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1096 = fma(_1076, _998, _1078);
    float _1098 = _1088 * _1046;
    float _1100 = fma(_1084, _1082, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1104 = _866 + _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1106;
    bool _1110 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1112 = isnan(_866);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = _1094 * _1070;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1126 = _866 + _1124;
    float _1128 = fma(_1098, _1104, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1130 = fma(_1100, _976, _1096);
    float _1132 = -_1120;
    float _1134 = _1132 + 1.0;
    float _1136 = fma(_1122, _1126, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1140 = _866 + _1138;
    float _1142 = _1108 * _1090;
    float _1144 = fma(_1128, _966, _1130);
    float _1146 = _914 * _1134;
    float _1148 = fma(_1142, _1140, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1150 = fma(_1136, _972, _1144);
    float _1152 = fma(_1148, _1146, _1150);
    float _1154 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1152);
    out.m_47.x = _1154;
    bool _1156 = !_948;
    if (!_1156)
    {
        float _1158 = in.m_41.x;
        float _1160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1162 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1164 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[14].y, _102);
        float _1166 = _1164 * _1160;
        float _1168 = floor(_1166);
        float _1170 = -_1168;
        float _1172 = _1166 + _1170;
        _124 = _1172;
    }
    float _1174 = _124;
    float _1176 = in.m_41.w;
    float _1178 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1180 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1182 = in.m_35.w;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1186 = _1184 != 0;
    float _1188 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1190 = in.m_41.y;
    float _1192 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1178);
    float _1194 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1180);
    float _1196 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1188);
    float _1198 = in.m_41.z;
    float _1200 = -_140;
    float _1202 = _1200 + 1.0;
    float _1204 = in.m_41.x;
    float _1206 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1224 = _1176 > 0.5;
    float _1226 = 1.0 / _1210;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1230 = -_1182;
    float _1232 = _1230 + 1.0;
    float _1234 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1238 = _1236 != 0;
    float _1240 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1244 = _1242 != 0;
    float _1246 = 1.0 / _1214;
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1250 = _1248 != 0;
    float _1252 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1256 = _1254 != 0;
    float _1258 = in.m_49.x;
    float _1260 = in.m_49.y;
    float _1262 = in.m_49.z;
    bool _1264 = _1190 > 0.5;
    float _1266 = 1.0 / _1218;
    float _1268 = _1182;
    if (_1238)
    {
        float _1270 = _1224 ? _1202 : _140;
        _184 = _1270;
    }
    float _1272 = _184;
    float _1274 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1276 = 1.0 / _1222;
    if (_1256)
    {
        float _1278 = _1264 ? _1232 : _1182;
        _1268 = _1278;
    }
    float _1280 = _1268;
    float _1282 = -_1228;
    float _1284 = fma(_1274, 2.0, _1282);
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1288 = _1286 != 0;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1292 = _1290 != 0;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1296 = _1294 != 0;
    float _1298 = -_102;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1284);
    float _1302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1306 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1262);
    float _1308 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1258);
    float _1310 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1260);
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1320;
    float _1324 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1192);
    float _1326 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1194);
    float _1328 = _1206 * _1306;
    float _1330 = _1198 * 2.0;
    float _1332 = fma(_1252, -2.0, _1304);
    float _1334 = 1.0 / _1322;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1338 = _1174 + _1336;
    float _1340 = _1234 * _1308;
    float _1342 = _1240 * _1310;
    float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1346 = _1174 + _1344;
    float _1348 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1196);
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1352 = _1174 + _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1356 = _1174 + _1354;
    float _1358 = floor(_1330);
    float _1360 = _1346 * _1226;
    float _1362 = _1338 * _1334;
    float _1364 = 1.0 / _1318;
    float _1366 = _1190 + _1198;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1372 = _1366 + (-1.0);
    bool _1374 = _1358 >= 0.0;
    bool _1376 = isnan(_1358);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan(0.0);
    bool _1382 = _1378 || _1380;
    float _1384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1388 = _1174 + _1386;
    float _1390 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1392 = _1204 * 2.0;
    int _1394 = _1382 ? 0 : 1;
    float _1396 = _1388 * _1246;
    bool _1398 = _1358 > 0.0;
    float _1400 = 1.0 / _1314;
    float _1402 = _1356 * _1364;
    float _1404 = _1364;
    float _1406 = _1392;
    if (!_1186)
    {
        _1404 = _1190;
    }
    float _1408 = _1404;
    float _1410 = _1408;
    if (_1186)
    {
        _1410 = _1204;
    }
    float _1412 = _1410;
    float _1414 = floor(_1392);
    float _1416 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1418 = _1174 + _1416;
    float _1420 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1422 = _1418 * _1266;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1426 = _1174 + _1424;
    float _1428 = fma(_1420, _1272, -0.5);
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1432 = _1204 + _1198;
    float _1434 = _1426 * _1276;
    float _1436 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1438 = _1190 * 2.0;
    float _1440 = _1352 * _1400;
    float _1442 = _1400;
    if (!_1186)
    {
        _1442 = _1198;
    }
    float _1444 = _1442;
    float _1446 = fma(_1436, _1280, -0.5);
    float _1448 = _1204 + _1190;
    float _1450 = _1444;
    if (!_1186)
    {
        _1406 = _1198;
    }
    float _1452 = _1406;
    float _1454 = floor(_1438);
    float _1456 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1430);
    float _1458 = _1448 + (-1.0);
    int _1460 = ~_1394;
    int _1462 = _1460 + 1;
    int _1464 = _1462 + 1;
    float _1466 = _1432 + (-1.0);
    int _1468 = _1464;
    float _1470 = _1452;
    if (!_1398)
    {
        int _1472 = ~_1394;
        int _1474 = _1472 + 1;
        _1468 = _1474;
    }
    int _1476 = _1468;
    float _1478 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1456);
    if (_1186)
    {
        _1450 = _1190;
    }
    float _1480 = _1450;
    float _1482 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_1186)
    {
        _1470 = _1190;
    }
    float _1484 = _1470;
    float _1486 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1488 = log2(_1486);
    bool _1490 = _1414 > 0.0;
    float _1492 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1494 = _1414 >= 0.0;
    bool _1496 = isnan(_1414);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan(0.0);
    bool _1502 = _1498 || _1500;
    float _1504 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1332);
    float _1506 = fma(_1492, -2.0, _1368);
    float _1508 = -_1504;
    float _1510 = fma(_1478, _1446, _1508);
    bool _1512 = !_1288;
    int _1514 = _1512 ? 0 : 1;
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1516;
    int _1520 = _1502 ? 0 : 1;
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1524 = _1522 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _1526 = _1454 > 0.0;
    float _1528 = fma(_1518, _1360, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _1530 = _1454 >= 0.0;
    bool _1532 = isnan(_1454);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan(0.0);
    bool _1538 = _1534 || _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1540;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1546 = _1544 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1548 = float(_1476);
    float _1550 = fma(_1542, _1360, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1552 = fma(_1524, _1396, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1554 = fma(_1546, _1396, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1556 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1558;
    float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1562;
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1568 = _1566 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1572 = _1570 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1574 = fma(_1560, _1422, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1576;
    float _1580 = fma(_1564, _1422, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1582;
    float _1586 = fma(_1568, _1434, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1588 = fma(_1572, _1434, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1590 = fma(_1578, _1440, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1592 = fma(_1584, _1440, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1596 = _1594 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1600 = _1598 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1602 = fma(_1596, _1402, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1604 = fma(_1600, _1402, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1606;
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1610;
    float _1614 = _1488 * _102;
    float _1616 = fma(_1608, _1362, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    int _1618 = _1538 ? 0 : 1;
    float _1620 = fma(_1612, _1362, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1622 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1626 = ~_1618;
    int _1628 = _1626 + 1;
    int _1630 = _1628 + 1;
    float _1632 = _1190 + (-0.5);
    float _1634 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1622);
    float _1636 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1624);
    int _1638 = abs(_1514);
    float _1640 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1642 = !_1292;
    int _1644 = _1642 ? 0 : 1;
    float _1646 = -_1370;
    float _1648 = fma(_1640, 2.0, _1646);
    int _1650 = abs(_1644);
    float _1652 = exp2(_1614);
    int _1654 = ~_1520;
    int _1656 = _1654 + 1;
    int _1658 = _1656 + 1;
    float _1660 = float(_1638);
    int _1662 = _1658;
    int _1664 = _1630;
    if (!_1490)
    {
        int _1666 = ~_1520;
        int _1668 = _1666 + 1;
        _1662 = _1668;
    }
    int _1670 = _1662;
    float _1672 = _1660 * _1548;
    float _1674 = float(_1670);
    float _1676 = in.m_51.x;
    float _1678 = in.m_51.y;
    float _1680 = in.m_51.z;
    float _1682 = float(_1650);
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_1526)
    {
        int _1686 = ~_1618;
        int _1688 = _1686 + 1;
        _1664 = _1688;
    }
    int _1690 = _1664;
    float _1692 = _1672 * (-2.0);
    bool _1694 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1696 = isnan(1.0);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1702 = _1698 || _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1706 = 1.0 + _1704;
    float _1708 = _1682 * _1674;
    bool _1710 = !_1296;
    int _1712 = _1710 ? 0 : 1;
    float _1714 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1684);
    float _1716 = 1.0 / _1706;
    float _1718 = -_1652;
    float _1720 = _1718 + 1.0;
    int _1722 = abs(_1712);
    float _1724 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1714);
    bool _1726 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1728 = isnan(0.0);
    bool _1730 = _1726 || _1728;
    bool _1732 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1734 = _1730 || _1732;
    float _1736 = fma(_1556, _1692, _1556);
    float _1738 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1636);
    float _1740 = _1734 ? _1720 : 0.0;
    float _1742 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1634);
    float _1744 = float(_1722);
    float _1746 = _1708 * (-2.0);
    float _1748 = float(_1690);
    float _1750 = -_102;
    float _1752 = fma(_1750, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1648);
    float _1754 = fma(_1692, _1676, _1676);
    float _1756 = _1204 + (-0.5);
    float _1758 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1506);
    float _1760 = _1716;
    if (_1702)
    {
        float _1762 = _1740 * _1716;
        _126 = _1762;
    }
    float _1764 = _126;
    float _1766 = _1744 * _1748;
    float _1768 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1754);
    bool _1770 = _1204 > 0.5;
    bool _1772 = _1770 && _1244;
    float _1774 = fma(_1390, _1746, _1390);
    float _1776 = fma(_1746, _1678, _1678);
    float _1778 = _1766 * (-2.0);
    float _1780 = fma(_1736, _1764, _1768);
    float _1782 = in.m_35.z;
    float _1784 = fma(_1632, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1776);
    float _1786 = fma(_1482, _1778, _1482);
    float _1788 = _1780 * 0.15915493667125701904296875;
    float _1790 = fma(_1778, _1680, _1680);
    bool _1792 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1794 = isnan(_1174);
    bool _1796 = _1792 || _1794;
    bool _1798 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1800 = _1796 || _1798;
    float _1802 = float(_1800);
    float _1804 = _1198 + (-0.5);
    float _1806 = fma(_1774, _1764, _1784);
    bool _1808 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1810 = isnan(_1174);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1816 = _1812 || _1814;
    float _1818 = float(_1816);
    float _1820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1822 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1790);
    float _1824 = -_1802;
    float _1826 = _1824 + 1.0;
    bool _1828 = _1198 > 0.5;
    bool _1830 = _1828 && _1250;
    float _1832 = _1806 * 0.15915493667125701904296875;
    float _1834 = fma(_1786, _1764, _1822);
    bool _1836 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1838 = isnan(_1174);
    bool _1840 = _1836 || _1838;
    bool _1842 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1844 = _1840 || _1842;
    float _1846 = float(_1844);
    float _1848 = _1818 * _1826;
    bool _1850 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1852 = isnan(_1174);
    bool _1854 = _1850 || _1852;
    bool _1856 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1858 = _1854 || _1856;
    float _1860 = float(_1858);
    float _1862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1864 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1866 = isnan(_1174);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1872 = _1868 || _1870;
    float _1874 = float(_1872);
    float _1876 = -_1846;
    float _1878 = _1876 + 1.0;
    bool _1880 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1882 = isnan(_1174);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    float _1892 = -_1860;
    float _1894 = _1892 + 1.0;
    bool _1896 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1898 = isnan(_1174);
    bool _1900 = _1896 || _1898;
    bool _1902 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1904 = _1900 || _1902;
    float _1906 = float(_1904);
    float _1908 = -_1818;
    float _1910 = _1908 + 1.0;
    bool _1912 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1914 = isnan(_1174);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1920 = _1916 || _1918;
    float _1922 = float(_1920);
    float _1924 = _1860 * _1878;
    float _1926 = _1878;
    float _1928 = _1910;
    if (!_1250)
    {
        _1926 = _136;
    }
    float _1930 = _1926;
    float _1932 = _1874 * _1894;
    float _1934 = _1930;
    if (_1830)
    {
        float _1936 = -_136;
        float _1938 = _1936 + 1.0;
        _186 = _1938;
    }
    float _1940 = _186;
    float _1942 = -_1874;
    float _1944 = _1942 + 1.0;
    float _1946 = -_1890;
    float _1948 = _1946 + 1.0;
    float _1950 = -_1906;
    float _1952 = _1950 + 1.0;
    float _1954 = _1834 * 0.15915493667125701904296875;
    float _1956 = _1846 * _1910;
    float _1958 = _1922 * _1944;
    float _1960 = _1906 * _1948;
    float _1962 = _1802 * _1952;
    if (_1244)
    {
        _1760 = _1782;
    }
    float _1964 = _1760;
    float _1966 = _1788 * 6.283185482025146484375;
    float _1968 = sin(_1966);
    float _1970 = _1964;
    if (!_1244)
    {
        _1928 = _1782;
    }
    float _1972 = _1928;
    float _1974 = _1528 * _1958;
    float _1976 = _1972;
    if (_1250)
    {
        _1934 = _1940;
    }
    float _1978 = _1934;
    float _1980 = -_1922;
    float _1982 = _1980 + 1.0;
    float _1984 = _1550 * _1958;
    float _1986 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1988 = _1862 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1990 = _1788 * 6.283185482025146484375;
    float _1992 = cos(_1990);
    float _1994 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1974);
    float _1996 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1984);
    if (_1772)
    {
        float _1998 = -_1964;
        float _2000 = _1998 + 1.0;
        _1970 = _2000;
    }
    float _2002 = _1970;
    float _2004 = fma(_1988, _1978, -0.5);
    float _2006 = fma(_1552, _1932, _1994);
    float _2008 = fma(_1554, _1932, _1996);
    float _2010 = -_1758;
    float _2012 = fma(_1738, _1428, _2010);
    float _2014 = _1832 * 6.283185482025146484375;
    float _2016 = sin(_2014);
    if (_1244)
    {
        _1976 = _2002;
    }
    float _2018 = _1976;
    float _2020 = fma(_1742, _2004, _1752);
    float _2022 = fma(_1574, _1924, _2006);
    float _2024 = fma(_1580, _1924, _2008);
    float _2026 = fma(_1986, _2018, -0.5);
    float _2028 = fma(_1586, _1956, _2022);
    float _2030 = _1832 * 6.283185482025146484375;
    float _2032 = cos(_2030);
    float _2034 = fma(_1588, _1956, _2024);
    float _2036 = fma(_1724, _2026, _1300);
    float _2038 = fma(_1590, _1848, _2028);
    float _2040 = _1510 + 0.5;
    float _2042 = fma(_1592, _1848, _2034);
    float _2044 = _2036 + 0.5;
    float _2046 = fma(_1602, _1962, _2038);
    float _2048 = _1954 * 6.283185482025146484375;
    float _2050 = cos(_2048);
    float _2052 = _1968 * _2016;
    float _2054 = _1992 * _2016;
    float _2056 = fma(_1604, _1962, _2042);
    float _2058 = fma(_1616, _1960, _2046);
    float _2060 = _2020 + 0.5;
    float _2062 = fma(_1620, _1960, _2056);
    float _2064 = _1954 * 6.283185482025146484375;
    float _2066 = sin(_2064);
    float _2068 = _1992 * _2032;
    float _2070 = _1968 * _2032;
    float _2072 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2058);
    float _2074 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2062);
    float _2076 = _2050 * _1342;
    out.m_53.x = _2072;
    out.m_53.y = _2074;
    float _2078 = _1992 * _2076;
    float _2080 = _2016 * _2050;
    float _2082 = _2032 * _2050;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2084 = fma(_2066, _2068, _2052);
    float _2086 = fma(_2066, _2052, _2068);
    float _2088 = fma(_2084, _1340, _2078);
    float _2090 = _2066 * _1342;
    float _2092 = -_2070;
    float _2094 = fma(_2066, _2054, _2092);
    float _2096 = -_2054;
    float _2098 = fma(_2066, _2070, _2096);
    float _2100 = _1968 * _2076;
    float _2102 = -_2090;
    float _2104 = fma(_2082, _1340, _2102);
    float _2106 = fma(_2094, _1328, _2088);
    float _2108 = fma(_2098, _1340, _2100);
    float _2110 = fma(_2080, _1328, _2104);
    float _2112 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2114 = _2012 + 0.5;
    float _2116 = fma(_2086, _1328, _2108);
    float _2118 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2120 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2112);
    float _2122 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_55.x = _2044;
    out.m_55.y = _2040;
    out.m_55.z = _2060;
    out.m_55.w = _2114;
    float _2124 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2118);
    float _2126 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2120);
    float _2128 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2122);
    float _2130 = _1326 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2132 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2124);
    float _2134 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2136 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2128);
    float _2138 = _1324 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2140 = _2132 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2142 = _2130 + _2134;
    float _2144 = _1348 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2146 = _2136 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2148 = _2138 + _2140;
    float _2150 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2152 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2154 = _2144 + _2146;
    float _2156 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2158 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2150);
    float _2160 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2152);
    float _2162 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2164 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2156);
    float _2166 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2158);
    float _2168 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2160);
    float _2170 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2162);
    float _2172 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2164);
    float _2174 = _2166 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2176 = _2168 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2178 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2170);
    float _2180 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2182 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2184 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2186 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2188 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2190 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2182);
    float _2192 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2184);
    float _2194 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2186);
    float _2196 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2188);
    float _2198 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2190);
    float _2200 = _2178 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2202 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2192);
    float _2204 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2194);
    float _2206 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2196);
    float _2208 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2198);
    float _2210 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2202);
    float _2212 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2204);
    float _2214 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2206);
    out.m_57.x = _2148;
    out.m_57.y = _2142;
    out.m_57.z = _2154;
    out.gl_Position.x = _2210;
    out.gl_Position.y = _2208;
    out.gl_Position.z = _2212;
    out.gl_Position.w = _2214;
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
    bool _864 = false;
    bool _636 = false;
    bool _512 = false;
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
        float _2271 = as_type<float>(_90);
        out.gl_Position.z = _2271;
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
        float _2344 = as_type<float>(_134);
        out.gl_Position.z = _2344;
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
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _290 = _286 + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = _286 + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = _286 + _308;
    float _312 = 1.0 / _298;
    bool _314 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _316 = isnan(_286);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    bool _326 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _328 = isnan(_286);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = 1.0 / _302;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _342 = 1.0 / _306;
    float _344 = _294 * _312;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _350;
    float _354 = _290 * _338;
    bool _356 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _358 = isnan(_286);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _368;
    float _372 = -_366;
    float _374 = _372 + 1.0;
    float _376 = fma(_370, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _378 = _310 * _342;
    float _380 = fma(_348, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = fma(_352, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _384 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _386 = isnan(_286);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = _324 * _374;
    float _398 = -_324;
    float _400 = _398 + 1.0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = -_394;
    float _416 = _414 + 1.0;
    float _418 = _394 * _400;
    float _420 = fma(_404, _354, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_408, _354, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = fma(_412, _354, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = _336 * _416;
    float _428 = in.m_37.x;
    float _430 = in.m_37.y;
    float _432 = in.m_37.z;
    float _434 = -_336;
    float _436 = _434 + 1.0;
    float _438 = _380 * _426;
    float _440 = _382 * _426;
    float _442 = _376 * _426;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _444;
    float _448 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[143].x, _438);
    float _450 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[143].y, _440);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _456;
    float _460 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[143].z, _442);
    float _462 = fma(_446, _378, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _464 = fma(_454, _378, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _466 = fma(_458, _378, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _468 = fma(_424, _418, _460);
    float _470 = fma(_422, _418, _450);
    float _472 = fma(_420, _418, _448);
    float _474 = fma(_466, _396, _468);
    float _476 = fma(_464, _396, _470);
    float _478 = fma(_462, _396, _472);
    float _480 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[146].z, _474);
    float _482 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[146].y, _476);
    float _484 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[146].x, _478);
    float _486 = _480 * _432;
    float _488 = _482 * _430;
    float _490 = _484 * _428;
    bool _492 = !_340;
    float _510;
    if (!_492)
    {
        float _494 = in.m_41.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _510 = _508;
        _512 = true;
    }
    else
    {
        _510 = _114;
    }
    _512 = false;
    float _514 = _510;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _518 = _514 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _524 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _526 = isnan(_514);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _540 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _542 = isnan(_514);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _552;
    bool _556 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _558 = isnan(_514);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = 1.0 / _522;
    float _570 = -_534;
    float _572 = _570 + 1.0;
    bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _576 = _550 * _572;
    float _578 = -_550;
    float _580 = _578 + 1.0;
    float _582 = 1.0 / _538;
    float _584 = _554 * _568;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _590 = fma(_584, _518, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _592 = _588 * _582;
    float _594 = _590 * _576;
    float _596 = -_566;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _602 = _514 + _600;
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[115].x, _594);
    float _606 = _534 * _598;
    float _608 = fma(_592, _602, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _610 = fma(_608, _606, _604);
    float _612 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[117].x, _610);
    float _614 = _612 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.w = _614;
    bool _616 = !_574;
    float _634;
    if (!_616)
    {
        float _618 = in.m_41.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        _634 = _114;
    }
    _636 = false;
    float _638 = _634;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _642 = _638 + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _646 = _638 + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _650 = _638 + _648;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _664 = 1.0 / _654;
    bool _666 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _668 = isnan(_638);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = 1.0 / _658;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _682 = 1.0 / _662;
    bool _684 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _686 = isnan(_638);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = _642 * _664;
    bool _698 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _700 = isnan(_638);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -_694;
    float _712 = _710 + 1.0;
    float _714 = _646 * _678;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _716;
    float _720 = -_708;
    float _722 = _720 + 1.0;
    float _724 = _708 * _712;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _730 = fma(_718, _714, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _736 = _650 * _682;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _742;
    float _746 = _676 * _722;
    float _748 = -_676;
    float _750 = _748 + 1.0;
    float _752 = fma(_740, _714, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _754 = fma(_744, _714, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _756 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _758 = isnan(_638);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _764 = _760 || _762;
    float _766 = float(_764);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _772 = fma(_728, _736, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _774 = fma(_734, _736, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _776 = _766 * _750;
    float _778 = fma(_770, _736, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _780 = -_766;
    float _782 = _780 + 1.0;
    float _784 = _730 * _776;
    float _786 = _752 * _776;
    float _788 = _754 * _776;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _790;
    float _794 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[123].x, _784);
    float _796 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[123].y, _786);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _802;
    float _806 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[123].z, _788);
    float _808 = fma(_792, _696, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _810 = fma(_778, _746, _794);
    float _812 = fma(_800, _696, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _814 = fma(_804, _696, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _816 = fma(_772, _746, _796);
    float _818 = fma(_774, _746, _806);
    float _820 = fma(_808, _724, _810);
    float _822 = fma(_812, _724, _816);
    float _824 = fma(_814, _724, _818);
    float _826 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[126].x, _820);
    float _828 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[126].y, _822);
    float _830 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[126].z, _824);
    float _832 = _826 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _834 = _828 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _836 = _830 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _838 = _832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _840 = _834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _842 = _836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _838;
    out.m_45.y = _840;
    out.m_45.z = _842;
    bool _844 = !_680;
    float _862;
    if (!_844)
    {
        float _846 = in.m_41.x;
        float _848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _850 = _846 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _854 = _852 * _848;
        float _856 = floor(_854);
        float _858 = -_856;
        float _860 = _854 + _858;
        _862 = _860;
        _864 = true;
    }
    else
    {
        _862 = _114;
    }
    _864 = false;
    float _866 = _862;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _870 = _866 + _868;
    bool _872 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _874 = isnan(_866);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _886 = _884 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _888 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _890 = isnan(_866);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _900;
    bool _904 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _906 = isnan(_866);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = 1.0 / _886;
    bool _918 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _920 = isnan(_866);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    bool _930 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _932 = isnan(_866);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _946 = 1.0 / _944;
    bool _948 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _950 = _902 * _916;
    float _952 = -_882;
    float _954 = _952 + 1.0;
    float _956 = -_914;
    float _958 = _956 + 1.0;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _964 = fma(_950, _870, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _966 = _898 * _954;
    float _968 = -_898;
    float _970 = _968 + 1.0;
    float _972 = _882 * _958;
    float _974 = 1.0 / _962;
    float _976 = _928 * _970;
    float _978 = -_928;
    float _980 = _978 + 1.0;
    bool _982 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _984 = isnan(_866);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _998 = _940 * _980;
    float _1000 = -_940;
    float _1002 = _1000 + 1.0;
    bool _1004 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1006 = isnan(_866);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1012 = _1008 || _1010;
    float _1014 = float(_1012);
    float _1016 = 1.0 / _996;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1018;
    float _1022 = _992 * _1002;
    float _1024 = -_992;
    float _1026 = _1024 + 1.0;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1030 = _1028 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1032 = _1014 * _1026;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1038 = _1030 * _946;
    float _1040 = _964 * _1032;
    float _1042 = -_1014;
    float _1044 = _1042 + 1.0;
    float _1046 = 1.0 / _1036;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1054 = _866 + _1052;
    float _1056 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1040);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1062 = _1020 * _1016;
    float _1064 = fma(_1038, _1054, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1068 = _866 + _1066;
    float _1070 = 1.0 / _1050;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1076 = fma(_1062, _1068, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1078 = fma(_1064, _1022, _1056);
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1082 = _866 + _1080;
    float _1084 = _1074 * _974;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1086;
    float _1090 = 1.0 / _1060;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1094 = _1092 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1096 = fma(_1076, _998, _1078);
    float _1098 = _1088 * _1046;
    float _1100 = fma(_1084, _1082, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1104 = _866 + _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1106;
    bool _1110 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1112 = isnan(_866);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = _1094 * _1070;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1126 = _866 + _1124;
    float _1128 = fma(_1098, _1104, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1130 = fma(_1100, _976, _1096);
    float _1132 = -_1120;
    float _1134 = _1132 + 1.0;
    float _1136 = fma(_1122, _1126, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1140 = _866 + _1138;
    float _1142 = _1108 * _1090;
    float _1144 = fma(_1128, _966, _1130);
    float _1146 = _914 * _1134;
    float _1148 = fma(_1142, _1140, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1150 = fma(_1136, _972, _1144);
    float _1152 = fma(_1148, _1146, _1150);
    float _1154 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1152);
    out.m_47.x = _1154;
    bool _1156 = !_948;
    if (!_1156)
    {
        float _1158 = in.m_41.x;
        float _1160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1162 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1164 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[14].y, _102);
        float _1166 = _1164 * _1160;
        float _1168 = floor(_1166);
        float _1170 = -_1168;
        float _1172 = _1166 + _1170;
        _124 = _1172;
    }
    float _1174 = _124;
    float _1176 = in.m_41.w;
    float _1178 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1180 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1182 = in.m_35.w;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1186 = _1184 != 0;
    float _1188 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1190 = in.m_41.y;
    float _1192 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1178);
    float _1194 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1180);
    float _1196 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1188);
    float _1198 = in.m_41.z;
    float _1200 = -_140;
    float _1202 = _1200 + 1.0;
    float _1204 = in.m_41.x;
    float _1206 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1224 = _1176 > 0.5;
    float _1226 = 1.0 / _1210;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1230 = -_1182;
    float _1232 = _1230 + 1.0;
    float _1234 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1238 = _1236 != 0;
    float _1240 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1244 = _1242 != 0;
    float _1246 = 1.0 / _1214;
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1250 = _1248 != 0;
    float _1252 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1256 = _1254 != 0;
    float _1258 = in.m_49.x;
    float _1260 = in.m_49.y;
    float _1262 = in.m_49.z;
    bool _1264 = _1190 > 0.5;
    float _1266 = 1.0 / _1218;
    float _1268 = _1182;
    if (_1238)
    {
        float _1270 = _1224 ? _1202 : _140;
        _184 = _1270;
    }
    float _1272 = _184;
    float _1274 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1276 = 1.0 / _1222;
    if (_1256)
    {
        float _1278 = _1264 ? _1232 : _1182;
        _1268 = _1278;
    }
    float _1280 = _1268;
    float _1282 = -_1228;
    float _1284 = fma(_1274, 2.0, _1282);
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1288 = _1286 != 0;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1292 = _1290 != 0;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1296 = _1294 != 0;
    float _1298 = -_102;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1284);
    float _1302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1306 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1262);
    float _1308 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1258);
    float _1310 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1260);
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1320;
    float _1324 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1192);
    float _1326 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1194);
    float _1328 = _1206 * _1306;
    float _1330 = _1198 * 2.0;
    float _1332 = fma(_1252, -2.0, _1304);
    float _1334 = 1.0 / _1322;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1338 = _1174 + _1336;
    float _1340 = _1234 * _1308;
    float _1342 = _1240 * _1310;
    float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1346 = _1174 + _1344;
    float _1348 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1196);
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1352 = _1174 + _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1356 = _1174 + _1354;
    float _1358 = floor(_1330);
    float _1360 = _1346 * _1226;
    float _1362 = _1338 * _1334;
    float _1364 = 1.0 / _1318;
    float _1366 = _1190 + _1198;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1372 = _1366 + (-1.0);
    bool _1374 = _1358 >= 0.0;
    bool _1376 = isnan(_1358);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan(0.0);
    bool _1382 = _1378 || _1380;
    float _1384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1388 = _1174 + _1386;
    float _1390 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1392 = _1204 * 2.0;
    int _1394 = _1382 ? 0 : 1;
    float _1396 = _1388 * _1246;
    bool _1398 = _1358 > 0.0;
    float _1400 = 1.0 / _1314;
    float _1402 = _1356 * _1364;
    float _1404 = _1364;
    float _1406 = _1392;
    if (!_1186)
    {
        _1404 = _1190;
    }
    float _1408 = _1404;
    float _1410 = _1408;
    if (_1186)
    {
        _1410 = _1204;
    }
    float _1412 = _1410;
    float _1414 = floor(_1392);
    float _1416 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1418 = _1174 + _1416;
    float _1420 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1422 = _1418 * _1266;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1426 = _1174 + _1424;
    float _1428 = fma(_1420, _1272, -0.5);
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1432 = _1204 + _1198;
    float _1434 = _1426 * _1276;
    float _1436 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1438 = _1190 * 2.0;
    float _1440 = _1352 * _1400;
    float _1442 = _1400;
    if (!_1186)
    {
        _1442 = _1198;
    }
    float _1444 = _1442;
    float _1446 = fma(_1436, _1280, -0.5);
    float _1448 = _1204 + _1190;
    float _1450 = _1444;
    if (!_1186)
    {
        _1406 = _1198;
    }
    float _1452 = _1406;
    float _1454 = floor(_1438);
    float _1456 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1430);
    float _1458 = _1448 + (-1.0);
    int _1460 = ~_1394;
    int _1462 = _1460 + 1;
    int _1464 = _1462 + 1;
    float _1466 = _1432 + (-1.0);
    int _1468 = _1464;
    float _1470 = _1452;
    if (!_1398)
    {
        int _1472 = ~_1394;
        int _1474 = _1472 + 1;
        _1468 = _1474;
    }
    int _1476 = _1468;
    float _1478 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1456);
    if (_1186)
    {
        _1450 = _1190;
    }
    float _1480 = _1450;
    float _1482 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_1186)
    {
        _1470 = _1190;
    }
    float _1484 = _1470;
    float _1486 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1488 = log2(_1486);
    bool _1490 = _1414 > 0.0;
    float _1492 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1494 = _1414 >= 0.0;
    bool _1496 = isnan(_1414);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan(0.0);
    bool _1502 = _1498 || _1500;
    float _1504 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1332);
    float _1506 = fma(_1492, -2.0, _1368);
    float _1508 = -_1504;
    float _1510 = fma(_1478, _1446, _1508);
    bool _1512 = !_1288;
    int _1514 = _1512 ? 0 : 1;
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1516;
    int _1520 = _1502 ? 0 : 1;
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1524 = _1522 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _1526 = _1454 > 0.0;
    float _1528 = fma(_1518, _1360, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _1530 = _1454 >= 0.0;
    bool _1532 = isnan(_1454);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan(0.0);
    bool _1538 = _1534 || _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1540;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1546 = _1544 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1548 = float(_1476);
    float _1550 = fma(_1542, _1360, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1552 = fma(_1524, _1396, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1554 = fma(_1546, _1396, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1556 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1558;
    float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1562;
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1568 = _1566 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1572 = _1570 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1574 = fma(_1560, _1422, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1576;
    float _1580 = fma(_1564, _1422, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1582;
    float _1586 = fma(_1568, _1434, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1588 = fma(_1572, _1434, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1590 = fma(_1578, _1440, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1592 = fma(_1584, _1440, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1596 = _1594 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1600 = _1598 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1602 = fma(_1596, _1402, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1604 = fma(_1600, _1402, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1606;
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1610;
    float _1614 = _1488 * _102;
    float _1616 = fma(_1608, _1362, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    int _1618 = _1538 ? 0 : 1;
    float _1620 = fma(_1612, _1362, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1622 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1626 = ~_1618;
    int _1628 = _1626 + 1;
    int _1630 = _1628 + 1;
    float _1632 = _1190 + (-0.5);
    float _1634 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1622);
    float _1636 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1624);
    int _1638 = abs(_1514);
    float _1640 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1642 = !_1292;
    int _1644 = _1642 ? 0 : 1;
    float _1646 = -_1370;
    float _1648 = fma(_1640, 2.0, _1646);
    int _1650 = abs(_1644);
    float _1652 = exp2(_1614);
    int _1654 = ~_1520;
    int _1656 = _1654 + 1;
    int _1658 = _1656 + 1;
    float _1660 = float(_1638);
    int _1662 = _1658;
    int _1664 = _1630;
    if (!_1490)
    {
        int _1666 = ~_1520;
        int _1668 = _1666 + 1;
        _1662 = _1668;
    }
    int _1670 = _1662;
    float _1672 = _1660 * _1548;
    float _1674 = float(_1670);
    float _1676 = in.m_51.x;
    float _1678 = in.m_51.y;
    float _1680 = in.m_51.z;
    float _1682 = float(_1650);
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_1526)
    {
        int _1686 = ~_1618;
        int _1688 = _1686 + 1;
        _1664 = _1688;
    }
    int _1690 = _1664;
    float _1692 = _1672 * (-2.0);
    bool _1694 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1696 = isnan(1.0);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1702 = _1698 || _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1706 = 1.0 + _1704;
    float _1708 = _1682 * _1674;
    bool _1710 = !_1296;
    int _1712 = _1710 ? 0 : 1;
    float _1714 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1684);
    float _1716 = 1.0 / _1706;
    float _1718 = -_1652;
    float _1720 = _1718 + 1.0;
    int _1722 = abs(_1712);
    float _1724 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1714);
    bool _1726 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1728 = isnan(0.0);
    bool _1730 = _1726 || _1728;
    bool _1732 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1734 = _1730 || _1732;
    float _1736 = fma(_1556, _1692, _1556);
    float _1738 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1636);
    float _1740 = _1734 ? _1720 : 0.0;
    float _1742 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1634);
    float _1744 = float(_1722);
    float _1746 = _1708 * (-2.0);
    float _1748 = float(_1690);
    float _1750 = -_102;
    float _1752 = fma(_1750, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1648);
    float _1754 = fma(_1692, _1676, _1676);
    float _1756 = _1204 + (-0.5);
    float _1758 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1506);
    float _1760 = _1716;
    if (_1702)
    {
        float _1762 = _1740 * _1716;
        _126 = _1762;
    }
    float _1764 = _126;
    float _1766 = _1744 * _1748;
    float _1768 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1754);
    bool _1770 = _1204 > 0.5;
    bool _1772 = _1770 && _1244;
    float _1774 = fma(_1390, _1746, _1390);
    float _1776 = fma(_1746, _1678, _1678);
    float _1778 = _1766 * (-2.0);
    float _1780 = fma(_1736, _1764, _1768);
    float _1782 = in.m_35.z;
    float _1784 = fma(_1632, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1776);
    float _1786 = fma(_1482, _1778, _1482);
    float _1788 = _1780 * 0.15915493667125701904296875;
    float _1790 = fma(_1778, _1680, _1680);
    bool _1792 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1794 = isnan(_1174);
    bool _1796 = _1792 || _1794;
    bool _1798 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1800 = _1796 || _1798;
    float _1802 = float(_1800);
    float _1804 = _1198 + (-0.5);
    float _1806 = fma(_1774, _1764, _1784);
    bool _1808 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1810 = isnan(_1174);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1816 = _1812 || _1814;
    float _1818 = float(_1816);
    float _1820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1822 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1790);
    float _1824 = -_1802;
    float _1826 = _1824 + 1.0;
    bool _1828 = _1198 > 0.5;
    bool _1830 = _1828 && _1250;
    float _1832 = _1806 * 0.15915493667125701904296875;
    float _1834 = fma(_1786, _1764, _1822);
    bool _1836 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1838 = isnan(_1174);
    bool _1840 = _1836 || _1838;
    bool _1842 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1844 = _1840 || _1842;
    float _1846 = float(_1844);
    float _1848 = _1818 * _1826;
    bool _1850 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1852 = isnan(_1174);
    bool _1854 = _1850 || _1852;
    bool _1856 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1858 = _1854 || _1856;
    float _1860 = float(_1858);
    float _1862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1864 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1866 = isnan(_1174);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1872 = _1868 || _1870;
    float _1874 = float(_1872);
    float _1876 = -_1846;
    float _1878 = _1876 + 1.0;
    bool _1880 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1882 = isnan(_1174);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    float _1892 = -_1860;
    float _1894 = _1892 + 1.0;
    bool _1896 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1898 = isnan(_1174);
    bool _1900 = _1896 || _1898;
    bool _1902 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1904 = _1900 || _1902;
    float _1906 = float(_1904);
    float _1908 = -_1818;
    float _1910 = _1908 + 1.0;
    bool _1912 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1914 = isnan(_1174);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1920 = _1916 || _1918;
    float _1922 = float(_1920);
    float _1924 = _1860 * _1878;
    float _1926 = _1878;
    float _1928 = _1910;
    if (!_1250)
    {
        _1926 = _136;
    }
    float _1930 = _1926;
    float _1932 = _1874 * _1894;
    float _1934 = _1930;
    if (_1830)
    {
        float _1936 = -_136;
        float _1938 = _1936 + 1.0;
        _186 = _1938;
    }
    float _1940 = _186;
    float _1942 = -_1874;
    float _1944 = _1942 + 1.0;
    float _1946 = -_1890;
    float _1948 = _1946 + 1.0;
    float _1950 = -_1906;
    float _1952 = _1950 + 1.0;
    float _1954 = _1834 * 0.15915493667125701904296875;
    float _1956 = _1846 * _1910;
    float _1958 = _1922 * _1944;
    float _1960 = _1906 * _1948;
    float _1962 = _1802 * _1952;
    if (_1244)
    {
        _1760 = _1782;
    }
    float _1964 = _1760;
    float _1966 = _1788 * 6.283185482025146484375;
    float _1968 = sin(_1966);
    float _1970 = _1964;
    if (!_1244)
    {
        _1928 = _1782;
    }
    float _1972 = _1928;
    float _1974 = _1528 * _1958;
    float _1976 = _1972;
    if (_1250)
    {
        _1934 = _1940;
    }
    float _1978 = _1934;
    float _1980 = -_1922;
    float _1982 = _1980 + 1.0;
    float _1984 = _1550 * _1958;
    float _1986 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1988 = _1862 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1990 = _1788 * 6.283185482025146484375;
    float _1992 = cos(_1990);
    float _1994 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1974);
    float _1996 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1984);
    if (_1772)
    {
        float _1998 = -_1964;
        float _2000 = _1998 + 1.0;
        _1970 = _2000;
    }
    float _2002 = _1970;
    float _2004 = fma(_1988, _1978, -0.5);
    float _2006 = fma(_1552, _1932, _1994);
    float _2008 = fma(_1554, _1932, _1996);
    float _2010 = -_1758;
    float _2012 = fma(_1738, _1428, _2010);
    float _2014 = _1832 * 6.283185482025146484375;
    float _2016 = sin(_2014);
    if (_1244)
    {
        _1976 = _2002;
    }
    float _2018 = _1976;
    float _2020 = fma(_1742, _2004, _1752);
    float _2022 = fma(_1574, _1924, _2006);
    float _2024 = fma(_1580, _1924, _2008);
    float _2026 = fma(_1986, _2018, -0.5);
    float _2028 = fma(_1586, _1956, _2022);
    float _2030 = _1832 * 6.283185482025146484375;
    float _2032 = cos(_2030);
    float _2034 = fma(_1588, _1956, _2024);
    float _2036 = fma(_1724, _2026, _1300);
    float _2038 = fma(_1590, _1848, _2028);
    float _2040 = _1510 + 0.5;
    float _2042 = fma(_1592, _1848, _2034);
    float _2044 = _2036 + 0.5;
    float _2046 = fma(_1602, _1962, _2038);
    float _2048 = _1954 * 6.283185482025146484375;
    float _2050 = cos(_2048);
    float _2052 = _1968 * _2016;
    float _2054 = _1992 * _2016;
    float _2056 = fma(_1604, _1962, _2042);
    float _2058 = fma(_1616, _1960, _2046);
    float _2060 = _2020 + 0.5;
    float _2062 = fma(_1620, _1960, _2056);
    float _2064 = _1954 * 6.283185482025146484375;
    float _2066 = sin(_2064);
    float _2068 = _1992 * _2032;
    float _2070 = _1968 * _2032;
    float _2072 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2058);
    float _2074 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2062);
    float _2076 = _2050 * _1342;
    out.m_53.x = _2072;
    out.m_53.y = _2074;
    float _2078 = _1992 * _2076;
    float _2080 = _2016 * _2050;
    float _2082 = _2032 * _2050;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2084 = fma(_2066, _2068, _2052);
    float _2086 = fma(_2066, _2052, _2068);
    float _2088 = fma(_2084, _1340, _2078);
    float _2090 = _2066 * _1342;
    float _2092 = -_2070;
    float _2094 = fma(_2066, _2054, _2092);
    float _2096 = -_2054;
    float _2098 = fma(_2066, _2070, _2096);
    float _2100 = _1968 * _2076;
    float _2102 = -_2090;
    float _2104 = fma(_2082, _1340, _2102);
    float _2106 = fma(_2094, _1328, _2088);
    float _2108 = fma(_2098, _1340, _2100);
    float _2110 = fma(_2080, _1328, _2104);
    float _2112 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2114 = _2012 + 0.5;
    float _2116 = fma(_2086, _1328, _2108);
    float _2118 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2120 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2112);
    float _2122 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_55.x = _2044;
    out.m_55.y = _2040;
    out.m_55.z = _2060;
    out.m_55.w = _2114;
    float _2124 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2118);
    float _2126 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2120);
    float _2128 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2122);
    float _2130 = _1326 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2132 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2124);
    float _2134 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2136 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2128);
    float _2138 = _1324 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2140 = _2132 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2142 = _2130 + _2134;
    float _2144 = _1348 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2146 = _2136 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2148 = _2138 + _2140;
    float _2150 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2152 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2154 = _2144 + _2146;
    float _2156 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2158 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2150);
    float _2160 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2152);
    float _2162 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2164 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2156);
    float _2166 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2158);
    float _2168 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2160);
    float _2170 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2162);
    float _2172 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2164);
    float _2174 = _2166 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2176 = _2168 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2178 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2170);
    float _2180 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2182 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2184 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2186 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2188 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2190 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2182);
    float _2192 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2184);
    float _2194 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2186);
    float _2196 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2188);
    float _2198 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2190);
    float _2200 = _2178 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2202 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2192);
    float _2204 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2194);
    float _2206 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2196);
    float _2208 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2198);
    float _2210 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2202);
    float _2212 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2204);
    float _2214 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2206);
    out.m_57.x = _2148;
    out.m_57.y = _2142;
    out.m_57.z = _2154;
    out.gl_Position.x = _2210;
    out.gl_Position.y = _2208;
    out.gl_Position.z = _2212;
    out.gl_Position.w = _2214;
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
    bool _864 = false;
    bool _636 = false;
    bool _512 = false;
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
        float _2271 = as_type<float>(_90);
        out.gl_Position.z = _2271;
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
        float _2344 = as_type<float>(_134);
        out.gl_Position.z = _2344;
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
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _290 = _286 + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = _286 + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _310 = _286 + _308;
    float _312 = 1.0 / _298;
    bool _314 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _316 = isnan(_286);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    bool _326 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _328 = isnan(_286);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = 1.0 / _302;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _342 = 1.0 / _306;
    float _344 = _294 * _312;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _350;
    float _354 = _290 * _338;
    bool _356 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _358 = isnan(_286);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _368;
    float _372 = -_366;
    float _374 = _372 + 1.0;
    float _376 = fma(_370, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _378 = _310 * _342;
    float _380 = fma(_348, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = fma(_352, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _384 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _386 = isnan(_286);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = _324 * _374;
    float _398 = -_324;
    float _400 = _398 + 1.0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = -_394;
    float _416 = _414 + 1.0;
    float _418 = _394 * _400;
    float _420 = fma(_404, _354, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_408, _354, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = fma(_412, _354, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = _336 * _416;
    float _428 = in.m_37.x;
    float _430 = in.m_37.y;
    float _432 = in.m_37.z;
    float _434 = -_336;
    float _436 = _434 + 1.0;
    float _438 = _380 * _426;
    float _440 = _382 * _426;
    float _442 = _376 * _426;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _444;
    float _448 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[143].x, _438);
    float _450 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[143].y, _440);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _456;
    float _460 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[143].z, _442);
    float _462 = fma(_446, _378, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _464 = fma(_454, _378, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _466 = fma(_458, _378, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _468 = fma(_424, _418, _460);
    float _470 = fma(_422, _418, _450);
    float _472 = fma(_420, _418, _448);
    float _474 = fma(_466, _396, _468);
    float _476 = fma(_464, _396, _470);
    float _478 = fma(_462, _396, _472);
    float _480 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[146].z, _474);
    float _482 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[146].y, _476);
    float _484 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[146].x, _478);
    float _486 = _480 * _432;
    float _488 = _482 * _430;
    float _490 = _484 * _428;
    bool _492 = !_340;
    float _510;
    if (!_492)
    {
        float _494 = in.m_41.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _510 = _508;
        _512 = true;
    }
    else
    {
        _510 = _114;
    }
    _512 = false;
    float _514 = _510;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _518 = _514 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _524 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _526 = isnan(_514);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _540 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _542 = isnan(_514);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _552;
    bool _556 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _558 = isnan(_514);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = 1.0 / _522;
    float _570 = -_534;
    float _572 = _570 + 1.0;
    bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _576 = _550 * _572;
    float _578 = -_550;
    float _580 = _578 + 1.0;
    float _582 = 1.0 / _538;
    float _584 = _554 * _568;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _590 = fma(_584, _518, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _592 = _588 * _582;
    float _594 = _590 * _576;
    float _596 = -_566;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _602 = _514 + _600;
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[115].x, _594);
    float _606 = _534 * _598;
    float _608 = fma(_592, _602, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _610 = fma(_608, _606, _604);
    float _612 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[117].x, _610);
    float _614 = _612 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.w = _614;
    bool _616 = !_574;
    float _634;
    if (!_616)
    {
        float _618 = in.m_41.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        _634 = _114;
    }
    _636 = false;
    float _638 = _634;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _642 = _638 + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _646 = _638 + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _650 = _638 + _648;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _664 = 1.0 / _654;
    bool _666 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _668 = isnan(_638);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = 1.0 / _658;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _682 = 1.0 / _662;
    bool _684 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _686 = isnan(_638);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = _642 * _664;
    bool _698 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _700 = isnan(_638);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -_694;
    float _712 = _710 + 1.0;
    float _714 = _646 * _678;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _716;
    float _720 = -_708;
    float _722 = _720 + 1.0;
    float _724 = _708 * _712;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _730 = fma(_718, _714, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _736 = _650 * _682;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _742;
    float _746 = _676 * _722;
    float _748 = -_676;
    float _750 = _748 + 1.0;
    float _752 = fma(_740, _714, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _754 = fma(_744, _714, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _756 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _758 = isnan(_638);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _764 = _760 || _762;
    float _766 = float(_764);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _772 = fma(_728, _736, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _774 = fma(_734, _736, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _776 = _766 * _750;
    float _778 = fma(_770, _736, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _780 = -_766;
    float _782 = _780 + 1.0;
    float _784 = _730 * _776;
    float _786 = _752 * _776;
    float _788 = _754 * _776;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _790;
    float _794 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[123].x, _784);
    float _796 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[123].y, _786);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _802;
    float _806 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[123].z, _788);
    float _808 = fma(_792, _696, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _810 = fma(_778, _746, _794);
    float _812 = fma(_800, _696, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _814 = fma(_804, _696, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _816 = fma(_772, _746, _796);
    float _818 = fma(_774, _746, _806);
    float _820 = fma(_808, _724, _810);
    float _822 = fma(_812, _724, _816);
    float _824 = fma(_814, _724, _818);
    float _826 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[126].x, _820);
    float _828 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[126].y, _822);
    float _830 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[126].z, _824);
    float _832 = _826 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _834 = _828 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _836 = _830 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _838 = _832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _840 = _834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _842 = _836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _838;
    out.m_45.y = _840;
    out.m_45.z = _842;
    bool _844 = !_680;
    float _862;
    if (!_844)
    {
        float _846 = in.m_41.x;
        float _848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _850 = _846 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _854 = _852 * _848;
        float _856 = floor(_854);
        float _858 = -_856;
        float _860 = _854 + _858;
        _862 = _860;
        _864 = true;
    }
    else
    {
        _862 = _114;
    }
    _864 = false;
    float _866 = _862;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _870 = _866 + _868;
    bool _872 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _874 = isnan(_866);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _886 = _884 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _888 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _890 = isnan(_866);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _900;
    bool _904 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _906 = isnan(_866);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = 1.0 / _886;
    bool _918 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _920 = isnan(_866);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    bool _930 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _932 = isnan(_866);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _946 = 1.0 / _944;
    bool _948 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _950 = _902 * _916;
    float _952 = -_882;
    float _954 = _952 + 1.0;
    float _956 = -_914;
    float _958 = _956 + 1.0;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _964 = fma(_950, _870, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _966 = _898 * _954;
    float _968 = -_898;
    float _970 = _968 + 1.0;
    float _972 = _882 * _958;
    float _974 = 1.0 / _962;
    float _976 = _928 * _970;
    float _978 = -_928;
    float _980 = _978 + 1.0;
    bool _982 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _984 = isnan(_866);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _998 = _940 * _980;
    float _1000 = -_940;
    float _1002 = _1000 + 1.0;
    bool _1004 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1006 = isnan(_866);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1012 = _1008 || _1010;
    float _1014 = float(_1012);
    float _1016 = 1.0 / _996;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1018;
    float _1022 = _992 * _1002;
    float _1024 = -_992;
    float _1026 = _1024 + 1.0;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1030 = _1028 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1032 = _1014 * _1026;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1038 = _1030 * _946;
    float _1040 = _964 * _1032;
    float _1042 = -_1014;
    float _1044 = _1042 + 1.0;
    float _1046 = 1.0 / _1036;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1054 = _866 + _1052;
    float _1056 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1040);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1062 = _1020 * _1016;
    float _1064 = fma(_1038, _1054, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1068 = _866 + _1066;
    float _1070 = 1.0 / _1050;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1076 = fma(_1062, _1068, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1078 = fma(_1064, _1022, _1056);
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1082 = _866 + _1080;
    float _1084 = _1074 * _974;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1086;
    float _1090 = 1.0 / _1060;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1094 = _1092 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1096 = fma(_1076, _998, _1078);
    float _1098 = _1088 * _1046;
    float _1100 = fma(_1084, _1082, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1104 = _866 + _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1106;
    bool _1110 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1112 = isnan(_866);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = _1094 * _1070;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1126 = _866 + _1124;
    float _1128 = fma(_1098, _1104, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1130 = fma(_1100, _976, _1096);
    float _1132 = -_1120;
    float _1134 = _1132 + 1.0;
    float _1136 = fma(_1122, _1126, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1140 = _866 + _1138;
    float _1142 = _1108 * _1090;
    float _1144 = fma(_1128, _966, _1130);
    float _1146 = _914 * _1134;
    float _1148 = fma(_1142, _1140, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1150 = fma(_1136, _972, _1144);
    float _1152 = fma(_1148, _1146, _1150);
    float _1154 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1152);
    out.m_47.x = _1154;
    bool _1156 = !_948;
    if (!_1156)
    {
        float _1158 = in.m_41.x;
        float _1160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1162 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1164 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[14].y, _102);
        float _1166 = _1164 * _1160;
        float _1168 = floor(_1166);
        float _1170 = -_1168;
        float _1172 = _1166 + _1170;
        _124 = _1172;
    }
    float _1174 = _124;
    float _1176 = in.m_41.w;
    float _1178 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1180 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1182 = in.m_35.w;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1186 = _1184 != 0;
    float _1188 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1190 = in.m_41.y;
    float _1192 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1178);
    float _1194 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1180);
    float _1196 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1188);
    float _1198 = in.m_41.z;
    float _1200 = -_140;
    float _1202 = _1200 + 1.0;
    float _1204 = in.m_41.x;
    float _1206 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1224 = _1176 > 0.5;
    float _1226 = 1.0 / _1210;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1230 = -_1182;
    float _1232 = _1230 + 1.0;
    float _1234 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1238 = _1236 != 0;
    float _1240 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1244 = _1242 != 0;
    float _1246 = 1.0 / _1214;
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1250 = _1248 != 0;
    float _1252 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1256 = _1254 != 0;
    float _1258 = in.m_49.x;
    float _1260 = in.m_49.y;
    float _1262 = in.m_49.z;
    bool _1264 = _1190 > 0.5;
    float _1266 = 1.0 / _1218;
    float _1268 = _1182;
    if (_1238)
    {
        float _1270 = _1224 ? _1202 : _140;
        _184 = _1270;
    }
    float _1272 = _184;
    float _1274 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1276 = 1.0 / _1222;
    if (_1256)
    {
        float _1278 = _1264 ? _1232 : _1182;
        _1268 = _1278;
    }
    float _1280 = _1268;
    float _1282 = -_1228;
    float _1284 = fma(_1274, 2.0, _1282);
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1288 = _1286 != 0;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1292 = _1290 != 0;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1296 = _1294 != 0;
    float _1298 = -_102;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1284);
    float _1302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1306 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1262);
    float _1308 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1258);
    float _1310 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1260);
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1320;
    float _1324 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1192);
    float _1326 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1194);
    float _1328 = _1206 * _1306;
    float _1330 = _1198 * 2.0;
    float _1332 = fma(_1252, -2.0, _1304);
    float _1334 = 1.0 / _1322;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1338 = _1174 + _1336;
    float _1340 = _1234 * _1308;
    float _1342 = _1240 * _1310;
    float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1346 = _1174 + _1344;
    float _1348 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1196);
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1352 = _1174 + _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1356 = _1174 + _1354;
    float _1358 = floor(_1330);
    float _1360 = _1346 * _1226;
    float _1362 = _1338 * _1334;
    float _1364 = 1.0 / _1318;
    float _1366 = _1190 + _1198;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1372 = _1366 + (-1.0);
    bool _1374 = _1358 >= 0.0;
    bool _1376 = isnan(_1358);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan(0.0);
    bool _1382 = _1378 || _1380;
    float _1384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1388 = _1174 + _1386;
    float _1390 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1392 = _1204 * 2.0;
    int _1394 = _1382 ? 0 : 1;
    float _1396 = _1388 * _1246;
    bool _1398 = _1358 > 0.0;
    float _1400 = 1.0 / _1314;
    float _1402 = _1356 * _1364;
    float _1404 = _1364;
    float _1406 = _1392;
    if (!_1186)
    {
        _1404 = _1190;
    }
    float _1408 = _1404;
    float _1410 = _1408;
    if (_1186)
    {
        _1410 = _1204;
    }
    float _1412 = _1410;
    float _1414 = floor(_1392);
    float _1416 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1418 = _1174 + _1416;
    float _1420 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1422 = _1418 * _1266;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1426 = _1174 + _1424;
    float _1428 = fma(_1420, _1272, -0.5);
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1432 = _1204 + _1198;
    float _1434 = _1426 * _1276;
    float _1436 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1438 = _1190 * 2.0;
    float _1440 = _1352 * _1400;
    float _1442 = _1400;
    if (!_1186)
    {
        _1442 = _1198;
    }
    float _1444 = _1442;
    float _1446 = fma(_1436, _1280, -0.5);
    float _1448 = _1204 + _1190;
    float _1450 = _1444;
    if (!_1186)
    {
        _1406 = _1198;
    }
    float _1452 = _1406;
    float _1454 = floor(_1438);
    float _1456 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1430);
    float _1458 = _1448 + (-1.0);
    int _1460 = ~_1394;
    int _1462 = _1460 + 1;
    int _1464 = _1462 + 1;
    float _1466 = _1432 + (-1.0);
    int _1468 = _1464;
    float _1470 = _1452;
    if (!_1398)
    {
        int _1472 = ~_1394;
        int _1474 = _1472 + 1;
        _1468 = _1474;
    }
    int _1476 = _1468;
    float _1478 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1456);
    if (_1186)
    {
        _1450 = _1190;
    }
    float _1480 = _1450;
    float _1482 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (_1186)
    {
        _1470 = _1190;
    }
    float _1484 = _1470;
    float _1486 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1488 = log2(_1486);
    bool _1490 = _1414 > 0.0;
    float _1492 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1494 = _1414 >= 0.0;
    bool _1496 = isnan(_1414);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan(0.0);
    bool _1502 = _1498 || _1500;
    float _1504 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1332);
    float _1506 = fma(_1492, -2.0, _1368);
    float _1508 = -_1504;
    float _1510 = fma(_1478, _1446, _1508);
    bool _1512 = !_1288;
    int _1514 = _1512 ? 0 : 1;
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1516;
    int _1520 = _1502 ? 0 : 1;
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1524 = _1522 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _1526 = _1454 > 0.0;
    float _1528 = fma(_1518, _1360, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _1530 = _1454 >= 0.0;
    bool _1532 = isnan(_1454);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan(0.0);
    bool _1538 = _1534 || _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1540;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1546 = _1544 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1548 = float(_1476);
    float _1550 = fma(_1542, _1360, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1552 = fma(_1524, _1396, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1554 = fma(_1546, _1396, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1556 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1558;
    float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1562;
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1568 = _1566 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1572 = _1570 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1574 = fma(_1560, _1422, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1576;
    float _1580 = fma(_1564, _1422, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1582 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _1582;
    float _1586 = fma(_1568, _1434, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1588 = fma(_1572, _1434, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1590 = fma(_1578, _1440, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1592 = fma(_1584, _1440, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1596 = _1594 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _1600 = _1598 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1602 = fma(_1596, _1402, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1604 = fma(_1600, _1402, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1606;
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _1610;
    float _1614 = _1488 * _102;
    float _1616 = fma(_1608, _1362, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    int _1618 = _1538 ? 0 : 1;
    float _1620 = fma(_1612, _1362, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _1622 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1626 = ~_1618;
    int _1628 = _1626 + 1;
    int _1630 = _1628 + 1;
    float _1632 = _1190 + (-0.5);
    float _1634 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1622);
    float _1636 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1624);
    int _1638 = abs(_1514);
    float _1640 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1642 = !_1292;
    int _1644 = _1642 ? 0 : 1;
    float _1646 = -_1370;
    float _1648 = fma(_1640, 2.0, _1646);
    int _1650 = abs(_1644);
    float _1652 = exp2(_1614);
    int _1654 = ~_1520;
    int _1656 = _1654 + 1;
    int _1658 = _1656 + 1;
    float _1660 = float(_1638);
    int _1662 = _1658;
    int _1664 = _1630;
    if (!_1490)
    {
        int _1666 = ~_1520;
        int _1668 = _1666 + 1;
        _1662 = _1668;
    }
    int _1670 = _1662;
    float _1672 = _1660 * _1548;
    float _1674 = float(_1670);
    float _1676 = in.m_51.x;
    float _1678 = in.m_51.y;
    float _1680 = in.m_51.z;
    float _1682 = float(_1650);
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_1526)
    {
        int _1686 = ~_1618;
        int _1688 = _1686 + 1;
        _1664 = _1688;
    }
    int _1690 = _1664;
    float _1692 = _1672 * (-2.0);
    bool _1694 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1696 = isnan(1.0);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1702 = _1698 || _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1706 = 1.0 + _1704;
    float _1708 = _1682 * _1674;
    bool _1710 = !_1296;
    int _1712 = _1710 ? 0 : 1;
    float _1714 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1684);
    float _1716 = 1.0 / _1706;
    float _1718 = -_1652;
    float _1720 = _1718 + 1.0;
    int _1722 = abs(_1712);
    float _1724 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1714);
    bool _1726 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1728 = isnan(0.0);
    bool _1730 = _1726 || _1728;
    bool _1732 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1734 = _1730 || _1732;
    float _1736 = fma(_1556, _1692, _1556);
    float _1738 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1636);
    float _1740 = _1734 ? _1720 : 0.0;
    float _1742 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1634);
    float _1744 = float(_1722);
    float _1746 = _1708 * (-2.0);
    float _1748 = float(_1690);
    float _1750 = -_102;
    float _1752 = fma(_1750, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1648);
    float _1754 = fma(_1692, _1676, _1676);
    float _1756 = _1204 + (-0.5);
    float _1758 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1506);
    float _1760 = _1716;
    if (_1702)
    {
        float _1762 = _1740 * _1716;
        _126 = _1762;
    }
    float _1764 = _126;
    float _1766 = _1744 * _1748;
    float _1768 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1754);
    bool _1770 = _1204 > 0.5;
    bool _1772 = _1770 && _1244;
    float _1774 = fma(_1390, _1746, _1390);
    float _1776 = fma(_1746, _1678, _1678);
    float _1778 = _1766 * (-2.0);
    float _1780 = fma(_1736, _1764, _1768);
    float _1782 = in.m_35.z;
    float _1784 = fma(_1632, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1776);
    float _1786 = fma(_1482, _1778, _1482);
    float _1788 = _1780 * 0.15915493667125701904296875;
    float _1790 = fma(_1778, _1680, _1680);
    bool _1792 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1794 = isnan(_1174);
    bool _1796 = _1792 || _1794;
    bool _1798 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1800 = _1796 || _1798;
    float _1802 = float(_1800);
    float _1804 = _1198 + (-0.5);
    float _1806 = fma(_1774, _1764, _1784);
    bool _1808 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1810 = isnan(_1174);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1816 = _1812 || _1814;
    float _1818 = float(_1816);
    float _1820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1822 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1790);
    float _1824 = -_1802;
    float _1826 = _1824 + 1.0;
    bool _1828 = _1198 > 0.5;
    bool _1830 = _1828 && _1250;
    float _1832 = _1806 * 0.15915493667125701904296875;
    float _1834 = fma(_1786, _1764, _1822);
    bool _1836 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1838 = isnan(_1174);
    bool _1840 = _1836 || _1838;
    bool _1842 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1844 = _1840 || _1842;
    float _1846 = float(_1844);
    float _1848 = _1818 * _1826;
    bool _1850 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1852 = isnan(_1174);
    bool _1854 = _1850 || _1852;
    bool _1856 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1858 = _1854 || _1856;
    float _1860 = float(_1858);
    float _1862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1864 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1866 = isnan(_1174);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1872 = _1868 || _1870;
    float _1874 = float(_1872);
    float _1876 = -_1846;
    float _1878 = _1876 + 1.0;
    bool _1880 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1882 = isnan(_1174);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    float _1892 = -_1860;
    float _1894 = _1892 + 1.0;
    bool _1896 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1898 = isnan(_1174);
    bool _1900 = _1896 || _1898;
    bool _1902 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1904 = _1900 || _1902;
    float _1906 = float(_1904);
    float _1908 = -_1818;
    float _1910 = _1908 + 1.0;
    bool _1912 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1914 = isnan(_1174);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1920 = _1916 || _1918;
    float _1922 = float(_1920);
    float _1924 = _1860 * _1878;
    float _1926 = _1878;
    float _1928 = _1910;
    if (!_1250)
    {
        _1926 = _136;
    }
    float _1930 = _1926;
    float _1932 = _1874 * _1894;
    float _1934 = _1930;
    if (_1830)
    {
        float _1936 = -_136;
        float _1938 = _1936 + 1.0;
        _186 = _1938;
    }
    float _1940 = _186;
    float _1942 = -_1874;
    float _1944 = _1942 + 1.0;
    float _1946 = -_1890;
    float _1948 = _1946 + 1.0;
    float _1950 = -_1906;
    float _1952 = _1950 + 1.0;
    float _1954 = _1834 * 0.15915493667125701904296875;
    float _1956 = _1846 * _1910;
    float _1958 = _1922 * _1944;
    float _1960 = _1906 * _1948;
    float _1962 = _1802 * _1952;
    if (_1244)
    {
        _1760 = _1782;
    }
    float _1964 = _1760;
    float _1966 = _1788 * 6.283185482025146484375;
    float _1968 = sin(_1966);
    float _1970 = _1964;
    if (!_1244)
    {
        _1928 = _1782;
    }
    float _1972 = _1928;
    float _1974 = _1528 * _1958;
    float _1976 = _1972;
    if (_1250)
    {
        _1934 = _1940;
    }
    float _1978 = _1934;
    float _1980 = -_1922;
    float _1982 = _1980 + 1.0;
    float _1984 = _1550 * _1958;
    float _1986 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1988 = _1862 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1990 = _1788 * 6.283185482025146484375;
    float _1992 = cos(_1990);
    float _1994 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1974);
    float _1996 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1984);
    if (_1772)
    {
        float _1998 = -_1964;
        float _2000 = _1998 + 1.0;
        _1970 = _2000;
    }
    float _2002 = _1970;
    float _2004 = fma(_1988, _1978, -0.5);
    float _2006 = fma(_1552, _1932, _1994);
    float _2008 = fma(_1554, _1932, _1996);
    float _2010 = -_1758;
    float _2012 = fma(_1738, _1428, _2010);
    float _2014 = _1832 * 6.283185482025146484375;
    float _2016 = sin(_2014);
    if (_1244)
    {
        _1976 = _2002;
    }
    float _2018 = _1976;
    float _2020 = fma(_1742, _2004, _1752);
    float _2022 = fma(_1574, _1924, _2006);
    float _2024 = fma(_1580, _1924, _2008);
    float _2026 = fma(_1986, _2018, -0.5);
    float _2028 = fma(_1586, _1956, _2022);
    float _2030 = _1832 * 6.283185482025146484375;
    float _2032 = cos(_2030);
    float _2034 = fma(_1588, _1956, _2024);
    float _2036 = fma(_1724, _2026, _1300);
    float _2038 = fma(_1590, _1848, _2028);
    float _2040 = _1510 + 0.5;
    float _2042 = fma(_1592, _1848, _2034);
    float _2044 = _2036 + 0.5;
    float _2046 = fma(_1602, _1962, _2038);
    float _2048 = _1954 * 6.283185482025146484375;
    float _2050 = cos(_2048);
    float _2052 = _1968 * _2016;
    float _2054 = _1992 * _2016;
    float _2056 = fma(_1604, _1962, _2042);
    float _2058 = fma(_1616, _1960, _2046);
    float _2060 = _2020 + 0.5;
    float _2062 = fma(_1620, _1960, _2056);
    float _2064 = _1954 * 6.283185482025146484375;
    float _2066 = sin(_2064);
    float _2068 = _1992 * _2032;
    float _2070 = _1968 * _2032;
    float _2072 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2058);
    float _2074 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2062);
    float _2076 = _2050 * _1342;
    out.m_53.x = _2072;
    out.m_53.y = _2074;
    float _2078 = _1992 * _2076;
    float _2080 = _2016 * _2050;
    float _2082 = _2032 * _2050;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2084 = fma(_2066, _2068, _2052);
    float _2086 = fma(_2066, _2052, _2068);
    float _2088 = fma(_2084, _1340, _2078);
    float _2090 = _2066 * _1342;
    float _2092 = -_2070;
    float _2094 = fma(_2066, _2054, _2092);
    float _2096 = -_2054;
    float _2098 = fma(_2066, _2070, _2096);
    float _2100 = _1968 * _2076;
    float _2102 = -_2090;
    float _2104 = fma(_2082, _1340, _2102);
    float _2106 = fma(_2094, _1328, _2088);
    float _2108 = fma(_2098, _1340, _2100);
    float _2110 = fma(_2080, _1328, _2104);
    float _2112 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2114 = _2012 + 0.5;
    float _2116 = fma(_2086, _1328, _2108);
    float _2118 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2120 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2112);
    float _2122 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_55.x = _2044;
    out.m_55.y = _2040;
    out.m_55.z = _2060;
    out.m_55.w = _2114;
    float _2124 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2118);
    float _2126 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2120);
    float _2128 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2122);
    float _2130 = _1326 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2132 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2124);
    float _2134 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2136 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2128);
    float _2138 = _1324 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2140 = _2132 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2142 = _2130 + _2134;
    float _2144 = _1348 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2146 = _2136 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2148 = _2138 + _2140;
    float _2150 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2152 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2154 = _2144 + _2146;
    float _2156 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2158 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2150);
    float _2160 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2152);
    float _2162 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2164 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2156);
    float _2166 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2158);
    float _2168 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2160);
    float _2170 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2162);
    float _2172 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2164);
    float _2174 = _2166 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2176 = _2168 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2178 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2170);
    float _2180 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2182 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2184 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2186 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2188 = _2174 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2190 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2182);
    float _2192 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2184);
    float _2194 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2186);
    float _2196 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2188);
    float _2198 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2190);
    float _2200 = _2178 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2202 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2192);
    float _2204 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2194);
    float _2206 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2196);
    float _2208 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2198);
    float _2210 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2202);
    float _2212 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2204);
    float _2214 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2206);
    out.m_57.x = _2148;
    out.m_57.y = _2142;
    out.m_57.z = _2154;
    out.gl_Position.x = _2210;
    out.gl_Position.y = _2208;
    out.gl_Position.z = _2212;
    out.gl_Position.w = _2214;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

