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
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn2)]];
    float4 m_29 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_41 [[attribute(1)]];
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_35 [[attribute(5)]];
    float4 m_33 [[attribute(6)]];
    float4 m_43 [[attribute(7)]];
    float4 m_37 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    bool _144 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_26.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _74 = _72;
    float _76 = _74;
    if (!_70)
    {
        out.m_29.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _74 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1017 = as_type<float>(_82);
        out.gl_Position.z = _1017;
    }
    if (!_70)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _86 = in.m_31.w;
    bool _88 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _90 = isnan(_86);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _96 = _92 || _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _102 = 0.0;
    float _104 = _100;
    if (_96)
    {
        float _106 = float(_66);
        _102 = _106;
    }
    float _108 = _102;
    bool _110 = _100 >= _108;
    bool _112 = !_96;
    bool _114 = _110 || _112;
    if (_114)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _76;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _84 = as_type<int>(_118);
    }
    int _120 = _84;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1086 = as_type<float>(_120);
        out.gl_Position.z = _1086;
    }
    if (_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _122 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _124 = !_122;
    float _142;
    if (!_124)
    {
        float _126 = in.m_33.x;
        float _128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _130 = _126 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _132 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _134 = _132 * _128;
        float _136 = floor(_134);
        float _138 = -_136;
        float _140 = _134 + _138;
        _142 = _140;
        _144 = true;
    }
    else
    {
        float _146 = float(_66);
        float _148 = 1.0 / _146;
        float _150 = _100 * _148;
        _142 = _150;
    }
    _144 = false;
    float _152 = _142;
    float _154 = in.m_35.x;
    float _156 = in.m_35.y;
    float _158 = in.m_35.z;
    float _160 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _162 = log2(_160);
    float _164 = in.m_33.x;
    float _166 = in.m_33.y;
    float _168 = in.m_33.z;
    float _170 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _170;
    float _174 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _176 = _174 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _178 = in.m_37.x;
    float _180 = 1.0 / _172;
    float _182 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _182;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _188 = _186 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _192 = _190 != 0;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _196 = _194 != 0;
    int _198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _200 = _198 != 0;
    float _202 = in.m_37.y;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _206 = _152 + _204;
    bool _208 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _210 = isnan(0.0);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _216 = _212 || _214;
    float _218 = 1.0 / _176;
    float _220 = _162 * _100;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _152 + _222;
    bool _226 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _228 = isnan(1.0);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _234 = _230 || _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _238 = 1.0 + _236;
    float _240 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _154);
    float _242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _156);
    float _244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _158);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _152 + _246;
    float _250 = 1.0 / _188;
    float _252 = _166 + _168;
    float _254 = _168 + (-0.5);
    float _256 = _168 * 2.0;
    out.m_39.x = _178;
    float _258 = _224 * _180;
    float _260 = _248 * _218;
    float _262 = 1.0 / _184;
    float _264 = _168 + _164;
    float _266 = _166 + _164;
    float _268 = _252 + (-1.0);
    float _270 = _166 * 2.0;
    float _272 = _264 + (-1.0);
    float _274 = _164 + (-0.5);
    float _276 = _164 * 2.0;
    float _278 = exp2(_220);
    float _280 = _166 + (-0.5);
    out.m_39.y = _202;
    float _282 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _284 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _286 = 1.0 / _238;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = _152 + _288;
    float _292 = _266 + (-1.0);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _294;
    float _298 = _290 * _262;
    float _300 = -_278;
    float _302 = _300 + 1.0;
    float _304 = floor(_256);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _152 + _306;
    float _310 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _312 = _216 ? _302 : 0.0;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _314;
    float _318 = _308 * _250;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _324;
    float _328 = 1.0 / _296;
    if (_234)
    {
        float _330 = _312 * _286;
        _104 = _330;
    }
    float _332 = _104;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _338 = !_192;
    int _340 = _338 ? 0 : 1;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    float _354 = floor(_276);
    bool _356 = _304 >= 0.0;
    bool _358 = isnan(_304);
    bool _360 = _356 || _358;
    bool _362 = isnan(0.0);
    bool _364 = _360 || _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _370 = _304 > 0.0;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _372;
    int _376 = _364 ? 0 : 1;
    float _378 = fma(_336, _260, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _380 = fma(_344, _260, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _382 = floor(_270);
    float _384 = _206 * _328;
    float _386 = fma(_368, _260, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _392 = fma(_322, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _394 = fma(_326, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _396;
    bool _400 = _354 > 0.0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _406 = _354 >= 0.0;
    bool _408 = isnan(_354);
    bool _410 = _406 || _408;
    bool _412 = isnan(0.0);
    bool _414 = _410 || _412;
    float _416 = fma(_398, _298, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _418 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _420 = isnan(_152);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = fma(_352, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _432 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _434 = isnan(_152);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = fma(_348, _318, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _446 = _382 > 0.0;
    float _448 = -_428;
    float _450 = _448 + 1.0;
    bool _452 = _382 >= 0.0;
    bool _454 = isnan(_382);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = fma(_316, _298, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _464 = fma(_374, _298, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _466 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _468 = isnan(_152);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = -_442;
    float _480 = _478 + 1.0;
    float _482 = _476 * _450;
    float _484 = -_476;
    float _486 = _484 + 1.0;
    float _488 = fma(_404, _318, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _490 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _492 = isnan(_152);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = fma(_390, _318, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _504 = _442 * _486;
    bool _506 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _508 = isnan(_152);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _518;
    float _522 = -_500;
    float _524 = _522 + 1.0;
    bool _526 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _528 = isnan(_152);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = _500 * _480;
    float _540 = -_516;
    float _542 = _540 + 1.0;
    float _544 = _516 * _524;
    float _546 = in.m_41.x;
    float _548 = in.m_41.y;
    float _550 = in.m_41.z;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _556;
    int _560 = abs(_340);
    float _562 = _536 * _542;
    float _564 = fma(_554, _384, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _566 = fma(_558, _384, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    int _568 = ~_376;
    int _570 = _568 + 1;
    int _572 = _570 + 1;
    float _574 = fma(_520, _384, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _576 = _394 * _562;
    int _578 = _572;
    if (!_370)
    {
        int _580 = ~_376;
        int _582 = _580 + 1;
        _578 = _582;
    }
    int _584 = _578;
    float _586 = _392 * _562;
    float _588 = float(_560);
    float _590 = _430 * _562;
    float _592 = float(_584);
    float _594 = -_536;
    float _596 = _594 + 1.0;
    bool _598 = !_200;
    int _600 = _598 ? 0 : 1;
    int _602 = _460 ? 0 : 1;
    float _604 = _588 * _592;
    int _606 = abs(_600);
    float _608 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[143].x, _586);
    int _610 = ~_602;
    int _612 = _610 + 1;
    int _614 = _612 + 1;
    float _616 = _604 * (-2.0);
    int _618 = _614;
    if (!_446)
    {
        int _620 = ~_602;
        int _622 = _620 + 1;
        _618 = _622;
    }
    int _624 = _618;
    float _626 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[143].y, _576);
    float _628 = fma(_616, _546, _546);
    float _630 = float(_624);
    float _632 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[143].z, _590);
    float _634 = float(_606);
    float _636 = fma(_310, _616, _310);
    int _638 = _414 ? 0 : 1;
    float _640 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[196].x, _628);
    bool _642 = !_196;
    int _644 = _642 ? 0 : 1;
    float _646 = _634 * _630;
    int _648 = ~_638;
    int _650 = _648 + 1;
    int _652 = _650 + 1;
    float _654 = fma(_378, _544, _608);
    int _656 = abs(_644);
    float _658 = _646 * (-2.0);
    int _660 = _652;
    if (!_400)
    {
        int _662 = ~_638;
        int _664 = _662 + 1;
        _660 = _664;
    }
    int _666 = _660;
    float _668 = fma(_636, _332, _640);
    float _670 = float(_656);
    float _672 = fma(_658, _550, _550);
    float _674 = float(_666);
    float _676 = fma(_284, _658, _284);
    float _678 = fma(_386, _544, _632);
    float _680 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[196].z, _672);
    float _682 = fma(_416, _538, _654);
    float _684 = in.m_26.x;
    float _686 = in.m_26.y;
    float _688 = in.m_26.z;
    float _690 = _670 * _674;
    float _692 = fma(_676, _332, _680);
    float _694 = fma(_380, _544, _626);
    float _696 = fma(_464, _538, _678);
    float _698 = _690 * (-2.0);
    float _700 = _692 * 0.15915493667125701904296875;
    float _702 = fma(_462, _538, _694);
    float _704 = _668 * 0.15915493667125701904296875;
    float _706 = fma(_698, _548, _548);
    float _708 = fma(_282, _698, _282);
    float _710 = in.m_43.x;
    float _712 = in.m_43.y;
    float _714 = in.m_43.z;
    float _716 = fma(_488, _504, _682);
    float _718 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[196].y, _706);
    float _720 = fma(_444, _504, _702);
    float _722 = fma(_502, _504, _696);
    float _724 = _704 * 6.283185482025146484375;
    float _726 = sin(_724);
    float _728 = fma(_708, _332, _718);
    float _730 = fma(_564, _482, _716);
    float _732 = fma(_566, _482, _720);
    float _734 = fma(_574, _482, _722);
    float _736 = _728 * 0.15915493667125701904296875;
    float _738 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[148].x, _730);
    float _740 = _704 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = _686 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _746 = _686 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _748 = _686 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _750 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[148].z, _734);
    float _752 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[4].x, _744);
    float _754 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[5].x, _746);
    float _756 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[6].x, _748);
    float _758 = _700 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[148].y, _732);
    float _764 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[4].z, _752);
    float _766 = _738 * _710;
    float _768 = _750 * _714;
    float _770 = _762 * _712;
    float _772 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[5].z, _754);
    float _774 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _776 = _700 * 6.283185482025146484375;
    float _778 = cos(_776);
    float _780 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _782 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _784 = _774 * _240;
    float _786 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[6].z, _756);
    float _788 = _780 * _242;
    float _790 = _782 * _244;
    float _792 = _772 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _794 = _736 * 6.283185482025146484375;
    float _796 = sin(_794);
    float _798 = _726 * _760;
    float _800 = _742 * _760;
    float _802 = _764 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _804 = _786 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _806 = in.m_37.z;
    float _808 = _736 * 6.283185482025146484375;
    float _810 = cos(_808);
    float _812 = _742 * _778;
    float _814 = _726 * _778;
    float _816 = fma(_796, _798, _812);
    float _818 = -_800;
    float _820 = fma(_796, _814, _818);
    float _822 = -_814;
    float _824 = fma(_796, _800, _822);
    float _826 = _816 * _788;
    float _828 = _820 * _788;
    float _830 = _796 * _784;
    float _832 = fma(_796, _812, _798);
    float _834 = _810 * _784;
    float _836 = _726 * _810;
    float _838 = _742 * _810;
    float _840 = fma(_760, _834, _826);
    float _842 = fma(_778, _834, _828);
    float _844 = -_830;
    float _846 = fma(_836, _788, _844);
    out.m_39.z = _806;
    float _848 = fma(_824, _790, _840);
    float _850 = fma(_832, _790, _842);
    float _852 = fma(_838, _790, _846);
    float _854 = _848 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _856 = _848 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _858 = _848 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _860 = fma(_850, (*spvDescriptorSet0.vp_c10)._m0[9].x, _854);
    float _862 = fma(_850, (*spvDescriptorSet0.vp_c10)._m0[8].x, _856);
    float _864 = fma(_850, (*spvDescriptorSet0.vp_c10)._m0[10].x, _858);
    float _866 = fma(_852, (*spvDescriptorSet0.vp_c10)._m0[9].z, _860);
    float _868 = fma(_852, (*spvDescriptorSet0.vp_c10)._m0[8].z, _862);
    float _870 = fma(_852, (*spvDescriptorSet0.vp_c10)._m0[10].z, _864);
    float _872 = _792 + _866;
    float _874 = _802 + _868;
    float _876 = _804 + _870;
    float _878 = _872 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _880 = _872 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _882 = _872 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _884 = in.m_37.w;
    float _886 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[1].x, _878);
    float _888 = _872 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _890 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[0].x, _880);
    float _892 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[2].x, _882);
    float _894 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[1].z, _886);
    float _896 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[3].x, _888);
    float _898 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[0].z, _890);
    float _900 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[2].z, _892);
    float _902 = _894 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _904 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[3].z, _896);
    float _906 = _898 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _908 = _900 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _910 = _902 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _912 = _902 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _914 = _902 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _916 = _902 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _918 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[4].x, _910);
    float _920 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[5].x, _912);
    float _922 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[6].x, _914);
    float _924 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[7].x, _916);
    float _926 = _904 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _928 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[4].z, _918);
    float _930 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[5].z, _920);
    float _932 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[6].z, _922);
    float _934 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[7].z, _924);
    float _936 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[4].w, _928);
    float _938 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[5].w, _930);
    float _940 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[6].w, _932);
    float _942 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[7].w, _934);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _950 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _954 = _940 + _942;
    float _956 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _954 * 0.5;
    out.m_39.w = _884;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_45.x = _956;
    out.m_45.y = _950;
    out.m_45.z = _958;
    out.m_45.w = _946;
    out.gl_Position.x = _936;
    out.gl_Position.y = _938;
    out.gl_Position.z = _940;
    out.gl_Position.w = _942;
    out.m_47.z = _960;
    out.m_47.w = _942;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    bool _144 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_26.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _74 = _72;
    float _76 = _74;
    if (!_70)
    {
        out.m_29.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _74 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1017 = as_type<float>(_82);
        out.gl_Position.z = _1017;
    }
    if (!_70)
    {
        return out;
    }
    float _86 = in.m_31.w;
    bool _88 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _90 = isnan(_86);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _96 = _92 || _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _102 = 0.0;
    float _104 = _100;
    if (_96)
    {
        float _106 = float(_66);
        _102 = _106;
    }
    float _108 = _102;
    bool _110 = _100 >= _108;
    bool _112 = !_96;
    bool _114 = _110 || _112;
    if (_114)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _76;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _84 = as_type<int>(_118);
    }
    int _120 = _84;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1086 = as_type<float>(_120);
        out.gl_Position.z = _1086;
    }
    if (_114)
    {
        return out;
    }
    bool _122 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _124 = !_122;
    float _142;
    if (!_124)
    {
        float _126 = in.m_33.x;
        float _128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _130 = _126 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _132 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _134 = _132 * _128;
        float _136 = floor(_134);
        float _138 = -_136;
        float _140 = _134 + _138;
        _142 = _140;
        _144 = true;
    }
    else
    {
        float _146 = float(_66);
        float _148 = 1.0 / _146;
        float _150 = _100 * _148;
        _142 = _150;
    }
    _144 = false;
    float _152 = _142;
    float _154 = in.m_35.x;
    float _156 = in.m_35.y;
    float _158 = in.m_35.z;
    float _160 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _162 = log2(_160);
    float _164 = in.m_33.x;
    float _166 = in.m_33.y;
    float _168 = in.m_33.z;
    float _170 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _170;
    float _174 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _176 = _174 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _178 = in.m_37.x;
    float _180 = 1.0 / _172;
    float _182 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _182;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _188 = _186 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _192 = _190 != 0;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _196 = _194 != 0;
    int _198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _200 = _198 != 0;
    float _202 = in.m_37.y;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _206 = _152 + _204;
    bool _208 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _210 = isnan(0.0);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _216 = _212 || _214;
    float _218 = 1.0 / _176;
    float _220 = _162 * _100;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _152 + _222;
    bool _226 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _228 = isnan(1.0);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _234 = _230 || _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _238 = 1.0 + _236;
    float _240 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _154);
    float _242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _156);
    float _244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _158);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _152 + _246;
    float _250 = 1.0 / _188;
    float _252 = _166 + _168;
    float _254 = _168 + (-0.5);
    float _256 = _168 * 2.0;
    out.m_39.x = _178;
    float _258 = _224 * _180;
    float _260 = _248 * _218;
    float _262 = 1.0 / _184;
    float _264 = _168 + _164;
    float _266 = _166 + _164;
    float _268 = _252 + (-1.0);
    float _270 = _166 * 2.0;
    float _272 = _264 + (-1.0);
    float _274 = _164 + (-0.5);
    float _276 = _164 * 2.0;
    float _278 = exp2(_220);
    float _280 = _166 + (-0.5);
    out.m_39.y = _202;
    float _282 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _284 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _286 = 1.0 / _238;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = _152 + _288;
    float _292 = _266 + (-1.0);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _294;
    float _298 = _290 * _262;
    float _300 = -_278;
    float _302 = _300 + 1.0;
    float _304 = floor(_256);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _152 + _306;
    float _310 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _312 = _216 ? _302 : 0.0;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _314;
    float _318 = _308 * _250;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _324;
    float _328 = 1.0 / _296;
    if (_234)
    {
        float _330 = _312 * _286;
        _104 = _330;
    }
    float _332 = _104;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _338 = !_192;
    int _340 = _338 ? 0 : 1;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    float _354 = floor(_276);
    bool _356 = _304 >= 0.0;
    bool _358 = isnan(_304);
    bool _360 = _356 || _358;
    bool _362 = isnan(0.0);
    bool _364 = _360 || _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _370 = _304 > 0.0;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _372;
    int _376 = _364 ? 0 : 1;
    float _378 = fma(_336, _260, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _380 = fma(_344, _260, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _382 = floor(_270);
    float _384 = _206 * _328;
    float _386 = fma(_368, _260, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _392 = fma(_322, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _394 = fma(_326, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _396;
    bool _400 = _354 > 0.0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _406 = _354 >= 0.0;
    bool _408 = isnan(_354);
    bool _410 = _406 || _408;
    bool _412 = isnan(0.0);
    bool _414 = _410 || _412;
    float _416 = fma(_398, _298, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _418 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _420 = isnan(_152);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = fma(_352, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _432 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _434 = isnan(_152);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = fma(_348, _318, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _446 = _382 > 0.0;
    float _448 = -_428;
    float _450 = _448 + 1.0;
    bool _452 = _382 >= 0.0;
    bool _454 = isnan(_382);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = fma(_316, _298, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _464 = fma(_374, _298, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _466 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _468 = isnan(_152);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = -_442;
    float _480 = _478 + 1.0;
    float _482 = _476 * _450;
    float _484 = -_476;
    float _486 = _484 + 1.0;
    float _488 = fma(_404, _318, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _490 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _492 = isnan(_152);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = fma(_390, _318, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _504 = _442 * _486;
    bool _506 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _508 = isnan(_152);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _518;
    float _522 = -_500;
    float _524 = _522 + 1.0;
    bool _526 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _528 = isnan(_152);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = _500 * _480;
    float _540 = -_516;
    float _542 = _540 + 1.0;
    float _544 = _516 * _524;
    float _546 = in.m_41.x;
    float _548 = in.m_41.y;
    float _550 = in.m_41.z;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _556;
    int _560 = abs(_340);
    float _562 = _536 * _542;
    float _564 = fma(_554, _384, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _566 = fma(_558, _384, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    int _568 = ~_376;
    int _570 = _568 + 1;
    int _572 = _570 + 1;
    float _574 = fma(_520, _384, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _576 = _394 * _562;
    int _578 = _572;
    if (!_370)
    {
        int _580 = ~_376;
        int _582 = _580 + 1;
        _578 = _582;
    }
    int _584 = _578;
    float _586 = _392 * _562;
    float _588 = float(_560);
    float _590 = _430 * _562;
    float _592 = float(_584);
    float _594 = -_536;
    float _596 = _594 + 1.0;
    bool _598 = !_200;
    int _600 = _598 ? 0 : 1;
    int _602 = _460 ? 0 : 1;
    float _604 = _588 * _592;
    int _606 = abs(_600);
    float _608 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[143].x, _586);
    int _610 = ~_602;
    int _612 = _610 + 1;
    int _614 = _612 + 1;
    float _616 = _604 * (-2.0);
    int _618 = _614;
    if (!_446)
    {
        int _620 = ~_602;
        int _622 = _620 + 1;
        _618 = _622;
    }
    int _624 = _618;
    float _626 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[143].y, _576);
    float _628 = fma(_616, _546, _546);
    float _630 = float(_624);
    float _632 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[143].z, _590);
    float _634 = float(_606);
    float _636 = fma(_310, _616, _310);
    int _638 = _414 ? 0 : 1;
    float _640 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[196].x, _628);
    bool _642 = !_196;
    int _644 = _642 ? 0 : 1;
    float _646 = _634 * _630;
    int _648 = ~_638;
    int _650 = _648 + 1;
    int _652 = _650 + 1;
    float _654 = fma(_378, _544, _608);
    int _656 = abs(_644);
    float _658 = _646 * (-2.0);
    int _660 = _652;
    if (!_400)
    {
        int _662 = ~_638;
        int _664 = _662 + 1;
        _660 = _664;
    }
    int _666 = _660;
    float _668 = fma(_636, _332, _640);
    float _670 = float(_656);
    float _672 = fma(_658, _550, _550);
    float _674 = float(_666);
    float _676 = fma(_284, _658, _284);
    float _678 = fma(_386, _544, _632);
    float _680 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[196].z, _672);
    float _682 = fma(_416, _538, _654);
    float _684 = in.m_26.x;
    float _686 = in.m_26.y;
    float _688 = in.m_26.z;
    float _690 = _670 * _674;
    float _692 = fma(_676, _332, _680);
    float _694 = fma(_380, _544, _626);
    float _696 = fma(_464, _538, _678);
    float _698 = _690 * (-2.0);
    float _700 = _692 * 0.15915493667125701904296875;
    float _702 = fma(_462, _538, _694);
    float _704 = _668 * 0.15915493667125701904296875;
    float _706 = fma(_698, _548, _548);
    float _708 = fma(_282, _698, _282);
    float _710 = in.m_43.x;
    float _712 = in.m_43.y;
    float _714 = in.m_43.z;
    float _716 = fma(_488, _504, _682);
    float _718 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[196].y, _706);
    float _720 = fma(_444, _504, _702);
    float _722 = fma(_502, _504, _696);
    float _724 = _704 * 6.283185482025146484375;
    float _726 = sin(_724);
    float _728 = fma(_708, _332, _718);
    float _730 = fma(_564, _482, _716);
    float _732 = fma(_566, _482, _720);
    float _734 = fma(_574, _482, _722);
    float _736 = _728 * 0.15915493667125701904296875;
    float _738 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[148].x, _730);
    float _740 = _704 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = _686 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _746 = _686 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _748 = _686 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _750 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[148].z, _734);
    float _752 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[4].x, _744);
    float _754 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[5].x, _746);
    float _756 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[6].x, _748);
    float _758 = _700 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[148].y, _732);
    float _764 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[4].z, _752);
    float _766 = _738 * _710;
    float _768 = _750 * _714;
    float _770 = _762 * _712;
    float _772 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[5].z, _754);
    float _774 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _776 = _700 * 6.283185482025146484375;
    float _778 = cos(_776);
    float _780 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _782 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _784 = _774 * _240;
    float _786 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[6].z, _756);
    float _788 = _780 * _242;
    float _790 = _782 * _244;
    float _792 = _772 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _794 = _736 * 6.283185482025146484375;
    float _796 = sin(_794);
    float _798 = _726 * _760;
    float _800 = _742 * _760;
    float _802 = _764 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _804 = _786 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _806 = in.m_37.z;
    float _808 = _736 * 6.283185482025146484375;
    float _810 = cos(_808);
    float _812 = _742 * _778;
    float _814 = _726 * _778;
    float _816 = fma(_796, _798, _812);
    float _818 = -_800;
    float _820 = fma(_796, _814, _818);
    float _822 = -_814;
    float _824 = fma(_796, _800, _822);
    float _826 = _816 * _788;
    float _828 = _820 * _788;
    float _830 = _796 * _784;
    float _832 = fma(_796, _812, _798);
    float _834 = _810 * _784;
    float _836 = _726 * _810;
    float _838 = _742 * _810;
    float _840 = fma(_760, _834, _826);
    float _842 = fma(_778, _834, _828);
    float _844 = -_830;
    float _846 = fma(_836, _788, _844);
    out.m_39.z = _806;
    float _848 = fma(_824, _790, _840);
    float _850 = fma(_832, _790, _842);
    float _852 = fma(_838, _790, _846);
    float _854 = _848 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _856 = _848 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _858 = _848 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _860 = fma(_850, (*spvDescriptorSet0.vp_c10)._m0[9].x, _854);
    float _862 = fma(_850, (*spvDescriptorSet0.vp_c10)._m0[8].x, _856);
    float _864 = fma(_850, (*spvDescriptorSet0.vp_c10)._m0[10].x, _858);
    float _866 = fma(_852, (*spvDescriptorSet0.vp_c10)._m0[9].z, _860);
    float _868 = fma(_852, (*spvDescriptorSet0.vp_c10)._m0[8].z, _862);
    float _870 = fma(_852, (*spvDescriptorSet0.vp_c10)._m0[10].z, _864);
    float _872 = _792 + _866;
    float _874 = _802 + _868;
    float _876 = _804 + _870;
    float _878 = _872 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _880 = _872 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _882 = _872 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _884 = in.m_37.w;
    float _886 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[1].x, _878);
    float _888 = _872 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _890 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[0].x, _880);
    float _892 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[2].x, _882);
    float _894 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[1].z, _886);
    float _896 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[3].x, _888);
    float _898 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[0].z, _890);
    float _900 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[2].z, _892);
    float _902 = _894 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _904 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[3].z, _896);
    float _906 = _898 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _908 = _900 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _910 = _902 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _912 = _902 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _914 = _902 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _916 = _902 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _918 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[4].x, _910);
    float _920 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[5].x, _912);
    float _922 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[6].x, _914);
    float _924 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[7].x, _916);
    float _926 = _904 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _928 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[4].z, _918);
    float _930 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[5].z, _920);
    float _932 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[6].z, _922);
    float _934 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[7].z, _924);
    float _936 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[4].w, _928);
    float _938 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[5].w, _930);
    float _940 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[6].w, _932);
    float _942 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[7].w, _934);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _950 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _954 = _940 + _942;
    float _956 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _954 * 0.5;
    out.m_39.w = _884;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_45.x = _956;
    out.m_45.y = _950;
    out.m_45.z = _958;
    out.m_45.w = _946;
    out.gl_Position.x = _936;
    out.gl_Position.y = _938;
    out.gl_Position.z = _940;
    out.gl_Position.w = _942;
    out.m_47.z = _960;
    out.m_47.w = _942;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    bool _144 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_26.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _74 = _72;
    float _76 = _74;
    if (!_70)
    {
        out.m_29.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _74 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1017 = as_type<float>(_82);
        out.gl_Position.z = _1017;
    }
    if (!_70)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _86 = in.m_31.w;
    bool _88 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _90 = isnan(_86);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _96 = _92 || _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _102 = 0.0;
    float _104 = _100;
    if (_96)
    {
        float _106 = float(_66);
        _102 = _106;
    }
    float _108 = _102;
    bool _110 = _100 >= _108;
    bool _112 = !_96;
    bool _114 = _110 || _112;
    if (_114)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _76;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _118 = _116 * 5.0;
        _84 = as_type<int>(_118);
    }
    int _120 = _84;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1086 = as_type<float>(_120);
        out.gl_Position.z = _1086;
    }
    if (_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _122 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _124 = !_122;
    float _142;
    if (!_124)
    {
        float _126 = in.m_33.x;
        float _128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _130 = _126 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _132 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _134 = _132 * _128;
        float _136 = floor(_134);
        float _138 = -_136;
        float _140 = _134 + _138;
        _142 = _140;
        _144 = true;
    }
    else
    {
        float _146 = float(_66);
        float _148 = 1.0 / _146;
        float _150 = _100 * _148;
        _142 = _150;
    }
    _144 = false;
    float _152 = _142;
    float _154 = in.m_35.x;
    float _156 = in.m_35.y;
    float _158 = in.m_35.z;
    float _160 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _162 = log2(_160);
    float _164 = in.m_33.x;
    float _166 = in.m_33.y;
    float _168 = in.m_33.z;
    float _170 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _170;
    float _174 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _176 = _174 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _178 = in.m_37.x;
    float _180 = 1.0 / _172;
    float _182 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _182;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _188 = _186 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _192 = _190 != 0;
    int _194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _196 = _194 != 0;
    int _198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _200 = _198 != 0;
    float _202 = in.m_37.y;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _206 = _152 + _204;
    bool _208 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _210 = isnan(0.0);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _216 = _212 || _214;
    float _218 = 1.0 / _176;
    float _220 = _162 * _100;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _152 + _222;
    bool _226 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _228 = isnan(1.0);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _234 = _230 || _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _238 = 1.0 + _236;
    float _240 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _154);
    float _242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _156);
    float _244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _158);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _152 + _246;
    float _250 = 1.0 / _188;
    float _252 = _166 + _168;
    float _254 = _168 + (-0.5);
    float _256 = _168 * 2.0;
    out.m_39.x = _178;
    float _258 = _224 * _180;
    float _260 = _248 * _218;
    float _262 = 1.0 / _184;
    float _264 = _168 + _164;
    float _266 = _166 + _164;
    float _268 = _252 + (-1.0);
    float _270 = _166 * 2.0;
    float _272 = _264 + (-1.0);
    float _274 = _164 + (-0.5);
    float _276 = _164 * 2.0;
    float _278 = exp2(_220);
    float _280 = _166 + (-0.5);
    out.m_39.y = _202;
    float _282 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _284 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _286 = 1.0 / _238;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = _152 + _288;
    float _292 = _266 + (-1.0);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _294;
    float _298 = _290 * _262;
    float _300 = -_278;
    float _302 = _300 + 1.0;
    float _304 = floor(_256);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _152 + _306;
    float _310 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _312 = _216 ? _302 : 0.0;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _314;
    float _318 = _308 * _250;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _324;
    float _328 = 1.0 / _296;
    if (_234)
    {
        float _330 = _312 * _286;
        _104 = _330;
    }
    float _332 = _104;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _338 = !_192;
    int _340 = _338 ? 0 : 1;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    float _354 = floor(_276);
    bool _356 = _304 >= 0.0;
    bool _358 = isnan(_304);
    bool _360 = _356 || _358;
    bool _362 = isnan(0.0);
    bool _364 = _360 || _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _370 = _304 > 0.0;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _372;
    int _376 = _364 ? 0 : 1;
    float _378 = fma(_336, _260, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _380 = fma(_344, _260, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _382 = floor(_270);
    float _384 = _206 * _328;
    float _386 = fma(_368, _260, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _392 = fma(_322, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _394 = fma(_326, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _396;
    bool _400 = _354 > 0.0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _406 = _354 >= 0.0;
    bool _408 = isnan(_354);
    bool _410 = _406 || _408;
    bool _412 = isnan(0.0);
    bool _414 = _410 || _412;
    float _416 = fma(_398, _298, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _418 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _420 = isnan(_152);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = fma(_352, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _432 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _434 = isnan(_152);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = fma(_348, _318, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _446 = _382 > 0.0;
    float _448 = -_428;
    float _450 = _448 + 1.0;
    bool _452 = _382 >= 0.0;
    bool _454 = isnan(_382);
    bool _456 = _452 || _454;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    float _462 = fma(_316, _298, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _464 = fma(_374, _298, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _466 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _468 = isnan(_152);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = -_442;
    float _480 = _478 + 1.0;
    float _482 = _476 * _450;
    float _484 = -_476;
    float _486 = _484 + 1.0;
    float _488 = fma(_404, _318, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _490 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _492 = isnan(_152);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = fma(_390, _318, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _504 = _442 * _486;
    bool _506 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _508 = isnan(_152);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _518;
    float _522 = -_500;
    float _524 = _522 + 1.0;
    bool _526 = _152 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _528 = isnan(_152);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = _500 * _480;
    float _540 = -_516;
    float _542 = _540 + 1.0;
    float _544 = _516 * _524;
    float _546 = in.m_41.x;
    float _548 = in.m_41.y;
    float _550 = in.m_41.z;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _556;
    int _560 = abs(_340);
    float _562 = _536 * _542;
    float _564 = fma(_554, _384, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _566 = fma(_558, _384, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    int _568 = ~_376;
    int _570 = _568 + 1;
    int _572 = _570 + 1;
    float _574 = fma(_520, _384, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _576 = _394 * _562;
    int _578 = _572;
    if (!_370)
    {
        int _580 = ~_376;
        int _582 = _580 + 1;
        _578 = _582;
    }
    int _584 = _578;
    float _586 = _392 * _562;
    float _588 = float(_560);
    float _590 = _430 * _562;
    float _592 = float(_584);
    float _594 = -_536;
    float _596 = _594 + 1.0;
    bool _598 = !_200;
    int _600 = _598 ? 0 : 1;
    int _602 = _460 ? 0 : 1;
    float _604 = _588 * _592;
    int _606 = abs(_600);
    float _608 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[143].x, _586);
    int _610 = ~_602;
    int _612 = _610 + 1;
    int _614 = _612 + 1;
    float _616 = _604 * (-2.0);
    int _618 = _614;
    if (!_446)
    {
        int _620 = ~_602;
        int _622 = _620 + 1;
        _618 = _622;
    }
    int _624 = _618;
    float _626 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[143].y, _576);
    float _628 = fma(_616, _546, _546);
    float _630 = float(_624);
    float _632 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[143].z, _590);
    float _634 = float(_606);
    float _636 = fma(_310, _616, _310);
    int _638 = _414 ? 0 : 1;
    float _640 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[196].x, _628);
    bool _642 = !_196;
    int _644 = _642 ? 0 : 1;
    float _646 = _634 * _630;
    int _648 = ~_638;
    int _650 = _648 + 1;
    int _652 = _650 + 1;
    float _654 = fma(_378, _544, _608);
    int _656 = abs(_644);
    float _658 = _646 * (-2.0);
    int _660 = _652;
    if (!_400)
    {
        int _662 = ~_638;
        int _664 = _662 + 1;
        _660 = _664;
    }
    int _666 = _660;
    float _668 = fma(_636, _332, _640);
    float _670 = float(_656);
    float _672 = fma(_658, _550, _550);
    float _674 = float(_666);
    float _676 = fma(_284, _658, _284);
    float _678 = fma(_386, _544, _632);
    float _680 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[196].z, _672);
    float _682 = fma(_416, _538, _654);
    float _684 = in.m_26.x;
    float _686 = in.m_26.y;
    float _688 = in.m_26.z;
    float _690 = _670 * _674;
    float _692 = fma(_676, _332, _680);
    float _694 = fma(_380, _544, _626);
    float _696 = fma(_464, _538, _678);
    float _698 = _690 * (-2.0);
    float _700 = _692 * 0.15915493667125701904296875;
    float _702 = fma(_462, _538, _694);
    float _704 = _668 * 0.15915493667125701904296875;
    float _706 = fma(_698, _548, _548);
    float _708 = fma(_282, _698, _282);
    float _710 = in.m_43.x;
    float _712 = in.m_43.y;
    float _714 = in.m_43.z;
    float _716 = fma(_488, _504, _682);
    float _718 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[196].y, _706);
    float _720 = fma(_444, _504, _702);
    float _722 = fma(_502, _504, _696);
    float _724 = _704 * 6.283185482025146484375;
    float _726 = sin(_724);
    float _728 = fma(_708, _332, _718);
    float _730 = fma(_564, _482, _716);
    float _732 = fma(_566, _482, _720);
    float _734 = fma(_574, _482, _722);
    float _736 = _728 * 0.15915493667125701904296875;
    float _738 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[148].x, _730);
    float _740 = _704 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = _686 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _746 = _686 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _748 = _686 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _750 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[148].z, _734);
    float _752 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[4].x, _744);
    float _754 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[5].x, _746);
    float _756 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[6].x, _748);
    float _758 = _700 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[148].y, _732);
    float _764 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[4].z, _752);
    float _766 = _738 * _710;
    float _768 = _750 * _714;
    float _770 = _762 * _712;
    float _772 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[5].z, _754);
    float _774 = _766 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _776 = _700 * 6.283185482025146484375;
    float _778 = cos(_776);
    float _780 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _782 = _768 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _784 = _774 * _240;
    float _786 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[6].z, _756);
    float _788 = _780 * _242;
    float _790 = _782 * _244;
    float _792 = _772 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _794 = _736 * 6.283185482025146484375;
    float _796 = sin(_794);
    float _798 = _726 * _760;
    float _800 = _742 * _760;
    float _802 = _764 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _804 = _786 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _806 = in.m_37.z;
    float _808 = _736 * 6.283185482025146484375;
    float _810 = cos(_808);
    float _812 = _742 * _778;
    float _814 = _726 * _778;
    float _816 = fma(_796, _798, _812);
    float _818 = -_800;
    float _820 = fma(_796, _814, _818);
    float _822 = -_814;
    float _824 = fma(_796, _800, _822);
    float _826 = _816 * _788;
    float _828 = _820 * _788;
    float _830 = _796 * _784;
    float _832 = fma(_796, _812, _798);
    float _834 = _810 * _784;
    float _836 = _726 * _810;
    float _838 = _742 * _810;
    float _840 = fma(_760, _834, _826);
    float _842 = fma(_778, _834, _828);
    float _844 = -_830;
    float _846 = fma(_836, _788, _844);
    out.m_39.z = _806;
    float _848 = fma(_824, _790, _840);
    float _850 = fma(_832, _790, _842);
    float _852 = fma(_838, _790, _846);
    float _854 = _848 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _856 = _848 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _858 = _848 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _860 = fma(_850, (*spvDescriptorSet0.vp_c10)._m0[9].x, _854);
    float _862 = fma(_850, (*spvDescriptorSet0.vp_c10)._m0[8].x, _856);
    float _864 = fma(_850, (*spvDescriptorSet0.vp_c10)._m0[10].x, _858);
    float _866 = fma(_852, (*spvDescriptorSet0.vp_c10)._m0[9].z, _860);
    float _868 = fma(_852, (*spvDescriptorSet0.vp_c10)._m0[8].z, _862);
    float _870 = fma(_852, (*spvDescriptorSet0.vp_c10)._m0[10].z, _864);
    float _872 = _792 + _866;
    float _874 = _802 + _868;
    float _876 = _804 + _870;
    float _878 = _872 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _880 = _872 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _882 = _872 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _884 = in.m_37.w;
    float _886 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[1].x, _878);
    float _888 = _872 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _890 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[0].x, _880);
    float _892 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[2].x, _882);
    float _894 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[1].z, _886);
    float _896 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[3].x, _888);
    float _898 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[0].z, _890);
    float _900 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[2].z, _892);
    float _902 = _894 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _904 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[3].z, _896);
    float _906 = _898 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _908 = _900 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _910 = _902 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _912 = _902 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _914 = _902 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _916 = _902 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _918 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[4].x, _910);
    float _920 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[5].x, _912);
    float _922 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[6].x, _914);
    float _924 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[7].x, _916);
    float _926 = _904 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _928 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[4].z, _918);
    float _930 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[5].z, _920);
    float _932 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[6].z, _922);
    float _934 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[7].z, _924);
    float _936 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[4].w, _928);
    float _938 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[5].w, _930);
    float _940 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[6].w, _932);
    float _942 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[7].w, _934);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _950 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _954 = _940 + _942;
    float _956 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _954 * 0.5;
    out.m_39.w = _884;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_45.x = _956;
    out.m_45.y = _950;
    out.m_45.z = _958;
    out.m_45.w = _946;
    out.gl_Position.x = _936;
    out.gl_Position.y = _938;
    out.gl_Position.z = _940;
    out.gl_Position.w = _942;
    out.m_47.z = _960;
    out.m_47.w = _942;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

