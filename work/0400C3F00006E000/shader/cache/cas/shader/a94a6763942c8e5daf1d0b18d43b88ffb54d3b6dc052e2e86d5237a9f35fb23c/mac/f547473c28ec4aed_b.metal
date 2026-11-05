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
    float4 m_41 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_43 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_45 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _980 = false;
    bool _758 = false;
    bool _616 = false;
    bool _394 = false;
    bool _268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1527 = as_type<float>(_88);
        out.gl_Position.z = _1527;
    }
    if (!_76)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _92 = in.m_35.w;
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
        out.m_33.x = 0.0;
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
        float _1596 = as_type<float>(_124);
        out.gl_Position.z = _1596;
    }
    if (_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_37.w;
    float _128 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _130 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _132 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _134 = _130 || _132;
    bool _136 = isnan(1.0);
    bool _138 = _134 || _136;
    float _140 = in.m_35.x;
    float _142 = in.m_35.y;
    float _144 = in.m_35.z;
    float _146 = in.m_30.x;
    float _148 = in.m_30.y;
    float _150 = in.m_30.z;
    float _152 = 0.0;
    float _154 = _128;
    if (!_138)
    {
        float _156 = _128 * _128;
        float _158 = _156 * 0.5;
        _152 = _158;
    }
    float _160 = _152;
    float _162 = _160;
    if (!_138)
    {
        float _164 = _160 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _162 = _164;
    }
    float _166 = _162;
    bool _168 = !_138;
    float _170 = _166;
    if (!_168)
    {
        float _172 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _174 = log2(_172);
        float _176 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _178 = _176 + 1.0;
        float _180 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = _128 * _174;
        float _184 = 1.0 / _178;
        float _186 = _180 * 0.693147182464599609375;
        float _188 = exp2(_182);
        float _190 = 1.0 / _186;
        float _192 = _188 + (-1.0);
        float _194 = -_192;
        float _196 = fma(_194, _190, _128);
        float _198 = _196 * _184;
        float _200 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _200;
    }
    float _202 = _170;
    bool _204 = !_138;
    if (!_204)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = 1.0 / _212;
        float _216 = _128 * _208;
        float _218 = exp2(_216);
        float _220 = -_218;
        float _222 = _220 + 1.0;
        float _224 = _222 * _214;
        _154 = _224;
    }
    float _226 = _154;
    bool _228 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _230 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _232 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _234 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _236 = fma(_226, _140, _230);
    float _238 = fma(_226, _142, _232);
    float _240 = fma(_226, _144, _234);
    float _242 = fma(_236, _126, _146);
    float _244 = fma(_238, _126, _148);
    float _246 = fma(_240, _126, _150);
    bool _248 = !_228;
    float _266;
    if (!_248)
    {
        float _250 = in.m_39.x;
        float _252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _254 = _250 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[12].x, _106);
        float _258 = _256 * _252;
        float _260 = floor(_258);
        float _262 = -_260;
        float _264 = _258 + _262;
        _266 = _264;
        _268 = true;
    }
    else
    {
        float _270 = float(_72);
        float _272 = 1.0 / _270;
        float _274 = _106 * _272;
        _266 = _274;
    }
    _268 = false;
    float _276 = _266;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _276 + _278;
    bool _282 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _284 = isnan(_276);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _294;
    float _298 = -_292;
    float _300 = _298 + 1.0;
    bool _302 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _304 = isnan(_276);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = 1.0 / _296;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _320;
    bool _324 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _326 = _280 * _314;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = in.m_37.x;
    float _334 = in.m_37.y;
    float _336 = in.m_37.z;
    float _338 = _312 * _300;
    float _340 = fma(_318, _326, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _342 = fma(_330, _326, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = fma(_322, _326, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _346 = -_312;
    float _348 = _346 + 1.0;
    float _350 = _340 * _338;
    float _352 = _342 * _338;
    float _354 = _344 * _338;
    float _356 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _358 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _360 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].z, _354);
    float _362 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[144].x, _356);
    float _364 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[144].y, _358);
    float _366 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[144].z, _360);
    float _368 = _362 * _332;
    float _370 = _364 * _334;
    float _372 = _366 * _336;
    bool _374 = !_324;
    float _392;
    if (!_374)
    {
        float _376 = in.m_39.x;
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _380 = _376 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[11].x, _106);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        float _396 = float(_72);
        float _398 = 1.0 / _396;
        float _400 = _106 * _398;
        _392 = _400;
    }
    _394 = false;
    float _402 = _392;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _406 = _402 + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _410 = _402 + _408;
    bool _412 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _414 = isnan(_402);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _430 = _402 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _440 = 1.0 / _426;
    bool _442 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _444 = 1.0 / _438;
    float _446 = 1.0 / _434;
    float _448 = _406 * _440;
    bool _450 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _452 = isnan(_402);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -_422;
    float _464 = _462 + 1.0;
    float _466 = _460 * _464;
    float _468 = _410 * _444;
    bool _470 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _472 = isnan(_402);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _482;
    bool _486 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _488 = isnan(_402);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _502 = -_460;
    float _504 = _502 + 1.0;
    float _506 = -_480;
    float _508 = _506 + 1.0;
    float _510 = _430 * _446;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _516;
    float _520 = _496 * _508;
    float _522 = fma(_484, _510, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _524 = fma(_514, _510, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _526 = fma(_518, _510, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _528 = _480 * _504;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _534 = _524 * _520;
    float _536 = _526 * _520;
    float _538 = _522 * _520;
    float _540 = -_496;
    float _542 = _540 + 1.0;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _548 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[107].x, _536);
    float _550 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[107].y, _534);
    float _552 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[107].z, _538);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _554;
    float _558 = fma(_500, _468, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _560 = fma(_546, _468, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _562 = fma(_532, _468, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _564;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _568;
    float _572 = fma(_558, _528, _548);
    float _574 = fma(_556, _448, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _576 = fma(_566, _448, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _578 = fma(_570, _448, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _580 = fma(_560, _528, _550);
    float _582 = fma(_562, _528, _552);
    float _584 = fma(_574, _466, _572);
    float _586 = fma(_576, _466, _580);
    float _588 = fma(_578, _466, _582);
    float _590 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[110].x, _584);
    float _592 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[110].y, _586);
    float _594 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[110].z, _588);
    bool _596 = !_442;
    float _614;
    if (!_596)
    {
        float _598 = in.m_39.x;
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _602 = _598 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        float _618 = float(_72);
        float _620 = 1.0 / _618;
        float _622 = _106 * _620;
        _614 = _622;
    }
    _616 = false;
    float _624 = _614;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _628 = _624 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _634 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _636 = isnan(_624);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _650 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _652 = isnan(_624);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _662;
    bool _666 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _668 = isnan(_624);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = 1.0 / _632;
    float _680 = -_644;
    float _682 = _680 + 1.0;
    bool _684 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _686 = _660 * _682;
    float _688 = -_660;
    float _690 = _688 + 1.0;
    float _692 = 1.0 / _648;
    float _694 = _664 * _678;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _700 = fma(_694, _628, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _702 = _698 * _692;
    float _704 = _700 * _686;
    float _706 = -_676;
    float _708 = _706 + 1.0;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _712 = _624 + _710;
    float _714 = _590 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _716 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[115].x, _704);
    float _718 = _644 * _708;
    float _720 = fma(_702, _712, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _722 = _594 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _724 = _714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _726 = fma(_720, _718, _716);
    float _728 = _592 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _730 = _722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _732 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[117].x, _726);
    float _734 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _736 = _732 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.x = _724;
    out.m_41.y = _734;
    out.m_41.z = _730;
    out.m_41.w = _736;
    bool _738 = !_684;
    float _756;
    if (!_738)
    {
        float _740 = in.m_39.x;
        float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _744 = _740 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[11].z, _106);
        float _748 = _746 * _742;
        float _750 = floor(_748);
        float _752 = -_750;
        float _754 = _748 + _752;
        _756 = _754;
        _758 = true;
    }
    else
    {
        float _760 = float(_72);
        float _762 = 1.0 / _760;
        float _764 = _106 * _762;
        _756 = _764;
    }
    _758 = false;
    float _766 = _756;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _770 = _766 + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _774 = _766 + _772;
    bool _776 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _778 = isnan(_766);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _794 = _766 + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _804 = 1.0 / _790;
    bool _806 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _808 = 1.0 / _802;
    float _810 = 1.0 / _798;
    float _812 = _770 * _804;
    bool _814 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _816 = isnan(_766);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = -_786;
    float _828 = _826 + 1.0;
    float _830 = _824 * _828;
    float _832 = _774 * _808;
    bool _834 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _836 = isnan(_766);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _846;
    bool _850 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _852 = isnan(_766);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _866 = -_824;
    float _868 = _866 + 1.0;
    float _870 = -_844;
    float _872 = _870 + 1.0;
    float _874 = _794 * _810;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _876;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _880;
    float _884 = _860 * _872;
    float _886 = fma(_848, _874, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _888 = fma(_878, _874, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _890 = fma(_882, _874, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _892 = _844 * _868;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _898 = _888 * _884;
    float _900 = _890 * _884;
    float _902 = _886 * _884;
    float _904 = -_860;
    float _906 = _904 + 1.0;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _912 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[123].x, _900);
    float _914 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[123].y, _898);
    float _916 = fma(_864, _832, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _918 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[123].z, _902);
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _920;
    float _924 = fma(_910, _832, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _926 = fma(_896, _832, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _928;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _932;
    float _936 = fma(_916, _892, _912);
    float _938 = fma(_922, _812, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _940 = fma(_930, _812, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _942 = fma(_934, _812, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _944 = fma(_924, _892, _914);
    float _946 = fma(_926, _892, _918);
    float _948 = fma(_938, _830, _936);
    float _950 = fma(_940, _830, _944);
    float _952 = fma(_942, _830, _946);
    float _954 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[126].x, _948);
    float _956 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[126].y, _950);
    float _958 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[126].z, _952);
    bool _960 = !_806;
    float _978;
    if (!_960)
    {
        float _962 = in.m_39.x;
        float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _966 = _962 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _968 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[11].w, _106);
        float _970 = _968 * _964;
        float _972 = floor(_970);
        float _974 = -_972;
        float _976 = _970 + _974;
        _978 = _976;
        _980 = true;
    }
    else
    {
        float _982 = float(_72);
        float _984 = 1.0 / _982;
        float _986 = _106 * _984;
        _978 = _986;
    }
    _980 = false;
    float _988 = _978;
    float _990 = in.m_39.y;
    float _992 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _994 = in.m_43.x;
    float _996 = in.m_43.y;
    float _998 = in.m_43.z;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1002 = _1000 != 0;
    float _1004 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1008 = _1006 != 0;
    float _1010 = in.m_45.y;
    float _1012 = _244 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1014 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1016 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1012);
    float _1018 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1016);
    bool _1020 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1022 = isnan(0.5);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1028 = _1024 || _1026;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    bool _1030 = _990 > 0.5;
    float _1032 = _244 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1034 = _244 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1036 = 1.0;
    if (_1002)
    {
        float _1038 = in.m_39.x;
        _1036 = _1038;
    }
    float _1040 = _1036;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _994);
    float _1044 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1032);
    float _1046 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1034);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1052 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _996);
    float _1054 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _998);
    float _1056 = _1014 * _1042;
    float _1058 = _992 * _1052;
    float _1060 = _1004 * _1054;
    float _1062 = -_1010;
    float _1064 = _1062 + 1.0;
    float _1066 = 1.0 / _1050;
    float _1068 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1074 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1046);
    float _1076 = _1010;
    float _1078 = _1060;
    if (_1008)
    {
        float _1080 = _1030 ? _1064 : _1010;
        _1076 = _1080;
    }
    float _1082 = _1076;
    float _1084 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1068);
    float _1086 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1044);
    float _1088 = 1.0 / _1072;
    float _1090 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1092 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1084);
    float _1094 = _1074 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1096;
    float _1100 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1106 = _1040 > 0.5;
    bool _1108 = _1106 && _1002;
    float _1110 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1090);
    float _1112 = _1094 + _1100;
    float _1114 = _1098 * _1066;
    float _1116 = _1086 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1118 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1110);
    float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1122 = _1112 + _1120;
    float _1124 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1126 = _1104 * _1088;
    float _1128 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1130 = _1122 * _1122;
    bool _1132 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1134 = isnan(_988);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    float _1144 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1146 = _1116 + _1128;
    float _1148 = in.m_45.x;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1152 = _988 + _1150;
    bool _1154 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1156 = isnan(_988);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1168 = _1146 + _1166;
    float _1170 = -_1142;
    float _1172 = _1170 + 1.0;
    float _1174 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1144);
    float _1176 = fma(_1114, _1152, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1178 = fma(_1168, _1168, _1130);
    bool _1180 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1182 = isnan(_988);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    float _1192 = _1164 * _1172;
    float _1194 = -_1164;
    float _1196 = _1194 + 1.0;
    float _1198 = sqrt(_1178);
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1202 = _988 + _1200;
    float _1204 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1174);
    float _1206 = _1190 * _1196;
    float _1208 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1210 = fma(_1126, _1202, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1214 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1216 = _1176 * _1206;
    float _1218 = -_1190;
    float _1220 = _1218 + 1.0;
    float _1222 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1208);
    float _1224 = 1.0 / _1212;
    float _1226 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1214);
    float _1228 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1216);
    float _1230 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1222);
    float _1232 = _1142;
    float _1234 = _1210;
    if (_1002)
    {
        _1078 = _1148;
    }
    float _1236 = _1078;
    float _1238 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1226);
    bool _1240 = _1198 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1242 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1246 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1248 = _1236;
    float _1250 = _1238;
    if (_1108)
    {
        float _1252 = -_1236;
        float _1254 = _1252 + 1.0;
        _1248 = _1254;
    }
    float _1256 = _1248;
    float _1258 = fma(_1210, _1192, _1228);
    float _1260 = _1124 + _1242;
    float _1262 = _1246 + _1212;
    float _1264 = _1262;
    if (!_1002)
    {
        _1250 = _1148;
    }
    float _1266 = _1250;
    float _1268 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1258);
    float _1270 = _1266;
    if (_1002)
    {
        _1270 = _1256;
    }
    float _1272 = _1270;
    float _1274 = _1262 * _1224;
    float _1276 = _1274 * 0.5;
    if (!_1240)
    {
        _1232 = _1146;
    }
    float _1278 = _1232;
    float _1280 = _1278;
    if (!_1240)
    {
        _1264 = _1112;
    }
    float _1282 = _1264;
    float _1284 = _1282;
    if (!_1240)
    {
        _1234 = _1260;
    }
    float _1286 = _1234;
    bool _1288 = !_1240;
    float _1290 = _1286;
    if (!_1288)
    {
        float _1292 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1294 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1296 = _1198 + _1294;
        float _1298 = _1260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1300 = rsqrt(_1178);
        float _1302 = _1296 * _1292;
        float _1304 = _1302 * 0.15915493667125701904296875;
        float _1306 = _1304 * 6.283185482025146484375;
        float _1308 = sin(_1306);
        float _1310 = _1304 * 6.283185482025146484375;
        float _1312 = cos(_1310);
        float _1314 = fma(_1308, _1298, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1316 = _1300 * _1314;
        float _1318 = _1312 + (-1.0);
        float _1320 = fma(_1168, _1316, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1322 = fma(_1122, _1316, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1324 = _1318 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1326 = fma(_1260, _1312, _1324);
        _1290 = _1326;
        _1280 = _1320;
        _1284 = _1322;
    }
    float _1328 = _1290;
    float _1330 = _1280;
    float _1332 = _1284;
    float _1334 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1336 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1338 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1340 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1342 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1334);
    float _1344 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1336);
    float _1346 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1338);
    float _1348 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1340);
    float _1350 = _1334;
    if (_1028)
    {
        _1350 = 1.0;
    }
    float _1352 = _1350;
    float _1354 = _1352;
    if (!_1028)
    {
        float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1358 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1356);
        float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1362 = _1360 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1364 = 1.0 / _1358;
        float _1366 = 1.0 / _1362;
        float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1372 = fma(_1364, _1368, _1370);
        float _1374 = _1372 * _1366;
        float _1376 = precise::clamp(_1374, 0.0, 1.0);
        _1354 = _1376;
    }
    float _1378 = _1354;
    float _1380 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1344);
    float _1382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1384 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1342);
    float _1386 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1346);
    float _1388 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1390 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1348);
    float _1392 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1394 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1398 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1400 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1402 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1404 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1396);
    float _1406 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1398);
    float _1408 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1400);
    float _1410 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1412 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1414 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1402);
    float _1416 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1404);
    float _1418 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1406);
    float _1420 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1422 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1408);
    float _1424 = _954 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1426 = _1410 * _1382;
    float _1428 = _1412 * _1244;
    float _1430 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1416);
    float _1432 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1418);
    float _1434 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1422);
    bool _1436 = _1378 > 0.0;
    bool _1438 = isnan(_1378);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan(0.0);
    bool _1444 = _1440 || _1442;
    float _1446 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1414);
    float _1448 = _956 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1450 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1452 = _958 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1454 = _1378 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1456 = _1430 + _1432;
    float _1458 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1446);
    float _1460 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1462 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1464 = _1268 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1466 = _1454 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1468 = _1456 * 0.5;
    out.m_49.x = _1428;
    out.m_49.y = _1426;
    out.m_51.x = _1450;
    out.m_51.y = _1460;
    out.m_51.z = _1462;
    out.m_51.w = _1464;
    out.m_33.x = _1466;
    out.gl_Position.x = _1434;
    out.gl_Position.y = _1458;
    out.gl_Position.z = _1430;
    out.gl_Position.w = _1432;
    out.m_53.z = _1468;
    out.m_53.w = _1432;
    if (_1444)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1470 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1470;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _980 = false;
    bool _758 = false;
    bool _616 = false;
    bool _394 = false;
    bool _268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1527 = as_type<float>(_88);
        out.gl_Position.z = _1527;
    }
    if (!_76)
    {
        return out;
    }
    float _92 = in.m_35.w;
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
        out.m_33.x = 0.0;
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
        float _1596 = as_type<float>(_124);
        out.gl_Position.z = _1596;
    }
    if (_116)
    {
        return out;
    }
    float _126 = in.m_37.w;
    float _128 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _130 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _132 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _134 = _130 || _132;
    bool _136 = isnan(1.0);
    bool _138 = _134 || _136;
    float _140 = in.m_35.x;
    float _142 = in.m_35.y;
    float _144 = in.m_35.z;
    float _146 = in.m_30.x;
    float _148 = in.m_30.y;
    float _150 = in.m_30.z;
    float _152 = 0.0;
    float _154 = _128;
    if (!_138)
    {
        float _156 = _128 * _128;
        float _158 = _156 * 0.5;
        _152 = _158;
    }
    float _160 = _152;
    float _162 = _160;
    if (!_138)
    {
        float _164 = _160 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _162 = _164;
    }
    float _166 = _162;
    bool _168 = !_138;
    float _170 = _166;
    if (!_168)
    {
        float _172 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _174 = log2(_172);
        float _176 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _178 = _176 + 1.0;
        float _180 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = _128 * _174;
        float _184 = 1.0 / _178;
        float _186 = _180 * 0.693147182464599609375;
        float _188 = exp2(_182);
        float _190 = 1.0 / _186;
        float _192 = _188 + (-1.0);
        float _194 = -_192;
        float _196 = fma(_194, _190, _128);
        float _198 = _196 * _184;
        float _200 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _200;
    }
    float _202 = _170;
    bool _204 = !_138;
    if (!_204)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = 1.0 / _212;
        float _216 = _128 * _208;
        float _218 = exp2(_216);
        float _220 = -_218;
        float _222 = _220 + 1.0;
        float _224 = _222 * _214;
        _154 = _224;
    }
    float _226 = _154;
    bool _228 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _230 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _232 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _234 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _236 = fma(_226, _140, _230);
    float _238 = fma(_226, _142, _232);
    float _240 = fma(_226, _144, _234);
    float _242 = fma(_236, _126, _146);
    float _244 = fma(_238, _126, _148);
    float _246 = fma(_240, _126, _150);
    bool _248 = !_228;
    float _266;
    if (!_248)
    {
        float _250 = in.m_39.x;
        float _252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _254 = _250 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[12].x, _106);
        float _258 = _256 * _252;
        float _260 = floor(_258);
        float _262 = -_260;
        float _264 = _258 + _262;
        _266 = _264;
        _268 = true;
    }
    else
    {
        float _270 = float(_72);
        float _272 = 1.0 / _270;
        float _274 = _106 * _272;
        _266 = _274;
    }
    _268 = false;
    float _276 = _266;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _276 + _278;
    bool _282 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _284 = isnan(_276);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _294;
    float _298 = -_292;
    float _300 = _298 + 1.0;
    bool _302 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _304 = isnan(_276);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = 1.0 / _296;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _320;
    bool _324 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _326 = _280 * _314;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = in.m_37.x;
    float _334 = in.m_37.y;
    float _336 = in.m_37.z;
    float _338 = _312 * _300;
    float _340 = fma(_318, _326, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _342 = fma(_330, _326, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = fma(_322, _326, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _346 = -_312;
    float _348 = _346 + 1.0;
    float _350 = _340 * _338;
    float _352 = _342 * _338;
    float _354 = _344 * _338;
    float _356 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _358 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _360 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].z, _354);
    float _362 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[144].x, _356);
    float _364 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[144].y, _358);
    float _366 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[144].z, _360);
    float _368 = _362 * _332;
    float _370 = _364 * _334;
    float _372 = _366 * _336;
    bool _374 = !_324;
    float _392;
    if (!_374)
    {
        float _376 = in.m_39.x;
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _380 = _376 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[11].x, _106);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        float _396 = float(_72);
        float _398 = 1.0 / _396;
        float _400 = _106 * _398;
        _392 = _400;
    }
    _394 = false;
    float _402 = _392;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _406 = _402 + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _410 = _402 + _408;
    bool _412 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _414 = isnan(_402);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _430 = _402 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _440 = 1.0 / _426;
    bool _442 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _444 = 1.0 / _438;
    float _446 = 1.0 / _434;
    float _448 = _406 * _440;
    bool _450 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _452 = isnan(_402);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -_422;
    float _464 = _462 + 1.0;
    float _466 = _460 * _464;
    float _468 = _410 * _444;
    bool _470 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _472 = isnan(_402);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _482;
    bool _486 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _488 = isnan(_402);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _502 = -_460;
    float _504 = _502 + 1.0;
    float _506 = -_480;
    float _508 = _506 + 1.0;
    float _510 = _430 * _446;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _516;
    float _520 = _496 * _508;
    float _522 = fma(_484, _510, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _524 = fma(_514, _510, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _526 = fma(_518, _510, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _528 = _480 * _504;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _534 = _524 * _520;
    float _536 = _526 * _520;
    float _538 = _522 * _520;
    float _540 = -_496;
    float _542 = _540 + 1.0;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _548 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[107].x, _536);
    float _550 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[107].y, _534);
    float _552 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[107].z, _538);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _554;
    float _558 = fma(_500, _468, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _560 = fma(_546, _468, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _562 = fma(_532, _468, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _564;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _568;
    float _572 = fma(_558, _528, _548);
    float _574 = fma(_556, _448, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _576 = fma(_566, _448, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _578 = fma(_570, _448, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _580 = fma(_560, _528, _550);
    float _582 = fma(_562, _528, _552);
    float _584 = fma(_574, _466, _572);
    float _586 = fma(_576, _466, _580);
    float _588 = fma(_578, _466, _582);
    float _590 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[110].x, _584);
    float _592 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[110].y, _586);
    float _594 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[110].z, _588);
    bool _596 = !_442;
    float _614;
    if (!_596)
    {
        float _598 = in.m_39.x;
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _602 = _598 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        float _618 = float(_72);
        float _620 = 1.0 / _618;
        float _622 = _106 * _620;
        _614 = _622;
    }
    _616 = false;
    float _624 = _614;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _628 = _624 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _634 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _636 = isnan(_624);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _650 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _652 = isnan(_624);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _662;
    bool _666 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _668 = isnan(_624);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = 1.0 / _632;
    float _680 = -_644;
    float _682 = _680 + 1.0;
    bool _684 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _686 = _660 * _682;
    float _688 = -_660;
    float _690 = _688 + 1.0;
    float _692 = 1.0 / _648;
    float _694 = _664 * _678;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _700 = fma(_694, _628, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _702 = _698 * _692;
    float _704 = _700 * _686;
    float _706 = -_676;
    float _708 = _706 + 1.0;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _712 = _624 + _710;
    float _714 = _590 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _716 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[115].x, _704);
    float _718 = _644 * _708;
    float _720 = fma(_702, _712, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _722 = _594 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _724 = _714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _726 = fma(_720, _718, _716);
    float _728 = _592 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _730 = _722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _732 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[117].x, _726);
    float _734 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _736 = _732 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.x = _724;
    out.m_41.y = _734;
    out.m_41.z = _730;
    out.m_41.w = _736;
    bool _738 = !_684;
    float _756;
    if (!_738)
    {
        float _740 = in.m_39.x;
        float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _744 = _740 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[11].z, _106);
        float _748 = _746 * _742;
        float _750 = floor(_748);
        float _752 = -_750;
        float _754 = _748 + _752;
        _756 = _754;
        _758 = true;
    }
    else
    {
        float _760 = float(_72);
        float _762 = 1.0 / _760;
        float _764 = _106 * _762;
        _756 = _764;
    }
    _758 = false;
    float _766 = _756;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _770 = _766 + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _774 = _766 + _772;
    bool _776 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _778 = isnan(_766);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _794 = _766 + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _804 = 1.0 / _790;
    bool _806 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _808 = 1.0 / _802;
    float _810 = 1.0 / _798;
    float _812 = _770 * _804;
    bool _814 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _816 = isnan(_766);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = -_786;
    float _828 = _826 + 1.0;
    float _830 = _824 * _828;
    float _832 = _774 * _808;
    bool _834 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _836 = isnan(_766);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _846;
    bool _850 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _852 = isnan(_766);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _866 = -_824;
    float _868 = _866 + 1.0;
    float _870 = -_844;
    float _872 = _870 + 1.0;
    float _874 = _794 * _810;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _876;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _880;
    float _884 = _860 * _872;
    float _886 = fma(_848, _874, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _888 = fma(_878, _874, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _890 = fma(_882, _874, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _892 = _844 * _868;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _898 = _888 * _884;
    float _900 = _890 * _884;
    float _902 = _886 * _884;
    float _904 = -_860;
    float _906 = _904 + 1.0;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _912 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[123].x, _900);
    float _914 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[123].y, _898);
    float _916 = fma(_864, _832, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _918 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[123].z, _902);
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _920;
    float _924 = fma(_910, _832, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _926 = fma(_896, _832, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _928;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _932;
    float _936 = fma(_916, _892, _912);
    float _938 = fma(_922, _812, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _940 = fma(_930, _812, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _942 = fma(_934, _812, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _944 = fma(_924, _892, _914);
    float _946 = fma(_926, _892, _918);
    float _948 = fma(_938, _830, _936);
    float _950 = fma(_940, _830, _944);
    float _952 = fma(_942, _830, _946);
    float _954 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[126].x, _948);
    float _956 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[126].y, _950);
    float _958 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[126].z, _952);
    bool _960 = !_806;
    float _978;
    if (!_960)
    {
        float _962 = in.m_39.x;
        float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _966 = _962 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _968 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[11].w, _106);
        float _970 = _968 * _964;
        float _972 = floor(_970);
        float _974 = -_972;
        float _976 = _970 + _974;
        _978 = _976;
        _980 = true;
    }
    else
    {
        float _982 = float(_72);
        float _984 = 1.0 / _982;
        float _986 = _106 * _984;
        _978 = _986;
    }
    _980 = false;
    float _988 = _978;
    float _990 = in.m_39.y;
    float _992 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _994 = in.m_43.x;
    float _996 = in.m_43.y;
    float _998 = in.m_43.z;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1002 = _1000 != 0;
    float _1004 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1008 = _1006 != 0;
    float _1010 = in.m_45.y;
    float _1012 = _244 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1014 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1016 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1012);
    float _1018 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1016);
    bool _1020 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1022 = isnan(0.5);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1028 = _1024 || _1026;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    bool _1030 = _990 > 0.5;
    float _1032 = _244 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1034 = _244 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1036 = 1.0;
    if (_1002)
    {
        float _1038 = in.m_39.x;
        _1036 = _1038;
    }
    float _1040 = _1036;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _994);
    float _1044 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1032);
    float _1046 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1034);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1052 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _996);
    float _1054 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _998);
    float _1056 = _1014 * _1042;
    float _1058 = _992 * _1052;
    float _1060 = _1004 * _1054;
    float _1062 = -_1010;
    float _1064 = _1062 + 1.0;
    float _1066 = 1.0 / _1050;
    float _1068 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1074 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1046);
    float _1076 = _1010;
    float _1078 = _1060;
    if (_1008)
    {
        float _1080 = _1030 ? _1064 : _1010;
        _1076 = _1080;
    }
    float _1082 = _1076;
    float _1084 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1068);
    float _1086 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1044);
    float _1088 = 1.0 / _1072;
    float _1090 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1092 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1084);
    float _1094 = _1074 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1096;
    float _1100 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1106 = _1040 > 0.5;
    bool _1108 = _1106 && _1002;
    float _1110 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1090);
    float _1112 = _1094 + _1100;
    float _1114 = _1098 * _1066;
    float _1116 = _1086 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1118 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1110);
    float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1122 = _1112 + _1120;
    float _1124 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1126 = _1104 * _1088;
    float _1128 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1130 = _1122 * _1122;
    bool _1132 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1134 = isnan(_988);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    float _1144 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1146 = _1116 + _1128;
    float _1148 = in.m_45.x;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1152 = _988 + _1150;
    bool _1154 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1156 = isnan(_988);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1168 = _1146 + _1166;
    float _1170 = -_1142;
    float _1172 = _1170 + 1.0;
    float _1174 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1144);
    float _1176 = fma(_1114, _1152, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1178 = fma(_1168, _1168, _1130);
    bool _1180 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1182 = isnan(_988);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    float _1192 = _1164 * _1172;
    float _1194 = -_1164;
    float _1196 = _1194 + 1.0;
    float _1198 = sqrt(_1178);
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1202 = _988 + _1200;
    float _1204 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1174);
    float _1206 = _1190 * _1196;
    float _1208 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1210 = fma(_1126, _1202, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1214 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1216 = _1176 * _1206;
    float _1218 = -_1190;
    float _1220 = _1218 + 1.0;
    float _1222 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1208);
    float _1224 = 1.0 / _1212;
    float _1226 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1214);
    float _1228 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1216);
    float _1230 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1222);
    float _1232 = _1142;
    float _1234 = _1210;
    if (_1002)
    {
        _1078 = _1148;
    }
    float _1236 = _1078;
    float _1238 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1226);
    bool _1240 = _1198 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1242 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1246 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1248 = _1236;
    float _1250 = _1238;
    if (_1108)
    {
        float _1252 = -_1236;
        float _1254 = _1252 + 1.0;
        _1248 = _1254;
    }
    float _1256 = _1248;
    float _1258 = fma(_1210, _1192, _1228);
    float _1260 = _1124 + _1242;
    float _1262 = _1246 + _1212;
    float _1264 = _1262;
    if (!_1002)
    {
        _1250 = _1148;
    }
    float _1266 = _1250;
    float _1268 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1258);
    float _1270 = _1266;
    if (_1002)
    {
        _1270 = _1256;
    }
    float _1272 = _1270;
    float _1274 = _1262 * _1224;
    float _1276 = _1274 * 0.5;
    if (!_1240)
    {
        _1232 = _1146;
    }
    float _1278 = _1232;
    float _1280 = _1278;
    if (!_1240)
    {
        _1264 = _1112;
    }
    float _1282 = _1264;
    float _1284 = _1282;
    if (!_1240)
    {
        _1234 = _1260;
    }
    float _1286 = _1234;
    bool _1288 = !_1240;
    float _1290 = _1286;
    if (!_1288)
    {
        float _1292 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1294 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1296 = _1198 + _1294;
        float _1298 = _1260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1300 = rsqrt(_1178);
        float _1302 = _1296 * _1292;
        float _1304 = _1302 * 0.15915493667125701904296875;
        float _1306 = _1304 * 6.283185482025146484375;
        float _1308 = sin(_1306);
        float _1310 = _1304 * 6.283185482025146484375;
        float _1312 = cos(_1310);
        float _1314 = fma(_1308, _1298, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1316 = _1300 * _1314;
        float _1318 = _1312 + (-1.0);
        float _1320 = fma(_1168, _1316, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1322 = fma(_1122, _1316, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1324 = _1318 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1326 = fma(_1260, _1312, _1324);
        _1290 = _1326;
        _1280 = _1320;
        _1284 = _1322;
    }
    float _1328 = _1290;
    float _1330 = _1280;
    float _1332 = _1284;
    float _1334 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1336 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1338 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1340 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1342 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1334);
    float _1344 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1336);
    float _1346 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1338);
    float _1348 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1340);
    float _1350 = _1334;
    if (_1028)
    {
        _1350 = 1.0;
    }
    float _1352 = _1350;
    float _1354 = _1352;
    if (!_1028)
    {
        float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1358 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1356);
        float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1362 = _1360 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1364 = 1.0 / _1358;
        float _1366 = 1.0 / _1362;
        float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1372 = fma(_1364, _1368, _1370);
        float _1374 = _1372 * _1366;
        float _1376 = precise::clamp(_1374, 0.0, 1.0);
        _1354 = _1376;
    }
    float _1378 = _1354;
    float _1380 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1344);
    float _1382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1384 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1342);
    float _1386 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1346);
    float _1388 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1390 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1348);
    float _1392 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1394 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1398 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1400 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1402 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1404 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1396);
    float _1406 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1398);
    float _1408 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1400);
    float _1410 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1412 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1414 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1402);
    float _1416 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1404);
    float _1418 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1406);
    float _1420 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1422 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1408);
    float _1424 = _954 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1426 = _1410 * _1382;
    float _1428 = _1412 * _1244;
    float _1430 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1416);
    float _1432 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1418);
    float _1434 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1422);
    bool _1436 = _1378 > 0.0;
    bool _1438 = isnan(_1378);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan(0.0);
    bool _1444 = _1440 || _1442;
    float _1446 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1414);
    float _1448 = _956 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1450 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1452 = _958 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1454 = _1378 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1456 = _1430 + _1432;
    float _1458 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1446);
    float _1460 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1462 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1464 = _1268 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1466 = _1454 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1468 = _1456 * 0.5;
    out.m_49.x = _1428;
    out.m_49.y = _1426;
    out.m_51.x = _1450;
    out.m_51.y = _1460;
    out.m_51.z = _1462;
    out.m_51.w = _1464;
    out.m_33.x = _1466;
    out.gl_Position.x = _1434;
    out.gl_Position.y = _1458;
    out.gl_Position.z = _1430;
    out.gl_Position.w = _1432;
    out.m_53.z = _1468;
    out.m_53.w = _1432;
    if (_1444)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1470 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1470;
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
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _980 = false;
    bool _758 = false;
    bool _616 = false;
    bool _394 = false;
    bool _268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = in.m_30.w;
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
        out.m_33.x = 0.0;
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
        float _1527 = as_type<float>(_88);
        out.gl_Position.z = _1527;
    }
    if (!_76)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _92 = in.m_35.w;
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
        out.m_33.x = 0.0;
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
        float _1596 = as_type<float>(_124);
        out.gl_Position.z = _1596;
    }
    if (_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_37.w;
    float _128 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _130 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _132 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _134 = _130 || _132;
    bool _136 = isnan(1.0);
    bool _138 = _134 || _136;
    float _140 = in.m_35.x;
    float _142 = in.m_35.y;
    float _144 = in.m_35.z;
    float _146 = in.m_30.x;
    float _148 = in.m_30.y;
    float _150 = in.m_30.z;
    float _152 = 0.0;
    float _154 = _128;
    if (!_138)
    {
        float _156 = _128 * _128;
        float _158 = _156 * 0.5;
        _152 = _158;
    }
    float _160 = _152;
    float _162 = _160;
    if (!_138)
    {
        float _164 = _160 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _162 = _164;
    }
    float _166 = _162;
    bool _168 = !_138;
    float _170 = _166;
    if (!_168)
    {
        float _172 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _174 = log2(_172);
        float _176 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _178 = _176 + 1.0;
        float _180 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = _128 * _174;
        float _184 = 1.0 / _178;
        float _186 = _180 * 0.693147182464599609375;
        float _188 = exp2(_182);
        float _190 = 1.0 / _186;
        float _192 = _188 + (-1.0);
        float _194 = -_192;
        float _196 = fma(_194, _190, _128);
        float _198 = _196 * _184;
        float _200 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _200;
    }
    float _202 = _170;
    bool _204 = !_138;
    if (!_204)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = 1.0 / _212;
        float _216 = _128 * _208;
        float _218 = exp2(_216);
        float _220 = -_218;
        float _222 = _220 + 1.0;
        float _224 = _222 * _214;
        _154 = _224;
    }
    float _226 = _154;
    bool _228 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _230 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _232 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _234 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _236 = fma(_226, _140, _230);
    float _238 = fma(_226, _142, _232);
    float _240 = fma(_226, _144, _234);
    float _242 = fma(_236, _126, _146);
    float _244 = fma(_238, _126, _148);
    float _246 = fma(_240, _126, _150);
    bool _248 = !_228;
    float _266;
    if (!_248)
    {
        float _250 = in.m_39.x;
        float _252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _254 = _250 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[12].x, _106);
        float _258 = _256 * _252;
        float _260 = floor(_258);
        float _262 = -_260;
        float _264 = _258 + _262;
        _266 = _264;
        _268 = true;
    }
    else
    {
        float _270 = float(_72);
        float _272 = 1.0 / _270;
        float _274 = _106 * _272;
        _266 = _274;
    }
    _268 = false;
    float _276 = _266;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = _276 + _278;
    bool _282 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _284 = isnan(_276);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _294;
    float _298 = -_292;
    float _300 = _298 + 1.0;
    bool _302 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _304 = isnan(_276);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = 1.0 / _296;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _320;
    bool _324 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _326 = _280 * _314;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = in.m_37.x;
    float _334 = in.m_37.y;
    float _336 = in.m_37.z;
    float _338 = _312 * _300;
    float _340 = fma(_318, _326, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _342 = fma(_330, _326, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _344 = fma(_322, _326, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _346 = -_312;
    float _348 = _346 + 1.0;
    float _350 = _340 * _338;
    float _352 = _342 * _338;
    float _354 = _344 * _338;
    float _356 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _358 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _360 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].z, _354);
    float _362 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[144].x, _356);
    float _364 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[144].y, _358);
    float _366 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[144].z, _360);
    float _368 = _362 * _332;
    float _370 = _364 * _334;
    float _372 = _366 * _336;
    bool _374 = !_324;
    float _392;
    if (!_374)
    {
        float _376 = in.m_39.x;
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _380 = _376 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[11].x, _106);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        float _396 = float(_72);
        float _398 = 1.0 / _396;
        float _400 = _106 * _398;
        _392 = _400;
    }
    _394 = false;
    float _402 = _392;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _406 = _402 + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _410 = _402 + _408;
    bool _412 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _414 = isnan(_402);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _430 = _402 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _440 = 1.0 / _426;
    bool _442 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _444 = 1.0 / _438;
    float _446 = 1.0 / _434;
    float _448 = _406 * _440;
    bool _450 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _452 = isnan(_402);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -_422;
    float _464 = _462 + 1.0;
    float _466 = _460 * _464;
    float _468 = _410 * _444;
    bool _470 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _472 = isnan(_402);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _482;
    bool _486 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _488 = isnan(_402);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _502 = -_460;
    float _504 = _502 + 1.0;
    float _506 = -_480;
    float _508 = _506 + 1.0;
    float _510 = _430 * _446;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _516;
    float _520 = _496 * _508;
    float _522 = fma(_484, _510, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _524 = fma(_514, _510, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _526 = fma(_518, _510, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _528 = _480 * _504;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _534 = _524 * _520;
    float _536 = _526 * _520;
    float _538 = _522 * _520;
    float _540 = -_496;
    float _542 = _540 + 1.0;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _548 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[107].x, _536);
    float _550 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[107].y, _534);
    float _552 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[107].z, _538);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _554;
    float _558 = fma(_500, _468, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _560 = fma(_546, _468, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _562 = fma(_532, _468, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _564;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _568;
    float _572 = fma(_558, _528, _548);
    float _574 = fma(_556, _448, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _576 = fma(_566, _448, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _578 = fma(_570, _448, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _580 = fma(_560, _528, _550);
    float _582 = fma(_562, _528, _552);
    float _584 = fma(_574, _466, _572);
    float _586 = fma(_576, _466, _580);
    float _588 = fma(_578, _466, _582);
    float _590 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[110].x, _584);
    float _592 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[110].y, _586);
    float _594 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[110].z, _588);
    bool _596 = !_442;
    float _614;
    if (!_596)
    {
        float _598 = in.m_39.x;
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _602 = _598 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        float _618 = float(_72);
        float _620 = 1.0 / _618;
        float _622 = _106 * _620;
        _614 = _622;
    }
    _616 = false;
    float _624 = _614;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _628 = _624 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _634 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _636 = isnan(_624);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _650 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _652 = isnan(_624);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _662;
    bool _666 = _624 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _668 = isnan(_624);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = 1.0 / _632;
    float _680 = -_644;
    float _682 = _680 + 1.0;
    bool _684 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _686 = _660 * _682;
    float _688 = -_660;
    float _690 = _688 + 1.0;
    float _692 = 1.0 / _648;
    float _694 = _664 * _678;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _700 = fma(_694, _628, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _702 = _698 * _692;
    float _704 = _700 * _686;
    float _706 = -_676;
    float _708 = _706 + 1.0;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _712 = _624 + _710;
    float _714 = _590 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _716 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[115].x, _704);
    float _718 = _644 * _708;
    float _720 = fma(_702, _712, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _722 = _594 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _724 = _714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _726 = fma(_720, _718, _716);
    float _728 = _592 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _730 = _722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _732 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[117].x, _726);
    float _734 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _736 = _732 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.x = _724;
    out.m_41.y = _734;
    out.m_41.z = _730;
    out.m_41.w = _736;
    bool _738 = !_684;
    float _756;
    if (!_738)
    {
        float _740 = in.m_39.x;
        float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _744 = _740 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[11].z, _106);
        float _748 = _746 * _742;
        float _750 = floor(_748);
        float _752 = -_750;
        float _754 = _748 + _752;
        _756 = _754;
        _758 = true;
    }
    else
    {
        float _760 = float(_72);
        float _762 = 1.0 / _760;
        float _764 = _106 * _762;
        _756 = _764;
    }
    _758 = false;
    float _766 = _756;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _770 = _766 + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _774 = _766 + _772;
    bool _776 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _778 = isnan(_766);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _784 = _780 || _782;
    float _786 = float(_784);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _794 = _766 + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _804 = 1.0 / _790;
    bool _806 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _808 = 1.0 / _802;
    float _810 = 1.0 / _798;
    float _812 = _770 * _804;
    bool _814 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _816 = isnan(_766);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = -_786;
    float _828 = _826 + 1.0;
    float _830 = _824 * _828;
    float _832 = _774 * _808;
    bool _834 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _836 = isnan(_766);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _846;
    bool _850 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _852 = isnan(_766);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _866 = -_824;
    float _868 = _866 + 1.0;
    float _870 = -_844;
    float _872 = _870 + 1.0;
    float _874 = _794 * _810;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _876;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _880;
    float _884 = _860 * _872;
    float _886 = fma(_848, _874, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _888 = fma(_878, _874, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _890 = fma(_882, _874, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _892 = _844 * _868;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _898 = _888 * _884;
    float _900 = _890 * _884;
    float _902 = _886 * _884;
    float _904 = -_860;
    float _906 = _904 + 1.0;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _912 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[123].x, _900);
    float _914 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[123].y, _898);
    float _916 = fma(_864, _832, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _918 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[123].z, _902);
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _920;
    float _924 = fma(_910, _832, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _926 = fma(_896, _832, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _928;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _932;
    float _936 = fma(_916, _892, _912);
    float _938 = fma(_922, _812, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _940 = fma(_930, _812, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _942 = fma(_934, _812, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _944 = fma(_924, _892, _914);
    float _946 = fma(_926, _892, _918);
    float _948 = fma(_938, _830, _936);
    float _950 = fma(_940, _830, _944);
    float _952 = fma(_942, _830, _946);
    float _954 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[126].x, _948);
    float _956 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[126].y, _950);
    float _958 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[126].z, _952);
    bool _960 = !_806;
    float _978;
    if (!_960)
    {
        float _962 = in.m_39.x;
        float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _966 = _962 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _968 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[11].w, _106);
        float _970 = _968 * _964;
        float _972 = floor(_970);
        float _974 = -_972;
        float _976 = _970 + _974;
        _978 = _976;
        _980 = true;
    }
    else
    {
        float _982 = float(_72);
        float _984 = 1.0 / _982;
        float _986 = _106 * _984;
        _978 = _986;
    }
    _980 = false;
    float _988 = _978;
    float _990 = in.m_39.y;
    float _992 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _994 = in.m_43.x;
    float _996 = in.m_43.y;
    float _998 = in.m_43.z;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1002 = _1000 != 0;
    float _1004 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1008 = _1006 != 0;
    float _1010 = in.m_45.y;
    float _1012 = _244 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1014 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1016 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1012);
    float _1018 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1016);
    bool _1020 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1022 = isnan(0.5);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1028 = _1024 || _1026;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    bool _1030 = _990 > 0.5;
    float _1032 = _244 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1034 = _244 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1036 = 1.0;
    if (_1002)
    {
        float _1038 = in.m_39.x;
        _1036 = _1038;
    }
    float _1040 = _1036;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _994);
    float _1044 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1032);
    float _1046 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1034);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1052 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _996);
    float _1054 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _998);
    float _1056 = _1014 * _1042;
    float _1058 = _992 * _1052;
    float _1060 = _1004 * _1054;
    float _1062 = -_1010;
    float _1064 = _1062 + 1.0;
    float _1066 = 1.0 / _1050;
    float _1068 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1074 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1046);
    float _1076 = _1010;
    float _1078 = _1060;
    if (_1008)
    {
        float _1080 = _1030 ? _1064 : _1010;
        _1076 = _1080;
    }
    float _1082 = _1076;
    float _1084 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1068);
    float _1086 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1044);
    float _1088 = 1.0 / _1072;
    float _1090 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1092 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1084);
    float _1094 = _1074 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1096;
    float _1100 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1106 = _1040 > 0.5;
    bool _1108 = _1106 && _1002;
    float _1110 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1090);
    float _1112 = _1094 + _1100;
    float _1114 = _1098 * _1066;
    float _1116 = _1086 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1118 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1110);
    float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1122 = _1112 + _1120;
    float _1124 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1126 = _1104 * _1088;
    float _1128 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1130 = _1122 * _1122;
    bool _1132 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1134 = isnan(_988);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    float _1144 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1146 = _1116 + _1128;
    float _1148 = in.m_45.x;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1152 = _988 + _1150;
    bool _1154 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1156 = isnan(_988);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1168 = _1146 + _1166;
    float _1170 = -_1142;
    float _1172 = _1170 + 1.0;
    float _1174 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1144);
    float _1176 = fma(_1114, _1152, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1178 = fma(_1168, _1168, _1130);
    bool _1180 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1182 = isnan(_988);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    float _1192 = _1164 * _1172;
    float _1194 = -_1164;
    float _1196 = _1194 + 1.0;
    float _1198 = sqrt(_1178);
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1202 = _988 + _1200;
    float _1204 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1174);
    float _1206 = _1190 * _1196;
    float _1208 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1210 = fma(_1126, _1202, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1212 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1214 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1216 = _1176 * _1206;
    float _1218 = -_1190;
    float _1220 = _1218 + 1.0;
    float _1222 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1208);
    float _1224 = 1.0 / _1212;
    float _1226 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1214);
    float _1228 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1216);
    float _1230 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1222);
    float _1232 = _1142;
    float _1234 = _1210;
    if (_1002)
    {
        _1078 = _1148;
    }
    float _1236 = _1078;
    float _1238 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1226);
    bool _1240 = _1198 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1242 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1246 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1248 = _1236;
    float _1250 = _1238;
    if (_1108)
    {
        float _1252 = -_1236;
        float _1254 = _1252 + 1.0;
        _1248 = _1254;
    }
    float _1256 = _1248;
    float _1258 = fma(_1210, _1192, _1228);
    float _1260 = _1124 + _1242;
    float _1262 = _1246 + _1212;
    float _1264 = _1262;
    if (!_1002)
    {
        _1250 = _1148;
    }
    float _1266 = _1250;
    float _1268 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1258);
    float _1270 = _1266;
    if (_1002)
    {
        _1270 = _1256;
    }
    float _1272 = _1270;
    float _1274 = _1262 * _1224;
    float _1276 = _1274 * 0.5;
    if (!_1240)
    {
        _1232 = _1146;
    }
    float _1278 = _1232;
    float _1280 = _1278;
    if (!_1240)
    {
        _1264 = _1112;
    }
    float _1282 = _1264;
    float _1284 = _1282;
    if (!_1240)
    {
        _1234 = _1260;
    }
    float _1286 = _1234;
    bool _1288 = !_1240;
    float _1290 = _1286;
    if (!_1288)
    {
        float _1292 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1294 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1296 = _1198 + _1294;
        float _1298 = _1260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1300 = rsqrt(_1178);
        float _1302 = _1296 * _1292;
        float _1304 = _1302 * 0.15915493667125701904296875;
        float _1306 = _1304 * 6.283185482025146484375;
        float _1308 = sin(_1306);
        float _1310 = _1304 * 6.283185482025146484375;
        float _1312 = cos(_1310);
        float _1314 = fma(_1308, _1298, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1316 = _1300 * _1314;
        float _1318 = _1312 + (-1.0);
        float _1320 = fma(_1168, _1316, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1322 = fma(_1122, _1316, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1324 = _1318 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1326 = fma(_1260, _1312, _1324);
        _1290 = _1326;
        _1280 = _1320;
        _1284 = _1322;
    }
    float _1328 = _1290;
    float _1330 = _1280;
    float _1332 = _1284;
    float _1334 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1336 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1338 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1340 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1342 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1334);
    float _1344 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1336);
    float _1346 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1338);
    float _1348 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1340);
    float _1350 = _1334;
    if (_1028)
    {
        _1350 = 1.0;
    }
    float _1352 = _1350;
    float _1354 = _1352;
    if (!_1028)
    {
        float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1358 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1356);
        float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1362 = _1360 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1364 = 1.0 / _1358;
        float _1366 = 1.0 / _1362;
        float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1372 = fma(_1364, _1368, _1370);
        float _1374 = _1372 * _1366;
        float _1376 = precise::clamp(_1374, 0.0, 1.0);
        _1354 = _1376;
    }
    float _1378 = _1354;
    float _1380 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1344);
    float _1382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1384 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1342);
    float _1386 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1346);
    float _1388 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1390 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1348);
    float _1392 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1394 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1398 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1400 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1402 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1404 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1396);
    float _1406 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1398);
    float _1408 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1400);
    float _1410 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1412 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1414 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1402);
    float _1416 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1404);
    float _1418 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1406);
    float _1420 = _1390 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1422 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1408);
    float _1424 = _954 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1426 = _1410 * _1382;
    float _1428 = _1412 * _1244;
    float _1430 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1416);
    float _1432 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1418);
    float _1434 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1422);
    bool _1436 = _1378 > 0.0;
    bool _1438 = isnan(_1378);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan(0.0);
    bool _1444 = _1440 || _1442;
    float _1446 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1414);
    float _1448 = _956 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1450 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1452 = _958 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1454 = _1378 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1456 = _1430 + _1432;
    float _1458 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1446);
    float _1460 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1462 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1464 = _1268 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1466 = _1454 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1468 = _1456 * 0.5;
    out.m_49.x = _1428;
    out.m_49.y = _1426;
    out.m_51.x = _1450;
    out.m_51.y = _1460;
    out.m_51.z = _1462;
    out.m_51.w = _1464;
    out.m_33.x = _1466;
    out.gl_Position.x = _1434;
    out.gl_Position.y = _1458;
    out.gl_Position.z = _1430;
    out.gl_Position.w = _1432;
    out.m_53.z = _1468;
    out.m_53.w = _1432;
    if (_1444)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1470 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1470;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

