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
    float4 m_45 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_43 [[attribute(4)]];
    float4 m_39 [[attribute(5)]];
    float4 m_41 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_30.w;
    float _67 = trunc(_65);
    int _70 = int(_67);
    bool _74 = _70 >= 1;
    float _76 = 0.0;
    float _78 = as_type<float>(_70);
    if (!_74)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _80 = _76;
    if (!_74)
    {
        out.m_33.x = 0.0;
    }
    int _82 = 0;
    if (!_74)
    {
        float _84 = _80 * 5.0;
        _82 = as_type<int>(_84);
    }
    int _86 = _82;
    int _88 = _86;
    if (!_74)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _985 = as_type<float>(_86);
        out.gl_Position.z = _985;
    }
    if (!_74)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _90 = in.m_35.w;
    bool _92 = _90 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _94 = isnan(_90);
    bool _96 = _92 || _94;
    bool _98 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _100 = _96 || _98;
    float _102 = -_90;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_100)
    {
        float _106 = float(_70);
        _78 = _106;
    }
    float _108 = _78;
    bool _110 = _104 >= _108;
    bool _112 = !_100;
    bool _114 = _110 || _112;
    float _116 = _108;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _120 = _118 * 5.0;
        _88 = as_type<int>(_120);
    }
    int _122 = _88;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1054 = as_type<float>(_122);
        out.gl_Position.z = _1054;
    }
    if (_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_35.x;
    float _126 = in.m_35.y;
    float _128 = in.m_35.z;
    float _130 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _132 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _134 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = in.m_30.x;
    float _144 = in.m_30.y;
    float _146 = in.m_30.z;
    float _148 = in.m_37.x;
    float _150 = in.m_37.y;
    float _152 = in.m_37.z;
    float _154 = in.m_37.w;
    float _156 = 0.0;
    float _158 = _130;
    if (!_140)
    {
        float _160 = _130 * _130;
        float _162 = _160 * 0.5;
        _156 = _162;
    }
    float _164 = _156;
    float _166 = _164;
    if (!_140)
    {
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _168;
    }
    float _170 = _166;
    bool _172 = !_140;
    float _174 = _170;
    if (!_172)
    {
        float _176 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = log2(_176);
        float _180 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _182 = _180 + 1.0;
        float _184 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = _130 * _178;
        float _188 = exp2(_186);
        float _190 = _184 * 0.693147182464599609375;
        float _192 = 1.0 / _190;
        float _194 = 1.0 / _182;
        float _196 = _188 + (-1.0);
        float _198 = -_196;
        float _200 = fma(_198, _192, _130);
        float _202 = _200 * _194;
        float _204 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _204;
    }
    float _206 = _174;
    bool _208 = !_140;
    if (!_208)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = 1.0 / _216;
        float _220 = _130 * _212;
        float _222 = exp2(_220);
        float _224 = -_222;
        float _226 = _224 + 1.0;
        float _228 = _226 * _218;
        _158 = _228;
    }
    float _230 = _158;
    float _232 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _234 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _236 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _238 = fma(_230, _126, _232);
    float _240 = fma(_230, _124, _234);
    float _242 = fma(_230, _128, _236);
    float _244 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _246 = fma(_238, _154, _144);
    float _248 = in.m_39.x;
    float _250 = in.m_39.y;
    float _252 = in.m_39.z;
    float _254 = fma(_240, _154, _142);
    float _256 = fma(_242, _154, _146);
    float _258 = _246 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _260 = in.m_41.x;
    float _262 = _246 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _264 = _246 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _266 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].x, _258);
    float _268 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _270 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].x, _262);
    float _272 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].x, _264);
    float _274 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _266);
    float _276 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _270);
    float _278 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _272);
    float _280 = _274 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _282 = _276 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _284 = _278 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _286 = -_280;
    float _288 = _286 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _290 = -_282;
    float _292 = _290 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _294 = -_284;
    float _296 = _294 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _298 = _288 * _288;
    float _300 = _250 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _302 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _260);
    float _304 = fma(_292, _292, _298);
    float _306 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[191].y, _300);
    float _308 = fma(_296, _296, _304);
    float _310 = _306 * 6.283185482025146484375;
    float _312 = rsqrt(_308);
    float _314 = in.m_43.x;
    float _316 = in.m_43.y;
    float _318 = in.m_43.z;
    float _320 = _310 * 0.15915493667125701904296875;
    float _322 = _320 * 6.283185482025146484375;
    float _324 = sin(_322);
    float _326 = _292 * _312;
    float _328 = _296 * _312;
    float _330 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _332 = _326 * _330;
    float _334 = _324 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _336 = _288 * _312;
    float _338 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _340 = _328 * _338;
    float _342 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _344 = -_332;
    float _346 = fma(_328, _342, _344);
    float _348 = fma(_316, _334, _250);
    float _350 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _352 = _336 * _350;
    float _354 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _356 = -_340;
    float _358 = fma(_336, _354, _356);
    float _360 = _346 * _346;
    float _362 = fma(_314, _334, _248);
    float _364 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _366 = -_352;
    float _368 = fma(_326, _364, _366);
    float _370 = fma(_318, _334, _252);
    float _372 = fma(_358, _358, _360);
    bool _374 = _348 != 0.0;
    bool _376 = isnan(_348);
    bool _378 = _374 || _376;
    bool _380 = isnan(0.0);
    bool _382 = _378 || _380;
    float _384 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _386 = fma(_368, _368, _372);
    bool _388 = _362 == 0.0;
    bool _390 = !_382;
    bool _392 = _388 && _390;
    float _394 = _244 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _396 = _268 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _398 = rsqrt(_386);
    bool _400 = _370 == 0.0;
    bool _402 = _400 && _392;
    float _404 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _348);
    float _406 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _362);
    float _410 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _370);
    float _412 = _396 * _404;
    bool _414 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _416 = isnan(0.5);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _422 = _418 || _420;
    float _424 = _406 * _408;
    float _426 = _394 * _410;
    float _428 = _280 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _430 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _432 = isnan(0.5);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _438 = _434 || _436;
    float _440 = _314;
    float _442 = _316;
    float _444 = _410;
    float _446 = _280;
    if (!_402)
    {
        float _448 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[17].y, _314);
        _440 = _448;
    }
    float _450 = _440;
    if (!_402)
    {
        float _452 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[17].y, _316);
        _442 = _452;
    }
    float _454 = _442;
    float _456 = _358 * _398;
    float _458 = _346 * _398;
    float _460 = _368 * _398;
    if (_402)
    {
        _444 = _318;
    }
    float _462 = _444;
    float _464 = _336 * _456;
    float _466 = _328 * _458;
    float _468 = _462;
    if (!_402)
    {
        float _470 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[17].y, _318);
        _468 = _470;
    }
    float _472 = _468;
    float _474 = fma(_282, (*spvDescriptorSet0.vp_c8)._m0[11].x, _428);
    float _476 = -_464;
    float _478 = fma(_326, _458, _476);
    float _480 = -_466;
    float _482 = fma(_336, _460, _480);
    float _484 = _280 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _486 = fma(_284, (*spvDescriptorSet0.vp_c8)._m0[11].z, _474);
    float _488 = _412 * _478;
    float _490 = _412 * _482;
    float _492 = fma(_282, (*spvDescriptorSet0.vp_c8)._m0[10].x, _484);
    float _494 = _486 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _496 = fma(_424, _460, _488);
    float _498 = fma(_424, _456, _490);
    float _500 = _326 * _460;
    float _502 = 1.0 / _494;
    float _504 = fma(_426, _328, _496);
    float _506 = fma(_426, _326, _498);
    float _508 = fma(_284, (*spvDescriptorSet0.vp_c8)._m0[10].z, _492);
    float _510 = -_500;
    float _512 = fma(_328, _456, _510);
    float _514 = _284 + _504;
    float _516 = _282 + _506;
    float _518 = _482 * _454;
    float _520 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _522 = _514 + _520;
    float _524 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _526 = _516 + _524;
    float _528 = _508 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _530 = fma(_456, _450, _518);
    float _532 = _522 * _522;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _536 = _528 + _494;
    float _538 = _412 * _512;
    float _540 = fma(_526, _526, _532);
    float _542 = _478 * _454;
    float _544 = _512 * _454;
    float _546 = _536 * _502;
    float _548 = _546 * 0.5;
    float _550 = sqrt(_540);
    float _552 = fma(_460, _450, _542);
    float _554 = fma(_458, _450, _544);
    float _556 = fma(_326, _472, _530);
    out.m_45.w = _534;
    float _558 = fma(_424, _458, _538);
    float _560 = fma(_328, _472, _552);
    float _562 = fma(_336, _472, _554);
    float _564 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _566 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[30].w, _564);
    float _568 = fma(_426, _336, _558);
    out.m_47.x = _556;
    out.m_47.y = _562;
    out.m_47.z = _560;
    float _570 = _280 + _568;
    float _572 = 1.0 / _566;
    bool _574 = _550 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _576 = _568;
    float _578 = _560;
    float _580 = _562;
    float _582 = _556;
    if (!_574)
    {
        _576 = _516;
    }
    float _584 = _576;
    float _586 = _584;
    if (!_574)
    {
        _578 = _514;
    }
    float _588 = _578;
    float _590 = _588;
    if (!_574)
    {
        _580 = _570;
    }
    float _592 = _580;
    bool _594 = !_574;
    float _596 = _592;
    if (!_594)
    {
        float _598 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _600 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _602 = _550 + _600;
        float _604 = _570 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _606 = rsqrt(_540);
        float _608 = _602 * _598;
        float _610 = _608 * 0.15915493667125701904296875;
        float _612 = _610 * 6.283185482025146484375;
        float _614 = cos(_612);
        float _616 = _610 * 6.283185482025146484375;
        float _618 = sin(_616);
        float _620 = _614 + (-1.0);
        float _622 = _620 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _624 = fma(_618, _604, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _626 = fma(_570, _614, _622);
        float _628 = _606 * _624;
        float _630 = fma(_526, _628, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _632 = fma(_522, _628, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _586 = _630;
        _590 = _632;
        _596 = _626;
        _582 = _618;
    }
    float _634 = _586;
    float _636 = _590;
    float _638 = _596;
    float _640 = _582;
    float _642 = _640;
    float _644 = _638;
    float _646 = _636;
    float _648 = _634;
    if (_422)
    {
        _642 = _634;
    }
    float _650 = _642;
    float _652 = _650;
    if (!_422)
    {
        float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _656 = _280 + _654;
        float _658 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _660 = _282 + _658;
        float _662 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _664 = -_284;
        float _666 = _664 + _636;
        float _668 = _656 * _656;
        float _670 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _672 = _284 + _670;
        float _674 = fma(_660, _660, _668);
        float _676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _678 = fma(_672, _672, _674);
        float _680 = sqrt(_678);
        float _682 = _662 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _684 = precise::min(_680, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _686 = _684 * _676;
        float _688 = -_282;
        float _690 = _688 + _634;
        float _692 = -_280;
        float _694 = _692 + _638;
        float _696 = _682 * _686;
        float _698 = fma(_690, _696, _282);
        float _700 = fma(_694, _696, _280);
        float _702 = fma(_666, _696, _284);
        _644 = _700;
        _652 = _698;
        _646 = _702;
        _648 = _694;
    }
    float _704 = _644;
    float _706 = _652;
    float _708 = _646;
    float _710 = _648;
    float _712 = _704 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _714 = _710;
    if (_438)
    {
        _714 = 1.0;
    }
    float _716 = _714;
    float _718 = _704 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _720 = _716;
    if (_438)
    {
        _446 = 1.0;
    }
    float _722 = _446;
    float _724 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[1].x, _712);
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _728 = _572 * _726;
    float _730 = _722;
    if (!_438)
    {
        float _732 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _734 = _732 * 0.15915493667125701904296875;
        float _736 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _738 = _734 * 6.283185482025146484375;
        float _740 = cos(_738);
        float _742 = _736 * 0.15915493667125701904296875;
        float _744 = _734 * 6.283185482025146484375;
        float _746 = sin(_744);
        float _748 = 1.0 / _740;
        float _750 = _742 * 6.283185482025146484375;
        float _752 = cos(_750);
        float _754 = _746 * _748;
        float _756 = _742 * 6.283185482025146484375;
        float _758 = sin(_756);
        float _760 = _752 * _754;
        float _762 = 1.0 / _760;
        float _764 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _766 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _764;
        float _768 = 1.0 / _766;
        float _770 = _758 * _762;
        float _772 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _774 = fma(_728, _770, _772);
        float _776 = _774 * _768;
        float _778 = precise::clamp(_776, 0.0, 1.0);
        _720 = _778;
    }
    float _780 = _720;
    if (!_438)
    {
        float _782 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _784 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _786 = _782 * 0.15915493667125701904296875;
        float _788 = _784 * 0.15915493667125701904296875;
        float _790 = _786 * 6.283185482025146484375;
        float _792 = cos(_790);
        float _794 = _786 * 6.283185482025146484375;
        float _796 = sin(_794);
        float _798 = 1.0 / _792;
        float _800 = _788 * 6.283185482025146484375;
        float _802 = cos(_800);
        float _804 = _796 * _798;
        float _806 = _788 * 6.283185482025146484375;
        float _808 = sin(_806);
        float _810 = _802 * _804;
        float _812 = 1.0 / _810;
        float _814 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _816 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _814;
        float _818 = 1.0 / _816;
        float _820 = _808 * _812;
        float _822 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _824 = fma(_728, _820, _822);
        float _826 = _824 * _818;
        float _828 = precise::clamp(_826, 0.0, 1.0);
        float _830 = -_828;
        float _832 = _830 + 1.0;
        _730 = _832;
    }
    float _834 = _730;
    float _836 = _704 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _838 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[0].x, _718);
    float _840 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[1].z, _724);
    float _842 = _704 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _844 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[2].x, _836);
    float _846 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[0].z, _838);
    float _848 = _840 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _850 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[3].x, _842);
    float _852 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[2].z, _844);
    float _854 = _846 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _856 = _848 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _858 = _848 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _860 = _848 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _862 = _848 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _864 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[4].x, _856);
    float _866 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[6].x, _858);
    float _868 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[7].x, _860);
    float _870 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[3].z, _850);
    float _872 = _852 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _874 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[5].x, _862);
    bool _876 = _780 > 0.0;
    bool _878 = isnan(_780);
    bool _880 = _876 || _878;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    float _886 = _780 * _834;
    float _888 = _870 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _890 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[4].z, _864);
    float _892 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[6].z, _866);
    float _894 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[7].z, _868);
    bool _896 = _834 <= 0.0;
    bool _898 = !_884;
    bool _900 = _896 || _898;
    float _902 = _886 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _904 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[5].z, _874);
    float _906 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[4].w, _890);
    float _908 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[7].w, _894);
    float _910 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[6].w, _892);
    float _912 = _902 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _914 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[5].w, _904);
    float _916 = _906 + _908;
    float _918 = _910 + _908;
    float _920 = _908 * 0.5;
    float _922 = _916 * 0.5;
    float _924 = _918 * 0.5;
    float _926 = fma(_914, -0.5, _920);
    out.m_49.x = _706;
    out.m_49.y = _704;
    out.m_49.z = _708;
    out.m_33.x = _912;
    out.gl_Position.x = _906;
    out.gl_Position.y = _914;
    out.gl_Position.z = _910;
    out.gl_Position.w = _908;
    out.m_51.x = _922;
    out.m_51.y = _926;
    out.m_51.z = _924;
    out.m_51.w = _908;
    if (!_900)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _928 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _928;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_30.w;
    float _67 = trunc(_65);
    int _70 = int(_67);
    bool _74 = _70 >= 1;
    float _76 = 0.0;
    float _78 = as_type<float>(_70);
    if (!_74)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _80 = _76;
    if (!_74)
    {
        out.m_33.x = 0.0;
    }
    int _82 = 0;
    if (!_74)
    {
        float _84 = _80 * 5.0;
        _82 = as_type<int>(_84);
    }
    int _86 = _82;
    int _88 = _86;
    if (!_74)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _985 = as_type<float>(_86);
        out.gl_Position.z = _985;
    }
    if (!_74)
    {
        return out;
    }
    float _90 = in.m_35.w;
    bool _92 = _90 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _94 = isnan(_90);
    bool _96 = _92 || _94;
    bool _98 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _100 = _96 || _98;
    float _102 = -_90;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_100)
    {
        float _106 = float(_70);
        _78 = _106;
    }
    float _108 = _78;
    bool _110 = _104 >= _108;
    bool _112 = !_100;
    bool _114 = _110 || _112;
    float _116 = _108;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _120 = _118 * 5.0;
        _88 = as_type<int>(_120);
    }
    int _122 = _88;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1054 = as_type<float>(_122);
        out.gl_Position.z = _1054;
    }
    if (_114)
    {
        return out;
    }
    float _124 = in.m_35.x;
    float _126 = in.m_35.y;
    float _128 = in.m_35.z;
    float _130 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _132 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _134 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = in.m_30.x;
    float _144 = in.m_30.y;
    float _146 = in.m_30.z;
    float _148 = in.m_37.x;
    float _150 = in.m_37.y;
    float _152 = in.m_37.z;
    float _154 = in.m_37.w;
    float _156 = 0.0;
    float _158 = _130;
    if (!_140)
    {
        float _160 = _130 * _130;
        float _162 = _160 * 0.5;
        _156 = _162;
    }
    float _164 = _156;
    float _166 = _164;
    if (!_140)
    {
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _168;
    }
    float _170 = _166;
    bool _172 = !_140;
    float _174 = _170;
    if (!_172)
    {
        float _176 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = log2(_176);
        float _180 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _182 = _180 + 1.0;
        float _184 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = _130 * _178;
        float _188 = exp2(_186);
        float _190 = _184 * 0.693147182464599609375;
        float _192 = 1.0 / _190;
        float _194 = 1.0 / _182;
        float _196 = _188 + (-1.0);
        float _198 = -_196;
        float _200 = fma(_198, _192, _130);
        float _202 = _200 * _194;
        float _204 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _204;
    }
    float _206 = _174;
    bool _208 = !_140;
    if (!_208)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = 1.0 / _216;
        float _220 = _130 * _212;
        float _222 = exp2(_220);
        float _224 = -_222;
        float _226 = _224 + 1.0;
        float _228 = _226 * _218;
        _158 = _228;
    }
    float _230 = _158;
    float _232 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _234 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _236 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _238 = fma(_230, _126, _232);
    float _240 = fma(_230, _124, _234);
    float _242 = fma(_230, _128, _236);
    float _244 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _246 = fma(_238, _154, _144);
    float _248 = in.m_39.x;
    float _250 = in.m_39.y;
    float _252 = in.m_39.z;
    float _254 = fma(_240, _154, _142);
    float _256 = fma(_242, _154, _146);
    float _258 = _246 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _260 = in.m_41.x;
    float _262 = _246 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _264 = _246 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _266 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].x, _258);
    float _268 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _270 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].x, _262);
    float _272 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].x, _264);
    float _274 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _266);
    float _276 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _270);
    float _278 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _272);
    float _280 = _274 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _282 = _276 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _284 = _278 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _286 = -_280;
    float _288 = _286 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _290 = -_282;
    float _292 = _290 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _294 = -_284;
    float _296 = _294 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _298 = _288 * _288;
    float _300 = _250 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _302 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _260);
    float _304 = fma(_292, _292, _298);
    float _306 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[191].y, _300);
    float _308 = fma(_296, _296, _304);
    float _310 = _306 * 6.283185482025146484375;
    float _312 = rsqrt(_308);
    float _314 = in.m_43.x;
    float _316 = in.m_43.y;
    float _318 = in.m_43.z;
    float _320 = _310 * 0.15915493667125701904296875;
    float _322 = _320 * 6.283185482025146484375;
    float _324 = sin(_322);
    float _326 = _292 * _312;
    float _328 = _296 * _312;
    float _330 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _332 = _326 * _330;
    float _334 = _324 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _336 = _288 * _312;
    float _338 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _340 = _328 * _338;
    float _342 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _344 = -_332;
    float _346 = fma(_328, _342, _344);
    float _348 = fma(_316, _334, _250);
    float _350 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _352 = _336 * _350;
    float _354 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _356 = -_340;
    float _358 = fma(_336, _354, _356);
    float _360 = _346 * _346;
    float _362 = fma(_314, _334, _248);
    float _364 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _366 = -_352;
    float _368 = fma(_326, _364, _366);
    float _370 = fma(_318, _334, _252);
    float _372 = fma(_358, _358, _360);
    bool _374 = _348 != 0.0;
    bool _376 = isnan(_348);
    bool _378 = _374 || _376;
    bool _380 = isnan(0.0);
    bool _382 = _378 || _380;
    float _384 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _386 = fma(_368, _368, _372);
    bool _388 = _362 == 0.0;
    bool _390 = !_382;
    bool _392 = _388 && _390;
    float _394 = _244 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _396 = _268 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _398 = rsqrt(_386);
    bool _400 = _370 == 0.0;
    bool _402 = _400 && _392;
    float _404 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _348);
    float _406 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _362);
    float _410 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _370);
    float _412 = _396 * _404;
    bool _414 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _416 = isnan(0.5);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _422 = _418 || _420;
    float _424 = _406 * _408;
    float _426 = _394 * _410;
    float _428 = _280 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _430 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _432 = isnan(0.5);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _438 = _434 || _436;
    float _440 = _314;
    float _442 = _316;
    float _444 = _410;
    float _446 = _280;
    if (!_402)
    {
        float _448 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[17].y, _314);
        _440 = _448;
    }
    float _450 = _440;
    if (!_402)
    {
        float _452 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[17].y, _316);
        _442 = _452;
    }
    float _454 = _442;
    float _456 = _358 * _398;
    float _458 = _346 * _398;
    float _460 = _368 * _398;
    if (_402)
    {
        _444 = _318;
    }
    float _462 = _444;
    float _464 = _336 * _456;
    float _466 = _328 * _458;
    float _468 = _462;
    if (!_402)
    {
        float _470 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[17].y, _318);
        _468 = _470;
    }
    float _472 = _468;
    float _474 = fma(_282, (*spvDescriptorSet0.vp_c8)._m0[11].x, _428);
    float _476 = -_464;
    float _478 = fma(_326, _458, _476);
    float _480 = -_466;
    float _482 = fma(_336, _460, _480);
    float _484 = _280 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _486 = fma(_284, (*spvDescriptorSet0.vp_c8)._m0[11].z, _474);
    float _488 = _412 * _478;
    float _490 = _412 * _482;
    float _492 = fma(_282, (*spvDescriptorSet0.vp_c8)._m0[10].x, _484);
    float _494 = _486 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _496 = fma(_424, _460, _488);
    float _498 = fma(_424, _456, _490);
    float _500 = _326 * _460;
    float _502 = 1.0 / _494;
    float _504 = fma(_426, _328, _496);
    float _506 = fma(_426, _326, _498);
    float _508 = fma(_284, (*spvDescriptorSet0.vp_c8)._m0[10].z, _492);
    float _510 = -_500;
    float _512 = fma(_328, _456, _510);
    float _514 = _284 + _504;
    float _516 = _282 + _506;
    float _518 = _482 * _454;
    float _520 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _522 = _514 + _520;
    float _524 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _526 = _516 + _524;
    float _528 = _508 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _530 = fma(_456, _450, _518);
    float _532 = _522 * _522;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _536 = _528 + _494;
    float _538 = _412 * _512;
    float _540 = fma(_526, _526, _532);
    float _542 = _478 * _454;
    float _544 = _512 * _454;
    float _546 = _536 * _502;
    float _548 = _546 * 0.5;
    float _550 = sqrt(_540);
    float _552 = fma(_460, _450, _542);
    float _554 = fma(_458, _450, _544);
    float _556 = fma(_326, _472, _530);
    out.m_45.w = _534;
    float _558 = fma(_424, _458, _538);
    float _560 = fma(_328, _472, _552);
    float _562 = fma(_336, _472, _554);
    float _564 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _566 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[30].w, _564);
    float _568 = fma(_426, _336, _558);
    out.m_47.x = _556;
    out.m_47.y = _562;
    out.m_47.z = _560;
    float _570 = _280 + _568;
    float _572 = 1.0 / _566;
    bool _574 = _550 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _576 = _568;
    float _578 = _560;
    float _580 = _562;
    float _582 = _556;
    if (!_574)
    {
        _576 = _516;
    }
    float _584 = _576;
    float _586 = _584;
    if (!_574)
    {
        _578 = _514;
    }
    float _588 = _578;
    float _590 = _588;
    if (!_574)
    {
        _580 = _570;
    }
    float _592 = _580;
    bool _594 = !_574;
    float _596 = _592;
    if (!_594)
    {
        float _598 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _600 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _602 = _550 + _600;
        float _604 = _570 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _606 = rsqrt(_540);
        float _608 = _602 * _598;
        float _610 = _608 * 0.15915493667125701904296875;
        float _612 = _610 * 6.283185482025146484375;
        float _614 = cos(_612);
        float _616 = _610 * 6.283185482025146484375;
        float _618 = sin(_616);
        float _620 = _614 + (-1.0);
        float _622 = _620 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _624 = fma(_618, _604, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _626 = fma(_570, _614, _622);
        float _628 = _606 * _624;
        float _630 = fma(_526, _628, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _632 = fma(_522, _628, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _586 = _630;
        _590 = _632;
        _596 = _626;
        _582 = _618;
    }
    float _634 = _586;
    float _636 = _590;
    float _638 = _596;
    float _640 = _582;
    float _642 = _640;
    float _644 = _638;
    float _646 = _636;
    float _648 = _634;
    if (_422)
    {
        _642 = _634;
    }
    float _650 = _642;
    float _652 = _650;
    if (!_422)
    {
        float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _656 = _280 + _654;
        float _658 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _660 = _282 + _658;
        float _662 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _664 = -_284;
        float _666 = _664 + _636;
        float _668 = _656 * _656;
        float _670 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _672 = _284 + _670;
        float _674 = fma(_660, _660, _668);
        float _676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _678 = fma(_672, _672, _674);
        float _680 = sqrt(_678);
        float _682 = _662 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _684 = precise::min(_680, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _686 = _684 * _676;
        float _688 = -_282;
        float _690 = _688 + _634;
        float _692 = -_280;
        float _694 = _692 + _638;
        float _696 = _682 * _686;
        float _698 = fma(_690, _696, _282);
        float _700 = fma(_694, _696, _280);
        float _702 = fma(_666, _696, _284);
        _644 = _700;
        _652 = _698;
        _646 = _702;
        _648 = _694;
    }
    float _704 = _644;
    float _706 = _652;
    float _708 = _646;
    float _710 = _648;
    float _712 = _704 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _714 = _710;
    if (_438)
    {
        _714 = 1.0;
    }
    float _716 = _714;
    float _718 = _704 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _720 = _716;
    if (_438)
    {
        _446 = 1.0;
    }
    float _722 = _446;
    float _724 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[1].x, _712);
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _728 = _572 * _726;
    float _730 = _722;
    if (!_438)
    {
        float _732 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _734 = _732 * 0.15915493667125701904296875;
        float _736 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _738 = _734 * 6.283185482025146484375;
        float _740 = cos(_738);
        float _742 = _736 * 0.15915493667125701904296875;
        float _744 = _734 * 6.283185482025146484375;
        float _746 = sin(_744);
        float _748 = 1.0 / _740;
        float _750 = _742 * 6.283185482025146484375;
        float _752 = cos(_750);
        float _754 = _746 * _748;
        float _756 = _742 * 6.283185482025146484375;
        float _758 = sin(_756);
        float _760 = _752 * _754;
        float _762 = 1.0 / _760;
        float _764 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _766 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _764;
        float _768 = 1.0 / _766;
        float _770 = _758 * _762;
        float _772 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _774 = fma(_728, _770, _772);
        float _776 = _774 * _768;
        float _778 = precise::clamp(_776, 0.0, 1.0);
        _720 = _778;
    }
    float _780 = _720;
    if (!_438)
    {
        float _782 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _784 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _786 = _782 * 0.15915493667125701904296875;
        float _788 = _784 * 0.15915493667125701904296875;
        float _790 = _786 * 6.283185482025146484375;
        float _792 = cos(_790);
        float _794 = _786 * 6.283185482025146484375;
        float _796 = sin(_794);
        float _798 = 1.0 / _792;
        float _800 = _788 * 6.283185482025146484375;
        float _802 = cos(_800);
        float _804 = _796 * _798;
        float _806 = _788 * 6.283185482025146484375;
        float _808 = sin(_806);
        float _810 = _802 * _804;
        float _812 = 1.0 / _810;
        float _814 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _816 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _814;
        float _818 = 1.0 / _816;
        float _820 = _808 * _812;
        float _822 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _824 = fma(_728, _820, _822);
        float _826 = _824 * _818;
        float _828 = precise::clamp(_826, 0.0, 1.0);
        float _830 = -_828;
        float _832 = _830 + 1.0;
        _730 = _832;
    }
    float _834 = _730;
    float _836 = _704 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _838 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[0].x, _718);
    float _840 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[1].z, _724);
    float _842 = _704 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _844 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[2].x, _836);
    float _846 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[0].z, _838);
    float _848 = _840 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _850 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[3].x, _842);
    float _852 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[2].z, _844);
    float _854 = _846 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _856 = _848 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _858 = _848 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _860 = _848 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _862 = _848 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _864 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[4].x, _856);
    float _866 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[6].x, _858);
    float _868 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[7].x, _860);
    float _870 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[3].z, _850);
    float _872 = _852 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _874 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[5].x, _862);
    bool _876 = _780 > 0.0;
    bool _878 = isnan(_780);
    bool _880 = _876 || _878;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    float _886 = _780 * _834;
    float _888 = _870 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _890 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[4].z, _864);
    float _892 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[6].z, _866);
    float _894 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[7].z, _868);
    bool _896 = _834 <= 0.0;
    bool _898 = !_884;
    bool _900 = _896 || _898;
    float _902 = _886 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _904 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[5].z, _874);
    float _906 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[4].w, _890);
    float _908 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[7].w, _894);
    float _910 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[6].w, _892);
    float _912 = _902 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _914 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[5].w, _904);
    float _916 = _906 + _908;
    float _918 = _910 + _908;
    float _920 = _908 * 0.5;
    float _922 = _916 * 0.5;
    float _924 = _918 * 0.5;
    float _926 = fma(_914, -0.5, _920);
    out.m_49.x = _706;
    out.m_49.y = _704;
    out.m_49.z = _708;
    out.m_33.x = _912;
    out.gl_Position.x = _906;
    out.gl_Position.y = _914;
    out.gl_Position.z = _910;
    out.gl_Position.w = _908;
    out.m_51.x = _922;
    out.m_51.y = _926;
    out.m_51.z = _924;
    out.m_51.w = _908;
    if (!_900)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _928 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _928;
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_30.w;
    float _67 = trunc(_65);
    int _70 = int(_67);
    bool _74 = _70 >= 1;
    float _76 = 0.0;
    float _78 = as_type<float>(_70);
    if (!_74)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _80 = _76;
    if (!_74)
    {
        out.m_33.x = 0.0;
    }
    int _82 = 0;
    if (!_74)
    {
        float _84 = _80 * 5.0;
        _82 = as_type<int>(_84);
    }
    int _86 = _82;
    int _88 = _86;
    if (!_74)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _985 = as_type<float>(_86);
        out.gl_Position.z = _985;
    }
    if (!_74)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _90 = in.m_35.w;
    bool _92 = _90 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _94 = isnan(_90);
    bool _96 = _92 || _94;
    bool _98 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _100 = _96 || _98;
    float _102 = -_90;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_100)
    {
        float _106 = float(_70);
        _78 = _106;
    }
    float _108 = _78;
    bool _110 = _104 >= _108;
    bool _112 = !_100;
    bool _114 = _110 || _112;
    float _116 = _108;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    if (_114)
    {
        out.m_33.x = 0.0;
    }
    if (_114)
    {
        float _120 = _118 * 5.0;
        _88 = as_type<int>(_120);
    }
    int _122 = _88;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1054 = as_type<float>(_122);
        out.gl_Position.z = _1054;
    }
    if (_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_35.x;
    float _126 = in.m_35.y;
    float _128 = in.m_35.z;
    float _130 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _132 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _134 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = in.m_30.x;
    float _144 = in.m_30.y;
    float _146 = in.m_30.z;
    float _148 = in.m_37.x;
    float _150 = in.m_37.y;
    float _152 = in.m_37.z;
    float _154 = in.m_37.w;
    float _156 = 0.0;
    float _158 = _130;
    if (!_140)
    {
        float _160 = _130 * _130;
        float _162 = _160 * 0.5;
        _156 = _162;
    }
    float _164 = _156;
    float _166 = _164;
    if (!_140)
    {
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _168;
    }
    float _170 = _166;
    bool _172 = !_140;
    float _174 = _170;
    if (!_172)
    {
        float _176 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = log2(_176);
        float _180 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _182 = _180 + 1.0;
        float _184 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = _130 * _178;
        float _188 = exp2(_186);
        float _190 = _184 * 0.693147182464599609375;
        float _192 = 1.0 / _190;
        float _194 = 1.0 / _182;
        float _196 = _188 + (-1.0);
        float _198 = -_196;
        float _200 = fma(_198, _192, _130);
        float _202 = _200 * _194;
        float _204 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _204;
    }
    float _206 = _174;
    bool _208 = !_140;
    if (!_208)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = 1.0 / _216;
        float _220 = _130 * _212;
        float _222 = exp2(_220);
        float _224 = -_222;
        float _226 = _224 + 1.0;
        float _228 = _226 * _218;
        _158 = _228;
    }
    float _230 = _158;
    float _232 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _234 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _236 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _238 = fma(_230, _126, _232);
    float _240 = fma(_230, _124, _234);
    float _242 = fma(_230, _128, _236);
    float _244 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _246 = fma(_238, _154, _144);
    float _248 = in.m_39.x;
    float _250 = in.m_39.y;
    float _252 = in.m_39.z;
    float _254 = fma(_240, _154, _142);
    float _256 = fma(_242, _154, _146);
    float _258 = _246 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _260 = in.m_41.x;
    float _262 = _246 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _264 = _246 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _266 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].x, _258);
    float _268 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _270 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].x, _262);
    float _272 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].x, _264);
    float _274 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _266);
    float _276 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _270);
    float _278 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _272);
    float _280 = _274 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _282 = _276 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _284 = _278 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _286 = -_280;
    float _288 = _286 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _290 = -_282;
    float _292 = _290 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _294 = -_284;
    float _296 = _294 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _298 = _288 * _288;
    float _300 = _250 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _302 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _260);
    float _304 = fma(_292, _292, _298);
    float _306 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[191].y, _300);
    float _308 = fma(_296, _296, _304);
    float _310 = _306 * 6.283185482025146484375;
    float _312 = rsqrt(_308);
    float _314 = in.m_43.x;
    float _316 = in.m_43.y;
    float _318 = in.m_43.z;
    float _320 = _310 * 0.15915493667125701904296875;
    float _322 = _320 * 6.283185482025146484375;
    float _324 = sin(_322);
    float _326 = _292 * _312;
    float _328 = _296 * _312;
    float _330 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _332 = _326 * _330;
    float _334 = _324 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _336 = _288 * _312;
    float _338 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _340 = _328 * _338;
    float _342 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _344 = -_332;
    float _346 = fma(_328, _342, _344);
    float _348 = fma(_316, _334, _250);
    float _350 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _352 = _336 * _350;
    float _354 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _356 = -_340;
    float _358 = fma(_336, _354, _356);
    float _360 = _346 * _346;
    float _362 = fma(_314, _334, _248);
    float _364 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _366 = -_352;
    float _368 = fma(_326, _364, _366);
    float _370 = fma(_318, _334, _252);
    float _372 = fma(_358, _358, _360);
    bool _374 = _348 != 0.0;
    bool _376 = isnan(_348);
    bool _378 = _374 || _376;
    bool _380 = isnan(0.0);
    bool _382 = _378 || _380;
    float _384 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _386 = fma(_368, _368, _372);
    bool _388 = _362 == 0.0;
    bool _390 = !_382;
    bool _392 = _388 && _390;
    float _394 = _244 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _396 = _268 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _398 = rsqrt(_386);
    bool _400 = _370 == 0.0;
    bool _402 = _400 && _392;
    float _404 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _348);
    float _406 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _362);
    float _410 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _370);
    float _412 = _396 * _404;
    bool _414 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _416 = isnan(0.5);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _422 = _418 || _420;
    float _424 = _406 * _408;
    float _426 = _394 * _410;
    float _428 = _280 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _430 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _432 = isnan(0.5);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _438 = _434 || _436;
    float _440 = _314;
    float _442 = _316;
    float _444 = _410;
    float _446 = _280;
    if (!_402)
    {
        float _448 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[17].y, _314);
        _440 = _448;
    }
    float _450 = _440;
    if (!_402)
    {
        float _452 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[17].y, _316);
        _442 = _452;
    }
    float _454 = _442;
    float _456 = _358 * _398;
    float _458 = _346 * _398;
    float _460 = _368 * _398;
    if (_402)
    {
        _444 = _318;
    }
    float _462 = _444;
    float _464 = _336 * _456;
    float _466 = _328 * _458;
    float _468 = _462;
    if (!_402)
    {
        float _470 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[17].y, _318);
        _468 = _470;
    }
    float _472 = _468;
    float _474 = fma(_282, (*spvDescriptorSet0.vp_c8)._m0[11].x, _428);
    float _476 = -_464;
    float _478 = fma(_326, _458, _476);
    float _480 = -_466;
    float _482 = fma(_336, _460, _480);
    float _484 = _280 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _486 = fma(_284, (*spvDescriptorSet0.vp_c8)._m0[11].z, _474);
    float _488 = _412 * _478;
    float _490 = _412 * _482;
    float _492 = fma(_282, (*spvDescriptorSet0.vp_c8)._m0[10].x, _484);
    float _494 = _486 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _496 = fma(_424, _460, _488);
    float _498 = fma(_424, _456, _490);
    float _500 = _326 * _460;
    float _502 = 1.0 / _494;
    float _504 = fma(_426, _328, _496);
    float _506 = fma(_426, _326, _498);
    float _508 = fma(_284, (*spvDescriptorSet0.vp_c8)._m0[10].z, _492);
    float _510 = -_500;
    float _512 = fma(_328, _456, _510);
    float _514 = _284 + _504;
    float _516 = _282 + _506;
    float _518 = _482 * _454;
    float _520 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _522 = _514 + _520;
    float _524 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _526 = _516 + _524;
    float _528 = _508 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _530 = fma(_456, _450, _518);
    float _532 = _522 * _522;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _536 = _528 + _494;
    float _538 = _412 * _512;
    float _540 = fma(_526, _526, _532);
    float _542 = _478 * _454;
    float _544 = _512 * _454;
    float _546 = _536 * _502;
    float _548 = _546 * 0.5;
    float _550 = sqrt(_540);
    float _552 = fma(_460, _450, _542);
    float _554 = fma(_458, _450, _544);
    float _556 = fma(_326, _472, _530);
    out.m_45.w = _534;
    float _558 = fma(_424, _458, _538);
    float _560 = fma(_328, _472, _552);
    float _562 = fma(_336, _472, _554);
    float _564 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _566 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[30].w, _564);
    float _568 = fma(_426, _336, _558);
    out.m_47.x = _556;
    out.m_47.y = _562;
    out.m_47.z = _560;
    float _570 = _280 + _568;
    float _572 = 1.0 / _566;
    bool _574 = _550 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _576 = _568;
    float _578 = _560;
    float _580 = _562;
    float _582 = _556;
    if (!_574)
    {
        _576 = _516;
    }
    float _584 = _576;
    float _586 = _584;
    if (!_574)
    {
        _578 = _514;
    }
    float _588 = _578;
    float _590 = _588;
    if (!_574)
    {
        _580 = _570;
    }
    float _592 = _580;
    bool _594 = !_574;
    float _596 = _592;
    if (!_594)
    {
        float _598 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _600 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _602 = _550 + _600;
        float _604 = _570 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _606 = rsqrt(_540);
        float _608 = _602 * _598;
        float _610 = _608 * 0.15915493667125701904296875;
        float _612 = _610 * 6.283185482025146484375;
        float _614 = cos(_612);
        float _616 = _610 * 6.283185482025146484375;
        float _618 = sin(_616);
        float _620 = _614 + (-1.0);
        float _622 = _620 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _624 = fma(_618, _604, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _626 = fma(_570, _614, _622);
        float _628 = _606 * _624;
        float _630 = fma(_526, _628, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _632 = fma(_522, _628, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _586 = _630;
        _590 = _632;
        _596 = _626;
        _582 = _618;
    }
    float _634 = _586;
    float _636 = _590;
    float _638 = _596;
    float _640 = _582;
    float _642 = _640;
    float _644 = _638;
    float _646 = _636;
    float _648 = _634;
    if (_422)
    {
        _642 = _634;
    }
    float _650 = _642;
    float _652 = _650;
    if (!_422)
    {
        float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _656 = _280 + _654;
        float _658 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _660 = _282 + _658;
        float _662 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _664 = -_284;
        float _666 = _664 + _636;
        float _668 = _656 * _656;
        float _670 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _672 = _284 + _670;
        float _674 = fma(_660, _660, _668);
        float _676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _678 = fma(_672, _672, _674);
        float _680 = sqrt(_678);
        float _682 = _662 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _684 = precise::min(_680, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _686 = _684 * _676;
        float _688 = -_282;
        float _690 = _688 + _634;
        float _692 = -_280;
        float _694 = _692 + _638;
        float _696 = _682 * _686;
        float _698 = fma(_690, _696, _282);
        float _700 = fma(_694, _696, _280);
        float _702 = fma(_666, _696, _284);
        _644 = _700;
        _652 = _698;
        _646 = _702;
        _648 = _694;
    }
    float _704 = _644;
    float _706 = _652;
    float _708 = _646;
    float _710 = _648;
    float _712 = _704 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _714 = _710;
    if (_438)
    {
        _714 = 1.0;
    }
    float _716 = _714;
    float _718 = _704 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _720 = _716;
    if (_438)
    {
        _446 = 1.0;
    }
    float _722 = _446;
    float _724 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[1].x, _712);
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _728 = _572 * _726;
    float _730 = _722;
    if (!_438)
    {
        float _732 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _734 = _732 * 0.15915493667125701904296875;
        float _736 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _738 = _734 * 6.283185482025146484375;
        float _740 = cos(_738);
        float _742 = _736 * 0.15915493667125701904296875;
        float _744 = _734 * 6.283185482025146484375;
        float _746 = sin(_744);
        float _748 = 1.0 / _740;
        float _750 = _742 * 6.283185482025146484375;
        float _752 = cos(_750);
        float _754 = _746 * _748;
        float _756 = _742 * 6.283185482025146484375;
        float _758 = sin(_756);
        float _760 = _752 * _754;
        float _762 = 1.0 / _760;
        float _764 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _766 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _764;
        float _768 = 1.0 / _766;
        float _770 = _758 * _762;
        float _772 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _774 = fma(_728, _770, _772);
        float _776 = _774 * _768;
        float _778 = precise::clamp(_776, 0.0, 1.0);
        _720 = _778;
    }
    float _780 = _720;
    if (!_438)
    {
        float _782 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _784 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _786 = _782 * 0.15915493667125701904296875;
        float _788 = _784 * 0.15915493667125701904296875;
        float _790 = _786 * 6.283185482025146484375;
        float _792 = cos(_790);
        float _794 = _786 * 6.283185482025146484375;
        float _796 = sin(_794);
        float _798 = 1.0 / _792;
        float _800 = _788 * 6.283185482025146484375;
        float _802 = cos(_800);
        float _804 = _796 * _798;
        float _806 = _788 * 6.283185482025146484375;
        float _808 = sin(_806);
        float _810 = _802 * _804;
        float _812 = 1.0 / _810;
        float _814 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _816 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _814;
        float _818 = 1.0 / _816;
        float _820 = _808 * _812;
        float _822 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _824 = fma(_728, _820, _822);
        float _826 = _824 * _818;
        float _828 = precise::clamp(_826, 0.0, 1.0);
        float _830 = -_828;
        float _832 = _830 + 1.0;
        _730 = _832;
    }
    float _834 = _730;
    float _836 = _704 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _838 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[0].x, _718);
    float _840 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[1].z, _724);
    float _842 = _704 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _844 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[2].x, _836);
    float _846 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[0].z, _838);
    float _848 = _840 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _850 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[3].x, _842);
    float _852 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[2].z, _844);
    float _854 = _846 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _856 = _848 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _858 = _848 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _860 = _848 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _862 = _848 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _864 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[4].x, _856);
    float _866 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[6].x, _858);
    float _868 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[7].x, _860);
    float _870 = fma(_708, (*spvDescriptorSet0.vp_c8)._m0[3].z, _850);
    float _872 = _852 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _874 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[5].x, _862);
    bool _876 = _780 > 0.0;
    bool _878 = isnan(_780);
    bool _880 = _876 || _878;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    float _886 = _780 * _834;
    float _888 = _870 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _890 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[4].z, _864);
    float _892 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[6].z, _866);
    float _894 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[7].z, _868);
    bool _896 = _834 <= 0.0;
    bool _898 = !_884;
    bool _900 = _896 || _898;
    float _902 = _886 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _904 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[5].z, _874);
    float _906 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[4].w, _890);
    float _908 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[7].w, _894);
    float _910 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[6].w, _892);
    float _912 = _902 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _914 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[5].w, _904);
    float _916 = _906 + _908;
    float _918 = _910 + _908;
    float _920 = _908 * 0.5;
    float _922 = _916 * 0.5;
    float _924 = _918 * 0.5;
    float _926 = fma(_914, -0.5, _920);
    out.m_49.x = _706;
    out.m_49.y = _704;
    out.m_49.z = _708;
    out.m_33.x = _912;
    out.gl_Position.x = _906;
    out.gl_Position.y = _914;
    out.gl_Position.z = _910;
    out.gl_Position.w = _908;
    out.m_51.x = _922;
    out.m_51.y = _926;
    out.m_51.z = _924;
    out.m_51.w = _908;
    if (!_900)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _928 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _928;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

