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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_53 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_47 [[attribute(1)]];
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_45 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
    float4 m_43 [[attribute(9)]];
    float4 m_49 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1757 = false;
    bool _366 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_32.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _84;
    float _88 = _86;
    if (!_82)
    {
        out.m_35.x = 0.0;
    }
    int _90 = 0;
    if (!_82)
    {
        float _92 = _86 * 5.0;
        _90 = as_type<int>(_92);
    }
    int _94 = _90;
    int _96 = _94;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1940 = as_type<float>(_94);
        out.gl_Position.z = _1940;
    }
    if (!_82)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _98 = in.m_37.w;
    bool _100 = _98 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_98);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    float _110 = -_98;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _114 = _112;
    if (_108)
    {
        float _116 = float(_78);
        _88 = _116;
    }
    float _118 = _88;
    bool _120 = _112 >= _118;
    bool _122 = !_108;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_35.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _96 = as_type<int>(_130);
    }
    int _132 = _96;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2010 = as_type<float>(_132);
        out.gl_Position.z = _2010;
    }
    if (_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_39.x;
    float _136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _138 = _112 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _140 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = _138 * _136;
    float _154 = 0.0;
    if (!_150)
    {
        float _156 = _140 * _140;
        float _158 = _156 * 0.5;
        _154 = _158;
    }
    float _160 = _154;
    float _162 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[20].x, _152);
    float _164 = _160;
    if (!_150)
    {
        float _166 = _160 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _166;
    }
    float _168 = _164;
    float _170 = in.m_37.x;
    float _172 = in.m_37.y;
    float _174 = in.m_37.z;
    float _176 = _162 * 6.283185482025146484375;
    float _178 = floor(_162);
    float _180 = _176 * 0.15915493667125701904296875;
    int _182 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _184 = _182 != 0;
    float _186 = _180 * 6.283185482025146484375;
    float _188 = cos(_186);
    float _190 = 1.4012984643248170709237295832899e-45;
    float _192 = _168;
    if (!_150)
    {
        _190 = _140;
    }
    float _194 = _190;
    float _196 = -_178;
    float _198 = _162 + _196;
    bool _200 = !_150;
    float _202 = _194;
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _140 * _206;
        float _216 = 1.0 / _210;
        float _218 = _212 * 0.693147182464599609375;
        float _220 = exp2(_214);
        float _222 = 1.0 / _218;
        float _224 = _220 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _222, _140);
        float _230 = _228 * _216;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _232;
    }
    float _234 = _192;
    bool _236 = !_150;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _140 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _202 = _256;
    }
    float _258 = _202;
    float _260 = in.m_41.w;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _264 = _262 != 0;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _268 = _266 != 0;
    float _270 = in.m_32.x;
    float _272 = in.m_32.y;
    float _274 = in.m_32.z;
    bool _276 = _198 < 0.5;
    float _278 = float(_276);
    float _280 = -_198;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _284 = !_264;
    int _286 = _284 ? 0 : 1;
    float _288 = -_278;
    float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _292 = !_184;
    int _294 = _292 ? 0 : 1;
    float _296 = fma(_188, 0.5, 0.5);
    int _298 = abs(_286);
    float _300 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _302 = abs(_294);
    float _304 = -_296;
    float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _308 = fma(_258, _170, _300);
    bool _310 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _312 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _314 = !_268;
    int _316 = _314 ? 0 : 1;
    float _318 = float(_298);
    float _320 = fma(_258, _172, _312);
    int _322 = abs(_316);
    float _324 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _326 = float(_302);
    float _328 = abs(_282);
    float _330 = _318 * _328;
    float _332 = float(_322);
    float _334 = fma(_258, _174, _324);
    float _336 = fma(_308, _260, _270);
    float _338 = fma(_326, _306, _330);
    float _340 = fma(_320, _260, _272);
    float _342 = fma(_334, _260, _274);
    float _344 = abs(_290);
    float _346 = fma(_332, _344, _338);
    bool _348 = !_310;
    float _364;
    if (!_348)
    {
        float _350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _352 = _134 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[11].w, _112);
        float _356 = _354 * _350;
        float _358 = floor(_356);
        float _360 = -_358;
        float _362 = _356 + _360;
        _364 = _362;
        _366 = true;
    }
    else
    {
        float _368 = float(_78);
        float _370 = 1.0 / _368;
        float _372 = _112 * _370;
        _364 = _372;
    }
    _366 = false;
    float _374 = _364;
    float _376 = in.m_39.y;
    float _378 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _380 = log2(_378);
    float _382 = _134 * 2.0;
    float _384 = in.m_43.y;
    float _386 = _134 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _390 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _392 = int(_390);
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _396 = _394 != 0;
    float _398 = _340 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _402 = _400 != 0;
    float _404 = _340 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _406 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _408 = isnan(0.0);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _414 = _410 || _412;
    float _416 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[5].x, _398);
    float _418 = _380 * _112;
    float _420 = floor(_382);
    float _422 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[6].x, _404);
    float _424 = _376 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _426 = float(_392);
    float _428 = exp2(_418);
    bool _430 = _376 > 0.5;
    float _432 = fma(_424, -2.0, _388);
    float _434 = -_384;
    float _436 = _434 + 1.0;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _440 = _376 * 2.0;
    bool _442 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _444 = isnan(1.0);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _450 = _446 || _448;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _454 = int(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _458 = 1.0 + _456;
    float _460 = _384;
    if (_396)
    {
        float _462 = _430 ? _436 : _384;
        _460 = _462;
    }
    float _464 = _460;
    float _466 = -_438;
    float _468 = fma(_386, 2.0, _466);
    bool _470 = _420 > 0.0;
    float _472 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _432);
    bool _474 = _420 >= 0.0;
    bool _476 = isnan(_420);
    bool _478 = _474 || _476;
    bool _480 = isnan(0.0);
    bool _482 = _478 || _480;
    float _484 = -_112;
    float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[76].x, _468);
    float _488 = 1.0 / _426;
    float _490 = -_428;
    float _492 = _490 + 1.0;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _496 = _414 ? _492 : 0.0;
    float _498 = 1.0 / _458;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _502 = float(_454);
    float _504 = in.m_45.x;
    float _506 = in.m_45.y;
    float _508 = in.m_45.z;
    float _510 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[78].z, _494);
    float _512 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[78].w, _500);
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _520 = _518 != 0;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _524 = _522 != 0;
    float _526 = _502 * _112;
    float _528 = float(uint(_454));
    float _530 = floor(_440);
    float _532 = _488 * _112;
    float _534 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _510);
    float _536 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _512);
    bool _538 = !_520;
    int _540 = _538 ? 0 : 1;
    if (_450)
    {
        float _542 = _496 * _498;
        _114 = _542;
    }
    float _544 = _114;
    float _546 = 1.0 / _528;
    float _548 = in.m_41.x;
    float _550 = in.m_41.y;
    float _552 = in.m_41.z;
    float _554 = _340 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _556 = _482 ? 0 : 1;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _560 = _558 != 0;
    float _562 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[4].x, _554);
    float _564 = trunc(_532);
    int _566 = int(_564);
    int _568 = ~_556;
    int _570 = _568 + 1;
    int _572 = _570 + 1;
    float _574 = in.m_39.z;
    int _576 = _572;
    if (!_470)
    {
        int _578 = ~_556;
        int _580 = _578 + 1;
        _576 = _580;
    }
    int _582 = _576;
    float _584 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _504);
    bool _586 = _530 >= 0.0;
    bool _588 = isnan(_530);
    bool _590 = _586 || _588;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    float _596 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _506);
    float _598 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _508);
    float _600 = float(_78);
    float _602 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].z, _562);
    int _604 = _594 ? 0 : 1;
    bool _606 = _530 > 0.0;
    int _608 = as_type<int>(_546) + (-2);
    float _610 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].z, _416);
    float _612 = float(uint(_566));
    float _614 = _550 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _616 = ~_604;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = _552 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _626 = _624 != 0;
    float _628 = as_type<float>(_608) * _612;
    float _630 = _548 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _632 = ~_454;
    int _634 = _632 + 1;
    float _636 = 1.0 / _600;
    int _638 = _620;
    if (!_606)
    {
        int _640 = ~_604;
        int _642 = _640 + 1;
        _638 = _642;
    }
    int _644 = _638;
    float _646 = _574 * 2.0;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _650 = _648 != 0;
    float _652 = _346 * _614;
    float _654 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].z, _422);
    bool _656 = !_516;
    int _658 = _656 ? 0 : 1;
    float _660 = trunc(_628);
    float _662 = precise::max(_660, 0.0);
    uint _665 = uint(_662);
    bool _667 = !_524;
    int _669 = _667 ? 0 : 1;
    float _671 = _346 * _622;
    int _673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _675 = _673 != 0;
    int _677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _679 = _677 != 0;
    int _681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _683 = _681 != 0;
    float _685 = _346 * _630;
    bool _687 = !_402;
    float _689 = _687 ? 7.345489978790283203125 : 1.0;
    float _691 = _671 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _693 = floor(_646);
    float _695 = _689 * _134;
    float _697 = float(_566);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _703 = _526 * _636;
    float _705 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    bool _707 = !_679;
    int _709 = _707 ? 0 : 1;
    int _711 = _634 * int(_665);
    int _713 = _711 + _566;
    float _715 = 1.0 / _701;
    float _717 = _691 * _598;
    float _719 = float(_644);
    float _721 = float(uint(_713));
    float _723 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _705);
    bool _725 = _693 >= 0.0;
    bool _727 = isnan(_693);
    bool _729 = _725 || _727;
    bool _731 = isnan(0.0);
    bool _733 = _729 || _731;
    float _735 = floor(_695);
    float _737 = _134 + _376;
    float _739 = as_type<float>(_608) * _721;
    int _741 = _733 ? 0 : 1;
    bool _743 = _693 > 0.0;
    float _745 = _737 + (-1.0);
    float _747 = _376 + _574;
    float _749 = trunc(_739);
    float _751 = precise::max(_749, 0.0);
    uint _753 = uint(_751);
    float _755 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _757 = _747 + (-1.0);
    int _759 = ~_741;
    int _761 = _759 + 1;
    int _763 = _761 + 1;
    float _765 = _376 + (-0.5);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _767;
    int _771 = abs(_658);
    float _773 = -_735;
    float _775 = _695 + _773;
    bool _777 = _697 >= _502;
    bool _779 = isnan(_697);
    bool _781 = _777 || _779;
    bool _783 = isnan(_502);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _791 = _763;
    if (!_743)
    {
        int _793 = ~_741;
        int _795 = _793 + 1;
        _791 = _795;
    }
    int _797 = _791;
    float _799 = _775 * _502;
    bool _801 = !_683;
    int _803 = _801 ? 0 : 1;
    float _805 = _769 * _715;
    int _807 = abs(_709);
    float _809 = trunc(_703);
    int _811 = int(_809);
    int _813 = int(_665) + int(_753);
    float _815 = in.m_47.x;
    float _817 = in.m_47.y;
    float _819 = in.m_47.z;
    bool _821 = !_675;
    int _823 = _821 ? 0 : 1;
    int _825 = abs(_803);
    int _827 = abs(_823);
    float _829 = float(_582);
    float _831 = float(_807);
    int _833 = ~_454;
    int _835 = _833 + 1;
    float _837 = float(_825);
    float _839 = _831 * _829;
    float _841 = float(_827);
    int _843 = _835 * _813;
    int _845 = _843 + _566;
    float _847 = float(_797);
    float _849 = _837 * _719;
    float _851 = _839 * (-2.0);
    float _853 = trunc(_799);
    int _855 = int(_853);
    bool _857 = uint(_845) >= uint(_454);
    float _859 = _841 * _847;
    bool _861 = !_560;
    int _863 = _861 ? 0 : 1;
    float _865 = fma(_789, _851, _789);
    bool _867 = !_857;
    int _869 = _867 ? 0 : (-1);
    float _871 = fma(_851, _817, _817);
    int _873 = abs(_863);
    float _875 = trunc(_787);
    int _877 = int(_875);
    float _879 = _859 * (-2.0);
    int _881 = ~_813;
    int _883 = _881 + _869;
    int _885 = _883 + 1;
    float _887 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[196].y, _871);
    float _889 = fma(_755, _879, _755);
    float _891 = fma(_879, _815, _815);
    bool _893 = _454 == 0;
    float _895 = _610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _897 = _855 * _873;
    int _899 = _897 + _566;
    float _901 = _602 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _903 = _454 * _885;
    int _905 = _903 + _566;
    float _907 = _134 + (-0.5);
    float _909 = -_895;
    float _911 = _909 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _913 = fma(_865, _544, _887);
    float _915 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[196].x, _891);
    int _917 = ~_877;
    int _919 = _917 + 1;
    int _921 = _919 + 1;
    float _923 = _911 * _911;
    bool _925 = !_893;
    int _927 = _925 ? _905 : (-1);
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _933 = _454 + (-1);
    float _935 = fma(_889, _544, _915);
    int _937 = _927 * _921;
    float _939 = -_901;
    float _941 = _939 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _943 = _654 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _945 = 1.0 / _931;
    int _947 = _877 * _933;
    int _949 = _947 + _937;
    float _951 = fma(_941, _941, _923);
    int _953 = abs(_540);
    float _955 = -_943;
    float _957 = _955 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _959 = abs(_669);
    float _961 = _935 * 0.15915493667125701904296875;
    bool _963 = !_650;
    int _965 = _963 ? 0 : 1;
    int _967 = _949 * _953;
    float _969 = _913 * 0.15915493667125701904296875;
    float _971 = fma(_957, _957, _951);
    int _973 = abs(_965);
    int _975 = _811 * _771;
    int _977 = _975 + _967;
    float _979 = _134 + _574;
    float _981 = _574 + (-0.5);
    bool _983 = _134 > 0.5;
    bool _985 = _983 && _626;
    int _987 = _899 * _959;
    int _989 = _987 + _977;
    float _991 = _979 + (-1.0);
    float _993 = rsqrt(_971);
    int _995 = _855 * _973;
    int _997 = _995 + _989;
    float _999 = _849 * (-2.0);
    float _1001 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _723);
    float _1003 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _464, -0.5);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1007 = float(uint(_997));
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1013 = fma(_999, _819, _819);
    float _1015 = fma(_1005, _999, _1005);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1019 = _374 + _1017;
    float _1021 = as_type<float>(_608) * _1007;
    float _1023 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1013);
    int _1025 = ~_454;
    int _1027 = _1025 + 1;
    float _1029 = fma(_805, _1019, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1031 = trunc(_1021);
    float _1033 = precise::max(_1031, 0.0);
    uint _1035 = uint(_1033);
    float _1037 = fma(_1015, _544, _1023);
    float _1039 = _685 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1041 = _941 * _993;
    float _1043 = _911 * _993;
    float _1045 = _957 * _993;
    float _1047 = -_472;
    float _1049 = fma(_536, _1003, _1047);
    float _1051 = _1037 * 0.15915493667125701904296875;
    float _1053 = _969 * 6.283185482025146484375;
    float _1055 = sin(_1053);
    float _1057 = _1039 * _584;
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1061 = _1041 * _1059;
    float _1063 = _1011 * _945;
    float _1065 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1067 = _1045 * _1065;
    float _1069 = _652 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1073 = -_1061;
    float _1075 = fma(_1045, _1071, _1073);
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1079 = _1043 * _1077;
    int _1081 = _1027 * int(_1035);
    int _1083 = _1081 + _997;
    float _1085 = _969 * 6.283185482025146484375;
    float _1087 = cos(_1085);
    float _1089 = _1069 * _596;
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1093 = -_1079;
    float _1095 = fma(_1041, _1091, _1093);
    float _1097 = float(uint(_1083));
    float _1099 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1101 = -_1067;
    float _1103 = fma(_1043, _1099, _1101);
    float _1105 = _1075 * _1075;
    float _1107 = _961 * 6.283185482025146484375;
    float _1109 = sin(_1107);
    float _1111 = as_type<float>(_608) * _1097;
    float _1113 = fma(_1103, _1103, _1105);
    float _1115 = fma(_1095, _1095, _1113);
    float _1117 = _961 * 6.283185482025146484375;
    float _1119 = cos(_1117);
    float _1121 = _1051 * 6.283185482025146484375;
    float _1123 = cos(_1121);
    float _1125 = _1109 * _1087;
    float _1127 = _1109 * _1055;
    float _1129 = _1051 * 6.283185482025146484375;
    float _1131 = sin(_1129);
    float _1133 = _1119 * _1055;
    float _1135 = _1119 * _1087;
    float _1137 = trunc(_1111);
    float _1139 = precise::max(_1137, 0.0);
    uint _1141 = uint(_1139);
    float _1143 = _1123 * _1089;
    float _1145 = _1087 * _1123;
    float _1147 = _1055 * _1123;
    int _1149 = ~_454;
    int _1151 = _1149 + 1;
    float _1153 = _1119 * _1143;
    float _1155 = -_1133;
    float _1157 = fma(_1131, _1125, _1155);
    float _1159 = -_1125;
    float _1161 = fma(_1131, _1133, _1159);
    float _1163 = -_1089;
    float _1165 = _1131 * _1163;
    float _1167 = float(uint(_899));
    float _1169 = rsqrt(_1115);
    float _1171 = fma(_1131, _1135, _1127);
    float _1173 = fma(_1145, _1057, _1165);
    float _1175 = fma(_1131, _1127, _1135);
    int _1177 = int(_1035) + int(_1141);
    float _1179 = as_type<float>(_608) * _1167;
    float _1181 = _1109 * _1143;
    float _1183 = sqrt(_1001);
    int _1185 = _1151 * _1177;
    int _1187 = _1185 + _997;
    float _1189 = fma(_1157, _1057, _1181);
    bool _1191 = uint(_1187) >= uint(_454);
    float _1193 = fma(_1175, _717, _1189);
    float _1195 = trunc(_1179);
    float _1197 = precise::max(_1195, 0.0);
    uint _1199 = uint(_1197);
    float _1201 = _1103 * _1169;
    float _1203 = _1075 * _1169;
    float _1205 = fma(_1171, _1057, _1153);
    bool _1207 = !_1191;
    int _1209 = _1207 ? 0 : (-1);
    float _1211 = _1095 * _1169;
    float _1213 = _1045 * _1203;
    int _1215 = ~_454;
    int _1217 = _1215 + 1;
    float _1219 = fma(_1161, _717, _1205);
    int _1221 = ~_1177;
    int _1223 = _1221 + _1209;
    int _1225 = _1223 + 1;
    float _1227 = _1043 * _1201;
    float _1229 = -_1213;
    float _1231 = fma(_1043, _1211, _1229);
    float _1233 = fma(_1147, _717, _1173);
    float _1235 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1237 = _374 + _1235;
    float _1239 = -_1227;
    float _1241 = fma(_1041, _1203, _1239);
    float _1243 = _1231 * _1219;
    int _1245 = _1217 * int(_1199);
    int _1247 = _1245 + _899;
    float _1249 = in.m_43.x;
    float _1251 = _1241 * _1219;
    int _1253 = _454 * _1225;
    int _1255 = _1253 + _997;
    float _1257 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1259 = float(uint(_1247));
    float _1261 = fma(_1201, _1233, _1243);
    float _1263 = fma(_1063, _1237, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1265 = fma(_1211, _1233, _1251);
    bool _1267 = !_893;
    int _1269 = _1267 ? _1255 : (-1);
    float _1271 = fma(_1041, _1193, _1261);
    bool _1273 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1275 = isnan(_374);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1281 = _1277 || _1279;
    float _1283 = float(_1281);
    float _1285 = fma(_1045, _1193, _1265);
    int _1287 = _1269 >> 31;
    float _1289 = _901 + _1271;
    float _1291 = as_type<float>(_608) * _1259;
    float _1293 = _943 + _1285;
    int _1295 = _1287 & 3;
    float _1297 = fma(_1257, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1289);
    bool _1299 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1301 = isnan(_374);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1307 = _1303 || _1305;
    float _1309 = float(_1307);
    float _1311 = fma(_1257, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1293);
    int _1313 = _1269 + _1295;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1317 = _1297 + _1315;
    bool _1319 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1321 = isnan(_374);
    bool _1323 = _1319 || _1321;
    bool _1325 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1327 = _1323 || _1325;
    float _1329 = float(_1327);
    float _1331 = -_1283;
    float _1333 = _1331 + 1.0;
    int _1335 = _1313 >> 2;
    float _1337 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1339 = _1311 + _1337;
    float _1341 = as_type<float>(_1141);
    float _1343 = _1157;
    if (_626)
    {
        _1341 = _1249;
    }
    float _1345 = _1341;
    float _1347 = _1329 * _1333;
    int _1349 = _1335 << 4;
    int _1351 = _1349 + 368;
    float _1353 = _1041 * _1211;
    float _1355 = _1345;
    if (!_626)
    {
        _1343 = _1249;
    }
    float _1357 = _1343;
    float _1359 = trunc(_1291);
    float _1361 = precise::max(_1359, 0.0);
    uint _1363 = uint(_1361);
    uint _1365 = uint(int(uint(_1351) >> uint(2)));
    uint _1367 = uint(int(uint(int(_1365)) >> uint(2)));
    int _1369 = int(_1365) & 3;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[int(_1367)][_1369];
    int _1373 = int(_1365) + 1;
    uint _1375 = uint(int(uint(_1373) >> uint(2)));
    int _1377 = _1373 & 3;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[int(_1375)][_1377];
    float _1381 = _1317 * _1317;
    float _1383 = _1339 * _1339;
    float _1385 = _1357;
    float _1387 = _1381;
    float _1389 = _1383;
    if (_985)
    {
        float _1391 = -_1345;
        float _1393 = _1391 + 1.0;
        _1355 = _1393;
    }
    float _1395 = _1355;
    float _1397 = -_1353;
    float _1399 = fma(_1045, _1201, _1397);
    int _1401 = ~_454;
    int _1403 = _1401 + 1;
    float _1405 = _1381 + _1383;
    float _1407 = -_1329;
    float _1409 = _1407 + 1.0;
    int _1411 = _1351 + 8;
    uint _1413 = uint(int(uint(_1411) >> uint(2)));
    uint _1415 = uint(int(uint(int(_1413)) >> uint(2)));
    int _1417 = int(_1413) & 3;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[int(_1415)][_1417];
    int _1421 = int(_1413) + 1;
    uint _1423 = uint(int(uint(_1421) >> uint(2)));
    int _1425 = _1421 & 3;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[int(_1423)][_1425];
    float _1429 = _1399 * _1219;
    float _1431 = sqrt(_1405);
    if (_626)
    {
        _1385 = _1395;
    }
    float _1433 = _1385;
    float _1435 = _1309 * _1409;
    float _1437 = fma(_1203, _1233, _1429);
    int _1439 = _1269 & 3;
    bool _1441 = _1439 != 0;
    float _1443 = _1029 * _1435;
    int _1445 = int(_1199) + int(_1363);
    float _1447 = fma(_1043, _1193, _1437);
    bool _1449 = uint(_1439) > 1u;
    float _1451 = -_1309;
    float _1453 = _1451 + 1.0;
    int _1455 = _1269 & 3;
    bool _1457 = _1455 != 0;
    int _1459 = _1403 * _1445;
    int _1461 = _1459 + _899;
    float _1463 = _895 + _1447;
    float _1465 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1443);
    bool _1467 = _1431 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1469 = fma(_1257, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1463);
    bool _1471 = uint(_1461) >= uint(_454);
    float _1473 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1475 = _1457 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1477 = uint(_1439) >= 2u;
    int _1479 = ~as_type<int>(_1475);
    int _1481 = _1479 + 1;
    int _1483 = _1481 + 1;
    int _1485 = _1483;
    float _1487 = _1447;
    float _1489 = _1475;
    if (!_1449)
    {
        int _1491 = ~as_type<int>(_1475);
        int _1493 = _1491 + 1;
        _1485 = _1493;
    }
    int _1495 = _1485;
    bool _1497 = !_1471;
    int _1499 = _1497 ? 0 : (-1);
    int _1501 = abs(_1495);
    int _1503 = _1477 ? 0 : 1;
    float _1505 = as_type<float>(_1495);
    if (!_1467)
    {
        _1505 = _1297;
    }
    float _1507 = _1505;
    int _1509 = ~_1445;
    int _1511 = _1509 + _1499;
    int _1513 = _1511 + 1;
    bool _1515 = _1439 != 3;
    float _1517 = _1507;
    if (!_1467)
    {
        _1487 = _1311;
    }
    float _1519 = _1487;
    bool _1521 = !_1441;
    int _1523 = _1521 ? 0 : 1;
    int _1525 = ~_1503;
    int _1527 = _1525 + 1;
    int _1529 = _1527 + 1;
    int _1531 = ~_1501;
    int _1533 = _1531 + 1;
    int _1535 = _1533 + 1;
    float _1537 = _1519;
    int _1539 = _1529;
    if (!_1467)
    {
        _1489 = _1469;
    }
    float _1541 = _1489;
    bool _1543 = !_1467;
    float _1545 = _1541;
    if (!_1543)
    {
        float _1547 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1551 = _1431 + _1549;
        float _1553 = rsqrt(_1405);
        float _1555 = _1551 * _1547;
        float _1557 = _1469 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = _1555 * 0.15915493667125701904296875;
        float _1561 = _1559 * 6.283185482025146484375;
        float _1563 = sin(_1561);
        float _1565 = _1559 * 6.283185482025146484375;
        float _1567 = cos(_1565);
        float _1569 = fma(_1563, _1557, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1571 = _1553 * _1569;
        float _1573 = _1567 + (-1.0);
        float _1575 = fma(_1317, _1571, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1577 = fma(_1339, _1571, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1579 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1583 = _1575 + _1581;
        float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1587 = _1577 + _1585;
        float _1589 = fma(_1469, _1567, _1579);
        float _1591 = _1583 * _1583;
        float _1593 = _1587 * _1587;
        _1545 = _1589;
        _1387 = _1591;
        _1389 = _1593;
        _1517 = _1575;
        _1537 = _1577;
    }
    float _1595 = _1545;
    float _1597 = _1387;
    float _1599 = _1389;
    float _1601 = _1517;
    float _1603 = _1537;
    bool _1605 = _1439 != 3;
    int _1607 = _1535 * as_type<int>(_1379);
    if (_1515)
    {
        int _1609 = ~_1503;
        int _1611 = _1609 + 1;
        _1539 = _1611;
    }
    int _1613 = _1539;
    float _1615 = in.m_49.w;
    int _1617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1619 = _1617 != 0;
    int _1621 = _454 * _1513;
    int _1623 = _1621 + _899;
    bool _1625 = !_1605;
    int _1627 = _1625 ? 0 : (-1);
    float _1629 = fma(_1263, _1347, _1465);
    int _1631 = abs(_1523);
    float _1633 = fma(_534, _1473, _486);
    int _1635 = abs(_1613);
    float _1637 = fma(_1283, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1629);
    bool _1639 = !_1619;
    int _1641 = _1639 ? 0 : 1;
    float _1643 = _1049 + 0.5;
    int _1645 = abs(_1627);
    float _1647 = _1633 + 0.5;
    int _1649 = ~_1631;
    int _1651 = _1649 + 1;
    int _1653 = _1651 + 1;
    float _1655 = _1637 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1657 = abs(_1641);
    int _1659 = _1653 * as_type<int>(_1371);
    int _1661 = _1659 + _1607;
    int _1663 = ~_1635;
    int _1665 = _1663 + 1;
    int _1667 = _1665 + 1;
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1671 = _1595 + _1669;
    out.m_51.x = _1647;
    out.m_51.y = _1643;
    int _1673 = ~_1645;
    int _1675 = _1673 + 1;
    int _1677 = _1675 + 1;
    int _1679 = _1667 * as_type<int>(_1419);
    int _1681 = _1679 + _1661;
    float _1683 = fma(_1671, _1671, _1597);
    int _1685 = ~_1657;
    int _1687 = _1685 + 1;
    int _1689 = _1687 + 1;
    out.m_53.w = _1615;
    int _1691 = _1677 * as_type<int>(_1427);
    int _1693 = _1691 + _1681;
    float _1695 = _1683 + _1599;
    bool _1697 = !_893;
    int _1699 = _1697 ? _1623 : (-1);
    out.m_55.w = _1655;
    int _1701 = _1693 * _1689;
    float _1703 = sqrt(_1695);
    int _1705 = _1699 * _1657;
    int _1707 = _1705 + _1701;
    float _1709 = float(_1707);
    out.m_57.x = _1709;
    bool _1711 = _1703 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1713 = isnan(_1703);
    bool _1715 = _1711 || _1713;
    bool _1717 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1719 = _1715 || _1717;
    float _1721 = as_type<float>(_1707);
    if (!_1719)
    {
        _1721 = 1.0;
    }
    float _1723 = _1721;
    bool _1725 = !_1719;
    float _1727 = _1723;
    if (!_1725)
    {
        bool _1729 = _1703 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1731 = isnan(_1703);
        bool _1733 = _1729 || _1731;
        bool _1735 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1737 = _1733 || _1735;
        if (!_1737)
        {
            float _1739 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1741 = _1703 + _1739;
            float _1743 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1745 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1743;
            float _1747 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1749 = _1747 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1751 = 1.0 / _1745;
            float _1753 = _1741 * _1751;
            float _1755 = fma(_1753, _1749, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1727 = _1755;
            _1757 = true;
        }
        else
        {
            bool _1759 = _1703 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1761 = isnan(_1703);
            bool _1763 = _1759 || _1761;
            bool _1765 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1767 = _1763 || _1765;
            if (!_1767)
            {
                float _1769 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1771 = _1703 + _1769;
                float _1773 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1775 = _1773 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1777 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1779 = _1777 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1781 = 1.0 / _1775;
                float _1783 = _1771 * _1781;
                float _1785 = fma(_1783, _1779, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1727 = _1785;
                _1757 = true;
            }
            else
            {
                _1727 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1757 = false;
    float _1787 = _1727;
    float _1789 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1791 = _1595 + _1789;
    float _1793 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1795 = _1601 + _1793;
    float _1797 = fma(_1791, _1787, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1799 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1801 = _1603 + _1799;
    float _1803 = fma(_1795, _1787, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1805 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1807 = fma(_1801, _1787, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1809 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1811 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1813 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1805);
    float _1815 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1817 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1809);
    float _1819 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1811);
    float _1821 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1813);
    float _1823 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1815);
    float _1825 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1817);
    float _1827 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1819);
    float _1829 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1831 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1823);
    float _1833 = _1825 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1835 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1837 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1839 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1841 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1843 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1845 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1837);
    float _1847 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1839);
    float _1849 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1841);
    float _1851 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1843);
    float _1853 = _1831 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1855 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1845);
    float _1857 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1847);
    float _1859 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1849);
    float _1861 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1851);
    float _1863 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1855);
    float _1865 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1857);
    float _1867 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1859);
    float _1869 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1861);
    float _1871 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1873 = _1863 + _1869;
    float _1875 = _1867 + _1869;
    float _1877 = _1869 * 0.5;
    float _1879 = _1873 * 0.5;
    float _1881 = _1875 * 0.5;
    float _1883 = fma(_1865, -0.5, _1877);
    out.m_35.x = _1871;
    out.gl_Position.x = _1863;
    out.gl_Position.y = _1865;
    out.gl_Position.z = _1867;
    out.gl_Position.w = _1869;
    out.m_59.x = _1879;
    out.m_59.y = _1883;
    out.m_59.z = _1881;
    out.m_59.w = _1869;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1757 = false;
    bool _366 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_32.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _84;
    float _88 = _86;
    if (!_82)
    {
        out.m_35.x = 0.0;
    }
    int _90 = 0;
    if (!_82)
    {
        float _92 = _86 * 5.0;
        _90 = as_type<int>(_92);
    }
    int _94 = _90;
    int _96 = _94;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1940 = as_type<float>(_94);
        out.gl_Position.z = _1940;
    }
    if (!_82)
    {
        return out;
    }
    float _98 = in.m_37.w;
    bool _100 = _98 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_98);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    float _110 = -_98;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _114 = _112;
    if (_108)
    {
        float _116 = float(_78);
        _88 = _116;
    }
    float _118 = _88;
    bool _120 = _112 >= _118;
    bool _122 = !_108;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_35.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _96 = as_type<int>(_130);
    }
    int _132 = _96;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2010 = as_type<float>(_132);
        out.gl_Position.z = _2010;
    }
    if (_124)
    {
        return out;
    }
    float _134 = in.m_39.x;
    float _136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _138 = _112 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _140 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = _138 * _136;
    float _154 = 0.0;
    if (!_150)
    {
        float _156 = _140 * _140;
        float _158 = _156 * 0.5;
        _154 = _158;
    }
    float _160 = _154;
    float _162 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[20].x, _152);
    float _164 = _160;
    if (!_150)
    {
        float _166 = _160 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _166;
    }
    float _168 = _164;
    float _170 = in.m_37.x;
    float _172 = in.m_37.y;
    float _174 = in.m_37.z;
    float _176 = _162 * 6.283185482025146484375;
    float _178 = floor(_162);
    float _180 = _176 * 0.15915493667125701904296875;
    int _182 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _184 = _182 != 0;
    float _186 = _180 * 6.283185482025146484375;
    float _188 = cos(_186);
    float _190 = 1.4012984643248170709237295832899e-45;
    float _192 = _168;
    if (!_150)
    {
        _190 = _140;
    }
    float _194 = _190;
    float _196 = -_178;
    float _198 = _162 + _196;
    bool _200 = !_150;
    float _202 = _194;
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _140 * _206;
        float _216 = 1.0 / _210;
        float _218 = _212 * 0.693147182464599609375;
        float _220 = exp2(_214);
        float _222 = 1.0 / _218;
        float _224 = _220 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _222, _140);
        float _230 = _228 * _216;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _232;
    }
    float _234 = _192;
    bool _236 = !_150;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _140 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _202 = _256;
    }
    float _258 = _202;
    float _260 = in.m_41.w;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _264 = _262 != 0;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _268 = _266 != 0;
    float _270 = in.m_32.x;
    float _272 = in.m_32.y;
    float _274 = in.m_32.z;
    bool _276 = _198 < 0.5;
    float _278 = float(_276);
    float _280 = -_198;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _284 = !_264;
    int _286 = _284 ? 0 : 1;
    float _288 = -_278;
    float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _292 = !_184;
    int _294 = _292 ? 0 : 1;
    float _296 = fma(_188, 0.5, 0.5);
    int _298 = abs(_286);
    float _300 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _302 = abs(_294);
    float _304 = -_296;
    float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _308 = fma(_258, _170, _300);
    bool _310 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _312 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _314 = !_268;
    int _316 = _314 ? 0 : 1;
    float _318 = float(_298);
    float _320 = fma(_258, _172, _312);
    int _322 = abs(_316);
    float _324 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _326 = float(_302);
    float _328 = abs(_282);
    float _330 = _318 * _328;
    float _332 = float(_322);
    float _334 = fma(_258, _174, _324);
    float _336 = fma(_308, _260, _270);
    float _338 = fma(_326, _306, _330);
    float _340 = fma(_320, _260, _272);
    float _342 = fma(_334, _260, _274);
    float _344 = abs(_290);
    float _346 = fma(_332, _344, _338);
    bool _348 = !_310;
    float _364;
    if (!_348)
    {
        float _350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _352 = _134 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[11].w, _112);
        float _356 = _354 * _350;
        float _358 = floor(_356);
        float _360 = -_358;
        float _362 = _356 + _360;
        _364 = _362;
        _366 = true;
    }
    else
    {
        float _368 = float(_78);
        float _370 = 1.0 / _368;
        float _372 = _112 * _370;
        _364 = _372;
    }
    _366 = false;
    float _374 = _364;
    float _376 = in.m_39.y;
    float _378 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _380 = log2(_378);
    float _382 = _134 * 2.0;
    float _384 = in.m_43.y;
    float _386 = _134 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _390 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _392 = int(_390);
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _396 = _394 != 0;
    float _398 = _340 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _402 = _400 != 0;
    float _404 = _340 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _406 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _408 = isnan(0.0);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _414 = _410 || _412;
    float _416 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[5].x, _398);
    float _418 = _380 * _112;
    float _420 = floor(_382);
    float _422 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[6].x, _404);
    float _424 = _376 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _426 = float(_392);
    float _428 = exp2(_418);
    bool _430 = _376 > 0.5;
    float _432 = fma(_424, -2.0, _388);
    float _434 = -_384;
    float _436 = _434 + 1.0;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _440 = _376 * 2.0;
    bool _442 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _444 = isnan(1.0);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _450 = _446 || _448;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _454 = int(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _458 = 1.0 + _456;
    float _460 = _384;
    if (_396)
    {
        float _462 = _430 ? _436 : _384;
        _460 = _462;
    }
    float _464 = _460;
    float _466 = -_438;
    float _468 = fma(_386, 2.0, _466);
    bool _470 = _420 > 0.0;
    float _472 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _432);
    bool _474 = _420 >= 0.0;
    bool _476 = isnan(_420);
    bool _478 = _474 || _476;
    bool _480 = isnan(0.0);
    bool _482 = _478 || _480;
    float _484 = -_112;
    float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[76].x, _468);
    float _488 = 1.0 / _426;
    float _490 = -_428;
    float _492 = _490 + 1.0;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _496 = _414 ? _492 : 0.0;
    float _498 = 1.0 / _458;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _502 = float(_454);
    float _504 = in.m_45.x;
    float _506 = in.m_45.y;
    float _508 = in.m_45.z;
    float _510 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[78].z, _494);
    float _512 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[78].w, _500);
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _520 = _518 != 0;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _524 = _522 != 0;
    float _526 = _502 * _112;
    float _528 = float(uint(_454));
    float _530 = floor(_440);
    float _532 = _488 * _112;
    float _534 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _510);
    float _536 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _512);
    bool _538 = !_520;
    int _540 = _538 ? 0 : 1;
    if (_450)
    {
        float _542 = _496 * _498;
        _114 = _542;
    }
    float _544 = _114;
    float _546 = 1.0 / _528;
    float _548 = in.m_41.x;
    float _550 = in.m_41.y;
    float _552 = in.m_41.z;
    float _554 = _340 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _556 = _482 ? 0 : 1;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _560 = _558 != 0;
    float _562 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[4].x, _554);
    float _564 = trunc(_532);
    int _566 = int(_564);
    int _568 = ~_556;
    int _570 = _568 + 1;
    int _572 = _570 + 1;
    float _574 = in.m_39.z;
    int _576 = _572;
    if (!_470)
    {
        int _578 = ~_556;
        int _580 = _578 + 1;
        _576 = _580;
    }
    int _582 = _576;
    float _584 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _504);
    bool _586 = _530 >= 0.0;
    bool _588 = isnan(_530);
    bool _590 = _586 || _588;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    float _596 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _506);
    float _598 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _508);
    float _600 = float(_78);
    float _602 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].z, _562);
    int _604 = _594 ? 0 : 1;
    bool _606 = _530 > 0.0;
    int _608 = as_type<int>(_546) + (-2);
    float _610 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].z, _416);
    float _612 = float(uint(_566));
    float _614 = _550 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _616 = ~_604;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = _552 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _626 = _624 != 0;
    float _628 = as_type<float>(_608) * _612;
    float _630 = _548 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _632 = ~_454;
    int _634 = _632 + 1;
    float _636 = 1.0 / _600;
    int _638 = _620;
    if (!_606)
    {
        int _640 = ~_604;
        int _642 = _640 + 1;
        _638 = _642;
    }
    int _644 = _638;
    float _646 = _574 * 2.0;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _650 = _648 != 0;
    float _652 = _346 * _614;
    float _654 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].z, _422);
    bool _656 = !_516;
    int _658 = _656 ? 0 : 1;
    float _660 = trunc(_628);
    float _662 = precise::max(_660, 0.0);
    uint _665 = uint(_662);
    bool _667 = !_524;
    int _669 = _667 ? 0 : 1;
    float _671 = _346 * _622;
    int _673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _675 = _673 != 0;
    int _677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _679 = _677 != 0;
    int _681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _683 = _681 != 0;
    float _685 = _346 * _630;
    bool _687 = !_402;
    float _689 = _687 ? 7.345489978790283203125 : 1.0;
    float _691 = _671 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _693 = floor(_646);
    float _695 = _689 * _134;
    float _697 = float(_566);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _703 = _526 * _636;
    float _705 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    bool _707 = !_679;
    int _709 = _707 ? 0 : 1;
    int _711 = _634 * int(_665);
    int _713 = _711 + _566;
    float _715 = 1.0 / _701;
    float _717 = _691 * _598;
    float _719 = float(_644);
    float _721 = float(uint(_713));
    float _723 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _705);
    bool _725 = _693 >= 0.0;
    bool _727 = isnan(_693);
    bool _729 = _725 || _727;
    bool _731 = isnan(0.0);
    bool _733 = _729 || _731;
    float _735 = floor(_695);
    float _737 = _134 + _376;
    float _739 = as_type<float>(_608) * _721;
    int _741 = _733 ? 0 : 1;
    bool _743 = _693 > 0.0;
    float _745 = _737 + (-1.0);
    float _747 = _376 + _574;
    float _749 = trunc(_739);
    float _751 = precise::max(_749, 0.0);
    uint _753 = uint(_751);
    float _755 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _757 = _747 + (-1.0);
    int _759 = ~_741;
    int _761 = _759 + 1;
    int _763 = _761 + 1;
    float _765 = _376 + (-0.5);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _767;
    int _771 = abs(_658);
    float _773 = -_735;
    float _775 = _695 + _773;
    bool _777 = _697 >= _502;
    bool _779 = isnan(_697);
    bool _781 = _777 || _779;
    bool _783 = isnan(_502);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _791 = _763;
    if (!_743)
    {
        int _793 = ~_741;
        int _795 = _793 + 1;
        _791 = _795;
    }
    int _797 = _791;
    float _799 = _775 * _502;
    bool _801 = !_683;
    int _803 = _801 ? 0 : 1;
    float _805 = _769 * _715;
    int _807 = abs(_709);
    float _809 = trunc(_703);
    int _811 = int(_809);
    int _813 = int(_665) + int(_753);
    float _815 = in.m_47.x;
    float _817 = in.m_47.y;
    float _819 = in.m_47.z;
    bool _821 = !_675;
    int _823 = _821 ? 0 : 1;
    int _825 = abs(_803);
    int _827 = abs(_823);
    float _829 = float(_582);
    float _831 = float(_807);
    int _833 = ~_454;
    int _835 = _833 + 1;
    float _837 = float(_825);
    float _839 = _831 * _829;
    float _841 = float(_827);
    int _843 = _835 * _813;
    int _845 = _843 + _566;
    float _847 = float(_797);
    float _849 = _837 * _719;
    float _851 = _839 * (-2.0);
    float _853 = trunc(_799);
    int _855 = int(_853);
    bool _857 = uint(_845) >= uint(_454);
    float _859 = _841 * _847;
    bool _861 = !_560;
    int _863 = _861 ? 0 : 1;
    float _865 = fma(_789, _851, _789);
    bool _867 = !_857;
    int _869 = _867 ? 0 : (-1);
    float _871 = fma(_851, _817, _817);
    int _873 = abs(_863);
    float _875 = trunc(_787);
    int _877 = int(_875);
    float _879 = _859 * (-2.0);
    int _881 = ~_813;
    int _883 = _881 + _869;
    int _885 = _883 + 1;
    float _887 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[196].y, _871);
    float _889 = fma(_755, _879, _755);
    float _891 = fma(_879, _815, _815);
    bool _893 = _454 == 0;
    float _895 = _610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _897 = _855 * _873;
    int _899 = _897 + _566;
    float _901 = _602 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _903 = _454 * _885;
    int _905 = _903 + _566;
    float _907 = _134 + (-0.5);
    float _909 = -_895;
    float _911 = _909 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _913 = fma(_865, _544, _887);
    float _915 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[196].x, _891);
    int _917 = ~_877;
    int _919 = _917 + 1;
    int _921 = _919 + 1;
    float _923 = _911 * _911;
    bool _925 = !_893;
    int _927 = _925 ? _905 : (-1);
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _933 = _454 + (-1);
    float _935 = fma(_889, _544, _915);
    int _937 = _927 * _921;
    float _939 = -_901;
    float _941 = _939 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _943 = _654 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _945 = 1.0 / _931;
    int _947 = _877 * _933;
    int _949 = _947 + _937;
    float _951 = fma(_941, _941, _923);
    int _953 = abs(_540);
    float _955 = -_943;
    float _957 = _955 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _959 = abs(_669);
    float _961 = _935 * 0.15915493667125701904296875;
    bool _963 = !_650;
    int _965 = _963 ? 0 : 1;
    int _967 = _949 * _953;
    float _969 = _913 * 0.15915493667125701904296875;
    float _971 = fma(_957, _957, _951);
    int _973 = abs(_965);
    int _975 = _811 * _771;
    int _977 = _975 + _967;
    float _979 = _134 + _574;
    float _981 = _574 + (-0.5);
    bool _983 = _134 > 0.5;
    bool _985 = _983 && _626;
    int _987 = _899 * _959;
    int _989 = _987 + _977;
    float _991 = _979 + (-1.0);
    float _993 = rsqrt(_971);
    int _995 = _855 * _973;
    int _997 = _995 + _989;
    float _999 = _849 * (-2.0);
    float _1001 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _723);
    float _1003 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _464, -0.5);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1007 = float(uint(_997));
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1013 = fma(_999, _819, _819);
    float _1015 = fma(_1005, _999, _1005);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1019 = _374 + _1017;
    float _1021 = as_type<float>(_608) * _1007;
    float _1023 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1013);
    int _1025 = ~_454;
    int _1027 = _1025 + 1;
    float _1029 = fma(_805, _1019, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1031 = trunc(_1021);
    float _1033 = precise::max(_1031, 0.0);
    uint _1035 = uint(_1033);
    float _1037 = fma(_1015, _544, _1023);
    float _1039 = _685 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1041 = _941 * _993;
    float _1043 = _911 * _993;
    float _1045 = _957 * _993;
    float _1047 = -_472;
    float _1049 = fma(_536, _1003, _1047);
    float _1051 = _1037 * 0.15915493667125701904296875;
    float _1053 = _969 * 6.283185482025146484375;
    float _1055 = sin(_1053);
    float _1057 = _1039 * _584;
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1061 = _1041 * _1059;
    float _1063 = _1011 * _945;
    float _1065 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1067 = _1045 * _1065;
    float _1069 = _652 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1073 = -_1061;
    float _1075 = fma(_1045, _1071, _1073);
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1079 = _1043 * _1077;
    int _1081 = _1027 * int(_1035);
    int _1083 = _1081 + _997;
    float _1085 = _969 * 6.283185482025146484375;
    float _1087 = cos(_1085);
    float _1089 = _1069 * _596;
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1093 = -_1079;
    float _1095 = fma(_1041, _1091, _1093);
    float _1097 = float(uint(_1083));
    float _1099 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1101 = -_1067;
    float _1103 = fma(_1043, _1099, _1101);
    float _1105 = _1075 * _1075;
    float _1107 = _961 * 6.283185482025146484375;
    float _1109 = sin(_1107);
    float _1111 = as_type<float>(_608) * _1097;
    float _1113 = fma(_1103, _1103, _1105);
    float _1115 = fma(_1095, _1095, _1113);
    float _1117 = _961 * 6.283185482025146484375;
    float _1119 = cos(_1117);
    float _1121 = _1051 * 6.283185482025146484375;
    float _1123 = cos(_1121);
    float _1125 = _1109 * _1087;
    float _1127 = _1109 * _1055;
    float _1129 = _1051 * 6.283185482025146484375;
    float _1131 = sin(_1129);
    float _1133 = _1119 * _1055;
    float _1135 = _1119 * _1087;
    float _1137 = trunc(_1111);
    float _1139 = precise::max(_1137, 0.0);
    uint _1141 = uint(_1139);
    float _1143 = _1123 * _1089;
    float _1145 = _1087 * _1123;
    float _1147 = _1055 * _1123;
    int _1149 = ~_454;
    int _1151 = _1149 + 1;
    float _1153 = _1119 * _1143;
    float _1155 = -_1133;
    float _1157 = fma(_1131, _1125, _1155);
    float _1159 = -_1125;
    float _1161 = fma(_1131, _1133, _1159);
    float _1163 = -_1089;
    float _1165 = _1131 * _1163;
    float _1167 = float(uint(_899));
    float _1169 = rsqrt(_1115);
    float _1171 = fma(_1131, _1135, _1127);
    float _1173 = fma(_1145, _1057, _1165);
    float _1175 = fma(_1131, _1127, _1135);
    int _1177 = int(_1035) + int(_1141);
    float _1179 = as_type<float>(_608) * _1167;
    float _1181 = _1109 * _1143;
    float _1183 = sqrt(_1001);
    int _1185 = _1151 * _1177;
    int _1187 = _1185 + _997;
    float _1189 = fma(_1157, _1057, _1181);
    bool _1191 = uint(_1187) >= uint(_454);
    float _1193 = fma(_1175, _717, _1189);
    float _1195 = trunc(_1179);
    float _1197 = precise::max(_1195, 0.0);
    uint _1199 = uint(_1197);
    float _1201 = _1103 * _1169;
    float _1203 = _1075 * _1169;
    float _1205 = fma(_1171, _1057, _1153);
    bool _1207 = !_1191;
    int _1209 = _1207 ? 0 : (-1);
    float _1211 = _1095 * _1169;
    float _1213 = _1045 * _1203;
    int _1215 = ~_454;
    int _1217 = _1215 + 1;
    float _1219 = fma(_1161, _717, _1205);
    int _1221 = ~_1177;
    int _1223 = _1221 + _1209;
    int _1225 = _1223 + 1;
    float _1227 = _1043 * _1201;
    float _1229 = -_1213;
    float _1231 = fma(_1043, _1211, _1229);
    float _1233 = fma(_1147, _717, _1173);
    float _1235 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1237 = _374 + _1235;
    float _1239 = -_1227;
    float _1241 = fma(_1041, _1203, _1239);
    float _1243 = _1231 * _1219;
    int _1245 = _1217 * int(_1199);
    int _1247 = _1245 + _899;
    float _1249 = in.m_43.x;
    float _1251 = _1241 * _1219;
    int _1253 = _454 * _1225;
    int _1255 = _1253 + _997;
    float _1257 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1259 = float(uint(_1247));
    float _1261 = fma(_1201, _1233, _1243);
    float _1263 = fma(_1063, _1237, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1265 = fma(_1211, _1233, _1251);
    bool _1267 = !_893;
    int _1269 = _1267 ? _1255 : (-1);
    float _1271 = fma(_1041, _1193, _1261);
    bool _1273 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1275 = isnan(_374);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1281 = _1277 || _1279;
    float _1283 = float(_1281);
    float _1285 = fma(_1045, _1193, _1265);
    int _1287 = _1269 >> 31;
    float _1289 = _901 + _1271;
    float _1291 = as_type<float>(_608) * _1259;
    float _1293 = _943 + _1285;
    int _1295 = _1287 & 3;
    float _1297 = fma(_1257, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1289);
    bool _1299 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1301 = isnan(_374);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1307 = _1303 || _1305;
    float _1309 = float(_1307);
    float _1311 = fma(_1257, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1293);
    int _1313 = _1269 + _1295;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1317 = _1297 + _1315;
    bool _1319 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1321 = isnan(_374);
    bool _1323 = _1319 || _1321;
    bool _1325 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1327 = _1323 || _1325;
    float _1329 = float(_1327);
    float _1331 = -_1283;
    float _1333 = _1331 + 1.0;
    int _1335 = _1313 >> 2;
    float _1337 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1339 = _1311 + _1337;
    float _1341 = as_type<float>(_1141);
    float _1343 = _1157;
    if (_626)
    {
        _1341 = _1249;
    }
    float _1345 = _1341;
    float _1347 = _1329 * _1333;
    int _1349 = _1335 << 4;
    int _1351 = _1349 + 368;
    float _1353 = _1041 * _1211;
    float _1355 = _1345;
    if (!_626)
    {
        _1343 = _1249;
    }
    float _1357 = _1343;
    float _1359 = trunc(_1291);
    float _1361 = precise::max(_1359, 0.0);
    uint _1363 = uint(_1361);
    uint _1365 = uint(int(uint(_1351) >> uint(2)));
    uint _1367 = uint(int(uint(int(_1365)) >> uint(2)));
    int _1369 = int(_1365) & 3;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[int(_1367)][_1369];
    int _1373 = int(_1365) + 1;
    uint _1375 = uint(int(uint(_1373) >> uint(2)));
    int _1377 = _1373 & 3;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[int(_1375)][_1377];
    float _1381 = _1317 * _1317;
    float _1383 = _1339 * _1339;
    float _1385 = _1357;
    float _1387 = _1381;
    float _1389 = _1383;
    if (_985)
    {
        float _1391 = -_1345;
        float _1393 = _1391 + 1.0;
        _1355 = _1393;
    }
    float _1395 = _1355;
    float _1397 = -_1353;
    float _1399 = fma(_1045, _1201, _1397);
    int _1401 = ~_454;
    int _1403 = _1401 + 1;
    float _1405 = _1381 + _1383;
    float _1407 = -_1329;
    float _1409 = _1407 + 1.0;
    int _1411 = _1351 + 8;
    uint _1413 = uint(int(uint(_1411) >> uint(2)));
    uint _1415 = uint(int(uint(int(_1413)) >> uint(2)));
    int _1417 = int(_1413) & 3;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[int(_1415)][_1417];
    int _1421 = int(_1413) + 1;
    uint _1423 = uint(int(uint(_1421) >> uint(2)));
    int _1425 = _1421 & 3;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[int(_1423)][_1425];
    float _1429 = _1399 * _1219;
    float _1431 = sqrt(_1405);
    if (_626)
    {
        _1385 = _1395;
    }
    float _1433 = _1385;
    float _1435 = _1309 * _1409;
    float _1437 = fma(_1203, _1233, _1429);
    int _1439 = _1269 & 3;
    bool _1441 = _1439 != 0;
    float _1443 = _1029 * _1435;
    int _1445 = int(_1199) + int(_1363);
    float _1447 = fma(_1043, _1193, _1437);
    bool _1449 = uint(_1439) > 1u;
    float _1451 = -_1309;
    float _1453 = _1451 + 1.0;
    int _1455 = _1269 & 3;
    bool _1457 = _1455 != 0;
    int _1459 = _1403 * _1445;
    int _1461 = _1459 + _899;
    float _1463 = _895 + _1447;
    float _1465 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1443);
    bool _1467 = _1431 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1469 = fma(_1257, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1463);
    bool _1471 = uint(_1461) >= uint(_454);
    float _1473 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1475 = _1457 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1477 = uint(_1439) >= 2u;
    int _1479 = ~as_type<int>(_1475);
    int _1481 = _1479 + 1;
    int _1483 = _1481 + 1;
    int _1485 = _1483;
    float _1487 = _1447;
    float _1489 = _1475;
    if (!_1449)
    {
        int _1491 = ~as_type<int>(_1475);
        int _1493 = _1491 + 1;
        _1485 = _1493;
    }
    int _1495 = _1485;
    bool _1497 = !_1471;
    int _1499 = _1497 ? 0 : (-1);
    int _1501 = abs(_1495);
    int _1503 = _1477 ? 0 : 1;
    float _1505 = as_type<float>(_1495);
    if (!_1467)
    {
        _1505 = _1297;
    }
    float _1507 = _1505;
    int _1509 = ~_1445;
    int _1511 = _1509 + _1499;
    int _1513 = _1511 + 1;
    bool _1515 = _1439 != 3;
    float _1517 = _1507;
    if (!_1467)
    {
        _1487 = _1311;
    }
    float _1519 = _1487;
    bool _1521 = !_1441;
    int _1523 = _1521 ? 0 : 1;
    int _1525 = ~_1503;
    int _1527 = _1525 + 1;
    int _1529 = _1527 + 1;
    int _1531 = ~_1501;
    int _1533 = _1531 + 1;
    int _1535 = _1533 + 1;
    float _1537 = _1519;
    int _1539 = _1529;
    if (!_1467)
    {
        _1489 = _1469;
    }
    float _1541 = _1489;
    bool _1543 = !_1467;
    float _1545 = _1541;
    if (!_1543)
    {
        float _1547 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1551 = _1431 + _1549;
        float _1553 = rsqrt(_1405);
        float _1555 = _1551 * _1547;
        float _1557 = _1469 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = _1555 * 0.15915493667125701904296875;
        float _1561 = _1559 * 6.283185482025146484375;
        float _1563 = sin(_1561);
        float _1565 = _1559 * 6.283185482025146484375;
        float _1567 = cos(_1565);
        float _1569 = fma(_1563, _1557, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1571 = _1553 * _1569;
        float _1573 = _1567 + (-1.0);
        float _1575 = fma(_1317, _1571, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1577 = fma(_1339, _1571, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1579 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1583 = _1575 + _1581;
        float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1587 = _1577 + _1585;
        float _1589 = fma(_1469, _1567, _1579);
        float _1591 = _1583 * _1583;
        float _1593 = _1587 * _1587;
        _1545 = _1589;
        _1387 = _1591;
        _1389 = _1593;
        _1517 = _1575;
        _1537 = _1577;
    }
    float _1595 = _1545;
    float _1597 = _1387;
    float _1599 = _1389;
    float _1601 = _1517;
    float _1603 = _1537;
    bool _1605 = _1439 != 3;
    int _1607 = _1535 * as_type<int>(_1379);
    if (_1515)
    {
        int _1609 = ~_1503;
        int _1611 = _1609 + 1;
        _1539 = _1611;
    }
    int _1613 = _1539;
    float _1615 = in.m_49.w;
    int _1617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1619 = _1617 != 0;
    int _1621 = _454 * _1513;
    int _1623 = _1621 + _899;
    bool _1625 = !_1605;
    int _1627 = _1625 ? 0 : (-1);
    float _1629 = fma(_1263, _1347, _1465);
    int _1631 = abs(_1523);
    float _1633 = fma(_534, _1473, _486);
    int _1635 = abs(_1613);
    float _1637 = fma(_1283, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1629);
    bool _1639 = !_1619;
    int _1641 = _1639 ? 0 : 1;
    float _1643 = _1049 + 0.5;
    int _1645 = abs(_1627);
    float _1647 = _1633 + 0.5;
    int _1649 = ~_1631;
    int _1651 = _1649 + 1;
    int _1653 = _1651 + 1;
    float _1655 = _1637 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1657 = abs(_1641);
    int _1659 = _1653 * as_type<int>(_1371);
    int _1661 = _1659 + _1607;
    int _1663 = ~_1635;
    int _1665 = _1663 + 1;
    int _1667 = _1665 + 1;
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1671 = _1595 + _1669;
    out.m_51.x = _1647;
    out.m_51.y = _1643;
    int _1673 = ~_1645;
    int _1675 = _1673 + 1;
    int _1677 = _1675 + 1;
    int _1679 = _1667 * as_type<int>(_1419);
    int _1681 = _1679 + _1661;
    float _1683 = fma(_1671, _1671, _1597);
    int _1685 = ~_1657;
    int _1687 = _1685 + 1;
    int _1689 = _1687 + 1;
    out.m_53.w = _1615;
    int _1691 = _1677 * as_type<int>(_1427);
    int _1693 = _1691 + _1681;
    float _1695 = _1683 + _1599;
    bool _1697 = !_893;
    int _1699 = _1697 ? _1623 : (-1);
    out.m_55.w = _1655;
    int _1701 = _1693 * _1689;
    float _1703 = sqrt(_1695);
    int _1705 = _1699 * _1657;
    int _1707 = _1705 + _1701;
    float _1709 = float(_1707);
    out.m_57.x = _1709;
    bool _1711 = _1703 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1713 = isnan(_1703);
    bool _1715 = _1711 || _1713;
    bool _1717 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1719 = _1715 || _1717;
    float _1721 = as_type<float>(_1707);
    if (!_1719)
    {
        _1721 = 1.0;
    }
    float _1723 = _1721;
    bool _1725 = !_1719;
    float _1727 = _1723;
    if (!_1725)
    {
        bool _1729 = _1703 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1731 = isnan(_1703);
        bool _1733 = _1729 || _1731;
        bool _1735 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1737 = _1733 || _1735;
        if (!_1737)
        {
            float _1739 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1741 = _1703 + _1739;
            float _1743 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1745 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1743;
            float _1747 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1749 = _1747 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1751 = 1.0 / _1745;
            float _1753 = _1741 * _1751;
            float _1755 = fma(_1753, _1749, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1727 = _1755;
            _1757 = true;
        }
        else
        {
            bool _1759 = _1703 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1761 = isnan(_1703);
            bool _1763 = _1759 || _1761;
            bool _1765 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1767 = _1763 || _1765;
            if (!_1767)
            {
                float _1769 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1771 = _1703 + _1769;
                float _1773 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1775 = _1773 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1777 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1779 = _1777 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1781 = 1.0 / _1775;
                float _1783 = _1771 * _1781;
                float _1785 = fma(_1783, _1779, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1727 = _1785;
                _1757 = true;
            }
            else
            {
                _1727 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1757 = false;
    float _1787 = _1727;
    float _1789 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1791 = _1595 + _1789;
    float _1793 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1795 = _1601 + _1793;
    float _1797 = fma(_1791, _1787, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1799 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1801 = _1603 + _1799;
    float _1803 = fma(_1795, _1787, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1805 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1807 = fma(_1801, _1787, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1809 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1811 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1813 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1805);
    float _1815 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1817 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1809);
    float _1819 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1811);
    float _1821 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1813);
    float _1823 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1815);
    float _1825 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1817);
    float _1827 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1819);
    float _1829 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1831 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1823);
    float _1833 = _1825 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1835 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1837 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1839 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1841 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1843 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1845 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1837);
    float _1847 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1839);
    float _1849 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1841);
    float _1851 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1843);
    float _1853 = _1831 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1855 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1845);
    float _1857 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1847);
    float _1859 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1849);
    float _1861 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1851);
    float _1863 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1855);
    float _1865 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1857);
    float _1867 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1859);
    float _1869 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1861);
    float _1871 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1873 = _1863 + _1869;
    float _1875 = _1867 + _1869;
    float _1877 = _1869 * 0.5;
    float _1879 = _1873 * 0.5;
    float _1881 = _1875 * 0.5;
    float _1883 = fma(_1865, -0.5, _1877);
    out.m_35.x = _1871;
    out.gl_Position.x = _1863;
    out.gl_Position.y = _1865;
    out.gl_Position.z = _1867;
    out.gl_Position.w = _1869;
    out.m_59.x = _1879;
    out.m_59.y = _1883;
    out.m_59.z = _1881;
    out.m_59.w = _1869;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1757 = false;
    bool _366 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_32.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _84;
    float _88 = _86;
    if (!_82)
    {
        out.m_35.x = 0.0;
    }
    int _90 = 0;
    if (!_82)
    {
        float _92 = _86 * 5.0;
        _90 = as_type<int>(_92);
    }
    int _94 = _90;
    int _96 = _94;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1940 = as_type<float>(_94);
        out.gl_Position.z = _1940;
    }
    if (!_82)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _98 = in.m_37.w;
    bool _100 = _98 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _102 = isnan(_98);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _108 = _104 || _106;
    float _110 = -_98;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _114 = _112;
    if (_108)
    {
        float _116 = float(_78);
        _88 = _116;
    }
    float _118 = _88;
    bool _120 = _112 >= _118;
    bool _122 = !_108;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_35.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _96 = as_type<int>(_130);
    }
    int _132 = _96;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2010 = as_type<float>(_132);
        out.gl_Position.z = _2010;
    }
    if (_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_39.x;
    float _136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _138 = _112 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _140 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _142 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _144 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _146 = _142 || _144;
    bool _148 = isnan(1.0);
    bool _150 = _146 || _148;
    float _152 = _138 * _136;
    float _154 = 0.0;
    if (!_150)
    {
        float _156 = _140 * _140;
        float _158 = _156 * 0.5;
        _154 = _158;
    }
    float _160 = _154;
    float _162 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[20].x, _152);
    float _164 = _160;
    if (!_150)
    {
        float _166 = _160 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _166;
    }
    float _168 = _164;
    float _170 = in.m_37.x;
    float _172 = in.m_37.y;
    float _174 = in.m_37.z;
    float _176 = _162 * 6.283185482025146484375;
    float _178 = floor(_162);
    float _180 = _176 * 0.15915493667125701904296875;
    int _182 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _184 = _182 != 0;
    float _186 = _180 * 6.283185482025146484375;
    float _188 = cos(_186);
    float _190 = 1.4012984643248170709237295832899e-45;
    float _192 = _168;
    if (!_150)
    {
        _190 = _140;
    }
    float _194 = _190;
    float _196 = -_178;
    float _198 = _162 + _196;
    bool _200 = !_150;
    float _202 = _194;
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _140 * _206;
        float _216 = 1.0 / _210;
        float _218 = _212 * 0.693147182464599609375;
        float _220 = exp2(_214);
        float _222 = 1.0 / _218;
        float _224 = _220 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _222, _140);
        float _230 = _228 * _216;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _232;
    }
    float _234 = _192;
    bool _236 = !_150;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _140 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _202 = _256;
    }
    float _258 = _202;
    float _260 = in.m_41.w;
    int _262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _264 = _262 != 0;
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _268 = _266 != 0;
    float _270 = in.m_32.x;
    float _272 = in.m_32.y;
    float _274 = in.m_32.z;
    bool _276 = _198 < 0.5;
    float _278 = float(_276);
    float _280 = -_198;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _284 = !_264;
    int _286 = _284 ? 0 : 1;
    float _288 = -_278;
    float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _292 = !_184;
    int _294 = _292 ? 0 : 1;
    float _296 = fma(_188, 0.5, 0.5);
    int _298 = abs(_286);
    float _300 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _302 = abs(_294);
    float _304 = -_296;
    float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _308 = fma(_258, _170, _300);
    bool _310 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _312 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _314 = !_268;
    int _316 = _314 ? 0 : 1;
    float _318 = float(_298);
    float _320 = fma(_258, _172, _312);
    int _322 = abs(_316);
    float _324 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _326 = float(_302);
    float _328 = abs(_282);
    float _330 = _318 * _328;
    float _332 = float(_322);
    float _334 = fma(_258, _174, _324);
    float _336 = fma(_308, _260, _270);
    float _338 = fma(_326, _306, _330);
    float _340 = fma(_320, _260, _272);
    float _342 = fma(_334, _260, _274);
    float _344 = abs(_290);
    float _346 = fma(_332, _344, _338);
    bool _348 = !_310;
    float _364;
    if (!_348)
    {
        float _350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _352 = _134 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[11].w, _112);
        float _356 = _354 * _350;
        float _358 = floor(_356);
        float _360 = -_358;
        float _362 = _356 + _360;
        _364 = _362;
        _366 = true;
    }
    else
    {
        float _368 = float(_78);
        float _370 = 1.0 / _368;
        float _372 = _112 * _370;
        _364 = _372;
    }
    _366 = false;
    float _374 = _364;
    float _376 = in.m_39.y;
    float _378 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _380 = log2(_378);
    float _382 = _134 * 2.0;
    float _384 = in.m_43.y;
    float _386 = _134 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _390 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _392 = int(_390);
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _396 = _394 != 0;
    float _398 = _340 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _402 = _400 != 0;
    float _404 = _340 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _406 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _408 = isnan(0.0);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _414 = _410 || _412;
    float _416 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[5].x, _398);
    float _418 = _380 * _112;
    float _420 = floor(_382);
    float _422 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[6].x, _404);
    float _424 = _376 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _426 = float(_392);
    float _428 = exp2(_418);
    bool _430 = _376 > 0.5;
    float _432 = fma(_424, -2.0, _388);
    float _434 = -_384;
    float _436 = _434 + 1.0;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _440 = _376 * 2.0;
    bool _442 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _444 = isnan(1.0);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _450 = _446 || _448;
    float _452 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _454 = int(_452);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _458 = 1.0 + _456;
    float _460 = _384;
    if (_396)
    {
        float _462 = _430 ? _436 : _384;
        _460 = _462;
    }
    float _464 = _460;
    float _466 = -_438;
    float _468 = fma(_386, 2.0, _466);
    bool _470 = _420 > 0.0;
    float _472 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _432);
    bool _474 = _420 >= 0.0;
    bool _476 = isnan(_420);
    bool _478 = _474 || _476;
    bool _480 = isnan(0.0);
    bool _482 = _478 || _480;
    float _484 = -_112;
    float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[76].x, _468);
    float _488 = 1.0 / _426;
    float _490 = -_428;
    float _492 = _490 + 1.0;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _496 = _414 ? _492 : 0.0;
    float _498 = 1.0 / _458;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _502 = float(_454);
    float _504 = in.m_45.x;
    float _506 = in.m_45.y;
    float _508 = in.m_45.z;
    float _510 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[78].z, _494);
    float _512 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[78].w, _500);
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _520 = _518 != 0;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _524 = _522 != 0;
    float _526 = _502 * _112;
    float _528 = float(uint(_454));
    float _530 = floor(_440);
    float _532 = _488 * _112;
    float _534 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _510);
    float _536 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _512);
    bool _538 = !_520;
    int _540 = _538 ? 0 : 1;
    if (_450)
    {
        float _542 = _496 * _498;
        _114 = _542;
    }
    float _544 = _114;
    float _546 = 1.0 / _528;
    float _548 = in.m_41.x;
    float _550 = in.m_41.y;
    float _552 = in.m_41.z;
    float _554 = _340 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _556 = _482 ? 0 : 1;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _560 = _558 != 0;
    float _562 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[4].x, _554);
    float _564 = trunc(_532);
    int _566 = int(_564);
    int _568 = ~_556;
    int _570 = _568 + 1;
    int _572 = _570 + 1;
    float _574 = in.m_39.z;
    int _576 = _572;
    if (!_470)
    {
        int _578 = ~_556;
        int _580 = _578 + 1;
        _576 = _580;
    }
    int _582 = _576;
    float _584 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _504);
    bool _586 = _530 >= 0.0;
    bool _588 = isnan(_530);
    bool _590 = _586 || _588;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    float _596 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _506);
    float _598 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _508);
    float _600 = float(_78);
    float _602 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].z, _562);
    int _604 = _594 ? 0 : 1;
    bool _606 = _530 > 0.0;
    int _608 = as_type<int>(_546) + (-2);
    float _610 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].z, _416);
    float _612 = float(uint(_566));
    float _614 = _550 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _616 = ~_604;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = _552 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _626 = _624 != 0;
    float _628 = as_type<float>(_608) * _612;
    float _630 = _548 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _632 = ~_454;
    int _634 = _632 + 1;
    float _636 = 1.0 / _600;
    int _638 = _620;
    if (!_606)
    {
        int _640 = ~_604;
        int _642 = _640 + 1;
        _638 = _642;
    }
    int _644 = _638;
    float _646 = _574 * 2.0;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _650 = _648 != 0;
    float _652 = _346 * _614;
    float _654 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].z, _422);
    bool _656 = !_516;
    int _658 = _656 ? 0 : 1;
    float _660 = trunc(_628);
    float _662 = precise::max(_660, 0.0);
    uint _665 = uint(_662);
    bool _667 = !_524;
    int _669 = _667 ? 0 : 1;
    float _671 = _346 * _622;
    int _673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _675 = _673 != 0;
    int _677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _679 = _677 != 0;
    int _681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _683 = _681 != 0;
    float _685 = _346 * _630;
    bool _687 = !_402;
    float _689 = _687 ? 7.345489978790283203125 : 1.0;
    float _691 = _671 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _693 = floor(_646);
    float _695 = _689 * _134;
    float _697 = float(_566);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _703 = _526 * _636;
    float _705 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    bool _707 = !_679;
    int _709 = _707 ? 0 : 1;
    int _711 = _634 * int(_665);
    int _713 = _711 + _566;
    float _715 = 1.0 / _701;
    float _717 = _691 * _598;
    float _719 = float(_644);
    float _721 = float(uint(_713));
    float _723 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _705);
    bool _725 = _693 >= 0.0;
    bool _727 = isnan(_693);
    bool _729 = _725 || _727;
    bool _731 = isnan(0.0);
    bool _733 = _729 || _731;
    float _735 = floor(_695);
    float _737 = _134 + _376;
    float _739 = as_type<float>(_608) * _721;
    int _741 = _733 ? 0 : 1;
    bool _743 = _693 > 0.0;
    float _745 = _737 + (-1.0);
    float _747 = _376 + _574;
    float _749 = trunc(_739);
    float _751 = precise::max(_749, 0.0);
    uint _753 = uint(_751);
    float _755 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _757 = _747 + (-1.0);
    int _759 = ~_741;
    int _761 = _759 + 1;
    int _763 = _761 + 1;
    float _765 = _376 + (-0.5);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _767;
    int _771 = abs(_658);
    float _773 = -_735;
    float _775 = _695 + _773;
    bool _777 = _697 >= _502;
    bool _779 = isnan(_697);
    bool _781 = _777 || _779;
    bool _783 = isnan(_502);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _791 = _763;
    if (!_743)
    {
        int _793 = ~_741;
        int _795 = _793 + 1;
        _791 = _795;
    }
    int _797 = _791;
    float _799 = _775 * _502;
    bool _801 = !_683;
    int _803 = _801 ? 0 : 1;
    float _805 = _769 * _715;
    int _807 = abs(_709);
    float _809 = trunc(_703);
    int _811 = int(_809);
    int _813 = int(_665) + int(_753);
    float _815 = in.m_47.x;
    float _817 = in.m_47.y;
    float _819 = in.m_47.z;
    bool _821 = !_675;
    int _823 = _821 ? 0 : 1;
    int _825 = abs(_803);
    int _827 = abs(_823);
    float _829 = float(_582);
    float _831 = float(_807);
    int _833 = ~_454;
    int _835 = _833 + 1;
    float _837 = float(_825);
    float _839 = _831 * _829;
    float _841 = float(_827);
    int _843 = _835 * _813;
    int _845 = _843 + _566;
    float _847 = float(_797);
    float _849 = _837 * _719;
    float _851 = _839 * (-2.0);
    float _853 = trunc(_799);
    int _855 = int(_853);
    bool _857 = uint(_845) >= uint(_454);
    float _859 = _841 * _847;
    bool _861 = !_560;
    int _863 = _861 ? 0 : 1;
    float _865 = fma(_789, _851, _789);
    bool _867 = !_857;
    int _869 = _867 ? 0 : (-1);
    float _871 = fma(_851, _817, _817);
    int _873 = abs(_863);
    float _875 = trunc(_787);
    int _877 = int(_875);
    float _879 = _859 * (-2.0);
    int _881 = ~_813;
    int _883 = _881 + _869;
    int _885 = _883 + 1;
    float _887 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[196].y, _871);
    float _889 = fma(_755, _879, _755);
    float _891 = fma(_879, _815, _815);
    bool _893 = _454 == 0;
    float _895 = _610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _897 = _855 * _873;
    int _899 = _897 + _566;
    float _901 = _602 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _903 = _454 * _885;
    int _905 = _903 + _566;
    float _907 = _134 + (-0.5);
    float _909 = -_895;
    float _911 = _909 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _913 = fma(_865, _544, _887);
    float _915 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[196].x, _891);
    int _917 = ~_877;
    int _919 = _917 + 1;
    int _921 = _919 + 1;
    float _923 = _911 * _911;
    bool _925 = !_893;
    int _927 = _925 ? _905 : (-1);
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _933 = _454 + (-1);
    float _935 = fma(_889, _544, _915);
    int _937 = _927 * _921;
    float _939 = -_901;
    float _941 = _939 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _943 = _654 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _945 = 1.0 / _931;
    int _947 = _877 * _933;
    int _949 = _947 + _937;
    float _951 = fma(_941, _941, _923);
    int _953 = abs(_540);
    float _955 = -_943;
    float _957 = _955 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _959 = abs(_669);
    float _961 = _935 * 0.15915493667125701904296875;
    bool _963 = !_650;
    int _965 = _963 ? 0 : 1;
    int _967 = _949 * _953;
    float _969 = _913 * 0.15915493667125701904296875;
    float _971 = fma(_957, _957, _951);
    int _973 = abs(_965);
    int _975 = _811 * _771;
    int _977 = _975 + _967;
    float _979 = _134 + _574;
    float _981 = _574 + (-0.5);
    bool _983 = _134 > 0.5;
    bool _985 = _983 && _626;
    int _987 = _899 * _959;
    int _989 = _987 + _977;
    float _991 = _979 + (-1.0);
    float _993 = rsqrt(_971);
    int _995 = _855 * _973;
    int _997 = _995 + _989;
    float _999 = _849 * (-2.0);
    float _1001 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _723);
    float _1003 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _464, -0.5);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1007 = float(uint(_997));
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1013 = fma(_999, _819, _819);
    float _1015 = fma(_1005, _999, _1005);
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1019 = _374 + _1017;
    float _1021 = as_type<float>(_608) * _1007;
    float _1023 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1013);
    int _1025 = ~_454;
    int _1027 = _1025 + 1;
    float _1029 = fma(_805, _1019, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1031 = trunc(_1021);
    float _1033 = precise::max(_1031, 0.0);
    uint _1035 = uint(_1033);
    float _1037 = fma(_1015, _544, _1023);
    float _1039 = _685 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1041 = _941 * _993;
    float _1043 = _911 * _993;
    float _1045 = _957 * _993;
    float _1047 = -_472;
    float _1049 = fma(_536, _1003, _1047);
    float _1051 = _1037 * 0.15915493667125701904296875;
    float _1053 = _969 * 6.283185482025146484375;
    float _1055 = sin(_1053);
    float _1057 = _1039 * _584;
    float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1061 = _1041 * _1059;
    float _1063 = _1011 * _945;
    float _1065 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1067 = _1045 * _1065;
    float _1069 = _652 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1073 = -_1061;
    float _1075 = fma(_1045, _1071, _1073);
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1079 = _1043 * _1077;
    int _1081 = _1027 * int(_1035);
    int _1083 = _1081 + _997;
    float _1085 = _969 * 6.283185482025146484375;
    float _1087 = cos(_1085);
    float _1089 = _1069 * _596;
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1093 = -_1079;
    float _1095 = fma(_1041, _1091, _1093);
    float _1097 = float(uint(_1083));
    float _1099 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1101 = -_1067;
    float _1103 = fma(_1043, _1099, _1101);
    float _1105 = _1075 * _1075;
    float _1107 = _961 * 6.283185482025146484375;
    float _1109 = sin(_1107);
    float _1111 = as_type<float>(_608) * _1097;
    float _1113 = fma(_1103, _1103, _1105);
    float _1115 = fma(_1095, _1095, _1113);
    float _1117 = _961 * 6.283185482025146484375;
    float _1119 = cos(_1117);
    float _1121 = _1051 * 6.283185482025146484375;
    float _1123 = cos(_1121);
    float _1125 = _1109 * _1087;
    float _1127 = _1109 * _1055;
    float _1129 = _1051 * 6.283185482025146484375;
    float _1131 = sin(_1129);
    float _1133 = _1119 * _1055;
    float _1135 = _1119 * _1087;
    float _1137 = trunc(_1111);
    float _1139 = precise::max(_1137, 0.0);
    uint _1141 = uint(_1139);
    float _1143 = _1123 * _1089;
    float _1145 = _1087 * _1123;
    float _1147 = _1055 * _1123;
    int _1149 = ~_454;
    int _1151 = _1149 + 1;
    float _1153 = _1119 * _1143;
    float _1155 = -_1133;
    float _1157 = fma(_1131, _1125, _1155);
    float _1159 = -_1125;
    float _1161 = fma(_1131, _1133, _1159);
    float _1163 = -_1089;
    float _1165 = _1131 * _1163;
    float _1167 = float(uint(_899));
    float _1169 = rsqrt(_1115);
    float _1171 = fma(_1131, _1135, _1127);
    float _1173 = fma(_1145, _1057, _1165);
    float _1175 = fma(_1131, _1127, _1135);
    int _1177 = int(_1035) + int(_1141);
    float _1179 = as_type<float>(_608) * _1167;
    float _1181 = _1109 * _1143;
    float _1183 = sqrt(_1001);
    int _1185 = _1151 * _1177;
    int _1187 = _1185 + _997;
    float _1189 = fma(_1157, _1057, _1181);
    bool _1191 = uint(_1187) >= uint(_454);
    float _1193 = fma(_1175, _717, _1189);
    float _1195 = trunc(_1179);
    float _1197 = precise::max(_1195, 0.0);
    uint _1199 = uint(_1197);
    float _1201 = _1103 * _1169;
    float _1203 = _1075 * _1169;
    float _1205 = fma(_1171, _1057, _1153);
    bool _1207 = !_1191;
    int _1209 = _1207 ? 0 : (-1);
    float _1211 = _1095 * _1169;
    float _1213 = _1045 * _1203;
    int _1215 = ~_454;
    int _1217 = _1215 + 1;
    float _1219 = fma(_1161, _717, _1205);
    int _1221 = ~_1177;
    int _1223 = _1221 + _1209;
    int _1225 = _1223 + 1;
    float _1227 = _1043 * _1201;
    float _1229 = -_1213;
    float _1231 = fma(_1043, _1211, _1229);
    float _1233 = fma(_1147, _717, _1173);
    float _1235 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1237 = _374 + _1235;
    float _1239 = -_1227;
    float _1241 = fma(_1041, _1203, _1239);
    float _1243 = _1231 * _1219;
    int _1245 = _1217 * int(_1199);
    int _1247 = _1245 + _899;
    float _1249 = in.m_43.x;
    float _1251 = _1241 * _1219;
    int _1253 = _454 * _1225;
    int _1255 = _1253 + _997;
    float _1257 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1259 = float(uint(_1247));
    float _1261 = fma(_1201, _1233, _1243);
    float _1263 = fma(_1063, _1237, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1265 = fma(_1211, _1233, _1251);
    bool _1267 = !_893;
    int _1269 = _1267 ? _1255 : (-1);
    float _1271 = fma(_1041, _1193, _1261);
    bool _1273 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1275 = isnan(_374);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1281 = _1277 || _1279;
    float _1283 = float(_1281);
    float _1285 = fma(_1045, _1193, _1265);
    int _1287 = _1269 >> 31;
    float _1289 = _901 + _1271;
    float _1291 = as_type<float>(_608) * _1259;
    float _1293 = _943 + _1285;
    int _1295 = _1287 & 3;
    float _1297 = fma(_1257, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1289);
    bool _1299 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1301 = isnan(_374);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1307 = _1303 || _1305;
    float _1309 = float(_1307);
    float _1311 = fma(_1257, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1293);
    int _1313 = _1269 + _1295;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1317 = _1297 + _1315;
    bool _1319 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1321 = isnan(_374);
    bool _1323 = _1319 || _1321;
    bool _1325 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1327 = _1323 || _1325;
    float _1329 = float(_1327);
    float _1331 = -_1283;
    float _1333 = _1331 + 1.0;
    int _1335 = _1313 >> 2;
    float _1337 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1339 = _1311 + _1337;
    float _1341 = as_type<float>(_1141);
    float _1343 = _1157;
    if (_626)
    {
        _1341 = _1249;
    }
    float _1345 = _1341;
    float _1347 = _1329 * _1333;
    int _1349 = _1335 << 4;
    int _1351 = _1349 + 368;
    float _1353 = _1041 * _1211;
    float _1355 = _1345;
    if (!_626)
    {
        _1343 = _1249;
    }
    float _1357 = _1343;
    float _1359 = trunc(_1291);
    float _1361 = precise::max(_1359, 0.0);
    uint _1363 = uint(_1361);
    uint _1365 = uint(int(uint(_1351) >> uint(2)));
    uint _1367 = uint(int(uint(int(_1365)) >> uint(2)));
    int _1369 = int(_1365) & 3;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[int(_1367)][_1369];
    int _1373 = int(_1365) + 1;
    uint _1375 = uint(int(uint(_1373) >> uint(2)));
    int _1377 = _1373 & 3;
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[int(_1375)][_1377];
    float _1381 = _1317 * _1317;
    float _1383 = _1339 * _1339;
    float _1385 = _1357;
    float _1387 = _1381;
    float _1389 = _1383;
    if (_985)
    {
        float _1391 = -_1345;
        float _1393 = _1391 + 1.0;
        _1355 = _1393;
    }
    float _1395 = _1355;
    float _1397 = -_1353;
    float _1399 = fma(_1045, _1201, _1397);
    int _1401 = ~_454;
    int _1403 = _1401 + 1;
    float _1405 = _1381 + _1383;
    float _1407 = -_1329;
    float _1409 = _1407 + 1.0;
    int _1411 = _1351 + 8;
    uint _1413 = uint(int(uint(_1411) >> uint(2)));
    uint _1415 = uint(int(uint(int(_1413)) >> uint(2)));
    int _1417 = int(_1413) & 3;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[int(_1415)][_1417];
    int _1421 = int(_1413) + 1;
    uint _1423 = uint(int(uint(_1421) >> uint(2)));
    int _1425 = _1421 & 3;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[int(_1423)][_1425];
    float _1429 = _1399 * _1219;
    float _1431 = sqrt(_1405);
    if (_626)
    {
        _1385 = _1395;
    }
    float _1433 = _1385;
    float _1435 = _1309 * _1409;
    float _1437 = fma(_1203, _1233, _1429);
    int _1439 = _1269 & 3;
    bool _1441 = _1439 != 0;
    float _1443 = _1029 * _1435;
    int _1445 = int(_1199) + int(_1363);
    float _1447 = fma(_1043, _1193, _1437);
    bool _1449 = uint(_1439) > 1u;
    float _1451 = -_1309;
    float _1453 = _1451 + 1.0;
    int _1455 = _1269 & 3;
    bool _1457 = _1455 != 0;
    int _1459 = _1403 * _1445;
    int _1461 = _1459 + _899;
    float _1463 = _895 + _1447;
    float _1465 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1443);
    bool _1467 = _1431 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1469 = fma(_1257, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1463);
    bool _1471 = uint(_1461) >= uint(_454);
    float _1473 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1475 = _1457 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1477 = uint(_1439) >= 2u;
    int _1479 = ~as_type<int>(_1475);
    int _1481 = _1479 + 1;
    int _1483 = _1481 + 1;
    int _1485 = _1483;
    float _1487 = _1447;
    float _1489 = _1475;
    if (!_1449)
    {
        int _1491 = ~as_type<int>(_1475);
        int _1493 = _1491 + 1;
        _1485 = _1493;
    }
    int _1495 = _1485;
    bool _1497 = !_1471;
    int _1499 = _1497 ? 0 : (-1);
    int _1501 = abs(_1495);
    int _1503 = _1477 ? 0 : 1;
    float _1505 = as_type<float>(_1495);
    if (!_1467)
    {
        _1505 = _1297;
    }
    float _1507 = _1505;
    int _1509 = ~_1445;
    int _1511 = _1509 + _1499;
    int _1513 = _1511 + 1;
    bool _1515 = _1439 != 3;
    float _1517 = _1507;
    if (!_1467)
    {
        _1487 = _1311;
    }
    float _1519 = _1487;
    bool _1521 = !_1441;
    int _1523 = _1521 ? 0 : 1;
    int _1525 = ~_1503;
    int _1527 = _1525 + 1;
    int _1529 = _1527 + 1;
    int _1531 = ~_1501;
    int _1533 = _1531 + 1;
    int _1535 = _1533 + 1;
    float _1537 = _1519;
    int _1539 = _1529;
    if (!_1467)
    {
        _1489 = _1469;
    }
    float _1541 = _1489;
    bool _1543 = !_1467;
    float _1545 = _1541;
    if (!_1543)
    {
        float _1547 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1551 = _1431 + _1549;
        float _1553 = rsqrt(_1405);
        float _1555 = _1551 * _1547;
        float _1557 = _1469 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1559 = _1555 * 0.15915493667125701904296875;
        float _1561 = _1559 * 6.283185482025146484375;
        float _1563 = sin(_1561);
        float _1565 = _1559 * 6.283185482025146484375;
        float _1567 = cos(_1565);
        float _1569 = fma(_1563, _1557, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1571 = _1553 * _1569;
        float _1573 = _1567 + (-1.0);
        float _1575 = fma(_1317, _1571, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1577 = fma(_1339, _1571, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1579 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1583 = _1575 + _1581;
        float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1587 = _1577 + _1585;
        float _1589 = fma(_1469, _1567, _1579);
        float _1591 = _1583 * _1583;
        float _1593 = _1587 * _1587;
        _1545 = _1589;
        _1387 = _1591;
        _1389 = _1593;
        _1517 = _1575;
        _1537 = _1577;
    }
    float _1595 = _1545;
    float _1597 = _1387;
    float _1599 = _1389;
    float _1601 = _1517;
    float _1603 = _1537;
    bool _1605 = _1439 != 3;
    int _1607 = _1535 * as_type<int>(_1379);
    if (_1515)
    {
        int _1609 = ~_1503;
        int _1611 = _1609 + 1;
        _1539 = _1611;
    }
    int _1613 = _1539;
    float _1615 = in.m_49.w;
    int _1617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1619 = _1617 != 0;
    int _1621 = _454 * _1513;
    int _1623 = _1621 + _899;
    bool _1625 = !_1605;
    int _1627 = _1625 ? 0 : (-1);
    float _1629 = fma(_1263, _1347, _1465);
    int _1631 = abs(_1523);
    float _1633 = fma(_534, _1473, _486);
    int _1635 = abs(_1613);
    float _1637 = fma(_1283, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1629);
    bool _1639 = !_1619;
    int _1641 = _1639 ? 0 : 1;
    float _1643 = _1049 + 0.5;
    int _1645 = abs(_1627);
    float _1647 = _1633 + 0.5;
    int _1649 = ~_1631;
    int _1651 = _1649 + 1;
    int _1653 = _1651 + 1;
    float _1655 = _1637 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1657 = abs(_1641);
    int _1659 = _1653 * as_type<int>(_1371);
    int _1661 = _1659 + _1607;
    int _1663 = ~_1635;
    int _1665 = _1663 + 1;
    int _1667 = _1665 + 1;
    float _1669 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1671 = _1595 + _1669;
    out.m_51.x = _1647;
    out.m_51.y = _1643;
    int _1673 = ~_1645;
    int _1675 = _1673 + 1;
    int _1677 = _1675 + 1;
    int _1679 = _1667 * as_type<int>(_1419);
    int _1681 = _1679 + _1661;
    float _1683 = fma(_1671, _1671, _1597);
    int _1685 = ~_1657;
    int _1687 = _1685 + 1;
    int _1689 = _1687 + 1;
    out.m_53.w = _1615;
    int _1691 = _1677 * as_type<int>(_1427);
    int _1693 = _1691 + _1681;
    float _1695 = _1683 + _1599;
    bool _1697 = !_893;
    int _1699 = _1697 ? _1623 : (-1);
    out.m_55.w = _1655;
    int _1701 = _1693 * _1689;
    float _1703 = sqrt(_1695);
    int _1705 = _1699 * _1657;
    int _1707 = _1705 + _1701;
    float _1709 = float(_1707);
    out.m_57.x = _1709;
    bool _1711 = _1703 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1713 = isnan(_1703);
    bool _1715 = _1711 || _1713;
    bool _1717 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1719 = _1715 || _1717;
    float _1721 = as_type<float>(_1707);
    if (!_1719)
    {
        _1721 = 1.0;
    }
    float _1723 = _1721;
    bool _1725 = !_1719;
    float _1727 = _1723;
    if (!_1725)
    {
        bool _1729 = _1703 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1731 = isnan(_1703);
        bool _1733 = _1729 || _1731;
        bool _1735 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1737 = _1733 || _1735;
        if (!_1737)
        {
            float _1739 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1741 = _1703 + _1739;
            float _1743 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1745 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1743;
            float _1747 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1749 = _1747 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1751 = 1.0 / _1745;
            float _1753 = _1741 * _1751;
            float _1755 = fma(_1753, _1749, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1727 = _1755;
            _1757 = true;
        }
        else
        {
            bool _1759 = _1703 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1761 = isnan(_1703);
            bool _1763 = _1759 || _1761;
            bool _1765 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1767 = _1763 || _1765;
            if (!_1767)
            {
                float _1769 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1771 = _1703 + _1769;
                float _1773 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1775 = _1773 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1777 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1779 = _1777 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1781 = 1.0 / _1775;
                float _1783 = _1771 * _1781;
                float _1785 = fma(_1783, _1779, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1727 = _1785;
                _1757 = true;
            }
            else
            {
                _1727 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1757 = false;
    float _1787 = _1727;
    float _1789 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1791 = _1595 + _1789;
    float _1793 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1795 = _1601 + _1793;
    float _1797 = fma(_1791, _1787, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1799 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1801 = _1603 + _1799;
    float _1803 = fma(_1795, _1787, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1805 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1807 = fma(_1801, _1787, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1809 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1811 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1813 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1805);
    float _1815 = _1797 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1817 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1809);
    float _1819 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1811);
    float _1821 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1813);
    float _1823 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1815);
    float _1825 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1817);
    float _1827 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1819);
    float _1829 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1831 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1823);
    float _1833 = _1825 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1835 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1837 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1839 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1841 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1843 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1845 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1837);
    float _1847 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1839);
    float _1849 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1841);
    float _1851 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1843);
    float _1853 = _1831 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1855 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1845);
    float _1857 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1847);
    float _1859 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1849);
    float _1861 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1851);
    float _1863 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1855);
    float _1865 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1857);
    float _1867 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1859);
    float _1869 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1861);
    float _1871 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1873 = _1863 + _1869;
    float _1875 = _1867 + _1869;
    float _1877 = _1869 * 0.5;
    float _1879 = _1873 * 0.5;
    float _1881 = _1875 * 0.5;
    float _1883 = fma(_1865, -0.5, _1877);
    out.m_35.x = _1871;
    out.gl_Position.x = _1863;
    out.gl_Position.y = _1865;
    out.gl_Position.z = _1867;
    out.gl_Position.w = _1869;
    out.m_59.x = _1879;
    out.m_59.y = _1883;
    out.m_59.z = _1881;
    out.m_59.w = _1869;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

