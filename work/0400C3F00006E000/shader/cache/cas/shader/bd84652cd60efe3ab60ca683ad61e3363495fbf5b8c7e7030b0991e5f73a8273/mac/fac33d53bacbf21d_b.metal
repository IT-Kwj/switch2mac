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
    float4 m_55 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_45 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_39 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_41 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    bool _388 = false;
    bool _274 = false;
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
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    float _86 = _84;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _84 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1259 = as_type<float>(_92);
        out.gl_Position.z = _1259;
    }
    if (!_80)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _112 = _110;
    if (_106)
    {
        float _114 = float(_76);
        _86 = _114;
    }
    float _116 = _86;
    bool _118 = _110 >= _116;
    bool _120 = !_106;
    bool _122 = _118 || _120;
    float _124 = _116;
    if (_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _128 = _126 * 5.0;
        _94 = as_type<int>(_128);
    }
    int _130 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1329 = as_type<float>(_130);
        out.gl_Position.z = _1329;
    }
    if (_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_37.w;
    float _134 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_35.x;
    float _148 = in.m_35.y;
    float _150 = in.m_35.z;
    float _152 = in.m_30.x;
    float _154 = in.m_30.y;
    float _156 = in.m_30.z;
    float _158 = 0.0;
    float _160 = _134;
    if (!_144)
    {
        float _162 = _134 * _134;
        float _164 = _162 * 0.5;
        _158 = _164;
    }
    float _166 = _158;
    float _168 = _166;
    if (!_144)
    {
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _170;
    }
    float _172 = _168;
    bool _174 = !_144;
    float _176 = _172;
    if (!_174)
    {
        float _178 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _180 = log2(_178);
        float _182 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _184 = _182 + 1.0;
        float _186 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = _134 * _180;
        float _190 = 1.0 / _184;
        float _192 = _186 * 0.693147182464599609375;
        float _194 = exp2(_188);
        float _196 = 1.0 / _192;
        float _198 = _194 + (-1.0);
        float _200 = -_198;
        float _202 = fma(_200, _196, _134);
        float _204 = _202 * _190;
        float _206 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _206;
    }
    float _208 = _176;
    bool _210 = !_144;
    if (!_210)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = 1.0 / _218;
        float _222 = _134 * _214;
        float _224 = exp2(_222);
        float _226 = -_224;
        float _228 = _226 + 1.0;
        float _230 = _228 * _220;
        _160 = _230;
    }
    float _232 = _160;
    bool _234 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _236 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _238 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _240 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _242 = fma(_232, _146, _236);
    float _244 = fma(_232, _148, _238);
    float _246 = fma(_232, _150, _240);
    float _248 = fma(_242, _132, _152);
    float _250 = fma(_244, _132, _154);
    float _252 = fma(_246, _132, _156);
    bool _254 = !_234;
    float _272;
    if (!_254)
    {
        float _256 = in.m_39.x;
        float _258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _260 = _256 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _264 = _262 * _258;
        float _266 = floor(_264);
        float _268 = -_266;
        float _270 = _264 + _268;
        _272 = _270;
        _274 = true;
    }
    else
    {
        float _276 = float(_76);
        float _278 = 1.0 / _276;
        float _280 = _110 * _278;
        _272 = _280;
    }
    _274 = false;
    float _282 = _272;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _286 = _282 + _284;
    bool _288 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _290 = isnan(_282);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _300;
    bool _304 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _306 = isnan(_282);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -_298;
    float _318 = _316 + 1.0;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _320;
    float _324 = 1.0 / _302;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _328 = _286 * _324;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _330;
    float _334 = _314 * _318;
    float _336 = fma(_322, _328, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _338 = -_314;
    float _340 = _338 + 1.0;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = fma(_332, _328, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _348 = _336 * _334;
    float _350 = fma(_344, _328, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _352 = _346 * _334;
    float _354 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].x, _348);
    float _356 = _350 * _334;
    float _358 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].z, _352);
    float _360 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[144].x, _354);
    float _362 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].y, _356);
    float _364 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[144].y, _362);
    float _366 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[144].z, _358);
    bool _368 = !_326;
    float _386;
    if (!_368)
    {
        float _370 = in.m_39.x;
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _374 = _370 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[11].y, _110);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        float _390 = float(_76);
        float _392 = 1.0 / _390;
        float _394 = _110 * _392;
        _386 = _394;
    }
    _388 = false;
    float _396 = _386;
    float _398 = in.m_39.z;
    float _400 = in.m_39.x;
    float _402 = in.m_39.y;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _406 = _404 != 0;
    float _408 = in.m_41.x;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _412 = _410 != 0;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _416 = in.m_41.y;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _428 = _426 != 0;
    float _430 = in.m_41.z;
    float _432 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _434 = log2(_432);
    float _436 = in.m_41.w;
    float _438 = _398 * 2.0;
    float _440 = floor(_438);
    float _442 = _400 * 2.0;
    float _444 = _400 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _446 = _402 * 2.0;
    out.m_43.x = _408;
    float _448 = -_414;
    float _450 = fma(_444, 2.0, _448);
    float _452 = _402 + _398;
    float _454 = floor(_442);
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _458 = _402 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _460 = !_420;
    int _462 = _460 ? 0 : 1;
    out.m_43.y = _416;
    float _464 = fma(_458, -2.0, _456);
    float _466 = _452 + (-1.0);
    bool _468 = _440 > 0.0;
    float _470 = _402 + _400;
    bool _472 = _440 >= 0.0;
    bool _474 = isnan(_440);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    float _482 = floor(_446);
    float _484 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _486 = _470 + (-1.0);
    int _488 = _480 ? 0 : 1;
    float _490 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _464);
    bool _492 = _454 > 0.0;
    float _494 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _496 = abs(_462);
    out.m_43.z = _430;
    int _498 = ~_488;
    int _500 = _498 + 1;
    int _502 = _500 + 1;
    bool _504 = _454 >= 0.0;
    bool _506 = isnan(_454);
    bool _508 = _504 || _506;
    bool _510 = isnan(0.0);
    bool _512 = _508 || _510;
    float _514 = _434 * _110;
    int _516 = _502;
    if (!_468)
    {
        int _518 = ~_488;
        int _520 = _518 + 1;
        _516 = _520;
    }
    int _522 = _516;
    out.m_43.w = _436;
    int _524 = _512 ? 0 : 1;
    float _526 = exp2(_514);
    float _528 = float(_496);
    float _530 = float(_522);
    int _532 = ~_524;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    float _538 = _528 * _530;
    int _540 = _536;
    if (!_492)
    {
        int _542 = ~_524;
        int _544 = _542 + 1;
        _540 = _544;
    }
    int _546 = _540;
    bool _548 = _482 > 0.0;
    float _550 = in.m_45.x;
    float _552 = in.m_45.y;
    float _554 = in.m_45.z;
    bool _556 = _482 >= 0.0;
    bool _558 = isnan(_482);
    bool _560 = _556 || _558;
    bool _562 = isnan(0.0);
    bool _564 = _560 || _562;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _568 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _570 = isnan(1.0);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _576 = _572 || _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _580 = 1.0 + _578;
    float _582 = float(_546);
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _586 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[78].z, _566);
    bool _588 = !_424;
    int _590 = _588 ? 0 : 1;
    float _592 = 1.0 / _580;
    float _594 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[78].w, _584);
    bool _596 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    float _606 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _586);
    int _608 = abs(_590);
    float _610 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _594);
    float _612 = -_526;
    float _614 = _612 + 1.0;
    float _616 = -_110;
    float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[76].x, _450);
    float _620 = float(_608);
    float _622 = _538 * (-2.0);
    int _624 = _564 ? 0 : 1;
    float _626 = _604 ? _614 : 0.0;
    float _628 = _620 * _582;
    int _630 = ~_624;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    float _636 = fma(_494, _622, _494);
    int _638 = _634;
    if (!_548)
    {
        int _640 = ~_624;
        int _642 = _640 + 1;
        _638 = _642;
    }
    int _644 = _638;
    float _646 = fma(_622, _550, _550);
    float _648 = _628 * (-2.0);
    float _650 = _400 + (-0.5);
    bool _652 = !_428;
    int _654 = _652 ? 0 : 1;
    if (_576)
    {
        float _656 = _626 * _592;
        _112 = _656;
    }
    float _658 = _112;
    bool _660 = _402 > 0.5;
    float _662 = _402 + (-0.5);
    float _664 = fma(_648, _552, _552);
    float _666 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[196].x, _646);
    int _668 = abs(_654);
    float _670 = fma(_484, _648, _484);
    float _672 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[196].y, _664);
    float _674 = fma(_636, _658, _666);
    float _676 = _250 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _678 = _250 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _680 = _250 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _682 = float(_668);
    float _684 = _674 * 0.15915493667125701904296875;
    float _686 = float(_644);
    float _688 = in.m_37.x;
    float _690 = in.m_37.y;
    float _692 = in.m_37.z;
    float _694 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].x, _678);
    float _696 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].x, _676);
    float _698 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].x, _680);
    float _700 = fma(_670, _658, _672);
    float _702 = _682 * _686;
    float _704 = in.m_47.x;
    float _706 = in.m_47.y;
    float _708 = in.m_47.z;
    float _710 = _398 + _400;
    float _712 = _700 * 0.15915493667125701904296875;
    float _714 = _702 * (-2.0);
    float _716 = _398 + (-0.5);
    float _718 = _710 + (-1.0);
    float _720 = in.m_49.y;
    float _722 = fma(_714, _554, _554);
    float _724 = _684 * 6.283185482025146484375;
    float _726 = sin(_724);
    float _728 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _730 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].z, _698);
    float _732 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[196].z, _722);
    float _734 = fma(_728, _714, _728);
    float _736 = _730 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _738 = _684 * 6.283185482025146484375;
    float _740 = cos(_738);
    float _742 = fma(_734, _658, _732);
    float _744 = _360 * _688;
    float _746 = _366 * _692;
    float _748 = _364 * _690;
    float _750 = _742 * 0.15915493667125701904296875;
    float _752 = _744 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _754 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].z, _694);
    float _756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _706);
    float _758 = _712 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _704);
    float _764 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _708);
    float _766 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _768 = _746 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _770 = -_720;
    float _772 = _770 + 1.0;
    float _774 = _752 * _762;
    float _776 = _766 * _756;
    float _778 = _712 * 6.283185482025146484375;
    float _780 = cos(_778);
    float _782 = _768 * _764;
    float _784 = _720;
    float _786 = _694;
    if (_412)
    {
        float _788 = _660 ? _772 : _720;
        _784 = _788;
    }
    float _790 = _784;
    float _792 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].z, _696);
    float _794 = _754 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _796 = _792 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _798 = _750 * 6.283185482025146484375;
    float _800 = cos(_798);
    float _802 = _726 * _760;
    float _804 = _740 * _760;
    float _806 = _750 * 6.283185482025146484375;
    float _808 = sin(_806);
    float _810 = _740 * _780;
    float _812 = _726 * _780;
    float _814 = _760 * _800;
    float _816 = _800 * _776;
    float _818 = _780 * _800;
    float _820 = _740 * _816;
    float _822 = _726 * _816;
    float _824 = fma(_808, _810, _802);
    float _826 = -_804;
    float _828 = fma(_808, _812, _826);
    float _830 = -_776;
    float _832 = _808 * _830;
    float _834 = -_812;
    float _836 = fma(_808, _804, _834);
    float _838 = fma(_824, _774, _820);
    float _840 = fma(_808, _802, _810);
    float _842 = fma(_818, _774, _832);
    float _844 = fma(_828, _774, _822);
    float _846 = fma(_836, _782, _838);
    float _848 = fma(_814, _782, _842);
    float _850 = fma(_840, _782, _844);
    float _852 = _846 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _854 = _846 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _856 = _774;
    float _858 = _796;
    if (_406)
    {
        float _860 = in.m_39.x;
        _856 = _860;
    }
    float _862 = _856;
    float _864 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[26].x, _852);
    float _866 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[24].x, _854);
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _876 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[26].z, _864);
    float _878 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[24].z, _866);
    float _880 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _882 = _876 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _884 = _878 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _886 = _736 + _882;
    float _888 = _794 + _884;
    float _890 = 1.0 / _874;
    float _892 = in.m_49.x;
    float _894 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _896 = _888 + _894;
    float _898 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _900;
    float _904 = 1.0 / _870;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _910 = _862 > 0.5;
    bool _912 = _910 && _406;
    out.m_33.x = _898;
    float _914 = _908 * _890;
    float _916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _918 = _886 + _916;
    float _920 = _880 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _924 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _926 = isnan(_396);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = _918 * _918;
    float _938 = fma(_920, _790, -0.5);
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _942 = _396 + _940;
    float _944 = _902 * _904;
    float _946 = fma(_896, _896, _936);
    bool _948 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _950 = isnan(_396);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = -_490;
    float _962 = fma(_610, _938, _960);
    bool _964 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _966 = isnan(_396);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = sqrt(_946);
    float _978 = fma(_944, _942, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _980 = -_958;
    float _982 = _980 + 1.0;
    float _984 = _974;
    if (_406)
    {
        _786 = _892;
    }
    float _986 = _786;
    float _988 = _846 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _992 = _396 + _990;
    float _994 = _974 * _982;
    float _996 = -_974;
    float _998 = _996 + 1.0;
    float _1000 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[25].x, _988);
    float _1002 = _986;
    if (_912)
    {
        float _1004 = -_986;
        float _1006 = _1004 + 1.0;
        _1002 = _1006;
    }
    float _1008 = _1002;
    if (!_406)
    {
        _984 = _892;
    }
    float _1010 = _984;
    float _1012 = _934 * _998;
    float _1014 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1000);
    float _1016 = _922 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1018 = _1010;
    if (_406)
    {
        _1018 = _1008;
    }
    float _1020 = _1018;
    float _1022 = _978 * _1012;
    bool _1024 = _976 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1026 = _1014 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1028 = -_934;
    float _1030 = _1028 + 1.0;
    float _1032 = fma(_1016, _1020, -0.5);
    float _1034 = fma(_914, _992, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1036 = _796 + _1026;
    float _1038 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1022);
    float _1040 = fma(_606, _1032, _618);
    float _1042 = fma(_1034, _994, _1038);
    float _1044 = _1026;
    float _1046 = _1032;
    if (!_1024)
    {
        _1044 = _888;
    }
    float _1048 = _1044;
    float _1050 = _1048;
    if (!_1024)
    {
        _1046 = _886;
    }
    float _1052 = _1046;
    float _1054 = _1052;
    if (!_1024)
    {
        _858 = _1036;
    }
    float _1056 = _858;
    bool _1058 = !_1024;
    float _1060 = _1056;
    if (!_1058)
    {
        float _1062 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1064 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1066 = _976 + _1064;
        float _1068 = _1036 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1070 = rsqrt(_946);
        float _1072 = _1066 * _1062;
        float _1074 = _1072 * 0.15915493667125701904296875;
        float _1076 = _1074 * 6.283185482025146484375;
        float _1078 = cos(_1076);
        float _1080 = _1074 * 6.283185482025146484375;
        float _1082 = sin(_1080);
        float _1084 = _1078 + (-1.0);
        float _1086 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = fma(_1082, _1068, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1090 = fma(_1036, _1078, _1086);
        float _1092 = _1070 * _1088;
        float _1094 = fma(_896, _1092, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1096 = fma(_918, _1092, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1060 = _1090;
        _1050 = _1094;
        _1054 = _1096;
    }
    float _1098 = _1060;
    float _1100 = _1050;
    float _1102 = _1054;
    float _1104 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1106 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1108 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1042);
    float _1110 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1112 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1104);
    float _1114 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1116 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1106);
    float _1118 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1110);
    float _1120 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1112);
    float _1122 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1114);
    float _1124 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1116);
    float _1126 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1118);
    float _1128 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1130 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1122);
    float _1132 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1134 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1136 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1138 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1140 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1142 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1144 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1136);
    float _1146 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1138);
    float _1148 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1140);
    float _1150 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1142);
    float _1152 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1154 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1144);
    float _1156 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1146);
    float _1158 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1148);
    float _1160 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1150);
    float _1162 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1154);
    float _1164 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1156);
    float _1166 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1158);
    float _1168 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1160);
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1176 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1182 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1186 = _1166 + _1168;
    float _1188 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1190 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1192 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1194 = _1040 + 0.5;
    float _1196 = _1108 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1198 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1200 = _962 + 0.5;
    float _1202 = _1186 * 0.5;
    out.m_51.x = _1192;
    out.m_51.y = _1182;
    out.m_51.z = _1198;
    out.m_53.x = _1194;
    out.m_53.y = _1200;
    out.m_55.x = _1190;
    out.m_55.y = _1188;
    out.m_55.z = _1176;
    out.m_55.w = _1196;
    out.gl_Position.x = _1164;
    out.gl_Position.y = _1162;
    out.gl_Position.z = _1166;
    out.gl_Position.w = _1168;
    out.m_57.z = _1202;
    out.m_57.w = _1168;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    bool _388 = false;
    bool _274 = false;
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
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    float _86 = _84;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _84 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1259 = as_type<float>(_92);
        out.gl_Position.z = _1259;
    }
    if (!_80)
    {
        return out;
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _112 = _110;
    if (_106)
    {
        float _114 = float(_76);
        _86 = _114;
    }
    float _116 = _86;
    bool _118 = _110 >= _116;
    bool _120 = !_106;
    bool _122 = _118 || _120;
    float _124 = _116;
    if (_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _128 = _126 * 5.0;
        _94 = as_type<int>(_128);
    }
    int _130 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1329 = as_type<float>(_130);
        out.gl_Position.z = _1329;
    }
    if (_122)
    {
        return out;
    }
    float _132 = in.m_37.w;
    float _134 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_35.x;
    float _148 = in.m_35.y;
    float _150 = in.m_35.z;
    float _152 = in.m_30.x;
    float _154 = in.m_30.y;
    float _156 = in.m_30.z;
    float _158 = 0.0;
    float _160 = _134;
    if (!_144)
    {
        float _162 = _134 * _134;
        float _164 = _162 * 0.5;
        _158 = _164;
    }
    float _166 = _158;
    float _168 = _166;
    if (!_144)
    {
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _170;
    }
    float _172 = _168;
    bool _174 = !_144;
    float _176 = _172;
    if (!_174)
    {
        float _178 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _180 = log2(_178);
        float _182 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _184 = _182 + 1.0;
        float _186 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = _134 * _180;
        float _190 = 1.0 / _184;
        float _192 = _186 * 0.693147182464599609375;
        float _194 = exp2(_188);
        float _196 = 1.0 / _192;
        float _198 = _194 + (-1.0);
        float _200 = -_198;
        float _202 = fma(_200, _196, _134);
        float _204 = _202 * _190;
        float _206 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _206;
    }
    float _208 = _176;
    bool _210 = !_144;
    if (!_210)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = 1.0 / _218;
        float _222 = _134 * _214;
        float _224 = exp2(_222);
        float _226 = -_224;
        float _228 = _226 + 1.0;
        float _230 = _228 * _220;
        _160 = _230;
    }
    float _232 = _160;
    bool _234 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _236 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _238 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _240 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _242 = fma(_232, _146, _236);
    float _244 = fma(_232, _148, _238);
    float _246 = fma(_232, _150, _240);
    float _248 = fma(_242, _132, _152);
    float _250 = fma(_244, _132, _154);
    float _252 = fma(_246, _132, _156);
    bool _254 = !_234;
    float _272;
    if (!_254)
    {
        float _256 = in.m_39.x;
        float _258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _260 = _256 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _264 = _262 * _258;
        float _266 = floor(_264);
        float _268 = -_266;
        float _270 = _264 + _268;
        _272 = _270;
        _274 = true;
    }
    else
    {
        float _276 = float(_76);
        float _278 = 1.0 / _276;
        float _280 = _110 * _278;
        _272 = _280;
    }
    _274 = false;
    float _282 = _272;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _286 = _282 + _284;
    bool _288 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _290 = isnan(_282);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _300;
    bool _304 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _306 = isnan(_282);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -_298;
    float _318 = _316 + 1.0;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _320;
    float _324 = 1.0 / _302;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _328 = _286 * _324;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _330;
    float _334 = _314 * _318;
    float _336 = fma(_322, _328, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _338 = -_314;
    float _340 = _338 + 1.0;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = fma(_332, _328, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _348 = _336 * _334;
    float _350 = fma(_344, _328, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _352 = _346 * _334;
    float _354 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].x, _348);
    float _356 = _350 * _334;
    float _358 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].z, _352);
    float _360 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[144].x, _354);
    float _362 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].y, _356);
    float _364 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[144].y, _362);
    float _366 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[144].z, _358);
    bool _368 = !_326;
    float _386;
    if (!_368)
    {
        float _370 = in.m_39.x;
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _374 = _370 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[11].y, _110);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        float _390 = float(_76);
        float _392 = 1.0 / _390;
        float _394 = _110 * _392;
        _386 = _394;
    }
    _388 = false;
    float _396 = _386;
    float _398 = in.m_39.z;
    float _400 = in.m_39.x;
    float _402 = in.m_39.y;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _406 = _404 != 0;
    float _408 = in.m_41.x;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _412 = _410 != 0;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _416 = in.m_41.y;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _428 = _426 != 0;
    float _430 = in.m_41.z;
    float _432 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _434 = log2(_432);
    float _436 = in.m_41.w;
    float _438 = _398 * 2.0;
    float _440 = floor(_438);
    float _442 = _400 * 2.0;
    float _444 = _400 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _446 = _402 * 2.0;
    out.m_43.x = _408;
    float _448 = -_414;
    float _450 = fma(_444, 2.0, _448);
    float _452 = _402 + _398;
    float _454 = floor(_442);
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _458 = _402 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _460 = !_420;
    int _462 = _460 ? 0 : 1;
    out.m_43.y = _416;
    float _464 = fma(_458, -2.0, _456);
    float _466 = _452 + (-1.0);
    bool _468 = _440 > 0.0;
    float _470 = _402 + _400;
    bool _472 = _440 >= 0.0;
    bool _474 = isnan(_440);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    float _482 = floor(_446);
    float _484 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _486 = _470 + (-1.0);
    int _488 = _480 ? 0 : 1;
    float _490 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _464);
    bool _492 = _454 > 0.0;
    float _494 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _496 = abs(_462);
    out.m_43.z = _430;
    int _498 = ~_488;
    int _500 = _498 + 1;
    int _502 = _500 + 1;
    bool _504 = _454 >= 0.0;
    bool _506 = isnan(_454);
    bool _508 = _504 || _506;
    bool _510 = isnan(0.0);
    bool _512 = _508 || _510;
    float _514 = _434 * _110;
    int _516 = _502;
    if (!_468)
    {
        int _518 = ~_488;
        int _520 = _518 + 1;
        _516 = _520;
    }
    int _522 = _516;
    out.m_43.w = _436;
    int _524 = _512 ? 0 : 1;
    float _526 = exp2(_514);
    float _528 = float(_496);
    float _530 = float(_522);
    int _532 = ~_524;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    float _538 = _528 * _530;
    int _540 = _536;
    if (!_492)
    {
        int _542 = ~_524;
        int _544 = _542 + 1;
        _540 = _544;
    }
    int _546 = _540;
    bool _548 = _482 > 0.0;
    float _550 = in.m_45.x;
    float _552 = in.m_45.y;
    float _554 = in.m_45.z;
    bool _556 = _482 >= 0.0;
    bool _558 = isnan(_482);
    bool _560 = _556 || _558;
    bool _562 = isnan(0.0);
    bool _564 = _560 || _562;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _568 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _570 = isnan(1.0);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _576 = _572 || _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _580 = 1.0 + _578;
    float _582 = float(_546);
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _586 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[78].z, _566);
    bool _588 = !_424;
    int _590 = _588 ? 0 : 1;
    float _592 = 1.0 / _580;
    float _594 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[78].w, _584);
    bool _596 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    float _606 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _586);
    int _608 = abs(_590);
    float _610 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _594);
    float _612 = -_526;
    float _614 = _612 + 1.0;
    float _616 = -_110;
    float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[76].x, _450);
    float _620 = float(_608);
    float _622 = _538 * (-2.0);
    int _624 = _564 ? 0 : 1;
    float _626 = _604 ? _614 : 0.0;
    float _628 = _620 * _582;
    int _630 = ~_624;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    float _636 = fma(_494, _622, _494);
    int _638 = _634;
    if (!_548)
    {
        int _640 = ~_624;
        int _642 = _640 + 1;
        _638 = _642;
    }
    int _644 = _638;
    float _646 = fma(_622, _550, _550);
    float _648 = _628 * (-2.0);
    float _650 = _400 + (-0.5);
    bool _652 = !_428;
    int _654 = _652 ? 0 : 1;
    if (_576)
    {
        float _656 = _626 * _592;
        _112 = _656;
    }
    float _658 = _112;
    bool _660 = _402 > 0.5;
    float _662 = _402 + (-0.5);
    float _664 = fma(_648, _552, _552);
    float _666 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[196].x, _646);
    int _668 = abs(_654);
    float _670 = fma(_484, _648, _484);
    float _672 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[196].y, _664);
    float _674 = fma(_636, _658, _666);
    float _676 = _250 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _678 = _250 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _680 = _250 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _682 = float(_668);
    float _684 = _674 * 0.15915493667125701904296875;
    float _686 = float(_644);
    float _688 = in.m_37.x;
    float _690 = in.m_37.y;
    float _692 = in.m_37.z;
    float _694 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].x, _678);
    float _696 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].x, _676);
    float _698 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].x, _680);
    float _700 = fma(_670, _658, _672);
    float _702 = _682 * _686;
    float _704 = in.m_47.x;
    float _706 = in.m_47.y;
    float _708 = in.m_47.z;
    float _710 = _398 + _400;
    float _712 = _700 * 0.15915493667125701904296875;
    float _714 = _702 * (-2.0);
    float _716 = _398 + (-0.5);
    float _718 = _710 + (-1.0);
    float _720 = in.m_49.y;
    float _722 = fma(_714, _554, _554);
    float _724 = _684 * 6.283185482025146484375;
    float _726 = sin(_724);
    float _728 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _730 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].z, _698);
    float _732 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[196].z, _722);
    float _734 = fma(_728, _714, _728);
    float _736 = _730 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _738 = _684 * 6.283185482025146484375;
    float _740 = cos(_738);
    float _742 = fma(_734, _658, _732);
    float _744 = _360 * _688;
    float _746 = _366 * _692;
    float _748 = _364 * _690;
    float _750 = _742 * 0.15915493667125701904296875;
    float _752 = _744 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _754 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].z, _694);
    float _756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _706);
    float _758 = _712 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _704);
    float _764 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _708);
    float _766 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _768 = _746 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _770 = -_720;
    float _772 = _770 + 1.0;
    float _774 = _752 * _762;
    float _776 = _766 * _756;
    float _778 = _712 * 6.283185482025146484375;
    float _780 = cos(_778);
    float _782 = _768 * _764;
    float _784 = _720;
    float _786 = _694;
    if (_412)
    {
        float _788 = _660 ? _772 : _720;
        _784 = _788;
    }
    float _790 = _784;
    float _792 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].z, _696);
    float _794 = _754 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _796 = _792 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _798 = _750 * 6.283185482025146484375;
    float _800 = cos(_798);
    float _802 = _726 * _760;
    float _804 = _740 * _760;
    float _806 = _750 * 6.283185482025146484375;
    float _808 = sin(_806);
    float _810 = _740 * _780;
    float _812 = _726 * _780;
    float _814 = _760 * _800;
    float _816 = _800 * _776;
    float _818 = _780 * _800;
    float _820 = _740 * _816;
    float _822 = _726 * _816;
    float _824 = fma(_808, _810, _802);
    float _826 = -_804;
    float _828 = fma(_808, _812, _826);
    float _830 = -_776;
    float _832 = _808 * _830;
    float _834 = -_812;
    float _836 = fma(_808, _804, _834);
    float _838 = fma(_824, _774, _820);
    float _840 = fma(_808, _802, _810);
    float _842 = fma(_818, _774, _832);
    float _844 = fma(_828, _774, _822);
    float _846 = fma(_836, _782, _838);
    float _848 = fma(_814, _782, _842);
    float _850 = fma(_840, _782, _844);
    float _852 = _846 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _854 = _846 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _856 = _774;
    float _858 = _796;
    if (_406)
    {
        float _860 = in.m_39.x;
        _856 = _860;
    }
    float _862 = _856;
    float _864 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[26].x, _852);
    float _866 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[24].x, _854);
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _876 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[26].z, _864);
    float _878 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[24].z, _866);
    float _880 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _882 = _876 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _884 = _878 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _886 = _736 + _882;
    float _888 = _794 + _884;
    float _890 = 1.0 / _874;
    float _892 = in.m_49.x;
    float _894 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _896 = _888 + _894;
    float _898 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _900;
    float _904 = 1.0 / _870;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _910 = _862 > 0.5;
    bool _912 = _910 && _406;
    out.m_33.x = _898;
    float _914 = _908 * _890;
    float _916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _918 = _886 + _916;
    float _920 = _880 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _924 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _926 = isnan(_396);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = _918 * _918;
    float _938 = fma(_920, _790, -0.5);
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _942 = _396 + _940;
    float _944 = _902 * _904;
    float _946 = fma(_896, _896, _936);
    bool _948 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _950 = isnan(_396);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = -_490;
    float _962 = fma(_610, _938, _960);
    bool _964 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _966 = isnan(_396);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = sqrt(_946);
    float _978 = fma(_944, _942, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _980 = -_958;
    float _982 = _980 + 1.0;
    float _984 = _974;
    if (_406)
    {
        _786 = _892;
    }
    float _986 = _786;
    float _988 = _846 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _992 = _396 + _990;
    float _994 = _974 * _982;
    float _996 = -_974;
    float _998 = _996 + 1.0;
    float _1000 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[25].x, _988);
    float _1002 = _986;
    if (_912)
    {
        float _1004 = -_986;
        float _1006 = _1004 + 1.0;
        _1002 = _1006;
    }
    float _1008 = _1002;
    if (!_406)
    {
        _984 = _892;
    }
    float _1010 = _984;
    float _1012 = _934 * _998;
    float _1014 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1000);
    float _1016 = _922 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1018 = _1010;
    if (_406)
    {
        _1018 = _1008;
    }
    float _1020 = _1018;
    float _1022 = _978 * _1012;
    bool _1024 = _976 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1026 = _1014 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1028 = -_934;
    float _1030 = _1028 + 1.0;
    float _1032 = fma(_1016, _1020, -0.5);
    float _1034 = fma(_914, _992, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1036 = _796 + _1026;
    float _1038 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1022);
    float _1040 = fma(_606, _1032, _618);
    float _1042 = fma(_1034, _994, _1038);
    float _1044 = _1026;
    float _1046 = _1032;
    if (!_1024)
    {
        _1044 = _888;
    }
    float _1048 = _1044;
    float _1050 = _1048;
    if (!_1024)
    {
        _1046 = _886;
    }
    float _1052 = _1046;
    float _1054 = _1052;
    if (!_1024)
    {
        _858 = _1036;
    }
    float _1056 = _858;
    bool _1058 = !_1024;
    float _1060 = _1056;
    if (!_1058)
    {
        float _1062 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1064 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1066 = _976 + _1064;
        float _1068 = _1036 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1070 = rsqrt(_946);
        float _1072 = _1066 * _1062;
        float _1074 = _1072 * 0.15915493667125701904296875;
        float _1076 = _1074 * 6.283185482025146484375;
        float _1078 = cos(_1076);
        float _1080 = _1074 * 6.283185482025146484375;
        float _1082 = sin(_1080);
        float _1084 = _1078 + (-1.0);
        float _1086 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = fma(_1082, _1068, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1090 = fma(_1036, _1078, _1086);
        float _1092 = _1070 * _1088;
        float _1094 = fma(_896, _1092, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1096 = fma(_918, _1092, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1060 = _1090;
        _1050 = _1094;
        _1054 = _1096;
    }
    float _1098 = _1060;
    float _1100 = _1050;
    float _1102 = _1054;
    float _1104 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1106 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1108 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1042);
    float _1110 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1112 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1104);
    float _1114 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1116 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1106);
    float _1118 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1110);
    float _1120 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1112);
    float _1122 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1114);
    float _1124 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1116);
    float _1126 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1118);
    float _1128 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1130 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1122);
    float _1132 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1134 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1136 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1138 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1140 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1142 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1144 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1136);
    float _1146 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1138);
    float _1148 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1140);
    float _1150 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1142);
    float _1152 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1154 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1144);
    float _1156 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1146);
    float _1158 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1148);
    float _1160 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1150);
    float _1162 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1154);
    float _1164 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1156);
    float _1166 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1158);
    float _1168 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1160);
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1176 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1182 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1186 = _1166 + _1168;
    float _1188 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1190 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1192 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1194 = _1040 + 0.5;
    float _1196 = _1108 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1198 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1200 = _962 + 0.5;
    float _1202 = _1186 * 0.5;
    out.m_51.x = _1192;
    out.m_51.y = _1182;
    out.m_51.z = _1198;
    out.m_53.x = _1194;
    out.m_53.y = _1200;
    out.m_55.x = _1190;
    out.m_55.y = _1188;
    out.m_55.z = _1176;
    out.m_55.w = _1196;
    out.gl_Position.x = _1164;
    out.gl_Position.y = _1162;
    out.gl_Position.z = _1166;
    out.gl_Position.w = _1168;
    out.m_57.z = _1202;
    out.m_57.w = _1168;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    bool _388 = false;
    bool _274 = false;
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
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    float _86 = _84;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _84 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1259 = as_type<float>(_92);
        out.gl_Position.z = _1259;
    }
    if (!_80)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _112 = _110;
    if (_106)
    {
        float _114 = float(_76);
        _86 = _114;
    }
    float _116 = _86;
    bool _118 = _110 >= _116;
    bool _120 = !_106;
    bool _122 = _118 || _120;
    float _124 = _116;
    if (_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _128 = _126 * 5.0;
        _94 = as_type<int>(_128);
    }
    int _130 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1329 = as_type<float>(_130);
        out.gl_Position.z = _1329;
    }
    if (_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_37.w;
    float _134 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_35.x;
    float _148 = in.m_35.y;
    float _150 = in.m_35.z;
    float _152 = in.m_30.x;
    float _154 = in.m_30.y;
    float _156 = in.m_30.z;
    float _158 = 0.0;
    float _160 = _134;
    if (!_144)
    {
        float _162 = _134 * _134;
        float _164 = _162 * 0.5;
        _158 = _164;
    }
    float _166 = _158;
    float _168 = _166;
    if (!_144)
    {
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _168 = _170;
    }
    float _172 = _168;
    bool _174 = !_144;
    float _176 = _172;
    if (!_174)
    {
        float _178 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _180 = log2(_178);
        float _182 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _184 = _182 + 1.0;
        float _186 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = _134 * _180;
        float _190 = 1.0 / _184;
        float _192 = _186 * 0.693147182464599609375;
        float _194 = exp2(_188);
        float _196 = 1.0 / _192;
        float _198 = _194 + (-1.0);
        float _200 = -_198;
        float _202 = fma(_200, _196, _134);
        float _204 = _202 * _190;
        float _206 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _206;
    }
    float _208 = _176;
    bool _210 = !_144;
    if (!_210)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = 1.0 / _218;
        float _222 = _134 * _214;
        float _224 = exp2(_222);
        float _226 = -_224;
        float _228 = _226 + 1.0;
        float _230 = _228 * _220;
        _160 = _230;
    }
    float _232 = _160;
    bool _234 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _236 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _238 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _240 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _242 = fma(_232, _146, _236);
    float _244 = fma(_232, _148, _238);
    float _246 = fma(_232, _150, _240);
    float _248 = fma(_242, _132, _152);
    float _250 = fma(_244, _132, _154);
    float _252 = fma(_246, _132, _156);
    bool _254 = !_234;
    float _272;
    if (!_254)
    {
        float _256 = in.m_39.x;
        float _258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _260 = _256 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _264 = _262 * _258;
        float _266 = floor(_264);
        float _268 = -_266;
        float _270 = _264 + _268;
        _272 = _270;
        _274 = true;
    }
    else
    {
        float _276 = float(_76);
        float _278 = 1.0 / _276;
        float _280 = _110 * _278;
        _272 = _280;
    }
    _274 = false;
    float _282 = _272;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _286 = _282 + _284;
    bool _288 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _290 = isnan(_282);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _300;
    bool _304 = _282 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _306 = isnan(_282);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -_298;
    float _318 = _316 + 1.0;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _320;
    float _324 = 1.0 / _302;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _328 = _286 * _324;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _330;
    float _334 = _314 * _318;
    float _336 = fma(_322, _328, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _338 = -_314;
    float _340 = _338 + 1.0;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = fma(_332, _328, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _348 = _336 * _334;
    float _350 = fma(_344, _328, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _352 = _346 * _334;
    float _354 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].x, _348);
    float _356 = _350 * _334;
    float _358 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].z, _352);
    float _360 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[144].x, _354);
    float _362 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].y, _356);
    float _364 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[144].y, _362);
    float _366 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[144].z, _358);
    bool _368 = !_326;
    float _386;
    if (!_368)
    {
        float _370 = in.m_39.x;
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _374 = _370 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[11].y, _110);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        float _390 = float(_76);
        float _392 = 1.0 / _390;
        float _394 = _110 * _392;
        _386 = _394;
    }
    _388 = false;
    float _396 = _386;
    float _398 = in.m_39.z;
    float _400 = in.m_39.x;
    float _402 = in.m_39.y;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _406 = _404 != 0;
    float _408 = in.m_41.x;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _412 = _410 != 0;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _416 = in.m_41.y;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _428 = _426 != 0;
    float _430 = in.m_41.z;
    float _432 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _434 = log2(_432);
    float _436 = in.m_41.w;
    float _438 = _398 * 2.0;
    float _440 = floor(_438);
    float _442 = _400 * 2.0;
    float _444 = _400 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _446 = _402 * 2.0;
    out.m_43.x = _408;
    float _448 = -_414;
    float _450 = fma(_444, 2.0, _448);
    float _452 = _402 + _398;
    float _454 = floor(_442);
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _458 = _402 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _460 = !_420;
    int _462 = _460 ? 0 : 1;
    out.m_43.y = _416;
    float _464 = fma(_458, -2.0, _456);
    float _466 = _452 + (-1.0);
    bool _468 = _440 > 0.0;
    float _470 = _402 + _400;
    bool _472 = _440 >= 0.0;
    bool _474 = isnan(_440);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    float _482 = floor(_446);
    float _484 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _486 = _470 + (-1.0);
    int _488 = _480 ? 0 : 1;
    float _490 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _464);
    bool _492 = _454 > 0.0;
    float _494 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _496 = abs(_462);
    out.m_43.z = _430;
    int _498 = ~_488;
    int _500 = _498 + 1;
    int _502 = _500 + 1;
    bool _504 = _454 >= 0.0;
    bool _506 = isnan(_454);
    bool _508 = _504 || _506;
    bool _510 = isnan(0.0);
    bool _512 = _508 || _510;
    float _514 = _434 * _110;
    int _516 = _502;
    if (!_468)
    {
        int _518 = ~_488;
        int _520 = _518 + 1;
        _516 = _520;
    }
    int _522 = _516;
    out.m_43.w = _436;
    int _524 = _512 ? 0 : 1;
    float _526 = exp2(_514);
    float _528 = float(_496);
    float _530 = float(_522);
    int _532 = ~_524;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    float _538 = _528 * _530;
    int _540 = _536;
    if (!_492)
    {
        int _542 = ~_524;
        int _544 = _542 + 1;
        _540 = _544;
    }
    int _546 = _540;
    bool _548 = _482 > 0.0;
    float _550 = in.m_45.x;
    float _552 = in.m_45.y;
    float _554 = in.m_45.z;
    bool _556 = _482 >= 0.0;
    bool _558 = isnan(_482);
    bool _560 = _556 || _558;
    bool _562 = isnan(0.0);
    bool _564 = _560 || _562;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _568 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _570 = isnan(1.0);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _576 = _572 || _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _580 = 1.0 + _578;
    float _582 = float(_546);
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _586 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[78].z, _566);
    bool _588 = !_424;
    int _590 = _588 ? 0 : 1;
    float _592 = 1.0 / _580;
    float _594 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[78].w, _584);
    bool _596 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    float _606 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _586);
    int _608 = abs(_590);
    float _610 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _594);
    float _612 = -_526;
    float _614 = _612 + 1.0;
    float _616 = -_110;
    float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[76].x, _450);
    float _620 = float(_608);
    float _622 = _538 * (-2.0);
    int _624 = _564 ? 0 : 1;
    float _626 = _604 ? _614 : 0.0;
    float _628 = _620 * _582;
    int _630 = ~_624;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    float _636 = fma(_494, _622, _494);
    int _638 = _634;
    if (!_548)
    {
        int _640 = ~_624;
        int _642 = _640 + 1;
        _638 = _642;
    }
    int _644 = _638;
    float _646 = fma(_622, _550, _550);
    float _648 = _628 * (-2.0);
    float _650 = _400 + (-0.5);
    bool _652 = !_428;
    int _654 = _652 ? 0 : 1;
    if (_576)
    {
        float _656 = _626 * _592;
        _112 = _656;
    }
    float _658 = _112;
    bool _660 = _402 > 0.5;
    float _662 = _402 + (-0.5);
    float _664 = fma(_648, _552, _552);
    float _666 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[196].x, _646);
    int _668 = abs(_654);
    float _670 = fma(_484, _648, _484);
    float _672 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[196].y, _664);
    float _674 = fma(_636, _658, _666);
    float _676 = _250 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _678 = _250 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _680 = _250 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _682 = float(_668);
    float _684 = _674 * 0.15915493667125701904296875;
    float _686 = float(_644);
    float _688 = in.m_37.x;
    float _690 = in.m_37.y;
    float _692 = in.m_37.z;
    float _694 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[4].x, _678);
    float _696 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[5].x, _676);
    float _698 = fma(_248, (*spvDescriptorSet0.vp_c10)._m0[6].x, _680);
    float _700 = fma(_670, _658, _672);
    float _702 = _682 * _686;
    float _704 = in.m_47.x;
    float _706 = in.m_47.y;
    float _708 = in.m_47.z;
    float _710 = _398 + _400;
    float _712 = _700 * 0.15915493667125701904296875;
    float _714 = _702 * (-2.0);
    float _716 = _398 + (-0.5);
    float _718 = _710 + (-1.0);
    float _720 = in.m_49.y;
    float _722 = fma(_714, _554, _554);
    float _724 = _684 * 6.283185482025146484375;
    float _726 = sin(_724);
    float _728 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _730 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].z, _698);
    float _732 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[196].z, _722);
    float _734 = fma(_728, _714, _728);
    float _736 = _730 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _738 = _684 * 6.283185482025146484375;
    float _740 = cos(_738);
    float _742 = fma(_734, _658, _732);
    float _744 = _360 * _688;
    float _746 = _366 * _692;
    float _748 = _364 * _690;
    float _750 = _742 * 0.15915493667125701904296875;
    float _752 = _744 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _754 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].z, _694);
    float _756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _706);
    float _758 = _712 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _704);
    float _764 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _708);
    float _766 = _748 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _768 = _746 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _770 = -_720;
    float _772 = _770 + 1.0;
    float _774 = _752 * _762;
    float _776 = _766 * _756;
    float _778 = _712 * 6.283185482025146484375;
    float _780 = cos(_778);
    float _782 = _768 * _764;
    float _784 = _720;
    float _786 = _694;
    if (_412)
    {
        float _788 = _660 ? _772 : _720;
        _784 = _788;
    }
    float _790 = _784;
    float _792 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].z, _696);
    float _794 = _754 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _796 = _792 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _798 = _750 * 6.283185482025146484375;
    float _800 = cos(_798);
    float _802 = _726 * _760;
    float _804 = _740 * _760;
    float _806 = _750 * 6.283185482025146484375;
    float _808 = sin(_806);
    float _810 = _740 * _780;
    float _812 = _726 * _780;
    float _814 = _760 * _800;
    float _816 = _800 * _776;
    float _818 = _780 * _800;
    float _820 = _740 * _816;
    float _822 = _726 * _816;
    float _824 = fma(_808, _810, _802);
    float _826 = -_804;
    float _828 = fma(_808, _812, _826);
    float _830 = -_776;
    float _832 = _808 * _830;
    float _834 = -_812;
    float _836 = fma(_808, _804, _834);
    float _838 = fma(_824, _774, _820);
    float _840 = fma(_808, _802, _810);
    float _842 = fma(_818, _774, _832);
    float _844 = fma(_828, _774, _822);
    float _846 = fma(_836, _782, _838);
    float _848 = fma(_814, _782, _842);
    float _850 = fma(_840, _782, _844);
    float _852 = _846 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _854 = _846 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _856 = _774;
    float _858 = _796;
    if (_406)
    {
        float _860 = in.m_39.x;
        _856 = _860;
    }
    float _862 = _856;
    float _864 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[26].x, _852);
    float _866 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[24].x, _854);
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _876 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[26].z, _864);
    float _878 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[24].z, _866);
    float _880 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _882 = _876 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _884 = _878 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _886 = _736 + _882;
    float _888 = _794 + _884;
    float _890 = 1.0 / _874;
    float _892 = in.m_49.x;
    float _894 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _896 = _888 + _894;
    float _898 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _900;
    float _904 = 1.0 / _870;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _910 = _862 > 0.5;
    bool _912 = _910 && _406;
    out.m_33.x = _898;
    float _914 = _908 * _890;
    float _916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _918 = _886 + _916;
    float _920 = _880 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _924 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _926 = isnan(_396);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = _918 * _918;
    float _938 = fma(_920, _790, -0.5);
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _942 = _396 + _940;
    float _944 = _902 * _904;
    float _946 = fma(_896, _896, _936);
    bool _948 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _950 = isnan(_396);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = -_490;
    float _962 = fma(_610, _938, _960);
    bool _964 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _966 = isnan(_396);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = sqrt(_946);
    float _978 = fma(_944, _942, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _980 = -_958;
    float _982 = _980 + 1.0;
    float _984 = _974;
    if (_406)
    {
        _786 = _892;
    }
    float _986 = _786;
    float _988 = _846 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _992 = _396 + _990;
    float _994 = _974 * _982;
    float _996 = -_974;
    float _998 = _996 + 1.0;
    float _1000 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[25].x, _988);
    float _1002 = _986;
    if (_912)
    {
        float _1004 = -_986;
        float _1006 = _1004 + 1.0;
        _1002 = _1006;
    }
    float _1008 = _1002;
    if (!_406)
    {
        _984 = _892;
    }
    float _1010 = _984;
    float _1012 = _934 * _998;
    float _1014 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1000);
    float _1016 = _922 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1018 = _1010;
    if (_406)
    {
        _1018 = _1008;
    }
    float _1020 = _1018;
    float _1022 = _978 * _1012;
    bool _1024 = _976 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1026 = _1014 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1028 = -_934;
    float _1030 = _1028 + 1.0;
    float _1032 = fma(_1016, _1020, -0.5);
    float _1034 = fma(_914, _992, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1036 = _796 + _1026;
    float _1038 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1022);
    float _1040 = fma(_606, _1032, _618);
    float _1042 = fma(_1034, _994, _1038);
    float _1044 = _1026;
    float _1046 = _1032;
    if (!_1024)
    {
        _1044 = _888;
    }
    float _1048 = _1044;
    float _1050 = _1048;
    if (!_1024)
    {
        _1046 = _886;
    }
    float _1052 = _1046;
    float _1054 = _1052;
    if (!_1024)
    {
        _858 = _1036;
    }
    float _1056 = _858;
    bool _1058 = !_1024;
    float _1060 = _1056;
    if (!_1058)
    {
        float _1062 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1064 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1066 = _976 + _1064;
        float _1068 = _1036 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1070 = rsqrt(_946);
        float _1072 = _1066 * _1062;
        float _1074 = _1072 * 0.15915493667125701904296875;
        float _1076 = _1074 * 6.283185482025146484375;
        float _1078 = cos(_1076);
        float _1080 = _1074 * 6.283185482025146484375;
        float _1082 = sin(_1080);
        float _1084 = _1078 + (-1.0);
        float _1086 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = fma(_1082, _1068, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1090 = fma(_1036, _1078, _1086);
        float _1092 = _1070 * _1088;
        float _1094 = fma(_896, _1092, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1096 = fma(_918, _1092, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1060 = _1090;
        _1050 = _1094;
        _1054 = _1096;
    }
    float _1098 = _1060;
    float _1100 = _1050;
    float _1102 = _1054;
    float _1104 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1106 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1108 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1042);
    float _1110 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1112 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1104);
    float _1114 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1116 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1106);
    float _1118 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1110);
    float _1120 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1112);
    float _1122 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1114);
    float _1124 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1116);
    float _1126 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1118);
    float _1128 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1130 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1122);
    float _1132 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1134 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1136 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1138 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1140 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1142 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1144 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1136);
    float _1146 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1138);
    float _1148 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1140);
    float _1150 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1142);
    float _1152 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1154 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1144);
    float _1156 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1146);
    float _1158 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1148);
    float _1160 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1150);
    float _1162 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1154);
    float _1164 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1156);
    float _1166 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1158);
    float _1168 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1160);
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1176 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1182 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1186 = _1166 + _1168;
    float _1188 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1190 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1192 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1194 = _1040 + 0.5;
    float _1196 = _1108 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1198 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1200 = _962 + 0.5;
    float _1202 = _1186 * 0.5;
    out.m_51.x = _1192;
    out.m_51.y = _1182;
    out.m_51.z = _1198;
    out.m_53.x = _1194;
    out.m_53.y = _1200;
    out.m_55.x = _1190;
    out.m_55.y = _1188;
    out.m_55.z = _1176;
    out.m_55.w = _1196;
    out.gl_Position.x = _1164;
    out.gl_Position.y = _1162;
    out.gl_Position.z = _1166;
    out.gl_Position.w = _1168;
    out.m_57.z = _1202;
    out.m_57.w = _1168;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

