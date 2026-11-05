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
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_51 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_35 [[attribute(7)]];
    float4 m_33 [[attribute(8)]];
    float4 m_49 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1358 = false;
    bool _1040 = false;
    bool _722 = false;
    bool _618 = false;
    bool _450 = false;
    bool _270 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_26.w;
    float _69 = trunc(_67);
    int _72 = int(_69);
    bool _76 = _72 >= 1;
    float _78 = 0.0;
    if (!_76)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _80 = _78;
    float _82 = _80;
    if (!_76)
    {
        out.m_29.x = 0.0;
    }
    int _84 = 0;
    if (!_76)
    {
        float _86 = _80 * 5.0;
        _84 = as_type<int>(_86);
    }
    int _88 = _84;
    int _90 = _88;
    if (!_76)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2103 = as_type<float>(_88);
        out.gl_Position.z = _2103;
    }
    if (!_76)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _92 = in.m_31.w;
    bool _94 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_92);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = -_92;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_102)
    {
        float _108 = float(_72);
        _82 = _108;
    }
    float _110 = _82;
    bool _112 = _106 >= _110;
    bool _114 = !_102;
    bool _116 = _112 || _114;
    float _118 = _110;
    if (_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (_116)
    {
        out.m_29.x = 0.0;
    }
    if (_116)
    {
        float _122 = _120 * 5.0;
        _90 = as_type<int>(_122);
    }
    int _124 = _90;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2172 = as_type<float>(_124);
        out.gl_Position.z = _2172;
    }
    if (_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_33.w;
    float _128 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _130 = in.m_35.w;
    bool _132 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _134 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = in.m_31.x;
    float _144 = in.m_31.y;
    float _146 = in.m_31.z;
    float _148 = in.m_26.x;
    float _150 = in.m_26.y;
    float _152 = in.m_26.z;
    float _154 = 0.0;
    float _156 = _128;
    if (!_140)
    {
        float _158 = _128 * _128;
        float _160 = _158 * 0.5;
        _154 = _160;
    }
    float _162 = _154;
    float _164 = _162;
    if (!_140)
    {
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _166;
    }
    float _168 = _164;
    out.m_37.w = _126;
    bool _170 = !_140;
    float _172 = _168;
    if (!_170)
    {
        float _174 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = log2(_174);
        float _178 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _180 = _178 + 1.0;
        float _182 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = _128 * _176;
        float _186 = 1.0 / _180;
        float _188 = _182 * 0.693147182464599609375;
        float _190 = exp2(_184);
        float _192 = 1.0 / _188;
        float _194 = _190 + (-1.0);
        float _196 = -_194;
        float _198 = fma(_196, _192, _128);
        float _200 = _198 * _186;
        float _202 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _202;
    }
    float _204 = _172;
    bool _206 = !_140;
    if (!_206)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = 1.0 / _214;
        float _218 = _128 * _210;
        float _220 = exp2(_218);
        float _222 = -_220;
        float _224 = _222 + 1.0;
        float _226 = _224 * _216;
        _156 = _226;
    }
    float _228 = _156;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _232 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _234 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _236 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _238 = fma(_228, _144, _232);
    float _240 = fma(_228, _142, _234);
    float _242 = fma(_228, _146, _236);
    float _244 = fma(_238, _130, _150);
    float _246 = fma(_240, _130, _148);
    float _248 = fma(_242, _130, _152);
    bool _250 = !_230;
    float _268;
    if (!_250)
    {
        float _252 = in.m_39.x;
        float _254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _256 = _252 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[12].x, _106);
        float _260 = _258 * _254;
        float _262 = floor(_260);
        float _264 = -_262;
        float _266 = _260 + _264;
        _268 = _266;
        _270 = true;
    }
    else
    {
        float _272 = float(_72);
        float _274 = 1.0 / _272;
        float _276 = _106 * _274;
        _268 = _276;
    }
    _270 = false;
    float _278 = _268;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = _278 + _280;
    bool _284 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _286 = isnan(_278);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _278 + _296;
    bool _300 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _302 = isnan(_278);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _320 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _322 = isnan(_278);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_294;
    float _334 = _332 + 1.0;
    float _336 = 1.0 / _318;
    float _338 = _330 * _334;
    float _340 = -_330;
    float _342 = _340 + 1.0;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _344;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _350 = 1.0 / _314;
    float _352 = _310 * _342;
    float _354 = -_310;
    float _356 = _354 + 1.0;
    float _358 = _298 * _336;
    float _360 = _282 * _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _366;
    float _370 = fma(_346, _360, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _372 = fma(_364, _360, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _374 = fma(_368, _360, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _376 = in.m_35.x;
    float _378 = in.m_35.y;
    float _380 = in.m_35.z;
    float _382 = _370 * _352;
    float _384 = _372 * _352;
    float _386 = _374 * _352;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].z, _386);
    float _402 = fma(_390, _358, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _404 = fma(_394, _358, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _406 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].y, _384);
    float _408 = fma(_398, _358, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _410 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].x, _382);
    float _412 = fma(_404, _338, _400);
    float _414 = fma(_402, _338, _406);
    float _416 = fma(_408, _338, _410);
    float _418 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[145].z, _412);
    float _420 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[145].y, _414);
    float _422 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[145].x, _416);
    float _424 = _418 * _380;
    float _426 = _420 * _378;
    float _428 = _422 * _376;
    bool _430 = !_348;
    float _448;
    if (!_430)
    {
        float _432 = in.m_39.x;
        float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _436 = _432 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _438 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _440 = _438 * _434;
        float _442 = floor(_440);
        float _444 = -_442;
        float _446 = _440 + _444;
        _448 = _446;
        _450 = true;
    }
    else
    {
        float _452 = float(_72);
        float _454 = 1.0 / _452;
        float _456 = _106 * _454;
        _448 = _456;
    }
    _450 = false;
    float _458 = _448;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _462 = _458 + _460;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _472 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _474 = isnan(_458);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _488 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _490 = isnan(_458);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = 1.0 / _466;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _502;
    float _506 = -_482;
    float _508 = _506 + 1.0;
    bool _510 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _512 = isnan(_458);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    bool _522 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _524 = 1.0 / _470;
    float _526 = 1.0 / _486;
    float _528 = _504 * _500;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _534 = _498 * _508;
    float _536 = -_498;
    float _538 = _536 + 1.0;
    float _540 = fma(_528, _462, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _542;
    float _546 = _520 * _538;
    float _548 = _532 * _524;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _552 = _458 + _550;
    bool _554 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _556 = isnan(_458);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = _540 * _546;
    float _568 = -_520;
    float _570 = _568 + 1.0;
    float _572 = fma(_548, _552, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _576 = _458 + _574;
    float _578 = _544 * _526;
    float _580 = -_564;
    float _582 = _580 + 1.0;
    float _584 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[115].x, _566);
    float _586 = fma(_578, _576, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _588 = _482 * _582;
    float _590 = fma(_572, _534, _584);
    float _592 = fma(_586, _588, _590);
    float _594 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[118].x, _592);
    float _596 = _594 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.w = _596;
    bool _598 = !_522;
    float _616;
    if (!_598)
    {
        float _600 = in.m_39.x;
        float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _604 = _600 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[11].w, _106);
        float _608 = _606 * _602;
        float _610 = floor(_608);
        float _612 = -_610;
        float _614 = _608 + _612;
        _616 = _614;
        _618 = true;
    }
    else
    {
        float _620 = float(_72);
        float _622 = 1.0 / _620;
        float _624 = _106 * _622;
        _616 = _624;
    }
    _618 = false;
    float _626 = _616;
    bool _628 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _630 = isnan(_626);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _644 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _646 = isnan(_626);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _662 = _626 + _660;
    float _664 = -_638;
    float _666 = _664 + 1.0;
    bool _668 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _670 = 1.0 / _642;
    float _672 = _654 * _666;
    float _674 = -_654;
    float _676 = _674 + 1.0;
    float _678 = _658 * _670;
    float _680 = fma(_678, _662, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _682 = _680 * _672;
    float _684 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[131].x, _682);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _692 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[132].x, _684);
    float _694 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = _692 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_43.x = _694;
    out.m_43.y = _696;
    out.m_43.z = _698;
    out.m_43.w = _700;
    bool _702 = !_668;
    float _720;
    if (!_702)
    {
        float _704 = in.m_39.x;
        float _706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _708 = _704 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[14].x, _106);
        float _712 = _710 * _706;
        float _714 = floor(_712);
        float _716 = -_714;
        float _718 = _712 + _716;
        _720 = _718;
        _722 = true;
    }
    else
    {
        float _724 = float(_72);
        float _726 = 1.0 / _724;
        float _728 = _106 * _726;
        _720 = _728;
    }
    _722 = false;
    float _730 = _720;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _734 = _730 + _732;
    bool _736 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _738 = isnan(_730);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _752 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _754 = isnan(_730);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _764;
    float _768 = 1.0 / _750;
    bool _770 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _772 = isnan(_730);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    bool _782 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _784 = isnan(_730);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _798 = 1.0 / _796;
    float _800 = -_746;
    float _802 = _800 + 1.0;
    bool _804 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _806 = _766 * _768;
    bool _808 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _810 = isnan(_730);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = -_762;
    float _822 = _820 + 1.0;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _828 = fma(_806, _734, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _830 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _832 = isnan(_730);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    float _842 = -_818;
    float _844 = _842 + 1.0;
    float _846 = _818 * _802;
    float _848 = _746 * _822;
    float _850 = _780 * _844;
    float _852 = -_780;
    float _854 = _852 + 1.0;
    float _856 = 1.0 / _826;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _862 = _792 * _854;
    float _864 = -_792;
    float _866 = _864 + 1.0;
    bool _868 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _870 = isnan(_730);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = _840 * _866;
    float _882 = -_840;
    float _884 = _882 + 1.0;
    float _886 = 1.0 / _860;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _892;
    float _896 = _878 * _884;
    float _898 = _890 * _798;
    float _900 = -_878;
    float _902 = _900 + 1.0;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _908 = _828 * _896;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _916 = _730 + _914;
    float _918 = 1.0 / _906;
    float _920 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[159].x, _908);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _926 = fma(_898, _916, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _928 = _894 * _886;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _932 = _730 + _930;
    float _934 = fma(_926, _880, _920);
    float _936 = 1.0 / _912;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _942 = fma(_928, _932, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _944;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _950 = _730 + _948;
    float _952 = _940 * _856;
    float _954 = fma(_942, _862, _934);
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _958 = _730 + _956;
    float _960 = 1.0 / _924;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _966 = _946 * _918;
    float _968 = fma(_952, _950, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _972 = _730 + _970;
    float _974 = fma(_966, _958, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _976 = _964 * _936;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _978;
    bool _982 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _984 = isnan(_730);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = fma(_968, _850, _954);
    float _996 = fma(_976, _972, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1000 = _730 + _998;
    float _1002 = -_992;
    float _1004 = _1002 + 1.0;
    float _1006 = _980 * _960;
    float _1008 = fma(_974, _846, _994);
    float _1010 = _762 * _1004;
    float _1012 = fma(_1006, _1000, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1014 = fma(_996, _848, _1008);
    float _1016 = fma(_1012, _1010, _1014);
    float _1018 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1016);
    out.m_45.x = _1018;
    bool _1020 = !_804;
    float _1038;
    if (!_1020)
    {
        float _1022 = in.m_39.x;
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1026 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[14].y, _106);
        float _1030 = _1028 * _1024;
        float _1032 = floor(_1030);
        float _1034 = -_1032;
        float _1036 = _1030 + _1034;
        _1038 = _1036;
        _1040 = true;
    }
    else
    {
        float _1042 = float(_72);
        float _1044 = 1.0 / _1042;
        float _1046 = _106 * _1044;
        _1038 = _1046;
    }
    _1040 = false;
    float _1048 = _1038;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1052 = _1048 + _1050;
    bool _1054 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1056 = isnan(_1048);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1070 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1072 = isnan(_1048);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1082;
    float _1086 = 1.0 / _1068;
    bool _1088 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1090 = isnan(_1048);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    bool _1100 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1102 = isnan(_1048);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1116 = 1.0 / _1114;
    float _1118 = -_1064;
    float _1120 = _1118 + 1.0;
    bool _1122 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1124 = _1084 * _1086;
    bool _1126 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1128 = isnan(_1048);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = -_1080;
    float _1140 = _1138 + 1.0;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1144 = _1142 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1146 = fma(_1124, _1052, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _1148 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1150 = isnan(_1048);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1156 = _1152 || _1154;
    float _1158 = float(_1156);
    float _1160 = -_1136;
    float _1162 = _1160 + 1.0;
    float _1164 = _1136 * _1120;
    float _1166 = _1064 * _1140;
    float _1168 = _1098 * _1162;
    float _1170 = -_1098;
    float _1172 = _1170 + 1.0;
    float _1174 = 1.0 / _1144;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1178 = _1176 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1180 = _1110 * _1172;
    float _1182 = -_1110;
    float _1184 = _1182 + 1.0;
    bool _1186 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1188 = isnan(_1048);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    float _1198 = _1158 * _1184;
    float _1200 = -_1158;
    float _1202 = _1200 + 1.0;
    float _1204 = 1.0 / _1178;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1210;
    float _1214 = _1196 * _1202;
    float _1216 = _1208 * _1116;
    float _1218 = -_1196;
    float _1220 = _1218 + 1.0;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1224 = _1222 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1226 = _1146 * _1214;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1230 = _1228 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1234 = _1048 + _1232;
    float _1236 = 1.0 / _1224;
    float _1238 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1226);
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1244 = fma(_1216, _1234, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1246 = _1212 * _1204;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1250 = _1048 + _1248;
    float _1252 = fma(_1244, _1198, _1238);
    float _1254 = 1.0 / _1230;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1258 = _1256 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1260 = fma(_1246, _1250, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1262;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1268 = _1048 + _1266;
    float _1270 = _1258 * _1174;
    float _1272 = fma(_1260, _1180, _1252);
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1276 = _1048 + _1274;
    float _1278 = 1.0 / _1242;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1282 = _1280 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1284 = _1264 * _1236;
    float _1286 = fma(_1270, _1268, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1290 = _1048 + _1288;
    float _1292 = fma(_1284, _1276, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1294 = _1282 * _1254;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1296;
    bool _1300 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1302 = isnan(_1048);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    float _1312 = fma(_1286, _1168, _1272);
    float _1314 = fma(_1294, _1290, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1318 = _1048 + _1316;
    float _1320 = -_1310;
    float _1322 = _1320 + 1.0;
    float _1324 = _1298 * _1278;
    float _1326 = fma(_1292, _1164, _1312);
    float _1328 = _1080 * _1322;
    float _1330 = fma(_1324, _1318, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1332 = fma(_1314, _1166, _1326);
    float _1334 = fma(_1330, _1328, _1332);
    float _1336 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1334);
    out.m_47.x = _1336;
    bool _1338 = !_1122;
    float _1356;
    if (!_1338)
    {
        float _1340 = in.m_39.x;
        float _1342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1344 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[14].z, _106);
        float _1348 = _1346 * _1342;
        float _1350 = floor(_1348);
        float _1352 = -_1350;
        float _1354 = _1348 + _1352;
        _1356 = _1354;
        _1358 = true;
    }
    else
    {
        float _1360 = float(_72);
        float _1362 = 1.0 / _1360;
        float _1364 = _106 * _1362;
        _1356 = _1364;
    }
    _1358 = false;
    float _1366 = _1356;
    float _1368 = in.m_39.w;
    float _1370 = _244 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1372 = in.m_39.x;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1376 = _1374 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1378 = in.m_39.y;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1382 = _1380 != 0;
    float _1384 = 1.0 / _1376;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1388 = _1386 != 0;
    float _1390 = _244 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1392 = _244 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1398 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1390);
    float _1400 = 1.0 / _1396;
    float _1402 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1370);
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1406 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1392);
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[170].x;
    if (_1382)
    {
        float _1410 = in.m_39.z;
        _1408 = _1410;
    }
    float _1412 = _1408;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1418 = _1368 > 0.5;
    float _1420 = _426 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1422 = 1.0 / _1416;
    float _1424 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1426 = in.m_33.x;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1430 = _1428 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1432 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1434 = -_1404;
    float _1436 = fma(_1424, 2.0, _1434);
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1440 = _1438 != 0;
    float _1442 = 1.0 / _1430;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1448 = _1446 != 0;
    float _1450 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1398);
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1454 = _1452 != 0;
    float _1456 = fma(_1432, -2.0, _1444);
    float _1458 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1402);
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1460;
    float _1464 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1406);
    float _1466 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1468 = _1466 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1472 = _1470 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1474 = _1462 * _1384;
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1478 = _1476 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1480 = 1.0 / _1468;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1482;
    bool _1486 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1488 = isnan(_1366);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1494 = _1490 || _1492;
    float _1496 = float(_1494);
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1500 = _1498 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1502 = _1484 * _1422;
    bool _1504 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1506 = isnan(_1366);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1512 = _1508 || _1510;
    float _1514 = float(_1512);
    float _1516 = _1478 * _1400;
    float _1518 = 1.0 / _1472;
    bool _1520 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1522 = isnan(_1366);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1528 = _1524 || _1526;
    float _1530 = float(_1528);
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1532;
    bool _1536 = false;
    bool _1538 = _1418;
    float _1540 = _1502;
    if (_1382)
    {
        bool _1542 = _1412 > 0.5;
        _1536 = _1542;
    }
    bool _1544 = _1536;
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1548 = _1546 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    bool _1550 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1552 = isnan(_1366);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1558 = _1554 || _1556;
    float _1560 = float(_1558);
    float _1562 = -_1530;
    float _1564 = _1562 + 1.0;
    bool _1566 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1568 = isnan(_1366);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1574 = _1570 || _1572;
    float _1576 = float(_1574);
    float _1578 = _1534 * _1442;
    float _1580 = in.m_33.y;
    float _1582 = _1496 * _1564;
    float _1584 = -_1496;
    float _1586 = _1584 + 1.0;
    bool _1588 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1590 = isnan(_1366);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1596 = _1592 || _1594;
    float _1598 = float(_1596);
    float _1600 = -_1560;
    float _1602 = _1600 + 1.0;
    float _1604 = _1548 * _1480;
    float _1606 = _1514 * _1586;
    float _1608 = _1500 * _1518;
    float _1610 = -_1514;
    float _1612 = _1610 + 1.0;
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1616 = _1366 + _1614;
    float _1618 = _1598 * _1602;
    float _1620 = _1576 * _1612;
    float _1622 = -_1576;
    float _1624 = _1622 + 1.0;
    float _1626 = fma(_1474, _1616, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    bool _1628 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1630 = isnan(_1366);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1636 = _1632 || _1634;
    float _1638 = float(_1636);
    float _1640 = -_1598;
    float _1642 = _1640 + 1.0;
    float _1644 = _1560 * _1624;
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1648 = _1646 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1650 = _1638 * _1642;
    bool _1652 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1654 = isnan(_1366);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1660 = _1656 || _1658;
    float _1662 = float(_1660);
    float _1664 = -_1638;
    float _1666 = _1664 + 1.0;
    float _1668 = 1.0 / _1648;
    float _1670 = -_1580;
    float _1672 = _1670 + 1.0;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1676 = _1662 * _1666;
    float _1678 = _1666;
    float _1680 = _1580;
    if (!_1388)
    {
        _1678 = _1378;
    }
    float _1682 = _1678;
    float _1684 = -_1662;
    float _1686 = _1684 + 1.0;
    int _1688 = _1418 ? as_type<int>(_1672) : as_type<int>(_1580);
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1692 = _1366 + _1690;
    float _1694 = _1682;
    if (_1440)
    {
        bool _1696 = _1372 > 0.5;
        _1538 = _1696;
    }
    bool _1698 = _1538;
    float _1700 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1674);
    if (_1388)
    {
        _1694 = _1372;
    }
    float _1702 = _1694;
    float _1704 = _1626 * _1676;
    float _1706 = _1372;
    if (!_1388)
    {
        float _1708 = in.m_39.z;
        _1706 = _1708;
    }
    float _1710 = _1706;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1714 = _1366 + _1712;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1718 = _1366 + _1716;
    float _1720 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1704);
    float _1722 = fma(_1604, _1692, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1724 = fma(_1516, _1714, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1728 = fma(_1578, _1718, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1732 = _1366 + _1730;
    float _1734 = fma(_1724, _1650, _1720);
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1738 = _1366 + _1736;
    float _1740 = fma(_1502, _1732, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1742 = fma(_1728, _1618, _1734);
    float _1744 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1744;
    float _1748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1750 = fma(_1722, _1644, _1742);
    float _1752 = fma(_1608, _1738, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1754 = _1746 * _1668;
    float _1756 = _1448 ? as_type<float>(_1688) : _1580;
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1760 = fma(_1740, _1620, _1750);
    float _1762 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1764 = in.m_49.x;
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1768 = _1366 + _1766;
    float _1770 = _1742;
    float _1772 = _1710;
    float _1774 = _1734;
    int _1776 = as_type<int>(_1760);
    if (!_1388)
    {
        _1770 = _1710;
    }
    float _1778 = _1770;
    float _1780 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1758);
    bool _1782 = _1378 > 0.5;
    float _1784 = fma(_1752, _1606, _1760);
    float _1786 = _1778;
    if (_1388)
    {
        _1786 = _1378;
    }
    float _1788 = _1786;
    float _1790 = fma(_1756, _1762, -0.5);
    if (_1388)
    {
        _1772 = _1378;
    }
    float _1792 = _1772;
    float _1794 = fma(_1754, _1768, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1796 = in.m_51.x;
    float _1798 = in.m_51.y;
    float _1800 = in.m_51.z;
    float _1802 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1804 = fma(_1794, _1582, _1784);
    if (_1454)
    {
        float _1806 = _1782 ? _1672 : _1580;
        _1680 = _1806;
    }
    float _1808 = _1680;
    float _1810 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1814 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1456);
    float _1816 = fma(_1802, _1808, -0.5);
    float _1818 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1812);
    float _1820 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1804);
    float _1822 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1780);
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1826 = _1820 * 0.17000000178813934326171875;
    float _1828 = -_1814;
    float _1830 = fma(_1822, _1816, _1828);
    if (!_1440)
    {
        _1774 = _1426;
    }
    float _1832 = _1774;
    float _1834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1836 = _1826 * _1764;
    float _1838 = fma(_1792, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1824);
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1842 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1844 = fma(_1796, _1836, _1796);
    float _1846 = _1832;
    if (!_1440)
    {
        _1540 = _1832;
    }
    float _1848 = _1540;
    float _1850 = fma(_1798, _1836, _1798);
    float _1852 = _1848;
    if (_1440)
    {
        _1846 = _1426;
    }
    float _1854 = _1846;
    float _1856 = fma(_1842, -2.0, _1840);
    float _1858 = fma(_1800, _1836, _1800);
    float _1860 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1844);
    float _1862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1850);
    float _1864 = _1854;
    if (_1440)
    {
        float _1866 = -_1854;
        float _1868 = _1866 + 1.0;
        _1776 = as_type<int>(_1868);
    }
    int _1870 = _1776;
    float _1872 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1858);
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1878 = _1420 * _1862;
    int _1880 = _1870;
    if (_1440)
    {
        float _1882 = _1698 ? as_type<float>(_1870) : _1854;
        _1852 = _1882;
    }
    float _1884 = _1852;
    float _1886 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1888 = _1872 * _1860;
    float _1890 = -_1876;
    float _1892 = fma(_1810, 2.0, _1890);
    float _1894 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1896 = _1878 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1898 = fma(_1886, _1884, -0.5);
    float _1900 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1700);
    float _1902 = -_106;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1436);
    float _1906 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1818);
    float _1908 = -_106;
    float _1910 = fma(_1908, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1892);
    float _1912 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1838);
    float _1914 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1856);
    float _1916 = _1894 * _1874;
    float _1918 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1896);
    float _1920 = _1878 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1922 = _1878 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1924 = _1458 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1926 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1918);
    float _1928 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1920);
    float _1930 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1922);
    float _1932 = _1450 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1934 = _1926 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1936 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1928);
    float _1938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1940 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1930);
    float _1942 = _1924 + _1934;
    float _1944 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1946 = fma(_1900, _1898, _1904);
    float _1948 = _1464 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1950 = _1940 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1952 = _1932 + _1944;
    float _1954 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1956 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1958 = _1948 + _1950;
    if (_1382)
    {
        float _1960 = -_1854;
        float _1962 = _1960 + 1.0;
        _1880 = as_type<int>(_1962);
    }
    int _1964 = _1880;
    float _1966 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1954);
    float _1968 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1970 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1972 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1956);
    float _1974 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1966);
    if (_1382)
    {
        float _1976 = _1544 ? as_type<float>(_1964) : _1854;
        _1864 = _1976;
    }
    float _1978 = _1864;
    float _1980 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1968);
    float _1982 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1970);
    float _1984 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1986 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1972);
    float _1988 = _1974 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1990 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1980);
    float _1992 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1982);
    float _1994 = fma(_1984, _1978, -0.5);
    float _1996 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2000 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2002 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2004 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2006 = fma(_1906, _1994, _1910);
    float _2008 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2010 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1998);
    float _2012 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2000);
    float _2014 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2002);
    float _2016 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2004);
    float _2018 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2010);
    float _2020 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2012);
    float _2022 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2014);
    float _2024 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2026 = -_1914;
    float _2028 = fma(_1912, _1790, _2026);
    float _2030 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2016);
    float _2032 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2018);
    float _2034 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2020);
    float _2036 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2022);
    float _2038 = _1830 + 0.5;
    float _2040 = _1946 + 0.5;
    float _2042 = _2006 + 0.5;
    float _2044 = _2028 + 0.5;
    float _2046 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2030);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_53.x = _2040;
    out.m_53.y = _2038;
    out.m_53.z = _2042;
    out.m_53.w = _2044;
    out.gl_Position.x = _2032;
    out.gl_Position.y = _2034;
    out.gl_Position.z = _2036;
    out.gl_Position.w = _2046;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1358 = false;
    bool _1040 = false;
    bool _722 = false;
    bool _618 = false;
    bool _450 = false;
    bool _270 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_26.w;
    float _69 = trunc(_67);
    int _72 = int(_69);
    bool _76 = _72 >= 1;
    float _78 = 0.0;
    if (!_76)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _80 = _78;
    float _82 = _80;
    if (!_76)
    {
        out.m_29.x = 0.0;
    }
    int _84 = 0;
    if (!_76)
    {
        float _86 = _80 * 5.0;
        _84 = as_type<int>(_86);
    }
    int _88 = _84;
    int _90 = _88;
    if (!_76)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2103 = as_type<float>(_88);
        out.gl_Position.z = _2103;
    }
    if (!_76)
    {
        return out;
    }
    float _92 = in.m_31.w;
    bool _94 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_92);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = -_92;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_102)
    {
        float _108 = float(_72);
        _82 = _108;
    }
    float _110 = _82;
    bool _112 = _106 >= _110;
    bool _114 = !_102;
    bool _116 = _112 || _114;
    float _118 = _110;
    if (_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (_116)
    {
        out.m_29.x = 0.0;
    }
    if (_116)
    {
        float _122 = _120 * 5.0;
        _90 = as_type<int>(_122);
    }
    int _124 = _90;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2172 = as_type<float>(_124);
        out.gl_Position.z = _2172;
    }
    if (_116)
    {
        return out;
    }
    float _126 = in.m_33.w;
    float _128 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _130 = in.m_35.w;
    bool _132 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _134 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = in.m_31.x;
    float _144 = in.m_31.y;
    float _146 = in.m_31.z;
    float _148 = in.m_26.x;
    float _150 = in.m_26.y;
    float _152 = in.m_26.z;
    float _154 = 0.0;
    float _156 = _128;
    if (!_140)
    {
        float _158 = _128 * _128;
        float _160 = _158 * 0.5;
        _154 = _160;
    }
    float _162 = _154;
    float _164 = _162;
    if (!_140)
    {
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _166;
    }
    float _168 = _164;
    out.m_37.w = _126;
    bool _170 = !_140;
    float _172 = _168;
    if (!_170)
    {
        float _174 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = log2(_174);
        float _178 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _180 = _178 + 1.0;
        float _182 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = _128 * _176;
        float _186 = 1.0 / _180;
        float _188 = _182 * 0.693147182464599609375;
        float _190 = exp2(_184);
        float _192 = 1.0 / _188;
        float _194 = _190 + (-1.0);
        float _196 = -_194;
        float _198 = fma(_196, _192, _128);
        float _200 = _198 * _186;
        float _202 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _202;
    }
    float _204 = _172;
    bool _206 = !_140;
    if (!_206)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = 1.0 / _214;
        float _218 = _128 * _210;
        float _220 = exp2(_218);
        float _222 = -_220;
        float _224 = _222 + 1.0;
        float _226 = _224 * _216;
        _156 = _226;
    }
    float _228 = _156;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _232 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _234 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _236 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _238 = fma(_228, _144, _232);
    float _240 = fma(_228, _142, _234);
    float _242 = fma(_228, _146, _236);
    float _244 = fma(_238, _130, _150);
    float _246 = fma(_240, _130, _148);
    float _248 = fma(_242, _130, _152);
    bool _250 = !_230;
    float _268;
    if (!_250)
    {
        float _252 = in.m_39.x;
        float _254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _256 = _252 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[12].x, _106);
        float _260 = _258 * _254;
        float _262 = floor(_260);
        float _264 = -_262;
        float _266 = _260 + _264;
        _268 = _266;
        _270 = true;
    }
    else
    {
        float _272 = float(_72);
        float _274 = 1.0 / _272;
        float _276 = _106 * _274;
        _268 = _276;
    }
    _270 = false;
    float _278 = _268;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = _278 + _280;
    bool _284 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _286 = isnan(_278);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _278 + _296;
    bool _300 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _302 = isnan(_278);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _320 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _322 = isnan(_278);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_294;
    float _334 = _332 + 1.0;
    float _336 = 1.0 / _318;
    float _338 = _330 * _334;
    float _340 = -_330;
    float _342 = _340 + 1.0;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _344;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _350 = 1.0 / _314;
    float _352 = _310 * _342;
    float _354 = -_310;
    float _356 = _354 + 1.0;
    float _358 = _298 * _336;
    float _360 = _282 * _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _366;
    float _370 = fma(_346, _360, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _372 = fma(_364, _360, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _374 = fma(_368, _360, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _376 = in.m_35.x;
    float _378 = in.m_35.y;
    float _380 = in.m_35.z;
    float _382 = _370 * _352;
    float _384 = _372 * _352;
    float _386 = _374 * _352;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].z, _386);
    float _402 = fma(_390, _358, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _404 = fma(_394, _358, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _406 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].y, _384);
    float _408 = fma(_398, _358, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _410 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].x, _382);
    float _412 = fma(_404, _338, _400);
    float _414 = fma(_402, _338, _406);
    float _416 = fma(_408, _338, _410);
    float _418 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[145].z, _412);
    float _420 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[145].y, _414);
    float _422 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[145].x, _416);
    float _424 = _418 * _380;
    float _426 = _420 * _378;
    float _428 = _422 * _376;
    bool _430 = !_348;
    float _448;
    if (!_430)
    {
        float _432 = in.m_39.x;
        float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _436 = _432 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _438 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _440 = _438 * _434;
        float _442 = floor(_440);
        float _444 = -_442;
        float _446 = _440 + _444;
        _448 = _446;
        _450 = true;
    }
    else
    {
        float _452 = float(_72);
        float _454 = 1.0 / _452;
        float _456 = _106 * _454;
        _448 = _456;
    }
    _450 = false;
    float _458 = _448;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _462 = _458 + _460;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _472 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _474 = isnan(_458);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _488 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _490 = isnan(_458);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = 1.0 / _466;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _502;
    float _506 = -_482;
    float _508 = _506 + 1.0;
    bool _510 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _512 = isnan(_458);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    bool _522 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _524 = 1.0 / _470;
    float _526 = 1.0 / _486;
    float _528 = _504 * _500;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _534 = _498 * _508;
    float _536 = -_498;
    float _538 = _536 + 1.0;
    float _540 = fma(_528, _462, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _542;
    float _546 = _520 * _538;
    float _548 = _532 * _524;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _552 = _458 + _550;
    bool _554 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _556 = isnan(_458);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = _540 * _546;
    float _568 = -_520;
    float _570 = _568 + 1.0;
    float _572 = fma(_548, _552, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _576 = _458 + _574;
    float _578 = _544 * _526;
    float _580 = -_564;
    float _582 = _580 + 1.0;
    float _584 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[115].x, _566);
    float _586 = fma(_578, _576, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _588 = _482 * _582;
    float _590 = fma(_572, _534, _584);
    float _592 = fma(_586, _588, _590);
    float _594 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[118].x, _592);
    float _596 = _594 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.w = _596;
    bool _598 = !_522;
    float _616;
    if (!_598)
    {
        float _600 = in.m_39.x;
        float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _604 = _600 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[11].w, _106);
        float _608 = _606 * _602;
        float _610 = floor(_608);
        float _612 = -_610;
        float _614 = _608 + _612;
        _616 = _614;
        _618 = true;
    }
    else
    {
        float _620 = float(_72);
        float _622 = 1.0 / _620;
        float _624 = _106 * _622;
        _616 = _624;
    }
    _618 = false;
    float _626 = _616;
    bool _628 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _630 = isnan(_626);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _644 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _646 = isnan(_626);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _662 = _626 + _660;
    float _664 = -_638;
    float _666 = _664 + 1.0;
    bool _668 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _670 = 1.0 / _642;
    float _672 = _654 * _666;
    float _674 = -_654;
    float _676 = _674 + 1.0;
    float _678 = _658 * _670;
    float _680 = fma(_678, _662, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _682 = _680 * _672;
    float _684 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[131].x, _682);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _692 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[132].x, _684);
    float _694 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = _692 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_43.x = _694;
    out.m_43.y = _696;
    out.m_43.z = _698;
    out.m_43.w = _700;
    bool _702 = !_668;
    float _720;
    if (!_702)
    {
        float _704 = in.m_39.x;
        float _706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _708 = _704 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[14].x, _106);
        float _712 = _710 * _706;
        float _714 = floor(_712);
        float _716 = -_714;
        float _718 = _712 + _716;
        _720 = _718;
        _722 = true;
    }
    else
    {
        float _724 = float(_72);
        float _726 = 1.0 / _724;
        float _728 = _106 * _726;
        _720 = _728;
    }
    _722 = false;
    float _730 = _720;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _734 = _730 + _732;
    bool _736 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _738 = isnan(_730);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _752 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _754 = isnan(_730);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _764;
    float _768 = 1.0 / _750;
    bool _770 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _772 = isnan(_730);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    bool _782 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _784 = isnan(_730);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _798 = 1.0 / _796;
    float _800 = -_746;
    float _802 = _800 + 1.0;
    bool _804 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _806 = _766 * _768;
    bool _808 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _810 = isnan(_730);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = -_762;
    float _822 = _820 + 1.0;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _828 = fma(_806, _734, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _830 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _832 = isnan(_730);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    float _842 = -_818;
    float _844 = _842 + 1.0;
    float _846 = _818 * _802;
    float _848 = _746 * _822;
    float _850 = _780 * _844;
    float _852 = -_780;
    float _854 = _852 + 1.0;
    float _856 = 1.0 / _826;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _862 = _792 * _854;
    float _864 = -_792;
    float _866 = _864 + 1.0;
    bool _868 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _870 = isnan(_730);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = _840 * _866;
    float _882 = -_840;
    float _884 = _882 + 1.0;
    float _886 = 1.0 / _860;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _892;
    float _896 = _878 * _884;
    float _898 = _890 * _798;
    float _900 = -_878;
    float _902 = _900 + 1.0;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _908 = _828 * _896;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _916 = _730 + _914;
    float _918 = 1.0 / _906;
    float _920 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[159].x, _908);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _926 = fma(_898, _916, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _928 = _894 * _886;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _932 = _730 + _930;
    float _934 = fma(_926, _880, _920);
    float _936 = 1.0 / _912;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _942 = fma(_928, _932, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _944;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _950 = _730 + _948;
    float _952 = _940 * _856;
    float _954 = fma(_942, _862, _934);
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _958 = _730 + _956;
    float _960 = 1.0 / _924;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _966 = _946 * _918;
    float _968 = fma(_952, _950, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _972 = _730 + _970;
    float _974 = fma(_966, _958, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _976 = _964 * _936;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _978;
    bool _982 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _984 = isnan(_730);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = fma(_968, _850, _954);
    float _996 = fma(_976, _972, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1000 = _730 + _998;
    float _1002 = -_992;
    float _1004 = _1002 + 1.0;
    float _1006 = _980 * _960;
    float _1008 = fma(_974, _846, _994);
    float _1010 = _762 * _1004;
    float _1012 = fma(_1006, _1000, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1014 = fma(_996, _848, _1008);
    float _1016 = fma(_1012, _1010, _1014);
    float _1018 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1016);
    out.m_45.x = _1018;
    bool _1020 = !_804;
    float _1038;
    if (!_1020)
    {
        float _1022 = in.m_39.x;
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1026 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[14].y, _106);
        float _1030 = _1028 * _1024;
        float _1032 = floor(_1030);
        float _1034 = -_1032;
        float _1036 = _1030 + _1034;
        _1038 = _1036;
        _1040 = true;
    }
    else
    {
        float _1042 = float(_72);
        float _1044 = 1.0 / _1042;
        float _1046 = _106 * _1044;
        _1038 = _1046;
    }
    _1040 = false;
    float _1048 = _1038;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1052 = _1048 + _1050;
    bool _1054 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1056 = isnan(_1048);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1070 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1072 = isnan(_1048);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1082;
    float _1086 = 1.0 / _1068;
    bool _1088 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1090 = isnan(_1048);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    bool _1100 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1102 = isnan(_1048);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1116 = 1.0 / _1114;
    float _1118 = -_1064;
    float _1120 = _1118 + 1.0;
    bool _1122 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1124 = _1084 * _1086;
    bool _1126 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1128 = isnan(_1048);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = -_1080;
    float _1140 = _1138 + 1.0;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1144 = _1142 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1146 = fma(_1124, _1052, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _1148 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1150 = isnan(_1048);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1156 = _1152 || _1154;
    float _1158 = float(_1156);
    float _1160 = -_1136;
    float _1162 = _1160 + 1.0;
    float _1164 = _1136 * _1120;
    float _1166 = _1064 * _1140;
    float _1168 = _1098 * _1162;
    float _1170 = -_1098;
    float _1172 = _1170 + 1.0;
    float _1174 = 1.0 / _1144;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1178 = _1176 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1180 = _1110 * _1172;
    float _1182 = -_1110;
    float _1184 = _1182 + 1.0;
    bool _1186 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1188 = isnan(_1048);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    float _1198 = _1158 * _1184;
    float _1200 = -_1158;
    float _1202 = _1200 + 1.0;
    float _1204 = 1.0 / _1178;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1210;
    float _1214 = _1196 * _1202;
    float _1216 = _1208 * _1116;
    float _1218 = -_1196;
    float _1220 = _1218 + 1.0;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1224 = _1222 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1226 = _1146 * _1214;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1230 = _1228 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1234 = _1048 + _1232;
    float _1236 = 1.0 / _1224;
    float _1238 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1226);
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1244 = fma(_1216, _1234, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1246 = _1212 * _1204;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1250 = _1048 + _1248;
    float _1252 = fma(_1244, _1198, _1238);
    float _1254 = 1.0 / _1230;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1258 = _1256 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1260 = fma(_1246, _1250, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1262;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1268 = _1048 + _1266;
    float _1270 = _1258 * _1174;
    float _1272 = fma(_1260, _1180, _1252);
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1276 = _1048 + _1274;
    float _1278 = 1.0 / _1242;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1282 = _1280 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1284 = _1264 * _1236;
    float _1286 = fma(_1270, _1268, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1290 = _1048 + _1288;
    float _1292 = fma(_1284, _1276, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1294 = _1282 * _1254;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1296;
    bool _1300 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1302 = isnan(_1048);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    float _1312 = fma(_1286, _1168, _1272);
    float _1314 = fma(_1294, _1290, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1318 = _1048 + _1316;
    float _1320 = -_1310;
    float _1322 = _1320 + 1.0;
    float _1324 = _1298 * _1278;
    float _1326 = fma(_1292, _1164, _1312);
    float _1328 = _1080 * _1322;
    float _1330 = fma(_1324, _1318, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1332 = fma(_1314, _1166, _1326);
    float _1334 = fma(_1330, _1328, _1332);
    float _1336 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1334);
    out.m_47.x = _1336;
    bool _1338 = !_1122;
    float _1356;
    if (!_1338)
    {
        float _1340 = in.m_39.x;
        float _1342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1344 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[14].z, _106);
        float _1348 = _1346 * _1342;
        float _1350 = floor(_1348);
        float _1352 = -_1350;
        float _1354 = _1348 + _1352;
        _1356 = _1354;
        _1358 = true;
    }
    else
    {
        float _1360 = float(_72);
        float _1362 = 1.0 / _1360;
        float _1364 = _106 * _1362;
        _1356 = _1364;
    }
    _1358 = false;
    float _1366 = _1356;
    float _1368 = in.m_39.w;
    float _1370 = _244 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1372 = in.m_39.x;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1376 = _1374 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1378 = in.m_39.y;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1382 = _1380 != 0;
    float _1384 = 1.0 / _1376;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1388 = _1386 != 0;
    float _1390 = _244 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1392 = _244 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1398 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1390);
    float _1400 = 1.0 / _1396;
    float _1402 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1370);
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1406 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1392);
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[170].x;
    if (_1382)
    {
        float _1410 = in.m_39.z;
        _1408 = _1410;
    }
    float _1412 = _1408;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1418 = _1368 > 0.5;
    float _1420 = _426 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1422 = 1.0 / _1416;
    float _1424 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1426 = in.m_33.x;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1430 = _1428 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1432 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1434 = -_1404;
    float _1436 = fma(_1424, 2.0, _1434);
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1440 = _1438 != 0;
    float _1442 = 1.0 / _1430;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1448 = _1446 != 0;
    float _1450 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1398);
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1454 = _1452 != 0;
    float _1456 = fma(_1432, -2.0, _1444);
    float _1458 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1402);
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1460;
    float _1464 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1406);
    float _1466 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1468 = _1466 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1472 = _1470 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1474 = _1462 * _1384;
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1478 = _1476 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1480 = 1.0 / _1468;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1482;
    bool _1486 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1488 = isnan(_1366);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1494 = _1490 || _1492;
    float _1496 = float(_1494);
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1500 = _1498 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1502 = _1484 * _1422;
    bool _1504 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1506 = isnan(_1366);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1512 = _1508 || _1510;
    float _1514 = float(_1512);
    float _1516 = _1478 * _1400;
    float _1518 = 1.0 / _1472;
    bool _1520 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1522 = isnan(_1366);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1528 = _1524 || _1526;
    float _1530 = float(_1528);
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1532;
    bool _1536 = false;
    bool _1538 = _1418;
    float _1540 = _1502;
    if (_1382)
    {
        bool _1542 = _1412 > 0.5;
        _1536 = _1542;
    }
    bool _1544 = _1536;
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1548 = _1546 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    bool _1550 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1552 = isnan(_1366);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1558 = _1554 || _1556;
    float _1560 = float(_1558);
    float _1562 = -_1530;
    float _1564 = _1562 + 1.0;
    bool _1566 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1568 = isnan(_1366);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1574 = _1570 || _1572;
    float _1576 = float(_1574);
    float _1578 = _1534 * _1442;
    float _1580 = in.m_33.y;
    float _1582 = _1496 * _1564;
    float _1584 = -_1496;
    float _1586 = _1584 + 1.0;
    bool _1588 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1590 = isnan(_1366);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1596 = _1592 || _1594;
    float _1598 = float(_1596);
    float _1600 = -_1560;
    float _1602 = _1600 + 1.0;
    float _1604 = _1548 * _1480;
    float _1606 = _1514 * _1586;
    float _1608 = _1500 * _1518;
    float _1610 = -_1514;
    float _1612 = _1610 + 1.0;
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1616 = _1366 + _1614;
    float _1618 = _1598 * _1602;
    float _1620 = _1576 * _1612;
    float _1622 = -_1576;
    float _1624 = _1622 + 1.0;
    float _1626 = fma(_1474, _1616, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    bool _1628 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1630 = isnan(_1366);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1636 = _1632 || _1634;
    float _1638 = float(_1636);
    float _1640 = -_1598;
    float _1642 = _1640 + 1.0;
    float _1644 = _1560 * _1624;
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1648 = _1646 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1650 = _1638 * _1642;
    bool _1652 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1654 = isnan(_1366);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1660 = _1656 || _1658;
    float _1662 = float(_1660);
    float _1664 = -_1638;
    float _1666 = _1664 + 1.0;
    float _1668 = 1.0 / _1648;
    float _1670 = -_1580;
    float _1672 = _1670 + 1.0;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1676 = _1662 * _1666;
    float _1678 = _1666;
    float _1680 = _1580;
    if (!_1388)
    {
        _1678 = _1378;
    }
    float _1682 = _1678;
    float _1684 = -_1662;
    float _1686 = _1684 + 1.0;
    int _1688 = _1418 ? as_type<int>(_1672) : as_type<int>(_1580);
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1692 = _1366 + _1690;
    float _1694 = _1682;
    if (_1440)
    {
        bool _1696 = _1372 > 0.5;
        _1538 = _1696;
    }
    bool _1698 = _1538;
    float _1700 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1674);
    if (_1388)
    {
        _1694 = _1372;
    }
    float _1702 = _1694;
    float _1704 = _1626 * _1676;
    float _1706 = _1372;
    if (!_1388)
    {
        float _1708 = in.m_39.z;
        _1706 = _1708;
    }
    float _1710 = _1706;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1714 = _1366 + _1712;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1718 = _1366 + _1716;
    float _1720 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1704);
    float _1722 = fma(_1604, _1692, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1724 = fma(_1516, _1714, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1728 = fma(_1578, _1718, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1732 = _1366 + _1730;
    float _1734 = fma(_1724, _1650, _1720);
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1738 = _1366 + _1736;
    float _1740 = fma(_1502, _1732, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1742 = fma(_1728, _1618, _1734);
    float _1744 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1744;
    float _1748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1750 = fma(_1722, _1644, _1742);
    float _1752 = fma(_1608, _1738, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1754 = _1746 * _1668;
    float _1756 = _1448 ? as_type<float>(_1688) : _1580;
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1760 = fma(_1740, _1620, _1750);
    float _1762 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1764 = in.m_49.x;
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1768 = _1366 + _1766;
    float _1770 = _1742;
    float _1772 = _1710;
    float _1774 = _1734;
    int _1776 = as_type<int>(_1760);
    if (!_1388)
    {
        _1770 = _1710;
    }
    float _1778 = _1770;
    float _1780 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1758);
    bool _1782 = _1378 > 0.5;
    float _1784 = fma(_1752, _1606, _1760);
    float _1786 = _1778;
    if (_1388)
    {
        _1786 = _1378;
    }
    float _1788 = _1786;
    float _1790 = fma(_1756, _1762, -0.5);
    if (_1388)
    {
        _1772 = _1378;
    }
    float _1792 = _1772;
    float _1794 = fma(_1754, _1768, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1796 = in.m_51.x;
    float _1798 = in.m_51.y;
    float _1800 = in.m_51.z;
    float _1802 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1804 = fma(_1794, _1582, _1784);
    if (_1454)
    {
        float _1806 = _1782 ? _1672 : _1580;
        _1680 = _1806;
    }
    float _1808 = _1680;
    float _1810 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1814 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1456);
    float _1816 = fma(_1802, _1808, -0.5);
    float _1818 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1812);
    float _1820 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1804);
    float _1822 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1780);
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1826 = _1820 * 0.17000000178813934326171875;
    float _1828 = -_1814;
    float _1830 = fma(_1822, _1816, _1828);
    if (!_1440)
    {
        _1774 = _1426;
    }
    float _1832 = _1774;
    float _1834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1836 = _1826 * _1764;
    float _1838 = fma(_1792, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1824);
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1842 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1844 = fma(_1796, _1836, _1796);
    float _1846 = _1832;
    if (!_1440)
    {
        _1540 = _1832;
    }
    float _1848 = _1540;
    float _1850 = fma(_1798, _1836, _1798);
    float _1852 = _1848;
    if (_1440)
    {
        _1846 = _1426;
    }
    float _1854 = _1846;
    float _1856 = fma(_1842, -2.0, _1840);
    float _1858 = fma(_1800, _1836, _1800);
    float _1860 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1844);
    float _1862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1850);
    float _1864 = _1854;
    if (_1440)
    {
        float _1866 = -_1854;
        float _1868 = _1866 + 1.0;
        _1776 = as_type<int>(_1868);
    }
    int _1870 = _1776;
    float _1872 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1858);
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1878 = _1420 * _1862;
    int _1880 = _1870;
    if (_1440)
    {
        float _1882 = _1698 ? as_type<float>(_1870) : _1854;
        _1852 = _1882;
    }
    float _1884 = _1852;
    float _1886 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1888 = _1872 * _1860;
    float _1890 = -_1876;
    float _1892 = fma(_1810, 2.0, _1890);
    float _1894 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1896 = _1878 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1898 = fma(_1886, _1884, -0.5);
    float _1900 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1700);
    float _1902 = -_106;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1436);
    float _1906 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1818);
    float _1908 = -_106;
    float _1910 = fma(_1908, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1892);
    float _1912 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1838);
    float _1914 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1856);
    float _1916 = _1894 * _1874;
    float _1918 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1896);
    float _1920 = _1878 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1922 = _1878 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1924 = _1458 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1926 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1918);
    float _1928 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1920);
    float _1930 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1922);
    float _1932 = _1450 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1934 = _1926 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1936 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1928);
    float _1938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1940 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1930);
    float _1942 = _1924 + _1934;
    float _1944 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1946 = fma(_1900, _1898, _1904);
    float _1948 = _1464 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1950 = _1940 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1952 = _1932 + _1944;
    float _1954 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1956 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1958 = _1948 + _1950;
    if (_1382)
    {
        float _1960 = -_1854;
        float _1962 = _1960 + 1.0;
        _1880 = as_type<int>(_1962);
    }
    int _1964 = _1880;
    float _1966 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1954);
    float _1968 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1970 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1972 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1956);
    float _1974 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1966);
    if (_1382)
    {
        float _1976 = _1544 ? as_type<float>(_1964) : _1854;
        _1864 = _1976;
    }
    float _1978 = _1864;
    float _1980 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1968);
    float _1982 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1970);
    float _1984 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1986 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1972);
    float _1988 = _1974 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1990 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1980);
    float _1992 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1982);
    float _1994 = fma(_1984, _1978, -0.5);
    float _1996 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2000 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2002 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2004 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2006 = fma(_1906, _1994, _1910);
    float _2008 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2010 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1998);
    float _2012 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2000);
    float _2014 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2002);
    float _2016 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2004);
    float _2018 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2010);
    float _2020 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2012);
    float _2022 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2014);
    float _2024 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2026 = -_1914;
    float _2028 = fma(_1912, _1790, _2026);
    float _2030 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2016);
    float _2032 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2018);
    float _2034 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2020);
    float _2036 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2022);
    float _2038 = _1830 + 0.5;
    float _2040 = _1946 + 0.5;
    float _2042 = _2006 + 0.5;
    float _2044 = _2028 + 0.5;
    float _2046 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2030);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_53.x = _2040;
    out.m_53.y = _2038;
    out.m_53.z = _2042;
    out.m_53.w = _2044;
    out.gl_Position.x = _2032;
    out.gl_Position.y = _2034;
    out.gl_Position.z = _2036;
    out.gl_Position.w = _2046;
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
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1358 = false;
    bool _1040 = false;
    bool _722 = false;
    bool _618 = false;
    bool _450 = false;
    bool _270 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_26.w;
    float _69 = trunc(_67);
    int _72 = int(_69);
    bool _76 = _72 >= 1;
    float _78 = 0.0;
    if (!_76)
    {
        _78 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _80 = _78;
    float _82 = _80;
    if (!_76)
    {
        out.m_29.x = 0.0;
    }
    int _84 = 0;
    if (!_76)
    {
        float _86 = _80 * 5.0;
        _84 = as_type<int>(_86);
    }
    int _88 = _84;
    int _90 = _88;
    if (!_76)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2103 = as_type<float>(_88);
        out.gl_Position.z = _2103;
    }
    if (!_76)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _92 = in.m_31.w;
    bool _94 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_92);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = -_92;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_102)
    {
        float _108 = float(_72);
        _82 = _108;
    }
    float _110 = _82;
    bool _112 = _106 >= _110;
    bool _114 = !_102;
    bool _116 = _112 || _114;
    float _118 = _110;
    if (_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (_116)
    {
        out.m_29.x = 0.0;
    }
    if (_116)
    {
        float _122 = _120 * 5.0;
        _90 = as_type<int>(_122);
    }
    int _124 = _90;
    if (_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2172 = as_type<float>(_124);
        out.gl_Position.z = _2172;
    }
    if (_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_33.w;
    float _128 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _130 = in.m_35.w;
    bool _132 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _134 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = in.m_31.x;
    float _144 = in.m_31.y;
    float _146 = in.m_31.z;
    float _148 = in.m_26.x;
    float _150 = in.m_26.y;
    float _152 = in.m_26.z;
    float _154 = 0.0;
    float _156 = _128;
    if (!_140)
    {
        float _158 = _128 * _128;
        float _160 = _158 * 0.5;
        _154 = _160;
    }
    float _162 = _154;
    float _164 = _162;
    if (!_140)
    {
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _166;
    }
    float _168 = _164;
    out.m_37.w = _126;
    bool _170 = !_140;
    float _172 = _168;
    if (!_170)
    {
        float _174 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = log2(_174);
        float _178 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _180 = _178 + 1.0;
        float _182 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = _128 * _176;
        float _186 = 1.0 / _180;
        float _188 = _182 * 0.693147182464599609375;
        float _190 = exp2(_184);
        float _192 = 1.0 / _188;
        float _194 = _190 + (-1.0);
        float _196 = -_194;
        float _198 = fma(_196, _192, _128);
        float _200 = _198 * _186;
        float _202 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _202;
    }
    float _204 = _172;
    bool _206 = !_140;
    if (!_206)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = 1.0 / _214;
        float _218 = _128 * _210;
        float _220 = exp2(_218);
        float _222 = -_220;
        float _224 = _222 + 1.0;
        float _226 = _224 * _216;
        _156 = _226;
    }
    float _228 = _156;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _232 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _234 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _236 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _238 = fma(_228, _144, _232);
    float _240 = fma(_228, _142, _234);
    float _242 = fma(_228, _146, _236);
    float _244 = fma(_238, _130, _150);
    float _246 = fma(_240, _130, _148);
    float _248 = fma(_242, _130, _152);
    bool _250 = !_230;
    float _268;
    if (!_250)
    {
        float _252 = in.m_39.x;
        float _254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _256 = _252 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[12].x, _106);
        float _260 = _258 * _254;
        float _262 = floor(_260);
        float _264 = -_262;
        float _266 = _260 + _264;
        _268 = _266;
        _270 = true;
    }
    else
    {
        float _272 = float(_72);
        float _274 = 1.0 / _272;
        float _276 = _106 * _274;
        _268 = _276;
    }
    _270 = false;
    float _278 = _268;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = _278 + _280;
    bool _284 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _286 = isnan(_278);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _278 + _296;
    bool _300 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _302 = isnan(_278);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _320 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _322 = isnan(_278);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_294;
    float _334 = _332 + 1.0;
    float _336 = 1.0 / _318;
    float _338 = _330 * _334;
    float _340 = -_330;
    float _342 = _340 + 1.0;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _344;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _350 = 1.0 / _314;
    float _352 = _310 * _342;
    float _354 = -_310;
    float _356 = _354 + 1.0;
    float _358 = _298 * _336;
    float _360 = _282 * _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _366;
    float _370 = fma(_346, _360, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _372 = fma(_364, _360, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _374 = fma(_368, _360, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _376 = in.m_35.x;
    float _378 = in.m_35.y;
    float _380 = in.m_35.z;
    float _382 = _370 * _352;
    float _384 = _372 * _352;
    float _386 = _374 * _352;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].z, _386);
    float _402 = fma(_390, _358, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _404 = fma(_394, _358, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _406 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].y, _384);
    float _408 = fma(_398, _358, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _410 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].x, _382);
    float _412 = fma(_404, _338, _400);
    float _414 = fma(_402, _338, _406);
    float _416 = fma(_408, _338, _410);
    float _418 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[145].z, _412);
    float _420 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[145].y, _414);
    float _422 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[145].x, _416);
    float _424 = _418 * _380;
    float _426 = _420 * _378;
    float _428 = _422 * _376;
    bool _430 = !_348;
    float _448;
    if (!_430)
    {
        float _432 = in.m_39.x;
        float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _436 = _432 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _438 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _440 = _438 * _434;
        float _442 = floor(_440);
        float _444 = -_442;
        float _446 = _440 + _444;
        _448 = _446;
        _450 = true;
    }
    else
    {
        float _452 = float(_72);
        float _454 = 1.0 / _452;
        float _456 = _106 * _454;
        _448 = _456;
    }
    _450 = false;
    float _458 = _448;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _462 = _458 + _460;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _472 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _474 = isnan(_458);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _488 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _490 = isnan(_458);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = 1.0 / _466;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _502;
    float _506 = -_482;
    float _508 = _506 + 1.0;
    bool _510 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _512 = isnan(_458);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    bool _522 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _524 = 1.0 / _470;
    float _526 = 1.0 / _486;
    float _528 = _504 * _500;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _534 = _498 * _508;
    float _536 = -_498;
    float _538 = _536 + 1.0;
    float _540 = fma(_528, _462, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _542;
    float _546 = _520 * _538;
    float _548 = _532 * _524;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _552 = _458 + _550;
    bool _554 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _556 = isnan(_458);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = _540 * _546;
    float _568 = -_520;
    float _570 = _568 + 1.0;
    float _572 = fma(_548, _552, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _576 = _458 + _574;
    float _578 = _544 * _526;
    float _580 = -_564;
    float _582 = _580 + 1.0;
    float _584 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[115].x, _566);
    float _586 = fma(_578, _576, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _588 = _482 * _582;
    float _590 = fma(_572, _534, _584);
    float _592 = fma(_586, _588, _590);
    float _594 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[118].x, _592);
    float _596 = _594 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.w = _596;
    bool _598 = !_522;
    float _616;
    if (!_598)
    {
        float _600 = in.m_39.x;
        float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _604 = _600 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[11].w, _106);
        float _608 = _606 * _602;
        float _610 = floor(_608);
        float _612 = -_610;
        float _614 = _608 + _612;
        _616 = _614;
        _618 = true;
    }
    else
    {
        float _620 = float(_72);
        float _622 = 1.0 / _620;
        float _624 = _106 * _622;
        _616 = _624;
    }
    _618 = false;
    float _626 = _616;
    bool _628 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _630 = isnan(_626);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _644 = _626 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _646 = isnan(_626);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _662 = _626 + _660;
    float _664 = -_638;
    float _666 = _664 + 1.0;
    bool _668 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _670 = 1.0 / _642;
    float _672 = _654 * _666;
    float _674 = -_654;
    float _676 = _674 + 1.0;
    float _678 = _658 * _670;
    float _680 = fma(_678, _662, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _682 = _680 * _672;
    float _684 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[131].x, _682);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _692 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[132].x, _684);
    float _694 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = _692 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_43.x = _694;
    out.m_43.y = _696;
    out.m_43.z = _698;
    out.m_43.w = _700;
    bool _702 = !_668;
    float _720;
    if (!_702)
    {
        float _704 = in.m_39.x;
        float _706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _708 = _704 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[14].x, _106);
        float _712 = _710 * _706;
        float _714 = floor(_712);
        float _716 = -_714;
        float _718 = _712 + _716;
        _720 = _718;
        _722 = true;
    }
    else
    {
        float _724 = float(_72);
        float _726 = 1.0 / _724;
        float _728 = _106 * _726;
        _720 = _728;
    }
    _722 = false;
    float _730 = _720;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _734 = _730 + _732;
    bool _736 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _738 = isnan(_730);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _752 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _754 = isnan(_730);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _764;
    float _768 = 1.0 / _750;
    bool _770 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _772 = isnan(_730);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    bool _782 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _784 = isnan(_730);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _798 = 1.0 / _796;
    float _800 = -_746;
    float _802 = _800 + 1.0;
    bool _804 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _806 = _766 * _768;
    bool _808 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _810 = isnan(_730);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = -_762;
    float _822 = _820 + 1.0;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _828 = fma(_806, _734, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _830 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _832 = isnan(_730);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    float _842 = -_818;
    float _844 = _842 + 1.0;
    float _846 = _818 * _802;
    float _848 = _746 * _822;
    float _850 = _780 * _844;
    float _852 = -_780;
    float _854 = _852 + 1.0;
    float _856 = 1.0 / _826;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _862 = _792 * _854;
    float _864 = -_792;
    float _866 = _864 + 1.0;
    bool _868 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _870 = isnan(_730);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = _840 * _866;
    float _882 = -_840;
    float _884 = _882 + 1.0;
    float _886 = 1.0 / _860;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _892;
    float _896 = _878 * _884;
    float _898 = _890 * _798;
    float _900 = -_878;
    float _902 = _900 + 1.0;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _908 = _828 * _896;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _916 = _730 + _914;
    float _918 = 1.0 / _906;
    float _920 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[159].x, _908);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _926 = fma(_898, _916, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _928 = _894 * _886;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _932 = _730 + _930;
    float _934 = fma(_926, _880, _920);
    float _936 = 1.0 / _912;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _942 = fma(_928, _932, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _944;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _950 = _730 + _948;
    float _952 = _940 * _856;
    float _954 = fma(_942, _862, _934);
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _958 = _730 + _956;
    float _960 = 1.0 / _924;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _966 = _946 * _918;
    float _968 = fma(_952, _950, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _972 = _730 + _970;
    float _974 = fma(_966, _958, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _976 = _964 * _936;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _978;
    bool _982 = _730 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _984 = isnan(_730);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = fma(_968, _850, _954);
    float _996 = fma(_976, _972, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1000 = _730 + _998;
    float _1002 = -_992;
    float _1004 = _1002 + 1.0;
    float _1006 = _980 * _960;
    float _1008 = fma(_974, _846, _994);
    float _1010 = _762 * _1004;
    float _1012 = fma(_1006, _1000, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1014 = fma(_996, _848, _1008);
    float _1016 = fma(_1012, _1010, _1014);
    float _1018 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1016);
    out.m_45.x = _1018;
    bool _1020 = !_804;
    float _1038;
    if (!_1020)
    {
        float _1022 = in.m_39.x;
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1026 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[14].y, _106);
        float _1030 = _1028 * _1024;
        float _1032 = floor(_1030);
        float _1034 = -_1032;
        float _1036 = _1030 + _1034;
        _1038 = _1036;
        _1040 = true;
    }
    else
    {
        float _1042 = float(_72);
        float _1044 = 1.0 / _1042;
        float _1046 = _106 * _1044;
        _1038 = _1046;
    }
    _1040 = false;
    float _1048 = _1038;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1052 = _1048 + _1050;
    bool _1054 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1056 = isnan(_1048);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1070 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1072 = isnan(_1048);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1082;
    float _1086 = 1.0 / _1068;
    bool _1088 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1090 = isnan(_1048);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    bool _1100 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1102 = isnan(_1048);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1116 = 1.0 / _1114;
    float _1118 = -_1064;
    float _1120 = _1118 + 1.0;
    bool _1122 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1124 = _1084 * _1086;
    bool _1126 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1128 = isnan(_1048);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1134 = _1130 || _1132;
    float _1136 = float(_1134);
    float _1138 = -_1080;
    float _1140 = _1138 + 1.0;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1144 = _1142 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1146 = fma(_1124, _1052, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _1148 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1150 = isnan(_1048);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1156 = _1152 || _1154;
    float _1158 = float(_1156);
    float _1160 = -_1136;
    float _1162 = _1160 + 1.0;
    float _1164 = _1136 * _1120;
    float _1166 = _1064 * _1140;
    float _1168 = _1098 * _1162;
    float _1170 = -_1098;
    float _1172 = _1170 + 1.0;
    float _1174 = 1.0 / _1144;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1178 = _1176 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1180 = _1110 * _1172;
    float _1182 = -_1110;
    float _1184 = _1182 + 1.0;
    bool _1186 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1188 = isnan(_1048);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    float _1198 = _1158 * _1184;
    float _1200 = -_1158;
    float _1202 = _1200 + 1.0;
    float _1204 = 1.0 / _1178;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1210;
    float _1214 = _1196 * _1202;
    float _1216 = _1208 * _1116;
    float _1218 = -_1196;
    float _1220 = _1218 + 1.0;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1224 = _1222 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1226 = _1146 * _1214;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1230 = _1228 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1234 = _1048 + _1232;
    float _1236 = 1.0 / _1224;
    float _1238 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1226);
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1244 = fma(_1216, _1234, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1246 = _1212 * _1204;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1250 = _1048 + _1248;
    float _1252 = fma(_1244, _1198, _1238);
    float _1254 = 1.0 / _1230;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1258 = _1256 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1260 = fma(_1246, _1250, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1262;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1268 = _1048 + _1266;
    float _1270 = _1258 * _1174;
    float _1272 = fma(_1260, _1180, _1252);
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1276 = _1048 + _1274;
    float _1278 = 1.0 / _1242;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1282 = _1280 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1284 = _1264 * _1236;
    float _1286 = fma(_1270, _1268, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1290 = _1048 + _1288;
    float _1292 = fma(_1284, _1276, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1294 = _1282 * _1254;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1296;
    bool _1300 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1302 = isnan(_1048);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    float _1312 = fma(_1286, _1168, _1272);
    float _1314 = fma(_1294, _1290, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1318 = _1048 + _1316;
    float _1320 = -_1310;
    float _1322 = _1320 + 1.0;
    float _1324 = _1298 * _1278;
    float _1326 = fma(_1292, _1164, _1312);
    float _1328 = _1080 * _1322;
    float _1330 = fma(_1324, _1318, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1332 = fma(_1314, _1166, _1326);
    float _1334 = fma(_1330, _1328, _1332);
    float _1336 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1334);
    out.m_47.x = _1336;
    bool _1338 = !_1122;
    float _1356;
    if (!_1338)
    {
        float _1340 = in.m_39.x;
        float _1342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1344 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[14].z, _106);
        float _1348 = _1346 * _1342;
        float _1350 = floor(_1348);
        float _1352 = -_1350;
        float _1354 = _1348 + _1352;
        _1356 = _1354;
        _1358 = true;
    }
    else
    {
        float _1360 = float(_72);
        float _1362 = 1.0 / _1360;
        float _1364 = _106 * _1362;
        _1356 = _1364;
    }
    _1358 = false;
    float _1366 = _1356;
    float _1368 = in.m_39.w;
    float _1370 = _244 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1372 = in.m_39.x;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1376 = _1374 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1378 = in.m_39.y;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1382 = _1380 != 0;
    float _1384 = 1.0 / _1376;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1388 = _1386 != 0;
    float _1390 = _244 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1392 = _244 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1398 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1390);
    float _1400 = 1.0 / _1396;
    float _1402 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1370);
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1406 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1392);
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[170].x;
    if (_1382)
    {
        float _1410 = in.m_39.z;
        _1408 = _1410;
    }
    float _1412 = _1408;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1418 = _1368 > 0.5;
    float _1420 = _426 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1422 = 1.0 / _1416;
    float _1424 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1426 = in.m_33.x;
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1430 = _1428 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1432 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1434 = -_1404;
    float _1436 = fma(_1424, 2.0, _1434);
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1440 = _1438 != 0;
    float _1442 = 1.0 / _1430;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1448 = _1446 != 0;
    float _1450 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1398);
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1454 = _1452 != 0;
    float _1456 = fma(_1432, -2.0, _1444);
    float _1458 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1402);
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1460;
    float _1464 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1406);
    float _1466 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1468 = _1466 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1470 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1472 = _1470 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1474 = _1462 * _1384;
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1478 = _1476 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1480 = 1.0 / _1468;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1482;
    bool _1486 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1488 = isnan(_1366);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1494 = _1490 || _1492;
    float _1496 = float(_1494);
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1500 = _1498 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1502 = _1484 * _1422;
    bool _1504 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1506 = isnan(_1366);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1512 = _1508 || _1510;
    float _1514 = float(_1512);
    float _1516 = _1478 * _1400;
    float _1518 = 1.0 / _1472;
    bool _1520 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1522 = isnan(_1366);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1528 = _1524 || _1526;
    float _1530 = float(_1528);
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1532;
    bool _1536 = false;
    bool _1538 = _1418;
    float _1540 = _1502;
    if (_1382)
    {
        bool _1542 = _1412 > 0.5;
        _1536 = _1542;
    }
    bool _1544 = _1536;
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1548 = _1546 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    bool _1550 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1552 = isnan(_1366);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1558 = _1554 || _1556;
    float _1560 = float(_1558);
    float _1562 = -_1530;
    float _1564 = _1562 + 1.0;
    bool _1566 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1568 = isnan(_1366);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1574 = _1570 || _1572;
    float _1576 = float(_1574);
    float _1578 = _1534 * _1442;
    float _1580 = in.m_33.y;
    float _1582 = _1496 * _1564;
    float _1584 = -_1496;
    float _1586 = _1584 + 1.0;
    bool _1588 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1590 = isnan(_1366);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1596 = _1592 || _1594;
    float _1598 = float(_1596);
    float _1600 = -_1560;
    float _1602 = _1600 + 1.0;
    float _1604 = _1548 * _1480;
    float _1606 = _1514 * _1586;
    float _1608 = _1500 * _1518;
    float _1610 = -_1514;
    float _1612 = _1610 + 1.0;
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1616 = _1366 + _1614;
    float _1618 = _1598 * _1602;
    float _1620 = _1576 * _1612;
    float _1622 = -_1576;
    float _1624 = _1622 + 1.0;
    float _1626 = fma(_1474, _1616, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    bool _1628 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1630 = isnan(_1366);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1636 = _1632 || _1634;
    float _1638 = float(_1636);
    float _1640 = -_1598;
    float _1642 = _1640 + 1.0;
    float _1644 = _1560 * _1624;
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1648 = _1646 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1650 = _1638 * _1642;
    bool _1652 = _1366 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1654 = isnan(_1366);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1660 = _1656 || _1658;
    float _1662 = float(_1660);
    float _1664 = -_1638;
    float _1666 = _1664 + 1.0;
    float _1668 = 1.0 / _1648;
    float _1670 = -_1580;
    float _1672 = _1670 + 1.0;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1676 = _1662 * _1666;
    float _1678 = _1666;
    float _1680 = _1580;
    if (!_1388)
    {
        _1678 = _1378;
    }
    float _1682 = _1678;
    float _1684 = -_1662;
    float _1686 = _1684 + 1.0;
    int _1688 = _1418 ? as_type<int>(_1672) : as_type<int>(_1580);
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1692 = _1366 + _1690;
    float _1694 = _1682;
    if (_1440)
    {
        bool _1696 = _1372 > 0.5;
        _1538 = _1696;
    }
    bool _1698 = _1538;
    float _1700 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1674);
    if (_1388)
    {
        _1694 = _1372;
    }
    float _1702 = _1694;
    float _1704 = _1626 * _1676;
    float _1706 = _1372;
    if (!_1388)
    {
        float _1708 = in.m_39.z;
        _1706 = _1708;
    }
    float _1710 = _1706;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1714 = _1366 + _1712;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1718 = _1366 + _1716;
    float _1720 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1704);
    float _1722 = fma(_1604, _1692, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1724 = fma(_1516, _1714, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1728 = fma(_1578, _1718, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1732 = _1366 + _1730;
    float _1734 = fma(_1724, _1650, _1720);
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1738 = _1366 + _1736;
    float _1740 = fma(_1502, _1732, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1742 = fma(_1728, _1618, _1734);
    float _1744 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1744;
    float _1748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1750 = fma(_1722, _1644, _1742);
    float _1752 = fma(_1608, _1738, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1754 = _1746 * _1668;
    float _1756 = _1448 ? as_type<float>(_1688) : _1580;
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1760 = fma(_1740, _1620, _1750);
    float _1762 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1764 = in.m_49.x;
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1768 = _1366 + _1766;
    float _1770 = _1742;
    float _1772 = _1710;
    float _1774 = _1734;
    int _1776 = as_type<int>(_1760);
    if (!_1388)
    {
        _1770 = _1710;
    }
    float _1778 = _1770;
    float _1780 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1758);
    bool _1782 = _1378 > 0.5;
    float _1784 = fma(_1752, _1606, _1760);
    float _1786 = _1778;
    if (_1388)
    {
        _1786 = _1378;
    }
    float _1788 = _1786;
    float _1790 = fma(_1756, _1762, -0.5);
    if (_1388)
    {
        _1772 = _1378;
    }
    float _1792 = _1772;
    float _1794 = fma(_1754, _1768, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1796 = in.m_51.x;
    float _1798 = in.m_51.y;
    float _1800 = in.m_51.z;
    float _1802 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1804 = fma(_1794, _1582, _1784);
    if (_1454)
    {
        float _1806 = _1782 ? _1672 : _1580;
        _1680 = _1806;
    }
    float _1808 = _1680;
    float _1810 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1814 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1456);
    float _1816 = fma(_1802, _1808, -0.5);
    float _1818 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1812);
    float _1820 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1804);
    float _1822 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1780);
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1826 = _1820 * 0.17000000178813934326171875;
    float _1828 = -_1814;
    float _1830 = fma(_1822, _1816, _1828);
    if (!_1440)
    {
        _1774 = _1426;
    }
    float _1832 = _1774;
    float _1834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1836 = _1826 * _1764;
    float _1838 = fma(_1792, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1824);
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1842 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1844 = fma(_1796, _1836, _1796);
    float _1846 = _1832;
    if (!_1440)
    {
        _1540 = _1832;
    }
    float _1848 = _1540;
    float _1850 = fma(_1798, _1836, _1798);
    float _1852 = _1848;
    if (_1440)
    {
        _1846 = _1426;
    }
    float _1854 = _1846;
    float _1856 = fma(_1842, -2.0, _1840);
    float _1858 = fma(_1800, _1836, _1800);
    float _1860 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1844);
    float _1862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1850);
    float _1864 = _1854;
    if (_1440)
    {
        float _1866 = -_1854;
        float _1868 = _1866 + 1.0;
        _1776 = as_type<int>(_1868);
    }
    int _1870 = _1776;
    float _1872 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1858);
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1878 = _1420 * _1862;
    int _1880 = _1870;
    if (_1440)
    {
        float _1882 = _1698 ? as_type<float>(_1870) : _1854;
        _1852 = _1882;
    }
    float _1884 = _1852;
    float _1886 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1888 = _1872 * _1860;
    float _1890 = -_1876;
    float _1892 = fma(_1810, 2.0, _1890);
    float _1894 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1896 = _1878 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1898 = fma(_1886, _1884, -0.5);
    float _1900 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1700);
    float _1902 = -_106;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1436);
    float _1906 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1818);
    float _1908 = -_106;
    float _1910 = fma(_1908, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1892);
    float _1912 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1838);
    float _1914 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1856);
    float _1916 = _1894 * _1874;
    float _1918 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1896);
    float _1920 = _1878 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1922 = _1878 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1924 = _1458 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1926 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1918);
    float _1928 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1920);
    float _1930 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1922);
    float _1932 = _1450 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1934 = _1926 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1936 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1928);
    float _1938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1940 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1930);
    float _1942 = _1924 + _1934;
    float _1944 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1946 = fma(_1900, _1898, _1904);
    float _1948 = _1464 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1950 = _1940 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1952 = _1932 + _1944;
    float _1954 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1956 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1958 = _1948 + _1950;
    if (_1382)
    {
        float _1960 = -_1854;
        float _1962 = _1960 + 1.0;
        _1880 = as_type<int>(_1962);
    }
    int _1964 = _1880;
    float _1966 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1954);
    float _1968 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1970 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1972 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1956);
    float _1974 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1966);
    if (_1382)
    {
        float _1976 = _1544 ? as_type<float>(_1964) : _1854;
        _1864 = _1976;
    }
    float _1978 = _1864;
    float _1980 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1968);
    float _1982 = fma(_1952, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1970);
    float _1984 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1986 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1972);
    float _1988 = _1974 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1990 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1980);
    float _1992 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1982);
    float _1994 = fma(_1984, _1978, -0.5);
    float _1996 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2000 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2002 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2004 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2006 = fma(_1906, _1994, _1910);
    float _2008 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2010 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1998);
    float _2012 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2000);
    float _2014 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2002);
    float _2016 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2004);
    float _2018 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2010);
    float _2020 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2012);
    float _2022 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2014);
    float _2024 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2026 = -_1914;
    float _2028 = fma(_1912, _1790, _2026);
    float _2030 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2016);
    float _2032 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2018);
    float _2034 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2020);
    float _2036 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2022);
    float _2038 = _1830 + 0.5;
    float _2040 = _1946 + 0.5;
    float _2042 = _2006 + 0.5;
    float _2044 = _2028 + 0.5;
    float _2046 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2030);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_53.x = _2040;
    out.m_53.y = _2038;
    out.m_53.z = _2042;
    out.m_53.w = _2044;
    out.gl_Position.x = _2032;
    out.gl_Position.y = _2034;
    out.gl_Position.z = _2036;
    out.gl_Position.w = _2046;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

