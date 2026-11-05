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
    float4 m_49 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_45 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_43 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _898 = false;
    bool _730 = false;
    bool _512 = false;
    bool _398 = false;
    bool _272 = false;
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
        float _1827 = as_type<float>(_90);
        out.gl_Position.z = _1827;
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
    float _110 = _108;
    if (_104)
    {
        float _112 = float(_74);
        _84 = _112;
    }
    float _114 = _84;
    bool _116 = _108 >= _114;
    bool _118 = !_104;
    bool _120 = _116 || _118;
    float _122 = _114;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_33.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _92 = as_type<int>(_126);
    }
    int _128 = _92;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1897 = as_type<float>(_128);
        out.gl_Position.z = _1897;
    }
    if (_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_37.w;
    float _132 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _134 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _136 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _138 = _134 || _136;
    bool _140 = isnan(1.0);
    bool _142 = _138 || _140;
    float _144 = in.m_35.x;
    float _146 = in.m_35.y;
    float _148 = in.m_35.z;
    float _150 = in.m_30.x;
    float _152 = in.m_30.y;
    float _154 = in.m_30.z;
    float _156 = 0.0;
    float _158 = _132;
    if (!_142)
    {
        float _160 = _132 * _132;
        float _162 = _160 * 0.5;
        _156 = _162;
    }
    float _164 = _156;
    float _166 = _164;
    if (!_142)
    {
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _168;
    }
    float _170 = _166;
    bool _172 = !_142;
    float _174 = _170;
    if (!_172)
    {
        float _176 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = log2(_176);
        float _180 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _182 = _180 + 1.0;
        float _184 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = _132 * _178;
        float _188 = 1.0 / _182;
        float _190 = _184 * 0.693147182464599609375;
        float _192 = exp2(_186);
        float _194 = 1.0 / _190;
        float _196 = _192 + (-1.0);
        float _198 = -_196;
        float _200 = fma(_198, _194, _132);
        float _202 = _200 * _188;
        float _204 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _204;
    }
    float _206 = _174;
    bool _208 = !_142;
    if (!_208)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = 1.0 / _216;
        float _220 = _132 * _212;
        float _222 = exp2(_220);
        float _224 = -_222;
        float _226 = _224 + 1.0;
        float _228 = _226 * _218;
        _158 = _228;
    }
    float _230 = _158;
    bool _232 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _234 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _236 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _238 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _240 = fma(_230, _144, _234);
    float _242 = fma(_230, _146, _236);
    float _244 = fma(_230, _148, _238);
    float _246 = fma(_240, _130, _150);
    float _248 = fma(_242, _130, _152);
    float _250 = fma(_244, _130, _154);
    bool _252 = !_232;
    float _270;
    if (!_252)
    {
        float _254 = in.m_39.x;
        float _256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _258 = _254 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _260 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[12].x, _108);
        float _262 = _260 * _256;
        float _264 = floor(_262);
        float _266 = -_264;
        float _268 = _262 + _266;
        _270 = _268;
        _272 = true;
    }
    else
    {
        float _274 = float(_74);
        float _276 = 1.0 / _274;
        float _278 = _108 * _276;
        _270 = _278;
    }
    _272 = false;
    float _280 = _270;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = _280 + _282;
    bool _286 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _288 = isnan(_280);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -_296;
    float _304 = _302 + 1.0;
    bool _306 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _308 = isnan(_280);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = 1.0 / _300;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _324;
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _330 = _316 * _304;
    float _332 = -_316;
    float _334 = _332 + 1.0;
    float _336 = _284 * _318;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _338;
    float _342 = in.m_37.x;
    float _344 = in.m_37.y;
    float _346 = in.m_37.z;
    float _348 = fma(_322, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _350 = fma(_340, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _352 = fma(_326, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _354 = _348 * _330;
    float _356 = _350 * _330;
    float _358 = _352 * _330;
    float _360 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _362 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].y, _356);
    float _364 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].z, _358);
    float _366 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[144].x, _360);
    float _368 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[144].y, _362);
    float _370 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[144].z, _364);
    float _372 = _366 * _342;
    float _374 = _368 * _344;
    float _376 = _370 * _346;
    bool _378 = !_328;
    float _396;
    if (!_378)
    {
        float _380 = in.m_39.x;
        float _382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _384 = _380 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _386 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[11].x, _108);
        float _388 = _386 * _382;
        float _390 = floor(_388);
        float _392 = -_390;
        float _394 = _388 + _392;
        _396 = _394;
        _398 = true;
    }
    else
    {
        float _400 = float(_74);
        float _402 = 1.0 / _400;
        float _404 = _108 * _402;
        _396 = _404;
    }
    _398 = false;
    float _406 = _396;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _410 = _406 + _408;
    bool _412 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _414 = isnan(_406);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _424;
    bool _428 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _430 = isnan(_406);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = -_422;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _444;
    float _448 = 1.0 / _426;
    bool _450 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _452 = _410 * _448;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _454;
    float _458 = _438 * _442;
    float _460 = fma(_446, _452, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _462 = -_438;
    float _464 = _462 + 1.0;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _466;
    float _470 = fma(_456, _452, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _472 = _460 * _458;
    float _474 = fma(_468, _452, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _476 = _470 * _458;
    float _478 = _474 * _458;
    float _480 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[107].x, _472);
    float _482 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[107].y, _478);
    float _484 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[107].z, _476);
    float _486 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[108].x, _480);
    float _488 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[108].y, _482);
    float _490 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[108].z, _484);
    bool _492 = !_450;
    float _510;
    if (!_492)
    {
        float _494 = in.m_39.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _510 = _508;
        _512 = true;
    }
    else
    {
        float _514 = float(_74);
        float _516 = 1.0 / _514;
        float _518 = _108 * _516;
        _510 = _518;
    }
    _512 = false;
    float _520 = _510;
    float _522 = _486 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _524 = _488 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _530;
    bool _534 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _536 = isnan(_520);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = 1.0 / _528;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _556 = -_544;
    float _558 = _556 + 1.0;
    bool _560 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _562 = isnan(_520);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = _490 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _574 = 1.0 / _550;
    bool _576 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = isnan(_520);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    bool _588 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _590 = _586 * _558;
    float _592 = -_586;
    float _594 = _592 + 1.0;
    float _596 = _532 * _546;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _600 = _520 + _598;
    float _602 = 1.0 / _554;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _608 = _570 * _594;
    float _610 = fma(_596, _600, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _616 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _618 = isnan(_520);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _628;
    float _632 = _606 * _574;
    float _634 = 1.0 / _614;
    float _636 = _610 * _608;
    float _638 = -_626;
    float _640 = _638 + 1.0;
    float _642 = -_570;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _650 = _544 * _640;
    bool _652 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _654 = isnan(_520);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _630 * _602;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _668 = _520 + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _672 = _520 + _670;
    float _674 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[115].x, _636);
    float _676 = -_662;
    float _678 = _676 + 1.0;
    float _680 = fma(_632, _668, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _682 = fma(_664, _672, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _686 = _520 + _684;
    float _688 = _648 * _634;
    float _690 = fma(_680, _590, _674);
    float _692 = _626 * _678;
    float _694 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = fma(_688, _686, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _698 = fma(_682, _650, _690);
    float _700 = fma(_696, _692, _698);
    float _702 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[119].x, _700);
    float _706 = _522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _704 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.x = _706;
    out.m_41.y = _694;
    out.m_41.z = _702;
    out.m_41.w = _708;
    bool _710 = !_588;
    float _728;
    if (!_710)
    {
        float _712 = in.m_39.x;
        float _714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _716 = _712 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[11].z, _108);
        float _720 = _718 * _714;
        float _722 = floor(_720);
        float _724 = -_722;
        float _726 = _720 + _724;
        _728 = _726;
        _730 = true;
    }
    else
    {
        float _732 = float(_74);
        float _734 = 1.0 / _732;
        float _736 = _108 * _734;
        _728 = _736;
    }
    _730 = false;
    float _738 = _728;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _742 = _738 + _740;
    bool _744 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _746 = isnan(_738);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _758 = _738 + _756;
    bool _760 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _762 = isnan(_738);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _772;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _780 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _782 = isnan(_738);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = -_754;
    float _794 = _792 + 1.0;
    float _796 = 1.0 / _774;
    float _798 = _790 * _794;
    float _800 = -_790;
    float _802 = _800 + 1.0;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _804;
    bool _808 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _810 = 1.0 / _778;
    float _812 = _770 * _802;
    float _814 = -_770;
    float _816 = _814 + 1.0;
    float _818 = _742 * _796;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _820;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _824;
    float _828 = fma(_806, _818, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _830 = fma(_822, _818, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _832 = fma(_826, _818, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _834 = _758 * _810;
    float _836 = _828 * _812;
    float _838 = _830 * _812;
    float _840 = _832 * _812;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _854 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[123].x, _836);
    float _856 = fma(_844, _834, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _858 = fma(_848, _834, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _860 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[123].y, _838);
    float _862 = fma(_852, _834, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _864 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[123].z, _840);
    float _866 = fma(_856, _798, _854);
    float _868 = fma(_858, _798, _860);
    float _870 = fma(_862, _798, _864);
    float _872 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[125].x, _866);
    float _874 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[125].y, _868);
    float _876 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[125].z, _870);
    bool _878 = !_808;
    float _896;
    if (!_878)
    {
        float _880 = in.m_39.x;
        float _882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _884 = _880 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[11].w, _108);
        float _888 = _886 * _882;
        float _890 = floor(_888);
        float _892 = -_890;
        float _894 = _888 + _892;
        _896 = _894;
        _898 = true;
    }
    else
    {
        float _900 = float(_74);
        float _902 = 1.0 / _900;
        float _904 = _108 * _902;
        _896 = _904;
    }
    _898 = false;
    float _906 = _896;
    float _908 = in.m_43.y;
    float _910 = _248 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _912 = in.m_39.z;
    float _914 = in.m_39.w;
    int _916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _918 = _916 != 0;
    float _920 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _924 = _922 != 0;
    float _926 = in.m_39.y;
    float _928 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _930 = in.m_45.x;
    float _932 = in.m_45.y;
    float _934 = in.m_45.z;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _938 = _936 != 0;
    float _940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _944 = _942 != 0;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    float _946 = in.m_43.x;
    float _948 = -_908;
    float _950 = _948 + 1.0;
    bool _952 = _912 > 0.5;
    float _954 = _248 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _956 = _914 > 0.5;
    float _958 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].x, _910);
    bool _960 = _926 > 0.5;
    float _962 = 0.0;
    float _964 = _908;
    bool _966 = _956;
    float _968 = _912;
    float _970 = _926;
    if (_944)
    {
        float _972 = in.m_39.z;
        _962 = _972;
    }
    float _974 = _962;
    int _976 = _952 ? as_type<int>(_950) : as_type<int>(_908);
    float _978 = _940 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _980 = _960 ? as_type<int>(_950) : as_type<int>(_908);
    float _982 = _918 ? as_type<float>(_976) : _908;
    float _984 = _924 ? as_type<float>(_980) : _908;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _988 = _986 != 0;
    float _990 = fma(_982, _978, -0.5);
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _994 = _992 != 0;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _998 = _996 != 0;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1004 = _248 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1006 = 1.0 / _1002;
    float _1008 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1004);
    float _1010 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].x, _954);
    float _1012 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _930);
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _932);
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _934);
    float _1018 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1008);
    float _1020 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].z, _958);
    float _1022 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1010);
    float _1024 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1026 = _920 * _1012;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1028;
    float _1032 = _1020 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1034 = _928 * _1016;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1038 = _906 + _1036;
    float _1040 = _1030 * _1006;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1044 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1046 = -_1032;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _1050 = _998;
    float _1052 = _1014;
    float _1054 = _1008;
    float _1056 = _1006;
    if (_998)
    {
        float _1058 = _956 ? _950 : _908;
        _964 = _1058;
    }
    float _1060 = _964;
    float _1062 = fma(_1040, _1038, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1064 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1042);
    float _1066 = _1022 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1068 = -_1044;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1072 = _1048 * _1048;
    float _1074 = in.m_39.x;
    float _1076 = -_1066;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1082 = fma(_1070, _1070, _1072);
    bool _1084 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1086 = isnan(_906);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1092 = _1088 || _1090;
    float _1094 = float(_1092);
    float _1096 = _1024 * _1014;
    int _1098 = as_type<int>(_1062);
    if (_944)
    {
        bool _1100 = _974 > 0.5;
        _1050 = _1100;
    }
    bool _1102 = _1050;
    float _1104 = fma(_1078, _1078, _1082);
    bool _1106 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1108 = isnan(_906);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = -_1094;
    float _1120 = _1118 + 1.0;
    int _1122 = as_type<int>(_1120);
    float _1124 = _1104;
    if (!_938)
    {
        _1052 = _946;
    }
    float _1126 = _1052;
    float _1128 = rsqrt(_1104);
    int _1130 = 0;
    float _1132 = _1126;
    if (_994)
    {
        float _1134 = -_946;
        float _1136 = _1134 + 1.0;
        _1130 = as_type<int>(_1136);
    }
    int _1138 = _1130;
    float _1140 = _1116 * _1120;
    float _1142 = _1140;
    if (_944)
    {
        float _1144 = -_946;
        float _1146 = _1144 + 1.0;
        _1122 = as_type<int>(_1146);
    }
    int _1148 = _1122;
    if (!_988)
    {
        _1054 = _926;
    }
    float _1150 = _1054;
    float _1152 = _1062 * _1140;
    float _1154 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1156 = _1080;
    float _1158 = _1150;
    if (_938)
    {
        float _1160 = -_946;
        float _1162 = _1160 + 1.0;
        _1098 = as_type<int>(_1162);
    }
    int _1164 = _1098;
    if (!_944)
    {
        _1156 = _946;
    }
    float _1166 = _1156;
    float _1168 = _1166;
    if (_944)
    {
        float _1170 = _1102 ? as_type<float>(_1148) : _946;
        _1168 = _1170;
    }
    float _1172 = _1168;
    float _1174 = fma(_1154, _1060, -0.5);
    if (_938)
    {
        bool _1176 = _1074 > 0.5;
        _966 = _1176;
    }
    bool _1178 = _966;
    if (!_994)
    {
        _1142 = _946;
    }
    float _1180 = _1142;
    float _1182 = _1070 * _1128;
    float _1184 = _1180;
    if (_938)
    {
        float _1186 = _1178 ? as_type<float>(_1164) : _946;
        _1132 = _1186;
    }
    float _1188 = _1132;
    float _1190 = _1078 * _1128;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1194 = _1182 * _1192;
    float _1196 = _1048 * _1128;
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1200 = _1190 * _1198;
    if (_994)
    {
        float _1202 = _960 ? as_type<float>(_1138) : _946;
        _1184 = _1202;
    }
    float _1204 = _1184;
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1208 = -_1194;
    float _1210 = fma(_1190, _1206, _1208);
    if (_988)
    {
        _1158 = _1074;
    }
    float _1212 = _1158;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1218 = -_1200;
    float _1220 = fma(_1196, _1216, _1218);
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1224 = _1196 * _1222;
    float _1226 = _1210 * _1210;
    float _1228 = -_1116;
    float _1230 = _1228 + 1.0;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1234 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1214);
    float _1236 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1240 = -_1224;
    float _1242 = fma(_1182, _1238, _1240);
    float _1244 = fma(_1220, _1220, _1226);
    if (!_988)
    {
        _1124 = _912;
    }
    float _1246 = _1124;
    float _1248 = -_1232;
    float _1250 = fma(_1236, 2.0, _1248);
    float _1252 = _1246;
    if (_988)
    {
        _1252 = _926;
    }
    float _1254 = _1252;
    float _1256 = fma(_1242, _1242, _1244);
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_988)
    {
        _1056 = _1074;
    }
    float _1260 = _1056;
    float _1262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1264 = _1260;
    if (!_988)
    {
        _1264 = _912;
    }
    float _1266 = _1264;
    float _1268 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1258);
    float _1270 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1152);
    if (_988)
    {
        _968 = _926;
    }
    float _1272 = _968;
    float _1274 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1276 = rsqrt(_1256);
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_988)
    {
        _970 = _1074;
    }
    float _1280 = _970;
    float _1282 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1234);
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1286 = -_1278;
    float _1288 = fma(_1274, 2.0, _1286);
    float _1290 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1270);
    float _1292 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1296 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1284);
    float _1298 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1302 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1304 = isnan(0.5);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1310 = _1306 || _1308;
    float _1312 = fma(_1298, _1172, -0.5);
    float _1314 = fma(_1292, -2.0, _1300);
    float _1316 = _1220 * _1276;
    float _1318 = _1210 * _1276;
    float _1320 = _1242 * _1276;
    float _1322 = -_108;
    float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1250);
    float _1326 = _1196 * _1316;
    float _1328 = _1190 * _1318;
    float _1330 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1314);
    float _1332 = fma(_1282, _1312, _1324);
    float _1334 = -_1326;
    float _1336 = fma(_1182, _1318, _1334);
    float _1338 = -_1328;
    float _1340 = fma(_1196, _1320, _1338);
    float _1342 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1344 = -_108;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1288);
    float _1348 = _1096 * _1336;
    float _1350 = _1096 * _1340;
    float _1352 = fma(_1342, _1204, -0.5);
    float _1354 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1296);
    float _1356 = fma(_1026, _1320, _1348);
    float _1358 = fma(_1026, _1316, _1350);
    float _1360 = _1182 * _1320;
    float _1362 = fma(_1354, _1352, _1346);
    float _1364 = fma(_1034, _1190, _1356);
    float _1366 = fma(_1034, _1182, _1358);
    float _1368 = -_1360;
    float _1370 = fma(_1190, _1316, _1368);
    float _1372 = _872 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1374 = _1066 + _1364;
    float _1376 = _1044 + _1366;
    float _1378 = _874 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1380 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1384 = _1374 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1388 = _1376 + _1386;
    float _1390 = _876 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1392 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1380);
    float _1394 = _1384 * _1384;
    float _1396 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1398 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1392);
    float _1400 = fma(_1388, _1388, _1394);
    float _1402 = _1096 * _1370;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1406 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1408 = sqrt(_1400);
    float _1410 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1412 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1396);
    float _1414 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1416 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1418 = fma(_1410, -2.0, _1404);
    float _1420 = fma(_1026, _1318, _1402);
    float _1422 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1412);
    float _1424 = 1.0 / _1406;
    float _1426 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = fma(_1034, _1196, _1420);
    float _1430 = _1422 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1432 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1434 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1064);
    float _1436 = _1032 + _1428;
    float _1438 = _1430 + _1406;
    bool _1440 = _1408 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1442 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1268);
    float _1444 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1418);
    out.m_49.x = _1414;
    out.m_49.y = _1416;
    out.m_49.z = _1426;
    out.m_49.w = _1432;
    bool _1446 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1448 = isnan(0.5);
    bool _1450 = _1446 || _1448;
    bool _1452 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1454 = _1450 || _1452;
    float _1456 = -_1330;
    float _1458 = fma(_1442, _1174, _1456);
    float _1460 = -_1444;
    float _1462 = fma(_1434, _990, _1460);
    float _1464 = _1426;
    float _1466 = _1374;
    float _1468 = _1416;
    float _1470 = _1432;
    if (!_1440)
    {
        _110 = _1376;
    }
    float _1472 = _110;
    float _1474 = _1438 * _1424;
    float _1476 = _1474 * 0.5;
    float _1478 = _1472;
    if (!_1440)
    {
        _1464 = _1436;
    }
    float _1480 = _1464;
    bool _1482 = !_1440;
    float _1484 = _1480;
    if (!_1482)
    {
        float _1486 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1490 = _1408 + _1488;
        float _1492 = _1436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1494 = rsqrt(_1400);
        float _1496 = _1490 * _1486;
        float _1498 = _1496 * 0.15915493667125701904296875;
        float _1500 = _1498 * 6.283185482025146484375;
        float _1502 = cos(_1500);
        float _1504 = _1498 * 6.283185482025146484375;
        float _1506 = sin(_1504);
        float _1508 = _1502 + (-1.0);
        float _1510 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1512 = fma(_1506, _1492, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1514 = fma(_1436, _1502, _1510);
        float _1516 = _1494 * _1512;
        float _1518 = fma(_1388, _1516, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1520 = fma(_1384, _1516, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1466 = _1520;
        _1478 = _1518;
        _1484 = _1514;
        _1468 = _1506;
        _1470 = _1510;
    }
    float _1522 = _1466;
    float _1524 = _1478;
    float _1526 = _1484;
    float _1528 = _1468;
    float _1530 = _1470;
    float _1532 = _1528;
    float _1534 = _1526;
    float _1536 = _1524;
    float _1538 = _1530;
    if (_1310)
    {
        _1532 = _1522;
    }
    float _1540 = _1532;
    float _1542 = _1540;
    if (!_1310)
    {
        float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1546 = _1032 + _1544;
        float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1550 = _1044 + _1548;
        float _1552 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1554 = -_1044;
        float _1556 = _1554 + _1524;
        float _1558 = _1546 * _1546;
        float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1562 = _1066 + _1560;
        float _1564 = -_1032;
        float _1566 = _1564 + _1526;
        float _1568 = fma(_1550, _1550, _1558);
        float _1570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1572 = fma(_1562, _1562, _1568);
        float _1574 = sqrt(_1572);
        float _1576 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1578 = precise::min(_1574, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1580 = _1578 * _1570;
        float _1582 = _1576 * _1580;
        float _1584 = -_1066;
        float _1586 = _1584 + _1522;
        float _1588 = fma(_1556, _1582, _1044);
        float _1590 = fma(_1566, _1582, _1032);
        float _1592 = fma(_1586, _1582, _1066);
        _1534 = _1590;
        _1536 = _1588;
        _1542 = _1592;
        _1538 = _1578;
    }
    float _1594 = _1534;
    float _1596 = _1536;
    float _1598 = _1542;
    float _1600 = _1538;
    float _1602 = _1600;
    if (_1454)
    {
        _1602 = 1.0;
    }
    float _1604 = _1602;
    float _1606 = _1604;
    if (!_1454)
    {
        float _1608 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1610 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1612 = _1608 * 0.15915493667125701904296875;
        float _1614 = _1610 * 0.15915493667125701904296875;
        float _1616 = _1612 * 6.283185482025146484375;
        float _1618 = cos(_1616);
        float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1622 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1620);
        float _1624 = _1612 * 6.283185482025146484375;
        float _1626 = sin(_1624);
        float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1630 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1628;
        float _1632 = 1.0 / _1618;
        float _1634 = _1614 * 6.283185482025146484375;
        float _1636 = cos(_1634);
        float _1638 = _1626 * _1632;
        float _1640 = _1614 * 6.283185482025146484375;
        float _1642 = sin(_1640);
        float _1644 = _1636 * _1638;
        float _1646 = 1.0 / _1622;
        float _1648 = 1.0 / _1644;
        float _1650 = 1.0 / _1630;
        float _1652 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1654 = _1646 * _1652;
        float _1656 = _1642 * _1648;
        float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1660 = fma(_1656, _1654, _1658);
        float _1662 = _1660 * _1650;
        float _1664 = precise::clamp(_1662, 0.0, 1.0);
        _1606 = _1664;
    }
    float _1666 = _1606;
    float _1668 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1670 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1672 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1674 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1676 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1668);
    float _1678 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1670);
    float _1680 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1672);
    float _1682 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1674);
    float _1684 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1676);
    float _1686 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1678);
    float _1688 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1680);
    float _1690 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1682);
    float _1692 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1694 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1696 = _1688 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1700 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1702 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1704 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1706 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1700);
    float _1710 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1702);
    float _1712 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1704);
    float _1714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1716 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1706);
    float _1718 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1720 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1708);
    float _1722 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1710);
    float _1724 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1712);
    float _1726 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1716);
    float _1728 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1730 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1720);
    float _1732 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1722);
    float _1734 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1724);
    float _1736 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1726);
    bool _1738 = _1666 > 0.0;
    bool _1740 = isnan(_1666);
    bool _1742 = _1738 || _1740;
    bool _1744 = isnan(0.0);
    bool _1746 = _1742 || _1744;
    float _1748 = _984 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1750 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1752 = _1734 + _1736;
    float _1754 = _1728 * _1698;
    float _1756 = _1748 * _1714;
    float _1758 = _1750 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1760 = _1362 + 0.5;
    float _1762 = _1332 + 0.5;
    float _1764 = _1458 + 0.5;
    float _1766 = _1462 + 0.5;
    float _1768 = _1752 * 0.5;
    out.m_33.x = _1758;
    out.m_51.x = _1754;
    out.m_51.y = _1756;
    out.m_51.z = _1762;
    out.m_51.w = _1764;
    out.m_53.x = _1760;
    out.m_53.y = _1766;
    out.gl_Position.x = _1730;
    out.gl_Position.y = _1732;
    out.gl_Position.z = _1734;
    out.gl_Position.w = _1736;
    out.m_55.z = _1768;
    out.m_55.w = _1736;
    if (_1746)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1770 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1770;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _898 = false;
    bool _730 = false;
    bool _512 = false;
    bool _398 = false;
    bool _272 = false;
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
        float _1827 = as_type<float>(_90);
        out.gl_Position.z = _1827;
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
    float _110 = _108;
    if (_104)
    {
        float _112 = float(_74);
        _84 = _112;
    }
    float _114 = _84;
    bool _116 = _108 >= _114;
    bool _118 = !_104;
    bool _120 = _116 || _118;
    float _122 = _114;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_33.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _92 = as_type<int>(_126);
    }
    int _128 = _92;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1897 = as_type<float>(_128);
        out.gl_Position.z = _1897;
    }
    if (_120)
    {
        return out;
    }
    float _130 = in.m_37.w;
    float _132 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _134 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _136 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _138 = _134 || _136;
    bool _140 = isnan(1.0);
    bool _142 = _138 || _140;
    float _144 = in.m_35.x;
    float _146 = in.m_35.y;
    float _148 = in.m_35.z;
    float _150 = in.m_30.x;
    float _152 = in.m_30.y;
    float _154 = in.m_30.z;
    float _156 = 0.0;
    float _158 = _132;
    if (!_142)
    {
        float _160 = _132 * _132;
        float _162 = _160 * 0.5;
        _156 = _162;
    }
    float _164 = _156;
    float _166 = _164;
    if (!_142)
    {
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _168;
    }
    float _170 = _166;
    bool _172 = !_142;
    float _174 = _170;
    if (!_172)
    {
        float _176 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = log2(_176);
        float _180 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _182 = _180 + 1.0;
        float _184 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = _132 * _178;
        float _188 = 1.0 / _182;
        float _190 = _184 * 0.693147182464599609375;
        float _192 = exp2(_186);
        float _194 = 1.0 / _190;
        float _196 = _192 + (-1.0);
        float _198 = -_196;
        float _200 = fma(_198, _194, _132);
        float _202 = _200 * _188;
        float _204 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _204;
    }
    float _206 = _174;
    bool _208 = !_142;
    if (!_208)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = 1.0 / _216;
        float _220 = _132 * _212;
        float _222 = exp2(_220);
        float _224 = -_222;
        float _226 = _224 + 1.0;
        float _228 = _226 * _218;
        _158 = _228;
    }
    float _230 = _158;
    bool _232 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _234 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _236 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _238 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _240 = fma(_230, _144, _234);
    float _242 = fma(_230, _146, _236);
    float _244 = fma(_230, _148, _238);
    float _246 = fma(_240, _130, _150);
    float _248 = fma(_242, _130, _152);
    float _250 = fma(_244, _130, _154);
    bool _252 = !_232;
    float _270;
    if (!_252)
    {
        float _254 = in.m_39.x;
        float _256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _258 = _254 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _260 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[12].x, _108);
        float _262 = _260 * _256;
        float _264 = floor(_262);
        float _266 = -_264;
        float _268 = _262 + _266;
        _270 = _268;
        _272 = true;
    }
    else
    {
        float _274 = float(_74);
        float _276 = 1.0 / _274;
        float _278 = _108 * _276;
        _270 = _278;
    }
    _272 = false;
    float _280 = _270;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = _280 + _282;
    bool _286 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _288 = isnan(_280);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -_296;
    float _304 = _302 + 1.0;
    bool _306 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _308 = isnan(_280);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = 1.0 / _300;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _324;
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _330 = _316 * _304;
    float _332 = -_316;
    float _334 = _332 + 1.0;
    float _336 = _284 * _318;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _338;
    float _342 = in.m_37.x;
    float _344 = in.m_37.y;
    float _346 = in.m_37.z;
    float _348 = fma(_322, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _350 = fma(_340, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _352 = fma(_326, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _354 = _348 * _330;
    float _356 = _350 * _330;
    float _358 = _352 * _330;
    float _360 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _362 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].y, _356);
    float _364 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].z, _358);
    float _366 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[144].x, _360);
    float _368 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[144].y, _362);
    float _370 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[144].z, _364);
    float _372 = _366 * _342;
    float _374 = _368 * _344;
    float _376 = _370 * _346;
    bool _378 = !_328;
    float _396;
    if (!_378)
    {
        float _380 = in.m_39.x;
        float _382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _384 = _380 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _386 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[11].x, _108);
        float _388 = _386 * _382;
        float _390 = floor(_388);
        float _392 = -_390;
        float _394 = _388 + _392;
        _396 = _394;
        _398 = true;
    }
    else
    {
        float _400 = float(_74);
        float _402 = 1.0 / _400;
        float _404 = _108 * _402;
        _396 = _404;
    }
    _398 = false;
    float _406 = _396;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _410 = _406 + _408;
    bool _412 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _414 = isnan(_406);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _424;
    bool _428 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _430 = isnan(_406);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = -_422;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _444;
    float _448 = 1.0 / _426;
    bool _450 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _452 = _410 * _448;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _454;
    float _458 = _438 * _442;
    float _460 = fma(_446, _452, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _462 = -_438;
    float _464 = _462 + 1.0;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _466;
    float _470 = fma(_456, _452, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _472 = _460 * _458;
    float _474 = fma(_468, _452, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _476 = _470 * _458;
    float _478 = _474 * _458;
    float _480 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[107].x, _472);
    float _482 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[107].y, _478);
    float _484 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[107].z, _476);
    float _486 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[108].x, _480);
    float _488 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[108].y, _482);
    float _490 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[108].z, _484);
    bool _492 = !_450;
    float _510;
    if (!_492)
    {
        float _494 = in.m_39.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _510 = _508;
        _512 = true;
    }
    else
    {
        float _514 = float(_74);
        float _516 = 1.0 / _514;
        float _518 = _108 * _516;
        _510 = _518;
    }
    _512 = false;
    float _520 = _510;
    float _522 = _486 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _524 = _488 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _530;
    bool _534 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _536 = isnan(_520);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = 1.0 / _528;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _556 = -_544;
    float _558 = _556 + 1.0;
    bool _560 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _562 = isnan(_520);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = _490 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _574 = 1.0 / _550;
    bool _576 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = isnan(_520);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    bool _588 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _590 = _586 * _558;
    float _592 = -_586;
    float _594 = _592 + 1.0;
    float _596 = _532 * _546;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _600 = _520 + _598;
    float _602 = 1.0 / _554;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _608 = _570 * _594;
    float _610 = fma(_596, _600, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _616 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _618 = isnan(_520);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _628;
    float _632 = _606 * _574;
    float _634 = 1.0 / _614;
    float _636 = _610 * _608;
    float _638 = -_626;
    float _640 = _638 + 1.0;
    float _642 = -_570;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _650 = _544 * _640;
    bool _652 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _654 = isnan(_520);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _630 * _602;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _668 = _520 + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _672 = _520 + _670;
    float _674 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[115].x, _636);
    float _676 = -_662;
    float _678 = _676 + 1.0;
    float _680 = fma(_632, _668, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _682 = fma(_664, _672, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _686 = _520 + _684;
    float _688 = _648 * _634;
    float _690 = fma(_680, _590, _674);
    float _692 = _626 * _678;
    float _694 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = fma(_688, _686, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _698 = fma(_682, _650, _690);
    float _700 = fma(_696, _692, _698);
    float _702 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[119].x, _700);
    float _706 = _522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _704 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.x = _706;
    out.m_41.y = _694;
    out.m_41.z = _702;
    out.m_41.w = _708;
    bool _710 = !_588;
    float _728;
    if (!_710)
    {
        float _712 = in.m_39.x;
        float _714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _716 = _712 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[11].z, _108);
        float _720 = _718 * _714;
        float _722 = floor(_720);
        float _724 = -_722;
        float _726 = _720 + _724;
        _728 = _726;
        _730 = true;
    }
    else
    {
        float _732 = float(_74);
        float _734 = 1.0 / _732;
        float _736 = _108 * _734;
        _728 = _736;
    }
    _730 = false;
    float _738 = _728;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _742 = _738 + _740;
    bool _744 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _746 = isnan(_738);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _758 = _738 + _756;
    bool _760 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _762 = isnan(_738);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _772;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _780 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _782 = isnan(_738);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = -_754;
    float _794 = _792 + 1.0;
    float _796 = 1.0 / _774;
    float _798 = _790 * _794;
    float _800 = -_790;
    float _802 = _800 + 1.0;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _804;
    bool _808 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _810 = 1.0 / _778;
    float _812 = _770 * _802;
    float _814 = -_770;
    float _816 = _814 + 1.0;
    float _818 = _742 * _796;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _820;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _824;
    float _828 = fma(_806, _818, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _830 = fma(_822, _818, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _832 = fma(_826, _818, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _834 = _758 * _810;
    float _836 = _828 * _812;
    float _838 = _830 * _812;
    float _840 = _832 * _812;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _854 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[123].x, _836);
    float _856 = fma(_844, _834, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _858 = fma(_848, _834, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _860 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[123].y, _838);
    float _862 = fma(_852, _834, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _864 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[123].z, _840);
    float _866 = fma(_856, _798, _854);
    float _868 = fma(_858, _798, _860);
    float _870 = fma(_862, _798, _864);
    float _872 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[125].x, _866);
    float _874 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[125].y, _868);
    float _876 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[125].z, _870);
    bool _878 = !_808;
    float _896;
    if (!_878)
    {
        float _880 = in.m_39.x;
        float _882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _884 = _880 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[11].w, _108);
        float _888 = _886 * _882;
        float _890 = floor(_888);
        float _892 = -_890;
        float _894 = _888 + _892;
        _896 = _894;
        _898 = true;
    }
    else
    {
        float _900 = float(_74);
        float _902 = 1.0 / _900;
        float _904 = _108 * _902;
        _896 = _904;
    }
    _898 = false;
    float _906 = _896;
    float _908 = in.m_43.y;
    float _910 = _248 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _912 = in.m_39.z;
    float _914 = in.m_39.w;
    int _916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _918 = _916 != 0;
    float _920 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _924 = _922 != 0;
    float _926 = in.m_39.y;
    float _928 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _930 = in.m_45.x;
    float _932 = in.m_45.y;
    float _934 = in.m_45.z;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _938 = _936 != 0;
    float _940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _944 = _942 != 0;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    float _946 = in.m_43.x;
    float _948 = -_908;
    float _950 = _948 + 1.0;
    bool _952 = _912 > 0.5;
    float _954 = _248 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _956 = _914 > 0.5;
    float _958 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].x, _910);
    bool _960 = _926 > 0.5;
    float _962 = 0.0;
    float _964 = _908;
    bool _966 = _956;
    float _968 = _912;
    float _970 = _926;
    if (_944)
    {
        float _972 = in.m_39.z;
        _962 = _972;
    }
    float _974 = _962;
    int _976 = _952 ? as_type<int>(_950) : as_type<int>(_908);
    float _978 = _940 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _980 = _960 ? as_type<int>(_950) : as_type<int>(_908);
    float _982 = _918 ? as_type<float>(_976) : _908;
    float _984 = _924 ? as_type<float>(_980) : _908;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _988 = _986 != 0;
    float _990 = fma(_982, _978, -0.5);
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _994 = _992 != 0;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _998 = _996 != 0;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1004 = _248 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1006 = 1.0 / _1002;
    float _1008 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1004);
    float _1010 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].x, _954);
    float _1012 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _930);
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _932);
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _934);
    float _1018 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1008);
    float _1020 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].z, _958);
    float _1022 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1010);
    float _1024 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1026 = _920 * _1012;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1028;
    float _1032 = _1020 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1034 = _928 * _1016;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1038 = _906 + _1036;
    float _1040 = _1030 * _1006;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1044 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1046 = -_1032;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _1050 = _998;
    float _1052 = _1014;
    float _1054 = _1008;
    float _1056 = _1006;
    if (_998)
    {
        float _1058 = _956 ? _950 : _908;
        _964 = _1058;
    }
    float _1060 = _964;
    float _1062 = fma(_1040, _1038, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1064 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1042);
    float _1066 = _1022 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1068 = -_1044;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1072 = _1048 * _1048;
    float _1074 = in.m_39.x;
    float _1076 = -_1066;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1082 = fma(_1070, _1070, _1072);
    bool _1084 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1086 = isnan(_906);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1092 = _1088 || _1090;
    float _1094 = float(_1092);
    float _1096 = _1024 * _1014;
    int _1098 = as_type<int>(_1062);
    if (_944)
    {
        bool _1100 = _974 > 0.5;
        _1050 = _1100;
    }
    bool _1102 = _1050;
    float _1104 = fma(_1078, _1078, _1082);
    bool _1106 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1108 = isnan(_906);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = -_1094;
    float _1120 = _1118 + 1.0;
    int _1122 = as_type<int>(_1120);
    float _1124 = _1104;
    if (!_938)
    {
        _1052 = _946;
    }
    float _1126 = _1052;
    float _1128 = rsqrt(_1104);
    int _1130 = 0;
    float _1132 = _1126;
    if (_994)
    {
        float _1134 = -_946;
        float _1136 = _1134 + 1.0;
        _1130 = as_type<int>(_1136);
    }
    int _1138 = _1130;
    float _1140 = _1116 * _1120;
    float _1142 = _1140;
    if (_944)
    {
        float _1144 = -_946;
        float _1146 = _1144 + 1.0;
        _1122 = as_type<int>(_1146);
    }
    int _1148 = _1122;
    if (!_988)
    {
        _1054 = _926;
    }
    float _1150 = _1054;
    float _1152 = _1062 * _1140;
    float _1154 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1156 = _1080;
    float _1158 = _1150;
    if (_938)
    {
        float _1160 = -_946;
        float _1162 = _1160 + 1.0;
        _1098 = as_type<int>(_1162);
    }
    int _1164 = _1098;
    if (!_944)
    {
        _1156 = _946;
    }
    float _1166 = _1156;
    float _1168 = _1166;
    if (_944)
    {
        float _1170 = _1102 ? as_type<float>(_1148) : _946;
        _1168 = _1170;
    }
    float _1172 = _1168;
    float _1174 = fma(_1154, _1060, -0.5);
    if (_938)
    {
        bool _1176 = _1074 > 0.5;
        _966 = _1176;
    }
    bool _1178 = _966;
    if (!_994)
    {
        _1142 = _946;
    }
    float _1180 = _1142;
    float _1182 = _1070 * _1128;
    float _1184 = _1180;
    if (_938)
    {
        float _1186 = _1178 ? as_type<float>(_1164) : _946;
        _1132 = _1186;
    }
    float _1188 = _1132;
    float _1190 = _1078 * _1128;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1194 = _1182 * _1192;
    float _1196 = _1048 * _1128;
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1200 = _1190 * _1198;
    if (_994)
    {
        float _1202 = _960 ? as_type<float>(_1138) : _946;
        _1184 = _1202;
    }
    float _1204 = _1184;
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1208 = -_1194;
    float _1210 = fma(_1190, _1206, _1208);
    if (_988)
    {
        _1158 = _1074;
    }
    float _1212 = _1158;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1218 = -_1200;
    float _1220 = fma(_1196, _1216, _1218);
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1224 = _1196 * _1222;
    float _1226 = _1210 * _1210;
    float _1228 = -_1116;
    float _1230 = _1228 + 1.0;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1234 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1214);
    float _1236 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1240 = -_1224;
    float _1242 = fma(_1182, _1238, _1240);
    float _1244 = fma(_1220, _1220, _1226);
    if (!_988)
    {
        _1124 = _912;
    }
    float _1246 = _1124;
    float _1248 = -_1232;
    float _1250 = fma(_1236, 2.0, _1248);
    float _1252 = _1246;
    if (_988)
    {
        _1252 = _926;
    }
    float _1254 = _1252;
    float _1256 = fma(_1242, _1242, _1244);
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_988)
    {
        _1056 = _1074;
    }
    float _1260 = _1056;
    float _1262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1264 = _1260;
    if (!_988)
    {
        _1264 = _912;
    }
    float _1266 = _1264;
    float _1268 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1258);
    float _1270 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1152);
    if (_988)
    {
        _968 = _926;
    }
    float _1272 = _968;
    float _1274 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1276 = rsqrt(_1256);
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_988)
    {
        _970 = _1074;
    }
    float _1280 = _970;
    float _1282 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1234);
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1286 = -_1278;
    float _1288 = fma(_1274, 2.0, _1286);
    float _1290 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1270);
    float _1292 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1296 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1284);
    float _1298 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1302 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1304 = isnan(0.5);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1310 = _1306 || _1308;
    float _1312 = fma(_1298, _1172, -0.5);
    float _1314 = fma(_1292, -2.0, _1300);
    float _1316 = _1220 * _1276;
    float _1318 = _1210 * _1276;
    float _1320 = _1242 * _1276;
    float _1322 = -_108;
    float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1250);
    float _1326 = _1196 * _1316;
    float _1328 = _1190 * _1318;
    float _1330 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1314);
    float _1332 = fma(_1282, _1312, _1324);
    float _1334 = -_1326;
    float _1336 = fma(_1182, _1318, _1334);
    float _1338 = -_1328;
    float _1340 = fma(_1196, _1320, _1338);
    float _1342 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1344 = -_108;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1288);
    float _1348 = _1096 * _1336;
    float _1350 = _1096 * _1340;
    float _1352 = fma(_1342, _1204, -0.5);
    float _1354 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1296);
    float _1356 = fma(_1026, _1320, _1348);
    float _1358 = fma(_1026, _1316, _1350);
    float _1360 = _1182 * _1320;
    float _1362 = fma(_1354, _1352, _1346);
    float _1364 = fma(_1034, _1190, _1356);
    float _1366 = fma(_1034, _1182, _1358);
    float _1368 = -_1360;
    float _1370 = fma(_1190, _1316, _1368);
    float _1372 = _872 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1374 = _1066 + _1364;
    float _1376 = _1044 + _1366;
    float _1378 = _874 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1380 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1384 = _1374 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1388 = _1376 + _1386;
    float _1390 = _876 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1392 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1380);
    float _1394 = _1384 * _1384;
    float _1396 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1398 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1392);
    float _1400 = fma(_1388, _1388, _1394);
    float _1402 = _1096 * _1370;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1406 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1408 = sqrt(_1400);
    float _1410 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1412 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1396);
    float _1414 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1416 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1418 = fma(_1410, -2.0, _1404);
    float _1420 = fma(_1026, _1318, _1402);
    float _1422 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1412);
    float _1424 = 1.0 / _1406;
    float _1426 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = fma(_1034, _1196, _1420);
    float _1430 = _1422 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1432 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1434 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1064);
    float _1436 = _1032 + _1428;
    float _1438 = _1430 + _1406;
    bool _1440 = _1408 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1442 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1268);
    float _1444 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1418);
    out.m_49.x = _1414;
    out.m_49.y = _1416;
    out.m_49.z = _1426;
    out.m_49.w = _1432;
    bool _1446 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1448 = isnan(0.5);
    bool _1450 = _1446 || _1448;
    bool _1452 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1454 = _1450 || _1452;
    float _1456 = -_1330;
    float _1458 = fma(_1442, _1174, _1456);
    float _1460 = -_1444;
    float _1462 = fma(_1434, _990, _1460);
    float _1464 = _1426;
    float _1466 = _1374;
    float _1468 = _1416;
    float _1470 = _1432;
    if (!_1440)
    {
        _110 = _1376;
    }
    float _1472 = _110;
    float _1474 = _1438 * _1424;
    float _1476 = _1474 * 0.5;
    float _1478 = _1472;
    if (!_1440)
    {
        _1464 = _1436;
    }
    float _1480 = _1464;
    bool _1482 = !_1440;
    float _1484 = _1480;
    if (!_1482)
    {
        float _1486 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1490 = _1408 + _1488;
        float _1492 = _1436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1494 = rsqrt(_1400);
        float _1496 = _1490 * _1486;
        float _1498 = _1496 * 0.15915493667125701904296875;
        float _1500 = _1498 * 6.283185482025146484375;
        float _1502 = cos(_1500);
        float _1504 = _1498 * 6.283185482025146484375;
        float _1506 = sin(_1504);
        float _1508 = _1502 + (-1.0);
        float _1510 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1512 = fma(_1506, _1492, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1514 = fma(_1436, _1502, _1510);
        float _1516 = _1494 * _1512;
        float _1518 = fma(_1388, _1516, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1520 = fma(_1384, _1516, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1466 = _1520;
        _1478 = _1518;
        _1484 = _1514;
        _1468 = _1506;
        _1470 = _1510;
    }
    float _1522 = _1466;
    float _1524 = _1478;
    float _1526 = _1484;
    float _1528 = _1468;
    float _1530 = _1470;
    float _1532 = _1528;
    float _1534 = _1526;
    float _1536 = _1524;
    float _1538 = _1530;
    if (_1310)
    {
        _1532 = _1522;
    }
    float _1540 = _1532;
    float _1542 = _1540;
    if (!_1310)
    {
        float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1546 = _1032 + _1544;
        float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1550 = _1044 + _1548;
        float _1552 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1554 = -_1044;
        float _1556 = _1554 + _1524;
        float _1558 = _1546 * _1546;
        float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1562 = _1066 + _1560;
        float _1564 = -_1032;
        float _1566 = _1564 + _1526;
        float _1568 = fma(_1550, _1550, _1558);
        float _1570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1572 = fma(_1562, _1562, _1568);
        float _1574 = sqrt(_1572);
        float _1576 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1578 = precise::min(_1574, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1580 = _1578 * _1570;
        float _1582 = _1576 * _1580;
        float _1584 = -_1066;
        float _1586 = _1584 + _1522;
        float _1588 = fma(_1556, _1582, _1044);
        float _1590 = fma(_1566, _1582, _1032);
        float _1592 = fma(_1586, _1582, _1066);
        _1534 = _1590;
        _1536 = _1588;
        _1542 = _1592;
        _1538 = _1578;
    }
    float _1594 = _1534;
    float _1596 = _1536;
    float _1598 = _1542;
    float _1600 = _1538;
    float _1602 = _1600;
    if (_1454)
    {
        _1602 = 1.0;
    }
    float _1604 = _1602;
    float _1606 = _1604;
    if (!_1454)
    {
        float _1608 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1610 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1612 = _1608 * 0.15915493667125701904296875;
        float _1614 = _1610 * 0.15915493667125701904296875;
        float _1616 = _1612 * 6.283185482025146484375;
        float _1618 = cos(_1616);
        float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1622 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1620);
        float _1624 = _1612 * 6.283185482025146484375;
        float _1626 = sin(_1624);
        float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1630 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1628;
        float _1632 = 1.0 / _1618;
        float _1634 = _1614 * 6.283185482025146484375;
        float _1636 = cos(_1634);
        float _1638 = _1626 * _1632;
        float _1640 = _1614 * 6.283185482025146484375;
        float _1642 = sin(_1640);
        float _1644 = _1636 * _1638;
        float _1646 = 1.0 / _1622;
        float _1648 = 1.0 / _1644;
        float _1650 = 1.0 / _1630;
        float _1652 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1654 = _1646 * _1652;
        float _1656 = _1642 * _1648;
        float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1660 = fma(_1656, _1654, _1658);
        float _1662 = _1660 * _1650;
        float _1664 = precise::clamp(_1662, 0.0, 1.0);
        _1606 = _1664;
    }
    float _1666 = _1606;
    float _1668 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1670 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1672 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1674 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1676 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1668);
    float _1678 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1670);
    float _1680 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1672);
    float _1682 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1674);
    float _1684 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1676);
    float _1686 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1678);
    float _1688 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1680);
    float _1690 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1682);
    float _1692 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1694 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1696 = _1688 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1700 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1702 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1704 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1706 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1700);
    float _1710 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1702);
    float _1712 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1704);
    float _1714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1716 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1706);
    float _1718 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1720 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1708);
    float _1722 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1710);
    float _1724 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1712);
    float _1726 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1716);
    float _1728 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1730 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1720);
    float _1732 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1722);
    float _1734 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1724);
    float _1736 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1726);
    bool _1738 = _1666 > 0.0;
    bool _1740 = isnan(_1666);
    bool _1742 = _1738 || _1740;
    bool _1744 = isnan(0.0);
    bool _1746 = _1742 || _1744;
    float _1748 = _984 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1750 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1752 = _1734 + _1736;
    float _1754 = _1728 * _1698;
    float _1756 = _1748 * _1714;
    float _1758 = _1750 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1760 = _1362 + 0.5;
    float _1762 = _1332 + 0.5;
    float _1764 = _1458 + 0.5;
    float _1766 = _1462 + 0.5;
    float _1768 = _1752 * 0.5;
    out.m_33.x = _1758;
    out.m_51.x = _1754;
    out.m_51.y = _1756;
    out.m_51.z = _1762;
    out.m_51.w = _1764;
    out.m_53.x = _1760;
    out.m_53.y = _1766;
    out.gl_Position.x = _1730;
    out.gl_Position.y = _1732;
    out.gl_Position.z = _1734;
    out.gl_Position.w = _1736;
    out.m_55.z = _1768;
    out.m_55.w = _1736;
    if (_1746)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1770 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1770;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _898 = false;
    bool _730 = false;
    bool _512 = false;
    bool _398 = false;
    bool _272 = false;
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
        float _1827 = as_type<float>(_90);
        out.gl_Position.z = _1827;
    }
    if (!_78)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _94 = in.m_35.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _110 = _108;
    if (_104)
    {
        float _112 = float(_74);
        _84 = _112;
    }
    float _114 = _84;
    bool _116 = _108 >= _114;
    bool _118 = !_104;
    bool _120 = _116 || _118;
    float _122 = _114;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_33.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _92 = as_type<int>(_126);
    }
    int _128 = _92;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1897 = as_type<float>(_128);
        out.gl_Position.z = _1897;
    }
    if (_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_37.w;
    float _132 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _134 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _136 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _138 = _134 || _136;
    bool _140 = isnan(1.0);
    bool _142 = _138 || _140;
    float _144 = in.m_35.x;
    float _146 = in.m_35.y;
    float _148 = in.m_35.z;
    float _150 = in.m_30.x;
    float _152 = in.m_30.y;
    float _154 = in.m_30.z;
    float _156 = 0.0;
    float _158 = _132;
    if (!_142)
    {
        float _160 = _132 * _132;
        float _162 = _160 * 0.5;
        _156 = _162;
    }
    float _164 = _156;
    float _166 = _164;
    if (!_142)
    {
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _168;
    }
    float _170 = _166;
    bool _172 = !_142;
    float _174 = _170;
    if (!_172)
    {
        float _176 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = log2(_176);
        float _180 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _182 = _180 + 1.0;
        float _184 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = _132 * _178;
        float _188 = 1.0 / _182;
        float _190 = _184 * 0.693147182464599609375;
        float _192 = exp2(_186);
        float _194 = 1.0 / _190;
        float _196 = _192 + (-1.0);
        float _198 = -_196;
        float _200 = fma(_198, _194, _132);
        float _202 = _200 * _188;
        float _204 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _204;
    }
    float _206 = _174;
    bool _208 = !_142;
    if (!_208)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = 1.0 / _216;
        float _220 = _132 * _212;
        float _222 = exp2(_220);
        float _224 = -_222;
        float _226 = _224 + 1.0;
        float _228 = _226 * _218;
        _158 = _228;
    }
    float _230 = _158;
    bool _232 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _234 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _236 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _238 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _240 = fma(_230, _144, _234);
    float _242 = fma(_230, _146, _236);
    float _244 = fma(_230, _148, _238);
    float _246 = fma(_240, _130, _150);
    float _248 = fma(_242, _130, _152);
    float _250 = fma(_244, _130, _154);
    bool _252 = !_232;
    float _270;
    if (!_252)
    {
        float _254 = in.m_39.x;
        float _256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _258 = _254 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _260 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[12].x, _108);
        float _262 = _260 * _256;
        float _264 = floor(_262);
        float _266 = -_264;
        float _268 = _262 + _266;
        _270 = _268;
        _272 = true;
    }
    else
    {
        float _274 = float(_74);
        float _276 = 1.0 / _274;
        float _278 = _108 * _276;
        _270 = _278;
    }
    _272 = false;
    float _280 = _270;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = _280 + _282;
    bool _286 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _288 = isnan(_280);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -_296;
    float _304 = _302 + 1.0;
    bool _306 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _308 = isnan(_280);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = 1.0 / _300;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _324;
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _330 = _316 * _304;
    float _332 = -_316;
    float _334 = _332 + 1.0;
    float _336 = _284 * _318;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _338;
    float _342 = in.m_37.x;
    float _344 = in.m_37.y;
    float _346 = in.m_37.z;
    float _348 = fma(_322, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _350 = fma(_340, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _352 = fma(_326, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _354 = _348 * _330;
    float _356 = _350 * _330;
    float _358 = _352 * _330;
    float _360 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _362 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].y, _356);
    float _364 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].z, _358);
    float _366 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[144].x, _360);
    float _368 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[144].y, _362);
    float _370 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[144].z, _364);
    float _372 = _366 * _342;
    float _374 = _368 * _344;
    float _376 = _370 * _346;
    bool _378 = !_328;
    float _396;
    if (!_378)
    {
        float _380 = in.m_39.x;
        float _382 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _384 = _380 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _386 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[11].x, _108);
        float _388 = _386 * _382;
        float _390 = floor(_388);
        float _392 = -_390;
        float _394 = _388 + _392;
        _396 = _394;
        _398 = true;
    }
    else
    {
        float _400 = float(_74);
        float _402 = 1.0 / _400;
        float _404 = _108 * _402;
        _396 = _404;
    }
    _398 = false;
    float _406 = _396;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _410 = _406 + _408;
    bool _412 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _414 = isnan(_406);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _424;
    bool _428 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _430 = isnan(_406);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = -_422;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _444;
    float _448 = 1.0 / _426;
    bool _450 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _452 = _410 * _448;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _454;
    float _458 = _438 * _442;
    float _460 = fma(_446, _452, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _462 = -_438;
    float _464 = _462 + 1.0;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _466;
    float _470 = fma(_456, _452, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _472 = _460 * _458;
    float _474 = fma(_468, _452, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _476 = _470 * _458;
    float _478 = _474 * _458;
    float _480 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[107].x, _472);
    float _482 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[107].y, _478);
    float _484 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[107].z, _476);
    float _486 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[108].x, _480);
    float _488 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[108].y, _482);
    float _490 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[108].z, _484);
    bool _492 = !_450;
    float _510;
    if (!_492)
    {
        float _494 = in.m_39.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _510 = _508;
        _512 = true;
    }
    else
    {
        float _514 = float(_74);
        float _516 = 1.0 / _514;
        float _518 = _108 * _516;
        _510 = _518;
    }
    _512 = false;
    float _520 = _510;
    float _522 = _486 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _524 = _488 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _530;
    bool _534 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _536 = isnan(_520);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = 1.0 / _528;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _556 = -_544;
    float _558 = _556 + 1.0;
    bool _560 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _562 = isnan(_520);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = _490 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _574 = 1.0 / _550;
    bool _576 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _578 = isnan(_520);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    bool _588 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _590 = _586 * _558;
    float _592 = -_586;
    float _594 = _592 + 1.0;
    float _596 = _532 * _546;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _600 = _520 + _598;
    float _602 = 1.0 / _554;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _608 = _570 * _594;
    float _610 = fma(_596, _600, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _616 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _618 = isnan(_520);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _628;
    float _632 = _606 * _574;
    float _634 = 1.0 / _614;
    float _636 = _610 * _608;
    float _638 = -_626;
    float _640 = _638 + 1.0;
    float _642 = -_570;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _650 = _544 * _640;
    bool _652 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _654 = isnan(_520);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _630 * _602;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _668 = _520 + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _672 = _520 + _670;
    float _674 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[115].x, _636);
    float _676 = -_662;
    float _678 = _676 + 1.0;
    float _680 = fma(_632, _668, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _682 = fma(_664, _672, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _686 = _520 + _684;
    float _688 = _648 * _634;
    float _690 = fma(_680, _590, _674);
    float _692 = _626 * _678;
    float _694 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = fma(_688, _686, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _698 = fma(_682, _650, _690);
    float _700 = fma(_696, _692, _698);
    float _702 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[119].x, _700);
    float _706 = _522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _704 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.x = _706;
    out.m_41.y = _694;
    out.m_41.z = _702;
    out.m_41.w = _708;
    bool _710 = !_588;
    float _728;
    if (!_710)
    {
        float _712 = in.m_39.x;
        float _714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _716 = _712 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[11].z, _108);
        float _720 = _718 * _714;
        float _722 = floor(_720);
        float _724 = -_722;
        float _726 = _720 + _724;
        _728 = _726;
        _730 = true;
    }
    else
    {
        float _732 = float(_74);
        float _734 = 1.0 / _732;
        float _736 = _108 * _734;
        _728 = _736;
    }
    _730 = false;
    float _738 = _728;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _742 = _738 + _740;
    bool _744 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _746 = isnan(_738);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _758 = _738 + _756;
    bool _760 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _762 = isnan(_738);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _772;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _780 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _782 = isnan(_738);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = -_754;
    float _794 = _792 + 1.0;
    float _796 = 1.0 / _774;
    float _798 = _790 * _794;
    float _800 = -_790;
    float _802 = _800 + 1.0;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _804;
    bool _808 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _810 = 1.0 / _778;
    float _812 = _770 * _802;
    float _814 = -_770;
    float _816 = _814 + 1.0;
    float _818 = _742 * _796;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _820;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _824;
    float _828 = fma(_806, _818, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _830 = fma(_822, _818, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _832 = fma(_826, _818, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _834 = _758 * _810;
    float _836 = _828 * _812;
    float _838 = _830 * _812;
    float _840 = _832 * _812;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _854 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[123].x, _836);
    float _856 = fma(_844, _834, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _858 = fma(_848, _834, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _860 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[123].y, _838);
    float _862 = fma(_852, _834, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _864 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[123].z, _840);
    float _866 = fma(_856, _798, _854);
    float _868 = fma(_858, _798, _860);
    float _870 = fma(_862, _798, _864);
    float _872 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[125].x, _866);
    float _874 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[125].y, _868);
    float _876 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[125].z, _870);
    bool _878 = !_808;
    float _896;
    if (!_878)
    {
        float _880 = in.m_39.x;
        float _882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _884 = _880 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[11].w, _108);
        float _888 = _886 * _882;
        float _890 = floor(_888);
        float _892 = -_890;
        float _894 = _888 + _892;
        _896 = _894;
        _898 = true;
    }
    else
    {
        float _900 = float(_74);
        float _902 = 1.0 / _900;
        float _904 = _108 * _902;
        _896 = _904;
    }
    _898 = false;
    float _906 = _896;
    float _908 = in.m_43.y;
    float _910 = _248 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _912 = in.m_39.z;
    float _914 = in.m_39.w;
    int _916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _918 = _916 != 0;
    float _920 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _924 = _922 != 0;
    float _926 = in.m_39.y;
    float _928 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _930 = in.m_45.x;
    float _932 = in.m_45.y;
    float _934 = in.m_45.z;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _938 = _936 != 0;
    float _940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _944 = _942 != 0;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    float _946 = in.m_43.x;
    float _948 = -_908;
    float _950 = _948 + 1.0;
    bool _952 = _912 > 0.5;
    float _954 = _248 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _956 = _914 > 0.5;
    float _958 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].x, _910);
    bool _960 = _926 > 0.5;
    float _962 = 0.0;
    float _964 = _908;
    bool _966 = _956;
    float _968 = _912;
    float _970 = _926;
    if (_944)
    {
        float _972 = in.m_39.z;
        _962 = _972;
    }
    float _974 = _962;
    int _976 = _952 ? as_type<int>(_950) : as_type<int>(_908);
    float _978 = _940 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _980 = _960 ? as_type<int>(_950) : as_type<int>(_908);
    float _982 = _918 ? as_type<float>(_976) : _908;
    float _984 = _924 ? as_type<float>(_980) : _908;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _988 = _986 != 0;
    float _990 = fma(_982, _978, -0.5);
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _994 = _992 != 0;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _998 = _996 != 0;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1004 = _248 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1006 = 1.0 / _1002;
    float _1008 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1004);
    float _1010 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].x, _954);
    float _1012 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _930);
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _932);
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _934);
    float _1018 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1008);
    float _1020 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].z, _958);
    float _1022 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1010);
    float _1024 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1026 = _920 * _1012;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1028;
    float _1032 = _1020 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1034 = _928 * _1016;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1038 = _906 + _1036;
    float _1040 = _1030 * _1006;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1044 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1046 = -_1032;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _1050 = _998;
    float _1052 = _1014;
    float _1054 = _1008;
    float _1056 = _1006;
    if (_998)
    {
        float _1058 = _956 ? _950 : _908;
        _964 = _1058;
    }
    float _1060 = _964;
    float _1062 = fma(_1040, _1038, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1064 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1042);
    float _1066 = _1022 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1068 = -_1044;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1072 = _1048 * _1048;
    float _1074 = in.m_39.x;
    float _1076 = -_1066;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1082 = fma(_1070, _1070, _1072);
    bool _1084 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1086 = isnan(_906);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1092 = _1088 || _1090;
    float _1094 = float(_1092);
    float _1096 = _1024 * _1014;
    int _1098 = as_type<int>(_1062);
    if (_944)
    {
        bool _1100 = _974 > 0.5;
        _1050 = _1100;
    }
    bool _1102 = _1050;
    float _1104 = fma(_1078, _1078, _1082);
    bool _1106 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1108 = isnan(_906);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = -_1094;
    float _1120 = _1118 + 1.0;
    int _1122 = as_type<int>(_1120);
    float _1124 = _1104;
    if (!_938)
    {
        _1052 = _946;
    }
    float _1126 = _1052;
    float _1128 = rsqrt(_1104);
    int _1130 = 0;
    float _1132 = _1126;
    if (_994)
    {
        float _1134 = -_946;
        float _1136 = _1134 + 1.0;
        _1130 = as_type<int>(_1136);
    }
    int _1138 = _1130;
    float _1140 = _1116 * _1120;
    float _1142 = _1140;
    if (_944)
    {
        float _1144 = -_946;
        float _1146 = _1144 + 1.0;
        _1122 = as_type<int>(_1146);
    }
    int _1148 = _1122;
    if (!_988)
    {
        _1054 = _926;
    }
    float _1150 = _1054;
    float _1152 = _1062 * _1140;
    float _1154 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1156 = _1080;
    float _1158 = _1150;
    if (_938)
    {
        float _1160 = -_946;
        float _1162 = _1160 + 1.0;
        _1098 = as_type<int>(_1162);
    }
    int _1164 = _1098;
    if (!_944)
    {
        _1156 = _946;
    }
    float _1166 = _1156;
    float _1168 = _1166;
    if (_944)
    {
        float _1170 = _1102 ? as_type<float>(_1148) : _946;
        _1168 = _1170;
    }
    float _1172 = _1168;
    float _1174 = fma(_1154, _1060, -0.5);
    if (_938)
    {
        bool _1176 = _1074 > 0.5;
        _966 = _1176;
    }
    bool _1178 = _966;
    if (!_994)
    {
        _1142 = _946;
    }
    float _1180 = _1142;
    float _1182 = _1070 * _1128;
    float _1184 = _1180;
    if (_938)
    {
        float _1186 = _1178 ? as_type<float>(_1164) : _946;
        _1132 = _1186;
    }
    float _1188 = _1132;
    float _1190 = _1078 * _1128;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1194 = _1182 * _1192;
    float _1196 = _1048 * _1128;
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1200 = _1190 * _1198;
    if (_994)
    {
        float _1202 = _960 ? as_type<float>(_1138) : _946;
        _1184 = _1202;
    }
    float _1204 = _1184;
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1208 = -_1194;
    float _1210 = fma(_1190, _1206, _1208);
    if (_988)
    {
        _1158 = _1074;
    }
    float _1212 = _1158;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1218 = -_1200;
    float _1220 = fma(_1196, _1216, _1218);
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1224 = _1196 * _1222;
    float _1226 = _1210 * _1210;
    float _1228 = -_1116;
    float _1230 = _1228 + 1.0;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1234 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1214);
    float _1236 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1240 = -_1224;
    float _1242 = fma(_1182, _1238, _1240);
    float _1244 = fma(_1220, _1220, _1226);
    if (!_988)
    {
        _1124 = _912;
    }
    float _1246 = _1124;
    float _1248 = -_1232;
    float _1250 = fma(_1236, 2.0, _1248);
    float _1252 = _1246;
    if (_988)
    {
        _1252 = _926;
    }
    float _1254 = _1252;
    float _1256 = fma(_1242, _1242, _1244);
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_988)
    {
        _1056 = _1074;
    }
    float _1260 = _1056;
    float _1262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1264 = _1260;
    if (!_988)
    {
        _1264 = _912;
    }
    float _1266 = _1264;
    float _1268 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1258);
    float _1270 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1152);
    if (_988)
    {
        _968 = _926;
    }
    float _1272 = _968;
    float _1274 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1276 = rsqrt(_1256);
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_988)
    {
        _970 = _1074;
    }
    float _1280 = _970;
    float _1282 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1234);
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1286 = -_1278;
    float _1288 = fma(_1274, 2.0, _1286);
    float _1290 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1270);
    float _1292 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1296 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1284);
    float _1298 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1302 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1304 = isnan(0.5);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1310 = _1306 || _1308;
    float _1312 = fma(_1298, _1172, -0.5);
    float _1314 = fma(_1292, -2.0, _1300);
    float _1316 = _1220 * _1276;
    float _1318 = _1210 * _1276;
    float _1320 = _1242 * _1276;
    float _1322 = -_108;
    float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1250);
    float _1326 = _1196 * _1316;
    float _1328 = _1190 * _1318;
    float _1330 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1314);
    float _1332 = fma(_1282, _1312, _1324);
    float _1334 = -_1326;
    float _1336 = fma(_1182, _1318, _1334);
    float _1338 = -_1328;
    float _1340 = fma(_1196, _1320, _1338);
    float _1342 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1344 = -_108;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1288);
    float _1348 = _1096 * _1336;
    float _1350 = _1096 * _1340;
    float _1352 = fma(_1342, _1204, -0.5);
    float _1354 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1296);
    float _1356 = fma(_1026, _1320, _1348);
    float _1358 = fma(_1026, _1316, _1350);
    float _1360 = _1182 * _1320;
    float _1362 = fma(_1354, _1352, _1346);
    float _1364 = fma(_1034, _1190, _1356);
    float _1366 = fma(_1034, _1182, _1358);
    float _1368 = -_1360;
    float _1370 = fma(_1190, _1316, _1368);
    float _1372 = _872 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1374 = _1066 + _1364;
    float _1376 = _1044 + _1366;
    float _1378 = _874 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1380 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1384 = _1374 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1388 = _1376 + _1386;
    float _1390 = _876 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1392 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1380);
    float _1394 = _1384 * _1384;
    float _1396 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1398 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1392);
    float _1400 = fma(_1388, _1388, _1394);
    float _1402 = _1096 * _1370;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1406 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1408 = sqrt(_1400);
    float _1410 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1412 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1396);
    float _1414 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1416 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1418 = fma(_1410, -2.0, _1404);
    float _1420 = fma(_1026, _1318, _1402);
    float _1422 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1412);
    float _1424 = 1.0 / _1406;
    float _1426 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = fma(_1034, _1196, _1420);
    float _1430 = _1422 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1432 = _1290 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1434 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1064);
    float _1436 = _1032 + _1428;
    float _1438 = _1430 + _1406;
    bool _1440 = _1408 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1442 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1268);
    float _1444 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1418);
    out.m_49.x = _1414;
    out.m_49.y = _1416;
    out.m_49.z = _1426;
    out.m_49.w = _1432;
    bool _1446 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1448 = isnan(0.5);
    bool _1450 = _1446 || _1448;
    bool _1452 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1454 = _1450 || _1452;
    float _1456 = -_1330;
    float _1458 = fma(_1442, _1174, _1456);
    float _1460 = -_1444;
    float _1462 = fma(_1434, _990, _1460);
    float _1464 = _1426;
    float _1466 = _1374;
    float _1468 = _1416;
    float _1470 = _1432;
    if (!_1440)
    {
        _110 = _1376;
    }
    float _1472 = _110;
    float _1474 = _1438 * _1424;
    float _1476 = _1474 * 0.5;
    float _1478 = _1472;
    if (!_1440)
    {
        _1464 = _1436;
    }
    float _1480 = _1464;
    bool _1482 = !_1440;
    float _1484 = _1480;
    if (!_1482)
    {
        float _1486 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1490 = _1408 + _1488;
        float _1492 = _1436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1494 = rsqrt(_1400);
        float _1496 = _1490 * _1486;
        float _1498 = _1496 * 0.15915493667125701904296875;
        float _1500 = _1498 * 6.283185482025146484375;
        float _1502 = cos(_1500);
        float _1504 = _1498 * 6.283185482025146484375;
        float _1506 = sin(_1504);
        float _1508 = _1502 + (-1.0);
        float _1510 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1512 = fma(_1506, _1492, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1514 = fma(_1436, _1502, _1510);
        float _1516 = _1494 * _1512;
        float _1518 = fma(_1388, _1516, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1520 = fma(_1384, _1516, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1466 = _1520;
        _1478 = _1518;
        _1484 = _1514;
        _1468 = _1506;
        _1470 = _1510;
    }
    float _1522 = _1466;
    float _1524 = _1478;
    float _1526 = _1484;
    float _1528 = _1468;
    float _1530 = _1470;
    float _1532 = _1528;
    float _1534 = _1526;
    float _1536 = _1524;
    float _1538 = _1530;
    if (_1310)
    {
        _1532 = _1522;
    }
    float _1540 = _1532;
    float _1542 = _1540;
    if (!_1310)
    {
        float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1546 = _1032 + _1544;
        float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1550 = _1044 + _1548;
        float _1552 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1554 = -_1044;
        float _1556 = _1554 + _1524;
        float _1558 = _1546 * _1546;
        float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1562 = _1066 + _1560;
        float _1564 = -_1032;
        float _1566 = _1564 + _1526;
        float _1568 = fma(_1550, _1550, _1558);
        float _1570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1572 = fma(_1562, _1562, _1568);
        float _1574 = sqrt(_1572);
        float _1576 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1578 = precise::min(_1574, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1580 = _1578 * _1570;
        float _1582 = _1576 * _1580;
        float _1584 = -_1066;
        float _1586 = _1584 + _1522;
        float _1588 = fma(_1556, _1582, _1044);
        float _1590 = fma(_1566, _1582, _1032);
        float _1592 = fma(_1586, _1582, _1066);
        _1534 = _1590;
        _1536 = _1588;
        _1542 = _1592;
        _1538 = _1578;
    }
    float _1594 = _1534;
    float _1596 = _1536;
    float _1598 = _1542;
    float _1600 = _1538;
    float _1602 = _1600;
    if (_1454)
    {
        _1602 = 1.0;
    }
    float _1604 = _1602;
    float _1606 = _1604;
    if (!_1454)
    {
        float _1608 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1610 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1612 = _1608 * 0.15915493667125701904296875;
        float _1614 = _1610 * 0.15915493667125701904296875;
        float _1616 = _1612 * 6.283185482025146484375;
        float _1618 = cos(_1616);
        float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1622 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1620);
        float _1624 = _1612 * 6.283185482025146484375;
        float _1626 = sin(_1624);
        float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1630 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1628;
        float _1632 = 1.0 / _1618;
        float _1634 = _1614 * 6.283185482025146484375;
        float _1636 = cos(_1634);
        float _1638 = _1626 * _1632;
        float _1640 = _1614 * 6.283185482025146484375;
        float _1642 = sin(_1640);
        float _1644 = _1636 * _1638;
        float _1646 = 1.0 / _1622;
        float _1648 = 1.0 / _1644;
        float _1650 = 1.0 / _1630;
        float _1652 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1654 = _1646 * _1652;
        float _1656 = _1642 * _1648;
        float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1660 = fma(_1656, _1654, _1658);
        float _1662 = _1660 * _1650;
        float _1664 = precise::clamp(_1662, 0.0, 1.0);
        _1606 = _1664;
    }
    float _1666 = _1606;
    float _1668 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1670 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1672 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1674 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1676 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1668);
    float _1678 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1670);
    float _1680 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1672);
    float _1682 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1674);
    float _1684 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1676);
    float _1686 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1678);
    float _1688 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1680);
    float _1690 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1682);
    float _1692 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1694 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1696 = _1688 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1700 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1702 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1704 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1706 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1700);
    float _1710 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1702);
    float _1712 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1704);
    float _1714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1716 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1706);
    float _1718 = _1690 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1720 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1708);
    float _1722 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1710);
    float _1724 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1712);
    float _1726 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1716);
    float _1728 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1730 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1720);
    float _1732 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1722);
    float _1734 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1724);
    float _1736 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1726);
    bool _1738 = _1666 > 0.0;
    bool _1740 = isnan(_1666);
    bool _1742 = _1738 || _1740;
    bool _1744 = isnan(0.0);
    bool _1746 = _1742 || _1744;
    float _1748 = _984 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1750 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1752 = _1734 + _1736;
    float _1754 = _1728 * _1698;
    float _1756 = _1748 * _1714;
    float _1758 = _1750 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1760 = _1362 + 0.5;
    float _1762 = _1332 + 0.5;
    float _1764 = _1458 + 0.5;
    float _1766 = _1462 + 0.5;
    float _1768 = _1752 * 0.5;
    out.m_33.x = _1758;
    out.m_51.x = _1754;
    out.m_51.y = _1756;
    out.m_51.z = _1762;
    out.m_51.w = _1764;
    out.m_53.x = _1760;
    out.m_53.y = _1766;
    out.gl_Position.x = _1730;
    out.gl_Position.y = _1732;
    out.gl_Position.z = _1734;
    out.gl_Position.w = _1736;
    out.m_55.z = _1768;
    out.m_55.w = _1736;
    if (_1746)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1770 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1770;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

