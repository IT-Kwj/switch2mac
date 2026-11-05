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
    float4 m_49 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_43 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_45 [[attribute(5)]];
    float4 m_41 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
    float4 m_47 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _276 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _84;
    if (!_82)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_82)
    {
        float _90 = _86 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1286 = as_type<float>(_92);
        out.gl_Position.z = _1286;
    }
    if (!_82)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _96 = in.m_35.w;
    float _98 = float(_78);
    float _100 = 1.0 / _98;
    float _102 = -_96;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_96);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = _104 * _100;
    bool _118 = _104 >= _98;
    bool _120 = !_114;
    bool _122 = _118 || _120;
    out.m_37.x = _116;
    float _124 = _96;
    float _126 = _104;
    if (_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _124;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _130 = _128 * 5.0;
        _94 = as_type<int>(_130);
    }
    int _132 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1358 = as_type<float>(_132);
        out.gl_Position.z = _1358;
    }
    if (_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_39.w;
    float _136 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        float _258 = in.m_41.x;
        float _260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _262 = _258 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[12].x, _104);
        float _266 = _264 * _260;
        float _268 = floor(_266);
        float _270 = -_268;
        float _272 = _266 + _270;
        _274 = _272;
        _276 = true;
    }
    else
    {
        _274 = _116;
    }
    _276 = false;
    float _278 = _274;
    float _280 = in.m_41.x;
    float _282 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _284 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _286 = in.m_41.z;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _296;
    float _300 = in.m_41.y;
    float _302 = 1.0 / _290;
    float _304 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _306 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _282);
    float _308 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _284);
    float _310 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _304);
    float _312 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _306);
    float _314 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _308);
    float _316 = 1.0 / _294;
    float _318 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _310);
    float _320 = _314 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _324 = _322 != 0;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _332 = _330 != 0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = _278 + _334;
    float _338 = _280 * 2.0;
    float _340 = 1.0 / _298;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _278 + _342;
    float _346 = _336 * _302;
    float _348 = _286 * 2.0;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _358 = _300 + _286;
    float _360 = _344 * _316;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _364 = _278 + _362;
    float _366 = _280 + _286;
    float _368 = _358 + (-1.0);
    float _370 = floor(_338);
    float _372 = _300 * 2.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _382 = _364 * _340;
    float _384 = fma(_352, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _386 = floor(_348);
    float _388 = fma(_376, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _390 = fma(_356, _360, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _392 = fma(_380, _360, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = _312 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _404 = floor(_372);
    float _406 = _366 + (-1.0);
    float _408 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _410 = _280 + _300;
    bool _412 = _370 > 0.0;
    float _414 = fma(_396, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _416 = _370 >= 0.0;
    bool _418 = isnan(_370);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = _410 + (-1.0);
    float _428 = fma(_400, _360, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _432 = _320 + _430;
    float _434 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _436 = _424 ? 0 : 1;
    float _438 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _440 = log2(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _442;
    int _446 = ~_436;
    int _448 = _446 + 1;
    int _450 = _448 + 1;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _452;
    int _456 = _450;
    int _458 = as_type<int>(_280);
    float _460 = _320;
    if (!_412)
    {
        int _462 = ~_436;
        int _464 = _462 + 1;
        _456 = _464;
    }
    int _466 = _456;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _468;
    float _472 = _318 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _474 = _404 > 0.0;
    float _476 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _478 = _402 + _476;
    bool _480 = _404 >= 0.0;
    bool _482 = isnan(_404);
    bool _484 = _480 || _482;
    bool _486 = isnan(0.0);
    bool _488 = _484 || _486;
    float _490 = _432 * _432;
    float _492 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _494 = fma(_444, _382, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = _440 * _104;
    float _498 = fma(_470, _382, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _500 = fma(_454, _382, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _504 = 1.0 + _502;
    bool _506 = !_328;
    int _508 = _506 ? 0 : 1;
    float _510 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _512 = _472 + _510;
    float _514 = exp2(_496);
    float _516 = fma(_478, _478, _490);
    bool _518 = _386 > 0.0;
    bool _520 = _386 >= 0.0;
    bool _522 = isnan(_386);
    bool _524 = _520 || _522;
    bool _526 = isnan(0.0);
    bool _528 = _524 || _526;
    out.m_33.x = 1.0;
    bool _530 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _532 = isnan(1.0);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _538 = _534 || _536;
    float _540 = 1.0 / _504;
    float _542 = in.m_43.x;
    float _544 = in.m_43.y;
    float _546 = in.m_43.z;
    int _548 = _528 ? 0 : 1;
    bool _550 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _552 = isnan(0.0);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _558 = _554 || _556;
    float _560 = float(_466);
    float _562 = -_514;
    float _564 = _562 + 1.0;
    int _566 = abs(_508);
    float _568 = fma(_512, _512, _516);
    int _570 = _488 ? 0 : 1;
    float _572 = float(_566);
    float _574 = _558 ? _564 : 0.0;
    float _576 = rsqrt(_568);
    bool _578 = !_332;
    int _580 = _578 ? 0 : 1;
    float _582 = _572 * _560;
    int _584 = ~_548;
    int _586 = _584 + 1;
    int _588 = _586 + 1;
    int _590 = _588;
    float _592 = 1.0;
    if (_538)
    {
        float _594 = _574 * _540;
        _126 = _594;
    }
    float _596 = _126;
    int _598 = ~_570;
    int _600 = _598 + 1;
    int _602 = _600 + 1;
    float _604 = _300 + (-0.5);
    int _606 = _602;
    if (!_518)
    {
        int _608 = ~_548;
        int _610 = _608 + 1;
        _590 = _610;
    }
    int _612 = _590;
    float _614 = _582 * (-2.0);
    if (!_474)
    {
        int _616 = ~_570;
        int _618 = _616 + 1;
        _606 = _618;
    }
    int _620 = _606;
    int _622 = abs(_580);
    float _624 = fma(_614, _544, _544);
    float _626 = float(_620);
    float _628 = fma(_408, _614, _408);
    float _630 = float(_622);
    float _632 = _432 * _576;
    float _634 = _478 * _576;
    float _636 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[196].y, _624);
    bool _638 = !_324;
    int _640 = _638 ? 0 : 1;
    float _642 = -_632;
    float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _432);
    float _646 = -_634;
    float _648 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[18].w, _478);
    float _650 = fma(_628, _596, _636);
    bool _652 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _654 = isnan(_278);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _644 * _644;
    float _666 = _630 * _626;
    bool _668 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _670 = isnan(_278);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = _650 * 0.15915493667125701904296875;
    float _682 = fma(_648, _648, _664);
    float _684 = _512 * _576;
    bool _686 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _688 = isnan(_278);
    bool _690 = _686 || _688;
    bool _692 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _694 = _690 || _692;
    float _696 = float(_694);
    float _698 = -_678;
    float _700 = _698 + 1.0;
    float _702 = -_662;
    float _704 = _702 + 1.0;
    float _706 = -_684;
    float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _512);
    float _710 = float(_612);
    float _712 = _662 * _700;
    bool _714 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _716 = isnan(_278);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = fma(_708, _708, _682);
    int _728 = abs(_640);
    float _730 = _696 * _704;
    float _732 = _666 * (-2.0);
    float _734 = _286 + (-0.5);
    float _736 = float(_728);
    float _738 = -_696;
    float _740 = _738 + 1.0;
    float _742 = fma(_732, _546, _546);
    float _744 = fma(_492, _732, _492);
    float _746 = sqrt(_726);
    float _748 = _736 * _710;
    float _750 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[196].z, _742);
    float _752 = _724 * _740;
    bool _754 = _300 > 0.5;
    float _756 = _748 * (-2.0);
    float _758 = fma(_744, _596, _750);
    float _760 = in.m_45.x;
    float _762 = in.m_45.y;
    float _764 = in.m_45.z;
    float _766 = _414 * _752;
    float _768 = fma(_434, _756, _434);
    float _770 = fma(_756, _542, _542);
    float _772 = _758 * 0.15915493667125701904296875;
    float _774 = -_724;
    float _776 = _774 + 1.0;
    float _778 = _384 * _752;
    float _780 = in.m_39.x;
    float _782 = in.m_39.y;
    float _784 = in.m_39.z;
    float _786 = _388 * _752;
    float _788 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].x, _766);
    float _790 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].y, _778);
    float _792 = _280 + (-0.5);
    float _794 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].z, _786);
    float _796 = fma(_428, _730, _788);
    float _798 = fma(_390, _730, _790);
    float _800 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[196].x, _770);
    float _802 = fma(_392, _730, _794);
    float _804 = _680 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = fma(_498, _712, _798);
    float _810 = fma(_768, _596, _800);
    float _812 = fma(_500, _712, _802);
    float _814 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[146].y, _808);
    float _816 = _810 * 0.15915493667125701904296875;
    float _818 = fma(_494, _712, _796);
    float _820 = _680 * 6.283185482025146484375;
    float _822 = cos(_820);
    float _824 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _764);
    float _826 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _760);
    float _828 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[146].x, _818);
    float _830 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[146].z, _812);
    float _832 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _762);
    float _834 = _814 * _782;
    float _836 = _828 * _780;
    float _838 = _772 * 6.283185482025146484375;
    float _840 = sin(_838);
    float _842 = _830 * _784;
    float _844 = _576 * _746;
    float _846 = _834 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _848 = _836 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _850 = _842 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _852 = _286 > 0.5;
    float _854 = _846 * _844;
    float _856 = _772 * 6.283185482025146484375;
    float _858 = cos(_856);
    float _860 = _848 * _844;
    float _862 = _850 * _844;
    float _864 = _854 * _832;
    float _866 = in.m_47.x;
    float _868 = _860 * _826;
    float _870 = _862 * _824;
    float _872 = _816 * 6.283185482025146484375;
    float _874 = cos(_872);
    float _876 = _806 * _840;
    float _878 = _822 * _840;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _882 = _816 * 6.283185482025146484375;
    float _884 = sin(_882);
    float _886 = _822 * _858;
    float _888 = _806 * _858;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _894 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _896 = _874 * _858;
    float _898 = _874 * _840;
    float _900 = _896 * _864;
    float _902 = fma(_884, _876, _886);
    float _904 = fma(_884, _886, _876);
    float _906 = -_888;
    float _908 = fma(_884, _878, _906);
    float _910 = -_878;
    float _912 = fma(_884, _888, _910);
    float _914 = fma(_898, _868, _900);
    float _916 = _904 * _864;
    float _918 = _912 * _864;
    float _920 = _874 * _870;
    float _922 = -_884;
    float _924 = fma(_922, _870, _914);
    float _926 = fma(_908, _868, _916);
    float _928 = fma(_902, _868, _918);
    float _930 = _924 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _932 = _924 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _934 = fma(_806, _920, _928);
    float _936 = fma(_822, _920, _926);
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _940 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[10].x, _930);
    float _942 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[8].x, _932);
    float _944 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _948 = _946 != 0;
    float _950 = fma(_936, (*spvDescriptorSet0.vp_c10)._m0[10].z, _940);
    float _952 = fma(_936, (*spvDescriptorSet0.vp_c10)._m0[8].z, _942);
    float _954 = _472 + _950;
    float _956 = _402 + _952;
    float _958 = in.m_47.y;
    float _960 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _962 = _954 + _960;
    float _964 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _966 = _956 + _964;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _970 = _962 * _962;
    float _972 = _924 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _976 = fma(_966, _966, _970);
    float _978 = _968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _982 = _980 != 0;
    float _984 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _986 = sqrt(_976);
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _990 = _988 != 0;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _996 = _994 != 0;
    out.m_49.x = _944;
    out.m_49.y = _978;
    out.m_49.z = _984;
    out.m_49.w = _880;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1000 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[9].x, _972);
    float _1002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1004 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1006 = _998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1008 = -_958;
    float _1010 = _1008 + 1.0;
    out.m_51.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1012 = fma(_936, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1000);
    float _1014 = _924;
    float _1016 = _1000;
    bool _1018 = _852;
    float _1020 = _958;
    int _1022 = as_type<int>(_1004);
    if (!_948)
    {
        _1014 = _866;
    }
    float _1024 = _1014;
    bool _1026 = _986 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_53.x = _1004;
    out.m_53.y = _1006;
    out.m_53.z = _894;
    out.m_53.w = _892;
    float _1030 = _1024;
    if (!_982)
    {
        _1016 = _866;
    }
    float _1032 = _1016;
    int _1034 = _852 ? as_type<int>(_1010) : as_type<int>(_958);
    float _1036 = _1032;
    if (_948)
    {
        bool _1038 = _280 > 0.5;
        _1018 = _1038;
    }
    bool _1040 = _1018;
    if (_948)
    {
        float _1042 = -_866;
        float _1044 = _1042 + 1.0;
        _458 = as_type<int>(_1044);
    }
    int _1046 = _458;
    float _1048 = _990 ? as_type<float>(_1034) : _958;
    float _1050 = as_type<float>(_1046);
    if (_996)
    {
        float _1052 = _754 ? _1010 : _958;
        _1020 = _1052;
    }
    float _1054 = _1020;
    if (_948)
    {
        float _1056 = _1040 ? as_type<float>(_1046) : _866;
        _1030 = _1056;
    }
    float _1058 = _1030;
    if (!_1026)
    {
        _592 = _956;
    }
    float _1060 = _592;
    float _1062 = _1060;
    if (_982)
    {
        float _1064 = -_866;
        float _1066 = _1064 + 1.0;
        _1022 = as_type<int>(_1066);
    }
    int _1068 = _1022;
    float _1070 = _320 + _1012;
    if (!_1026)
    {
        _460 = _954;
    }
    float _1072 = _460;
    float _1074 = _1072;
    if (_982)
    {
        float _1076 = _754 ? as_type<float>(_1068) : _866;
        _1036 = _1076;
    }
    float _1078 = _1036;
    if (!_1026)
    {
        _1050 = _1070;
    }
    float _1080 = _1050;
    bool _1082 = !_1026;
    float _1084 = _1080;
    if (!_1082)
    {
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1090 = _986 + _1088;
        float _1092 = _1070 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1094 = rsqrt(_976);
        float _1096 = _1090 * _1086;
        float _1098 = _1096 * 0.15915493667125701904296875;
        float _1100 = _1098 * 6.283185482025146484375;
        float _1102 = cos(_1100);
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = sin(_1104);
        float _1108 = _1102 + (-1.0);
        float _1110 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1112 = fma(_1106, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1114 = fma(_1070, _1102, _1110);
        float _1116 = _1094 * _1112;
        float _1118 = fma(_966, _1116, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1120 = fma(_962, _1116, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1084 = _1114;
        _1062 = _1118;
        _1074 = _1120;
    }
    float _1122 = _1084;
    float _1124 = _1062;
    float _1126 = _1074;
    float _1128 = -_632;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1122);
    float _1132 = -_634;
    float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1124);
    float _1136 = -_684;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1126);
    float _1140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1142 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1144 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1146 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1148 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1150 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1142);
    float _1152 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1144);
    float _1154 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1146);
    float _1156 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1148);
    float _1158 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1150);
    float _1160 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1152);
    float _1162 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1154);
    float _1164 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1156);
    float _1166 = _1158 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1168 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1172 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1176 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1178 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1180 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1182 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1174);
    float _1184 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1176);
    float _1186 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1178);
    float _1188 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1180);
    float _1190 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1182);
    float _1192 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1184);
    float _1194 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1196 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1198 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1186);
    float _1200 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1188);
    float _1202 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1190);
    float _1206 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1192);
    float _1208 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1210 = _1196 * _1028;
    float _1212 = _1202 * _1140;
    float _1214 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1216 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1198);
    float _1218 = _1204 + _1206;
    float _1220 = _1206 * 0.5;
    float _1222 = _1208 * _1170;
    float _1224 = _1214 * _1002;
    float _1226 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1200);
    float _1228 = _1218 * 0.5;
    float _1230 = fma(_1216, -0.5, _1220);
    out.m_55.x = _1212;
    out.m_55.y = _1222;
    out.m_57.x = _1224;
    out.m_57.y = _1210;
    out.gl_Position.x = _1204;
    out.gl_Position.y = _1216;
    out.gl_Position.z = _1226;
    out.gl_Position.w = _1206;
    out.m_59.w = _1206;
    out.m_59.x = _1228;
    out.m_59.y = _1230;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _276 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _84;
    if (!_82)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_82)
    {
        float _90 = _86 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1286 = as_type<float>(_92);
        out.gl_Position.z = _1286;
    }
    if (!_82)
    {
        return out;
    }
    float _96 = in.m_35.w;
    float _98 = float(_78);
    float _100 = 1.0 / _98;
    float _102 = -_96;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_96);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = _104 * _100;
    bool _118 = _104 >= _98;
    bool _120 = !_114;
    bool _122 = _118 || _120;
    out.m_37.x = _116;
    float _124 = _96;
    float _126 = _104;
    if (_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _124;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _130 = _128 * 5.0;
        _94 = as_type<int>(_130);
    }
    int _132 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1358 = as_type<float>(_132);
        out.gl_Position.z = _1358;
    }
    if (_122)
    {
        return out;
    }
    float _134 = in.m_39.w;
    float _136 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        float _258 = in.m_41.x;
        float _260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _262 = _258 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[12].x, _104);
        float _266 = _264 * _260;
        float _268 = floor(_266);
        float _270 = -_268;
        float _272 = _266 + _270;
        _274 = _272;
        _276 = true;
    }
    else
    {
        _274 = _116;
    }
    _276 = false;
    float _278 = _274;
    float _280 = in.m_41.x;
    float _282 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _284 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _286 = in.m_41.z;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _296;
    float _300 = in.m_41.y;
    float _302 = 1.0 / _290;
    float _304 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _306 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _282);
    float _308 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _284);
    float _310 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _304);
    float _312 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _306);
    float _314 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _308);
    float _316 = 1.0 / _294;
    float _318 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _310);
    float _320 = _314 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _324 = _322 != 0;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _332 = _330 != 0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = _278 + _334;
    float _338 = _280 * 2.0;
    float _340 = 1.0 / _298;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _278 + _342;
    float _346 = _336 * _302;
    float _348 = _286 * 2.0;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _358 = _300 + _286;
    float _360 = _344 * _316;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _364 = _278 + _362;
    float _366 = _280 + _286;
    float _368 = _358 + (-1.0);
    float _370 = floor(_338);
    float _372 = _300 * 2.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _382 = _364 * _340;
    float _384 = fma(_352, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _386 = floor(_348);
    float _388 = fma(_376, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _390 = fma(_356, _360, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _392 = fma(_380, _360, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = _312 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _404 = floor(_372);
    float _406 = _366 + (-1.0);
    float _408 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _410 = _280 + _300;
    bool _412 = _370 > 0.0;
    float _414 = fma(_396, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _416 = _370 >= 0.0;
    bool _418 = isnan(_370);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = _410 + (-1.0);
    float _428 = fma(_400, _360, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _432 = _320 + _430;
    float _434 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _436 = _424 ? 0 : 1;
    float _438 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _440 = log2(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _442;
    int _446 = ~_436;
    int _448 = _446 + 1;
    int _450 = _448 + 1;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _452;
    int _456 = _450;
    int _458 = as_type<int>(_280);
    float _460 = _320;
    if (!_412)
    {
        int _462 = ~_436;
        int _464 = _462 + 1;
        _456 = _464;
    }
    int _466 = _456;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _468;
    float _472 = _318 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _474 = _404 > 0.0;
    float _476 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _478 = _402 + _476;
    bool _480 = _404 >= 0.0;
    bool _482 = isnan(_404);
    bool _484 = _480 || _482;
    bool _486 = isnan(0.0);
    bool _488 = _484 || _486;
    float _490 = _432 * _432;
    float _492 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _494 = fma(_444, _382, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = _440 * _104;
    float _498 = fma(_470, _382, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _500 = fma(_454, _382, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _504 = 1.0 + _502;
    bool _506 = !_328;
    int _508 = _506 ? 0 : 1;
    float _510 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _512 = _472 + _510;
    float _514 = exp2(_496);
    float _516 = fma(_478, _478, _490);
    bool _518 = _386 > 0.0;
    bool _520 = _386 >= 0.0;
    bool _522 = isnan(_386);
    bool _524 = _520 || _522;
    bool _526 = isnan(0.0);
    bool _528 = _524 || _526;
    out.m_33.x = 1.0;
    bool _530 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _532 = isnan(1.0);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _538 = _534 || _536;
    float _540 = 1.0 / _504;
    float _542 = in.m_43.x;
    float _544 = in.m_43.y;
    float _546 = in.m_43.z;
    int _548 = _528 ? 0 : 1;
    bool _550 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _552 = isnan(0.0);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _558 = _554 || _556;
    float _560 = float(_466);
    float _562 = -_514;
    float _564 = _562 + 1.0;
    int _566 = abs(_508);
    float _568 = fma(_512, _512, _516);
    int _570 = _488 ? 0 : 1;
    float _572 = float(_566);
    float _574 = _558 ? _564 : 0.0;
    float _576 = rsqrt(_568);
    bool _578 = !_332;
    int _580 = _578 ? 0 : 1;
    float _582 = _572 * _560;
    int _584 = ~_548;
    int _586 = _584 + 1;
    int _588 = _586 + 1;
    int _590 = _588;
    float _592 = 1.0;
    if (_538)
    {
        float _594 = _574 * _540;
        _126 = _594;
    }
    float _596 = _126;
    int _598 = ~_570;
    int _600 = _598 + 1;
    int _602 = _600 + 1;
    float _604 = _300 + (-0.5);
    int _606 = _602;
    if (!_518)
    {
        int _608 = ~_548;
        int _610 = _608 + 1;
        _590 = _610;
    }
    int _612 = _590;
    float _614 = _582 * (-2.0);
    if (!_474)
    {
        int _616 = ~_570;
        int _618 = _616 + 1;
        _606 = _618;
    }
    int _620 = _606;
    int _622 = abs(_580);
    float _624 = fma(_614, _544, _544);
    float _626 = float(_620);
    float _628 = fma(_408, _614, _408);
    float _630 = float(_622);
    float _632 = _432 * _576;
    float _634 = _478 * _576;
    float _636 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[196].y, _624);
    bool _638 = !_324;
    int _640 = _638 ? 0 : 1;
    float _642 = -_632;
    float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _432);
    float _646 = -_634;
    float _648 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[18].w, _478);
    float _650 = fma(_628, _596, _636);
    bool _652 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _654 = isnan(_278);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _644 * _644;
    float _666 = _630 * _626;
    bool _668 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _670 = isnan(_278);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = _650 * 0.15915493667125701904296875;
    float _682 = fma(_648, _648, _664);
    float _684 = _512 * _576;
    bool _686 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _688 = isnan(_278);
    bool _690 = _686 || _688;
    bool _692 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _694 = _690 || _692;
    float _696 = float(_694);
    float _698 = -_678;
    float _700 = _698 + 1.0;
    float _702 = -_662;
    float _704 = _702 + 1.0;
    float _706 = -_684;
    float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _512);
    float _710 = float(_612);
    float _712 = _662 * _700;
    bool _714 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _716 = isnan(_278);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = fma(_708, _708, _682);
    int _728 = abs(_640);
    float _730 = _696 * _704;
    float _732 = _666 * (-2.0);
    float _734 = _286 + (-0.5);
    float _736 = float(_728);
    float _738 = -_696;
    float _740 = _738 + 1.0;
    float _742 = fma(_732, _546, _546);
    float _744 = fma(_492, _732, _492);
    float _746 = sqrt(_726);
    float _748 = _736 * _710;
    float _750 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[196].z, _742);
    float _752 = _724 * _740;
    bool _754 = _300 > 0.5;
    float _756 = _748 * (-2.0);
    float _758 = fma(_744, _596, _750);
    float _760 = in.m_45.x;
    float _762 = in.m_45.y;
    float _764 = in.m_45.z;
    float _766 = _414 * _752;
    float _768 = fma(_434, _756, _434);
    float _770 = fma(_756, _542, _542);
    float _772 = _758 * 0.15915493667125701904296875;
    float _774 = -_724;
    float _776 = _774 + 1.0;
    float _778 = _384 * _752;
    float _780 = in.m_39.x;
    float _782 = in.m_39.y;
    float _784 = in.m_39.z;
    float _786 = _388 * _752;
    float _788 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].x, _766);
    float _790 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].y, _778);
    float _792 = _280 + (-0.5);
    float _794 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].z, _786);
    float _796 = fma(_428, _730, _788);
    float _798 = fma(_390, _730, _790);
    float _800 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[196].x, _770);
    float _802 = fma(_392, _730, _794);
    float _804 = _680 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = fma(_498, _712, _798);
    float _810 = fma(_768, _596, _800);
    float _812 = fma(_500, _712, _802);
    float _814 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[146].y, _808);
    float _816 = _810 * 0.15915493667125701904296875;
    float _818 = fma(_494, _712, _796);
    float _820 = _680 * 6.283185482025146484375;
    float _822 = cos(_820);
    float _824 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _764);
    float _826 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _760);
    float _828 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[146].x, _818);
    float _830 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[146].z, _812);
    float _832 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _762);
    float _834 = _814 * _782;
    float _836 = _828 * _780;
    float _838 = _772 * 6.283185482025146484375;
    float _840 = sin(_838);
    float _842 = _830 * _784;
    float _844 = _576 * _746;
    float _846 = _834 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _848 = _836 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _850 = _842 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _852 = _286 > 0.5;
    float _854 = _846 * _844;
    float _856 = _772 * 6.283185482025146484375;
    float _858 = cos(_856);
    float _860 = _848 * _844;
    float _862 = _850 * _844;
    float _864 = _854 * _832;
    float _866 = in.m_47.x;
    float _868 = _860 * _826;
    float _870 = _862 * _824;
    float _872 = _816 * 6.283185482025146484375;
    float _874 = cos(_872);
    float _876 = _806 * _840;
    float _878 = _822 * _840;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _882 = _816 * 6.283185482025146484375;
    float _884 = sin(_882);
    float _886 = _822 * _858;
    float _888 = _806 * _858;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _894 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _896 = _874 * _858;
    float _898 = _874 * _840;
    float _900 = _896 * _864;
    float _902 = fma(_884, _876, _886);
    float _904 = fma(_884, _886, _876);
    float _906 = -_888;
    float _908 = fma(_884, _878, _906);
    float _910 = -_878;
    float _912 = fma(_884, _888, _910);
    float _914 = fma(_898, _868, _900);
    float _916 = _904 * _864;
    float _918 = _912 * _864;
    float _920 = _874 * _870;
    float _922 = -_884;
    float _924 = fma(_922, _870, _914);
    float _926 = fma(_908, _868, _916);
    float _928 = fma(_902, _868, _918);
    float _930 = _924 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _932 = _924 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _934 = fma(_806, _920, _928);
    float _936 = fma(_822, _920, _926);
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _940 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[10].x, _930);
    float _942 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[8].x, _932);
    float _944 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _948 = _946 != 0;
    float _950 = fma(_936, (*spvDescriptorSet0.vp_c10)._m0[10].z, _940);
    float _952 = fma(_936, (*spvDescriptorSet0.vp_c10)._m0[8].z, _942);
    float _954 = _472 + _950;
    float _956 = _402 + _952;
    float _958 = in.m_47.y;
    float _960 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _962 = _954 + _960;
    float _964 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _966 = _956 + _964;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _970 = _962 * _962;
    float _972 = _924 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _976 = fma(_966, _966, _970);
    float _978 = _968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _982 = _980 != 0;
    float _984 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _986 = sqrt(_976);
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _990 = _988 != 0;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _996 = _994 != 0;
    out.m_49.x = _944;
    out.m_49.y = _978;
    out.m_49.z = _984;
    out.m_49.w = _880;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1000 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[9].x, _972);
    float _1002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1004 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1006 = _998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1008 = -_958;
    float _1010 = _1008 + 1.0;
    out.m_51.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1012 = fma(_936, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1000);
    float _1014 = _924;
    float _1016 = _1000;
    bool _1018 = _852;
    float _1020 = _958;
    int _1022 = as_type<int>(_1004);
    if (!_948)
    {
        _1014 = _866;
    }
    float _1024 = _1014;
    bool _1026 = _986 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_53.x = _1004;
    out.m_53.y = _1006;
    out.m_53.z = _894;
    out.m_53.w = _892;
    float _1030 = _1024;
    if (!_982)
    {
        _1016 = _866;
    }
    float _1032 = _1016;
    int _1034 = _852 ? as_type<int>(_1010) : as_type<int>(_958);
    float _1036 = _1032;
    if (_948)
    {
        bool _1038 = _280 > 0.5;
        _1018 = _1038;
    }
    bool _1040 = _1018;
    if (_948)
    {
        float _1042 = -_866;
        float _1044 = _1042 + 1.0;
        _458 = as_type<int>(_1044);
    }
    int _1046 = _458;
    float _1048 = _990 ? as_type<float>(_1034) : _958;
    float _1050 = as_type<float>(_1046);
    if (_996)
    {
        float _1052 = _754 ? _1010 : _958;
        _1020 = _1052;
    }
    float _1054 = _1020;
    if (_948)
    {
        float _1056 = _1040 ? as_type<float>(_1046) : _866;
        _1030 = _1056;
    }
    float _1058 = _1030;
    if (!_1026)
    {
        _592 = _956;
    }
    float _1060 = _592;
    float _1062 = _1060;
    if (_982)
    {
        float _1064 = -_866;
        float _1066 = _1064 + 1.0;
        _1022 = as_type<int>(_1066);
    }
    int _1068 = _1022;
    float _1070 = _320 + _1012;
    if (!_1026)
    {
        _460 = _954;
    }
    float _1072 = _460;
    float _1074 = _1072;
    if (_982)
    {
        float _1076 = _754 ? as_type<float>(_1068) : _866;
        _1036 = _1076;
    }
    float _1078 = _1036;
    if (!_1026)
    {
        _1050 = _1070;
    }
    float _1080 = _1050;
    bool _1082 = !_1026;
    float _1084 = _1080;
    if (!_1082)
    {
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1090 = _986 + _1088;
        float _1092 = _1070 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1094 = rsqrt(_976);
        float _1096 = _1090 * _1086;
        float _1098 = _1096 * 0.15915493667125701904296875;
        float _1100 = _1098 * 6.283185482025146484375;
        float _1102 = cos(_1100);
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = sin(_1104);
        float _1108 = _1102 + (-1.0);
        float _1110 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1112 = fma(_1106, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1114 = fma(_1070, _1102, _1110);
        float _1116 = _1094 * _1112;
        float _1118 = fma(_966, _1116, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1120 = fma(_962, _1116, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1084 = _1114;
        _1062 = _1118;
        _1074 = _1120;
    }
    float _1122 = _1084;
    float _1124 = _1062;
    float _1126 = _1074;
    float _1128 = -_632;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1122);
    float _1132 = -_634;
    float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1124);
    float _1136 = -_684;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1126);
    float _1140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1142 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1144 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1146 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1148 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1150 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1142);
    float _1152 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1144);
    float _1154 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1146);
    float _1156 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1148);
    float _1158 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1150);
    float _1160 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1152);
    float _1162 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1154);
    float _1164 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1156);
    float _1166 = _1158 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1168 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1172 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1176 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1178 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1180 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1182 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1174);
    float _1184 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1176);
    float _1186 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1178);
    float _1188 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1180);
    float _1190 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1182);
    float _1192 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1184);
    float _1194 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1196 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1198 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1186);
    float _1200 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1188);
    float _1202 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1190);
    float _1206 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1192);
    float _1208 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1210 = _1196 * _1028;
    float _1212 = _1202 * _1140;
    float _1214 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1216 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1198);
    float _1218 = _1204 + _1206;
    float _1220 = _1206 * 0.5;
    float _1222 = _1208 * _1170;
    float _1224 = _1214 * _1002;
    float _1226 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1200);
    float _1228 = _1218 * 0.5;
    float _1230 = fma(_1216, -0.5, _1220);
    out.m_55.x = _1212;
    out.m_55.y = _1222;
    out.m_57.x = _1224;
    out.m_57.y = _1210;
    out.gl_Position.x = _1204;
    out.gl_Position.y = _1216;
    out.gl_Position.z = _1226;
    out.gl_Position.w = _1206;
    out.m_59.w = _1206;
    out.m_59.x = _1228;
    out.m_59.y = _1230;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _276 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _84;
    if (!_82)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_82)
    {
        float _90 = _86 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1286 = as_type<float>(_92);
        out.gl_Position.z = _1286;
    }
    if (!_82)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _96 = in.m_35.w;
    float _98 = float(_78);
    float _100 = 1.0 / _98;
    float _102 = -_96;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _106 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_96);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = _104 * _100;
    bool _118 = _104 >= _98;
    bool _120 = !_114;
    bool _122 = _118 || _120;
    out.m_37.x = _116;
    float _124 = _96;
    float _126 = _104;
    if (_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _124;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _130 = _128 * 5.0;
        _94 = as_type<int>(_130);
    }
    int _132 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1358 = as_type<float>(_132);
        out.gl_Position.z = _1358;
    }
    if (_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_39.w;
    float _136 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        float _258 = in.m_41.x;
        float _260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _262 = _258 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[12].x, _104);
        float _266 = _264 * _260;
        float _268 = floor(_266);
        float _270 = -_268;
        float _272 = _266 + _270;
        _274 = _272;
        _276 = true;
    }
    else
    {
        _274 = _116;
    }
    _276 = false;
    float _278 = _274;
    float _280 = in.m_41.x;
    float _282 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _284 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _286 = in.m_41.z;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _296;
    float _300 = in.m_41.y;
    float _302 = 1.0 / _290;
    float _304 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _306 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _282);
    float _308 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _284);
    float _310 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _304);
    float _312 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _306);
    float _314 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _308);
    float _316 = 1.0 / _294;
    float _318 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _310);
    float _320 = _314 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _324 = _322 != 0;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _332 = _330 != 0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = _278 + _334;
    float _338 = _280 * 2.0;
    float _340 = 1.0 / _298;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _278 + _342;
    float _346 = _336 * _302;
    float _348 = _286 * 2.0;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _358 = _300 + _286;
    float _360 = _344 * _316;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _364 = _278 + _362;
    float _366 = _280 + _286;
    float _368 = _358 + (-1.0);
    float _370 = floor(_338);
    float _372 = _300 * 2.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _382 = _364 * _340;
    float _384 = fma(_352, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _386 = floor(_348);
    float _388 = fma(_376, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _390 = fma(_356, _360, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _392 = fma(_380, _360, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = _312 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _404 = floor(_372);
    float _406 = _366 + (-1.0);
    float _408 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _410 = _280 + _300;
    bool _412 = _370 > 0.0;
    float _414 = fma(_396, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _416 = _370 >= 0.0;
    bool _418 = isnan(_370);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = _410 + (-1.0);
    float _428 = fma(_400, _360, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _432 = _320 + _430;
    float _434 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _436 = _424 ? 0 : 1;
    float _438 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _440 = log2(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _442;
    int _446 = ~_436;
    int _448 = _446 + 1;
    int _450 = _448 + 1;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _452;
    int _456 = _450;
    int _458 = as_type<int>(_280);
    float _460 = _320;
    if (!_412)
    {
        int _462 = ~_436;
        int _464 = _462 + 1;
        _456 = _464;
    }
    int _466 = _456;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _468;
    float _472 = _318 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _474 = _404 > 0.0;
    float _476 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _478 = _402 + _476;
    bool _480 = _404 >= 0.0;
    bool _482 = isnan(_404);
    bool _484 = _480 || _482;
    bool _486 = isnan(0.0);
    bool _488 = _484 || _486;
    float _490 = _432 * _432;
    float _492 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _494 = fma(_444, _382, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = _440 * _104;
    float _498 = fma(_470, _382, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _500 = fma(_454, _382, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _504 = 1.0 + _502;
    bool _506 = !_328;
    int _508 = _506 ? 0 : 1;
    float _510 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _512 = _472 + _510;
    float _514 = exp2(_496);
    float _516 = fma(_478, _478, _490);
    bool _518 = _386 > 0.0;
    bool _520 = _386 >= 0.0;
    bool _522 = isnan(_386);
    bool _524 = _520 || _522;
    bool _526 = isnan(0.0);
    bool _528 = _524 || _526;
    out.m_33.x = 1.0;
    bool _530 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _532 = isnan(1.0);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _538 = _534 || _536;
    float _540 = 1.0 / _504;
    float _542 = in.m_43.x;
    float _544 = in.m_43.y;
    float _546 = in.m_43.z;
    int _548 = _528 ? 0 : 1;
    bool _550 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _552 = isnan(0.0);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _558 = _554 || _556;
    float _560 = float(_466);
    float _562 = -_514;
    float _564 = _562 + 1.0;
    int _566 = abs(_508);
    float _568 = fma(_512, _512, _516);
    int _570 = _488 ? 0 : 1;
    float _572 = float(_566);
    float _574 = _558 ? _564 : 0.0;
    float _576 = rsqrt(_568);
    bool _578 = !_332;
    int _580 = _578 ? 0 : 1;
    float _582 = _572 * _560;
    int _584 = ~_548;
    int _586 = _584 + 1;
    int _588 = _586 + 1;
    int _590 = _588;
    float _592 = 1.0;
    if (_538)
    {
        float _594 = _574 * _540;
        _126 = _594;
    }
    float _596 = _126;
    int _598 = ~_570;
    int _600 = _598 + 1;
    int _602 = _600 + 1;
    float _604 = _300 + (-0.5);
    int _606 = _602;
    if (!_518)
    {
        int _608 = ~_548;
        int _610 = _608 + 1;
        _590 = _610;
    }
    int _612 = _590;
    float _614 = _582 * (-2.0);
    if (!_474)
    {
        int _616 = ~_570;
        int _618 = _616 + 1;
        _606 = _618;
    }
    int _620 = _606;
    int _622 = abs(_580);
    float _624 = fma(_614, _544, _544);
    float _626 = float(_620);
    float _628 = fma(_408, _614, _408);
    float _630 = float(_622);
    float _632 = _432 * _576;
    float _634 = _478 * _576;
    float _636 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[196].y, _624);
    bool _638 = !_324;
    int _640 = _638 ? 0 : 1;
    float _642 = -_632;
    float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _432);
    float _646 = -_634;
    float _648 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[18].w, _478);
    float _650 = fma(_628, _596, _636);
    bool _652 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _654 = isnan(_278);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _644 * _644;
    float _666 = _630 * _626;
    bool _668 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _670 = isnan(_278);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = _650 * 0.15915493667125701904296875;
    float _682 = fma(_648, _648, _664);
    float _684 = _512 * _576;
    bool _686 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _688 = isnan(_278);
    bool _690 = _686 || _688;
    bool _692 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _694 = _690 || _692;
    float _696 = float(_694);
    float _698 = -_678;
    float _700 = _698 + 1.0;
    float _702 = -_662;
    float _704 = _702 + 1.0;
    float _706 = -_684;
    float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _512);
    float _710 = float(_612);
    float _712 = _662 * _700;
    bool _714 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _716 = isnan(_278);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = fma(_708, _708, _682);
    int _728 = abs(_640);
    float _730 = _696 * _704;
    float _732 = _666 * (-2.0);
    float _734 = _286 + (-0.5);
    float _736 = float(_728);
    float _738 = -_696;
    float _740 = _738 + 1.0;
    float _742 = fma(_732, _546, _546);
    float _744 = fma(_492, _732, _492);
    float _746 = sqrt(_726);
    float _748 = _736 * _710;
    float _750 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[196].z, _742);
    float _752 = _724 * _740;
    bool _754 = _300 > 0.5;
    float _756 = _748 * (-2.0);
    float _758 = fma(_744, _596, _750);
    float _760 = in.m_45.x;
    float _762 = in.m_45.y;
    float _764 = in.m_45.z;
    float _766 = _414 * _752;
    float _768 = fma(_434, _756, _434);
    float _770 = fma(_756, _542, _542);
    float _772 = _758 * 0.15915493667125701904296875;
    float _774 = -_724;
    float _776 = _774 + 1.0;
    float _778 = _384 * _752;
    float _780 = in.m_39.x;
    float _782 = in.m_39.y;
    float _784 = in.m_39.z;
    float _786 = _388 * _752;
    float _788 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].x, _766);
    float _790 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].y, _778);
    float _792 = _280 + (-0.5);
    float _794 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[143].z, _786);
    float _796 = fma(_428, _730, _788);
    float _798 = fma(_390, _730, _790);
    float _800 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[196].x, _770);
    float _802 = fma(_392, _730, _794);
    float _804 = _680 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = fma(_498, _712, _798);
    float _810 = fma(_768, _596, _800);
    float _812 = fma(_500, _712, _802);
    float _814 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[146].y, _808);
    float _816 = _810 * 0.15915493667125701904296875;
    float _818 = fma(_494, _712, _796);
    float _820 = _680 * 6.283185482025146484375;
    float _822 = cos(_820);
    float _824 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _764);
    float _826 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _760);
    float _828 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[146].x, _818);
    float _830 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[146].z, _812);
    float _832 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _762);
    float _834 = _814 * _782;
    float _836 = _828 * _780;
    float _838 = _772 * 6.283185482025146484375;
    float _840 = sin(_838);
    float _842 = _830 * _784;
    float _844 = _576 * _746;
    float _846 = _834 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _848 = _836 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _850 = _842 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _852 = _286 > 0.5;
    float _854 = _846 * _844;
    float _856 = _772 * 6.283185482025146484375;
    float _858 = cos(_856);
    float _860 = _848 * _844;
    float _862 = _850 * _844;
    float _864 = _854 * _832;
    float _866 = in.m_47.x;
    float _868 = _860 * _826;
    float _870 = _862 * _824;
    float _872 = _816 * 6.283185482025146484375;
    float _874 = cos(_872);
    float _876 = _806 * _840;
    float _878 = _822 * _840;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _882 = _816 * 6.283185482025146484375;
    float _884 = sin(_882);
    float _886 = _822 * _858;
    float _888 = _806 * _858;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _894 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _896 = _874 * _858;
    float _898 = _874 * _840;
    float _900 = _896 * _864;
    float _902 = fma(_884, _876, _886);
    float _904 = fma(_884, _886, _876);
    float _906 = -_888;
    float _908 = fma(_884, _878, _906);
    float _910 = -_878;
    float _912 = fma(_884, _888, _910);
    float _914 = fma(_898, _868, _900);
    float _916 = _904 * _864;
    float _918 = _912 * _864;
    float _920 = _874 * _870;
    float _922 = -_884;
    float _924 = fma(_922, _870, _914);
    float _926 = fma(_908, _868, _916);
    float _928 = fma(_902, _868, _918);
    float _930 = _924 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _932 = _924 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _934 = fma(_806, _920, _928);
    float _936 = fma(_822, _920, _926);
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _940 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[10].x, _930);
    float _942 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[8].x, _932);
    float _944 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _948 = _946 != 0;
    float _950 = fma(_936, (*spvDescriptorSet0.vp_c10)._m0[10].z, _940);
    float _952 = fma(_936, (*spvDescriptorSet0.vp_c10)._m0[8].z, _942);
    float _954 = _472 + _950;
    float _956 = _402 + _952;
    float _958 = in.m_47.y;
    float _960 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _962 = _954 + _960;
    float _964 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _966 = _956 + _964;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _970 = _962 * _962;
    float _972 = _924 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _976 = fma(_966, _966, _970);
    float _978 = _968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _982 = _980 != 0;
    float _984 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _986 = sqrt(_976);
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _990 = _988 != 0;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _996 = _994 != 0;
    out.m_49.x = _944;
    out.m_49.y = _978;
    out.m_49.z = _984;
    out.m_49.w = _880;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1000 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[9].x, _972);
    float _1002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1004 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1006 = _998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1008 = -_958;
    float _1010 = _1008 + 1.0;
    out.m_51.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1012 = fma(_936, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1000);
    float _1014 = _924;
    float _1016 = _1000;
    bool _1018 = _852;
    float _1020 = _958;
    int _1022 = as_type<int>(_1004);
    if (!_948)
    {
        _1014 = _866;
    }
    float _1024 = _1014;
    bool _1026 = _986 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_53.x = _1004;
    out.m_53.y = _1006;
    out.m_53.z = _894;
    out.m_53.w = _892;
    float _1030 = _1024;
    if (!_982)
    {
        _1016 = _866;
    }
    float _1032 = _1016;
    int _1034 = _852 ? as_type<int>(_1010) : as_type<int>(_958);
    float _1036 = _1032;
    if (_948)
    {
        bool _1038 = _280 > 0.5;
        _1018 = _1038;
    }
    bool _1040 = _1018;
    if (_948)
    {
        float _1042 = -_866;
        float _1044 = _1042 + 1.0;
        _458 = as_type<int>(_1044);
    }
    int _1046 = _458;
    float _1048 = _990 ? as_type<float>(_1034) : _958;
    float _1050 = as_type<float>(_1046);
    if (_996)
    {
        float _1052 = _754 ? _1010 : _958;
        _1020 = _1052;
    }
    float _1054 = _1020;
    if (_948)
    {
        float _1056 = _1040 ? as_type<float>(_1046) : _866;
        _1030 = _1056;
    }
    float _1058 = _1030;
    if (!_1026)
    {
        _592 = _956;
    }
    float _1060 = _592;
    float _1062 = _1060;
    if (_982)
    {
        float _1064 = -_866;
        float _1066 = _1064 + 1.0;
        _1022 = as_type<int>(_1066);
    }
    int _1068 = _1022;
    float _1070 = _320 + _1012;
    if (!_1026)
    {
        _460 = _954;
    }
    float _1072 = _460;
    float _1074 = _1072;
    if (_982)
    {
        float _1076 = _754 ? as_type<float>(_1068) : _866;
        _1036 = _1076;
    }
    float _1078 = _1036;
    if (!_1026)
    {
        _1050 = _1070;
    }
    float _1080 = _1050;
    bool _1082 = !_1026;
    float _1084 = _1080;
    if (!_1082)
    {
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1090 = _986 + _1088;
        float _1092 = _1070 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1094 = rsqrt(_976);
        float _1096 = _1090 * _1086;
        float _1098 = _1096 * 0.15915493667125701904296875;
        float _1100 = _1098 * 6.283185482025146484375;
        float _1102 = cos(_1100);
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = sin(_1104);
        float _1108 = _1102 + (-1.0);
        float _1110 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1112 = fma(_1106, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1114 = fma(_1070, _1102, _1110);
        float _1116 = _1094 * _1112;
        float _1118 = fma(_966, _1116, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1120 = fma(_962, _1116, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1084 = _1114;
        _1062 = _1118;
        _1074 = _1120;
    }
    float _1122 = _1084;
    float _1124 = _1062;
    float _1126 = _1074;
    float _1128 = -_632;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1122);
    float _1132 = -_634;
    float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1124);
    float _1136 = -_684;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1126);
    float _1140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1142 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1144 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1146 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1148 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1150 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1142);
    float _1152 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1144);
    float _1154 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1146);
    float _1156 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1148);
    float _1158 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1150);
    float _1160 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1152);
    float _1162 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1154);
    float _1164 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1156);
    float _1166 = _1158 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1168 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1172 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1176 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1178 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1180 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1182 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1174);
    float _1184 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1176);
    float _1186 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1178);
    float _1188 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1180);
    float _1190 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1182);
    float _1192 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1184);
    float _1194 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1196 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1198 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1186);
    float _1200 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1188);
    float _1202 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1190);
    float _1206 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1192);
    float _1208 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1210 = _1196 * _1028;
    float _1212 = _1202 * _1140;
    float _1214 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1216 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1198);
    float _1218 = _1204 + _1206;
    float _1220 = _1206 * 0.5;
    float _1222 = _1208 * _1170;
    float _1224 = _1214 * _1002;
    float _1226 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1200);
    float _1228 = _1218 * 0.5;
    float _1230 = fma(_1216, -0.5, _1220);
    out.m_55.x = _1212;
    out.m_55.y = _1222;
    out.m_57.x = _1224;
    out.m_57.y = _1210;
    out.gl_Position.x = _1204;
    out.gl_Position.y = _1216;
    out.gl_Position.z = _1226;
    out.gl_Position.w = _1206;
    out.m_59.w = _1206;
    out.m_59.x = _1228;
    out.m_59.y = _1230;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

