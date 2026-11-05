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
    float4 m_39 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_29 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_41 [[attribute(5)]];
    float4 m_33 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_43 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _656 = false;
    bool _438 = false;
    bool _270 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_26.w;
    float _67 = trunc(_65);
    int _70 = int(_67);
    bool _74 = _70 >= 1;
    float _76 = 0.0;
    if (!_74)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _76;
    float _80 = _78;
    if (!_74)
    {
        out.m_29.x = 0.0;
    }
    int _82 = 0;
    if (!_74)
    {
        float _84 = _78 * 5.0;
        _82 = as_type<int>(_84);
    }
    int _86 = _82;
    int _88 = _86;
    if (!_74)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1025 = as_type<float>(_86);
        out.gl_Position.z = _1025;
    }
    if (!_74)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _90 = in.m_31.w;
    float _92 = in.m_33.z;
    float _94 = in.m_33.w;
    bool _96 = _90 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_90);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_90;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.z = _92;
    out.m_35.w = _94;
    if (_104)
    {
        float _110 = float(_70);
        _80 = _110;
    }
    float _112 = _80;
    bool _114 = _108 >= _112;
    bool _116 = !_104;
    bool _118 = _114 || _116;
    float _120 = _112;
    if (_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (_118)
    {
        out.m_29.x = 0.0;
    }
    if (_118)
    {
        float _124 = _122 * 5.0;
        _88 = as_type<int>(_124);
    }
    int _126 = _88;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1102 = as_type<float>(_126);
        out.gl_Position.z = _1102;
    }
    if (_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_37.w;
    float _130 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _156 = _130;
    if (!_140)
    {
        float _158 = _130 * _130;
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
    bool _170 = !_140;
    float _172 = _168;
    if (!_170)
    {
        float _174 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = log2(_174);
        float _178 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _180 = _178 + 1.0;
        float _182 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = _130 * _176;
        float _186 = 1.0 / _180;
        float _188 = _182 * 0.693147182464599609375;
        float _190 = exp2(_184);
        float _192 = 1.0 / _188;
        float _194 = _190 + (-1.0);
        float _196 = -_194;
        float _198 = fma(_196, _192, _130);
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
        float _218 = _130 * _210;
        float _220 = exp2(_218);
        float _222 = -_220;
        float _224 = _222 + 1.0;
        float _226 = _224 * _216;
        _156 = _226;
    }
    float _228 = _156;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _232 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _234 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _236 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _238 = fma(_228, _142, _232);
    float _240 = fma(_228, _144, _234);
    float _242 = fma(_228, _146, _236);
    float _244 = fma(_238, _128, _148);
    float _246 = fma(_240, _128, _150);
    float _248 = fma(_242, _128, _152);
    bool _250 = !_230;
    float _268;
    if (!_250)
    {
        float _252 = in.m_33.x;
        float _254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _256 = _252 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[11].x, _108);
        float _260 = _258 * _254;
        float _262 = floor(_260);
        float _264 = -_262;
        float _266 = _260 + _264;
        _268 = _266;
        _270 = true;
    }
    else
    {
        float _272 = float(_70);
        float _274 = 1.0 / _272;
        float _276 = _108 * _274;
        _268 = _276;
    }
    _270 = false;
    float _278 = _268;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _282 = _278 + _280;
    bool _284 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _286 = isnan(_278);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _298 = _278 + _296;
    bool _300 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _302 = isnan(_278);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _320 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _322 = isnan(_278);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_294;
    float _334 = _332 + 1.0;
    float _336 = 1.0 / _314;
    float _338 = _330 * _334;
    float _340 = -_330;
    float _342 = _340 + 1.0;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _344;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _350 = 1.0 / _318;
    float _352 = _310 * _342;
    float _354 = -_310;
    float _356 = _354 + 1.0;
    float _358 = _282 * _336;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _364;
    float _368 = fma(_346, _358, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _370 = fma(_362, _358, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _372 = fma(_366, _358, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _374 = _298 * _350;
    float _376 = _368 * _352;
    float _378 = _370 * _352;
    float _380 = _372 * _352;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _394 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[107].x, _376);
    float _396 = fma(_384, _374, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _398 = fma(_388, _374, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _400 = fma(_392, _374, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _402 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[107].y, _378);
    float _404 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[107].z, _380);
    float _406 = fma(_396, _338, _394);
    float _408 = fma(_398, _338, _402);
    float _410 = fma(_400, _338, _404);
    float _412 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[109].x, _406);
    float _414 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[109].y, _408);
    float _416 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[109].z, _410);
    bool _418 = !_348;
    float _436;
    if (!_418)
    {
        float _420 = in.m_33.x;
        float _422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _424 = _420 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _426 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _428 = _426 * _422;
        float _430 = floor(_428);
        float _432 = -_430;
        float _434 = _428 + _432;
        _436 = _434;
        _438 = true;
    }
    else
    {
        float _440 = float(_70);
        float _442 = 1.0 / _440;
        float _444 = _108 * _442;
        _436 = _444;
    }
    _438 = false;
    float _446 = _436;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _450 = _446 + _448;
    float _452 = _412 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _466 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _468 = isnan(_446);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = 1.0 / _456;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _484 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _486 = isnan(_446);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _498 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _500 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _502 = 1.0 / _464;
    float _504 = _460 * _478;
    bool _506 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _508 = isnan(_446);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = 1.0 / _482;
    float _520 = -_476;
    float _522 = _520 + 1.0;
    float _524 = fma(_504, _450, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _530 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _532 = isnan(_446);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -_516;
    float _544 = _542 + 1.0;
    float _546 = _516 * _522;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _552 = 1.0 / _528;
    float _554 = -_540;
    float _556 = _554 + 1.0;
    float _558 = _494 * _544;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _560;
    float _564 = _550 * _502;
    float _566 = _476 * _556;
    float _568 = _524 * _558;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _572 = _446 + _570;
    float _574 = -_494;
    float _576 = _574 + 1.0;
    bool _578 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _580 = isnan(_446);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = _562 * _518;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _598 = _446 + _596;
    float _600 = fma(_564, _572, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _602 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[115].x, _568);
    float _604 = -_588;
    float _606 = _604 + 1.0;
    float _608 = _594 * _552;
    float _610 = fma(_590, _598, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _614 = _446 + _612;
    float _616 = fma(_600, _546, _602);
    float _618 = _540 * _606;
    float _620 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = fma(_608, _614, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _624 = fma(_610, _566, _616);
    float _626 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _628 = fma(_622, _618, _624);
    float _630 = _452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _632 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[119].x, _628);
    float _634 = _632 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_39.x = _630;
    out.m_39.y = _620;
    out.m_39.z = _626;
    out.m_39.w = _634;
    bool _636 = !_500;
    float _654;
    if (!_636)
    {
        float _638 = in.m_33.x;
        float _640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _642 = _638 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[11].z, _108);
        float _646 = _644 * _640;
        float _648 = floor(_646);
        float _650 = -_648;
        float _652 = _646 + _650;
        _654 = _652;
        _656 = true;
    }
    else
    {
        float _658 = float(_70);
        float _660 = 1.0 / _658;
        float _662 = _108 * _660;
        _654 = _662;
    }
    _656 = false;
    float _664 = _654;
    float _666 = in.m_37.x;
    float _668 = in.m_37.y;
    float _670 = in.m_37.z;
    float _672 = _246 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _674 = _246 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _676 = in.m_41.x;
    float _678 = in.m_41.y;
    float _680 = in.m_41.z;
    float _682 = _246 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _692 = in.m_43.w;
    float _694 = 1.0 / _686;
    float _696 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].x, _672);
    float _698 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].x, _674);
    float _700 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].x, _682);
    float _702 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].z, _696);
    float _704 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].z, _698);
    float _706 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].z, _700);
    float _708 = 1.0 / _690;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _712 = _664 + _710;
    float _714 = _704 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _716 = _702 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _718 = _666 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _720 = _668 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _722 = _670 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _724 = _712 * _694;
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _676);
    float _728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _678);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _732 = _664 + _730;
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _680);
    float _736 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _738 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _740 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_45.w = _692;
    float _742 = _732 * _708;
    float _744 = _736 * _726;
    float _746 = _738 * _728;
    bool _748 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _750 = isnan(_664);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _760;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _764;
    bool _768 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _770 = isnan(_664);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _776 = _772 || _774;
    float _778 = float(_776);
    float _780 = _740 * _734;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _782;
    float _786 = fma(_762, _724, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _788 = fma(_766, _724, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _790 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _792 = isnan(_664);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = fma(_784, _724, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _804 = -_758;
    float _806 = _804 + 1.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _812 = _706 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _814 = -_800;
    float _816 = _814 + 1.0;
    float _818 = _778 * _806;
    float _820 = -_778;
    float _822 = _820 + 1.0;
    float _824 = fma(_810, _742, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _826 = _758 * _816;
    float _828 = _786 * _818;
    float _830 = _788 * _818;
    float _832 = _802 * _818;
    float _834 = _746 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _836 = _746 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _842 = _746 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _844 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[25].x, _834);
    float _846 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[24].x, _836);
    float _848 = fma(_840, _742, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _850 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[123].x, _828);
    float _852 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[25].z, _844);
    float _854 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[123].y, _830);
    float _856 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[26].x, _842);
    float _858 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[24].z, _846);
    float _860 = _852 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _866 = fma(_824, _826, _850);
    float _868 = fma(_848, _826, _854);
    float _870 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[26].z, _856);
    float _872 = _858 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _874 = _714 + _860;
    float _876 = fma(_864, _742, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _878 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[123].z, _832);
    float _880 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[125].x, _866);
    float _882 = _870 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _884 = _716 + _872;
    float _886 = _874 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _888 = fma(_876, _826, _878);
    float _890 = _812 + _882;
    float _892 = _874 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _894 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[1].x, _886);
    float _896 = _874 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _898 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[125].y, _868);
    float _900 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[0].x, _892);
    float _902 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[1].z, _894);
    float _904 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[125].z, _888);
    float _906 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[2].x, _896);
    float _908 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[0].z, _900);
    float _910 = _902 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _912 = _874 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _914 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[2].z, _906);
    float _916 = _908 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _918 = _910 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _920 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[3].x, _912);
    float _922 = _910 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _924 = _910 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _926 = _910 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _928 = _914 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _930 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[5].x, _918);
    float _932 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[3].z, _920);
    float _934 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[4].x, _922);
    float _936 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[6].x, _924);
    float _938 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[7].x, _926);
    float _940 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[5].z, _930);
    float _942 = _932 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _944 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[4].z, _934);
    float _946 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[6].z, _936);
    float _948 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[7].z, _938);
    float _950 = _880 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _952 = _898 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _954 = _904 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _956 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[5].w, _940);
    float _958 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = _954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[4].w, _944);
    float _966 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[6].w, _946);
    float _968 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[7].w, _948);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.x = _716;
    out.m_47.y = _714;
    out.m_47.z = _812;
    out.m_49.x = _884;
    out.m_49.y = _874;
    out.m_49.z = _890;
    out.m_51.x = _958;
    out.m_51.y = _960;
    out.m_51.z = _962;
    out.gl_Position.x = _964;
    out.gl_Position.y = _956;
    out.gl_Position.z = _966;
    out.gl_Position.w = _968;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _656 = false;
    bool _438 = false;
    bool _270 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_26.w;
    float _67 = trunc(_65);
    int _70 = int(_67);
    bool _74 = _70 >= 1;
    float _76 = 0.0;
    if (!_74)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _76;
    float _80 = _78;
    if (!_74)
    {
        out.m_29.x = 0.0;
    }
    int _82 = 0;
    if (!_74)
    {
        float _84 = _78 * 5.0;
        _82 = as_type<int>(_84);
    }
    int _86 = _82;
    int _88 = _86;
    if (!_74)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1025 = as_type<float>(_86);
        out.gl_Position.z = _1025;
    }
    if (!_74)
    {
        return out;
    }
    float _90 = in.m_31.w;
    float _92 = in.m_33.z;
    float _94 = in.m_33.w;
    bool _96 = _90 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_90);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_90;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.z = _92;
    out.m_35.w = _94;
    if (_104)
    {
        float _110 = float(_70);
        _80 = _110;
    }
    float _112 = _80;
    bool _114 = _108 >= _112;
    bool _116 = !_104;
    bool _118 = _114 || _116;
    float _120 = _112;
    if (_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (_118)
    {
        out.m_29.x = 0.0;
    }
    if (_118)
    {
        float _124 = _122 * 5.0;
        _88 = as_type<int>(_124);
    }
    int _126 = _88;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1102 = as_type<float>(_126);
        out.gl_Position.z = _1102;
    }
    if (_118)
    {
        return out;
    }
    float _128 = in.m_37.w;
    float _130 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _156 = _130;
    if (!_140)
    {
        float _158 = _130 * _130;
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
    bool _170 = !_140;
    float _172 = _168;
    if (!_170)
    {
        float _174 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = log2(_174);
        float _178 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _180 = _178 + 1.0;
        float _182 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = _130 * _176;
        float _186 = 1.0 / _180;
        float _188 = _182 * 0.693147182464599609375;
        float _190 = exp2(_184);
        float _192 = 1.0 / _188;
        float _194 = _190 + (-1.0);
        float _196 = -_194;
        float _198 = fma(_196, _192, _130);
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
        float _218 = _130 * _210;
        float _220 = exp2(_218);
        float _222 = -_220;
        float _224 = _222 + 1.0;
        float _226 = _224 * _216;
        _156 = _226;
    }
    float _228 = _156;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _232 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _234 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _236 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _238 = fma(_228, _142, _232);
    float _240 = fma(_228, _144, _234);
    float _242 = fma(_228, _146, _236);
    float _244 = fma(_238, _128, _148);
    float _246 = fma(_240, _128, _150);
    float _248 = fma(_242, _128, _152);
    bool _250 = !_230;
    float _268;
    if (!_250)
    {
        float _252 = in.m_33.x;
        float _254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _256 = _252 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[11].x, _108);
        float _260 = _258 * _254;
        float _262 = floor(_260);
        float _264 = -_262;
        float _266 = _260 + _264;
        _268 = _266;
        _270 = true;
    }
    else
    {
        float _272 = float(_70);
        float _274 = 1.0 / _272;
        float _276 = _108 * _274;
        _268 = _276;
    }
    _270 = false;
    float _278 = _268;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _282 = _278 + _280;
    bool _284 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _286 = isnan(_278);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _298 = _278 + _296;
    bool _300 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _302 = isnan(_278);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _320 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _322 = isnan(_278);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_294;
    float _334 = _332 + 1.0;
    float _336 = 1.0 / _314;
    float _338 = _330 * _334;
    float _340 = -_330;
    float _342 = _340 + 1.0;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _344;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _350 = 1.0 / _318;
    float _352 = _310 * _342;
    float _354 = -_310;
    float _356 = _354 + 1.0;
    float _358 = _282 * _336;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _364;
    float _368 = fma(_346, _358, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _370 = fma(_362, _358, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _372 = fma(_366, _358, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _374 = _298 * _350;
    float _376 = _368 * _352;
    float _378 = _370 * _352;
    float _380 = _372 * _352;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _394 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[107].x, _376);
    float _396 = fma(_384, _374, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _398 = fma(_388, _374, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _400 = fma(_392, _374, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _402 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[107].y, _378);
    float _404 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[107].z, _380);
    float _406 = fma(_396, _338, _394);
    float _408 = fma(_398, _338, _402);
    float _410 = fma(_400, _338, _404);
    float _412 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[109].x, _406);
    float _414 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[109].y, _408);
    float _416 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[109].z, _410);
    bool _418 = !_348;
    float _436;
    if (!_418)
    {
        float _420 = in.m_33.x;
        float _422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _424 = _420 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _426 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _428 = _426 * _422;
        float _430 = floor(_428);
        float _432 = -_430;
        float _434 = _428 + _432;
        _436 = _434;
        _438 = true;
    }
    else
    {
        float _440 = float(_70);
        float _442 = 1.0 / _440;
        float _444 = _108 * _442;
        _436 = _444;
    }
    _438 = false;
    float _446 = _436;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _450 = _446 + _448;
    float _452 = _412 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _466 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _468 = isnan(_446);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = 1.0 / _456;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _484 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _486 = isnan(_446);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _498 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _500 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _502 = 1.0 / _464;
    float _504 = _460 * _478;
    bool _506 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _508 = isnan(_446);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = 1.0 / _482;
    float _520 = -_476;
    float _522 = _520 + 1.0;
    float _524 = fma(_504, _450, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _530 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _532 = isnan(_446);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -_516;
    float _544 = _542 + 1.0;
    float _546 = _516 * _522;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _552 = 1.0 / _528;
    float _554 = -_540;
    float _556 = _554 + 1.0;
    float _558 = _494 * _544;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _560;
    float _564 = _550 * _502;
    float _566 = _476 * _556;
    float _568 = _524 * _558;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _572 = _446 + _570;
    float _574 = -_494;
    float _576 = _574 + 1.0;
    bool _578 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _580 = isnan(_446);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = _562 * _518;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _598 = _446 + _596;
    float _600 = fma(_564, _572, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _602 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[115].x, _568);
    float _604 = -_588;
    float _606 = _604 + 1.0;
    float _608 = _594 * _552;
    float _610 = fma(_590, _598, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _614 = _446 + _612;
    float _616 = fma(_600, _546, _602);
    float _618 = _540 * _606;
    float _620 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = fma(_608, _614, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _624 = fma(_610, _566, _616);
    float _626 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _628 = fma(_622, _618, _624);
    float _630 = _452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _632 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[119].x, _628);
    float _634 = _632 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_39.x = _630;
    out.m_39.y = _620;
    out.m_39.z = _626;
    out.m_39.w = _634;
    bool _636 = !_500;
    float _654;
    if (!_636)
    {
        float _638 = in.m_33.x;
        float _640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _642 = _638 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[11].z, _108);
        float _646 = _644 * _640;
        float _648 = floor(_646);
        float _650 = -_648;
        float _652 = _646 + _650;
        _654 = _652;
        _656 = true;
    }
    else
    {
        float _658 = float(_70);
        float _660 = 1.0 / _658;
        float _662 = _108 * _660;
        _654 = _662;
    }
    _656 = false;
    float _664 = _654;
    float _666 = in.m_37.x;
    float _668 = in.m_37.y;
    float _670 = in.m_37.z;
    float _672 = _246 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _674 = _246 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _676 = in.m_41.x;
    float _678 = in.m_41.y;
    float _680 = in.m_41.z;
    float _682 = _246 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _692 = in.m_43.w;
    float _694 = 1.0 / _686;
    float _696 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].x, _672);
    float _698 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].x, _674);
    float _700 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].x, _682);
    float _702 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].z, _696);
    float _704 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].z, _698);
    float _706 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].z, _700);
    float _708 = 1.0 / _690;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _712 = _664 + _710;
    float _714 = _704 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _716 = _702 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _718 = _666 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _720 = _668 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _722 = _670 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _724 = _712 * _694;
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _676);
    float _728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _678);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _732 = _664 + _730;
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _680);
    float _736 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _738 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _740 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_45.w = _692;
    float _742 = _732 * _708;
    float _744 = _736 * _726;
    float _746 = _738 * _728;
    bool _748 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _750 = isnan(_664);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _760;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _764;
    bool _768 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _770 = isnan(_664);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _776 = _772 || _774;
    float _778 = float(_776);
    float _780 = _740 * _734;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _782;
    float _786 = fma(_762, _724, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _788 = fma(_766, _724, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _790 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _792 = isnan(_664);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = fma(_784, _724, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _804 = -_758;
    float _806 = _804 + 1.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _812 = _706 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _814 = -_800;
    float _816 = _814 + 1.0;
    float _818 = _778 * _806;
    float _820 = -_778;
    float _822 = _820 + 1.0;
    float _824 = fma(_810, _742, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _826 = _758 * _816;
    float _828 = _786 * _818;
    float _830 = _788 * _818;
    float _832 = _802 * _818;
    float _834 = _746 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _836 = _746 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _842 = _746 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _844 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[25].x, _834);
    float _846 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[24].x, _836);
    float _848 = fma(_840, _742, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _850 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[123].x, _828);
    float _852 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[25].z, _844);
    float _854 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[123].y, _830);
    float _856 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[26].x, _842);
    float _858 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[24].z, _846);
    float _860 = _852 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _866 = fma(_824, _826, _850);
    float _868 = fma(_848, _826, _854);
    float _870 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[26].z, _856);
    float _872 = _858 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _874 = _714 + _860;
    float _876 = fma(_864, _742, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _878 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[123].z, _832);
    float _880 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[125].x, _866);
    float _882 = _870 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _884 = _716 + _872;
    float _886 = _874 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _888 = fma(_876, _826, _878);
    float _890 = _812 + _882;
    float _892 = _874 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _894 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[1].x, _886);
    float _896 = _874 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _898 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[125].y, _868);
    float _900 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[0].x, _892);
    float _902 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[1].z, _894);
    float _904 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[125].z, _888);
    float _906 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[2].x, _896);
    float _908 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[0].z, _900);
    float _910 = _902 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _912 = _874 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _914 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[2].z, _906);
    float _916 = _908 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _918 = _910 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _920 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[3].x, _912);
    float _922 = _910 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _924 = _910 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _926 = _910 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _928 = _914 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _930 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[5].x, _918);
    float _932 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[3].z, _920);
    float _934 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[4].x, _922);
    float _936 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[6].x, _924);
    float _938 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[7].x, _926);
    float _940 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[5].z, _930);
    float _942 = _932 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _944 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[4].z, _934);
    float _946 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[6].z, _936);
    float _948 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[7].z, _938);
    float _950 = _880 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _952 = _898 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _954 = _904 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _956 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[5].w, _940);
    float _958 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = _954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[4].w, _944);
    float _966 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[6].w, _946);
    float _968 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[7].w, _948);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.x = _716;
    out.m_47.y = _714;
    out.m_47.z = _812;
    out.m_49.x = _884;
    out.m_49.y = _874;
    out.m_49.z = _890;
    out.m_51.x = _958;
    out.m_51.y = _960;
    out.m_51.z = _962;
    out.gl_Position.x = _964;
    out.gl_Position.y = _956;
    out.gl_Position.z = _966;
    out.gl_Position.w = _968;
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
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _656 = false;
    bool _438 = false;
    bool _270 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_26.w;
    float _67 = trunc(_65);
    int _70 = int(_67);
    bool _74 = _70 >= 1;
    float _76 = 0.0;
    if (!_74)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _76;
    float _80 = _78;
    if (!_74)
    {
        out.m_29.x = 0.0;
    }
    int _82 = 0;
    if (!_74)
    {
        float _84 = _78 * 5.0;
        _82 = as_type<int>(_84);
    }
    int _86 = _82;
    int _88 = _86;
    if (!_74)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1025 = as_type<float>(_86);
        out.gl_Position.z = _1025;
    }
    if (!_74)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _90 = in.m_31.w;
    float _92 = in.m_33.z;
    float _94 = in.m_33.w;
    bool _96 = _90 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_90);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_90;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.z = _92;
    out.m_35.w = _94;
    if (_104)
    {
        float _110 = float(_70);
        _80 = _110;
    }
    float _112 = _80;
    bool _114 = _108 >= _112;
    bool _116 = !_104;
    bool _118 = _114 || _116;
    float _120 = _112;
    if (_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (_118)
    {
        out.m_29.x = 0.0;
    }
    if (_118)
    {
        float _124 = _122 * 5.0;
        _88 = as_type<int>(_124);
    }
    int _126 = _88;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1102 = as_type<float>(_126);
        out.gl_Position.z = _1102;
    }
    if (_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_37.w;
    float _130 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _156 = _130;
    if (!_140)
    {
        float _158 = _130 * _130;
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
    bool _170 = !_140;
    float _172 = _168;
    if (!_170)
    {
        float _174 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = log2(_174);
        float _178 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _180 = _178 + 1.0;
        float _182 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = _130 * _176;
        float _186 = 1.0 / _180;
        float _188 = _182 * 0.693147182464599609375;
        float _190 = exp2(_184);
        float _192 = 1.0 / _188;
        float _194 = _190 + (-1.0);
        float _196 = -_194;
        float _198 = fma(_196, _192, _130);
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
        float _218 = _130 * _210;
        float _220 = exp2(_218);
        float _222 = -_220;
        float _224 = _222 + 1.0;
        float _226 = _224 * _216;
        _156 = _226;
    }
    float _228 = _156;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _232 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _234 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _236 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _238 = fma(_228, _142, _232);
    float _240 = fma(_228, _144, _234);
    float _242 = fma(_228, _146, _236);
    float _244 = fma(_238, _128, _148);
    float _246 = fma(_240, _128, _150);
    float _248 = fma(_242, _128, _152);
    bool _250 = !_230;
    float _268;
    if (!_250)
    {
        float _252 = in.m_33.x;
        float _254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _256 = _252 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _258 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[11].x, _108);
        float _260 = _258 * _254;
        float _262 = floor(_260);
        float _264 = -_262;
        float _266 = _260 + _264;
        _268 = _266;
        _270 = true;
    }
    else
    {
        float _272 = float(_70);
        float _274 = 1.0 / _272;
        float _276 = _108 * _274;
        _268 = _276;
    }
    _270 = false;
    float _278 = _268;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _282 = _278 + _280;
    bool _284 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _286 = isnan(_278);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _298 = _278 + _296;
    bool _300 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _302 = isnan(_278);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _320 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _322 = isnan(_278);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_294;
    float _334 = _332 + 1.0;
    float _336 = 1.0 / _314;
    float _338 = _330 * _334;
    float _340 = -_330;
    float _342 = _340 + 1.0;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _344;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _350 = 1.0 / _318;
    float _352 = _310 * _342;
    float _354 = -_310;
    float _356 = _354 + 1.0;
    float _358 = _282 * _336;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _364;
    float _368 = fma(_346, _358, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _370 = fma(_362, _358, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _372 = fma(_366, _358, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _374 = _298 * _350;
    float _376 = _368 * _352;
    float _378 = _370 * _352;
    float _380 = _372 * _352;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _394 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[107].x, _376);
    float _396 = fma(_384, _374, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _398 = fma(_388, _374, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _400 = fma(_392, _374, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _402 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[107].y, _378);
    float _404 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[107].z, _380);
    float _406 = fma(_396, _338, _394);
    float _408 = fma(_398, _338, _402);
    float _410 = fma(_400, _338, _404);
    float _412 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[109].x, _406);
    float _414 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[109].y, _408);
    float _416 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[109].z, _410);
    bool _418 = !_348;
    float _436;
    if (!_418)
    {
        float _420 = in.m_33.x;
        float _422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _424 = _420 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _426 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _428 = _426 * _422;
        float _430 = floor(_428);
        float _432 = -_430;
        float _434 = _428 + _432;
        _436 = _434;
        _438 = true;
    }
    else
    {
        float _440 = float(_70);
        float _442 = 1.0 / _440;
        float _444 = _108 * _442;
        _436 = _444;
    }
    _438 = false;
    float _446 = _436;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _450 = _446 + _448;
    float _452 = _412 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _466 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _468 = isnan(_446);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = 1.0 / _456;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _484 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _486 = isnan(_446);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _498 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _500 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _502 = 1.0 / _464;
    float _504 = _460 * _478;
    bool _506 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _508 = isnan(_446);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = 1.0 / _482;
    float _520 = -_476;
    float _522 = _520 + 1.0;
    float _524 = fma(_504, _450, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _530 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _532 = isnan(_446);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -_516;
    float _544 = _542 + 1.0;
    float _546 = _516 * _522;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _552 = 1.0 / _528;
    float _554 = -_540;
    float _556 = _554 + 1.0;
    float _558 = _494 * _544;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _560;
    float _564 = _550 * _502;
    float _566 = _476 * _556;
    float _568 = _524 * _558;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _572 = _446 + _570;
    float _574 = -_494;
    float _576 = _574 + 1.0;
    bool _578 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _580 = isnan(_446);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = _562 * _518;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _598 = _446 + _596;
    float _600 = fma(_564, _572, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _602 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[115].x, _568);
    float _604 = -_588;
    float _606 = _604 + 1.0;
    float _608 = _594 * _552;
    float _610 = fma(_590, _598, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _614 = _446 + _612;
    float _616 = fma(_600, _546, _602);
    float _618 = _540 * _606;
    float _620 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = fma(_608, _614, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _624 = fma(_610, _566, _616);
    float _626 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _628 = fma(_622, _618, _624);
    float _630 = _452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _632 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[119].x, _628);
    float _634 = _632 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_39.x = _630;
    out.m_39.y = _620;
    out.m_39.z = _626;
    out.m_39.w = _634;
    bool _636 = !_500;
    float _654;
    if (!_636)
    {
        float _638 = in.m_33.x;
        float _640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _642 = _638 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[11].z, _108);
        float _646 = _644 * _640;
        float _648 = floor(_646);
        float _650 = -_648;
        float _652 = _646 + _650;
        _654 = _652;
        _656 = true;
    }
    else
    {
        float _658 = float(_70);
        float _660 = 1.0 / _658;
        float _662 = _108 * _660;
        _654 = _662;
    }
    _656 = false;
    float _664 = _654;
    float _666 = in.m_37.x;
    float _668 = in.m_37.y;
    float _670 = in.m_37.z;
    float _672 = _246 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _674 = _246 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _676 = in.m_41.x;
    float _678 = in.m_41.y;
    float _680 = in.m_41.z;
    float _682 = _246 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _692 = in.m_43.w;
    float _694 = 1.0 / _686;
    float _696 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].x, _672);
    float _698 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].x, _674);
    float _700 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].x, _682);
    float _702 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].z, _696);
    float _704 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].z, _698);
    float _706 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].z, _700);
    float _708 = 1.0 / _690;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _712 = _664 + _710;
    float _714 = _704 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _716 = _702 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _718 = _666 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _720 = _668 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _722 = _670 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _724 = _712 * _694;
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _676);
    float _728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _678);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _732 = _664 + _730;
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _680);
    float _736 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _738 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _740 = _722 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_45.w = _692;
    float _742 = _732 * _708;
    float _744 = _736 * _726;
    float _746 = _738 * _728;
    bool _748 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _750 = isnan(_664);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _760;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _764;
    bool _768 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _770 = isnan(_664);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _776 = _772 || _774;
    float _778 = float(_776);
    float _780 = _740 * _734;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _782;
    float _786 = fma(_762, _724, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _788 = fma(_766, _724, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _790 = _664 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _792 = isnan(_664);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = fma(_784, _724, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _804 = -_758;
    float _806 = _804 + 1.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _812 = _706 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _814 = -_800;
    float _816 = _814 + 1.0;
    float _818 = _778 * _806;
    float _820 = -_778;
    float _822 = _820 + 1.0;
    float _824 = fma(_810, _742, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _826 = _758 * _816;
    float _828 = _786 * _818;
    float _830 = _788 * _818;
    float _832 = _802 * _818;
    float _834 = _746 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _836 = _746 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _842 = _746 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _844 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[25].x, _834);
    float _846 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[24].x, _836);
    float _848 = fma(_840, _742, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _850 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[123].x, _828);
    float _852 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[25].z, _844);
    float _854 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[123].y, _830);
    float _856 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[26].x, _842);
    float _858 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[24].z, _846);
    float _860 = _852 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _866 = fma(_824, _826, _850);
    float _868 = fma(_848, _826, _854);
    float _870 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[26].z, _856);
    float _872 = _858 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _874 = _714 + _860;
    float _876 = fma(_864, _742, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _878 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[123].z, _832);
    float _880 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[125].x, _866);
    float _882 = _870 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _884 = _716 + _872;
    float _886 = _874 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _888 = fma(_876, _826, _878);
    float _890 = _812 + _882;
    float _892 = _874 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _894 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[1].x, _886);
    float _896 = _874 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _898 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[125].y, _868);
    float _900 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[0].x, _892);
    float _902 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[1].z, _894);
    float _904 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[125].z, _888);
    float _906 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[2].x, _896);
    float _908 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[0].z, _900);
    float _910 = _902 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _912 = _874 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _914 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[2].z, _906);
    float _916 = _908 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _918 = _910 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _920 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[3].x, _912);
    float _922 = _910 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _924 = _910 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _926 = _910 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _928 = _914 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _930 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[5].x, _918);
    float _932 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[3].z, _920);
    float _934 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[4].x, _922);
    float _936 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[6].x, _924);
    float _938 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[7].x, _926);
    float _940 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[5].z, _930);
    float _942 = _932 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _944 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[4].z, _934);
    float _946 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[6].z, _936);
    float _948 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[7].z, _938);
    float _950 = _880 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _952 = _898 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _954 = _904 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _956 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[5].w, _940);
    float _958 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = _954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[4].w, _944);
    float _966 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[6].w, _946);
    float _968 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[7].w, _948);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_47.x = _716;
    out.m_47.y = _714;
    out.m_47.z = _812;
    out.m_49.x = _884;
    out.m_49.y = _874;
    out.m_49.z = _890;
    out.m_51.x = _958;
    out.m_51.y = _960;
    out.m_51.z = _962;
    out.gl_Position.x = _964;
    out.gl_Position.y = _956;
    out.gl_Position.z = _966;
    out.gl_Position.w = _968;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

