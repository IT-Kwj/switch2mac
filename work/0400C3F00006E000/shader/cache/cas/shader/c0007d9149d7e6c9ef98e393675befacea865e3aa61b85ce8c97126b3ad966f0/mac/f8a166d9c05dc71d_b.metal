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
    float4 m_49 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _280 = in.m_41.z;
    float _282 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _284 = in.m_41.y;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _294;
    float _298 = in.m_41.x;
    float _300 = 1.0 / _288;
    float _302 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _304 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _306 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _282);
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _310 = _308 != 0;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _314 = _312 != 0;
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _318 = _316 != 0;
    float _320 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _302);
    float _322 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _304);
    float _324 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _306);
    float _326 = 1.0 / _292;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = _278 + _328;
    float _332 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _320);
    float _334 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _322);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _338 = _278 + _336;
    float _340 = _332 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _342 = _280 * 2.0;
    float _344 = _330 * _300;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _278 + _346;
    float _350 = 1.0 / _296;
    float _352 = _284 + _280;
    float _354 = _284 * 2.0;
    float _356 = _324 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _358 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _360 = _340 + _358;
    float _362 = _348 * _326;
    float _364 = _352 + (-1.0);
    float _366 = _298 + _284;
    float _368 = _298 + _280;
    float _370 = floor(_342);
    float _372 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _374 = _366 + (-1.0);
    float _376 = _368 + (-1.0);
    float _378 = _298 * 2.0;
    float _380 = _338 * _350;
    float _382 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _384 = !_310;
    int _386 = _384 ? 0 : 1;
    float _388 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _390 = floor(_354);
    float _392 = _334 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _394 = abs(_386);
    float _396 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _398 = _356 + _396;
    float _400 = _360 * _360;
    bool _402 = !_314;
    int _404 = _402 ? 0 : 1;
    float _406 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _408 = _392 + _406;
    bool _410 = _370 > 0.0;
    float _412 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _414 = log2(_412);
    bool _416 = _370 >= 0.0;
    bool _418 = isnan(_370);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = fma(_398, _398, _400);
    float _428 = float(_394);
    int _430 = _424 ? 0 : 1;
    float _432 = floor(_378);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _434;
    int _438 = abs(_404);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _444 = _390 > 0.0;
    float _446 = _414 * _104;
    bool _448 = _390 >= 0.0;
    bool _450 = isnan(_390);
    bool _452 = _448 || _450;
    bool _454 = isnan(0.0);
    bool _456 = _452 || _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _474 = exp2(_446);
    float _476 = fma(_436, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _478 = _432 > 0.0;
    float _480 = fma(_460, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _482 = _432 >= 0.0;
    bool _484 = isnan(_432);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    float _492 = fma(_464, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _494 = ~_430;
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    float _500 = fma(_442, _362, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _502 = _498;
    int _504 = as_type<int>(_298);
    float _506 = _340;
    if (!_410)
    {
        int _508 = ~_430;
        int _510 = _508 + 1;
        _502 = _510;
    }
    int _512 = _502;
    float _514 = fma(_468, _362, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _516 = _490 ? 0 : 1;
    float _518 = fma(_472, _362, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _520 = float(_512);
    int _522 = ~_516;
    int _524 = _522 + 1;
    int _526 = _524 + 1;
    int _528 = _526;
    if (!_478)
    {
        int _530 = ~_516;
        int _532 = _530 + 1;
        _528 = _532;
    }
    int _534 = _528;
    float _536 = _428 * _520;
    float _538 = in.m_43.x;
    float _540 = in.m_43.y;
    float _542 = in.m_43.z;
    float _544 = -_474;
    float _546 = _544 + 1.0;
    float _548 = fma(_408, _408, _426);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _552 = 1.0 + _550;
    float _554 = _536 * (-2.0);
    float _556 = rsqrt(_548);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _558;
    bool _562 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _564 = isnan(1.0);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _570 = _566 || _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _576;
    float _580 = float(_438);
    float _582 = fma(_560, _380, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _584 = 1.0 / _552;
    float _586 = float(_534);
    float _588 = fma(_574, _380, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _590 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _598 = _594 || _596;
    float _600 = fma(_578, _380, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _602 = _298 + (-0.5);
    float _604 = _580 * _586;
    float _606 = _598 ? _546 : 0.0;
    float _608 = fma(_554, _538, _538);
    int _610 = _456 ? 0 : 1;
    float _612 = _604 * (-2.0);
    float _614 = fma(_382, _554, _382);
    float _616 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[196].x, _608);
    float _618 = _360 * _556;
    float _620 = fma(_372, _612, _372);
    float _622 = _408 * _556;
    float _624 = 1.0;
    if (_570)
    {
        float _626 = _606 * _584;
        _126 = _626;
    }
    float _628 = _126;
    int _630 = ~_610;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    float _636 = -_618;
    float _638 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[18].w, _360);
    int _640 = _634;
    if (!_444)
    {
        int _642 = ~_610;
        int _644 = _642 + 1;
        _640 = _644;
    }
    int _646 = _640;
    float _648 = fma(_612, _540, _540);
    float _650 = _398 * _556;
    float _652 = fma(_614, _628, _616);
    bool _654 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _656 = isnan(_278);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = _638 * _638;
    float _668 = -_650;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _398);
    bool _672 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _674 = isnan(_278);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -_622;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _408);
    float _688 = -_664;
    float _690 = _688 + 1.0;
    float _692 = fma(_670, _670, _666);
    bool _694 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _696 = isnan(_278);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = _652 * 0.15915493667125701904296875;
    float _708 = _682 * _690;
    float _710 = -_682;
    float _712 = _710 + 1.0;
    float _714 = fma(_686, _686, _692);
    bool _716 = !_318;
    int _718 = _716 ? 0 : 1;
    out.m_33.x = 1.0;
    bool _720 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _722 = isnan(_278);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = _704 * _712;
    float _734 = -_704;
    float _736 = _734 + 1.0;
    int _738 = abs(_718);
    float _740 = sqrt(_714);
    bool _742 = _284 > 0.5;
    float _744 = _284 + (-0.5);
    float _746 = _730 * _736;
    float _748 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[196].y, _648);
    float _750 = float(_646);
    float _752 = _476 * _746;
    float _754 = float(_738);
    float _756 = _480 * _746;
    float _758 = _492 * _746;
    float _760 = -_730;
    float _762 = _760 + 1.0;
    float _764 = fma(_620, _628, _748);
    float _766 = _754 * _750;
    float _768 = _706 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = in.m_39.x;
    float _774 = in.m_39.y;
    float _776 = in.m_39.z;
    float _778 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].y, _756);
    float _780 = _766 * (-2.0);
    float _782 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].x, _752);
    float _784 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].z, _758);
    float _786 = _764 * 0.15915493667125701904296875;
    float _788 = fma(_780, _542, _542);
    float _790 = in.m_45.x;
    float _792 = in.m_45.y;
    float _794 = in.m_45.z;
    float _796 = _280 + (-0.5);
    float _798 = fma(_388, _780, _388);
    float _800 = fma(_514, _732, _778);
    float _802 = fma(_500, _732, _782);
    float _804 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[196].z, _788);
    float _806 = fma(_518, _732, _784);
    float _808 = fma(_588, _708, _800);
    float _810 = fma(_582, _708, _802);
    float _812 = fma(_798, _628, _804);
    float _814 = fma(_600, _708, _806);
    float _816 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[146].y, _808);
    float _818 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[146].x, _810);
    float _820 = _812 * 0.15915493667125701904296875;
    float _822 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[146].z, _814);
    float _824 = _706 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = _816 * _774;
    float _830 = _822 * _776;
    float _832 = _818 * _772;
    float _834 = _556 * _740;
    float _836 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _838 = _830 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _840 = _786 * 6.283185482025146484375;
    float _842 = sin(_840);
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _792);
    float _846 = _836 * _834;
    float _848 = _832 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _850 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _790);
    float _852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _794);
    float _854 = _846 * _844;
    float _856 = _848 * _834;
    float _858 = _786 * 6.283185482025146484375;
    float _860 = cos(_858);
    float _862 = _838 * _834;
    bool _864 = _280 > 0.5;
    float _866 = _856 * _850;
    float _868 = in.m_47.x;
    float _870 = _862 * _852;
    float _872 = _820 * 6.283185482025146484375;
    float _874 = cos(_872);
    float _876 = _770 * _842;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _880 = _820 * 6.283185482025146484375;
    float _882 = sin(_880);
    float _884 = _826 * _860;
    float _886 = _770 * _860;
    float _888 = _878 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _890 = _874 * _854;
    float _892 = _860 * _874;
    float _894 = _826 * _842;
    float _896 = _842 * _874;
    float _898 = _826 * _890;
    float _900 = fma(_882, _884, _876);
    float _902 = -_894;
    float _904 = fma(_882, _886, _902);
    float _906 = -_886;
    float _908 = fma(_882, _894, _906);
    float _910 = _882 * _854;
    float _912 = fma(_900, _866, _898);
    float _914 = _770 * _890;
    float _916 = fma(_882, _876, _884);
    float _918 = -_910;
    float _920 = fma(_892, _866, _918);
    float _922 = fma(_908, _870, _912);
    float _924 = fma(_904, _866, _914);
    float _926 = fma(_896, _870, _920);
    float _928 = _922 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _930 = _922 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _932 = fma(_916, _870, _924);
    float _934 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[10].x, _928);
    float _936 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[8].x, _930);
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _940 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[10].z, _934);
    float _942 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[8].z, _936);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _946 = _392 + _940;
    float _948 = _356 + _942;
    float _950 = in.m_47.y;
    float _952 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _954 = _946 + _952;
    float _956 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _958 = _948 + _956;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _962 = _954 * _954;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _968 = _966 != 0;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _972 = fma(_958, _958, _962);
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _976 = _974 != 0;
    float _978 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = sqrt(_972);
    float _984 = _964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _986 = _922 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _992 = _990 != 0;
    out.m_49.x = _978;
    out.m_49.y = _980;
    out.m_49.z = _984;
    out.m_49.w = _970;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _996 = _994 != 0;
    float _998 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[9].x, _986);
    float _1000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1002 = -_950;
    float _1004 = _1002 + 1.0;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1008 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1010 = _988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[9].z, _998);
    bool _1014 = _982 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    out.m_51.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1016 = _922;
    int _1018 = as_type<int>(_970);
    float _1020 = _978;
    bool _1022 = _864;
    float _1024 = _950;
    float _1026 = _1008;
    if (!_968)
    {
        _1016 = _868;
    }
    float _1028 = _1016;
    float _1030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_53.x = _1008;
    out.m_53.y = _1010;
    out.m_53.z = _888;
    out.m_53.w = _1006;
    float _1032 = _1028;
    if (_968)
    {
        float _1034 = -_868;
        float _1036 = _1034 + 1.0;
        _1018 = as_type<int>(_1036);
    }
    int _1038 = _1018;
    if (!_976)
    {
        _1020 = _868;
    }
    float _1040 = _1020;
    int _1042 = _864 ? as_type<int>(_1004) : as_type<int>(_950);
    float _1044 = _1040;
    if (_968)
    {
        bool _1046 = _298 > 0.5;
        _1022 = _1046;
    }
    bool _1048 = _1022;
    if (_976)
    {
        float _1050 = -_868;
        float _1052 = _1050 + 1.0;
        _504 = as_type<int>(_1052);
    }
    int _1054 = _504;
    float _1056 = _992 ? as_type<float>(_1042) : _950;
    if (_996)
    {
        float _1058 = _742 ? _1004 : _950;
        _1024 = _1058;
    }
    float _1060 = _1024;
    if (_968)
    {
        float _1062 = _1048 ? as_type<float>(_1038) : _868;
        _1032 = _1062;
    }
    float _1064 = _1032;
    float _1066 = _340 + _1012;
    if (_976)
    {
        float _1068 = _742 ? as_type<float>(_1054) : _868;
        _1044 = _1068;
    }
    float _1070 = _1044;
    if (!_1014)
    {
        _1026 = _948;
    }
    float _1072 = _1026;
    float _1074 = _1072;
    if (!_1014)
    {
        _624 = _946;
    }
    float _1076 = _624;
    float _1078 = _1076;
    if (!_1014)
    {
        _506 = _1066;
    }
    float _1080 = _506;
    bool _1082 = !_1014;
    float _1084 = _1080;
    if (!_1082)
    {
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1090 = _982 + _1088;
        float _1092 = _1066 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1094 = rsqrt(_972);
        float _1096 = _1090 * _1086;
        float _1098 = _1096 * 0.15915493667125701904296875;
        float _1100 = _1098 * 6.283185482025146484375;
        float _1102 = cos(_1100);
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = sin(_1104);
        float _1108 = _1102 + (-1.0);
        float _1110 = fma(_1106, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1112 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1114 = _1094 * _1110;
        float _1116 = fma(_1066, _1102, _1112);
        float _1118 = fma(_958, _1114, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1120 = fma(_954, _1114, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1084 = _1116;
        _1074 = _1118;
        _1078 = _1120;
    }
    float _1122 = _1084;
    float _1124 = _1074;
    float _1126 = _1078;
    float _1128 = -_618;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1122);
    float _1132 = -_650;
    float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1124);
    float _1136 = -_622;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1126);
    float _1140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1142 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1144 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1146 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1148 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1150 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1142);
    float _1152 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1144);
    float _1154 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1146);
    float _1156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1158 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1150);
    float _1160 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1152);
    float _1162 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1148);
    float _1164 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1154);
    float _1166 = _1158 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1168 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1170 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1162);
    float _1172 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1176 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1178 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1180 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1182 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1174);
    float _1184 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1176);
    float _1186 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1178);
    float _1188 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1190 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1182);
    float _1192 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1184);
    float _1194 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1196 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1180);
    float _1198 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1200 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1186);
    float _1202 = _1188 * _1140;
    float _1204 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1206 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1190);
    float _1208 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1192);
    float _1210 = _1198 * _1030;
    float _1212 = _1204 * _1156;
    float _1214 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1196);
    float _1216 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1218 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1200);
    float _1220 = _1206 + _1208;
    float _1222 = _1208 * 0.5;
    float _1224 = _1216 * _1000;
    float _1226 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1214);
    float _1228 = _1220 * 0.5;
    float _1230 = fma(_1218, -0.5, _1222);
    out.m_55.x = _1212;
    out.m_55.y = _1202;
    out.m_57.x = _1224;
    out.m_57.y = _1210;
    out.gl_Position.x = _1206;
    out.gl_Position.y = _1218;
    out.gl_Position.z = _1226;
    out.gl_Position.w = _1208;
    out.m_59.w = _1208;
    out.m_59.x = _1228;
    out.m_59.y = _1230;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _280 = in.m_41.z;
    float _282 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _284 = in.m_41.y;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _294;
    float _298 = in.m_41.x;
    float _300 = 1.0 / _288;
    float _302 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _304 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _306 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _282);
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _310 = _308 != 0;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _314 = _312 != 0;
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _318 = _316 != 0;
    float _320 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _302);
    float _322 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _304);
    float _324 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _306);
    float _326 = 1.0 / _292;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = _278 + _328;
    float _332 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _320);
    float _334 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _322);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _338 = _278 + _336;
    float _340 = _332 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _342 = _280 * 2.0;
    float _344 = _330 * _300;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _278 + _346;
    float _350 = 1.0 / _296;
    float _352 = _284 + _280;
    float _354 = _284 * 2.0;
    float _356 = _324 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _358 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _360 = _340 + _358;
    float _362 = _348 * _326;
    float _364 = _352 + (-1.0);
    float _366 = _298 + _284;
    float _368 = _298 + _280;
    float _370 = floor(_342);
    float _372 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _374 = _366 + (-1.0);
    float _376 = _368 + (-1.0);
    float _378 = _298 * 2.0;
    float _380 = _338 * _350;
    float _382 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _384 = !_310;
    int _386 = _384 ? 0 : 1;
    float _388 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _390 = floor(_354);
    float _392 = _334 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _394 = abs(_386);
    float _396 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _398 = _356 + _396;
    float _400 = _360 * _360;
    bool _402 = !_314;
    int _404 = _402 ? 0 : 1;
    float _406 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _408 = _392 + _406;
    bool _410 = _370 > 0.0;
    float _412 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _414 = log2(_412);
    bool _416 = _370 >= 0.0;
    bool _418 = isnan(_370);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = fma(_398, _398, _400);
    float _428 = float(_394);
    int _430 = _424 ? 0 : 1;
    float _432 = floor(_378);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _434;
    int _438 = abs(_404);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _444 = _390 > 0.0;
    float _446 = _414 * _104;
    bool _448 = _390 >= 0.0;
    bool _450 = isnan(_390);
    bool _452 = _448 || _450;
    bool _454 = isnan(0.0);
    bool _456 = _452 || _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _474 = exp2(_446);
    float _476 = fma(_436, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _478 = _432 > 0.0;
    float _480 = fma(_460, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _482 = _432 >= 0.0;
    bool _484 = isnan(_432);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    float _492 = fma(_464, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _494 = ~_430;
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    float _500 = fma(_442, _362, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _502 = _498;
    int _504 = as_type<int>(_298);
    float _506 = _340;
    if (!_410)
    {
        int _508 = ~_430;
        int _510 = _508 + 1;
        _502 = _510;
    }
    int _512 = _502;
    float _514 = fma(_468, _362, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _516 = _490 ? 0 : 1;
    float _518 = fma(_472, _362, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _520 = float(_512);
    int _522 = ~_516;
    int _524 = _522 + 1;
    int _526 = _524 + 1;
    int _528 = _526;
    if (!_478)
    {
        int _530 = ~_516;
        int _532 = _530 + 1;
        _528 = _532;
    }
    int _534 = _528;
    float _536 = _428 * _520;
    float _538 = in.m_43.x;
    float _540 = in.m_43.y;
    float _542 = in.m_43.z;
    float _544 = -_474;
    float _546 = _544 + 1.0;
    float _548 = fma(_408, _408, _426);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _552 = 1.0 + _550;
    float _554 = _536 * (-2.0);
    float _556 = rsqrt(_548);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _558;
    bool _562 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _564 = isnan(1.0);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _570 = _566 || _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _576;
    float _580 = float(_438);
    float _582 = fma(_560, _380, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _584 = 1.0 / _552;
    float _586 = float(_534);
    float _588 = fma(_574, _380, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _590 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _598 = _594 || _596;
    float _600 = fma(_578, _380, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _602 = _298 + (-0.5);
    float _604 = _580 * _586;
    float _606 = _598 ? _546 : 0.0;
    float _608 = fma(_554, _538, _538);
    int _610 = _456 ? 0 : 1;
    float _612 = _604 * (-2.0);
    float _614 = fma(_382, _554, _382);
    float _616 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[196].x, _608);
    float _618 = _360 * _556;
    float _620 = fma(_372, _612, _372);
    float _622 = _408 * _556;
    float _624 = 1.0;
    if (_570)
    {
        float _626 = _606 * _584;
        _126 = _626;
    }
    float _628 = _126;
    int _630 = ~_610;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    float _636 = -_618;
    float _638 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[18].w, _360);
    int _640 = _634;
    if (!_444)
    {
        int _642 = ~_610;
        int _644 = _642 + 1;
        _640 = _644;
    }
    int _646 = _640;
    float _648 = fma(_612, _540, _540);
    float _650 = _398 * _556;
    float _652 = fma(_614, _628, _616);
    bool _654 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _656 = isnan(_278);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = _638 * _638;
    float _668 = -_650;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _398);
    bool _672 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _674 = isnan(_278);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -_622;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _408);
    float _688 = -_664;
    float _690 = _688 + 1.0;
    float _692 = fma(_670, _670, _666);
    bool _694 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _696 = isnan(_278);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = _652 * 0.15915493667125701904296875;
    float _708 = _682 * _690;
    float _710 = -_682;
    float _712 = _710 + 1.0;
    float _714 = fma(_686, _686, _692);
    bool _716 = !_318;
    int _718 = _716 ? 0 : 1;
    out.m_33.x = 1.0;
    bool _720 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _722 = isnan(_278);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = _704 * _712;
    float _734 = -_704;
    float _736 = _734 + 1.0;
    int _738 = abs(_718);
    float _740 = sqrt(_714);
    bool _742 = _284 > 0.5;
    float _744 = _284 + (-0.5);
    float _746 = _730 * _736;
    float _748 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[196].y, _648);
    float _750 = float(_646);
    float _752 = _476 * _746;
    float _754 = float(_738);
    float _756 = _480 * _746;
    float _758 = _492 * _746;
    float _760 = -_730;
    float _762 = _760 + 1.0;
    float _764 = fma(_620, _628, _748);
    float _766 = _754 * _750;
    float _768 = _706 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = in.m_39.x;
    float _774 = in.m_39.y;
    float _776 = in.m_39.z;
    float _778 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].y, _756);
    float _780 = _766 * (-2.0);
    float _782 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].x, _752);
    float _784 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].z, _758);
    float _786 = _764 * 0.15915493667125701904296875;
    float _788 = fma(_780, _542, _542);
    float _790 = in.m_45.x;
    float _792 = in.m_45.y;
    float _794 = in.m_45.z;
    float _796 = _280 + (-0.5);
    float _798 = fma(_388, _780, _388);
    float _800 = fma(_514, _732, _778);
    float _802 = fma(_500, _732, _782);
    float _804 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[196].z, _788);
    float _806 = fma(_518, _732, _784);
    float _808 = fma(_588, _708, _800);
    float _810 = fma(_582, _708, _802);
    float _812 = fma(_798, _628, _804);
    float _814 = fma(_600, _708, _806);
    float _816 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[146].y, _808);
    float _818 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[146].x, _810);
    float _820 = _812 * 0.15915493667125701904296875;
    float _822 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[146].z, _814);
    float _824 = _706 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = _816 * _774;
    float _830 = _822 * _776;
    float _832 = _818 * _772;
    float _834 = _556 * _740;
    float _836 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _838 = _830 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _840 = _786 * 6.283185482025146484375;
    float _842 = sin(_840);
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _792);
    float _846 = _836 * _834;
    float _848 = _832 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _850 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _790);
    float _852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _794);
    float _854 = _846 * _844;
    float _856 = _848 * _834;
    float _858 = _786 * 6.283185482025146484375;
    float _860 = cos(_858);
    float _862 = _838 * _834;
    bool _864 = _280 > 0.5;
    float _866 = _856 * _850;
    float _868 = in.m_47.x;
    float _870 = _862 * _852;
    float _872 = _820 * 6.283185482025146484375;
    float _874 = cos(_872);
    float _876 = _770 * _842;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _880 = _820 * 6.283185482025146484375;
    float _882 = sin(_880);
    float _884 = _826 * _860;
    float _886 = _770 * _860;
    float _888 = _878 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _890 = _874 * _854;
    float _892 = _860 * _874;
    float _894 = _826 * _842;
    float _896 = _842 * _874;
    float _898 = _826 * _890;
    float _900 = fma(_882, _884, _876);
    float _902 = -_894;
    float _904 = fma(_882, _886, _902);
    float _906 = -_886;
    float _908 = fma(_882, _894, _906);
    float _910 = _882 * _854;
    float _912 = fma(_900, _866, _898);
    float _914 = _770 * _890;
    float _916 = fma(_882, _876, _884);
    float _918 = -_910;
    float _920 = fma(_892, _866, _918);
    float _922 = fma(_908, _870, _912);
    float _924 = fma(_904, _866, _914);
    float _926 = fma(_896, _870, _920);
    float _928 = _922 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _930 = _922 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _932 = fma(_916, _870, _924);
    float _934 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[10].x, _928);
    float _936 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[8].x, _930);
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _940 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[10].z, _934);
    float _942 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[8].z, _936);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _946 = _392 + _940;
    float _948 = _356 + _942;
    float _950 = in.m_47.y;
    float _952 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _954 = _946 + _952;
    float _956 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _958 = _948 + _956;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _962 = _954 * _954;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _968 = _966 != 0;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _972 = fma(_958, _958, _962);
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _976 = _974 != 0;
    float _978 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = sqrt(_972);
    float _984 = _964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _986 = _922 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _992 = _990 != 0;
    out.m_49.x = _978;
    out.m_49.y = _980;
    out.m_49.z = _984;
    out.m_49.w = _970;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _996 = _994 != 0;
    float _998 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[9].x, _986);
    float _1000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1002 = -_950;
    float _1004 = _1002 + 1.0;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1008 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1010 = _988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[9].z, _998);
    bool _1014 = _982 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    out.m_51.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1016 = _922;
    int _1018 = as_type<int>(_970);
    float _1020 = _978;
    bool _1022 = _864;
    float _1024 = _950;
    float _1026 = _1008;
    if (!_968)
    {
        _1016 = _868;
    }
    float _1028 = _1016;
    float _1030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_53.x = _1008;
    out.m_53.y = _1010;
    out.m_53.z = _888;
    out.m_53.w = _1006;
    float _1032 = _1028;
    if (_968)
    {
        float _1034 = -_868;
        float _1036 = _1034 + 1.0;
        _1018 = as_type<int>(_1036);
    }
    int _1038 = _1018;
    if (!_976)
    {
        _1020 = _868;
    }
    float _1040 = _1020;
    int _1042 = _864 ? as_type<int>(_1004) : as_type<int>(_950);
    float _1044 = _1040;
    if (_968)
    {
        bool _1046 = _298 > 0.5;
        _1022 = _1046;
    }
    bool _1048 = _1022;
    if (_976)
    {
        float _1050 = -_868;
        float _1052 = _1050 + 1.0;
        _504 = as_type<int>(_1052);
    }
    int _1054 = _504;
    float _1056 = _992 ? as_type<float>(_1042) : _950;
    if (_996)
    {
        float _1058 = _742 ? _1004 : _950;
        _1024 = _1058;
    }
    float _1060 = _1024;
    if (_968)
    {
        float _1062 = _1048 ? as_type<float>(_1038) : _868;
        _1032 = _1062;
    }
    float _1064 = _1032;
    float _1066 = _340 + _1012;
    if (_976)
    {
        float _1068 = _742 ? as_type<float>(_1054) : _868;
        _1044 = _1068;
    }
    float _1070 = _1044;
    if (!_1014)
    {
        _1026 = _948;
    }
    float _1072 = _1026;
    float _1074 = _1072;
    if (!_1014)
    {
        _624 = _946;
    }
    float _1076 = _624;
    float _1078 = _1076;
    if (!_1014)
    {
        _506 = _1066;
    }
    float _1080 = _506;
    bool _1082 = !_1014;
    float _1084 = _1080;
    if (!_1082)
    {
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1090 = _982 + _1088;
        float _1092 = _1066 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1094 = rsqrt(_972);
        float _1096 = _1090 * _1086;
        float _1098 = _1096 * 0.15915493667125701904296875;
        float _1100 = _1098 * 6.283185482025146484375;
        float _1102 = cos(_1100);
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = sin(_1104);
        float _1108 = _1102 + (-1.0);
        float _1110 = fma(_1106, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1112 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1114 = _1094 * _1110;
        float _1116 = fma(_1066, _1102, _1112);
        float _1118 = fma(_958, _1114, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1120 = fma(_954, _1114, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1084 = _1116;
        _1074 = _1118;
        _1078 = _1120;
    }
    float _1122 = _1084;
    float _1124 = _1074;
    float _1126 = _1078;
    float _1128 = -_618;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1122);
    float _1132 = -_650;
    float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1124);
    float _1136 = -_622;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1126);
    float _1140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1142 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1144 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1146 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1148 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1150 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1142);
    float _1152 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1144);
    float _1154 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1146);
    float _1156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1158 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1150);
    float _1160 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1152);
    float _1162 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1148);
    float _1164 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1154);
    float _1166 = _1158 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1168 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1170 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1162);
    float _1172 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1176 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1178 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1180 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1182 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1174);
    float _1184 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1176);
    float _1186 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1178);
    float _1188 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1190 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1182);
    float _1192 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1184);
    float _1194 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1196 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1180);
    float _1198 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1200 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1186);
    float _1202 = _1188 * _1140;
    float _1204 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1206 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1190);
    float _1208 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1192);
    float _1210 = _1198 * _1030;
    float _1212 = _1204 * _1156;
    float _1214 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1196);
    float _1216 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1218 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1200);
    float _1220 = _1206 + _1208;
    float _1222 = _1208 * 0.5;
    float _1224 = _1216 * _1000;
    float _1226 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1214);
    float _1228 = _1220 * 0.5;
    float _1230 = fma(_1218, -0.5, _1222);
    out.m_55.x = _1212;
    out.m_55.y = _1202;
    out.m_57.x = _1224;
    out.m_57.y = _1210;
    out.gl_Position.x = _1206;
    out.gl_Position.y = _1218;
    out.gl_Position.z = _1226;
    out.gl_Position.w = _1208;
    out.m_59.w = _1208;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
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
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _280 = in.m_41.z;
    float _282 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _284 = in.m_41.y;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _294;
    float _298 = in.m_41.x;
    float _300 = 1.0 / _288;
    float _302 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _304 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _306 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].x, _282);
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _310 = _308 != 0;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _314 = _312 != 0;
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _318 = _316 != 0;
    float _320 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].x, _302);
    float _322 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].x, _304);
    float _324 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[4].z, _306);
    float _326 = 1.0 / _292;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = _278 + _328;
    float _332 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[5].z, _320);
    float _334 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[6].z, _322);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _338 = _278 + _336;
    float _340 = _332 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _342 = _280 * 2.0;
    float _344 = _330 * _300;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _278 + _346;
    float _350 = 1.0 / _296;
    float _352 = _284 + _280;
    float _354 = _284 * 2.0;
    float _356 = _324 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _358 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _360 = _340 + _358;
    float _362 = _348 * _326;
    float _364 = _352 + (-1.0);
    float _366 = _298 + _284;
    float _368 = _298 + _280;
    float _370 = floor(_342);
    float _372 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _374 = _366 + (-1.0);
    float _376 = _368 + (-1.0);
    float _378 = _298 * 2.0;
    float _380 = _338 * _350;
    float _382 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _384 = !_310;
    int _386 = _384 ? 0 : 1;
    float _388 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _390 = floor(_354);
    float _392 = _334 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _394 = abs(_386);
    float _396 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _398 = _356 + _396;
    float _400 = _360 * _360;
    bool _402 = !_314;
    int _404 = _402 ? 0 : 1;
    float _406 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _408 = _392 + _406;
    bool _410 = _370 > 0.0;
    float _412 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _414 = log2(_412);
    bool _416 = _370 >= 0.0;
    bool _418 = isnan(_370);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = fma(_398, _398, _400);
    float _428 = float(_394);
    int _430 = _424 ? 0 : 1;
    float _432 = floor(_378);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _434;
    int _438 = abs(_404);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _444 = _390 > 0.0;
    float _446 = _414 * _104;
    bool _448 = _390 >= 0.0;
    bool _450 = isnan(_390);
    bool _452 = _448 || _450;
    bool _454 = isnan(0.0);
    bool _456 = _452 || _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _474 = exp2(_446);
    float _476 = fma(_436, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _478 = _432 > 0.0;
    float _480 = fma(_460, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _482 = _432 >= 0.0;
    bool _484 = isnan(_432);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    float _492 = fma(_464, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _494 = ~_430;
    int _496 = _494 + 1;
    int _498 = _496 + 1;
    float _500 = fma(_442, _362, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _502 = _498;
    int _504 = as_type<int>(_298);
    float _506 = _340;
    if (!_410)
    {
        int _508 = ~_430;
        int _510 = _508 + 1;
        _502 = _510;
    }
    int _512 = _502;
    float _514 = fma(_468, _362, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _516 = _490 ? 0 : 1;
    float _518 = fma(_472, _362, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _520 = float(_512);
    int _522 = ~_516;
    int _524 = _522 + 1;
    int _526 = _524 + 1;
    int _528 = _526;
    if (!_478)
    {
        int _530 = ~_516;
        int _532 = _530 + 1;
        _528 = _532;
    }
    int _534 = _528;
    float _536 = _428 * _520;
    float _538 = in.m_43.x;
    float _540 = in.m_43.y;
    float _542 = in.m_43.z;
    float _544 = -_474;
    float _546 = _544 + 1.0;
    float _548 = fma(_408, _408, _426);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _552 = 1.0 + _550;
    float _554 = _536 * (-2.0);
    float _556 = rsqrt(_548);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _558;
    bool _562 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _564 = isnan(1.0);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _570 = _566 || _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _576;
    float _580 = float(_438);
    float _582 = fma(_560, _380, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _584 = 1.0 / _552;
    float _586 = float(_534);
    float _588 = fma(_574, _380, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _590 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _598 = _594 || _596;
    float _600 = fma(_578, _380, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _602 = _298 + (-0.5);
    float _604 = _580 * _586;
    float _606 = _598 ? _546 : 0.0;
    float _608 = fma(_554, _538, _538);
    int _610 = _456 ? 0 : 1;
    float _612 = _604 * (-2.0);
    float _614 = fma(_382, _554, _382);
    float _616 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[196].x, _608);
    float _618 = _360 * _556;
    float _620 = fma(_372, _612, _372);
    float _622 = _408 * _556;
    float _624 = 1.0;
    if (_570)
    {
        float _626 = _606 * _584;
        _126 = _626;
    }
    float _628 = _126;
    int _630 = ~_610;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    float _636 = -_618;
    float _638 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[18].w, _360);
    int _640 = _634;
    if (!_444)
    {
        int _642 = ~_610;
        int _644 = _642 + 1;
        _640 = _644;
    }
    int _646 = _640;
    float _648 = fma(_612, _540, _540);
    float _650 = _398 * _556;
    float _652 = fma(_614, _628, _616);
    bool _654 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _656 = isnan(_278);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = _638 * _638;
    float _668 = -_650;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _398);
    bool _672 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _674 = isnan(_278);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -_622;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _408);
    float _688 = -_664;
    float _690 = _688 + 1.0;
    float _692 = fma(_670, _670, _666);
    bool _694 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _696 = isnan(_278);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = _652 * 0.15915493667125701904296875;
    float _708 = _682 * _690;
    float _710 = -_682;
    float _712 = _710 + 1.0;
    float _714 = fma(_686, _686, _692);
    bool _716 = !_318;
    int _718 = _716 ? 0 : 1;
    out.m_33.x = 1.0;
    bool _720 = _278 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _722 = isnan(_278);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = _704 * _712;
    float _734 = -_704;
    float _736 = _734 + 1.0;
    int _738 = abs(_718);
    float _740 = sqrt(_714);
    bool _742 = _284 > 0.5;
    float _744 = _284 + (-0.5);
    float _746 = _730 * _736;
    float _748 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[196].y, _648);
    float _750 = float(_646);
    float _752 = _476 * _746;
    float _754 = float(_738);
    float _756 = _480 * _746;
    float _758 = _492 * _746;
    float _760 = -_730;
    float _762 = _760 + 1.0;
    float _764 = fma(_620, _628, _748);
    float _766 = _754 * _750;
    float _768 = _706 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = in.m_39.x;
    float _774 = in.m_39.y;
    float _776 = in.m_39.z;
    float _778 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].y, _756);
    float _780 = _766 * (-2.0);
    float _782 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].x, _752);
    float _784 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].z, _758);
    float _786 = _764 * 0.15915493667125701904296875;
    float _788 = fma(_780, _542, _542);
    float _790 = in.m_45.x;
    float _792 = in.m_45.y;
    float _794 = in.m_45.z;
    float _796 = _280 + (-0.5);
    float _798 = fma(_388, _780, _388);
    float _800 = fma(_514, _732, _778);
    float _802 = fma(_500, _732, _782);
    float _804 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[196].z, _788);
    float _806 = fma(_518, _732, _784);
    float _808 = fma(_588, _708, _800);
    float _810 = fma(_582, _708, _802);
    float _812 = fma(_798, _628, _804);
    float _814 = fma(_600, _708, _806);
    float _816 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[146].y, _808);
    float _818 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[146].x, _810);
    float _820 = _812 * 0.15915493667125701904296875;
    float _822 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[146].z, _814);
    float _824 = _706 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = _816 * _774;
    float _830 = _822 * _776;
    float _832 = _818 * _772;
    float _834 = _556 * _740;
    float _836 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _838 = _830 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _840 = _786 * 6.283185482025146484375;
    float _842 = sin(_840);
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _792);
    float _846 = _836 * _834;
    float _848 = _832 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _850 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _790);
    float _852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _794);
    float _854 = _846 * _844;
    float _856 = _848 * _834;
    float _858 = _786 * 6.283185482025146484375;
    float _860 = cos(_858);
    float _862 = _838 * _834;
    bool _864 = _280 > 0.5;
    float _866 = _856 * _850;
    float _868 = in.m_47.x;
    float _870 = _862 * _852;
    float _872 = _820 * 6.283185482025146484375;
    float _874 = cos(_872);
    float _876 = _770 * _842;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _880 = _820 * 6.283185482025146484375;
    float _882 = sin(_880);
    float _884 = _826 * _860;
    float _886 = _770 * _860;
    float _888 = _878 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _890 = _874 * _854;
    float _892 = _860 * _874;
    float _894 = _826 * _842;
    float _896 = _842 * _874;
    float _898 = _826 * _890;
    float _900 = fma(_882, _884, _876);
    float _902 = -_894;
    float _904 = fma(_882, _886, _902);
    float _906 = -_886;
    float _908 = fma(_882, _894, _906);
    float _910 = _882 * _854;
    float _912 = fma(_900, _866, _898);
    float _914 = _770 * _890;
    float _916 = fma(_882, _876, _884);
    float _918 = -_910;
    float _920 = fma(_892, _866, _918);
    float _922 = fma(_908, _870, _912);
    float _924 = fma(_904, _866, _914);
    float _926 = fma(_896, _870, _920);
    float _928 = _922 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _930 = _922 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _932 = fma(_916, _870, _924);
    float _934 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[10].x, _928);
    float _936 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[8].x, _930);
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _940 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[10].z, _934);
    float _942 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[8].z, _936);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _946 = _392 + _940;
    float _948 = _356 + _942;
    float _950 = in.m_47.y;
    float _952 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _954 = _946 + _952;
    float _956 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _958 = _948 + _956;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _962 = _954 * _954;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _968 = _966 != 0;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _972 = fma(_958, _958, _962);
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _976 = _974 != 0;
    float _978 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = sqrt(_972);
    float _984 = _964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _986 = _922 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _992 = _990 != 0;
    out.m_49.x = _978;
    out.m_49.y = _980;
    out.m_49.z = _984;
    out.m_49.w = _970;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _996 = _994 != 0;
    float _998 = fma(_926, (*spvDescriptorSet0.vp_c10)._m0[9].x, _986);
    float _1000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1002 = -_950;
    float _1004 = _1002 + 1.0;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1008 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1010 = _988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[9].z, _998);
    bool _1014 = _982 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    out.m_51.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1016 = _922;
    int _1018 = as_type<int>(_970);
    float _1020 = _978;
    bool _1022 = _864;
    float _1024 = _950;
    float _1026 = _1008;
    if (!_968)
    {
        _1016 = _868;
    }
    float _1028 = _1016;
    float _1030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_53.x = _1008;
    out.m_53.y = _1010;
    out.m_53.z = _888;
    out.m_53.w = _1006;
    float _1032 = _1028;
    if (_968)
    {
        float _1034 = -_868;
        float _1036 = _1034 + 1.0;
        _1018 = as_type<int>(_1036);
    }
    int _1038 = _1018;
    if (!_976)
    {
        _1020 = _868;
    }
    float _1040 = _1020;
    int _1042 = _864 ? as_type<int>(_1004) : as_type<int>(_950);
    float _1044 = _1040;
    if (_968)
    {
        bool _1046 = _298 > 0.5;
        _1022 = _1046;
    }
    bool _1048 = _1022;
    if (_976)
    {
        float _1050 = -_868;
        float _1052 = _1050 + 1.0;
        _504 = as_type<int>(_1052);
    }
    int _1054 = _504;
    float _1056 = _992 ? as_type<float>(_1042) : _950;
    if (_996)
    {
        float _1058 = _742 ? _1004 : _950;
        _1024 = _1058;
    }
    float _1060 = _1024;
    if (_968)
    {
        float _1062 = _1048 ? as_type<float>(_1038) : _868;
        _1032 = _1062;
    }
    float _1064 = _1032;
    float _1066 = _340 + _1012;
    if (_976)
    {
        float _1068 = _742 ? as_type<float>(_1054) : _868;
        _1044 = _1068;
    }
    float _1070 = _1044;
    if (!_1014)
    {
        _1026 = _948;
    }
    float _1072 = _1026;
    float _1074 = _1072;
    if (!_1014)
    {
        _624 = _946;
    }
    float _1076 = _624;
    float _1078 = _1076;
    if (!_1014)
    {
        _506 = _1066;
    }
    float _1080 = _506;
    bool _1082 = !_1014;
    float _1084 = _1080;
    if (!_1082)
    {
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1090 = _982 + _1088;
        float _1092 = _1066 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1094 = rsqrt(_972);
        float _1096 = _1090 * _1086;
        float _1098 = _1096 * 0.15915493667125701904296875;
        float _1100 = _1098 * 6.283185482025146484375;
        float _1102 = cos(_1100);
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = sin(_1104);
        float _1108 = _1102 + (-1.0);
        float _1110 = fma(_1106, _1092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1112 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1114 = _1094 * _1110;
        float _1116 = fma(_1066, _1102, _1112);
        float _1118 = fma(_958, _1114, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1120 = fma(_954, _1114, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1084 = _1116;
        _1074 = _1118;
        _1078 = _1120;
    }
    float _1122 = _1084;
    float _1124 = _1074;
    float _1126 = _1078;
    float _1128 = -_618;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1122);
    float _1132 = -_650;
    float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1124);
    float _1136 = -_622;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1126);
    float _1140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1142 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1144 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1146 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1148 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1150 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1142);
    float _1152 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1144);
    float _1154 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1146);
    float _1156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1158 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1150);
    float _1160 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1152);
    float _1162 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1148);
    float _1164 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1154);
    float _1166 = _1158 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1168 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1170 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1162);
    float _1172 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1176 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1178 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1180 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1182 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1174);
    float _1184 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1176);
    float _1186 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1178);
    float _1188 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1190 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1182);
    float _1192 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1184);
    float _1194 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1196 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1180);
    float _1198 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1200 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1186);
    float _1202 = _1188 * _1140;
    float _1204 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1206 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1190);
    float _1208 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1192);
    float _1210 = _1198 * _1030;
    float _1212 = _1204 * _1156;
    float _1214 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1196);
    float _1216 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1218 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1200);
    float _1220 = _1206 + _1208;
    float _1222 = _1208 * 0.5;
    float _1224 = _1216 * _1000;
    float _1226 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1214);
    float _1228 = _1220 * 0.5;
    float _1230 = fma(_1218, -0.5, _1222);
    out.m_55.x = _1212;
    out.m_55.y = _1202;
    out.m_57.x = _1224;
    out.m_57.y = _1210;
    out.gl_Position.x = _1206;
    out.gl_Position.y = _1218;
    out.gl_Position.z = _1226;
    out.gl_Position.w = _1208;
    out.m_59.w = _1208;
    out.m_59.x = _1228;
    out.m_59.y = _1230;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

