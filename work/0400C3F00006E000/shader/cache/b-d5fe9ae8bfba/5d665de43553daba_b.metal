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
    float4 m_53 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _92 = as_type<float>(_90);
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1744 = as_type<float>(_90);
        out.gl_Position.z = _1744;
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
    int _126 = 0;
    if (_122)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1813 = as_type<float>(_130);
        out.gl_Position.z = _1813;
    }
    if (_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_37.w;
    float _134 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _158 = _134;
    if (!_144)
    {
        float _160 = _134 * _134;
        float _162 = _160 * 0.5;
        _92 = _162;
    }
    float _164 = _92;
    float _166 = _164;
    if (!_144)
    {
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _168;
    }
    float _170 = _166;
    bool _172 = !_144;
    float _174 = _170;
    if (!_172)
    {
        float _176 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = log2(_176);
        float _180 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _182 = _180 + 1.0;
        float _184 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = _134 * _178;
        float _188 = 1.0 / _182;
        float _190 = _184 * 0.693147182464599609375;
        float _192 = exp2(_186);
        float _194 = 1.0 / _190;
        float _196 = _192 + (-1.0);
        float _198 = -_196;
        float _200 = fma(_198, _194, _134);
        float _202 = _200 * _188;
        float _204 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _204;
    }
    float _206 = _174;
    bool _208 = !_144;
    if (!_208)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = 1.0 / _216;
        float _220 = _134 * _212;
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
    float _240 = fma(_230, _146, _234);
    float _242 = fma(_230, _148, _236);
    float _244 = fma(_230, _150, _238);
    float _246 = fma(_240, _132, _152);
    float _248 = fma(_242, _132, _154);
    float _250 = fma(_244, _132, _156);
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
    float _330 = _284 * _318;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = in.m_37.x;
    float _338 = in.m_37.y;
    float _340 = in.m_37.z;
    float _342 = _316 * _304;
    float _344 = fma(_322, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _346 = fma(_334, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _348 = fma(_326, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _350 = -_316;
    float _352 = _350 + 1.0;
    float _354 = _344 * _342;
    float _356 = _346 * _342;
    float _358 = _348 * _342;
    float _360 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _362 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[143].y, _356);
    float _364 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[143].z, _358);
    float _366 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[144].x, _360);
    float _368 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[144].y, _362);
    float _370 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[144].z, _364);
    float _372 = _366 * _336;
    float _374 = _368 * _338;
    float _376 = _370 * _340;
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
    float _452 = _438 * _442;
    float _454 = -_438;
    float _456 = _454 + 1.0;
    float _458 = _410 * _448;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _460;
    float _464 = fma(_446, _458, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _466;
    float _470 = fma(_462, _458, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _472 = _464 * _452;
    float _474 = fma(_468, _458, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _476 = _470 * _452;
    float _478 = _474 * _452;
    float _480 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[107].x, _472);
    float _482 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[107].y, _478);
    float _484 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[107].z, _476);
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
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _524 = _520 + _522;
    float _526 = _486 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _540 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _542 = isnan(_520);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = 1.0 / _530;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _558 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _560 = isnan(_520);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = _488 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _572 = _490 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _576 = 1.0 / _538;
    float _578 = _534 * _552;
    bool _580 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _582 = isnan(_520);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = 1.0 / _556;
    float _594 = -_550;
    float _596 = _594 + 1.0;
    float _598 = fma(_578, _524, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _604 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _606 = isnan(_520);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -_590;
    float _618 = _616 + 1.0;
    float _620 = _590 * _596;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _626 = 1.0 / _602;
    float _628 = -_614;
    float _630 = _628 + 1.0;
    float _632 = _568 * _618;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _634;
    float _638 = _624 * _576;
    float _640 = _550 * _630;
    float _642 = _598 * _632;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _646 = _520 + _644;
    float _648 = -_568;
    float _650 = _648 + 1.0;
    bool _652 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _654 = isnan(_520);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _636 * _592;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _672 = _520 + _670;
    float _674 = fma(_638, _646, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _676 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[115].x, _642);
    float _678 = -_662;
    float _680 = _678 + 1.0;
    float _682 = _668 * _626;
    float _684 = fma(_664, _672, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _688 = _520 + _686;
    float _690 = fma(_674, _620, _676);
    float _692 = _614 * _680;
    float _694 = fma(_682, _688, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _696 = fma(_684, _640, _690);
    float _698 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = fma(_694, _692, _696);
    float _702 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[119].x, _700);
    float _706 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _704 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.x = _698;
    out.m_41.y = _706;
    out.m_41.z = _702;
    out.m_41.w = _708;
    bool _710 = !_574;
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
    float _740 = in.m_43.y;
    float _742 = _248 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _744 = in.m_39.z;
    float _746 = in.m_39.w;
    float _748 = _248 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _750 = in.m_39.y;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _754 = _752 != 0;
    float _756 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _760 = _758 != 0;
    float _762 = in.m_45.x;
    float _764 = in.m_45.y;
    float _766 = in.m_45.z;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _770 = _768 != 0;
    float _772 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _776 = _774 != 0;
    bool _778 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _780 = isnan(_738);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = _626;
    if (_754)
    {
        float _792 = in.m_39.z;
        _790 = _792;
    }
    float _794 = _790;
    bool _796 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _798 = isnan(_738);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = -_740;
    float _810 = _808 + 1.0;
    float _812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _814 = _744 > 0.5;
    float _816 = _772 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _818 = _750 > 0.5;
    int _820 = _814 ? as_type<int>(_810) : as_type<int>(_740);
    int _822 = _818 ? as_type<int>(_810) : as_type<int>(_740);
    bool _824 = _746 > 0.5;
    float _826 = _760 ? as_type<float>(_820) : _740;
    float _828 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].x, _742);
    float _830 = _770 ? as_type<float>(_822) : _740;
    float _832 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].x, _748);
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _836 = _834 != 0;
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _840 = _838 != 0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _842;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _848 = _846 != 0;
    float _850 = _248 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _852 = 1.0 / _844;
    float _854 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].z, _832);
    float _856 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].x, _850);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _764);
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _762);
    float _866 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _868 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _870 = 1.0 / _860;
    float _872 = in.m_43.x;
    float _874 = _756 * _862;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _878 = _738 + _876;
    float _880 = _868 * _864;
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _766);
    float _884 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].z, _856);
    float _886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _888 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].z, _828);
    float _890 = _878 * _852;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _892;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _898 = _738 + _896;
    float _900 = _866 * _882;
    float _902 = fma(_894, _890, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _904 = _898 * _870;
    float _906 = in.m_39.x;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _908;
    float _912 = _888 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _914 = _740;
    bool _916 = _840;
    float _918 = _890;
    int _920 = as_type<int>(_854);
    bool _922 = _824;
    float _924 = _904;
    float _926 = _744;
    float _928 = _750;
    if (_840)
    {
        float _930 = _824 ? _810 : _740;
        _914 = _930;
    }
    float _932 = _914;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_754)
    {
        bool _936 = _794 > 0.5;
        _916 = _936;
    }
    bool _938 = _916;
    float _940 = fma(_910, _890, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _942 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _944 = isnan(_738);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _954;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _962 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[88].w, _934);
    float _964 = _886 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _966 = -_952;
    float _968 = _966 + 1.0;
    float _970 = fma(_956, _890, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _972 = _956;
    int _974 = as_type<int>(_940);
    float _976 = _872;
    if (!_776)
    {
        _918 = _872;
    }
    float _978 = _918;
    float _980 = _884 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _982 = _788 * _968;
    float _984 = -_788;
    float _986 = _984 + 1.0;
    float _988 = _978;
    if (!_776)
    {
        _972 = _978;
    }
    float _990 = _972;
    float _992 = -_912;
    float _994 = _992 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _996 = _990;
    if (_776)
    {
        _988 = _872;
    }
    float _998 = _988;
    float _1000 = fma(_826, _964, -0.5);
    float _1002 = _806 * _986;
    float _1004 = _854 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1006 = -_980;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1010 = _994 * _994;
    float _1012 = _998;
    if (_776)
    {
        float _1014 = -_998;
        float _1016 = _1014 + 1.0;
        _920 = as_type<int>(_1016);
    }
    int _1018 = _920;
    if (_776)
    {
        bool _1020 = _906 > 0.5;
        _922 = _1020;
    }
    bool _1022 = _922;
    float _1024 = _970 * _1002;
    float _1026 = _940 * _1002;
    float _1028 = _902 * _1002;
    float _1030 = -_1004;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1034 = fma(_1008, _1008, _1010);
    float _1036 = _1034;
    float _1038 = _1024;
    if (_776)
    {
        float _1040 = _1022 ? as_type<float>(_1018) : _998;
        _996 = _1040;
    }
    float _1042 = _996;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1052 = fma(_1032, _1032, _1034);
    float _1054 = fma(_816, _932, -0.5);
    float _1056 = fma(_1046, _904, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1058 = rsqrt(_1052);
    float _1060 = fma(_1050, _904, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1062 = fma(_960, _904, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    if (!_848)
    {
        _924 = _750;
    }
    float _1064 = _924;
    float _1066 = _1064;
    if (_754)
    {
        float _1068 = -_998;
        float _1070 = _1068 + 1.0;
        _974 = as_type<int>(_1070);
    }
    int _1072 = _974;
    if (_848)
    {
        _1066 = _906;
    }
    float _1074 = _1066;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1078 = 0;
    if (_836)
    {
        float _1080 = -_998;
        float _1082 = _1080 + 1.0;
        _1078 = as_type<int>(_1082);
    }
    int _1084 = _1078;
    if (!_754)
    {
        _1036 = _998;
    }
    float _1086 = _1036;
    float _1088 = -_806;
    float _1090 = _1088 + 1.0;
    float _1092 = _1086;
    if (_754)
    {
        float _1094 = _938 ? as_type<float>(_1072) : _998;
        _1092 = _1094;
    }
    float _1096 = _1092;
    float _1098 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1076);
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1102 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_836)
    {
        float _1104 = _818 ? as_type<float>(_1084) : _998;
        _1012 = _1104;
    }
    float _1106 = _1012;
    float _1108 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1024);
    float _1110 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1026);
    float _1112 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1028);
    float _1114 = _1008 * _1058;
    float _1116 = -_1100;
    float _1118 = fma(_1102, 2.0, _1116);
    float _1120 = _1032 * _1058;
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1124 = _1114 * _1122;
    if (!_848)
    {
        _1038 = _744;
    }
    float _1126 = _1038;
    float _1128 = _994 * _1058;
    float _1130 = _1126;
    if (_848)
    {
        _1130 = _750;
    }
    float _1132 = _1130;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1138 = _1120 * _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1142 = -_1124;
    float _1144 = fma(_1120, _1140, _1142);
    float _1146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1148 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1134);
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1152 = _1128 * _1150;
    float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1156 = -_1138;
    float _1158 = fma(_1128, _1154, _1156);
    float _1160 = _1144 * _1144;
    if (_848)
    {
        _976 = _906;
    }
    float _1162 = _976;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1166 = -_1152;
    float _1168 = fma(_1114, _1164, _1166);
    float _1170 = _1162;
    if (!_848)
    {
        _1170 = _744;
    }
    float _1172 = _1170;
    float _1174 = fma(_1158, _1158, _1160);
    float _1176 = fma(_1056, _982, _1108);
    if (_848)
    {
        _926 = _750;
    }
    float _1178 = _926;
    float _1180 = fma(_1168, _1168, _1174);
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1184 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1186 = rsqrt(_1180);
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1190 = -_1182;
    float _1192 = fma(_1184, 2.0, _1190);
    if (!_848)
    {
        _928 = _906;
    }
    float _1194 = _928;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1198 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1188);
    float _1200 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1202 = fma(_1060, _982, _1110);
    float _1204 = fma(_1062, _982, _1112);
    float _1206 = _812 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1208 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1210 = fma(_1200, -2.0, _1196);
    float _1212 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1098);
    float _1214 = fma(_1206, _1106, -0.5);
    float _1216 = fma(_1208, _1096, -0.5);
    float _1218 = -_108;
    float _1220 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1118);
    float _1222 = _1158 * _1186;
    float _1224 = _1144 * _1186;
    float _1226 = _1168 * _1186;
    float _1228 = fma(_1212, _1216, _1220);
    float _1230 = _1128 * _1222;
    float _1232 = _1120 * _1224;
    float _1234 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1210);
    float _1236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1238 = -_1230;
    float _1240 = fma(_1114, _1224, _1238);
    float _1242 = -_1232;
    float _1244 = fma(_1128, _1226, _1242);
    float _1246 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1198);
    float _1248 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1148);
    float _1250 = _874 * _1240;
    float _1252 = _874 * _1244;
    float _1254 = -_108;
    float _1256 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1192);
    float _1258 = -_1234;
    float _1260 = fma(_1248, _1054, _1258);
    float _1262 = fma(_880, _1226, _1250);
    float _1264 = fma(_880, _1222, _1252);
    float _1266 = fma(_1246, _1214, _1256);
    float _1268 = _1114 * _1226;
    float _1270 = fma(_900, _1120, _1262);
    float _1272 = fma(_900, _1114, _1264);
    float _1274 = _912 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1276 = -_1268;
    float _1278 = fma(_1120, _1222, _1276);
    float _1280 = _1004 + _1270;
    float _1282 = _980 + _1272;
    float _1284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1286 = _874 * _1278;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1290 = _1280 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1294 = _1282 + _1292;
    float _1296 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1274);
    float _1298 = _1290 * _1290;
    float _1300 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1302 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1296);
    float _1304 = _912 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1306 = fma(_1294, _1294, _1298);
    float _1308 = fma(_880, _1224, _1286);
    float _1310 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1312 = _1228 + 0.5;
    float _1314 = sqrt(_1306);
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1318 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1304);
    float _1320 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1322 = _830 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1324 = fma(_900, _1128, _1308);
    float _1326 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1318);
    float _1328 = fma(_1320, -2.0, _1316);
    float _1330 = 1.0 / _1310;
    float _1332 = _1322 * _1236;
    float _1334 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1336 = _1300 * _1284;
    float _1338 = _1260 + 0.5;
    float _1340 = _912 + _1324;
    float _1342 = _1334 + _1310;
    float _1344 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].w, _962);
    bool _1346 = _1314 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1348 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1328);
    out.m_49.x = _1336;
    out.m_49.y = _1332;
    out.m_49.z = _1312;
    out.m_49.w = _1338;
    bool _1350 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1352 = isnan(0.5);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1358 = _1354 || _1356;
    float _1360 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1176);
    bool _1362 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1364 = isnan(0.5);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1370 = _1366 || _1368;
    float _1372 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1202);
    float _1374 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1204);
    float _1376 = -_1348;
    float _1378 = fma(_1344, _1000, _1376);
    float _1380 = _1342 * _1330;
    float _1382 = _1380 * 0.5;
    float _1384 = _1312;
    float _1386 = _1282;
    float _1388 = _1280;
    float _1390 = _1338;
    float _1392 = _1332;
    if (!_1346)
    {
        _1384 = _1340;
    }
    float _1394 = _1384;
    bool _1396 = !_1346;
    float _1398 = _1394;
    if (!_1396)
    {
        float _1400 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1404 = _1314 + _1402;
        float _1406 = _1340 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1408 = rsqrt(_1306);
        float _1410 = _1404 * _1400;
        float _1412 = _1410 * 0.15915493667125701904296875;
        float _1414 = _1412 * 6.283185482025146484375;
        float _1416 = cos(_1414);
        float _1418 = _1412 * 6.283185482025146484375;
        float _1420 = sin(_1418);
        float _1422 = _1416 + (-1.0);
        float _1424 = _1422 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1426 = fma(_1420, _1406, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1428 = fma(_1340, _1416, _1424);
        float _1430 = _1408 * _1426;
        float _1432 = fma(_1294, _1430, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1434 = fma(_1290, _1430, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1386 = _1432;
        _1388 = _1434;
        _1398 = _1428;
        _1390 = _1424;
        _1392 = _1420;
        _112 = _1430;
    }
    float _1436 = _1386;
    float _1438 = _1388;
    float _1440 = _1398;
    float _1442 = _1390;
    float _1444 = _1392;
    float _1446 = _112;
    float _1448 = _1442;
    float _1450 = _1444;
    float _1452 = _1440;
    float _1454 = _1446;
    if (_1358)
    {
        _1448 = _1436;
    }
    float _1456 = _1448;
    float _1458 = _1456;
    if (_1358)
    {
        _1450 = _1438;
    }
    float _1460 = _1450;
    float _1462 = _1460;
    if (!_1358)
    {
        float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1466 = _912 + _1464;
        float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1470 = _980 + _1468;
        float _1472 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1474 = -_912;
        float _1476 = _1474 + _1440;
        float _1478 = _1466 * _1466;
        float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1482 = _1004 + _1480;
        float _1484 = -_1004;
        float _1486 = _1484 + _1438;
        float _1488 = fma(_1470, _1470, _1478);
        float _1490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1492 = fma(_1482, _1482, _1488);
        float _1494 = sqrt(_1492);
        float _1496 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1498 = precise::min(_1494, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1500 = _1498 * _1490;
        float _1502 = -_980;
        float _1504 = _1502 + _1436;
        float _1506 = _1496 * _1500;
        float _1508 = fma(_1504, _1506, _980);
        float _1510 = fma(_1476, _1506, _912);
        float _1512 = fma(_1486, _1506, _1004);
        _1452 = _1510;
        _1458 = _1508;
        _1462 = _1512;
        _1454 = _1494;
    }
    float _1514 = _1452;
    float _1516 = _1458;
    float _1518 = _1462;
    float _1520 = _1454;
    float _1522 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1524 = _1520;
    if (_1370)
    {
        _1524 = 1.0;
    }
    float _1526 = _1524;
    float _1528 = _1526;
    if (!_1370)
    {
        float _1530 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1532 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1534 = _1530 * 0.15915493667125701904296875;
        float _1536 = _1532 * 0.15915493667125701904296875;
        float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1540 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1538);
        float _1542 = _1534 * 6.283185482025146484375;
        float _1544 = cos(_1542);
        float _1546 = _1534 * 6.283185482025146484375;
        float _1548 = sin(_1546);
        float _1550 = 1.0 / _1544;
        float _1552 = _1536 * 6.283185482025146484375;
        float _1554 = cos(_1552);
        float _1556 = _1548 * _1550;
        float _1558 = _1536 * 6.283185482025146484375;
        float _1560 = sin(_1558);
        float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1564 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1562;
        float _1566 = _1554 * _1556;
        float _1568 = 1.0 / _1540;
        float _1570 = 1.0 / _1566;
        float _1572 = 1.0 / _1564;
        float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1576 = _1568 * _1574;
        float _1578 = _1560 * _1570;
        float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1582 = fma(_1578, _1576, _1580);
        float _1584 = _1582 * _1572;
        float _1586 = precise::clamp(_1584, 0.0, 1.0);
        _1528 = _1586;
    }
    float _1588 = _1528;
    float _1590 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1592 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1522);
    float _1594 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1596 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1598 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1590);
    float _1600 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1592);
    float _1602 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1594);
    float _1604 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1596);
    float _1606 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1598);
    float _1608 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1610 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1602);
    float _1612 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1604);
    float _1614 = _1606 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1616 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1618 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1620 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1622 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1624 = _1610 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1626 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1616);
    float _1628 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1618);
    float _1630 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1620);
    float _1632 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1622);
    float _1634 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1636 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1626);
    float _1638 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1628);
    float _1640 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1630);
    float _1642 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1632);
    float _1644 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1636);
    float _1646 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1638);
    float _1648 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1640);
    float _1650 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1642);
    bool _1652 = _1588 > 0.0;
    bool _1654 = isnan(_1588);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan(0.0);
    bool _1660 = _1656 || _1658;
    float _1662 = _1360 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1664 = _1588 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1666 = _1372 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1668 = _1374 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1670 = _1648 + _1650;
    float _1672 = _1378 + 0.5;
    float _1674 = _1662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1676 = _1664 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1678 = _1266 + 0.5;
    float _1680 = _1666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1682 = _1668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1684 = _1670 * 0.5;
    out.m_51.x = _1678;
    out.m_51.y = _1672;
    out.m_53.x = _1674;
    out.m_53.y = _1680;
    out.m_53.z = _1682;
    out.m_33.x = _1676;
    out.gl_Position.x = _1646;
    out.gl_Position.y = _1644;
    out.gl_Position.z = _1648;
    out.gl_Position.w = _1650;
    out.m_55.z = _1684;
    out.m_55.w = _1650;
    if (_1660)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1686 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1686;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _92 = as_type<float>(_90);
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1744 = as_type<float>(_90);
        out.gl_Position.z = _1744;
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
    int _126 = 0;
    if (_122)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1813 = as_type<float>(_130);
        out.gl_Position.z = _1813;
    }
    if (_122)
    {
        return out;
    }
    float _132 = in.m_37.w;
    float _134 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _158 = _134;
    if (!_144)
    {
        float _160 = _134 * _134;
        float _162 = _160 * 0.5;
        _92 = _162;
    }
    float _164 = _92;
    float _166 = _164;
    if (!_144)
    {
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _168;
    }
    float _170 = _166;
    bool _172 = !_144;
    float _174 = _170;
    if (!_172)
    {
        float _176 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = log2(_176);
        float _180 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _182 = _180 + 1.0;
        float _184 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = _134 * _178;
        float _188 = 1.0 / _182;
        float _190 = _184 * 0.693147182464599609375;
        float _192 = exp2(_186);
        float _194 = 1.0 / _190;
        float _196 = _192 + (-1.0);
        float _198 = -_196;
        float _200 = fma(_198, _194, _134);
        float _202 = _200 * _188;
        float _204 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _204;
    }
    float _206 = _174;
    bool _208 = !_144;
    if (!_208)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = 1.0 / _216;
        float _220 = _134 * _212;
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
    float _240 = fma(_230, _146, _234);
    float _242 = fma(_230, _148, _236);
    float _244 = fma(_230, _150, _238);
    float _246 = fma(_240, _132, _152);
    float _248 = fma(_242, _132, _154);
    float _250 = fma(_244, _132, _156);
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
    float _330 = _284 * _318;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = in.m_37.x;
    float _338 = in.m_37.y;
    float _340 = in.m_37.z;
    float _342 = _316 * _304;
    float _344 = fma(_322, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _346 = fma(_334, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _348 = fma(_326, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _350 = -_316;
    float _352 = _350 + 1.0;
    float _354 = _344 * _342;
    float _356 = _346 * _342;
    float _358 = _348 * _342;
    float _360 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _362 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[143].y, _356);
    float _364 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[143].z, _358);
    float _366 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[144].x, _360);
    float _368 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[144].y, _362);
    float _370 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[144].z, _364);
    float _372 = _366 * _336;
    float _374 = _368 * _338;
    float _376 = _370 * _340;
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
    float _452 = _438 * _442;
    float _454 = -_438;
    float _456 = _454 + 1.0;
    float _458 = _410 * _448;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _460;
    float _464 = fma(_446, _458, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _466;
    float _470 = fma(_462, _458, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _472 = _464 * _452;
    float _474 = fma(_468, _458, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _476 = _470 * _452;
    float _478 = _474 * _452;
    float _480 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[107].x, _472);
    float _482 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[107].y, _478);
    float _484 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[107].z, _476);
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
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _524 = _520 + _522;
    float _526 = _486 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _540 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _542 = isnan(_520);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = 1.0 / _530;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _558 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _560 = isnan(_520);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = _488 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _572 = _490 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _576 = 1.0 / _538;
    float _578 = _534 * _552;
    bool _580 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _582 = isnan(_520);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = 1.0 / _556;
    float _594 = -_550;
    float _596 = _594 + 1.0;
    float _598 = fma(_578, _524, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _604 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _606 = isnan(_520);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -_590;
    float _618 = _616 + 1.0;
    float _620 = _590 * _596;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _626 = 1.0 / _602;
    float _628 = -_614;
    float _630 = _628 + 1.0;
    float _632 = _568 * _618;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _634;
    float _638 = _624 * _576;
    float _640 = _550 * _630;
    float _642 = _598 * _632;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _646 = _520 + _644;
    float _648 = -_568;
    float _650 = _648 + 1.0;
    bool _652 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _654 = isnan(_520);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _636 * _592;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _672 = _520 + _670;
    float _674 = fma(_638, _646, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _676 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[115].x, _642);
    float _678 = -_662;
    float _680 = _678 + 1.0;
    float _682 = _668 * _626;
    float _684 = fma(_664, _672, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _688 = _520 + _686;
    float _690 = fma(_674, _620, _676);
    float _692 = _614 * _680;
    float _694 = fma(_682, _688, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _696 = fma(_684, _640, _690);
    float _698 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = fma(_694, _692, _696);
    float _702 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[119].x, _700);
    float _706 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _704 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.x = _698;
    out.m_41.y = _706;
    out.m_41.z = _702;
    out.m_41.w = _708;
    bool _710 = !_574;
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
    float _740 = in.m_43.y;
    float _742 = _248 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _744 = in.m_39.z;
    float _746 = in.m_39.w;
    float _748 = _248 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _750 = in.m_39.y;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _754 = _752 != 0;
    float _756 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _760 = _758 != 0;
    float _762 = in.m_45.x;
    float _764 = in.m_45.y;
    float _766 = in.m_45.z;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _770 = _768 != 0;
    float _772 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _776 = _774 != 0;
    bool _778 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _780 = isnan(_738);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = _626;
    if (_754)
    {
        float _792 = in.m_39.z;
        _790 = _792;
    }
    float _794 = _790;
    bool _796 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _798 = isnan(_738);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = -_740;
    float _810 = _808 + 1.0;
    float _812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _814 = _744 > 0.5;
    float _816 = _772 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _818 = _750 > 0.5;
    int _820 = _814 ? as_type<int>(_810) : as_type<int>(_740);
    int _822 = _818 ? as_type<int>(_810) : as_type<int>(_740);
    bool _824 = _746 > 0.5;
    float _826 = _760 ? as_type<float>(_820) : _740;
    float _828 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].x, _742);
    float _830 = _770 ? as_type<float>(_822) : _740;
    float _832 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].x, _748);
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _836 = _834 != 0;
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _840 = _838 != 0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _842;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _848 = _846 != 0;
    float _850 = _248 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _852 = 1.0 / _844;
    float _854 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].z, _832);
    float _856 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].x, _850);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _764);
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _762);
    float _866 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _868 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _870 = 1.0 / _860;
    float _872 = in.m_43.x;
    float _874 = _756 * _862;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _878 = _738 + _876;
    float _880 = _868 * _864;
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _766);
    float _884 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].z, _856);
    float _886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _888 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].z, _828);
    float _890 = _878 * _852;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _892;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _898 = _738 + _896;
    float _900 = _866 * _882;
    float _902 = fma(_894, _890, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _904 = _898 * _870;
    float _906 = in.m_39.x;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _908;
    float _912 = _888 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _914 = _740;
    bool _916 = _840;
    float _918 = _890;
    int _920 = as_type<int>(_854);
    bool _922 = _824;
    float _924 = _904;
    float _926 = _744;
    float _928 = _750;
    if (_840)
    {
        float _930 = _824 ? _810 : _740;
        _914 = _930;
    }
    float _932 = _914;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_754)
    {
        bool _936 = _794 > 0.5;
        _916 = _936;
    }
    bool _938 = _916;
    float _940 = fma(_910, _890, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _942 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _944 = isnan(_738);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _954;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _962 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[88].w, _934);
    float _964 = _886 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _966 = -_952;
    float _968 = _966 + 1.0;
    float _970 = fma(_956, _890, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _972 = _956;
    int _974 = as_type<int>(_940);
    float _976 = _872;
    if (!_776)
    {
        _918 = _872;
    }
    float _978 = _918;
    float _980 = _884 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _982 = _788 * _968;
    float _984 = -_788;
    float _986 = _984 + 1.0;
    float _988 = _978;
    if (!_776)
    {
        _972 = _978;
    }
    float _990 = _972;
    float _992 = -_912;
    float _994 = _992 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _996 = _990;
    if (_776)
    {
        _988 = _872;
    }
    float _998 = _988;
    float _1000 = fma(_826, _964, -0.5);
    float _1002 = _806 * _986;
    float _1004 = _854 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1006 = -_980;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1010 = _994 * _994;
    float _1012 = _998;
    if (_776)
    {
        float _1014 = -_998;
        float _1016 = _1014 + 1.0;
        _920 = as_type<int>(_1016);
    }
    int _1018 = _920;
    if (_776)
    {
        bool _1020 = _906 > 0.5;
        _922 = _1020;
    }
    bool _1022 = _922;
    float _1024 = _970 * _1002;
    float _1026 = _940 * _1002;
    float _1028 = _902 * _1002;
    float _1030 = -_1004;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1034 = fma(_1008, _1008, _1010);
    float _1036 = _1034;
    float _1038 = _1024;
    if (_776)
    {
        float _1040 = _1022 ? as_type<float>(_1018) : _998;
        _996 = _1040;
    }
    float _1042 = _996;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1052 = fma(_1032, _1032, _1034);
    float _1054 = fma(_816, _932, -0.5);
    float _1056 = fma(_1046, _904, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1058 = rsqrt(_1052);
    float _1060 = fma(_1050, _904, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1062 = fma(_960, _904, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    if (!_848)
    {
        _924 = _750;
    }
    float _1064 = _924;
    float _1066 = _1064;
    if (_754)
    {
        float _1068 = -_998;
        float _1070 = _1068 + 1.0;
        _974 = as_type<int>(_1070);
    }
    int _1072 = _974;
    if (_848)
    {
        _1066 = _906;
    }
    float _1074 = _1066;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1078 = 0;
    if (_836)
    {
        float _1080 = -_998;
        float _1082 = _1080 + 1.0;
        _1078 = as_type<int>(_1082);
    }
    int _1084 = _1078;
    if (!_754)
    {
        _1036 = _998;
    }
    float _1086 = _1036;
    float _1088 = -_806;
    float _1090 = _1088 + 1.0;
    float _1092 = _1086;
    if (_754)
    {
        float _1094 = _938 ? as_type<float>(_1072) : _998;
        _1092 = _1094;
    }
    float _1096 = _1092;
    float _1098 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1076);
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1102 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_836)
    {
        float _1104 = _818 ? as_type<float>(_1084) : _998;
        _1012 = _1104;
    }
    float _1106 = _1012;
    float _1108 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1024);
    float _1110 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1026);
    float _1112 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1028);
    float _1114 = _1008 * _1058;
    float _1116 = -_1100;
    float _1118 = fma(_1102, 2.0, _1116);
    float _1120 = _1032 * _1058;
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1124 = _1114 * _1122;
    if (!_848)
    {
        _1038 = _744;
    }
    float _1126 = _1038;
    float _1128 = _994 * _1058;
    float _1130 = _1126;
    if (_848)
    {
        _1130 = _750;
    }
    float _1132 = _1130;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1138 = _1120 * _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1142 = -_1124;
    float _1144 = fma(_1120, _1140, _1142);
    float _1146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1148 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1134);
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1152 = _1128 * _1150;
    float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1156 = -_1138;
    float _1158 = fma(_1128, _1154, _1156);
    float _1160 = _1144 * _1144;
    if (_848)
    {
        _976 = _906;
    }
    float _1162 = _976;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1166 = -_1152;
    float _1168 = fma(_1114, _1164, _1166);
    float _1170 = _1162;
    if (!_848)
    {
        _1170 = _744;
    }
    float _1172 = _1170;
    float _1174 = fma(_1158, _1158, _1160);
    float _1176 = fma(_1056, _982, _1108);
    if (_848)
    {
        _926 = _750;
    }
    float _1178 = _926;
    float _1180 = fma(_1168, _1168, _1174);
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1184 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1186 = rsqrt(_1180);
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1190 = -_1182;
    float _1192 = fma(_1184, 2.0, _1190);
    if (!_848)
    {
        _928 = _906;
    }
    float _1194 = _928;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1198 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1188);
    float _1200 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1202 = fma(_1060, _982, _1110);
    float _1204 = fma(_1062, _982, _1112);
    float _1206 = _812 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1208 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1210 = fma(_1200, -2.0, _1196);
    float _1212 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1098);
    float _1214 = fma(_1206, _1106, -0.5);
    float _1216 = fma(_1208, _1096, -0.5);
    float _1218 = -_108;
    float _1220 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1118);
    float _1222 = _1158 * _1186;
    float _1224 = _1144 * _1186;
    float _1226 = _1168 * _1186;
    float _1228 = fma(_1212, _1216, _1220);
    float _1230 = _1128 * _1222;
    float _1232 = _1120 * _1224;
    float _1234 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1210);
    float _1236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1238 = -_1230;
    float _1240 = fma(_1114, _1224, _1238);
    float _1242 = -_1232;
    float _1244 = fma(_1128, _1226, _1242);
    float _1246 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1198);
    float _1248 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1148);
    float _1250 = _874 * _1240;
    float _1252 = _874 * _1244;
    float _1254 = -_108;
    float _1256 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1192);
    float _1258 = -_1234;
    float _1260 = fma(_1248, _1054, _1258);
    float _1262 = fma(_880, _1226, _1250);
    float _1264 = fma(_880, _1222, _1252);
    float _1266 = fma(_1246, _1214, _1256);
    float _1268 = _1114 * _1226;
    float _1270 = fma(_900, _1120, _1262);
    float _1272 = fma(_900, _1114, _1264);
    float _1274 = _912 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1276 = -_1268;
    float _1278 = fma(_1120, _1222, _1276);
    float _1280 = _1004 + _1270;
    float _1282 = _980 + _1272;
    float _1284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1286 = _874 * _1278;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1290 = _1280 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1294 = _1282 + _1292;
    float _1296 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1274);
    float _1298 = _1290 * _1290;
    float _1300 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1302 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1296);
    float _1304 = _912 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1306 = fma(_1294, _1294, _1298);
    float _1308 = fma(_880, _1224, _1286);
    float _1310 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1312 = _1228 + 0.5;
    float _1314 = sqrt(_1306);
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1318 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1304);
    float _1320 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1322 = _830 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1324 = fma(_900, _1128, _1308);
    float _1326 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1318);
    float _1328 = fma(_1320, -2.0, _1316);
    float _1330 = 1.0 / _1310;
    float _1332 = _1322 * _1236;
    float _1334 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1336 = _1300 * _1284;
    float _1338 = _1260 + 0.5;
    float _1340 = _912 + _1324;
    float _1342 = _1334 + _1310;
    float _1344 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].w, _962);
    bool _1346 = _1314 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1348 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1328);
    out.m_49.x = _1336;
    out.m_49.y = _1332;
    out.m_49.z = _1312;
    out.m_49.w = _1338;
    bool _1350 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1352 = isnan(0.5);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1358 = _1354 || _1356;
    float _1360 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1176);
    bool _1362 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1364 = isnan(0.5);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1370 = _1366 || _1368;
    float _1372 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1202);
    float _1374 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1204);
    float _1376 = -_1348;
    float _1378 = fma(_1344, _1000, _1376);
    float _1380 = _1342 * _1330;
    float _1382 = _1380 * 0.5;
    float _1384 = _1312;
    float _1386 = _1282;
    float _1388 = _1280;
    float _1390 = _1338;
    float _1392 = _1332;
    if (!_1346)
    {
        _1384 = _1340;
    }
    float _1394 = _1384;
    bool _1396 = !_1346;
    float _1398 = _1394;
    if (!_1396)
    {
        float _1400 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1404 = _1314 + _1402;
        float _1406 = _1340 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1408 = rsqrt(_1306);
        float _1410 = _1404 * _1400;
        float _1412 = _1410 * 0.15915493667125701904296875;
        float _1414 = _1412 * 6.283185482025146484375;
        float _1416 = cos(_1414);
        float _1418 = _1412 * 6.283185482025146484375;
        float _1420 = sin(_1418);
        float _1422 = _1416 + (-1.0);
        float _1424 = _1422 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1426 = fma(_1420, _1406, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1428 = fma(_1340, _1416, _1424);
        float _1430 = _1408 * _1426;
        float _1432 = fma(_1294, _1430, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1434 = fma(_1290, _1430, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1386 = _1432;
        _1388 = _1434;
        _1398 = _1428;
        _1390 = _1424;
        _1392 = _1420;
        _112 = _1430;
    }
    float _1436 = _1386;
    float _1438 = _1388;
    float _1440 = _1398;
    float _1442 = _1390;
    float _1444 = _1392;
    float _1446 = _112;
    float _1448 = _1442;
    float _1450 = _1444;
    float _1452 = _1440;
    float _1454 = _1446;
    if (_1358)
    {
        _1448 = _1436;
    }
    float _1456 = _1448;
    float _1458 = _1456;
    if (_1358)
    {
        _1450 = _1438;
    }
    float _1460 = _1450;
    float _1462 = _1460;
    if (!_1358)
    {
        float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1466 = _912 + _1464;
        float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1470 = _980 + _1468;
        float _1472 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1474 = -_912;
        float _1476 = _1474 + _1440;
        float _1478 = _1466 * _1466;
        float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1482 = _1004 + _1480;
        float _1484 = -_1004;
        float _1486 = _1484 + _1438;
        float _1488 = fma(_1470, _1470, _1478);
        float _1490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1492 = fma(_1482, _1482, _1488);
        float _1494 = sqrt(_1492);
        float _1496 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1498 = precise::min(_1494, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1500 = _1498 * _1490;
        float _1502 = -_980;
        float _1504 = _1502 + _1436;
        float _1506 = _1496 * _1500;
        float _1508 = fma(_1504, _1506, _980);
        float _1510 = fma(_1476, _1506, _912);
        float _1512 = fma(_1486, _1506, _1004);
        _1452 = _1510;
        _1458 = _1508;
        _1462 = _1512;
        _1454 = _1494;
    }
    float _1514 = _1452;
    float _1516 = _1458;
    float _1518 = _1462;
    float _1520 = _1454;
    float _1522 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1524 = _1520;
    if (_1370)
    {
        _1524 = 1.0;
    }
    float _1526 = _1524;
    float _1528 = _1526;
    if (!_1370)
    {
        float _1530 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1532 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1534 = _1530 * 0.15915493667125701904296875;
        float _1536 = _1532 * 0.15915493667125701904296875;
        float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1540 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1538);
        float _1542 = _1534 * 6.283185482025146484375;
        float _1544 = cos(_1542);
        float _1546 = _1534 * 6.283185482025146484375;
        float _1548 = sin(_1546);
        float _1550 = 1.0 / _1544;
        float _1552 = _1536 * 6.283185482025146484375;
        float _1554 = cos(_1552);
        float _1556 = _1548 * _1550;
        float _1558 = _1536 * 6.283185482025146484375;
        float _1560 = sin(_1558);
        float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1564 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1562;
        float _1566 = _1554 * _1556;
        float _1568 = 1.0 / _1540;
        float _1570 = 1.0 / _1566;
        float _1572 = 1.0 / _1564;
        float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1576 = _1568 * _1574;
        float _1578 = _1560 * _1570;
        float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1582 = fma(_1578, _1576, _1580);
        float _1584 = _1582 * _1572;
        float _1586 = precise::clamp(_1584, 0.0, 1.0);
        _1528 = _1586;
    }
    float _1588 = _1528;
    float _1590 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1592 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1522);
    float _1594 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1596 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1598 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1590);
    float _1600 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1592);
    float _1602 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1594);
    float _1604 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1596);
    float _1606 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1598);
    float _1608 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1610 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1602);
    float _1612 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1604);
    float _1614 = _1606 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1616 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1618 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1620 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1622 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1624 = _1610 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1626 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1616);
    float _1628 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1618);
    float _1630 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1620);
    float _1632 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1622);
    float _1634 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1636 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1626);
    float _1638 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1628);
    float _1640 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1630);
    float _1642 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1632);
    float _1644 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1636);
    float _1646 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1638);
    float _1648 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1640);
    float _1650 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1642);
    bool _1652 = _1588 > 0.0;
    bool _1654 = isnan(_1588);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan(0.0);
    bool _1660 = _1656 || _1658;
    float _1662 = _1360 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1664 = _1588 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1666 = _1372 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1668 = _1374 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1670 = _1648 + _1650;
    float _1672 = _1378 + 0.5;
    float _1674 = _1662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1676 = _1664 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1678 = _1266 + 0.5;
    float _1680 = _1666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1682 = _1668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1684 = _1670 * 0.5;
    out.m_51.x = _1678;
    out.m_51.y = _1672;
    out.m_53.x = _1674;
    out.m_53.y = _1680;
    out.m_53.z = _1682;
    out.m_33.x = _1676;
    out.gl_Position.x = _1646;
    out.gl_Position.y = _1644;
    out.gl_Position.z = _1648;
    out.gl_Position.w = _1650;
    out.m_55.z = _1684;
    out.m_55.w = _1650;
    if (_1660)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1686 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1686;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _92 = as_type<float>(_90);
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1744 = as_type<float>(_90);
        out.gl_Position.z = _1744;
    }
    if (!_78)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    int _126 = 0;
    if (_122)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1813 = as_type<float>(_130);
        out.gl_Position.z = _1813;
    }
    if (_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_37.w;
    float _134 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _158 = _134;
    if (!_144)
    {
        float _160 = _134 * _134;
        float _162 = _160 * 0.5;
        _92 = _162;
    }
    float _164 = _92;
    float _166 = _164;
    if (!_144)
    {
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _166 = _168;
    }
    float _170 = _166;
    bool _172 = !_144;
    float _174 = _170;
    if (!_172)
    {
        float _176 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _178 = log2(_176);
        float _180 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _182 = _180 + 1.0;
        float _184 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = _134 * _178;
        float _188 = 1.0 / _182;
        float _190 = _184 * 0.693147182464599609375;
        float _192 = exp2(_186);
        float _194 = 1.0 / _190;
        float _196 = _192 + (-1.0);
        float _198 = -_196;
        float _200 = fma(_198, _194, _134);
        float _202 = _200 * _188;
        float _204 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _204;
    }
    float _206 = _174;
    bool _208 = !_144;
    if (!_208)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = 1.0 / _216;
        float _220 = _134 * _212;
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
    float _240 = fma(_230, _146, _234);
    float _242 = fma(_230, _148, _236);
    float _244 = fma(_230, _150, _238);
    float _246 = fma(_240, _132, _152);
    float _248 = fma(_242, _132, _154);
    float _250 = fma(_244, _132, _156);
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
    float _330 = _284 * _318;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = in.m_37.x;
    float _338 = in.m_37.y;
    float _340 = in.m_37.z;
    float _342 = _316 * _304;
    float _344 = fma(_322, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _346 = fma(_334, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _348 = fma(_326, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _350 = -_316;
    float _352 = _350 + 1.0;
    float _354 = _344 * _342;
    float _356 = _346 * _342;
    float _358 = _348 * _342;
    float _360 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[143].x, _354);
    float _362 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[143].y, _356);
    float _364 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[143].z, _358);
    float _366 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[144].x, _360);
    float _368 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[144].y, _362);
    float _370 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[144].z, _364);
    float _372 = _366 * _336;
    float _374 = _368 * _338;
    float _376 = _370 * _340;
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
    float _452 = _438 * _442;
    float _454 = -_438;
    float _456 = _454 + 1.0;
    float _458 = _410 * _448;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _460;
    float _464 = fma(_446, _458, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _466;
    float _470 = fma(_462, _458, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _472 = _464 * _452;
    float _474 = fma(_468, _458, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _476 = _470 * _452;
    float _478 = _474 * _452;
    float _480 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[107].x, _472);
    float _482 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[107].y, _478);
    float _484 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[107].z, _476);
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
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _524 = _520 + _522;
    float _526 = _486 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _540 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _542 = isnan(_520);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = 1.0 / _530;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _558 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _560 = isnan(_520);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = _488 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _572 = _490 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _576 = 1.0 / _538;
    float _578 = _534 * _552;
    bool _580 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _582 = isnan(_520);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = 1.0 / _556;
    float _594 = -_550;
    float _596 = _594 + 1.0;
    float _598 = fma(_578, _524, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _604 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _606 = isnan(_520);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -_590;
    float _618 = _616 + 1.0;
    float _620 = _590 * _596;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _626 = 1.0 / _602;
    float _628 = -_614;
    float _630 = _628 + 1.0;
    float _632 = _568 * _618;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _634;
    float _638 = _624 * _576;
    float _640 = _550 * _630;
    float _642 = _598 * _632;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _646 = _520 + _644;
    float _648 = -_568;
    float _650 = _648 + 1.0;
    bool _652 = _520 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _654 = isnan(_520);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _636 * _592;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _672 = _520 + _670;
    float _674 = fma(_638, _646, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _676 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[115].x, _642);
    float _678 = -_662;
    float _680 = _678 + 1.0;
    float _682 = _668 * _626;
    float _684 = fma(_664, _672, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _688 = _520 + _686;
    float _690 = fma(_674, _620, _676);
    float _692 = _614 * _680;
    float _694 = fma(_682, _688, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _696 = fma(_684, _640, _690);
    float _698 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = fma(_694, _692, _696);
    float _702 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _704 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[119].x, _700);
    float _706 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _704 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.x = _698;
    out.m_41.y = _706;
    out.m_41.z = _702;
    out.m_41.w = _708;
    bool _710 = !_574;
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
    float _740 = in.m_43.y;
    float _742 = _248 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _744 = in.m_39.z;
    float _746 = in.m_39.w;
    float _748 = _248 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _750 = in.m_39.y;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _754 = _752 != 0;
    float _756 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _760 = _758 != 0;
    float _762 = in.m_45.x;
    float _764 = in.m_45.y;
    float _766 = in.m_45.z;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _770 = _768 != 0;
    float _772 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _776 = _774 != 0;
    bool _778 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _780 = isnan(_738);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = _626;
    if (_754)
    {
        float _792 = in.m_39.z;
        _790 = _792;
    }
    float _794 = _790;
    bool _796 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _798 = isnan(_738);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = -_740;
    float _810 = _808 + 1.0;
    float _812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _814 = _744 > 0.5;
    float _816 = _772 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _818 = _750 > 0.5;
    int _820 = _814 ? as_type<int>(_810) : as_type<int>(_740);
    int _822 = _818 ? as_type<int>(_810) : as_type<int>(_740);
    bool _824 = _746 > 0.5;
    float _826 = _760 ? as_type<float>(_820) : _740;
    float _828 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].x, _742);
    float _830 = _770 ? as_type<float>(_822) : _740;
    float _832 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].x, _748);
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _836 = _834 != 0;
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _840 = _838 != 0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _842;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _848 = _846 != 0;
    float _850 = _248 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _852 = 1.0 / _844;
    float _854 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[6].z, _832);
    float _856 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].x, _850);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _764);
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _762);
    float _866 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _868 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _870 = 1.0 / _860;
    float _872 = in.m_43.x;
    float _874 = _756 * _862;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _878 = _738 + _876;
    float _880 = _868 * _864;
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _766);
    float _884 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[4].z, _856);
    float _886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _888 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[5].z, _828);
    float _890 = _878 * _852;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _892;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _898 = _738 + _896;
    float _900 = _866 * _882;
    float _902 = fma(_894, _890, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _904 = _898 * _870;
    float _906 = in.m_39.x;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _908;
    float _912 = _888 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _914 = _740;
    bool _916 = _840;
    float _918 = _890;
    int _920 = as_type<int>(_854);
    bool _922 = _824;
    float _924 = _904;
    float _926 = _744;
    float _928 = _750;
    if (_840)
    {
        float _930 = _824 ? _810 : _740;
        _914 = _930;
    }
    float _932 = _914;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_754)
    {
        bool _936 = _794 > 0.5;
        _916 = _936;
    }
    bool _938 = _916;
    float _940 = fma(_910, _890, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _942 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _944 = isnan(_738);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _954;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _962 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[88].w, _934);
    float _964 = _886 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _966 = -_952;
    float _968 = _966 + 1.0;
    float _970 = fma(_956, _890, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _972 = _956;
    int _974 = as_type<int>(_940);
    float _976 = _872;
    if (!_776)
    {
        _918 = _872;
    }
    float _978 = _918;
    float _980 = _884 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _982 = _788 * _968;
    float _984 = -_788;
    float _986 = _984 + 1.0;
    float _988 = _978;
    if (!_776)
    {
        _972 = _978;
    }
    float _990 = _972;
    float _992 = -_912;
    float _994 = _992 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _996 = _990;
    if (_776)
    {
        _988 = _872;
    }
    float _998 = _988;
    float _1000 = fma(_826, _964, -0.5);
    float _1002 = _806 * _986;
    float _1004 = _854 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1006 = -_980;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1010 = _994 * _994;
    float _1012 = _998;
    if (_776)
    {
        float _1014 = -_998;
        float _1016 = _1014 + 1.0;
        _920 = as_type<int>(_1016);
    }
    int _1018 = _920;
    if (_776)
    {
        bool _1020 = _906 > 0.5;
        _922 = _1020;
    }
    bool _1022 = _922;
    float _1024 = _970 * _1002;
    float _1026 = _940 * _1002;
    float _1028 = _902 * _1002;
    float _1030 = -_1004;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1034 = fma(_1008, _1008, _1010);
    float _1036 = _1034;
    float _1038 = _1024;
    if (_776)
    {
        float _1040 = _1022 ? as_type<float>(_1018) : _998;
        _996 = _1040;
    }
    float _1042 = _996;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1052 = fma(_1032, _1032, _1034);
    float _1054 = fma(_816, _932, -0.5);
    float _1056 = fma(_1046, _904, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1058 = rsqrt(_1052);
    float _1060 = fma(_1050, _904, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1062 = fma(_960, _904, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    if (!_848)
    {
        _924 = _750;
    }
    float _1064 = _924;
    float _1066 = _1064;
    if (_754)
    {
        float _1068 = -_998;
        float _1070 = _1068 + 1.0;
        _974 = as_type<int>(_1070);
    }
    int _1072 = _974;
    if (_848)
    {
        _1066 = _906;
    }
    float _1074 = _1066;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1078 = 0;
    if (_836)
    {
        float _1080 = -_998;
        float _1082 = _1080 + 1.0;
        _1078 = as_type<int>(_1082);
    }
    int _1084 = _1078;
    if (!_754)
    {
        _1036 = _998;
    }
    float _1086 = _1036;
    float _1088 = -_806;
    float _1090 = _1088 + 1.0;
    float _1092 = _1086;
    if (_754)
    {
        float _1094 = _938 ? as_type<float>(_1072) : _998;
        _1092 = _1094;
    }
    float _1096 = _1092;
    float _1098 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1076);
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1102 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_836)
    {
        float _1104 = _818 ? as_type<float>(_1084) : _998;
        _1012 = _1104;
    }
    float _1106 = _1012;
    float _1108 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1024);
    float _1110 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1026);
    float _1112 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1028);
    float _1114 = _1008 * _1058;
    float _1116 = -_1100;
    float _1118 = fma(_1102, 2.0, _1116);
    float _1120 = _1032 * _1058;
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1124 = _1114 * _1122;
    if (!_848)
    {
        _1038 = _744;
    }
    float _1126 = _1038;
    float _1128 = _994 * _1058;
    float _1130 = _1126;
    if (_848)
    {
        _1130 = _750;
    }
    float _1132 = _1130;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1138 = _1120 * _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1142 = -_1124;
    float _1144 = fma(_1120, _1140, _1142);
    float _1146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1148 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1134);
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1152 = _1128 * _1150;
    float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1156 = -_1138;
    float _1158 = fma(_1128, _1154, _1156);
    float _1160 = _1144 * _1144;
    if (_848)
    {
        _976 = _906;
    }
    float _1162 = _976;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1166 = -_1152;
    float _1168 = fma(_1114, _1164, _1166);
    float _1170 = _1162;
    if (!_848)
    {
        _1170 = _744;
    }
    float _1172 = _1170;
    float _1174 = fma(_1158, _1158, _1160);
    float _1176 = fma(_1056, _982, _1108);
    if (_848)
    {
        _926 = _750;
    }
    float _1178 = _926;
    float _1180 = fma(_1168, _1168, _1174);
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1184 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1186 = rsqrt(_1180);
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1190 = -_1182;
    float _1192 = fma(_1184, 2.0, _1190);
    if (!_848)
    {
        _928 = _906;
    }
    float _1194 = _928;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1198 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1188);
    float _1200 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1202 = fma(_1060, _982, _1110);
    float _1204 = fma(_1062, _982, _1112);
    float _1206 = _812 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1208 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1210 = fma(_1200, -2.0, _1196);
    float _1212 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1098);
    float _1214 = fma(_1206, _1106, -0.5);
    float _1216 = fma(_1208, _1096, -0.5);
    float _1218 = -_108;
    float _1220 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1118);
    float _1222 = _1158 * _1186;
    float _1224 = _1144 * _1186;
    float _1226 = _1168 * _1186;
    float _1228 = fma(_1212, _1216, _1220);
    float _1230 = _1128 * _1222;
    float _1232 = _1120 * _1224;
    float _1234 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1210);
    float _1236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1238 = -_1230;
    float _1240 = fma(_1114, _1224, _1238);
    float _1242 = -_1232;
    float _1244 = fma(_1128, _1226, _1242);
    float _1246 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1198);
    float _1248 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1148);
    float _1250 = _874 * _1240;
    float _1252 = _874 * _1244;
    float _1254 = -_108;
    float _1256 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1192);
    float _1258 = -_1234;
    float _1260 = fma(_1248, _1054, _1258);
    float _1262 = fma(_880, _1226, _1250);
    float _1264 = fma(_880, _1222, _1252);
    float _1266 = fma(_1246, _1214, _1256);
    float _1268 = _1114 * _1226;
    float _1270 = fma(_900, _1120, _1262);
    float _1272 = fma(_900, _1114, _1264);
    float _1274 = _912 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1276 = -_1268;
    float _1278 = fma(_1120, _1222, _1276);
    float _1280 = _1004 + _1270;
    float _1282 = _980 + _1272;
    float _1284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1286 = _874 * _1278;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1290 = _1280 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1294 = _1282 + _1292;
    float _1296 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1274);
    float _1298 = _1290 * _1290;
    float _1300 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1302 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1296);
    float _1304 = _912 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1306 = fma(_1294, _1294, _1298);
    float _1308 = fma(_880, _1224, _1286);
    float _1310 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1312 = _1228 + 0.5;
    float _1314 = sqrt(_1306);
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1318 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1304);
    float _1320 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1322 = _830 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1324 = fma(_900, _1128, _1308);
    float _1326 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1318);
    float _1328 = fma(_1320, -2.0, _1316);
    float _1330 = 1.0 / _1310;
    float _1332 = _1322 * _1236;
    float _1334 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1336 = _1300 * _1284;
    float _1338 = _1260 + 0.5;
    float _1340 = _912 + _1324;
    float _1342 = _1334 + _1310;
    float _1344 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].w, _962);
    bool _1346 = _1314 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1348 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1328);
    out.m_49.x = _1336;
    out.m_49.y = _1332;
    out.m_49.z = _1312;
    out.m_49.w = _1338;
    bool _1350 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1352 = isnan(0.5);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1358 = _1354 || _1356;
    float _1360 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1176);
    bool _1362 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1364 = isnan(0.5);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1370 = _1366 || _1368;
    float _1372 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1202);
    float _1374 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1204);
    float _1376 = -_1348;
    float _1378 = fma(_1344, _1000, _1376);
    float _1380 = _1342 * _1330;
    float _1382 = _1380 * 0.5;
    float _1384 = _1312;
    float _1386 = _1282;
    float _1388 = _1280;
    float _1390 = _1338;
    float _1392 = _1332;
    if (!_1346)
    {
        _1384 = _1340;
    }
    float _1394 = _1384;
    bool _1396 = !_1346;
    float _1398 = _1394;
    if (!_1396)
    {
        float _1400 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1404 = _1314 + _1402;
        float _1406 = _1340 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1408 = rsqrt(_1306);
        float _1410 = _1404 * _1400;
        float _1412 = _1410 * 0.15915493667125701904296875;
        float _1414 = _1412 * 6.283185482025146484375;
        float _1416 = cos(_1414);
        float _1418 = _1412 * 6.283185482025146484375;
        float _1420 = sin(_1418);
        float _1422 = _1416 + (-1.0);
        float _1424 = _1422 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1426 = fma(_1420, _1406, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1428 = fma(_1340, _1416, _1424);
        float _1430 = _1408 * _1426;
        float _1432 = fma(_1294, _1430, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1434 = fma(_1290, _1430, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1386 = _1432;
        _1388 = _1434;
        _1398 = _1428;
        _1390 = _1424;
        _1392 = _1420;
        _112 = _1430;
    }
    float _1436 = _1386;
    float _1438 = _1388;
    float _1440 = _1398;
    float _1442 = _1390;
    float _1444 = _1392;
    float _1446 = _112;
    float _1448 = _1442;
    float _1450 = _1444;
    float _1452 = _1440;
    float _1454 = _1446;
    if (_1358)
    {
        _1448 = _1436;
    }
    float _1456 = _1448;
    float _1458 = _1456;
    if (_1358)
    {
        _1450 = _1438;
    }
    float _1460 = _1450;
    float _1462 = _1460;
    if (!_1358)
    {
        float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1466 = _912 + _1464;
        float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1470 = _980 + _1468;
        float _1472 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1474 = -_912;
        float _1476 = _1474 + _1440;
        float _1478 = _1466 * _1466;
        float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1482 = _1004 + _1480;
        float _1484 = -_1004;
        float _1486 = _1484 + _1438;
        float _1488 = fma(_1470, _1470, _1478);
        float _1490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1492 = fma(_1482, _1482, _1488);
        float _1494 = sqrt(_1492);
        float _1496 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1498 = precise::min(_1494, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1500 = _1498 * _1490;
        float _1502 = -_980;
        float _1504 = _1502 + _1436;
        float _1506 = _1496 * _1500;
        float _1508 = fma(_1504, _1506, _980);
        float _1510 = fma(_1476, _1506, _912);
        float _1512 = fma(_1486, _1506, _1004);
        _1452 = _1510;
        _1458 = _1508;
        _1462 = _1512;
        _1454 = _1494;
    }
    float _1514 = _1452;
    float _1516 = _1458;
    float _1518 = _1462;
    float _1520 = _1454;
    float _1522 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1524 = _1520;
    if (_1370)
    {
        _1524 = 1.0;
    }
    float _1526 = _1524;
    float _1528 = _1526;
    if (!_1370)
    {
        float _1530 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1532 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1534 = _1530 * 0.15915493667125701904296875;
        float _1536 = _1532 * 0.15915493667125701904296875;
        float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1540 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1538);
        float _1542 = _1534 * 6.283185482025146484375;
        float _1544 = cos(_1542);
        float _1546 = _1534 * 6.283185482025146484375;
        float _1548 = sin(_1546);
        float _1550 = 1.0 / _1544;
        float _1552 = _1536 * 6.283185482025146484375;
        float _1554 = cos(_1552);
        float _1556 = _1548 * _1550;
        float _1558 = _1536 * 6.283185482025146484375;
        float _1560 = sin(_1558);
        float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1564 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1562;
        float _1566 = _1554 * _1556;
        float _1568 = 1.0 / _1540;
        float _1570 = 1.0 / _1566;
        float _1572 = 1.0 / _1564;
        float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1576 = _1568 * _1574;
        float _1578 = _1560 * _1570;
        float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1582 = fma(_1578, _1576, _1580);
        float _1584 = _1582 * _1572;
        float _1586 = precise::clamp(_1584, 0.0, 1.0);
        _1528 = _1586;
    }
    float _1588 = _1528;
    float _1590 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1592 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1522);
    float _1594 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1596 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1598 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1590);
    float _1600 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1592);
    float _1602 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1594);
    float _1604 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1596);
    float _1606 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1598);
    float _1608 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1610 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1602);
    float _1612 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1604);
    float _1614 = _1606 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1616 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1618 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1620 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1622 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1624 = _1610 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1626 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1616);
    float _1628 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1618);
    float _1630 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1620);
    float _1632 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1622);
    float _1634 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1636 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1626);
    float _1638 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1628);
    float _1640 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1630);
    float _1642 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1632);
    float _1644 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1636);
    float _1646 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1638);
    float _1648 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1640);
    float _1650 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1642);
    bool _1652 = _1588 > 0.0;
    bool _1654 = isnan(_1588);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan(0.0);
    bool _1660 = _1656 || _1658;
    float _1662 = _1360 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1664 = _1588 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1666 = _1372 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1668 = _1374 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1670 = _1648 + _1650;
    float _1672 = _1378 + 0.5;
    float _1674 = _1662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1676 = _1664 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1678 = _1266 + 0.5;
    float _1680 = _1666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1682 = _1668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1684 = _1670 * 0.5;
    out.m_51.x = _1678;
    out.m_51.y = _1672;
    out.m_53.x = _1674;
    out.m_53.y = _1680;
    out.m_53.z = _1682;
    out.m_33.x = _1676;
    out.gl_Position.x = _1646;
    out.gl_Position.y = _1644;
    out.gl_Position.z = _1648;
    out.gl_Position.w = _1650;
    out.m_55.z = _1684;
    out.m_55.w = _1650;
    if (_1660)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1686 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1686;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

