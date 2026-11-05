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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_57 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_37 [[user(locn6)]];
    float4 m_35 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_39 [[attribute(2)]];
    float4 m_30 [[attribute(3)]];
    float4 m_32 [[attribute(4)]];
    float4 m_51 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
    float4 m_43 [[attribute(8)]];
    float4 m_45 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _470 = false;
    bool _292 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_30.w;
    float _79 = in.m_32.w;
    float _81 = trunc(_77);
    int _84 = int(_81);
    float _86 = -_79;
    float _88 = _86 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _88;
    bool _92 = _84 >= 1;
    float _94 = 0.0;
    float _96 = _79;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_37.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2506 = as_type<float>(_104);
        out.gl_Position.z = _2506;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _108 = _79 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_79);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = float(_84);
    bool _120 = _88 >= _118;
    bool _122 = !_116;
    bool _124 = _120 || _122;
    if (_124)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _96;
    if (_124)
    {
        out.m_37.x = 0.0;
    }
    if (_124)
    {
        float _128 = _126 * 5.0;
        _106 = as_type<int>(_128);
    }
    int _130 = _106;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2561 = as_type<float>(_130);
        out.gl_Position.z = _2561;
    }
    if (_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_39.x;
    float _134 = in.m_39.y;
    float _136 = in.m_39.z;
    float _138 = 1.0 / _118;
    bool _140 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _142 = _88 * _138;
    float _144 = _134 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _146 = _134 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _148 = _134 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _150 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[4].x, _144);
    float _152 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[5].x, _146);
    float _154 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[6].x, _148);
    float _156 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[4].z, _150);
    float _158 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[5].z, _152);
    float _160 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[6].z, _154);
    bool _162 = !_140;
    float _164 = _156;
    float _182;
    if (!_162)
    {
        float _166 = in.m_41.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _88);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        _182 = _142;
    }
    _184 = false;
    float _186 = _182;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _190 = _186 + _188;
    bool _192 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _194 = isnan(_186);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _200 = _196 || _198;
    float _202 = float(_200);
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _204;
    bool _208 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _210 = isnan(_186);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -_202;
    float _222 = _220 + 1.0;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _224;
    float _228 = 1.0 / _206;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _232 = _218 * _222;
    float _234 = -_218;
    float _236 = _234 + 1.0;
    float _238 = _190 * _228;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _240;
    float _244 = fma(_226, _238, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _246;
    float _250 = fma(_242, _238, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _252 = _244 * _232;
    float _254 = fma(_248, _238, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _256 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[143].x, _252);
    float _258 = _254 * _232;
    float _260 = _250 * _232;
    float _262 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[143].y, _258);
    float _264 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[143].z, _260);
    float _266 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[144].x, _256);
    float _268 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[144].y, _262);
    float _270 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[144].z, _264);
    bool _272 = !_230;
    float _290;
    if (!_272)
    {
        float _274 = in.m_41.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[11].x, _88);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        _290 = _142;
    }
    _292 = false;
    float _294 = _290;
    float _296 = in.m_43.x;
    float _298 = in.m_43.y;
    float _300 = in.m_43.z;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _304 = _294 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _314 = 1.0 / _308;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = 1.0 / _312;
    float _320 = _304 * _314;
    bool _322 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _324 = isnan(_294);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = _268 * _298;
    float _336 = _270 * _300;
    bool _338 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _340 = isnan(_294);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _352 = _294 + _350;
    float _354 = -_332;
    float _356 = _354 + 1.0;
    bool _358 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _360 = isnan(_294);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _370;
    float _374 = -_348;
    float _376 = _374 + 1.0;
    float _378 = _348 * _356;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _384;
    float _388 = _368 * _376;
    float _390 = fma(_372, _320, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _392 = fma(_382, _320, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _394 = fma(_386, _320, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _396 = _352 * _318;
    float _398 = -_368;
    float _400 = _398 + 1.0;
    float _402 = _392 * _388;
    float _404 = _394 * _388;
    float _406 = _390 * _388;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _420 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _402);
    float _422 = fma(_410, _396, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _424 = fma(_414, _396, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _426 = fma(_418, _396, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _428 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _404);
    float _430 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _406);
    float _432 = fma(_422, _378, _420);
    float _434 = _266 * _296;
    float _436 = fma(_424, _378, _428);
    float _438 = fma(_426, _378, _430);
    float _440 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[109].x, _432);
    float _442 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[109].y, _436);
    float _444 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[109].z, _438);
    bool _446 = !_316;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[108].y);
    bool _450 = _316;
    float _468;
    if (!_446)
    {
        float _452 = in.m_41.x;
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _456 = _452 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[11].y, _88);
        float _460 = _458 * _454;
        float _462 = floor(_460);
        float _464 = -_462;
        float _466 = _460 + _464;
        _468 = _466;
        _470 = true;
    }
    else
    {
        _468 = _142;
    }
    _470 = false;
    float _472 = _468;
    float _474 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _476 = int(_474);
    float _478 = in.m_41.w;
    float _480 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _482 = in.m_45.x;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _486 = _484 != 0;
    float _488 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _490 = int(_488);
    float _492 = in.m_41.x;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _496 = _494 != 0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _504 = _502 != 0;
    float _506 = in.m_45.y;
    float _508 = float(_476);
    float _510 = in.m_41.y;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _516 = in.m_41.z;
    float _518 = 1.0 / _508;
    float _520 = float(uint(_490));
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _526 = ~_490;
    int _528 = _526 + 1;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _534 = _478 > 0.5;
    float _536 = _506;
    float _538 = _482;
    if (_486)
    {
        float _540 = -_482;
        float _542 = _540 + 1.0;
        _448 = as_type<int>(_542);
    }
    int _544 = _448;
    float _546 = 1.0 / _520;
    if (_486)
    {
        bool _548 = _492 > 0.5;
        _450 = _548;
    }
    bool _550 = _450;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _556 = _88 * _518;
    float _558 = 1.0 / _500;
    bool _560 = _510 > 0.5;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _564 = _516 > 0.5;
    int _566 = as_type<int>(_546) + (-2);
    float _568 = trunc(_556);
    int _570 = int(_568);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _576 = 1.0 / _514;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _582 = float(_490);
    float _584 = 1.0 / _524;
    float _586 = float(uint(_570));
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _592 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _594 = isnan(_142);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = as_type<float>(_566) * _586;
    float _606 = _586;
    float _608 = _516;
    float _610 = _510;
    if (!_486)
    {
        _606 = _482;
    }
    float _612 = _606;
    float _614 = 1.0 / _532;
    float _616 = _612;
    if (_486)
    {
        float _618 = _550 ? as_type<float>(_544) : _482;
        _616 = _618;
    }
    float _620 = _616;
    float _622 = -_506;
    float _624 = _622 + 1.0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _628 = _626 != 0;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _632 = _630 != 0;
    bool _634 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _636 = isnan(_472);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = trunc(_604);
    float _648 = precise::max(_646, 0.0);
    uint _651 = uint(_648);
    bool _653 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _655 = isnan(_472);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    bool _665 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _667 = isnan(_142);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    bool _677 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _679 = isnan(_142);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = 1.0 / _554;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    float _693 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[78].w, _691);
    int _695 = _528 * int(_651);
    int _697 = _695 + _570;
    float _699 = 1.0 / _574;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _703 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[77].w, _693);
    float _705 = float(uint(_697));
    float _707 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[88].w, _701);
    float _709 = 1.0 / _580;
    float _711 = as_type<float>(_566) * _705;
    float _713 = _560 ? _624 : _506;
    int _715 = _564 ? as_type<int>(_624) : as_type<int>(_506);
    float _717 = _504 ? _713 : _506;
    float _719 = trunc(_711);
    float _721 = precise::max(_719, 0.0);
    uint _723 = uint(_721);
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _727 = _725 != 0;
    float _729 = _628 ? as_type<float>(_715) : _506;
    int _731 = _715;
    float _733 = _713;
    int _735 = as_type<int>(_624);
    if (_496)
    {
        float _737 = -_482;
        float _739 = _737 + 1.0;
        _731 = as_type<int>(_739);
    }
    int _741 = _731;
    int _743 = ~_490;
    int _745 = _743 + 1;
    if (!_496)
    {
        _733 = _482;
    }
    float _747 = _733;
    float _749 = 1.0 / _590;
    float _751 = _747;
    if (_496)
    {
        float _753 = _564 ? as_type<float>(_741) : _482;
        _751 = _753;
    }
    float _755 = _751;
    if (_632)
    {
        float _757 = _534 ? _624 : _506;
        _536 = _757;
    }
    float _759 = _536;
    if (_727)
    {
        float _761 = -_482;
        float _763 = _761 + 1.0;
        _735 = as_type<int>(_763);
    }
    int _765 = _735;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _769 = _767 != 0;
    int _771 = int(_651) + int(_723);
    if (_727)
    {
        float _773 = _560 ? as_type<float>(_765) : _482;
        _538 = _773;
    }
    float _775 = _538;
    int _777 = _745 * _771;
    int _779 = _777 + _570;
    bool _781 = uint(_779) >= uint(_490);
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _785 = _783 != 0;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _789 = _787 != 0;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _793 = _791 != 0;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _797 = _795 != 0;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _801 = _492 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _803 = !_781;
    int _805 = _803 ? 0 : (-1);
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _807;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _813 = _811 != 0;
    float _815 = -_799;
    float _817 = fma(_801, 2.0, _815);
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _821 = _819 != 0;
    float _823 = _510 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _825 = _809 * _558;
    float _827 = fma(_823, -2.0, _562);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _839 = _831 * _576;
    bool _841 = !_769;
    float _843 = _841 ? 5.839270114898681640625 : 1.0;
    out.m_49.w = _833;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _845;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _857;
    float _861 = _847 * _584;
    float _863 = _851 * _614;
    float _865 = 1.0 / _837;
    float _867 = _859 * _689;
    bool _869 = !_769;
    float _871 = _869 ? _516 : _492;
    float _873 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[76].y, _827);
    float _875 = 0.0;
    if (!_769)
    {
        _875 = _510;
    }
    float _877 = _875;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _879;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _891 = _88 * _582;
    float _893 = _881 * _699;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _899 = 1.0 / _889;
    float _901 = _885 * _709;
    float _903 = _891 * _138;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _907 = _472 + _905;
    float _909 = _897 * _749;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _911;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _919 = 1.0 / _855;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _921;
    float _925 = _913 * _865;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _929 = _472 + _927;
    float _931 = fma(_825, _907, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _935 = _142 + _933;
    float _937 = _871 * _843;
    float _939 = fma(_863, _929, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _941 = _923 * _899;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _945 = _142 + _943;
    float _947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _949 = fma(_901, _935, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _953 = _142 + _951;
    float _955 = fma(_867, _945, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _959 = _472 + _957;
    bool _961 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _963 = isnan(_142);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = _917 * _919;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _977 = _472 + _975;
    float _979 = fma(_925, _953, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _983 = _142 + _981;
    float _985 = fma(_861, _959, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _987 = fma(_839, _977, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _991 = _142 + _989;
    float _993 = fma(_941, _983, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _997 = _142 + _995;
    float _999 = _877;
    if (_769)
    {
        _999 = _492;
    }
    float _1001 = _999;
    float _1003 = _947 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1005 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1007 = isnan(_142);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    float _1017 = fma(_893, _991, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1021 = _142 + _1019;
    float _1023 = fma(_1003, _717, -0.5);
    bool _1025 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1027 = isnan(_142);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1033 = _1029 || _1031;
    float _1035 = float(_1033);
    float _1037 = -_1015;
    float _1039 = _1037 + 1.0;
    float _1041 = fma(_909, _997, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1043 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1045 = isnan(_472);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = fma(_973, _1021, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1057 = -_1035;
    float _1059 = _1057 + 1.0;
    bool _1061 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1063 = isnan(_472);
    bool _1065 = _1061 || _1063;
    bool _1067 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1069 = _1065 || _1067;
    float _1071 = float(_1069);
    float _1073 = -_873;
    float _1075 = fma(_703, _1023, _1073);
    float _1077 = _1015 * _1059;
    bool _1079 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1081 = isnan(_472);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1087 = _1083 || _1085;
    float _1089 = float(_1087);
    float _1091 = _971 * _1039;
    bool _1093 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1095 = isnan(_142);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1101 = _1097 || _1099;
    float _1103 = float(_1101);
    float _1105 = -_1053;
    float _1107 = _1105 + 1.0;
    float _1109 = -_971;
    float _1111 = _1109 + 1.0;
    float _1113 = -_1089;
    float _1115 = _1113 + 1.0;
    bool _1117 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1119 = isnan(_142);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1125 = _1121 || _1123;
    float _1127 = float(_1125);
    float _1129 = -_1103;
    float _1131 = _1129 + 1.0;
    float _1133 = _1071 * _1107;
    float _1135 = _1053 * _1115;
    float _1137 = _1103 * _1111;
    float _1139 = _602 * _1131;
    float _1141 = -_602;
    float _1143 = _1141 + 1.0;
    float _1145 = -_1071;
    float _1147 = _1145 + 1.0;
    float _1149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1151 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1153 = _675 * _1143;
    float _1155 = -_675;
    float _1157 = _1155 + 1.0;
    float _1159 = _663 * _1147;
    float _1161 = -_663;
    float _1163 = _1161 + 1.0;
    int _1165 = ~_771;
    int _1167 = _1165 + _805;
    int _1169 = _1167 + 1;
    float _1171 = _1127 * _1157;
    float _1173 = floor(_937);
    float _1175 = -_1127;
    float _1177 = _1175 + 1.0;
    float _1179 = _1127;
    if (_769)
    {
        _1179 = _492;
    }
    float _1181 = _1179;
    float _1183 = _644 * _1163;
    float _1185 = _1181;
    if (!_769)
    {
        _1185 = _516;
    }
    float _1187 = _1185;
    float _1189 = _687 * _1177;
    float _1191 = _931 * _1183;
    float _1193 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1195 = _1017 * _1189;
    float _1197 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1199 = -_687;
    float _1201 = _1199 + 1.0;
    float _1203 = fma(_1193, _759, -0.5);
    float _1205 = _1193;
    if (!_769)
    {
        _1205 = _516;
    }
    float _1207 = _1205;
    float _1209 = trunc(_903);
    int _1211 = int(_1209);
    float _1213 = -_1173;
    float _1215 = _937 + _1213;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1219 = -_644;
    float _1221 = _1219 + 1.0;
    float _1223 = float(_570);
    float _1225 = -_1217;
    float _1227 = fma(_1197, 2.0, _1225);
    float _1229 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1195);
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1233 = _1207;
    if (_769)
    {
        _1233 = _510;
    }
    float _1235 = _1233;
    float _1237 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1191);
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1243 = _1223 >= _582;
    bool _1245 = isnan(_1223);
    bool _1247 = _1243 || _1245;
    bool _1249 = isnan(_582);
    bool _1251 = _1247 || _1249;
    float _1253 = float(_1251);
    float _1255 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[193].x + _1255;
    float _1259 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1239);
    float _1261 = _1215 * _582;
    float _1263 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1231);
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1269 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1273 = -_1265;
    float _1275 = fma(_1151, 2.0, _1273);
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_769)
    {
        _608 = _510;
    }
    float _1279 = _608;
    float _1281 = fma(_987, _1159, _1237);
    float _1283 = precise::max(0.0, _1269);
    float _1285 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1271);
    float _1287 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1277);
    if (!_769)
    {
        _610 = _492;
    }
    float _1289 = _610;
    float _1291 = trunc(_1253);
    int _1293 = int(_1291);
    float _1295 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1297 = fma(_949, _1171, _1229);
    float _1299 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1301 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1305 = fma(_955, _1153, _1297);
    int _1307 = _490 * _1169;
    int _1309 = _1307 + _570;
    float _1311 = fma(_1295, _620, -0.5);
    float _1313 = fma(_1299, -2.0, _1303);
    bool _1315 = !_813;
    int _1317 = _1315 ? 0 : 1;
    float _1319 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1285);
    float _1321 = -_88;
    float _1323 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[76].x, _817);
    float _1325 = -_88;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1275);
    float _1329 = fma(_1301, _755, -0.5);
    bool _1331 = _490 == 0;
    float _1333 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1259);
    float _1335 = fma(_1319, _1311, _1323);
    int _1337 = ~_1293;
    int _1339 = _1337 + 1;
    int _1341 = _1339 + 1;
    float _1343 = _158 * _158;
    bool _1345 = !_1331;
    int _1347 = _1345 ? _1309 : (-1);
    float _1349 = fma(_1333, _1329, _1327);
    float _1351 = trunc(_1261);
    int _1353 = int(_1351);
    int _1355 = _1347 * _1341;
    bool _1357 = !_789;
    int _1359 = _1357 ? 0 : 1;
    float _1361 = fma(_985, _1133, _1281);
    int _1363 = _490 + (-1);
    float _1365 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1287);
    float _1367 = precise::max(_1283, 375.0);
    float _1369 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[90].x, -0.5);
    int _1371 = abs(_1359);
    float _1373 = -_88;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1227);
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1379 = abs(_1317);
    float _1381 = fma(_156, _156, _1343);
    float _1383 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1385 = _1293 * _1363;
    int _1387 = _1385 + _1355;
    float _1389 = precise::min(_1367, 550.0);
    float _1391 = fma(_1365, _1369, _1375);
    float _1393 = fma(_160, _160, _1381);
    int _1395 = _1353 * _1379;
    int _1397 = _1395 + _570;
    float _1399 = fma(_1383, -2.0, _1377);
    bool _1401 = !_793;
    int _1403 = _1401 ? 0 : 1;
    float _1405 = in.m_51.x;
    float _1407 = in.m_51.y;
    float _1409 = in.m_51.z;
    float _1411 = fma(_1389, 0.0057142856530845165252685546875, -2.142857074737548828125);
    float _1413 = precise::clamp(_1411, 0.0, 1.0);
    int _1415 = _1387 * _1371;
    bool _1417 = !_785;
    int _1419 = _1417 ? 0 : 1;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _1423 = _1421 + 1.0;
    int _1425 = abs(_1403);
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _1429 = _1427 + 1.0;
    float _1431 = -_1413;
    float _1433 = _1431 + 1.0;
    float _1435 = rsqrt(_1393);
    bool _1437 = !_797;
    int _1439 = _1437 ? 0 : 1;
    float _1441 = in.m_30.x;
    float _1443 = in.m_30.y;
    float _1445 = in.m_30.z;
    int _1447 = abs(_1419);
    float _1449 = fma(_1433, _1423, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _1451 = fma(_1433, _1429, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _1453 = fma(_1433, 0.10000002384185791015625, 0.89999997615814208984375);
    int _1455 = abs(_1439);
    int _1457 = _1211 * _1447;
    int _1459 = _1457 + _1415;
    float _1461 = fma(_939, _1135, _1361);
    float _1463 = fma(_1041, _1139, _1305);
    float _1465 = _1449 * _1407;
    int _1467 = _1397 * _1425;
    int _1469 = _1467 + _1459;
    float _1471 = _1449 * _1405;
    float _1473 = _160 * _1435;
    float _1475 = _158 * _1435;
    int _1477 = _1353 * _1455;
    int _1479 = _1477 + _1469;
    float _1481 = _156 * _1435;
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1485 = _1473 * _1483;
    float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1489 = _1475 * _1487;
    float _1491 = _1449 * _1409;
    float _1493 = float(uint(_1479));
    float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1497 = -_1485;
    float _1499 = fma(_1481, _1495, _1497);
    float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1503 = _1481 * _1501;
    float _1505 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1509 = -_1489;
    float _1511 = fma(_1473, _1507, _1509);
    float _1513 = as_type<float>(_566) * _1493;
    float _1515 = _1499 * _1499;
    float _1517 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1519 = fma(_1441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1505);
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1523 = -_1503;
    float _1525 = fma(_1475, _1521, _1523);
    float _1527 = fma(_1511, _1511, _1515);
    float _1529 = trunc(_1513);
    float _1531 = precise::max(_1529, 0.0);
    uint _1533 = uint(_1531);
    float _1535 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1537 = fma(_1441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1517);
    float _1539 = fma(_1525, _1525, _1527);
    int _1541 = ~_490;
    int _1543 = _1541 + 1;
    float _1545 = fma(_1441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1535);
    float _1547 = fma(_1445, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1537);
    float _1549 = fma(_1445, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1519);
    float _1551 = rsqrt(_1539);
    float _1553 = fma(_1445, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1545);
    float _1555 = -_1441;
    float _1557 = fma(_1451, _1441, _1555);
    float _1559 = -_1445;
    float _1561 = fma(_1451, _1445, _1559);
    float _1563 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1465);
    float _1565 = _1549 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1567 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1313);
    float _1569 = -_1443;
    float _1571 = fma(_1453, _1443, _1569);
    int _1573 = _1543 * int(_1533);
    int _1575 = _1573 + _1479;
    float _1577 = _334 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1579 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1471);
    float _1581 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1491);
    float _1583 = float(uint(_1397));
    float _1585 = _1557 + _1565;
    float _1587 = float(uint(_1575));
    float _1589 = _336 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1591 = _1577 * _1563;
    float _1593 = _1499 * _1551;
    float _1595 = _480 * _1579;
    float _1597 = as_type<float>(_566) * _1587;
    float _1599 = _1589 * _1581;
    float _1601 = _1511 * _1551;
    float _1603 = _1525 * _1551;
    float _1605 = _1553 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1607 = _1481 * _1593;
    float _1609 = _1591 * _1473;
    float _1611 = trunc(_1597);
    float _1613 = precise::max(_1611, 0.0);
    uint _1615 = uint(_1613);
    float _1617 = _1561 + _1605;
    float _1619 = _1591 * _1481;
    float _1621 = _1475 * _1603;
    float _1623 = -_1607;
    float _1625 = fma(_1475, _1601, _1623);
    float _1627 = fma(_1595, _1603, _1609);
    float _1629 = as_type<float>(_566) * _1583;
    float _1631 = fma(_1595, _1601, _1619);
    float _1633 = -_1621;
    float _1635 = fma(_1473, _1593, _1633);
    float _1637 = fma(_1599, _1625, _1627);
    float _1639 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1263);
    float _1641 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1399);
    float _1643 = trunc(_1629);
    float _1645 = precise::max(_1643, 0.0);
    uint _1647 = uint(_1645);
    float _1649 = fma(_1599, _1635, _1631);
    float _1651 = _1617 + _1637;
    float _1653 = -_1567;
    float _1655 = fma(_1639, _1203, _1653);
    int _1657 = int(_1533) + int(_1615);
    float _1659 = _1585 + _1649;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1663 = _1651 + _1661;
    int _1665 = ~_490;
    int _1667 = _1665 + 1;
    float _1669 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[87].w, _707);
    float _1671 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1673 = _1659 + _1671;
    float _1675 = _1663 * _1663;
    int _1677 = ~_490;
    int _1679 = _1677 + 1;
    int _1681 = _1667 * _1657;
    int _1683 = _1681 + _1479;
    float _1685 = fma(_979, _1137, _1463);
    float _1687 = fma(_1673, _1673, _1675);
    float _1689 = _1335 + 0.5;
    int _1691 = _1679 * int(_1647);
    int _1693 = _1691 + _1397;
    float _1695 = _1075 + 0.5;
    bool _1697 = uint(_1683) >= uint(_490);
    float _1699 = sqrt(_1687);
    float _1701 = _1349 + 0.5;
    float _1703 = float(uint(_1693));
    float _1705 = _1655 + 0.5;
    bool _1707 = !_1697;
    int _1709 = _1707 ? 0 : (-1);
    float _1711 = _1547 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1713 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[90].y, -0.5);
    float _1715 = as_type<float>(_566) * _1703;
    int _1717 = ~_1657;
    int _1719 = _1717 + _1709;
    int _1721 = _1719 + 1;
    float _1723 = _1591 * _1475;
    float _1725 = _1473 * _1601;
    float _1727 = trunc(_1715);
    float _1729 = precise::max(_1727, 0.0);
    uint _1731 = uint(_1729);
    out.m_53.x = _1689;
    out.m_53.y = _1695;
    out.m_53.z = _1701;
    out.m_53.w = _1705;
    int _1733 = _490 * _1721;
    int _1735 = _1733 + _1479;
    float _1737 = fma(_1595, _1593, _1723);
    float _1739 = -_1725;
    float _1741 = fma(_1481, _1603, _1739);
    bool _1743 = _1699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1745 = _1571 + _1711;
    bool _1747 = !_1331;
    int _1749 = _1747 ? _1735 : (-1);
    float _1751 = fma(_1599, _1741, _1737);
    float _1753 = -_1641;
    float _1755 = fma(_1669, _1713, _1753);
    int _1757 = _1749 >> 31;
    float _1759 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1461);
    float _1761 = _1745 + _1751;
    int _1763 = int(_1647) + int(_1731);
    int _1765 = _1757 & 3;
    float _1767 = _1713;
    float _1769 = _1659;
    float _1771 = _1651;
    if (!_1743)
    {
        _1767 = _1761;
    }
    float _1773 = _1767;
    int _1775 = _1749 + _1765;
    bool _1777 = !_1743;
    float _1779 = _1773;
    if (!_1777)
    {
        float _1781 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1785 = _1699 + _1783;
        float _1787 = _1761 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1789 = rsqrt(_1687);
        float _1791 = _1785 * _1781;
        float _1793 = _1791 * 0.15915493667125701904296875;
        float _1795 = _1793 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        float _1799 = _1793 * 6.283185482025146484375;
        float _1801 = cos(_1799);
        float _1803 = fma(_1797, _1787, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1805 = _1789 * _1803;
        float _1807 = _1801 + (-1.0);
        float _1809 = fma(_1673, _1805, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1811 = fma(_1663, _1805, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1813 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1815 = fma(_1761, _1801, _1813);
        _1779 = _1815;
        _1769 = _1809;
        _1771 = _1811;
    }
    float _1817 = _1779;
    float _1819 = _1769;
    float _1821 = _1771;
    float _1823 = -_1745;
    float _1825 = _1823 + _1817;
    int _1827 = _1775 >> 2;
    float _1829 = _440 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1831 = -_1585;
    float _1833 = _1831 + _1819;
    float _1835 = _1825 * _1825;
    int _1837 = _1827 << 4;
    int _1839 = _1837 + 656;
    float _1841 = _442 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1843 = -_1617;
    float _1845 = _1843 + _1821;
    float _1847 = fma(_1833, _1833, _1835);
    int _1849 = _1839 + 8;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    uint _1853 = uint(int(uint(int(_1851)) >> uint(2)));
    int _1855 = int(_1851) & 3;
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[int(_1853)][_1855];
    int _1859 = int(_1851) + 1;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    int _1863 = _1859 & 3;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[int(_1861)][_1863];
    float _1867 = _1745 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1869 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1871 = fma(_1845, _1845, _1847);
    float _1873 = _1755 + 0.5;
    float _1875 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1867);
    int _1877 = ~_490;
    int _1879 = _1877 + 1;
    float _1881 = sqrt(_1871);
    uint _1883 = uint(int(uint(_1839) >> uint(2)));
    uint _1885 = uint(int(uint(int(_1883)) >> uint(2)));
    int _1887 = int(_1883) & 3;
    float _1889 = (*spvDescriptorSet0.vp_c9)._m0[int(_1885)][_1887];
    int _1891 = int(_1883) + 1;
    uint _1893 = uint(int(uint(_1891) >> uint(2)));
    int _1895 = _1891 & 3;
    float _1897 = (*spvDescriptorSet0.vp_c9)._m0[int(_1893)][_1895];
    float _1899 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1875);
    float _1901 = _1745 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1903 = _1879 * _1763;
    int _1905 = _1903 + _1397;
    float _1907 = fma(_1055, _1091, _1685);
    float _1909 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1911 = _1391 + 0.5;
    float _1913 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1901);
    bool _1915 = uint(_1905) >= uint(_490);
    float _1917 = 1.0 / _1909;
    float _1919 = _1829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _1911;
    out.m_55.y = _1873;
    float _1921 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1913);
    float _1923 = _1841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1925 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1927 = _1881 > 0.0;
    float _1929 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1931 = _1759 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1933 = fma(_993, _1077, _1907);
    bool _1935 = !_1915;
    int _1937 = _1935 ? 0 : (-1);
    float _1939 = _1929 + _1909;
    out.m_57.x = _1919;
    out.m_57.y = _1923;
    out.m_57.z = _1925;
    out.m_57.w = _1931;
    int _1941 = ~_1763;
    int _1943 = _1941 + _1937;
    int _1945 = _1943 + 1;
    int _1947 = _1749 & 3;
    bool _1949 = _1947 != 0;
    float _1951 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1933);
    int _1953 = _1749 & 3;
    bool _1955 = _1953 != 0;
    int _1957 = _490 * _1945;
    int _1959 = _1957 + _1397;
    bool _1961 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1963 = isnan(0.5);
    bool _1965 = _1961 || _1963;
    bool _1967 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1969 = _1965 || _1967;
    bool _1971 = uint(_1947) > 1u;
    float _1973 = _1939 * _1917;
    float _1975 = _1973 * 0.5;
    float _1977 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1979 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1977);
    int _1981 = _1955 ? 0 : 1;
    bool _1983 = !_1927;
    float _1985 = _1819;
    float _1987 = _1817;
    float _1989 = _1821;
    float _1991 = _1925;
    float _1993 = _1923;
    float _1995 = _1979;
    if (!_1983)
    {
        float _1997 = sqrt(_1393);
        float _1999 = rsqrt(_1871);
        bool _2001 = _1997 > 0.0;
        float _2003 = _1833 * _1999;
        float _2005 = _1825 * _1999;
        float _2007 = _1845 * _1999;
        bool _2009 = !_2001;
        _1993 = _2005;
        if (!_2009)
        {
            float _2011 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2013 = _1475 * _2005;
            float _2015 = fma(_1481, _2003, _2013);
            float _2017 = fma(_1473, _2007, _2015);
            float _2019 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2021 = _2017 * _2019;
            float _2023 = fma(_156, _2021, _1819);
            float _2025 = fma(_158, _2021, _1817);
            float _2027 = fma(_160, _2021, _1821);
            _1985 = _2023;
            _1987 = _2025;
            _1989 = _2027;
            _1991 = _2011;
            _1993 = _2019;
        }
    }
    float _2029 = _1985;
    float _2031 = _1987;
    float _2033 = _1989;
    float _2035 = _1991;
    float _2037 = _1993;
    float _2039 = _2035;
    float _2041 = _2037;
    if (_1969)
    {
        _2039 = _2029;
    }
    float _2043 = _2039;
    float _2045 = _2043;
    if (_1969)
    {
        _164 = _2031;
    }
    float _2047 = _164;
    int _2049 = ~_1981;
    int _2051 = _2049 + 1;
    int _2053 = _2051 + 1;
    float _2055 = _2047;
    int _2057 = _2053;
    if (_1969)
    {
        _2041 = _2033;
    }
    float _2059 = _2041;
    float _2061 = _2059;
    if (!_1969)
    {
        float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2065 = _1745 + _2063;
        float _2067 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2069 = _1585 + _2067;
        float _2071 = -_1585;
        float _2073 = _2071 + _2029;
        float _2075 = -_1745;
        float _2077 = _2075 + _2031;
        float _2079 = _2065 * _2065;
        float _2081 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2083 = _1617 + _2081;
        float _2085 = fma(_2069, _2069, _2079);
        float _2087 = fma(_2083, _2083, _2085);
        float _2089 = -_1617;
        float _2091 = _2089 + _2033;
        float _2093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2095 = sqrt(_2087);
        float _2097 = precise::min(_2095, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2099 = _2097 * _2093;
        float _2101 = fma(_2073, _2099, _1585);
        float _2103 = fma(_2077, _2099, _1745);
        float _2105 = fma(_2091, _2099, _1617);
        _2055 = _2103;
        _2045 = _2101;
        _2061 = _2105;
    }
    float _2107 = _2055;
    float _2109 = _2045;
    float _2111 = _2061;
    bool _2113 = _1947 != 3;
    float _2115 = _2107 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2117 = _2111;
    if (!_1971)
    {
        int _2119 = ~_1981;
        int _2121 = _2119 + 1;
        _2057 = _2121;
    }
    int _2123 = _2057;
    float _2125 = _2107 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _2127 = uint(_1947) >= 2u;
    float _2129 = _2107 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2131 = _2107 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2133 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2115);
    int _2135 = _2127 ? 0 : 1;
    float _2137 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2125);
    bool _2139 = !_1949;
    int _2141 = _2139 ? 0 : 1;
    float _2143 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2129);
    int _2145 = abs(_2123);
    float _2147 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2131);
    int _2149 = ~_2135;
    int _2151 = _2149 + 1;
    int _2153 = _2151 + 1;
    float _2155 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2137);
    int _2157 = abs(_2141);
    int _2159 = _2153;
    if (_2113)
    {
        int _2161 = ~_2135;
        int _2163 = _2161 + 1;
        _2159 = _2163;
    }
    int _2165 = _2159;
    float _2167 = 1.0 / _1979;
    int _2169 = ~_2145;
    int _2171 = _2169 + 1;
    int _2173 = _2171 + 1;
    bool _2175 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2177 = isnan(0.5);
    bool _2179 = _2175 || _2177;
    bool _2181 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2183 = _2179 || _2181;
    int _2185 = _2173 * as_type<int>(_1897);
    float _2187 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2133);
    int _2189 = abs(_2165);
    float _2191 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2143);
    int _2193 = ~_2157;
    int _2195 = _2193 + 1;
    int _2197 = _2195 + 1;
    float _2199 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2147);
    bool _2201 = _1947 != 3;
    bool _2203 = !_821;
    int _2205 = _2203 ? 0 : 1;
    int _2207 = _2197 * as_type<int>(_1889);
    int _2209 = _2207 + _2185;
    float _2211 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2213 = _2167 * _2211;
    if (_2183)
    {
        _2117 = 1.0;
    }
    float _2215 = _2117;
    float _2217 = _2215;
    if (_2183)
    {
        _1995 = 1.0;
    }
    float _2219 = _1995;
    int _2221 = ~_2189;
    int _2223 = _2221 + 1;
    int _2225 = _2223 + 1;
    float _2227 = _2219;
    if (!_2183)
    {
        float _2229 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2231 = _2229 * 0.15915493667125701904296875;
        float _2233 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2235 = _2231 * 6.283185482025146484375;
        float _2237 = cos(_2235);
        float _2239 = _2233 * 0.15915493667125701904296875;
        float _2241 = _2231 * 6.283185482025146484375;
        float _2243 = sin(_2241);
        float _2245 = 1.0 / _2237;
        float _2247 = _2239 * 6.283185482025146484375;
        float _2249 = cos(_2247);
        float _2251 = _2243 * _2245;
        float _2253 = _2239 * 6.283185482025146484375;
        float _2255 = sin(_2253);
        float _2257 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2259 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2257;
        float _2261 = _2249 * _2251;
        float _2263 = 1.0 / _2259;
        float _2265 = 1.0 / _2261;
        float _2267 = _2255 * _2265;
        float _2269 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2271 = fma(_2213, _2267, _2269);
        float _2273 = _2271 * _2263;
        float _2275 = precise::clamp(_2273, 0.0, 1.0);
        _2217 = _2275;
    }
    float _2277 = _2217;
    if (!_2183)
    {
        float _2279 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2281 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2283 = _2279 * 0.15915493667125701904296875;
        float _2285 = _2281 * 0.15915493667125701904296875;
        float _2287 = _2283 * 6.283185482025146484375;
        float _2289 = cos(_2287);
        float _2291 = _2283 * 6.283185482025146484375;
        float _2293 = sin(_2291);
        float _2295 = 1.0 / _2289;
        float _2297 = _2285 * 6.283185482025146484375;
        float _2299 = cos(_2297);
        float _2301 = _2293 * _2295;
        float _2303 = _2285 * 6.283185482025146484375;
        float _2305 = sin(_2303);
        float _2307 = _2299 * _2301;
        float _2309 = 1.0 / _2307;
        float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2313 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2311;
        float _2315 = 1.0 / _2313;
        float _2317 = _2305 * _2309;
        float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2321 = fma(_2213, _2317, _2319);
        float _2323 = _2321 * _2315;
        float _2325 = precise::clamp(_2323, 0.0, 1.0);
        float _2327 = -_2325;
        float _2329 = _2327 + 1.0;
        _2227 = _2329;
    }
    float _2331 = _2227;
    int _2333 = abs(_2205);
    float _2335 = _2187 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2337 = !_2201;
    int _2339 = _2337 ? 0 : (-1);
    float _2341 = _2155 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    int _2343 = _2225 * as_type<int>(_1857);
    int _2345 = _2343 + _2209;
    float _2347 = _2335 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    int _2349 = abs(_2339);
    float _2351 = _2335 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2353 = _2335 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2355 = _2335 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2357 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2347);
    int _2359 = ~_2349;
    int _2361 = _2359 + 1;
    int _2363 = _2361 + 1;
    float _2365 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2353);
    float _2367 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2355);
    float _2369 = _2191 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2371 = _2277 > 0.0;
    bool _2373 = isnan(_2277);
    bool _2375 = _2371 || _2373;
    bool _2377 = isnan(0.0);
    bool _2379 = _2375 || _2377;
    float _2381 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2351);
    int _2383 = ~_2333;
    int _2385 = _2383 + 1;
    int _2387 = _2385 + 1;
    int _2389 = _2363 * as_type<int>(_1865);
    int _2391 = _2389 + _2345;
    float _2393 = _2199 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2395 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2365);
    float _2397 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2367);
    float _2399 = _2277 * _2331;
    bool _2401 = _2331 <= 0.0;
    bool _2403 = !_2379;
    bool _2405 = _2401 || _2403;
    float _2407 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2357);
    bool _2409 = !_1331;
    int _2411 = _2409 ? _1959 : (-1);
    float _2413 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2381);
    int _2415 = _2391 * _2387;
    float _2417 = fma(_2393, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2395);
    float _2419 = fma(_2393, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2397);
    float _2421 = fma(_2393, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2413);
    int _2423 = _2411 * _2333;
    int _2425 = _2423 + _2415;
    float _2427 = fma(_2393, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2407);
    float _2429 = _2417 + _2419;
    float _2431 = _2399 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_59.x = _1951;
    float _2433 = _2429 * 0.5;
    float _2435 = _2431 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2437 = float(_2425);
    out.m_61.z = _2433;
    out.m_61.w = _2419;
    out.m_37.x = _2435;
    out.gl_Position.x = _2427;
    out.gl_Position.y = _2421;
    out.gl_Position.z = _2417;
    out.gl_Position.w = _2419;
    out.m_63.z = _2437;
    if (!_2405)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_37.x = 0.0;
    float _2439 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2439;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _470 = false;
    bool _292 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_30.w;
    float _79 = in.m_32.w;
    float _81 = trunc(_77);
    int _84 = int(_81);
    float _86 = -_79;
    float _88 = _86 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _88;
    bool _92 = _84 >= 1;
    float _94 = 0.0;
    float _96 = _79;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_37.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2506 = as_type<float>(_104);
        out.gl_Position.z = _2506;
    }
    if (!_92)
    {
        return out;
    }
    bool _108 = _79 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_79);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = float(_84);
    bool _120 = _88 >= _118;
    bool _122 = !_116;
    bool _124 = _120 || _122;
    if (_124)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _96;
    if (_124)
    {
        out.m_37.x = 0.0;
    }
    if (_124)
    {
        float _128 = _126 * 5.0;
        _106 = as_type<int>(_128);
    }
    int _130 = _106;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2561 = as_type<float>(_130);
        out.gl_Position.z = _2561;
    }
    if (_124)
    {
        return out;
    }
    float _132 = in.m_39.x;
    float _134 = in.m_39.y;
    float _136 = in.m_39.z;
    float _138 = 1.0 / _118;
    bool _140 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _142 = _88 * _138;
    float _144 = _134 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _146 = _134 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _148 = _134 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _150 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[4].x, _144);
    float _152 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[5].x, _146);
    float _154 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[6].x, _148);
    float _156 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[4].z, _150);
    float _158 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[5].z, _152);
    float _160 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[6].z, _154);
    bool _162 = !_140;
    float _164 = _156;
    float _182;
    if (!_162)
    {
        float _166 = in.m_41.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _88);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        _182 = _142;
    }
    _184 = false;
    float _186 = _182;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _190 = _186 + _188;
    bool _192 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _194 = isnan(_186);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _200 = _196 || _198;
    float _202 = float(_200);
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _204;
    bool _208 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _210 = isnan(_186);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -_202;
    float _222 = _220 + 1.0;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _224;
    float _228 = 1.0 / _206;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _232 = _218 * _222;
    float _234 = -_218;
    float _236 = _234 + 1.0;
    float _238 = _190 * _228;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _240;
    float _244 = fma(_226, _238, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _246;
    float _250 = fma(_242, _238, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _252 = _244 * _232;
    float _254 = fma(_248, _238, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _256 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[143].x, _252);
    float _258 = _254 * _232;
    float _260 = _250 * _232;
    float _262 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[143].y, _258);
    float _264 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[143].z, _260);
    float _266 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[144].x, _256);
    float _268 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[144].y, _262);
    float _270 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[144].z, _264);
    bool _272 = !_230;
    float _290;
    if (!_272)
    {
        float _274 = in.m_41.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[11].x, _88);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        _290 = _142;
    }
    _292 = false;
    float _294 = _290;
    float _296 = in.m_43.x;
    float _298 = in.m_43.y;
    float _300 = in.m_43.z;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _304 = _294 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _314 = 1.0 / _308;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = 1.0 / _312;
    float _320 = _304 * _314;
    bool _322 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _324 = isnan(_294);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = _268 * _298;
    float _336 = _270 * _300;
    bool _338 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _340 = isnan(_294);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _352 = _294 + _350;
    float _354 = -_332;
    float _356 = _354 + 1.0;
    bool _358 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _360 = isnan(_294);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _370;
    float _374 = -_348;
    float _376 = _374 + 1.0;
    float _378 = _348 * _356;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _384;
    float _388 = _368 * _376;
    float _390 = fma(_372, _320, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _392 = fma(_382, _320, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _394 = fma(_386, _320, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _396 = _352 * _318;
    float _398 = -_368;
    float _400 = _398 + 1.0;
    float _402 = _392 * _388;
    float _404 = _394 * _388;
    float _406 = _390 * _388;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _420 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _402);
    float _422 = fma(_410, _396, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _424 = fma(_414, _396, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _426 = fma(_418, _396, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _428 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _404);
    float _430 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _406);
    float _432 = fma(_422, _378, _420);
    float _434 = _266 * _296;
    float _436 = fma(_424, _378, _428);
    float _438 = fma(_426, _378, _430);
    float _440 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[109].x, _432);
    float _442 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[109].y, _436);
    float _444 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[109].z, _438);
    bool _446 = !_316;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[108].y);
    bool _450 = _316;
    float _468;
    if (!_446)
    {
        float _452 = in.m_41.x;
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _456 = _452 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[11].y, _88);
        float _460 = _458 * _454;
        float _462 = floor(_460);
        float _464 = -_462;
        float _466 = _460 + _464;
        _468 = _466;
        _470 = true;
    }
    else
    {
        _468 = _142;
    }
    _470 = false;
    float _472 = _468;
    float _474 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _476 = int(_474);
    float _478 = in.m_41.w;
    float _480 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _482 = in.m_45.x;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _486 = _484 != 0;
    float _488 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _490 = int(_488);
    float _492 = in.m_41.x;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _496 = _494 != 0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _504 = _502 != 0;
    float _506 = in.m_45.y;
    float _508 = float(_476);
    float _510 = in.m_41.y;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _516 = in.m_41.z;
    float _518 = 1.0 / _508;
    float _520 = float(uint(_490));
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _526 = ~_490;
    int _528 = _526 + 1;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _534 = _478 > 0.5;
    float _536 = _506;
    float _538 = _482;
    if (_486)
    {
        float _540 = -_482;
        float _542 = _540 + 1.0;
        _448 = as_type<int>(_542);
    }
    int _544 = _448;
    float _546 = 1.0 / _520;
    if (_486)
    {
        bool _548 = _492 > 0.5;
        _450 = _548;
    }
    bool _550 = _450;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _556 = _88 * _518;
    float _558 = 1.0 / _500;
    bool _560 = _510 > 0.5;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _564 = _516 > 0.5;
    int _566 = as_type<int>(_546) + (-2);
    float _568 = trunc(_556);
    int _570 = int(_568);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _576 = 1.0 / _514;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _582 = float(_490);
    float _584 = 1.0 / _524;
    float _586 = float(uint(_570));
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _592 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _594 = isnan(_142);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = as_type<float>(_566) * _586;
    float _606 = _586;
    float _608 = _516;
    float _610 = _510;
    if (!_486)
    {
        _606 = _482;
    }
    float _612 = _606;
    float _614 = 1.0 / _532;
    float _616 = _612;
    if (_486)
    {
        float _618 = _550 ? as_type<float>(_544) : _482;
        _616 = _618;
    }
    float _620 = _616;
    float _622 = -_506;
    float _624 = _622 + 1.0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _628 = _626 != 0;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _632 = _630 != 0;
    bool _634 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _636 = isnan(_472);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = trunc(_604);
    float _648 = precise::max(_646, 0.0);
    uint _651 = uint(_648);
    bool _653 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _655 = isnan(_472);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    bool _665 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _667 = isnan(_142);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    bool _677 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _679 = isnan(_142);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = 1.0 / _554;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    float _693 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[78].w, _691);
    int _695 = _528 * int(_651);
    int _697 = _695 + _570;
    float _699 = 1.0 / _574;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _703 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[77].w, _693);
    float _705 = float(uint(_697));
    float _707 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[88].w, _701);
    float _709 = 1.0 / _580;
    float _711 = as_type<float>(_566) * _705;
    float _713 = _560 ? _624 : _506;
    int _715 = _564 ? as_type<int>(_624) : as_type<int>(_506);
    float _717 = _504 ? _713 : _506;
    float _719 = trunc(_711);
    float _721 = precise::max(_719, 0.0);
    uint _723 = uint(_721);
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _727 = _725 != 0;
    float _729 = _628 ? as_type<float>(_715) : _506;
    int _731 = _715;
    float _733 = _713;
    int _735 = as_type<int>(_624);
    if (_496)
    {
        float _737 = -_482;
        float _739 = _737 + 1.0;
        _731 = as_type<int>(_739);
    }
    int _741 = _731;
    int _743 = ~_490;
    int _745 = _743 + 1;
    if (!_496)
    {
        _733 = _482;
    }
    float _747 = _733;
    float _749 = 1.0 / _590;
    float _751 = _747;
    if (_496)
    {
        float _753 = _564 ? as_type<float>(_741) : _482;
        _751 = _753;
    }
    float _755 = _751;
    if (_632)
    {
        float _757 = _534 ? _624 : _506;
        _536 = _757;
    }
    float _759 = _536;
    if (_727)
    {
        float _761 = -_482;
        float _763 = _761 + 1.0;
        _735 = as_type<int>(_763);
    }
    int _765 = _735;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _769 = _767 != 0;
    int _771 = int(_651) + int(_723);
    if (_727)
    {
        float _773 = _560 ? as_type<float>(_765) : _482;
        _538 = _773;
    }
    float _775 = _538;
    int _777 = _745 * _771;
    int _779 = _777 + _570;
    bool _781 = uint(_779) >= uint(_490);
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _785 = _783 != 0;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _789 = _787 != 0;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _793 = _791 != 0;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _797 = _795 != 0;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _801 = _492 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _803 = !_781;
    int _805 = _803 ? 0 : (-1);
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _807;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _813 = _811 != 0;
    float _815 = -_799;
    float _817 = fma(_801, 2.0, _815);
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _821 = _819 != 0;
    float _823 = _510 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _825 = _809 * _558;
    float _827 = fma(_823, -2.0, _562);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _839 = _831 * _576;
    bool _841 = !_769;
    float _843 = _841 ? 5.839270114898681640625 : 1.0;
    out.m_49.w = _833;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _845;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _857;
    float _861 = _847 * _584;
    float _863 = _851 * _614;
    float _865 = 1.0 / _837;
    float _867 = _859 * _689;
    bool _869 = !_769;
    float _871 = _869 ? _516 : _492;
    float _873 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[76].y, _827);
    float _875 = 0.0;
    if (!_769)
    {
        _875 = _510;
    }
    float _877 = _875;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _879;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _891 = _88 * _582;
    float _893 = _881 * _699;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _899 = 1.0 / _889;
    float _901 = _885 * _709;
    float _903 = _891 * _138;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _907 = _472 + _905;
    float _909 = _897 * _749;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _911;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _919 = 1.0 / _855;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _921;
    float _925 = _913 * _865;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _929 = _472 + _927;
    float _931 = fma(_825, _907, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _935 = _142 + _933;
    float _937 = _871 * _843;
    float _939 = fma(_863, _929, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _941 = _923 * _899;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _945 = _142 + _943;
    float _947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _949 = fma(_901, _935, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _953 = _142 + _951;
    float _955 = fma(_867, _945, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _959 = _472 + _957;
    bool _961 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _963 = isnan(_142);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = _917 * _919;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _977 = _472 + _975;
    float _979 = fma(_925, _953, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _983 = _142 + _981;
    float _985 = fma(_861, _959, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _987 = fma(_839, _977, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _991 = _142 + _989;
    float _993 = fma(_941, _983, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _997 = _142 + _995;
    float _999 = _877;
    if (_769)
    {
        _999 = _492;
    }
    float _1001 = _999;
    float _1003 = _947 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1005 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1007 = isnan(_142);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    float _1017 = fma(_893, _991, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1021 = _142 + _1019;
    float _1023 = fma(_1003, _717, -0.5);
    bool _1025 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1027 = isnan(_142);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1033 = _1029 || _1031;
    float _1035 = float(_1033);
    float _1037 = -_1015;
    float _1039 = _1037 + 1.0;
    float _1041 = fma(_909, _997, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1043 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1045 = isnan(_472);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = fma(_973, _1021, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1057 = -_1035;
    float _1059 = _1057 + 1.0;
    bool _1061 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1063 = isnan(_472);
    bool _1065 = _1061 || _1063;
    bool _1067 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1069 = _1065 || _1067;
    float _1071 = float(_1069);
    float _1073 = -_873;
    float _1075 = fma(_703, _1023, _1073);
    float _1077 = _1015 * _1059;
    bool _1079 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1081 = isnan(_472);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1087 = _1083 || _1085;
    float _1089 = float(_1087);
    float _1091 = _971 * _1039;
    bool _1093 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1095 = isnan(_142);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1101 = _1097 || _1099;
    float _1103 = float(_1101);
    float _1105 = -_1053;
    float _1107 = _1105 + 1.0;
    float _1109 = -_971;
    float _1111 = _1109 + 1.0;
    float _1113 = -_1089;
    float _1115 = _1113 + 1.0;
    bool _1117 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1119 = isnan(_142);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1125 = _1121 || _1123;
    float _1127 = float(_1125);
    float _1129 = -_1103;
    float _1131 = _1129 + 1.0;
    float _1133 = _1071 * _1107;
    float _1135 = _1053 * _1115;
    float _1137 = _1103 * _1111;
    float _1139 = _602 * _1131;
    float _1141 = -_602;
    float _1143 = _1141 + 1.0;
    float _1145 = -_1071;
    float _1147 = _1145 + 1.0;
    float _1149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1151 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1153 = _675 * _1143;
    float _1155 = -_675;
    float _1157 = _1155 + 1.0;
    float _1159 = _663 * _1147;
    float _1161 = -_663;
    float _1163 = _1161 + 1.0;
    int _1165 = ~_771;
    int _1167 = _1165 + _805;
    int _1169 = _1167 + 1;
    float _1171 = _1127 * _1157;
    float _1173 = floor(_937);
    float _1175 = -_1127;
    float _1177 = _1175 + 1.0;
    float _1179 = _1127;
    if (_769)
    {
        _1179 = _492;
    }
    float _1181 = _1179;
    float _1183 = _644 * _1163;
    float _1185 = _1181;
    if (!_769)
    {
        _1185 = _516;
    }
    float _1187 = _1185;
    float _1189 = _687 * _1177;
    float _1191 = _931 * _1183;
    float _1193 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1195 = _1017 * _1189;
    float _1197 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1199 = -_687;
    float _1201 = _1199 + 1.0;
    float _1203 = fma(_1193, _759, -0.5);
    float _1205 = _1193;
    if (!_769)
    {
        _1205 = _516;
    }
    float _1207 = _1205;
    float _1209 = trunc(_903);
    int _1211 = int(_1209);
    float _1213 = -_1173;
    float _1215 = _937 + _1213;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1219 = -_644;
    float _1221 = _1219 + 1.0;
    float _1223 = float(_570);
    float _1225 = -_1217;
    float _1227 = fma(_1197, 2.0, _1225);
    float _1229 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1195);
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1233 = _1207;
    if (_769)
    {
        _1233 = _510;
    }
    float _1235 = _1233;
    float _1237 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1191);
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1243 = _1223 >= _582;
    bool _1245 = isnan(_1223);
    bool _1247 = _1243 || _1245;
    bool _1249 = isnan(_582);
    bool _1251 = _1247 || _1249;
    float _1253 = float(_1251);
    float _1255 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[193].x + _1255;
    float _1259 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1239);
    float _1261 = _1215 * _582;
    float _1263 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1231);
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1269 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1273 = -_1265;
    float _1275 = fma(_1151, 2.0, _1273);
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_769)
    {
        _608 = _510;
    }
    float _1279 = _608;
    float _1281 = fma(_987, _1159, _1237);
    float _1283 = precise::max(0.0, _1269);
    float _1285 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1271);
    float _1287 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1277);
    if (!_769)
    {
        _610 = _492;
    }
    float _1289 = _610;
    float _1291 = trunc(_1253);
    int _1293 = int(_1291);
    float _1295 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1297 = fma(_949, _1171, _1229);
    float _1299 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1301 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1305 = fma(_955, _1153, _1297);
    int _1307 = _490 * _1169;
    int _1309 = _1307 + _570;
    float _1311 = fma(_1295, _620, -0.5);
    float _1313 = fma(_1299, -2.0, _1303);
    bool _1315 = !_813;
    int _1317 = _1315 ? 0 : 1;
    float _1319 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1285);
    float _1321 = -_88;
    float _1323 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[76].x, _817);
    float _1325 = -_88;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1275);
    float _1329 = fma(_1301, _755, -0.5);
    bool _1331 = _490 == 0;
    float _1333 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1259);
    float _1335 = fma(_1319, _1311, _1323);
    int _1337 = ~_1293;
    int _1339 = _1337 + 1;
    int _1341 = _1339 + 1;
    float _1343 = _158 * _158;
    bool _1345 = !_1331;
    int _1347 = _1345 ? _1309 : (-1);
    float _1349 = fma(_1333, _1329, _1327);
    float _1351 = trunc(_1261);
    int _1353 = int(_1351);
    int _1355 = _1347 * _1341;
    bool _1357 = !_789;
    int _1359 = _1357 ? 0 : 1;
    float _1361 = fma(_985, _1133, _1281);
    int _1363 = _490 + (-1);
    float _1365 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1287);
    float _1367 = precise::max(_1283, 375.0);
    float _1369 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[90].x, -0.5);
    int _1371 = abs(_1359);
    float _1373 = -_88;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1227);
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1379 = abs(_1317);
    float _1381 = fma(_156, _156, _1343);
    float _1383 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1385 = _1293 * _1363;
    int _1387 = _1385 + _1355;
    float _1389 = precise::min(_1367, 550.0);
    float _1391 = fma(_1365, _1369, _1375);
    float _1393 = fma(_160, _160, _1381);
    int _1395 = _1353 * _1379;
    int _1397 = _1395 + _570;
    float _1399 = fma(_1383, -2.0, _1377);
    bool _1401 = !_793;
    int _1403 = _1401 ? 0 : 1;
    float _1405 = in.m_51.x;
    float _1407 = in.m_51.y;
    float _1409 = in.m_51.z;
    float _1411 = fma(_1389, 0.0057142856530845165252685546875, -2.142857074737548828125);
    float _1413 = precise::clamp(_1411, 0.0, 1.0);
    int _1415 = _1387 * _1371;
    bool _1417 = !_785;
    int _1419 = _1417 ? 0 : 1;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _1423 = _1421 + 1.0;
    int _1425 = abs(_1403);
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _1429 = _1427 + 1.0;
    float _1431 = -_1413;
    float _1433 = _1431 + 1.0;
    float _1435 = rsqrt(_1393);
    bool _1437 = !_797;
    int _1439 = _1437 ? 0 : 1;
    float _1441 = in.m_30.x;
    float _1443 = in.m_30.y;
    float _1445 = in.m_30.z;
    int _1447 = abs(_1419);
    float _1449 = fma(_1433, _1423, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _1451 = fma(_1433, _1429, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _1453 = fma(_1433, 0.10000002384185791015625, 0.89999997615814208984375);
    int _1455 = abs(_1439);
    int _1457 = _1211 * _1447;
    int _1459 = _1457 + _1415;
    float _1461 = fma(_939, _1135, _1361);
    float _1463 = fma(_1041, _1139, _1305);
    float _1465 = _1449 * _1407;
    int _1467 = _1397 * _1425;
    int _1469 = _1467 + _1459;
    float _1471 = _1449 * _1405;
    float _1473 = _160 * _1435;
    float _1475 = _158 * _1435;
    int _1477 = _1353 * _1455;
    int _1479 = _1477 + _1469;
    float _1481 = _156 * _1435;
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1485 = _1473 * _1483;
    float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1489 = _1475 * _1487;
    float _1491 = _1449 * _1409;
    float _1493 = float(uint(_1479));
    float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1497 = -_1485;
    float _1499 = fma(_1481, _1495, _1497);
    float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1503 = _1481 * _1501;
    float _1505 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1509 = -_1489;
    float _1511 = fma(_1473, _1507, _1509);
    float _1513 = as_type<float>(_566) * _1493;
    float _1515 = _1499 * _1499;
    float _1517 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1519 = fma(_1441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1505);
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1523 = -_1503;
    float _1525 = fma(_1475, _1521, _1523);
    float _1527 = fma(_1511, _1511, _1515);
    float _1529 = trunc(_1513);
    float _1531 = precise::max(_1529, 0.0);
    uint _1533 = uint(_1531);
    float _1535 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1537 = fma(_1441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1517);
    float _1539 = fma(_1525, _1525, _1527);
    int _1541 = ~_490;
    int _1543 = _1541 + 1;
    float _1545 = fma(_1441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1535);
    float _1547 = fma(_1445, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1537);
    float _1549 = fma(_1445, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1519);
    float _1551 = rsqrt(_1539);
    float _1553 = fma(_1445, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1545);
    float _1555 = -_1441;
    float _1557 = fma(_1451, _1441, _1555);
    float _1559 = -_1445;
    float _1561 = fma(_1451, _1445, _1559);
    float _1563 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1465);
    float _1565 = _1549 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1567 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1313);
    float _1569 = -_1443;
    float _1571 = fma(_1453, _1443, _1569);
    int _1573 = _1543 * int(_1533);
    int _1575 = _1573 + _1479;
    float _1577 = _334 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1579 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1471);
    float _1581 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1491);
    float _1583 = float(uint(_1397));
    float _1585 = _1557 + _1565;
    float _1587 = float(uint(_1575));
    float _1589 = _336 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1591 = _1577 * _1563;
    float _1593 = _1499 * _1551;
    float _1595 = _480 * _1579;
    float _1597 = as_type<float>(_566) * _1587;
    float _1599 = _1589 * _1581;
    float _1601 = _1511 * _1551;
    float _1603 = _1525 * _1551;
    float _1605 = _1553 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1607 = _1481 * _1593;
    float _1609 = _1591 * _1473;
    float _1611 = trunc(_1597);
    float _1613 = precise::max(_1611, 0.0);
    uint _1615 = uint(_1613);
    float _1617 = _1561 + _1605;
    float _1619 = _1591 * _1481;
    float _1621 = _1475 * _1603;
    float _1623 = -_1607;
    float _1625 = fma(_1475, _1601, _1623);
    float _1627 = fma(_1595, _1603, _1609);
    float _1629 = as_type<float>(_566) * _1583;
    float _1631 = fma(_1595, _1601, _1619);
    float _1633 = -_1621;
    float _1635 = fma(_1473, _1593, _1633);
    float _1637 = fma(_1599, _1625, _1627);
    float _1639 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1263);
    float _1641 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1399);
    float _1643 = trunc(_1629);
    float _1645 = precise::max(_1643, 0.0);
    uint _1647 = uint(_1645);
    float _1649 = fma(_1599, _1635, _1631);
    float _1651 = _1617 + _1637;
    float _1653 = -_1567;
    float _1655 = fma(_1639, _1203, _1653);
    int _1657 = int(_1533) + int(_1615);
    float _1659 = _1585 + _1649;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1663 = _1651 + _1661;
    int _1665 = ~_490;
    int _1667 = _1665 + 1;
    float _1669 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[87].w, _707);
    float _1671 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1673 = _1659 + _1671;
    float _1675 = _1663 * _1663;
    int _1677 = ~_490;
    int _1679 = _1677 + 1;
    int _1681 = _1667 * _1657;
    int _1683 = _1681 + _1479;
    float _1685 = fma(_979, _1137, _1463);
    float _1687 = fma(_1673, _1673, _1675);
    float _1689 = _1335 + 0.5;
    int _1691 = _1679 * int(_1647);
    int _1693 = _1691 + _1397;
    float _1695 = _1075 + 0.5;
    bool _1697 = uint(_1683) >= uint(_490);
    float _1699 = sqrt(_1687);
    float _1701 = _1349 + 0.5;
    float _1703 = float(uint(_1693));
    float _1705 = _1655 + 0.5;
    bool _1707 = !_1697;
    int _1709 = _1707 ? 0 : (-1);
    float _1711 = _1547 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1713 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[90].y, -0.5);
    float _1715 = as_type<float>(_566) * _1703;
    int _1717 = ~_1657;
    int _1719 = _1717 + _1709;
    int _1721 = _1719 + 1;
    float _1723 = _1591 * _1475;
    float _1725 = _1473 * _1601;
    float _1727 = trunc(_1715);
    float _1729 = precise::max(_1727, 0.0);
    uint _1731 = uint(_1729);
    out.m_53.x = _1689;
    out.m_53.y = _1695;
    out.m_53.z = _1701;
    out.m_53.w = _1705;
    int _1733 = _490 * _1721;
    int _1735 = _1733 + _1479;
    float _1737 = fma(_1595, _1593, _1723);
    float _1739 = -_1725;
    float _1741 = fma(_1481, _1603, _1739);
    bool _1743 = _1699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1745 = _1571 + _1711;
    bool _1747 = !_1331;
    int _1749 = _1747 ? _1735 : (-1);
    float _1751 = fma(_1599, _1741, _1737);
    float _1753 = -_1641;
    float _1755 = fma(_1669, _1713, _1753);
    int _1757 = _1749 >> 31;
    float _1759 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1461);
    float _1761 = _1745 + _1751;
    int _1763 = int(_1647) + int(_1731);
    int _1765 = _1757 & 3;
    float _1767 = _1713;
    float _1769 = _1659;
    float _1771 = _1651;
    if (!_1743)
    {
        _1767 = _1761;
    }
    float _1773 = _1767;
    int _1775 = _1749 + _1765;
    bool _1777 = !_1743;
    float _1779 = _1773;
    if (!_1777)
    {
        float _1781 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1785 = _1699 + _1783;
        float _1787 = _1761 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1789 = rsqrt(_1687);
        float _1791 = _1785 * _1781;
        float _1793 = _1791 * 0.15915493667125701904296875;
        float _1795 = _1793 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        float _1799 = _1793 * 6.283185482025146484375;
        float _1801 = cos(_1799);
        float _1803 = fma(_1797, _1787, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1805 = _1789 * _1803;
        float _1807 = _1801 + (-1.0);
        float _1809 = fma(_1673, _1805, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1811 = fma(_1663, _1805, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1813 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1815 = fma(_1761, _1801, _1813);
        _1779 = _1815;
        _1769 = _1809;
        _1771 = _1811;
    }
    float _1817 = _1779;
    float _1819 = _1769;
    float _1821 = _1771;
    float _1823 = -_1745;
    float _1825 = _1823 + _1817;
    int _1827 = _1775 >> 2;
    float _1829 = _440 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1831 = -_1585;
    float _1833 = _1831 + _1819;
    float _1835 = _1825 * _1825;
    int _1837 = _1827 << 4;
    int _1839 = _1837 + 656;
    float _1841 = _442 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1843 = -_1617;
    float _1845 = _1843 + _1821;
    float _1847 = fma(_1833, _1833, _1835);
    int _1849 = _1839 + 8;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    uint _1853 = uint(int(uint(int(_1851)) >> uint(2)));
    int _1855 = int(_1851) & 3;
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[int(_1853)][_1855];
    int _1859 = int(_1851) + 1;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    int _1863 = _1859 & 3;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[int(_1861)][_1863];
    float _1867 = _1745 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1869 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1871 = fma(_1845, _1845, _1847);
    float _1873 = _1755 + 0.5;
    float _1875 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1867);
    int _1877 = ~_490;
    int _1879 = _1877 + 1;
    float _1881 = sqrt(_1871);
    uint _1883 = uint(int(uint(_1839) >> uint(2)));
    uint _1885 = uint(int(uint(int(_1883)) >> uint(2)));
    int _1887 = int(_1883) & 3;
    float _1889 = (*spvDescriptorSet0.vp_c9)._m0[int(_1885)][_1887];
    int _1891 = int(_1883) + 1;
    uint _1893 = uint(int(uint(_1891) >> uint(2)));
    int _1895 = _1891 & 3;
    float _1897 = (*spvDescriptorSet0.vp_c9)._m0[int(_1893)][_1895];
    float _1899 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1875);
    float _1901 = _1745 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1903 = _1879 * _1763;
    int _1905 = _1903 + _1397;
    float _1907 = fma(_1055, _1091, _1685);
    float _1909 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1911 = _1391 + 0.5;
    float _1913 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1901);
    bool _1915 = uint(_1905) >= uint(_490);
    float _1917 = 1.0 / _1909;
    float _1919 = _1829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _1911;
    out.m_55.y = _1873;
    float _1921 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1913);
    float _1923 = _1841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1925 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1927 = _1881 > 0.0;
    float _1929 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1931 = _1759 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1933 = fma(_993, _1077, _1907);
    bool _1935 = !_1915;
    int _1937 = _1935 ? 0 : (-1);
    float _1939 = _1929 + _1909;
    out.m_57.x = _1919;
    out.m_57.y = _1923;
    out.m_57.z = _1925;
    out.m_57.w = _1931;
    int _1941 = ~_1763;
    int _1943 = _1941 + _1937;
    int _1945 = _1943 + 1;
    int _1947 = _1749 & 3;
    bool _1949 = _1947 != 0;
    float _1951 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1933);
    int _1953 = _1749 & 3;
    bool _1955 = _1953 != 0;
    int _1957 = _490 * _1945;
    int _1959 = _1957 + _1397;
    bool _1961 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1963 = isnan(0.5);
    bool _1965 = _1961 || _1963;
    bool _1967 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1969 = _1965 || _1967;
    bool _1971 = uint(_1947) > 1u;
    float _1973 = _1939 * _1917;
    float _1975 = _1973 * 0.5;
    float _1977 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1979 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1977);
    int _1981 = _1955 ? 0 : 1;
    bool _1983 = !_1927;
    float _1985 = _1819;
    float _1987 = _1817;
    float _1989 = _1821;
    float _1991 = _1925;
    float _1993 = _1923;
    float _1995 = _1979;
    if (!_1983)
    {
        float _1997 = sqrt(_1393);
        float _1999 = rsqrt(_1871);
        bool _2001 = _1997 > 0.0;
        float _2003 = _1833 * _1999;
        float _2005 = _1825 * _1999;
        float _2007 = _1845 * _1999;
        bool _2009 = !_2001;
        _1993 = _2005;
        if (!_2009)
        {
            float _2011 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2013 = _1475 * _2005;
            float _2015 = fma(_1481, _2003, _2013);
            float _2017 = fma(_1473, _2007, _2015);
            float _2019 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2021 = _2017 * _2019;
            float _2023 = fma(_156, _2021, _1819);
            float _2025 = fma(_158, _2021, _1817);
            float _2027 = fma(_160, _2021, _1821);
            _1985 = _2023;
            _1987 = _2025;
            _1989 = _2027;
            _1991 = _2011;
            _1993 = _2019;
        }
    }
    float _2029 = _1985;
    float _2031 = _1987;
    float _2033 = _1989;
    float _2035 = _1991;
    float _2037 = _1993;
    float _2039 = _2035;
    float _2041 = _2037;
    if (_1969)
    {
        _2039 = _2029;
    }
    float _2043 = _2039;
    float _2045 = _2043;
    if (_1969)
    {
        _164 = _2031;
    }
    float _2047 = _164;
    int _2049 = ~_1981;
    int _2051 = _2049 + 1;
    int _2053 = _2051 + 1;
    float _2055 = _2047;
    int _2057 = _2053;
    if (_1969)
    {
        _2041 = _2033;
    }
    float _2059 = _2041;
    float _2061 = _2059;
    if (!_1969)
    {
        float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2065 = _1745 + _2063;
        float _2067 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2069 = _1585 + _2067;
        float _2071 = -_1585;
        float _2073 = _2071 + _2029;
        float _2075 = -_1745;
        float _2077 = _2075 + _2031;
        float _2079 = _2065 * _2065;
        float _2081 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2083 = _1617 + _2081;
        float _2085 = fma(_2069, _2069, _2079);
        float _2087 = fma(_2083, _2083, _2085);
        float _2089 = -_1617;
        float _2091 = _2089 + _2033;
        float _2093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2095 = sqrt(_2087);
        float _2097 = precise::min(_2095, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2099 = _2097 * _2093;
        float _2101 = fma(_2073, _2099, _1585);
        float _2103 = fma(_2077, _2099, _1745);
        float _2105 = fma(_2091, _2099, _1617);
        _2055 = _2103;
        _2045 = _2101;
        _2061 = _2105;
    }
    float _2107 = _2055;
    float _2109 = _2045;
    float _2111 = _2061;
    bool _2113 = _1947 != 3;
    float _2115 = _2107 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2117 = _2111;
    if (!_1971)
    {
        int _2119 = ~_1981;
        int _2121 = _2119 + 1;
        _2057 = _2121;
    }
    int _2123 = _2057;
    float _2125 = _2107 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _2127 = uint(_1947) >= 2u;
    float _2129 = _2107 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2131 = _2107 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2133 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2115);
    int _2135 = _2127 ? 0 : 1;
    float _2137 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2125);
    bool _2139 = !_1949;
    int _2141 = _2139 ? 0 : 1;
    float _2143 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2129);
    int _2145 = abs(_2123);
    float _2147 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2131);
    int _2149 = ~_2135;
    int _2151 = _2149 + 1;
    int _2153 = _2151 + 1;
    float _2155 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2137);
    int _2157 = abs(_2141);
    int _2159 = _2153;
    if (_2113)
    {
        int _2161 = ~_2135;
        int _2163 = _2161 + 1;
        _2159 = _2163;
    }
    int _2165 = _2159;
    float _2167 = 1.0 / _1979;
    int _2169 = ~_2145;
    int _2171 = _2169 + 1;
    int _2173 = _2171 + 1;
    bool _2175 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2177 = isnan(0.5);
    bool _2179 = _2175 || _2177;
    bool _2181 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2183 = _2179 || _2181;
    int _2185 = _2173 * as_type<int>(_1897);
    float _2187 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2133);
    int _2189 = abs(_2165);
    float _2191 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2143);
    int _2193 = ~_2157;
    int _2195 = _2193 + 1;
    int _2197 = _2195 + 1;
    float _2199 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2147);
    bool _2201 = _1947 != 3;
    bool _2203 = !_821;
    int _2205 = _2203 ? 0 : 1;
    int _2207 = _2197 * as_type<int>(_1889);
    int _2209 = _2207 + _2185;
    float _2211 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2213 = _2167 * _2211;
    if (_2183)
    {
        _2117 = 1.0;
    }
    float _2215 = _2117;
    float _2217 = _2215;
    if (_2183)
    {
        _1995 = 1.0;
    }
    float _2219 = _1995;
    int _2221 = ~_2189;
    int _2223 = _2221 + 1;
    int _2225 = _2223 + 1;
    float _2227 = _2219;
    if (!_2183)
    {
        float _2229 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2231 = _2229 * 0.15915493667125701904296875;
        float _2233 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2235 = _2231 * 6.283185482025146484375;
        float _2237 = cos(_2235);
        float _2239 = _2233 * 0.15915493667125701904296875;
        float _2241 = _2231 * 6.283185482025146484375;
        float _2243 = sin(_2241);
        float _2245 = 1.0 / _2237;
        float _2247 = _2239 * 6.283185482025146484375;
        float _2249 = cos(_2247);
        float _2251 = _2243 * _2245;
        float _2253 = _2239 * 6.283185482025146484375;
        float _2255 = sin(_2253);
        float _2257 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2259 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2257;
        float _2261 = _2249 * _2251;
        float _2263 = 1.0 / _2259;
        float _2265 = 1.0 / _2261;
        float _2267 = _2255 * _2265;
        float _2269 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2271 = fma(_2213, _2267, _2269);
        float _2273 = _2271 * _2263;
        float _2275 = precise::clamp(_2273, 0.0, 1.0);
        _2217 = _2275;
    }
    float _2277 = _2217;
    if (!_2183)
    {
        float _2279 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2281 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2283 = _2279 * 0.15915493667125701904296875;
        float _2285 = _2281 * 0.15915493667125701904296875;
        float _2287 = _2283 * 6.283185482025146484375;
        float _2289 = cos(_2287);
        float _2291 = _2283 * 6.283185482025146484375;
        float _2293 = sin(_2291);
        float _2295 = 1.0 / _2289;
        float _2297 = _2285 * 6.283185482025146484375;
        float _2299 = cos(_2297);
        float _2301 = _2293 * _2295;
        float _2303 = _2285 * 6.283185482025146484375;
        float _2305 = sin(_2303);
        float _2307 = _2299 * _2301;
        float _2309 = 1.0 / _2307;
        float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2313 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2311;
        float _2315 = 1.0 / _2313;
        float _2317 = _2305 * _2309;
        float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2321 = fma(_2213, _2317, _2319);
        float _2323 = _2321 * _2315;
        float _2325 = precise::clamp(_2323, 0.0, 1.0);
        float _2327 = -_2325;
        float _2329 = _2327 + 1.0;
        _2227 = _2329;
    }
    float _2331 = _2227;
    int _2333 = abs(_2205);
    float _2335 = _2187 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2337 = !_2201;
    int _2339 = _2337 ? 0 : (-1);
    float _2341 = _2155 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    int _2343 = _2225 * as_type<int>(_1857);
    int _2345 = _2343 + _2209;
    float _2347 = _2335 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    int _2349 = abs(_2339);
    float _2351 = _2335 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2353 = _2335 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2355 = _2335 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2357 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2347);
    int _2359 = ~_2349;
    int _2361 = _2359 + 1;
    int _2363 = _2361 + 1;
    float _2365 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2353);
    float _2367 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2355);
    float _2369 = _2191 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2371 = _2277 > 0.0;
    bool _2373 = isnan(_2277);
    bool _2375 = _2371 || _2373;
    bool _2377 = isnan(0.0);
    bool _2379 = _2375 || _2377;
    float _2381 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2351);
    int _2383 = ~_2333;
    int _2385 = _2383 + 1;
    int _2387 = _2385 + 1;
    int _2389 = _2363 * as_type<int>(_1865);
    int _2391 = _2389 + _2345;
    float _2393 = _2199 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2395 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2365);
    float _2397 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2367);
    float _2399 = _2277 * _2331;
    bool _2401 = _2331 <= 0.0;
    bool _2403 = !_2379;
    bool _2405 = _2401 || _2403;
    float _2407 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2357);
    bool _2409 = !_1331;
    int _2411 = _2409 ? _1959 : (-1);
    float _2413 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2381);
    int _2415 = _2391 * _2387;
    float _2417 = fma(_2393, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2395);
    float _2419 = fma(_2393, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2397);
    float _2421 = fma(_2393, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2413);
    int _2423 = _2411 * _2333;
    int _2425 = _2423 + _2415;
    float _2427 = fma(_2393, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2407);
    float _2429 = _2417 + _2419;
    float _2431 = _2399 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_59.x = _1951;
    float _2433 = _2429 * 0.5;
    float _2435 = _2431 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2437 = float(_2425);
    out.m_61.z = _2433;
    out.m_61.w = _2419;
    out.m_37.x = _2435;
    out.gl_Position.x = _2427;
    out.gl_Position.y = _2421;
    out.gl_Position.z = _2417;
    out.gl_Position.w = _2419;
    out.m_63.z = _2437;
    if (!_2405)
    {
        return out;
    }
    out.m_37.x = 0.0;
    float _2439 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2439;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _470 = false;
    bool _292 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _77 = in.m_30.w;
    float _79 = in.m_32.w;
    float _81 = trunc(_77);
    int _84 = int(_81);
    float _86 = -_79;
    float _88 = _86 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _88;
    bool _92 = _84 >= 1;
    float _94 = 0.0;
    float _96 = _79;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_37.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2506 = as_type<float>(_104);
        out.gl_Position.z = _2506;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _108 = _79 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_79);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = float(_84);
    bool _120 = _88 >= _118;
    bool _122 = !_116;
    bool _124 = _120 || _122;
    if (_124)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _96;
    if (_124)
    {
        out.m_37.x = 0.0;
    }
    if (_124)
    {
        float _128 = _126 * 5.0;
        _106 = as_type<int>(_128);
    }
    int _130 = _106;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2561 = as_type<float>(_130);
        out.gl_Position.z = _2561;
    }
    if (_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_39.x;
    float _134 = in.m_39.y;
    float _136 = in.m_39.z;
    float _138 = 1.0 / _118;
    bool _140 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _142 = _88 * _138;
    float _144 = _134 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _146 = _134 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _148 = _134 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _150 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[4].x, _144);
    float _152 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[5].x, _146);
    float _154 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[6].x, _148);
    float _156 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[4].z, _150);
    float _158 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[5].z, _152);
    float _160 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[6].z, _154);
    bool _162 = !_140;
    float _164 = _156;
    float _182;
    if (!_162)
    {
        float _166 = in.m_41.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _88);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        _182 = _142;
    }
    _184 = false;
    float _186 = _182;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _190 = _186 + _188;
    bool _192 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _194 = isnan(_186);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _200 = _196 || _198;
    float _202 = float(_200);
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _204;
    bool _208 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _210 = isnan(_186);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -_202;
    float _222 = _220 + 1.0;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _224;
    float _228 = 1.0 / _206;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _232 = _218 * _222;
    float _234 = -_218;
    float _236 = _234 + 1.0;
    float _238 = _190 * _228;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _240;
    float _244 = fma(_226, _238, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _246;
    float _250 = fma(_242, _238, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _252 = _244 * _232;
    float _254 = fma(_248, _238, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _256 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[143].x, _252);
    float _258 = _254 * _232;
    float _260 = _250 * _232;
    float _262 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[143].y, _258);
    float _264 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[143].z, _260);
    float _266 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[144].x, _256);
    float _268 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[144].y, _262);
    float _270 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[144].z, _264);
    bool _272 = !_230;
    float _290;
    if (!_272)
    {
        float _274 = in.m_41.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[11].x, _88);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        _290 = _142;
    }
    _292 = false;
    float _294 = _290;
    float _296 = in.m_43.x;
    float _298 = in.m_43.y;
    float _300 = in.m_43.z;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _304 = _294 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _314 = 1.0 / _308;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = 1.0 / _312;
    float _320 = _304 * _314;
    bool _322 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _324 = isnan(_294);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = _268 * _298;
    float _336 = _270 * _300;
    bool _338 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _340 = isnan(_294);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _352 = _294 + _350;
    float _354 = -_332;
    float _356 = _354 + 1.0;
    bool _358 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _360 = isnan(_294);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _370;
    float _374 = -_348;
    float _376 = _374 + 1.0;
    float _378 = _348 * _356;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _384;
    float _388 = _368 * _376;
    float _390 = fma(_372, _320, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _392 = fma(_382, _320, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _394 = fma(_386, _320, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _396 = _352 * _318;
    float _398 = -_368;
    float _400 = _398 + 1.0;
    float _402 = _392 * _388;
    float _404 = _394 * _388;
    float _406 = _390 * _388;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _420 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _402);
    float _422 = fma(_410, _396, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _424 = fma(_414, _396, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _426 = fma(_418, _396, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _428 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _404);
    float _430 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _406);
    float _432 = fma(_422, _378, _420);
    float _434 = _266 * _296;
    float _436 = fma(_424, _378, _428);
    float _438 = fma(_426, _378, _430);
    float _440 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[109].x, _432);
    float _442 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[109].y, _436);
    float _444 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[109].z, _438);
    bool _446 = !_316;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[108].y);
    bool _450 = _316;
    float _468;
    if (!_446)
    {
        float _452 = in.m_41.x;
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _456 = _452 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[11].y, _88);
        float _460 = _458 * _454;
        float _462 = floor(_460);
        float _464 = -_462;
        float _466 = _460 + _464;
        _468 = _466;
        _470 = true;
    }
    else
    {
        _468 = _142;
    }
    _470 = false;
    float _472 = _468;
    float _474 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _476 = int(_474);
    float _478 = in.m_41.w;
    float _480 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _482 = in.m_45.x;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _486 = _484 != 0;
    float _488 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _490 = int(_488);
    float _492 = in.m_41.x;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _496 = _494 != 0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _504 = _502 != 0;
    float _506 = in.m_45.y;
    float _508 = float(_476);
    float _510 = in.m_41.y;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _516 = in.m_41.z;
    float _518 = 1.0 / _508;
    float _520 = float(uint(_490));
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _526 = ~_490;
    int _528 = _526 + 1;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _534 = _478 > 0.5;
    float _536 = _506;
    float _538 = _482;
    if (_486)
    {
        float _540 = -_482;
        float _542 = _540 + 1.0;
        _448 = as_type<int>(_542);
    }
    int _544 = _448;
    float _546 = 1.0 / _520;
    if (_486)
    {
        bool _548 = _492 > 0.5;
        _450 = _548;
    }
    bool _550 = _450;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _556 = _88 * _518;
    float _558 = 1.0 / _500;
    bool _560 = _510 > 0.5;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _564 = _516 > 0.5;
    int _566 = as_type<int>(_546) + (-2);
    float _568 = trunc(_556);
    int _570 = int(_568);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _576 = 1.0 / _514;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _582 = float(_490);
    float _584 = 1.0 / _524;
    float _586 = float(uint(_570));
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _592 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _594 = isnan(_142);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = as_type<float>(_566) * _586;
    float _606 = _586;
    float _608 = _516;
    float _610 = _510;
    if (!_486)
    {
        _606 = _482;
    }
    float _612 = _606;
    float _614 = 1.0 / _532;
    float _616 = _612;
    if (_486)
    {
        float _618 = _550 ? as_type<float>(_544) : _482;
        _616 = _618;
    }
    float _620 = _616;
    float _622 = -_506;
    float _624 = _622 + 1.0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _628 = _626 != 0;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _632 = _630 != 0;
    bool _634 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _636 = isnan(_472);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = trunc(_604);
    float _648 = precise::max(_646, 0.0);
    uint _651 = uint(_648);
    bool _653 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _655 = isnan(_472);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    bool _665 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _667 = isnan(_142);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    bool _677 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _679 = isnan(_142);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = 1.0 / _554;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    float _693 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[78].w, _691);
    int _695 = _528 * int(_651);
    int _697 = _695 + _570;
    float _699 = 1.0 / _574;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _703 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[77].w, _693);
    float _705 = float(uint(_697));
    float _707 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[88].w, _701);
    float _709 = 1.0 / _580;
    float _711 = as_type<float>(_566) * _705;
    float _713 = _560 ? _624 : _506;
    int _715 = _564 ? as_type<int>(_624) : as_type<int>(_506);
    float _717 = _504 ? _713 : _506;
    float _719 = trunc(_711);
    float _721 = precise::max(_719, 0.0);
    uint _723 = uint(_721);
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _727 = _725 != 0;
    float _729 = _628 ? as_type<float>(_715) : _506;
    int _731 = _715;
    float _733 = _713;
    int _735 = as_type<int>(_624);
    if (_496)
    {
        float _737 = -_482;
        float _739 = _737 + 1.0;
        _731 = as_type<int>(_739);
    }
    int _741 = _731;
    int _743 = ~_490;
    int _745 = _743 + 1;
    if (!_496)
    {
        _733 = _482;
    }
    float _747 = _733;
    float _749 = 1.0 / _590;
    float _751 = _747;
    if (_496)
    {
        float _753 = _564 ? as_type<float>(_741) : _482;
        _751 = _753;
    }
    float _755 = _751;
    if (_632)
    {
        float _757 = _534 ? _624 : _506;
        _536 = _757;
    }
    float _759 = _536;
    if (_727)
    {
        float _761 = -_482;
        float _763 = _761 + 1.0;
        _735 = as_type<int>(_763);
    }
    int _765 = _735;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _769 = _767 != 0;
    int _771 = int(_651) + int(_723);
    if (_727)
    {
        float _773 = _560 ? as_type<float>(_765) : _482;
        _538 = _773;
    }
    float _775 = _538;
    int _777 = _745 * _771;
    int _779 = _777 + _570;
    bool _781 = uint(_779) >= uint(_490);
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _785 = _783 != 0;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _789 = _787 != 0;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _793 = _791 != 0;
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _797 = _795 != 0;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _801 = _492 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _803 = !_781;
    int _805 = _803 ? 0 : (-1);
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _807;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _813 = _811 != 0;
    float _815 = -_799;
    float _817 = fma(_801, 2.0, _815);
    int _819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _821 = _819 != 0;
    float _823 = _510 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _825 = _809 * _558;
    float _827 = fma(_823, -2.0, _562);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _839 = _831 * _576;
    bool _841 = !_769;
    float _843 = _841 ? 5.839270114898681640625 : 1.0;
    out.m_49.w = _833;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _845;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _857;
    float _861 = _847 * _584;
    float _863 = _851 * _614;
    float _865 = 1.0 / _837;
    float _867 = _859 * _689;
    bool _869 = !_769;
    float _871 = _869 ? _516 : _492;
    float _873 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[76].y, _827);
    float _875 = 0.0;
    if (!_769)
    {
        _875 = _510;
    }
    float _877 = _875;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _879;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _891 = _88 * _582;
    float _893 = _881 * _699;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _899 = 1.0 / _889;
    float _901 = _885 * _709;
    float _903 = _891 * _138;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _907 = _472 + _905;
    float _909 = _897 * _749;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _911;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _919 = 1.0 / _855;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _921;
    float _925 = _913 * _865;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _929 = _472 + _927;
    float _931 = fma(_825, _907, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _935 = _142 + _933;
    float _937 = _871 * _843;
    float _939 = fma(_863, _929, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _941 = _923 * _899;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _945 = _142 + _943;
    float _947 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _949 = fma(_901, _935, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _953 = _142 + _951;
    float _955 = fma(_867, _945, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _959 = _472 + _957;
    bool _961 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _963 = isnan(_142);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = _917 * _919;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _977 = _472 + _975;
    float _979 = fma(_925, _953, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _983 = _142 + _981;
    float _985 = fma(_861, _959, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _987 = fma(_839, _977, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _991 = _142 + _989;
    float _993 = fma(_941, _983, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _997 = _142 + _995;
    float _999 = _877;
    if (_769)
    {
        _999 = _492;
    }
    float _1001 = _999;
    float _1003 = _947 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1005 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1007 = isnan(_142);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    float _1017 = fma(_893, _991, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1021 = _142 + _1019;
    float _1023 = fma(_1003, _717, -0.5);
    bool _1025 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1027 = isnan(_142);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1033 = _1029 || _1031;
    float _1035 = float(_1033);
    float _1037 = -_1015;
    float _1039 = _1037 + 1.0;
    float _1041 = fma(_909, _997, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1043 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1045 = isnan(_472);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = fma(_973, _1021, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1057 = -_1035;
    float _1059 = _1057 + 1.0;
    bool _1061 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1063 = isnan(_472);
    bool _1065 = _1061 || _1063;
    bool _1067 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1069 = _1065 || _1067;
    float _1071 = float(_1069);
    float _1073 = -_873;
    float _1075 = fma(_703, _1023, _1073);
    float _1077 = _1015 * _1059;
    bool _1079 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1081 = isnan(_472);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1087 = _1083 || _1085;
    float _1089 = float(_1087);
    float _1091 = _971 * _1039;
    bool _1093 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1095 = isnan(_142);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1101 = _1097 || _1099;
    float _1103 = float(_1101);
    float _1105 = -_1053;
    float _1107 = _1105 + 1.0;
    float _1109 = -_971;
    float _1111 = _1109 + 1.0;
    float _1113 = -_1089;
    float _1115 = _1113 + 1.0;
    bool _1117 = _142 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1119 = isnan(_142);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1125 = _1121 || _1123;
    float _1127 = float(_1125);
    float _1129 = -_1103;
    float _1131 = _1129 + 1.0;
    float _1133 = _1071 * _1107;
    float _1135 = _1053 * _1115;
    float _1137 = _1103 * _1111;
    float _1139 = _602 * _1131;
    float _1141 = -_602;
    float _1143 = _1141 + 1.0;
    float _1145 = -_1071;
    float _1147 = _1145 + 1.0;
    float _1149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1151 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1153 = _675 * _1143;
    float _1155 = -_675;
    float _1157 = _1155 + 1.0;
    float _1159 = _663 * _1147;
    float _1161 = -_663;
    float _1163 = _1161 + 1.0;
    int _1165 = ~_771;
    int _1167 = _1165 + _805;
    int _1169 = _1167 + 1;
    float _1171 = _1127 * _1157;
    float _1173 = floor(_937);
    float _1175 = -_1127;
    float _1177 = _1175 + 1.0;
    float _1179 = _1127;
    if (_769)
    {
        _1179 = _492;
    }
    float _1181 = _1179;
    float _1183 = _644 * _1163;
    float _1185 = _1181;
    if (!_769)
    {
        _1185 = _516;
    }
    float _1187 = _1185;
    float _1189 = _687 * _1177;
    float _1191 = _931 * _1183;
    float _1193 = _1149 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1195 = _1017 * _1189;
    float _1197 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1199 = -_687;
    float _1201 = _1199 + 1.0;
    float _1203 = fma(_1193, _759, -0.5);
    float _1205 = _1193;
    if (!_769)
    {
        _1205 = _516;
    }
    float _1207 = _1205;
    float _1209 = trunc(_903);
    int _1211 = int(_1209);
    float _1213 = -_1173;
    float _1215 = _937 + _1213;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1219 = -_644;
    float _1221 = _1219 + 1.0;
    float _1223 = float(_570);
    float _1225 = -_1217;
    float _1227 = fma(_1197, 2.0, _1225);
    float _1229 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1195);
    float _1231 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1233 = _1207;
    if (_769)
    {
        _1233 = _510;
    }
    float _1235 = _1233;
    float _1237 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1191);
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1243 = _1223 >= _582;
    bool _1245 = isnan(_1223);
    bool _1247 = _1243 || _1245;
    bool _1249 = isnan(_582);
    bool _1251 = _1247 || _1249;
    float _1253 = float(_1251);
    float _1255 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[193].x + _1255;
    float _1259 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1239);
    float _1261 = _1215 * _582;
    float _1263 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1231);
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1269 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1273 = -_1265;
    float _1275 = fma(_1151, 2.0, _1273);
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_769)
    {
        _608 = _510;
    }
    float _1279 = _608;
    float _1281 = fma(_987, _1159, _1237);
    float _1283 = precise::max(0.0, _1269);
    float _1285 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1271);
    float _1287 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1277);
    if (!_769)
    {
        _610 = _492;
    }
    float _1289 = _610;
    float _1291 = trunc(_1253);
    int _1293 = int(_1291);
    float _1295 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1297 = fma(_949, _1171, _1229);
    float _1299 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1301 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1305 = fma(_955, _1153, _1297);
    int _1307 = _490 * _1169;
    int _1309 = _1307 + _570;
    float _1311 = fma(_1295, _620, -0.5);
    float _1313 = fma(_1299, -2.0, _1303);
    bool _1315 = !_813;
    int _1317 = _1315 ? 0 : 1;
    float _1319 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1285);
    float _1321 = -_88;
    float _1323 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[76].x, _817);
    float _1325 = -_88;
    float _1327 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1275);
    float _1329 = fma(_1301, _755, -0.5);
    bool _1331 = _490 == 0;
    float _1333 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1259);
    float _1335 = fma(_1319, _1311, _1323);
    int _1337 = ~_1293;
    int _1339 = _1337 + 1;
    int _1341 = _1339 + 1;
    float _1343 = _158 * _158;
    bool _1345 = !_1331;
    int _1347 = _1345 ? _1309 : (-1);
    float _1349 = fma(_1333, _1329, _1327);
    float _1351 = trunc(_1261);
    int _1353 = int(_1351);
    int _1355 = _1347 * _1341;
    bool _1357 = !_789;
    int _1359 = _1357 ? 0 : 1;
    float _1361 = fma(_985, _1133, _1281);
    int _1363 = _490 + (-1);
    float _1365 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1287);
    float _1367 = precise::max(_1283, 375.0);
    float _1369 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[90].x, -0.5);
    int _1371 = abs(_1359);
    float _1373 = -_88;
    float _1375 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1227);
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1379 = abs(_1317);
    float _1381 = fma(_156, _156, _1343);
    float _1383 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1385 = _1293 * _1363;
    int _1387 = _1385 + _1355;
    float _1389 = precise::min(_1367, 550.0);
    float _1391 = fma(_1365, _1369, _1375);
    float _1393 = fma(_160, _160, _1381);
    int _1395 = _1353 * _1379;
    int _1397 = _1395 + _570;
    float _1399 = fma(_1383, -2.0, _1377);
    bool _1401 = !_793;
    int _1403 = _1401 ? 0 : 1;
    float _1405 = in.m_51.x;
    float _1407 = in.m_51.y;
    float _1409 = in.m_51.z;
    float _1411 = fma(_1389, 0.0057142856530845165252685546875, -2.142857074737548828125);
    float _1413 = precise::clamp(_1411, 0.0, 1.0);
    int _1415 = _1387 * _1371;
    bool _1417 = !_785;
    int _1419 = _1417 ? 0 : 1;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _1423 = _1421 + 1.0;
    int _1425 = abs(_1403);
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _1429 = _1427 + 1.0;
    float _1431 = -_1413;
    float _1433 = _1431 + 1.0;
    float _1435 = rsqrt(_1393);
    bool _1437 = !_797;
    int _1439 = _1437 ? 0 : 1;
    float _1441 = in.m_30.x;
    float _1443 = in.m_30.y;
    float _1445 = in.m_30.z;
    int _1447 = abs(_1419);
    float _1449 = fma(_1433, _1423, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _1451 = fma(_1433, _1429, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _1453 = fma(_1433, 0.10000002384185791015625, 0.89999997615814208984375);
    int _1455 = abs(_1439);
    int _1457 = _1211 * _1447;
    int _1459 = _1457 + _1415;
    float _1461 = fma(_939, _1135, _1361);
    float _1463 = fma(_1041, _1139, _1305);
    float _1465 = _1449 * _1407;
    int _1467 = _1397 * _1425;
    int _1469 = _1467 + _1459;
    float _1471 = _1449 * _1405;
    float _1473 = _160 * _1435;
    float _1475 = _158 * _1435;
    int _1477 = _1353 * _1455;
    int _1479 = _1477 + _1469;
    float _1481 = _156 * _1435;
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1485 = _1473 * _1483;
    float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1489 = _1475 * _1487;
    float _1491 = _1449 * _1409;
    float _1493 = float(uint(_1479));
    float _1495 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1497 = -_1485;
    float _1499 = fma(_1481, _1495, _1497);
    float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1503 = _1481 * _1501;
    float _1505 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1509 = -_1489;
    float _1511 = fma(_1473, _1507, _1509);
    float _1513 = as_type<float>(_566) * _1493;
    float _1515 = _1499 * _1499;
    float _1517 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1519 = fma(_1441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1505);
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1523 = -_1503;
    float _1525 = fma(_1475, _1521, _1523);
    float _1527 = fma(_1511, _1511, _1515);
    float _1529 = trunc(_1513);
    float _1531 = precise::max(_1529, 0.0);
    uint _1533 = uint(_1531);
    float _1535 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1537 = fma(_1441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1517);
    float _1539 = fma(_1525, _1525, _1527);
    int _1541 = ~_490;
    int _1543 = _1541 + 1;
    float _1545 = fma(_1441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1535);
    float _1547 = fma(_1445, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1537);
    float _1549 = fma(_1445, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1519);
    float _1551 = rsqrt(_1539);
    float _1553 = fma(_1445, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1545);
    float _1555 = -_1441;
    float _1557 = fma(_1451, _1441, _1555);
    float _1559 = -_1445;
    float _1561 = fma(_1451, _1445, _1559);
    float _1563 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1465);
    float _1565 = _1549 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1567 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1313);
    float _1569 = -_1443;
    float _1571 = fma(_1453, _1443, _1569);
    int _1573 = _1543 * int(_1533);
    int _1575 = _1573 + _1479;
    float _1577 = _334 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1579 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1471);
    float _1581 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1491);
    float _1583 = float(uint(_1397));
    float _1585 = _1557 + _1565;
    float _1587 = float(uint(_1575));
    float _1589 = _336 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1591 = _1577 * _1563;
    float _1593 = _1499 * _1551;
    float _1595 = _480 * _1579;
    float _1597 = as_type<float>(_566) * _1587;
    float _1599 = _1589 * _1581;
    float _1601 = _1511 * _1551;
    float _1603 = _1525 * _1551;
    float _1605 = _1553 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1607 = _1481 * _1593;
    float _1609 = _1591 * _1473;
    float _1611 = trunc(_1597);
    float _1613 = precise::max(_1611, 0.0);
    uint _1615 = uint(_1613);
    float _1617 = _1561 + _1605;
    float _1619 = _1591 * _1481;
    float _1621 = _1475 * _1603;
    float _1623 = -_1607;
    float _1625 = fma(_1475, _1601, _1623);
    float _1627 = fma(_1595, _1603, _1609);
    float _1629 = as_type<float>(_566) * _1583;
    float _1631 = fma(_1595, _1601, _1619);
    float _1633 = -_1621;
    float _1635 = fma(_1473, _1593, _1633);
    float _1637 = fma(_1599, _1625, _1627);
    float _1639 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1263);
    float _1641 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1399);
    float _1643 = trunc(_1629);
    float _1645 = precise::max(_1643, 0.0);
    uint _1647 = uint(_1645);
    float _1649 = fma(_1599, _1635, _1631);
    float _1651 = _1617 + _1637;
    float _1653 = -_1567;
    float _1655 = fma(_1639, _1203, _1653);
    int _1657 = int(_1533) + int(_1615);
    float _1659 = _1585 + _1649;
    float _1661 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1663 = _1651 + _1661;
    int _1665 = ~_490;
    int _1667 = _1665 + 1;
    float _1669 = fma(_88, (*spvDescriptorSet0.vp_c9)._m0[87].w, _707);
    float _1671 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1673 = _1659 + _1671;
    float _1675 = _1663 * _1663;
    int _1677 = ~_490;
    int _1679 = _1677 + 1;
    int _1681 = _1667 * _1657;
    int _1683 = _1681 + _1479;
    float _1685 = fma(_979, _1137, _1463);
    float _1687 = fma(_1673, _1673, _1675);
    float _1689 = _1335 + 0.5;
    int _1691 = _1679 * int(_1647);
    int _1693 = _1691 + _1397;
    float _1695 = _1075 + 0.5;
    bool _1697 = uint(_1683) >= uint(_490);
    float _1699 = sqrt(_1687);
    float _1701 = _1349 + 0.5;
    float _1703 = float(uint(_1693));
    float _1705 = _1655 + 0.5;
    bool _1707 = !_1697;
    int _1709 = _1707 ? 0 : (-1);
    float _1711 = _1547 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1713 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[90].y, -0.5);
    float _1715 = as_type<float>(_566) * _1703;
    int _1717 = ~_1657;
    int _1719 = _1717 + _1709;
    int _1721 = _1719 + 1;
    float _1723 = _1591 * _1475;
    float _1725 = _1473 * _1601;
    float _1727 = trunc(_1715);
    float _1729 = precise::max(_1727, 0.0);
    uint _1731 = uint(_1729);
    out.m_53.x = _1689;
    out.m_53.y = _1695;
    out.m_53.z = _1701;
    out.m_53.w = _1705;
    int _1733 = _490 * _1721;
    int _1735 = _1733 + _1479;
    float _1737 = fma(_1595, _1593, _1723);
    float _1739 = -_1725;
    float _1741 = fma(_1481, _1603, _1739);
    bool _1743 = _1699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1745 = _1571 + _1711;
    bool _1747 = !_1331;
    int _1749 = _1747 ? _1735 : (-1);
    float _1751 = fma(_1599, _1741, _1737);
    float _1753 = -_1641;
    float _1755 = fma(_1669, _1713, _1753);
    int _1757 = _1749 >> 31;
    float _1759 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1461);
    float _1761 = _1745 + _1751;
    int _1763 = int(_1647) + int(_1731);
    int _1765 = _1757 & 3;
    float _1767 = _1713;
    float _1769 = _1659;
    float _1771 = _1651;
    if (!_1743)
    {
        _1767 = _1761;
    }
    float _1773 = _1767;
    int _1775 = _1749 + _1765;
    bool _1777 = !_1743;
    float _1779 = _1773;
    if (!_1777)
    {
        float _1781 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1785 = _1699 + _1783;
        float _1787 = _1761 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1789 = rsqrt(_1687);
        float _1791 = _1785 * _1781;
        float _1793 = _1791 * 0.15915493667125701904296875;
        float _1795 = _1793 * 6.283185482025146484375;
        float _1797 = sin(_1795);
        float _1799 = _1793 * 6.283185482025146484375;
        float _1801 = cos(_1799);
        float _1803 = fma(_1797, _1787, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1805 = _1789 * _1803;
        float _1807 = _1801 + (-1.0);
        float _1809 = fma(_1673, _1805, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1811 = fma(_1663, _1805, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1813 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1815 = fma(_1761, _1801, _1813);
        _1779 = _1815;
        _1769 = _1809;
        _1771 = _1811;
    }
    float _1817 = _1779;
    float _1819 = _1769;
    float _1821 = _1771;
    float _1823 = -_1745;
    float _1825 = _1823 + _1817;
    int _1827 = _1775 >> 2;
    float _1829 = _440 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1831 = -_1585;
    float _1833 = _1831 + _1819;
    float _1835 = _1825 * _1825;
    int _1837 = _1827 << 4;
    int _1839 = _1837 + 656;
    float _1841 = _442 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1843 = -_1617;
    float _1845 = _1843 + _1821;
    float _1847 = fma(_1833, _1833, _1835);
    int _1849 = _1839 + 8;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    uint _1853 = uint(int(uint(int(_1851)) >> uint(2)));
    int _1855 = int(_1851) & 3;
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[int(_1853)][_1855];
    int _1859 = int(_1851) + 1;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    int _1863 = _1859 & 3;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[int(_1861)][_1863];
    float _1867 = _1745 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1869 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1871 = fma(_1845, _1845, _1847);
    float _1873 = _1755 + 0.5;
    float _1875 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1867);
    int _1877 = ~_490;
    int _1879 = _1877 + 1;
    float _1881 = sqrt(_1871);
    uint _1883 = uint(int(uint(_1839) >> uint(2)));
    uint _1885 = uint(int(uint(int(_1883)) >> uint(2)));
    int _1887 = int(_1883) & 3;
    float _1889 = (*spvDescriptorSet0.vp_c9)._m0[int(_1885)][_1887];
    int _1891 = int(_1883) + 1;
    uint _1893 = uint(int(uint(_1891) >> uint(2)));
    int _1895 = _1891 & 3;
    float _1897 = (*spvDescriptorSet0.vp_c9)._m0[int(_1893)][_1895];
    float _1899 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1875);
    float _1901 = _1745 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1903 = _1879 * _1763;
    int _1905 = _1903 + _1397;
    float _1907 = fma(_1055, _1091, _1685);
    float _1909 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1911 = _1391 + 0.5;
    float _1913 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1901);
    bool _1915 = uint(_1905) >= uint(_490);
    float _1917 = 1.0 / _1909;
    float _1919 = _1829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _1911;
    out.m_55.y = _1873;
    float _1921 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1913);
    float _1923 = _1841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1925 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1927 = _1881 > 0.0;
    float _1929 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1931 = _1759 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1933 = fma(_993, _1077, _1907);
    bool _1935 = !_1915;
    int _1937 = _1935 ? 0 : (-1);
    float _1939 = _1929 + _1909;
    out.m_57.x = _1919;
    out.m_57.y = _1923;
    out.m_57.z = _1925;
    out.m_57.w = _1931;
    int _1941 = ~_1763;
    int _1943 = _1941 + _1937;
    int _1945 = _1943 + 1;
    int _1947 = _1749 & 3;
    bool _1949 = _1947 != 0;
    float _1951 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1933);
    int _1953 = _1749 & 3;
    bool _1955 = _1953 != 0;
    int _1957 = _490 * _1945;
    int _1959 = _1957 + _1397;
    bool _1961 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1963 = isnan(0.5);
    bool _1965 = _1961 || _1963;
    bool _1967 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1969 = _1965 || _1967;
    bool _1971 = uint(_1947) > 1u;
    float _1973 = _1939 * _1917;
    float _1975 = _1973 * 0.5;
    float _1977 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1979 = fma(_1975, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1977);
    int _1981 = _1955 ? 0 : 1;
    bool _1983 = !_1927;
    float _1985 = _1819;
    float _1987 = _1817;
    float _1989 = _1821;
    float _1991 = _1925;
    float _1993 = _1923;
    float _1995 = _1979;
    if (!_1983)
    {
        float _1997 = sqrt(_1393);
        float _1999 = rsqrt(_1871);
        bool _2001 = _1997 > 0.0;
        float _2003 = _1833 * _1999;
        float _2005 = _1825 * _1999;
        float _2007 = _1845 * _1999;
        bool _2009 = !_2001;
        _1993 = _2005;
        if (!_2009)
        {
            float _2011 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2013 = _1475 * _2005;
            float _2015 = fma(_1481, _2003, _2013);
            float _2017 = fma(_1473, _2007, _2015);
            float _2019 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2021 = _2017 * _2019;
            float _2023 = fma(_156, _2021, _1819);
            float _2025 = fma(_158, _2021, _1817);
            float _2027 = fma(_160, _2021, _1821);
            _1985 = _2023;
            _1987 = _2025;
            _1989 = _2027;
            _1991 = _2011;
            _1993 = _2019;
        }
    }
    float _2029 = _1985;
    float _2031 = _1987;
    float _2033 = _1989;
    float _2035 = _1991;
    float _2037 = _1993;
    float _2039 = _2035;
    float _2041 = _2037;
    if (_1969)
    {
        _2039 = _2029;
    }
    float _2043 = _2039;
    float _2045 = _2043;
    if (_1969)
    {
        _164 = _2031;
    }
    float _2047 = _164;
    int _2049 = ~_1981;
    int _2051 = _2049 + 1;
    int _2053 = _2051 + 1;
    float _2055 = _2047;
    int _2057 = _2053;
    if (_1969)
    {
        _2041 = _2033;
    }
    float _2059 = _2041;
    float _2061 = _2059;
    if (!_1969)
    {
        float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2065 = _1745 + _2063;
        float _2067 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2069 = _1585 + _2067;
        float _2071 = -_1585;
        float _2073 = _2071 + _2029;
        float _2075 = -_1745;
        float _2077 = _2075 + _2031;
        float _2079 = _2065 * _2065;
        float _2081 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2083 = _1617 + _2081;
        float _2085 = fma(_2069, _2069, _2079);
        float _2087 = fma(_2083, _2083, _2085);
        float _2089 = -_1617;
        float _2091 = _2089 + _2033;
        float _2093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2095 = sqrt(_2087);
        float _2097 = precise::min(_2095, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2099 = _2097 * _2093;
        float _2101 = fma(_2073, _2099, _1585);
        float _2103 = fma(_2077, _2099, _1745);
        float _2105 = fma(_2091, _2099, _1617);
        _2055 = _2103;
        _2045 = _2101;
        _2061 = _2105;
    }
    float _2107 = _2055;
    float _2109 = _2045;
    float _2111 = _2061;
    bool _2113 = _1947 != 3;
    float _2115 = _2107 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2117 = _2111;
    if (!_1971)
    {
        int _2119 = ~_1981;
        int _2121 = _2119 + 1;
        _2057 = _2121;
    }
    int _2123 = _2057;
    float _2125 = _2107 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _2127 = uint(_1947) >= 2u;
    float _2129 = _2107 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2131 = _2107 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2133 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2115);
    int _2135 = _2127 ? 0 : 1;
    float _2137 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2125);
    bool _2139 = !_1949;
    int _2141 = _2139 ? 0 : 1;
    float _2143 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2129);
    int _2145 = abs(_2123);
    float _2147 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2131);
    int _2149 = ~_2135;
    int _2151 = _2149 + 1;
    int _2153 = _2151 + 1;
    float _2155 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2137);
    int _2157 = abs(_2141);
    int _2159 = _2153;
    if (_2113)
    {
        int _2161 = ~_2135;
        int _2163 = _2161 + 1;
        _2159 = _2163;
    }
    int _2165 = _2159;
    float _2167 = 1.0 / _1979;
    int _2169 = ~_2145;
    int _2171 = _2169 + 1;
    int _2173 = _2171 + 1;
    bool _2175 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2177 = isnan(0.5);
    bool _2179 = _2175 || _2177;
    bool _2181 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2183 = _2179 || _2181;
    int _2185 = _2173 * as_type<int>(_1897);
    float _2187 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2133);
    int _2189 = abs(_2165);
    float _2191 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2143);
    int _2193 = ~_2157;
    int _2195 = _2193 + 1;
    int _2197 = _2195 + 1;
    float _2199 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2147);
    bool _2201 = _1947 != 3;
    bool _2203 = !_821;
    int _2205 = _2203 ? 0 : 1;
    int _2207 = _2197 * as_type<int>(_1889);
    int _2209 = _2207 + _2185;
    float _2211 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2213 = _2167 * _2211;
    if (_2183)
    {
        _2117 = 1.0;
    }
    float _2215 = _2117;
    float _2217 = _2215;
    if (_2183)
    {
        _1995 = 1.0;
    }
    float _2219 = _1995;
    int _2221 = ~_2189;
    int _2223 = _2221 + 1;
    int _2225 = _2223 + 1;
    float _2227 = _2219;
    if (!_2183)
    {
        float _2229 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2231 = _2229 * 0.15915493667125701904296875;
        float _2233 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2235 = _2231 * 6.283185482025146484375;
        float _2237 = cos(_2235);
        float _2239 = _2233 * 0.15915493667125701904296875;
        float _2241 = _2231 * 6.283185482025146484375;
        float _2243 = sin(_2241);
        float _2245 = 1.0 / _2237;
        float _2247 = _2239 * 6.283185482025146484375;
        float _2249 = cos(_2247);
        float _2251 = _2243 * _2245;
        float _2253 = _2239 * 6.283185482025146484375;
        float _2255 = sin(_2253);
        float _2257 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2259 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2257;
        float _2261 = _2249 * _2251;
        float _2263 = 1.0 / _2259;
        float _2265 = 1.0 / _2261;
        float _2267 = _2255 * _2265;
        float _2269 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2271 = fma(_2213, _2267, _2269);
        float _2273 = _2271 * _2263;
        float _2275 = precise::clamp(_2273, 0.0, 1.0);
        _2217 = _2275;
    }
    float _2277 = _2217;
    if (!_2183)
    {
        float _2279 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2281 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2283 = _2279 * 0.15915493667125701904296875;
        float _2285 = _2281 * 0.15915493667125701904296875;
        float _2287 = _2283 * 6.283185482025146484375;
        float _2289 = cos(_2287);
        float _2291 = _2283 * 6.283185482025146484375;
        float _2293 = sin(_2291);
        float _2295 = 1.0 / _2289;
        float _2297 = _2285 * 6.283185482025146484375;
        float _2299 = cos(_2297);
        float _2301 = _2293 * _2295;
        float _2303 = _2285 * 6.283185482025146484375;
        float _2305 = sin(_2303);
        float _2307 = _2299 * _2301;
        float _2309 = 1.0 / _2307;
        float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2313 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2311;
        float _2315 = 1.0 / _2313;
        float _2317 = _2305 * _2309;
        float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2321 = fma(_2213, _2317, _2319);
        float _2323 = _2321 * _2315;
        float _2325 = precise::clamp(_2323, 0.0, 1.0);
        float _2327 = -_2325;
        float _2329 = _2327 + 1.0;
        _2227 = _2329;
    }
    float _2331 = _2227;
    int _2333 = abs(_2205);
    float _2335 = _2187 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2337 = !_2201;
    int _2339 = _2337 ? 0 : (-1);
    float _2341 = _2155 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    int _2343 = _2225 * as_type<int>(_1857);
    int _2345 = _2343 + _2209;
    float _2347 = _2335 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    int _2349 = abs(_2339);
    float _2351 = _2335 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2353 = _2335 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2355 = _2335 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2357 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2347);
    int _2359 = ~_2349;
    int _2361 = _2359 + 1;
    int _2363 = _2361 + 1;
    float _2365 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2353);
    float _2367 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2355);
    float _2369 = _2191 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2371 = _2277 > 0.0;
    bool _2373 = isnan(_2277);
    bool _2375 = _2371 || _2373;
    bool _2377 = isnan(0.0);
    bool _2379 = _2375 || _2377;
    float _2381 = fma(_2341, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2351);
    int _2383 = ~_2333;
    int _2385 = _2383 + 1;
    int _2387 = _2385 + 1;
    int _2389 = _2363 * as_type<int>(_1865);
    int _2391 = _2389 + _2345;
    float _2393 = _2199 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2395 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2365);
    float _2397 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2367);
    float _2399 = _2277 * _2331;
    bool _2401 = _2331 <= 0.0;
    bool _2403 = !_2379;
    bool _2405 = _2401 || _2403;
    float _2407 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2357);
    bool _2409 = !_1331;
    int _2411 = _2409 ? _1959 : (-1);
    float _2413 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2381);
    int _2415 = _2391 * _2387;
    float _2417 = fma(_2393, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2395);
    float _2419 = fma(_2393, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2397);
    float _2421 = fma(_2393, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2413);
    int _2423 = _2411 * _2333;
    int _2425 = _2423 + _2415;
    float _2427 = fma(_2393, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2407);
    float _2429 = _2417 + _2419;
    float _2431 = _2399 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_59.x = _1951;
    float _2433 = _2429 * 0.5;
    float _2435 = _2431 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2437 = float(_2425);
    out.m_61.z = _2433;
    out.m_61.w = _2419;
    out.m_37.x = _2435;
    out.gl_Position.x = _2427;
    out.gl_Position.y = _2421;
    out.gl_Position.z = _2417;
    out.gl_Position.w = _2419;
    out.m_63.z = _2437;
    if (!_2405)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_37.x = 0.0;
    float _2439 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2439;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

