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
    float4 m_55 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_41 [[attribute(1)]];
    float4 m_39 [[attribute(2)]];
    float4 m_30 [[attribute(3)]];
    float4 m_35 [[attribute(4)]];
    float4 m_43 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_45 [[attribute(8)]];
    float4 m_47 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _262 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_30.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    float _84 = _82;
    if (!_78)
    {
        out.m_33.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _82 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1493 = as_type<float>(_90);
        out.gl_Position.z = _1493;
    }
    if (!_78)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _94 = in.m_35.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _110 = 0.0;
    float _112 = _108;
    if (_104)
    {
        float _114 = float(_74);
        _110 = _114;
    }
    float _116 = _110;
    bool _118 = _108 >= _116;
    bool _120 = !_104;
    bool _122 = _118 || _120;
    if (_122)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _84;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _126 = _124 * 5.0;
        _92 = as_type<int>(_126);
    }
    int _128 = _92;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1562 = as_type<float>(_128);
        out.gl_Position.z = _1562;
    }
    if (_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_37.x;
    float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _134 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _136 = in.m_39.x;
    float _138 = in.m_39.y;
    float _140 = in.m_39.z;
    float _142 = _134 * _132;
    float _144 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[20].x, _142);
    float _146 = _144 * 6.283185482025146484375;
    float _148 = floor(_144);
    int _150 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _152 = _150 != 0;
    float _154 = _138 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _156 = _146 * 0.15915493667125701904296875;
    float _158 = _138 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _162 = _160 != 0;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _166 = _164 != 0;
    float _168 = _138 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _170 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[4].x, _154);
    float _172 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[5].x, _158);
    float _174 = _156 * 6.283185482025146484375;
    float _176 = cos(_174);
    bool _178 = !_162;
    int _180 = _178 ? 0 : 1;
    float _182 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[6].x, _168);
    bool _184 = !_152;
    int _186 = _184 ? 0 : 1;
    int _188 = abs(_180);
    float _190 = -_148;
    float _192 = _144 + _190;
    bool _194 = !_166;
    int _196 = _194 ? 0 : 1;
    int _198 = abs(_186);
    float _200 = float(_188);
    float _202 = -_192;
    float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _206 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _208 = fma(_176, 0.5, 0.5);
    int _210 = abs(_196);
    float _212 = abs(_204);
    float _214 = _200 * _212;
    bool _216 = _192 < 0.5;
    float _218 = float(_216);
    float _220 = -_208;
    float _222 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _224 = float(_198);
    float _226 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    float _228 = float(_210);
    float _230 = -_218;
    float _232 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _234 = fma(_224, _222, _214);
    float _236 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[4].z, _170);
    float _238 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[5].z, _172);
    float _240 = abs(_232);
    float _242 = fma(_228, _240, _234);
    bool _244 = !_206;
    float _260;
    if (!_244)
    {
        float _246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _248 = _130 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _250 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[12].x, _108);
        float _252 = _250 * _246;
        float _254 = floor(_252);
        float _256 = -_254;
        float _258 = _252 + _256;
        _260 = _258;
        _262 = true;
    }
    else
    {
        float _264 = float(_74);
        float _266 = 1.0 / _264;
        float _268 = _108 * _266;
        _260 = _268;
    }
    _262 = false;
    float _270 = _260;
    float _272 = in.m_37.z;
    float _274 = _130 * 2.0;
    float _276 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _278 = log2(_276);
    float _280 = in.m_30.x;
    float _282 = in.m_30.y;
    float _284 = in.m_30.z;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _294 = in.m_37.y;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _298 = _296 != 0;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _306 = _304 != 0;
    float _308 = floor(_274);
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _312 = _310 != 0;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = _270 + _314;
    bool _318 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_270);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = 1.0 / _292;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _334 = _272 * 2.0;
    float _336 = 1.0 / _288;
    bool _338 = _308 > 0.0;
    float _340 = _282 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _342 = _308 >= 0.0;
    bool _344 = isnan(_308);
    bool _346 = _342 || _344;
    bool _348 = isnan(0.0);
    bool _350 = _346 || _348;
    float _352 = _130 + _272;
    float _354 = _282 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _356 = _282 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _358 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].x, _340);
    float _360 = floor(_334);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _364 = _270 + _362;
    float _366 = _352 + (-1.0);
    float _368 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].x, _354);
    bool _370 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _372 = isnan(_270);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = _364 * _330;
    float _384 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].x, _356);
    int _386 = _350 ? 0 : 1;
    float _388 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _390 = _316 * _336;
    float _392 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _368);
    bool _394 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _396 = isnan(_270);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _410;
    bool _414 = _360 > 0.0;
    float _416 = fma(_408, _390, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _418 = _360 >= 0.0;
    bool _420 = isnan(_360);
    bool _422 = _418 || _420;
    bool _424 = isnan(0.0);
    bool _426 = _422 || _424;
    float _428 = -_380;
    float _430 = _428 + 1.0;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _432;
    float _436 = _408;
    float _438 = _412;
    if (!_312)
    {
        _436 = _294;
    }
    float _440 = _436;
    float _442 = fma(_412, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _444 = _404 * _430;
    float _446 = -_404;
    float _448 = _446 + 1.0;
    float _450 = fma(_434, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _452 = _440;
    if (!_312)
    {
        _438 = _440;
    }
    float _454 = _438;
    float _456 = _328 * _448;
    float _458 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _358);
    float _460 = _454;
    float _462 = _456;
    if (_312)
    {
        _460 = _130;
    }
    float _464 = _460;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _468 = _464;
    if (_312)
    {
        _452 = _294;
    }
    float _470 = _452;
    float _472 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _384);
    float _474 = _442 * _456;
    float _476 = _450 * _456;
    float _478 = _416 * _456;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    if (!_312)
    {
        _462 = _272;
    }
    float _484 = _462;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _488 = _464 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _490 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[83].z, _466);
    float _492 = _484;
    if (_312)
    {
        _492 = _470;
    }
    float _494 = _492;
    float _496 = -_486;
    float _498 = fma(_488, 2.0, _496);
    if (!_312)
    {
        _468 = _272;
    }
    float _500 = _468;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _504 = _500;
    if (_312)
    {
        _504 = _470;
    }
    float _506 = _504;
    float _508 = _494 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _518 = _278 * _108;
    float _520 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[83].w, _332);
    float _522 = fma(_508, -2.0, _502);
    float _524 = fma(_482, _382, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _526 = fma(_512, _382, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _528 = fma(_516, _382, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _530 = !_302;
    int _532 = _530 ? 0 : 1;
    float _534 = _130 + _470;
    float _536 = _272 + _470;
    int _538 = _426 ? 0 : 1;
    float _540 = _470 * 2.0;
    float _542 = exp2(_518);
    int _544 = abs(_532);
    float _546 = _534 + (-1.0);
    float _548 = _536 + (-1.0);
    int _550 = ~_538;
    int _552 = _550 + 1;
    int _554 = _552 + 1;
    float _556 = _458 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _558 = _554;
    if (!_414)
    {
        int _560 = ~_538;
        int _562 = _560 + 1;
        _558 = _562;
    }
    int _564 = _558;
    float _566 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _568 = floor(_540);
    int _570 = ~_386;
    int _572 = _570 + 1;
    int _574 = _572 + 1;
    float _576 = -_108;
    float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[81].x, _498);
    float _580 = _392 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _582 = _574;
    float _584 = _580;
    if (!_338)
    {
        int _586 = ~_386;
        int _588 = _586 + 1;
        _582 = _588;
    }
    int _590 = _582;
    float _592 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _594 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _596 = isnan(1.0);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _602 = _598 || _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _606 = 1.0 + _604;
    float _608 = float(_544);
    float _610 = -_542;
    float _612 = _610 + 1.0;
    float _614 = in.m_41.x;
    float _616 = in.m_41.y;
    float _618 = in.m_41.z;
    float _620 = 1.0 / _606;
    float _622 = float(_590);
    float _624 = _470 + (-0.5);
    bool _626 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _634 = _630 || _632;
    float _636 = _472 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _638 = _568 > 0.0;
    float _640 = _130 + (-0.5);
    bool _642 = _568 >= 0.0;
    bool _644 = isnan(_568);
    bool _646 = _642 || _644;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    float _652 = _608 * _622;
    float _654 = _634 ? _612 : 0.0;
    float _656 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _490);
    float _658 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _522);
    bool _660 = !_298;
    int _662 = _660 ? 0 : 1;
    float _664 = _652 * (-2.0);
    float _666 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _520);
    bool _668 = !_306;
    int _670 = _668 ? 0 : 1;
    if (_602)
    {
        float _672 = _654 * _620;
        _112 = _672;
    }
    float _674 = _112;
    int _676 = abs(_662);
    float _678 = -_556;
    float _680 = _678 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _682 = fma(_566, _664, _566);
    float _684 = -_580;
    float _686 = _684 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _688 = abs(_670);
    float _690 = _680 * _680;
    float _692 = fma(_664, _616, _616);
    float _694 = float(_676);
    float _696 = -_636;
    float _698 = _696 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _700 = _650 ? 0 : 1;
    float _702 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[196].y, _692);
    float _704 = float(_564);
    float _706 = fma(_686, _686, _690);
    int _708 = ~_700;
    int _710 = _708 + 1;
    int _712 = _710 + 1;
    float _714 = fma(_682, _674, _702);
    float _716 = _694 * _704;
    int _718 = _712;
    if (!_638)
    {
        int _720 = ~_700;
        int _722 = _720 + 1;
        _718 = _722;
    }
    int _724 = _718;
    float _726 = fma(_698, _698, _706);
    float _728 = float(_688);
    float _730 = _716 * (-2.0);
    float _732 = float(_724);
    float _734 = -_328;
    float _736 = _734 + 1.0;
    float _738 = _272 + (-0.5);
    float _740 = rsqrt(_726);
    float _742 = fma(_730, _614, _614);
    float _744 = _728 * _732;
    float _746 = fma(_592, _730, _592);
    float _748 = _714 * 0.15915493667125701904296875;
    float _750 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[196].x, _742);
    float _752 = _744 * (-2.0);
    float _754 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[143].z, _478);
    float _756 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[143].y, _476);
    float _758 = fma(_746, _674, _750);
    float _760 = fma(_752, _618, _618);
    float _762 = in.m_43.x;
    float _764 = in.m_43.y;
    float _766 = in.m_43.z;
    float _768 = fma(_388, _752, _388);
    float _770 = _748 * 6.283185482025146484375;
    float _772 = sin(_770);
    float _774 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[196].z, _760);
    float _776 = in.m_45.x;
    float _778 = in.m_45.y;
    float _780 = in.m_45.z;
    float _782 = _686 * _740;
    float _784 = _680 * _740;
    float _786 = _698 * _740;
    float _788 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[143].x, _474);
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _792 = _782 * _790;
    float _794 = _748 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _800 = _786 * _798;
    float _802 = fma(_524, _444, _788);
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _806 = -_792;
    float _808 = fma(_786, _804, _806);
    float _810 = fma(_528, _444, _754);
    float _812 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _814 = _784 * _812;
    float _816 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[145].x, _802);
    float _818 = fma(_768, _674, _774);
    float _820 = fma(_526, _444, _756);
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _824 = -_800;
    float _826 = fma(_784, _822, _824);
    float _828 = _808 * _808;
    float _830 = _758 * 0.15915493667125701904296875;
    float _832 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[145].z, _810);
    float _834 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _836 = -_814;
    float _838 = fma(_782, _834, _836);
    float _840 = fma(_826, _826, _828);
    float _842 = _818 * 0.15915493667125701904296875;
    float _844 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[145].y, _820);
    float _846 = _830 * 6.283185482025146484375;
    float _848 = sin(_846);
    float _850 = _816 * _776;
    float _852 = _832 * _780;
    float _854 = fma(_838, _838, _840);
    float _856 = _844 * _778;
    float _858 = _242 * _850;
    float _860 = _242 * _852;
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _762);
    float _864 = _830 * 6.283185482025146484375;
    float _866 = cos(_864);
    float _868 = _858 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _870 = _242 * _856;
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _764);
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _766);
    float _876 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _878 = _870 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _880 = _868 * _862;
    float _882 = _842 * 6.283185482025146484375;
    float _884 = cos(_882);
    float _886 = _848 * _796;
    float _888 = _878 * _872;
    float _890 = _876 * _874;
    float _892 = _848 * _772;
    float _894 = _842 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = _866 * _772;
    float _900 = _866 * _796;
    float _902 = rsqrt(_854);
    float _904 = _884 * _888;
    float _906 = _796 * _884;
    float _908 = _772 * _884;
    float _910 = _866 * _904;
    float _912 = _848 * _904;
    float _914 = -_898;
    float _916 = fma(_896, _886, _914);
    float _918 = -_886;
    float _920 = fma(_896, _898, _918);
    float _922 = fma(_896, _900, _892);
    float _924 = fma(_896, _892, _900);
    float _926 = -_888;
    float _928 = _896 * _926;
    float _930 = fma(_916, _880, _912);
    float _932 = fma(_922, _880, _910);
    float _934 = _838 * _902;
    float _936 = _826 * _902;
    float _938 = _808 * _902;
    float _940 = fma(_906, _880, _928);
    float _942 = _782 * _934;
    float _944 = fma(_920, _890, _932);
    float _946 = _786 * _938;
    float _948 = fma(_908, _890, _940);
    float _950 = -_942;
    float _952 = fma(_786, _936, _950);
    float _954 = _784 * _936;
    float _956 = -_946;
    float _958 = fma(_784, _934, _956);
    float _960 = fma(_924, _890, _930);
    float _962 = _952 * _944;
    float _964 = -_954;
    float _966 = fma(_782, _938, _964);
    float _968 = _958 * _944;
    float _970 = fma(_938, _948, _962);
    float _972 = _966 * _944;
    float _974 = fma(_936, _948, _968);
    float _976 = in.m_37.w;
    float _978 = fma(_784, _960, _970);
    float _980 = fma(_934, _948, _972);
    float _982 = fma(_782, _960, _974);
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[191].x * 0.449999988079071044921875;
    float _986 = _978 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _988 = fma(_786, _960, _980);
    float _990 = in.m_47.y;
    float _992 = _556 + _978;
    float _994 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[8].x, _986);
    float _996 = _580 + _982;
    float _998 = fma(_988, (*spvDescriptorSet0.vp_c10)._m0[10].x, _994);
    float _1000 = _636 + _988;
    float _1002 = _998 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1004 = fma(_1002, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1000);
    float _1006 = fma(_1002, (*spvDescriptorSet0.vp_c10)._m0[8].x, _996);
    float _1008 = fma(_1002, (*spvDescriptorSet0.vp_c10)._m0[9].x, _992);
    float _1010 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1004);
    float _1012 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1006);
    float _1014 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1008);
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1018 = _1010 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1022 = _1012 + _1020;
    float _1024 = _1018 * _1018;
    float _1026 = fma(_1022, _1022, _1024);
    float _1028 = sqrt(_1026);
    bool _1030 = _1028 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1032 = _1002;
    float _1034 = _1024;
    float _1036 = _984;
    float _1038 = _980;
    if (!_1030)
    {
        _1032 = _1012;
    }
    float _1040 = _1032;
    float _1042 = _1040;
    if (!_1030)
    {
        _1034 = _1010;
    }
    float _1044 = _1034;
    float _1046 = _1044;
    if (!_1030)
    {
        _1036 = _1014;
    }
    float _1048 = _1036;
    bool _1050 = !_1030;
    float _1052 = _1048;
    float _1054 = _990;
    if (!_1050)
    {
        float _1056 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1060 = _1028 + _1058;
        float _1062 = _1014 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1064 = rsqrt(_1026);
        float _1066 = _1060 * _1056;
        float _1068 = _1066 * 0.15915493667125701904296875;
        float _1070 = _1068 * 6.283185482025146484375;
        float _1072 = cos(_1070);
        float _1074 = _1068 * 6.283185482025146484375;
        float _1076 = sin(_1074);
        float _1078 = _1072 + (-1.0);
        float _1080 = fma(_1076, _1062, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1082 = _1078 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1084 = _1064 * _1080;
        float _1086 = fma(_1014, _1072, _1082);
        float _1088 = fma(_1022, _1084, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1090 = fma(_1018, _1084, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1052 = _1086;
        _1042 = _1088;
        _1046 = _1090;
    }
    float _1092 = _1052;
    float _1094 = _1042;
    float _1096 = _1046;
    float _1098 = -_556;
    float _1100 = _1098 + _1092;
    float _1102 = in.m_47.x;
    float _1104 = -_580;
    float _1106 = _1104 + _1094;
    float _1108 = _1100 * _1100;
    float _1110 = -_636;
    float _1112 = _1110 + _1096;
    float _1114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1116 = fma(_1106, _1106, _1108);
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1120 = _1118 != 0;
    out.m_49.x = _580;
    out.m_49.y = _556;
    out.m_49.z = _636;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1124 = _1122 != 0;
    float _1126 = fma(_1112, _1112, _1116);
    bool _1128 = _272 > 0.5;
    bool _1130 = _1128 && _1120;
    float _1132 = _556 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1136 = _976 > 0.5;
    float _1138 = -_990;
    float _1140 = _1138 + 1.0;
    float _1142 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1132);
    float _1144 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1142);
    float _1146 = sqrt(_1126);
    float _1148 = _556 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1150 = _1140;
    float _1152 = _1092;
    float _1154 = _1094;
    float _1156 = _1096;
    if (_1120)
    {
        _1038 = _1102;
    }
    float _1158 = _1038;
    float _1160 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1162 = _1158;
    if (_1124)
    {
        float _1164 = _1136 ? _1140 : _990;
        _1054 = _1164;
    }
    float _1166 = _1054;
    float _1168 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1148);
    if (!_1120)
    {
        _1150 = _1102;
    }
    float _1170 = _1150;
    float _1172 = _1170;
    if (_1130)
    {
        float _1174 = -_1158;
        float _1176 = _1174 + 1.0;
        _1162 = _1176;
    }
    float _1178 = _1162;
    float _1180 = 1.0 / _1160;
    float _1182 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1168);
    float _1184 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1186 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1120)
    {
        _1172 = _1178;
    }
    float _1188 = _1172;
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1192 = fma(_1184, _1166, -0.5);
    bool _1194 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1196 = isnan(0.5);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1202 = _1198 || _1200;
    bool _1204 = _1146 > 0.0;
    float _1206 = fma(_1186, _1188, -0.5);
    float _1208 = _1190 + _1160;
    float _1210 = -_658;
    float _1212 = fma(_666, _1192, _1210);
    float _1214 = fma(_656, _1206, _578);
    float _1216 = _1208 * _1180;
    float _1218 = _1216 * 0.5;
    bool _1220 = !_1204;
    if (!_1220)
    {
        float _1222 = _238 * _238;
        float _1224 = fma(_236, _236, _1222);
        float _1226 = rsqrt(_1126);
        float _1228 = fma(_226, _226, _1224);
        float _1230 = sqrt(_1228);
        float _1232 = _1106 * _1226;
        float _1234 = _1100 * _1226;
        float _1236 = _1112 * _1226;
        bool _1238 = _1230 > 0.0;
        bool _1240 = !_1238;
        _584 = _1226;
        if (!_1240)
        {
            float _1242 = rsqrt(_1228);
            float _1244 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1246 = _238 * _1242;
            float _1248 = _236 * _1242;
            float _1250 = _226 * _1242;
            float _1252 = _1234 * _1246;
            float _1254 = fma(_1232, _1248, _1252);
            float _1256 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1258 = fma(_1236, _1250, _1254);
            float _1260 = _1258 * _1256;
            float _1262 = fma(_236, _1260, _1094);
            float _1264 = fma(_238, _1260, _1092);
            float _1266 = fma(_226, _1260, _1096);
            _1152 = _1264;
            _1154 = _1262;
            _1156 = _1266;
            _584 = _1260;
        }
    }
    float _1268 = _1152;
    float _1270 = _1154;
    float _1272 = _1156;
    float _1274 = _584;
    float _1276 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1278 = _1274;
    if (_1202)
    {
        _1278 = 1.0;
    }
    float _1280 = _1278;
    float _1282 = _1280;
    if (!_1202)
    {
        float _1284 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1286 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1288 = _1284 * 0.15915493667125701904296875;
        float _1290 = _1286 * 0.15915493667125701904296875;
        float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1294 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1292);
        float _1296 = _1288 * 6.283185482025146484375;
        float _1298 = cos(_1296);
        float _1300 = _1288 * 6.283185482025146484375;
        float _1302 = sin(_1300);
        float _1304 = 1.0 / _1298;
        float _1306 = _1290 * 6.283185482025146484375;
        float _1308 = cos(_1306);
        float _1310 = _1302 * _1304;
        float _1312 = _1290 * 6.283185482025146484375;
        float _1314 = sin(_1312);
        float _1316 = _1308 * _1310;
        float _1318 = 1.0 / _1294;
        float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1322 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1320;
        float _1324 = 1.0 / _1316;
        float _1326 = 1.0 / _1322;
        float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1330 = _1318 * _1328;
        float _1332 = _1314 * _1324;
        float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1336 = fma(_1332, _1330, _1334);
        float _1338 = _1336 * _1326;
        float _1340 = precise::clamp(_1338, 0.0, 1.0);
        _1282 = _1340;
    }
    float _1342 = _1282;
    float _1344 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1346 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1276);
    float _1348 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1350 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1352 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1344);
    float _1354 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1346);
    float _1356 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1348);
    float _1358 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1350);
    float _1360 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1352);
    float _1362 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1364 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1356);
    float _1366 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1358);
    float _1368 = _1360 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1370 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1372 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1374 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1376 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1378 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1380 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1370);
    float _1382 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1372);
    float _1384 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1374);
    float _1386 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1376);
    float _1388 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1390 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1380);
    float _1392 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1382);
    float _1394 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1384);
    float _1396 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1386);
    bool _1398 = _1342 > 0.0;
    bool _1400 = isnan(_1342);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan(0.0);
    bool _1406 = _1402 || _1404;
    float _1408 = _1342 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1410 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1390);
    float _1412 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1392);
    float _1414 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1394);
    float _1416 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1396);
    float _1418 = _1408 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1420 = _1214 + 0.5;
    float _1422 = _1212 + 0.5;
    float _1424 = _1410 + _1416;
    float _1426 = _1414 + _1416;
    float _1428 = _1416 * 0.5;
    float _1430 = _1424 * 0.5;
    float _1432 = _1426 * 0.5;
    float _1434 = fma(_1412, -0.5, _1428);
    out.m_51.z = _1420;
    out.m_51.w = _1422;
    out.m_53.y = _878;
    out.m_33.x = _1418;
    out.gl_Position.x = _1410;
    out.gl_Position.y = _1412;
    out.gl_Position.z = _1414;
    out.gl_Position.w = _1416;
    out.m_55.x = _1430;
    out.m_55.y = _1434;
    out.m_55.z = _1432;
    out.m_55.w = _1416;
    if (_1406)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1436 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1436;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _262 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_30.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    float _84 = _82;
    if (!_78)
    {
        out.m_33.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _82 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1493 = as_type<float>(_90);
        out.gl_Position.z = _1493;
    }
    if (!_78)
    {
        return out;
    }
    float _94 = in.m_35.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _110 = 0.0;
    float _112 = _108;
    if (_104)
    {
        float _114 = float(_74);
        _110 = _114;
    }
    float _116 = _110;
    bool _118 = _108 >= _116;
    bool _120 = !_104;
    bool _122 = _118 || _120;
    if (_122)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _84;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _126 = _124 * 5.0;
        _92 = as_type<int>(_126);
    }
    int _128 = _92;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1562 = as_type<float>(_128);
        out.gl_Position.z = _1562;
    }
    if (_122)
    {
        return out;
    }
    float _130 = in.m_37.x;
    float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _134 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _136 = in.m_39.x;
    float _138 = in.m_39.y;
    float _140 = in.m_39.z;
    float _142 = _134 * _132;
    float _144 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[20].x, _142);
    float _146 = _144 * 6.283185482025146484375;
    float _148 = floor(_144);
    int _150 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _152 = _150 != 0;
    float _154 = _138 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _156 = _146 * 0.15915493667125701904296875;
    float _158 = _138 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _162 = _160 != 0;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _166 = _164 != 0;
    float _168 = _138 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _170 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[4].x, _154);
    float _172 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[5].x, _158);
    float _174 = _156 * 6.283185482025146484375;
    float _176 = cos(_174);
    bool _178 = !_162;
    int _180 = _178 ? 0 : 1;
    float _182 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[6].x, _168);
    bool _184 = !_152;
    int _186 = _184 ? 0 : 1;
    int _188 = abs(_180);
    float _190 = -_148;
    float _192 = _144 + _190;
    bool _194 = !_166;
    int _196 = _194 ? 0 : 1;
    int _198 = abs(_186);
    float _200 = float(_188);
    float _202 = -_192;
    float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _206 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _208 = fma(_176, 0.5, 0.5);
    int _210 = abs(_196);
    float _212 = abs(_204);
    float _214 = _200 * _212;
    bool _216 = _192 < 0.5;
    float _218 = float(_216);
    float _220 = -_208;
    float _222 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _224 = float(_198);
    float _226 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    float _228 = float(_210);
    float _230 = -_218;
    float _232 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _234 = fma(_224, _222, _214);
    float _236 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[4].z, _170);
    float _238 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[5].z, _172);
    float _240 = abs(_232);
    float _242 = fma(_228, _240, _234);
    bool _244 = !_206;
    float _260;
    if (!_244)
    {
        float _246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _248 = _130 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _250 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[12].x, _108);
        float _252 = _250 * _246;
        float _254 = floor(_252);
        float _256 = -_254;
        float _258 = _252 + _256;
        _260 = _258;
        _262 = true;
    }
    else
    {
        float _264 = float(_74);
        float _266 = 1.0 / _264;
        float _268 = _108 * _266;
        _260 = _268;
    }
    _262 = false;
    float _270 = _260;
    float _272 = in.m_37.z;
    float _274 = _130 * 2.0;
    float _276 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _278 = log2(_276);
    float _280 = in.m_30.x;
    float _282 = in.m_30.y;
    float _284 = in.m_30.z;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _294 = in.m_37.y;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _298 = _296 != 0;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _306 = _304 != 0;
    float _308 = floor(_274);
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _312 = _310 != 0;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = _270 + _314;
    bool _318 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_270);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = 1.0 / _292;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _334 = _272 * 2.0;
    float _336 = 1.0 / _288;
    bool _338 = _308 > 0.0;
    float _340 = _282 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _342 = _308 >= 0.0;
    bool _344 = isnan(_308);
    bool _346 = _342 || _344;
    bool _348 = isnan(0.0);
    bool _350 = _346 || _348;
    float _352 = _130 + _272;
    float _354 = _282 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _356 = _282 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _358 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].x, _340);
    float _360 = floor(_334);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _364 = _270 + _362;
    float _366 = _352 + (-1.0);
    float _368 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].x, _354);
    bool _370 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _372 = isnan(_270);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = _364 * _330;
    float _384 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].x, _356);
    int _386 = _350 ? 0 : 1;
    float _388 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _390 = _316 * _336;
    float _392 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _368);
    bool _394 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _396 = isnan(_270);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _410;
    bool _414 = _360 > 0.0;
    float _416 = fma(_408, _390, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _418 = _360 >= 0.0;
    bool _420 = isnan(_360);
    bool _422 = _418 || _420;
    bool _424 = isnan(0.0);
    bool _426 = _422 || _424;
    float _428 = -_380;
    float _430 = _428 + 1.0;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _432;
    float _436 = _408;
    float _438 = _412;
    if (!_312)
    {
        _436 = _294;
    }
    float _440 = _436;
    float _442 = fma(_412, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _444 = _404 * _430;
    float _446 = -_404;
    float _448 = _446 + 1.0;
    float _450 = fma(_434, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _452 = _440;
    if (!_312)
    {
        _438 = _440;
    }
    float _454 = _438;
    float _456 = _328 * _448;
    float _458 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _358);
    float _460 = _454;
    float _462 = _456;
    if (_312)
    {
        _460 = _130;
    }
    float _464 = _460;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _468 = _464;
    if (_312)
    {
        _452 = _294;
    }
    float _470 = _452;
    float _472 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _384);
    float _474 = _442 * _456;
    float _476 = _450 * _456;
    float _478 = _416 * _456;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    if (!_312)
    {
        _462 = _272;
    }
    float _484 = _462;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _488 = _464 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _490 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[83].z, _466);
    float _492 = _484;
    if (_312)
    {
        _492 = _470;
    }
    float _494 = _492;
    float _496 = -_486;
    float _498 = fma(_488, 2.0, _496);
    if (!_312)
    {
        _468 = _272;
    }
    float _500 = _468;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _504 = _500;
    if (_312)
    {
        _504 = _470;
    }
    float _506 = _504;
    float _508 = _494 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _518 = _278 * _108;
    float _520 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[83].w, _332);
    float _522 = fma(_508, -2.0, _502);
    float _524 = fma(_482, _382, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _526 = fma(_512, _382, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _528 = fma(_516, _382, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _530 = !_302;
    int _532 = _530 ? 0 : 1;
    float _534 = _130 + _470;
    float _536 = _272 + _470;
    int _538 = _426 ? 0 : 1;
    float _540 = _470 * 2.0;
    float _542 = exp2(_518);
    int _544 = abs(_532);
    float _546 = _534 + (-1.0);
    float _548 = _536 + (-1.0);
    int _550 = ~_538;
    int _552 = _550 + 1;
    int _554 = _552 + 1;
    float _556 = _458 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _558 = _554;
    if (!_414)
    {
        int _560 = ~_538;
        int _562 = _560 + 1;
        _558 = _562;
    }
    int _564 = _558;
    float _566 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _568 = floor(_540);
    int _570 = ~_386;
    int _572 = _570 + 1;
    int _574 = _572 + 1;
    float _576 = -_108;
    float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[81].x, _498);
    float _580 = _392 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _582 = _574;
    float _584 = _580;
    if (!_338)
    {
        int _586 = ~_386;
        int _588 = _586 + 1;
        _582 = _588;
    }
    int _590 = _582;
    float _592 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _594 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _596 = isnan(1.0);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _602 = _598 || _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _606 = 1.0 + _604;
    float _608 = float(_544);
    float _610 = -_542;
    float _612 = _610 + 1.0;
    float _614 = in.m_41.x;
    float _616 = in.m_41.y;
    float _618 = in.m_41.z;
    float _620 = 1.0 / _606;
    float _622 = float(_590);
    float _624 = _470 + (-0.5);
    bool _626 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _634 = _630 || _632;
    float _636 = _472 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _638 = _568 > 0.0;
    float _640 = _130 + (-0.5);
    bool _642 = _568 >= 0.0;
    bool _644 = isnan(_568);
    bool _646 = _642 || _644;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    float _652 = _608 * _622;
    float _654 = _634 ? _612 : 0.0;
    float _656 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _490);
    float _658 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _522);
    bool _660 = !_298;
    int _662 = _660 ? 0 : 1;
    float _664 = _652 * (-2.0);
    float _666 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _520);
    bool _668 = !_306;
    int _670 = _668 ? 0 : 1;
    if (_602)
    {
        float _672 = _654 * _620;
        _112 = _672;
    }
    float _674 = _112;
    int _676 = abs(_662);
    float _678 = -_556;
    float _680 = _678 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _682 = fma(_566, _664, _566);
    float _684 = -_580;
    float _686 = _684 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _688 = abs(_670);
    float _690 = _680 * _680;
    float _692 = fma(_664, _616, _616);
    float _694 = float(_676);
    float _696 = -_636;
    float _698 = _696 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _700 = _650 ? 0 : 1;
    float _702 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[196].y, _692);
    float _704 = float(_564);
    float _706 = fma(_686, _686, _690);
    int _708 = ~_700;
    int _710 = _708 + 1;
    int _712 = _710 + 1;
    float _714 = fma(_682, _674, _702);
    float _716 = _694 * _704;
    int _718 = _712;
    if (!_638)
    {
        int _720 = ~_700;
        int _722 = _720 + 1;
        _718 = _722;
    }
    int _724 = _718;
    float _726 = fma(_698, _698, _706);
    float _728 = float(_688);
    float _730 = _716 * (-2.0);
    float _732 = float(_724);
    float _734 = -_328;
    float _736 = _734 + 1.0;
    float _738 = _272 + (-0.5);
    float _740 = rsqrt(_726);
    float _742 = fma(_730, _614, _614);
    float _744 = _728 * _732;
    float _746 = fma(_592, _730, _592);
    float _748 = _714 * 0.15915493667125701904296875;
    float _750 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[196].x, _742);
    float _752 = _744 * (-2.0);
    float _754 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[143].z, _478);
    float _756 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[143].y, _476);
    float _758 = fma(_746, _674, _750);
    float _760 = fma(_752, _618, _618);
    float _762 = in.m_43.x;
    float _764 = in.m_43.y;
    float _766 = in.m_43.z;
    float _768 = fma(_388, _752, _388);
    float _770 = _748 * 6.283185482025146484375;
    float _772 = sin(_770);
    float _774 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[196].z, _760);
    float _776 = in.m_45.x;
    float _778 = in.m_45.y;
    float _780 = in.m_45.z;
    float _782 = _686 * _740;
    float _784 = _680 * _740;
    float _786 = _698 * _740;
    float _788 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[143].x, _474);
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _792 = _782 * _790;
    float _794 = _748 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _800 = _786 * _798;
    float _802 = fma(_524, _444, _788);
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _806 = -_792;
    float _808 = fma(_786, _804, _806);
    float _810 = fma(_528, _444, _754);
    float _812 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _814 = _784 * _812;
    float _816 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[145].x, _802);
    float _818 = fma(_768, _674, _774);
    float _820 = fma(_526, _444, _756);
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _824 = -_800;
    float _826 = fma(_784, _822, _824);
    float _828 = _808 * _808;
    float _830 = _758 * 0.15915493667125701904296875;
    float _832 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[145].z, _810);
    float _834 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _836 = -_814;
    float _838 = fma(_782, _834, _836);
    float _840 = fma(_826, _826, _828);
    float _842 = _818 * 0.15915493667125701904296875;
    float _844 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[145].y, _820);
    float _846 = _830 * 6.283185482025146484375;
    float _848 = sin(_846);
    float _850 = _816 * _776;
    float _852 = _832 * _780;
    float _854 = fma(_838, _838, _840);
    float _856 = _844 * _778;
    float _858 = _242 * _850;
    float _860 = _242 * _852;
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _762);
    float _864 = _830 * 6.283185482025146484375;
    float _866 = cos(_864);
    float _868 = _858 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _870 = _242 * _856;
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _764);
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _766);
    float _876 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _878 = _870 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _880 = _868 * _862;
    float _882 = _842 * 6.283185482025146484375;
    float _884 = cos(_882);
    float _886 = _848 * _796;
    float _888 = _878 * _872;
    float _890 = _876 * _874;
    float _892 = _848 * _772;
    float _894 = _842 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = _866 * _772;
    float _900 = _866 * _796;
    float _902 = rsqrt(_854);
    float _904 = _884 * _888;
    float _906 = _796 * _884;
    float _908 = _772 * _884;
    float _910 = _866 * _904;
    float _912 = _848 * _904;
    float _914 = -_898;
    float _916 = fma(_896, _886, _914);
    float _918 = -_886;
    float _920 = fma(_896, _898, _918);
    float _922 = fma(_896, _900, _892);
    float _924 = fma(_896, _892, _900);
    float _926 = -_888;
    float _928 = _896 * _926;
    float _930 = fma(_916, _880, _912);
    float _932 = fma(_922, _880, _910);
    float _934 = _838 * _902;
    float _936 = _826 * _902;
    float _938 = _808 * _902;
    float _940 = fma(_906, _880, _928);
    float _942 = _782 * _934;
    float _944 = fma(_920, _890, _932);
    float _946 = _786 * _938;
    float _948 = fma(_908, _890, _940);
    float _950 = -_942;
    float _952 = fma(_786, _936, _950);
    float _954 = _784 * _936;
    float _956 = -_946;
    float _958 = fma(_784, _934, _956);
    float _960 = fma(_924, _890, _930);
    float _962 = _952 * _944;
    float _964 = -_954;
    float _966 = fma(_782, _938, _964);
    float _968 = _958 * _944;
    float _970 = fma(_938, _948, _962);
    float _972 = _966 * _944;
    float _974 = fma(_936, _948, _968);
    float _976 = in.m_37.w;
    float _978 = fma(_784, _960, _970);
    float _980 = fma(_934, _948, _972);
    float _982 = fma(_782, _960, _974);
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[191].x * 0.449999988079071044921875;
    float _986 = _978 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _988 = fma(_786, _960, _980);
    float _990 = in.m_47.y;
    float _992 = _556 + _978;
    float _994 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[8].x, _986);
    float _996 = _580 + _982;
    float _998 = fma(_988, (*spvDescriptorSet0.vp_c10)._m0[10].x, _994);
    float _1000 = _636 + _988;
    float _1002 = _998 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1004 = fma(_1002, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1000);
    float _1006 = fma(_1002, (*spvDescriptorSet0.vp_c10)._m0[8].x, _996);
    float _1008 = fma(_1002, (*spvDescriptorSet0.vp_c10)._m0[9].x, _992);
    float _1010 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1004);
    float _1012 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1006);
    float _1014 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1008);
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1018 = _1010 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1022 = _1012 + _1020;
    float _1024 = _1018 * _1018;
    float _1026 = fma(_1022, _1022, _1024);
    float _1028 = sqrt(_1026);
    bool _1030 = _1028 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1032 = _1002;
    float _1034 = _1024;
    float _1036 = _984;
    float _1038 = _980;
    if (!_1030)
    {
        _1032 = _1012;
    }
    float _1040 = _1032;
    float _1042 = _1040;
    if (!_1030)
    {
        _1034 = _1010;
    }
    float _1044 = _1034;
    float _1046 = _1044;
    if (!_1030)
    {
        _1036 = _1014;
    }
    float _1048 = _1036;
    bool _1050 = !_1030;
    float _1052 = _1048;
    float _1054 = _990;
    if (!_1050)
    {
        float _1056 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1060 = _1028 + _1058;
        float _1062 = _1014 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1064 = rsqrt(_1026);
        float _1066 = _1060 * _1056;
        float _1068 = _1066 * 0.15915493667125701904296875;
        float _1070 = _1068 * 6.283185482025146484375;
        float _1072 = cos(_1070);
        float _1074 = _1068 * 6.283185482025146484375;
        float _1076 = sin(_1074);
        float _1078 = _1072 + (-1.0);
        float _1080 = fma(_1076, _1062, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1082 = _1078 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1084 = _1064 * _1080;
        float _1086 = fma(_1014, _1072, _1082);
        float _1088 = fma(_1022, _1084, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1090 = fma(_1018, _1084, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1052 = _1086;
        _1042 = _1088;
        _1046 = _1090;
    }
    float _1092 = _1052;
    float _1094 = _1042;
    float _1096 = _1046;
    float _1098 = -_556;
    float _1100 = _1098 + _1092;
    float _1102 = in.m_47.x;
    float _1104 = -_580;
    float _1106 = _1104 + _1094;
    float _1108 = _1100 * _1100;
    float _1110 = -_636;
    float _1112 = _1110 + _1096;
    float _1114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1116 = fma(_1106, _1106, _1108);
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1120 = _1118 != 0;
    out.m_49.x = _580;
    out.m_49.y = _556;
    out.m_49.z = _636;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1124 = _1122 != 0;
    float _1126 = fma(_1112, _1112, _1116);
    bool _1128 = _272 > 0.5;
    bool _1130 = _1128 && _1120;
    float _1132 = _556 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1136 = _976 > 0.5;
    float _1138 = -_990;
    float _1140 = _1138 + 1.0;
    float _1142 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1132);
    float _1144 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1142);
    float _1146 = sqrt(_1126);
    float _1148 = _556 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1150 = _1140;
    float _1152 = _1092;
    float _1154 = _1094;
    float _1156 = _1096;
    if (_1120)
    {
        _1038 = _1102;
    }
    float _1158 = _1038;
    float _1160 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1162 = _1158;
    if (_1124)
    {
        float _1164 = _1136 ? _1140 : _990;
        _1054 = _1164;
    }
    float _1166 = _1054;
    float _1168 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1148);
    if (!_1120)
    {
        _1150 = _1102;
    }
    float _1170 = _1150;
    float _1172 = _1170;
    if (_1130)
    {
        float _1174 = -_1158;
        float _1176 = _1174 + 1.0;
        _1162 = _1176;
    }
    float _1178 = _1162;
    float _1180 = 1.0 / _1160;
    float _1182 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1168);
    float _1184 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1186 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1120)
    {
        _1172 = _1178;
    }
    float _1188 = _1172;
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1192 = fma(_1184, _1166, -0.5);
    bool _1194 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1196 = isnan(0.5);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1202 = _1198 || _1200;
    bool _1204 = _1146 > 0.0;
    float _1206 = fma(_1186, _1188, -0.5);
    float _1208 = _1190 + _1160;
    float _1210 = -_658;
    float _1212 = fma(_666, _1192, _1210);
    float _1214 = fma(_656, _1206, _578);
    float _1216 = _1208 * _1180;
    float _1218 = _1216 * 0.5;
    bool _1220 = !_1204;
    if (!_1220)
    {
        float _1222 = _238 * _238;
        float _1224 = fma(_236, _236, _1222);
        float _1226 = rsqrt(_1126);
        float _1228 = fma(_226, _226, _1224);
        float _1230 = sqrt(_1228);
        float _1232 = _1106 * _1226;
        float _1234 = _1100 * _1226;
        float _1236 = _1112 * _1226;
        bool _1238 = _1230 > 0.0;
        bool _1240 = !_1238;
        _584 = _1226;
        if (!_1240)
        {
            float _1242 = rsqrt(_1228);
            float _1244 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1246 = _238 * _1242;
            float _1248 = _236 * _1242;
            float _1250 = _226 * _1242;
            float _1252 = _1234 * _1246;
            float _1254 = fma(_1232, _1248, _1252);
            float _1256 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1258 = fma(_1236, _1250, _1254);
            float _1260 = _1258 * _1256;
            float _1262 = fma(_236, _1260, _1094);
            float _1264 = fma(_238, _1260, _1092);
            float _1266 = fma(_226, _1260, _1096);
            _1152 = _1264;
            _1154 = _1262;
            _1156 = _1266;
            _584 = _1260;
        }
    }
    float _1268 = _1152;
    float _1270 = _1154;
    float _1272 = _1156;
    float _1274 = _584;
    float _1276 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1278 = _1274;
    if (_1202)
    {
        _1278 = 1.0;
    }
    float _1280 = _1278;
    float _1282 = _1280;
    if (!_1202)
    {
        float _1284 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1286 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1288 = _1284 * 0.15915493667125701904296875;
        float _1290 = _1286 * 0.15915493667125701904296875;
        float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1294 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1292);
        float _1296 = _1288 * 6.283185482025146484375;
        float _1298 = cos(_1296);
        float _1300 = _1288 * 6.283185482025146484375;
        float _1302 = sin(_1300);
        float _1304 = 1.0 / _1298;
        float _1306 = _1290 * 6.283185482025146484375;
        float _1308 = cos(_1306);
        float _1310 = _1302 * _1304;
        float _1312 = _1290 * 6.283185482025146484375;
        float _1314 = sin(_1312);
        float _1316 = _1308 * _1310;
        float _1318 = 1.0 / _1294;
        float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1322 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1320;
        float _1324 = 1.0 / _1316;
        float _1326 = 1.0 / _1322;
        float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1330 = _1318 * _1328;
        float _1332 = _1314 * _1324;
        float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1336 = fma(_1332, _1330, _1334);
        float _1338 = _1336 * _1326;
        float _1340 = precise::clamp(_1338, 0.0, 1.0);
        _1282 = _1340;
    }
    float _1342 = _1282;
    float _1344 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1346 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1276);
    float _1348 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1350 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1352 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1344);
    float _1354 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1346);
    float _1356 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1348);
    float _1358 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1350);
    float _1360 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1352);
    float _1362 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1364 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1356);
    float _1366 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1358);
    float _1368 = _1360 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1370 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1372 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1374 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1376 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1378 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1380 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1370);
    float _1382 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1372);
    float _1384 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1374);
    float _1386 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1376);
    float _1388 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1390 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1380);
    float _1392 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1382);
    float _1394 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1384);
    float _1396 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1386);
    bool _1398 = _1342 > 0.0;
    bool _1400 = isnan(_1342);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan(0.0);
    bool _1406 = _1402 || _1404;
    float _1408 = _1342 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1410 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1390);
    float _1412 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1392);
    float _1414 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1394);
    float _1416 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1396);
    float _1418 = _1408 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1420 = _1214 + 0.5;
    float _1422 = _1212 + 0.5;
    float _1424 = _1410 + _1416;
    float _1426 = _1414 + _1416;
    float _1428 = _1416 * 0.5;
    float _1430 = _1424 * 0.5;
    float _1432 = _1426 * 0.5;
    float _1434 = fma(_1412, -0.5, _1428);
    out.m_51.z = _1420;
    out.m_51.w = _1422;
    out.m_53.y = _878;
    out.m_33.x = _1418;
    out.gl_Position.x = _1410;
    out.gl_Position.y = _1412;
    out.gl_Position.z = _1414;
    out.gl_Position.w = _1416;
    out.m_55.x = _1430;
    out.m_55.y = _1434;
    out.m_55.z = _1432;
    out.m_55.w = _1416;
    if (_1406)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1436 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1436;
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _262 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_30.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    float _84 = _82;
    if (!_78)
    {
        out.m_33.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _82 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1493 = as_type<float>(_90);
        out.gl_Position.z = _1493;
    }
    if (!_78)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _94 = in.m_35.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _110 = 0.0;
    float _112 = _108;
    if (_104)
    {
        float _114 = float(_74);
        _110 = _114;
    }
    float _116 = _110;
    bool _118 = _108 >= _116;
    bool _120 = !_104;
    bool _122 = _118 || _120;
    if (_122)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _84;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _126 = _124 * 5.0;
        _92 = as_type<int>(_126);
    }
    int _128 = _92;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1562 = as_type<float>(_128);
        out.gl_Position.z = _1562;
    }
    if (_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_37.x;
    float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _134 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _136 = in.m_39.x;
    float _138 = in.m_39.y;
    float _140 = in.m_39.z;
    float _142 = _134 * _132;
    float _144 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[20].x, _142);
    float _146 = _144 * 6.283185482025146484375;
    float _148 = floor(_144);
    int _150 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _152 = _150 != 0;
    float _154 = _138 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _156 = _146 * 0.15915493667125701904296875;
    float _158 = _138 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _162 = _160 != 0;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _166 = _164 != 0;
    float _168 = _138 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _170 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[4].x, _154);
    float _172 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[5].x, _158);
    float _174 = _156 * 6.283185482025146484375;
    float _176 = cos(_174);
    bool _178 = !_162;
    int _180 = _178 ? 0 : 1;
    float _182 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[6].x, _168);
    bool _184 = !_152;
    int _186 = _184 ? 0 : 1;
    int _188 = abs(_180);
    float _190 = -_148;
    float _192 = _144 + _190;
    bool _194 = !_166;
    int _196 = _194 ? 0 : 1;
    int _198 = abs(_186);
    float _200 = float(_188);
    float _202 = -_192;
    float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _206 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _208 = fma(_176, 0.5, 0.5);
    int _210 = abs(_196);
    float _212 = abs(_204);
    float _214 = _200 * _212;
    bool _216 = _192 < 0.5;
    float _218 = float(_216);
    float _220 = -_208;
    float _222 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _224 = float(_198);
    float _226 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    float _228 = float(_210);
    float _230 = -_218;
    float _232 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _234 = fma(_224, _222, _214);
    float _236 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[4].z, _170);
    float _238 = fma(_140, (*spvDescriptorSet0.vp_c10)._m0[5].z, _172);
    float _240 = abs(_232);
    float _242 = fma(_228, _240, _234);
    bool _244 = !_206;
    float _260;
    if (!_244)
    {
        float _246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _248 = _130 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _250 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[12].x, _108);
        float _252 = _250 * _246;
        float _254 = floor(_252);
        float _256 = -_254;
        float _258 = _252 + _256;
        _260 = _258;
        _262 = true;
    }
    else
    {
        float _264 = float(_74);
        float _266 = 1.0 / _264;
        float _268 = _108 * _266;
        _260 = _268;
    }
    _262 = false;
    float _270 = _260;
    float _272 = in.m_37.z;
    float _274 = _130 * 2.0;
    float _276 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _278 = log2(_276);
    float _280 = in.m_30.x;
    float _282 = in.m_30.y;
    float _284 = in.m_30.z;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _294 = in.m_37.y;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _298 = _296 != 0;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _306 = _304 != 0;
    float _308 = floor(_274);
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _312 = _310 != 0;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = _270 + _314;
    bool _318 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_270);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = 1.0 / _292;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _334 = _272 * 2.0;
    float _336 = 1.0 / _288;
    bool _338 = _308 > 0.0;
    float _340 = _282 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _342 = _308 >= 0.0;
    bool _344 = isnan(_308);
    bool _346 = _342 || _344;
    bool _348 = isnan(0.0);
    bool _350 = _346 || _348;
    float _352 = _130 + _272;
    float _354 = _282 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _356 = _282 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _358 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].x, _340);
    float _360 = floor(_334);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _364 = _270 + _362;
    float _366 = _352 + (-1.0);
    float _368 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].x, _354);
    bool _370 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _372 = isnan(_270);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = _364 * _330;
    float _384 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].x, _356);
    int _386 = _350 ? 0 : 1;
    float _388 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _390 = _316 * _336;
    float _392 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _368);
    bool _394 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _396 = isnan(_270);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _410;
    bool _414 = _360 > 0.0;
    float _416 = fma(_408, _390, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _418 = _360 >= 0.0;
    bool _420 = isnan(_360);
    bool _422 = _418 || _420;
    bool _424 = isnan(0.0);
    bool _426 = _422 || _424;
    float _428 = -_380;
    float _430 = _428 + 1.0;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _432;
    float _436 = _408;
    float _438 = _412;
    if (!_312)
    {
        _436 = _294;
    }
    float _440 = _436;
    float _442 = fma(_412, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _444 = _404 * _430;
    float _446 = -_404;
    float _448 = _446 + 1.0;
    float _450 = fma(_434, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _452 = _440;
    if (!_312)
    {
        _438 = _440;
    }
    float _454 = _438;
    float _456 = _328 * _448;
    float _458 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _358);
    float _460 = _454;
    float _462 = _456;
    if (_312)
    {
        _460 = _130;
    }
    float _464 = _460;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _468 = _464;
    if (_312)
    {
        _452 = _294;
    }
    float _470 = _452;
    float _472 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _384);
    float _474 = _442 * _456;
    float _476 = _450 * _456;
    float _478 = _416 * _456;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    if (!_312)
    {
        _462 = _272;
    }
    float _484 = _462;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _488 = _464 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _490 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[83].z, _466);
    float _492 = _484;
    if (_312)
    {
        _492 = _470;
    }
    float _494 = _492;
    float _496 = -_486;
    float _498 = fma(_488, 2.0, _496);
    if (!_312)
    {
        _468 = _272;
    }
    float _500 = _468;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _504 = _500;
    if (_312)
    {
        _504 = _470;
    }
    float _506 = _504;
    float _508 = _494 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _518 = _278 * _108;
    float _520 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[83].w, _332);
    float _522 = fma(_508, -2.0, _502);
    float _524 = fma(_482, _382, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _526 = fma(_512, _382, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _528 = fma(_516, _382, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _530 = !_302;
    int _532 = _530 ? 0 : 1;
    float _534 = _130 + _470;
    float _536 = _272 + _470;
    int _538 = _426 ? 0 : 1;
    float _540 = _470 * 2.0;
    float _542 = exp2(_518);
    int _544 = abs(_532);
    float _546 = _534 + (-1.0);
    float _548 = _536 + (-1.0);
    int _550 = ~_538;
    int _552 = _550 + 1;
    int _554 = _552 + 1;
    float _556 = _458 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _558 = _554;
    if (!_414)
    {
        int _560 = ~_538;
        int _562 = _560 + 1;
        _558 = _562;
    }
    int _564 = _558;
    float _566 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _568 = floor(_540);
    int _570 = ~_386;
    int _572 = _570 + 1;
    int _574 = _572 + 1;
    float _576 = -_108;
    float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[81].x, _498);
    float _580 = _392 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _582 = _574;
    float _584 = _580;
    if (!_338)
    {
        int _586 = ~_386;
        int _588 = _586 + 1;
        _582 = _588;
    }
    int _590 = _582;
    float _592 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _594 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _596 = isnan(1.0);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _602 = _598 || _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _606 = 1.0 + _604;
    float _608 = float(_544);
    float _610 = -_542;
    float _612 = _610 + 1.0;
    float _614 = in.m_41.x;
    float _616 = in.m_41.y;
    float _618 = in.m_41.z;
    float _620 = 1.0 / _606;
    float _622 = float(_590);
    float _624 = _470 + (-0.5);
    bool _626 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _634 = _630 || _632;
    float _636 = _472 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _638 = _568 > 0.0;
    float _640 = _130 + (-0.5);
    bool _642 = _568 >= 0.0;
    bool _644 = isnan(_568);
    bool _646 = _642 || _644;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    float _652 = _608 * _622;
    float _654 = _634 ? _612 : 0.0;
    float _656 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _490);
    float _658 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _522);
    bool _660 = !_298;
    int _662 = _660 ? 0 : 1;
    float _664 = _652 * (-2.0);
    float _666 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _520);
    bool _668 = !_306;
    int _670 = _668 ? 0 : 1;
    if (_602)
    {
        float _672 = _654 * _620;
        _112 = _672;
    }
    float _674 = _112;
    int _676 = abs(_662);
    float _678 = -_556;
    float _680 = _678 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _682 = fma(_566, _664, _566);
    float _684 = -_580;
    float _686 = _684 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _688 = abs(_670);
    float _690 = _680 * _680;
    float _692 = fma(_664, _616, _616);
    float _694 = float(_676);
    float _696 = -_636;
    float _698 = _696 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _700 = _650 ? 0 : 1;
    float _702 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[196].y, _692);
    float _704 = float(_564);
    float _706 = fma(_686, _686, _690);
    int _708 = ~_700;
    int _710 = _708 + 1;
    int _712 = _710 + 1;
    float _714 = fma(_682, _674, _702);
    float _716 = _694 * _704;
    int _718 = _712;
    if (!_638)
    {
        int _720 = ~_700;
        int _722 = _720 + 1;
        _718 = _722;
    }
    int _724 = _718;
    float _726 = fma(_698, _698, _706);
    float _728 = float(_688);
    float _730 = _716 * (-2.0);
    float _732 = float(_724);
    float _734 = -_328;
    float _736 = _734 + 1.0;
    float _738 = _272 + (-0.5);
    float _740 = rsqrt(_726);
    float _742 = fma(_730, _614, _614);
    float _744 = _728 * _732;
    float _746 = fma(_592, _730, _592);
    float _748 = _714 * 0.15915493667125701904296875;
    float _750 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[196].x, _742);
    float _752 = _744 * (-2.0);
    float _754 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[143].z, _478);
    float _756 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[143].y, _476);
    float _758 = fma(_746, _674, _750);
    float _760 = fma(_752, _618, _618);
    float _762 = in.m_43.x;
    float _764 = in.m_43.y;
    float _766 = in.m_43.z;
    float _768 = fma(_388, _752, _388);
    float _770 = _748 * 6.283185482025146484375;
    float _772 = sin(_770);
    float _774 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[196].z, _760);
    float _776 = in.m_45.x;
    float _778 = in.m_45.y;
    float _780 = in.m_45.z;
    float _782 = _686 * _740;
    float _784 = _680 * _740;
    float _786 = _698 * _740;
    float _788 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[143].x, _474);
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _792 = _782 * _790;
    float _794 = _748 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _800 = _786 * _798;
    float _802 = fma(_524, _444, _788);
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _806 = -_792;
    float _808 = fma(_786, _804, _806);
    float _810 = fma(_528, _444, _754);
    float _812 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _814 = _784 * _812;
    float _816 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[145].x, _802);
    float _818 = fma(_768, _674, _774);
    float _820 = fma(_526, _444, _756);
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _824 = -_800;
    float _826 = fma(_784, _822, _824);
    float _828 = _808 * _808;
    float _830 = _758 * 0.15915493667125701904296875;
    float _832 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[145].z, _810);
    float _834 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _836 = -_814;
    float _838 = fma(_782, _834, _836);
    float _840 = fma(_826, _826, _828);
    float _842 = _818 * 0.15915493667125701904296875;
    float _844 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[145].y, _820);
    float _846 = _830 * 6.283185482025146484375;
    float _848 = sin(_846);
    float _850 = _816 * _776;
    float _852 = _832 * _780;
    float _854 = fma(_838, _838, _840);
    float _856 = _844 * _778;
    float _858 = _242 * _850;
    float _860 = _242 * _852;
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _762);
    float _864 = _830 * 6.283185482025146484375;
    float _866 = cos(_864);
    float _868 = _858 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _870 = _242 * _856;
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _764);
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _766);
    float _876 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _878 = _870 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _880 = _868 * _862;
    float _882 = _842 * 6.283185482025146484375;
    float _884 = cos(_882);
    float _886 = _848 * _796;
    float _888 = _878 * _872;
    float _890 = _876 * _874;
    float _892 = _848 * _772;
    float _894 = _842 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = _866 * _772;
    float _900 = _866 * _796;
    float _902 = rsqrt(_854);
    float _904 = _884 * _888;
    float _906 = _796 * _884;
    float _908 = _772 * _884;
    float _910 = _866 * _904;
    float _912 = _848 * _904;
    float _914 = -_898;
    float _916 = fma(_896, _886, _914);
    float _918 = -_886;
    float _920 = fma(_896, _898, _918);
    float _922 = fma(_896, _900, _892);
    float _924 = fma(_896, _892, _900);
    float _926 = -_888;
    float _928 = _896 * _926;
    float _930 = fma(_916, _880, _912);
    float _932 = fma(_922, _880, _910);
    float _934 = _838 * _902;
    float _936 = _826 * _902;
    float _938 = _808 * _902;
    float _940 = fma(_906, _880, _928);
    float _942 = _782 * _934;
    float _944 = fma(_920, _890, _932);
    float _946 = _786 * _938;
    float _948 = fma(_908, _890, _940);
    float _950 = -_942;
    float _952 = fma(_786, _936, _950);
    float _954 = _784 * _936;
    float _956 = -_946;
    float _958 = fma(_784, _934, _956);
    float _960 = fma(_924, _890, _930);
    float _962 = _952 * _944;
    float _964 = -_954;
    float _966 = fma(_782, _938, _964);
    float _968 = _958 * _944;
    float _970 = fma(_938, _948, _962);
    float _972 = _966 * _944;
    float _974 = fma(_936, _948, _968);
    float _976 = in.m_37.w;
    float _978 = fma(_784, _960, _970);
    float _980 = fma(_934, _948, _972);
    float _982 = fma(_782, _960, _974);
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[191].x * 0.449999988079071044921875;
    float _986 = _978 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _988 = fma(_786, _960, _980);
    float _990 = in.m_47.y;
    float _992 = _556 + _978;
    float _994 = fma(_982, (*spvDescriptorSet0.vp_c10)._m0[8].x, _986);
    float _996 = _580 + _982;
    float _998 = fma(_988, (*spvDescriptorSet0.vp_c10)._m0[10].x, _994);
    float _1000 = _636 + _988;
    float _1002 = _998 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1004 = fma(_1002, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1000);
    float _1006 = fma(_1002, (*spvDescriptorSet0.vp_c10)._m0[8].x, _996);
    float _1008 = fma(_1002, (*spvDescriptorSet0.vp_c10)._m0[9].x, _992);
    float _1010 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1004);
    float _1012 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1006);
    float _1014 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1008);
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1018 = _1010 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1022 = _1012 + _1020;
    float _1024 = _1018 * _1018;
    float _1026 = fma(_1022, _1022, _1024);
    float _1028 = sqrt(_1026);
    bool _1030 = _1028 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1032 = _1002;
    float _1034 = _1024;
    float _1036 = _984;
    float _1038 = _980;
    if (!_1030)
    {
        _1032 = _1012;
    }
    float _1040 = _1032;
    float _1042 = _1040;
    if (!_1030)
    {
        _1034 = _1010;
    }
    float _1044 = _1034;
    float _1046 = _1044;
    if (!_1030)
    {
        _1036 = _1014;
    }
    float _1048 = _1036;
    bool _1050 = !_1030;
    float _1052 = _1048;
    float _1054 = _990;
    if (!_1050)
    {
        float _1056 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1060 = _1028 + _1058;
        float _1062 = _1014 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1064 = rsqrt(_1026);
        float _1066 = _1060 * _1056;
        float _1068 = _1066 * 0.15915493667125701904296875;
        float _1070 = _1068 * 6.283185482025146484375;
        float _1072 = cos(_1070);
        float _1074 = _1068 * 6.283185482025146484375;
        float _1076 = sin(_1074);
        float _1078 = _1072 + (-1.0);
        float _1080 = fma(_1076, _1062, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1082 = _1078 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1084 = _1064 * _1080;
        float _1086 = fma(_1014, _1072, _1082);
        float _1088 = fma(_1022, _1084, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1090 = fma(_1018, _1084, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1052 = _1086;
        _1042 = _1088;
        _1046 = _1090;
    }
    float _1092 = _1052;
    float _1094 = _1042;
    float _1096 = _1046;
    float _1098 = -_556;
    float _1100 = _1098 + _1092;
    float _1102 = in.m_47.x;
    float _1104 = -_580;
    float _1106 = _1104 + _1094;
    float _1108 = _1100 * _1100;
    float _1110 = -_636;
    float _1112 = _1110 + _1096;
    float _1114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1116 = fma(_1106, _1106, _1108);
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1120 = _1118 != 0;
    out.m_49.x = _580;
    out.m_49.y = _556;
    out.m_49.z = _636;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1124 = _1122 != 0;
    float _1126 = fma(_1112, _1112, _1116);
    bool _1128 = _272 > 0.5;
    bool _1130 = _1128 && _1120;
    float _1132 = _556 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1136 = _976 > 0.5;
    float _1138 = -_990;
    float _1140 = _1138 + 1.0;
    float _1142 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1132);
    float _1144 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1142);
    float _1146 = sqrt(_1126);
    float _1148 = _556 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1150 = _1140;
    float _1152 = _1092;
    float _1154 = _1094;
    float _1156 = _1096;
    if (_1120)
    {
        _1038 = _1102;
    }
    float _1158 = _1038;
    float _1160 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1162 = _1158;
    if (_1124)
    {
        float _1164 = _1136 ? _1140 : _990;
        _1054 = _1164;
    }
    float _1166 = _1054;
    float _1168 = fma(_580, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1148);
    if (!_1120)
    {
        _1150 = _1102;
    }
    float _1170 = _1150;
    float _1172 = _1170;
    if (_1130)
    {
        float _1174 = -_1158;
        float _1176 = _1174 + 1.0;
        _1162 = _1176;
    }
    float _1178 = _1162;
    float _1180 = 1.0 / _1160;
    float _1182 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1168);
    float _1184 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1186 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1120)
    {
        _1172 = _1178;
    }
    float _1188 = _1172;
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1192 = fma(_1184, _1166, -0.5);
    bool _1194 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1196 = isnan(0.5);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1202 = _1198 || _1200;
    bool _1204 = _1146 > 0.0;
    float _1206 = fma(_1186, _1188, -0.5);
    float _1208 = _1190 + _1160;
    float _1210 = -_658;
    float _1212 = fma(_666, _1192, _1210);
    float _1214 = fma(_656, _1206, _578);
    float _1216 = _1208 * _1180;
    float _1218 = _1216 * 0.5;
    bool _1220 = !_1204;
    if (!_1220)
    {
        float _1222 = _238 * _238;
        float _1224 = fma(_236, _236, _1222);
        float _1226 = rsqrt(_1126);
        float _1228 = fma(_226, _226, _1224);
        float _1230 = sqrt(_1228);
        float _1232 = _1106 * _1226;
        float _1234 = _1100 * _1226;
        float _1236 = _1112 * _1226;
        bool _1238 = _1230 > 0.0;
        bool _1240 = !_1238;
        _584 = _1226;
        if (!_1240)
        {
            float _1242 = rsqrt(_1228);
            float _1244 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1246 = _238 * _1242;
            float _1248 = _236 * _1242;
            float _1250 = _226 * _1242;
            float _1252 = _1234 * _1246;
            float _1254 = fma(_1232, _1248, _1252);
            float _1256 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1258 = fma(_1236, _1250, _1254);
            float _1260 = _1258 * _1256;
            float _1262 = fma(_236, _1260, _1094);
            float _1264 = fma(_238, _1260, _1092);
            float _1266 = fma(_226, _1260, _1096);
            _1152 = _1264;
            _1154 = _1262;
            _1156 = _1266;
            _584 = _1260;
        }
    }
    float _1268 = _1152;
    float _1270 = _1154;
    float _1272 = _1156;
    float _1274 = _584;
    float _1276 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1278 = _1274;
    if (_1202)
    {
        _1278 = 1.0;
    }
    float _1280 = _1278;
    float _1282 = _1280;
    if (!_1202)
    {
        float _1284 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1286 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1288 = _1284 * 0.15915493667125701904296875;
        float _1290 = _1286 * 0.15915493667125701904296875;
        float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1294 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1292);
        float _1296 = _1288 * 6.283185482025146484375;
        float _1298 = cos(_1296);
        float _1300 = _1288 * 6.283185482025146484375;
        float _1302 = sin(_1300);
        float _1304 = 1.0 / _1298;
        float _1306 = _1290 * 6.283185482025146484375;
        float _1308 = cos(_1306);
        float _1310 = _1302 * _1304;
        float _1312 = _1290 * 6.283185482025146484375;
        float _1314 = sin(_1312);
        float _1316 = _1308 * _1310;
        float _1318 = 1.0 / _1294;
        float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1322 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1320;
        float _1324 = 1.0 / _1316;
        float _1326 = 1.0 / _1322;
        float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1330 = _1318 * _1328;
        float _1332 = _1314 * _1324;
        float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1336 = fma(_1332, _1330, _1334);
        float _1338 = _1336 * _1326;
        float _1340 = precise::clamp(_1338, 0.0, 1.0);
        _1282 = _1340;
    }
    float _1342 = _1282;
    float _1344 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1346 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1276);
    float _1348 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1350 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1352 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1344);
    float _1354 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1346);
    float _1356 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1348);
    float _1358 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1350);
    float _1360 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1352);
    float _1362 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1364 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1356);
    float _1366 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1358);
    float _1368 = _1360 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1370 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1372 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1374 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1376 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1378 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1380 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1370);
    float _1382 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1372);
    float _1384 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1374);
    float _1386 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1376);
    float _1388 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1390 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1380);
    float _1392 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1382);
    float _1394 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1384);
    float _1396 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1386);
    bool _1398 = _1342 > 0.0;
    bool _1400 = isnan(_1342);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan(0.0);
    bool _1406 = _1402 || _1404;
    float _1408 = _1342 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1410 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1390);
    float _1412 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1392);
    float _1414 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1394);
    float _1416 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1396);
    float _1418 = _1408 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1420 = _1214 + 0.5;
    float _1422 = _1212 + 0.5;
    float _1424 = _1410 + _1416;
    float _1426 = _1414 + _1416;
    float _1428 = _1416 * 0.5;
    float _1430 = _1424 * 0.5;
    float _1432 = _1426 * 0.5;
    float _1434 = fma(_1412, -0.5, _1428);
    out.m_51.z = _1420;
    out.m_51.w = _1422;
    out.m_53.y = _878;
    out.m_33.x = _1418;
    out.gl_Position.x = _1410;
    out.gl_Position.y = _1412;
    out.gl_Position.z = _1414;
    out.gl_Position.w = _1416;
    out.m_55.x = _1430;
    out.m_55.y = _1434;
    out.m_55.z = _1432;
    out.m_55.w = _1416;
    if (_1406)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1436 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1436;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

