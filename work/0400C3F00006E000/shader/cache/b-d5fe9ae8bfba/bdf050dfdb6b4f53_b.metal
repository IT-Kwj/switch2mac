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
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_47 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_35 [[attribute(7)]];
    float4 m_33 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _858 = false;
    bool _540 = false;
    bool _436 = false;
    bool _268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_26.w;
    float _67 = trunc(_65);
    int _70 = int(_67);
    bool _74 = _70 >= 1;
    float _76 = 0.0;
    if (!_74)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _76;
    if (!_74)
    {
        out.m_29.x = 0.0;
    }
    int _80 = 0;
    if (!_74)
    {
        float _82 = _78 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_74)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1602 = as_type<float>(_84);
        out.gl_Position.z = _1602;
    }
    if (!_74)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _88 = in.m_31.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = 0.0;
    if (_98)
    {
        float _106 = float(_70);
        _104 = _106;
    }
    float _108 = _104;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    float _116 = 0.0;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _122 = _118 * 5.0;
        _86 = as_type<int>(_122);
    }
    int _124 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1671 = as_type<float>(_124);
        out.gl_Position.z = _1671;
    }
    if (_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_33.w;
    float _128 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _130 = in.m_35.w;
    bool _132 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _134 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = in.m_31.x;
    float _144 = in.m_31.y;
    float _146 = in.m_31.z;
    float _148 = in.m_26.x;
    float _150 = in.m_26.y;
    float _152 = in.m_26.z;
    float _154 = _128;
    if (!_140)
    {
        float _156 = _128 * _128;
        float _158 = _156 * 0.5;
        _120 = _158;
    }
    float _160 = _120;
    float _162 = _160;
    if (!_140)
    {
        float _164 = _160 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _162 = _164;
    }
    float _166 = _162;
    out.m_37.w = _126;
    bool _168 = !_140;
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
    bool _204 = !_140;
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
    bool _228 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _230 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _232 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _234 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _236 = fma(_226, _142, _230);
    float _238 = fma(_226, _144, _232);
    float _240 = fma(_226, _146, _234);
    float _242 = fma(_236, _130, _148);
    float _244 = fma(_238, _130, _150);
    float _246 = fma(_240, _130, _152);
    bool _248 = !_228;
    float _266;
    if (!_248)
    {
        float _250 = in.m_39.x;
        float _252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _254 = _250 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _258 = _256 * _252;
        float _260 = floor(_258);
        float _262 = -_260;
        float _264 = _258 + _262;
        _266 = _264;
        _268 = true;
    }
    else
    {
        float _270 = float(_70);
        float _272 = 1.0 / _270;
        float _274 = _102 * _272;
        _266 = _274;
    }
    _268 = false;
    float _276 = _266;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _286 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _288 = isnan(_276);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = 1.0 / _280;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _304 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _306 = isnan(_276);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _316;
    float _320 = -_296;
    float _322 = _320 + 1.0;
    bool _324 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _326 = isnan(_276);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    bool _336 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _338 = 1.0 / _284;
    float _340 = _314 * _322;
    float _342 = -_314;
    float _344 = _342 + 1.0;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _350 = _334 * _344;
    float _352 = -_334;
    float _354 = _352 + 1.0;
    float _356 = 1.0 / _302;
    float _358 = _318 * _298;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _362 = _276 + _360;
    float _364 = fma(_358, _362, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _368 = _276 + _366;
    float _370 = _348 * _338;
    bool _372 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _374 = isnan(_276);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _384;
    float _388 = _364 * _350;
    float _390 = fma(_370, _368, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _394 = _276 + _392;
    float _396 = -_382;
    float _398 = _396 + 1.0;
    float _400 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[115].x, _388);
    float _402 = _386 * _356;
    float _404 = _296 * _398;
    float _406 = fma(_390, _340, _400);
    float _408 = fma(_402, _394, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _410 = fma(_408, _404, _406);
    float _412 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[118].x, _410);
    float _414 = _412 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.w = _414;
    bool _416 = !_336;
    float _434;
    if (!_416)
    {
        float _418 = in.m_39.x;
        float _420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _422 = _418 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _424 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _426 = _424 * _420;
        float _428 = floor(_426);
        float _430 = -_428;
        float _432 = _426 + _430;
        _434 = _432;
        _436 = true;
    }
    else
    {
        float _438 = float(_70);
        float _440 = 1.0 / _438;
        float _442 = _102 * _440;
        _434 = _442;
    }
    _436 = false;
    float _444 = _434;
    bool _446 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _448 = isnan(_444);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _462 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _464 = isnan(_444);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _480 = _444 + _478;
    float _482 = 1.0 / _460;
    float _484 = -_456;
    float _486 = _484 + 1.0;
    bool _488 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _490 = _472 * _486;
    float _492 = -_472;
    float _494 = _492 + 1.0;
    float _496 = _476 * _482;
    float _498 = fma(_496, _480, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _500 = _498 * _490;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _506 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[131].x, _500);
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _510 = _502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _512 = _504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _514 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[132].x, _506);
    float _516 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = _514 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_43.x = _510;
    out.m_43.y = _512;
    out.m_43.z = _516;
    out.m_43.w = _518;
    bool _520 = !_488;
    float _538;
    if (!_520)
    {
        float _522 = in.m_39.x;
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _526 = _522 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _530 = _528 * _524;
        float _532 = floor(_530);
        float _534 = -_532;
        float _536 = _530 + _534;
        _538 = _536;
        _540 = true;
    }
    else
    {
        float _542 = float(_70);
        float _544 = 1.0 / _542;
        float _546 = _102 * _544;
        _538 = _546;
    }
    _540 = false;
    float _548 = _538;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _552 = _548 + _550;
    bool _554 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _556 = isnan(_548);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _570 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _572 = isnan(_548);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _582;
    bool _586 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _588 = isnan(_548);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -_564;
    float _600 = _598 + 1.0;
    float _602 = 1.0 / _568;
    bool _604 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _606 = isnan(_548);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -_596;
    float _618 = _616 + 1.0;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _624 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _626 = 1.0 / _622;
    float _628 = _584 * _602;
    float _630 = -_580;
    float _632 = _630 + 1.0;
    float _634 = _580 * _600;
    bool _636 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _638 = isnan(_548);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = fma(_628, _552, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _650 = _596 * _632;
    float _652 = _614 * _618;
    float _654 = -_614;
    float _656 = _654 + 1.0;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _662 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _664 = isnan(_548);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    float _674 = _646 * _656;
    float _676 = -_646;
    float _678 = _676 + 1.0;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _684 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _686 = isnan(_548);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = 1.0 / _660;
    float _698 = _672 * _678;
    float _700 = -_672;
    float _702 = _700 + 1.0;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _708 = _694 * _702;
    float _710 = 1.0 / _682;
    float _712 = _706 * _626;
    float _714 = -_694;
    float _716 = _714 + 1.0;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _722;
    float _726 = 1.0 / _720;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _732 = _648 * _708;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _736 = _548 + _734;
    float _738 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[159].x, _732);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _744 = 1.0 / _730;
    float _746 = fma(_712, _736, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _748 = _724 * _710;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _752 = _548 + _750;
    float _754 = fma(_746, _698, _738);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _758 = _548 + _756;
    float _760 = fma(_748, _752, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _762 = 1.0 / _742;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _776 = _766 * _696;
    float _778 = fma(_760, _674, _754);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _782 = _548 + _780;
    float _784 = _770 * _744;
    float _786 = fma(_776, _758, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _788;
    bool _792 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _794 = isnan(_548);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = _774 * _726;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _808 = _548 + _806;
    float _810 = fma(_784, _782, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _812 = fma(_786, _652, _778);
    float _814 = _790 * _762;
    float _816 = fma(_804, _808, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _818 = -_802;
    float _820 = _818 + 1.0;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _824 = _548 + _822;
    float _826 = fma(_810, _650, _812);
    float _828 = _564 * _820;
    float _830 = fma(_814, _824, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _832 = fma(_816, _634, _826);
    float _834 = fma(_830, _828, _832);
    float _836 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[166].x, _834);
    out.m_45.x = _836;
    bool _838 = !_624;
    float _856;
    if (!_838)
    {
        float _840 = in.m_39.x;
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _844 = _840 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[14].y, _102);
        float _848 = _846 * _842;
        float _850 = floor(_848);
        float _852 = -_850;
        float _854 = _848 + _852;
        _856 = _854;
        _858 = true;
    }
    else
    {
        float _860 = float(_70);
        float _862 = 1.0 / _860;
        float _864 = _102 * _862;
        _856 = _864;
    }
    _858 = false;
    float _866 = _856;
    float _868 = in.m_39.w;
    float _870 = _244 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _872 = _244 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _874 = in.m_35.x;
    float _876 = in.m_35.y;
    float _878 = in.m_35.z;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _882 = _880 != 0;
    float _884 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].x, _870);
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _888 = _886 != 0;
    float _890 = in.m_39.x;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _894 = _892 != 0;
    float _896 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].x, _872);
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _900 = _898 != 0;
    float _902 = in.m_47.x;
    float _904 = in.m_47.y;
    float _906 = in.m_47.z;
    float _908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _910 = in.m_33.x;
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _914 = _912 != 0;
    float _916 = _244 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _918 = in.m_39.y;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _924 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].x, _916);
    float _926 = 0.0;
    if (_888)
    {
        float _928 = in.m_39.z;
        _926 = _928;
    }
    float _930 = _926;
    bool _932 = _868 > 0.5;
    float _934 = 1.0 / _922;
    float _936 = _874 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _938 = _876 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _946 = 1.0 / _942;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _950 = _948 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _952 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _902);
    float _954 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _906);
    float _956 = _878 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _964 = _918 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _970 = _890 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _972 = 1.0 / _950;
    float _974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _904);
    float _976 = fma(_964, -2.0, _962);
    float _978 = -_944;
    float _980 = fma(_970, 2.0, _978);
    float _982 = in.m_33.y;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _988 = 1.0 / _960;
    float _990 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].z, _924);
    float _992 = _908 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _994;
    bool _998 = false;
    bool _1000 = _932;
    if (_888)
    {
        bool _1002 = _930 > 0.5;
        _998 = _1002;
    }
    bool _1004 = _998;
    float _1006 = _938 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1008 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1010 = isnan(_866);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = 1.0 / _968;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1030 = _996 * _972;
    float _1032 = _1006 * _974;
    float _1034 = -_1018;
    float _1036 = _1034 + 1.0;
    float _1038 = _1028 * _946;
    float _1040 = _936 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1042 = 1.0 / _986;
    float _1044 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].z, _884);
    float _1046 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].z, _896);
    float _1048 = _1024 * _934;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1054 = -_982;
    float _1056 = _1054 + 1.0;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1066 = _1052 * _1020;
    float _1068 = _1060 * _988;
    float _1070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1072 = _932 ? as_type<int>(_1056) : as_type<int>(_982);
    float _1074 = -_102;
    float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[76].x, _980);
    float _1078 = _1064 * _1042;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1088 = _1040;
    float _1090 = _1078;
    float _1092 = _982;
    if (!_914)
    {
        _1086 = _918;
    }
    float _1094 = _1086;
    float _1096 = _1044 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1098 = _1094;
    if (_882)
    {
        bool _1100 = _890 > 0.5;
        _1000 = _1100;
    }
    bool _1102 = _1000;
    float _1104 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1080);
    if (_914)
    {
        _1098 = _890;
    }
    float _1106 = _1098;
    float _1108 = 1.0 / _1084;
    float _1110 = _956 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1114 = _866 + _1112;
    float _1116 = _1040 * _952;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1120 = _866 + _1118;
    float _1122 = _1110 * _954;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1126 = _866 + _1124;
    float _1128 = fma(_1048, _1114, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1130 = fma(_1030, _1120, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1132;
    float _1136 = fma(_1038, _1126, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1140 = _866 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1144 = _866 + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1148 = _866 + _1146;
    if (!_882)
    {
        _1088 = _910;
    }
    float _1150 = _1088;
    float _1152 = fma(_1068, _1140, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _1154 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1156 = isnan(_866);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[174].x;
    float _1168 = _1150;
    if (!_914)
    {
        float _1170 = in.m_39.z;
        _1166 = _1170;
    }
    float _1172 = _1166;
    float _1174 = _1134 * _1108;
    float _1176 = fma(_1066, _1144, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    bool _1178 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1180 = isnan(_866);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = fma(_1078, _1148, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    if (!_882)
    {
        _1090 = _1150;
    }
    float _1192 = _1090;
    float _1194 = _1164 * _1036;
    float _1196 = _1192;
    if (_882)
    {
        _1168 = _910;
    }
    float _1198 = _1168;
    float _1200 = -_1164;
    float _1202 = _1200 + 1.0;
    float _1204 = _894 ? as_type<float>(_1072) : _982;
    float _1206 = -_1188;
    float _1208 = _1206 + 1.0;
    bool _1210 = _918 > 0.5;
    float _1212 = _1188 * _1202;
    bool _1214 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1216 = isnan(_866);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = _990 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1228 = _1202;
    float _1230 = _1198;
    if (_900)
    {
        float _1232 = _1210 ? _1056 : _982;
        _1092 = _1232;
    }
    float _1234 = _1092;
    float _1236 = _1046 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1238 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1240 = isnan(_866);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1246 = _1242 || _1244;
    float _1248 = float(_1246);
    float _1250 = _1224 * _1208;
    float _1252 = -_1224;
    float _1254 = _1252 + 1.0;
    bool _1256 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1258 = isnan(_866);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1264 = _1260 || _1262;
    float _1266 = float(_1264);
    float _1268 = _1248 * _1254;
    float _1270 = -_1248;
    float _1272 = _1270 + 1.0;
    bool _1274 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1276 = isnan(_866);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1288 = -_1266;
    float _1290 = _1288 + 1.0;
    float _1292 = _1266 * _1272;
    bool _1294 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1296 = isnan(_866);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1302 = _1298 || _1300;
    int _1304 = _1302 ? 1065353216 : 0;
    float _1306 = -_1284;
    float _1308 = _1306 + 1.0;
    float _1310 = _1172;
    int _1312 = as_type<int>(_1234);
    int _1314 = _1304;
    if (!_914)
    {
        _1228 = _1172;
    }
    float _1316 = _1228;
    float _1318 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1286);
    float _1320 = _1316;
    if (_914)
    {
        _1320 = _918;
    }
    float _1322 = _1320;
    if (_914)
    {
        _1310 = _918;
    }
    float _1324 = _1310;
    float _1326 = _1284 * _1290;
    float _1328 = as_type<float>(_1304) * _1308;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1332 = _866 + _1330;
    float _1334 = fma(_1204, _992, -0.5);
    float _1336 = _1128 * _1328;
    float _1338 = fma(_1174, _1332, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1342 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1346 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1350 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1340);
    float _1352 = fma(_1342, _1234, -0.5);
    float _1354 = -_1344;
    float _1356 = fma(_1346, 2.0, _1354);
    float _1358 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1348);
    float _1360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1362 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1364 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1366 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_882)
    {
        float _1368 = -_1198;
        float _1370 = _1368 + 1.0;
        _1312 = as_type<int>(_1370);
    }
    int _1372 = _1312;
    float _1374 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1362);
    float _1376 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1364);
    float _1378 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1366);
    float _1380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1382 = -as_type<float>(_1304);
    float _1384 = _1382 + 1.0;
    if (_882)
    {
        float _1386 = _1102 ? as_type<float>(_1372) : _1198;
        _1196 = _1386;
    }
    float _1388 = _1196;
    if (_888)
    {
        float _1390 = -_1198;
        float _1392 = _1390 + 1.0;
        _1314 = as_type<int>(_1392);
    }
    int _1394 = _1314;
    float _1396 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1318);
    float _1398 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _976);
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1402 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_888)
    {
        float _1404 = _1004 ? as_type<float>(_1394) : _1198;
        _1230 = _1404;
    }
    float _1406 = _1230;
    float _1408 = -_1398;
    float _1410 = fma(_1396, _1352, _1408);
    float _1412 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1376);
    float _1414 = fma(_1402, -2.0, _1400);
    float _1416 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1418 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1374);
    float _1420 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1422 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1424 = fma(_1416, _1388, -0.5);
    float _1426 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1378);
    float _1428 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1350);
    float _1430 = fma(_1422, _1406, -0.5);
    float _1432 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1104);
    float _1434 = -_102;
    float _1436 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1356);
    float _1438 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1358);
    float _1440 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1414);
    float _1442 = fma(_1432, _1424, _1076);
    float _1444 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1336);
    float _1446 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1448 = _1096 + _1420;
    float _1450 = -_1440;
    float _1452 = fma(_1438, _1334, _1450);
    float _1454 = fma(_1136, _1326, _1444);
    float _1456 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1458 = _1226 + _1446;
    float _1460 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1462 = fma(_1130, _1292, _1454);
    float _1464 = _1236 + _1456;
    float _1466 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1468 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1460);
    float _1470 = fma(_1428, _1430, _1436);
    float _1472 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1474 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1476 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1466);
    float _1478 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1468);
    float _1480 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1472);
    float _1482 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1474);
    float _1484 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1476);
    float _1486 = _1478 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1488 = fma(_1176, _1268, _1462);
    float _1490 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1480);
    float _1492 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1482);
    float _1494 = _1484 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1496 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1498 = fma(_1152, _1250, _1488);
    float _1500 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1502 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1504 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1506 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1508 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1496);
    float _1510 = fma(_1190, _1212, _1498);
    float _1512 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1500);
    float _1514 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1502);
    float _1516 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1504);
    float _1518 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1508);
    float _1520 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1522 = fma(_1338, _1194, _1510);
    float _1524 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1512);
    float _1526 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1514);
    float _1528 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1516);
    float _1530 = _1470 + 0.5;
    float _1532 = _1410 + 0.5;
    float _1534 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1518);
    float _1536 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1522);
    float _1538 = _1442 + 0.5;
    float _1540 = _1452 + 0.5;
    float _1542 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1524);
    float _1544 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1526);
    float _1546 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1528);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_49.x = _1538;
    out.m_49.y = _1532;
    out.m_49.z = _1530;
    out.m_49.w = _1540;
    out.m_51.x = _1536;
    out.gl_Position.x = _1542;
    out.gl_Position.y = _1534;
    out.gl_Position.z = _1544;
    out.gl_Position.w = _1546;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _858 = false;
    bool _540 = false;
    bool _436 = false;
    bool _268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_26.w;
    float _67 = trunc(_65);
    int _70 = int(_67);
    bool _74 = _70 >= 1;
    float _76 = 0.0;
    if (!_74)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _76;
    if (!_74)
    {
        out.m_29.x = 0.0;
    }
    int _80 = 0;
    if (!_74)
    {
        float _82 = _78 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_74)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1602 = as_type<float>(_84);
        out.gl_Position.z = _1602;
    }
    if (!_74)
    {
        return out;
    }
    float _88 = in.m_31.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = 0.0;
    if (_98)
    {
        float _106 = float(_70);
        _104 = _106;
    }
    float _108 = _104;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    float _116 = 0.0;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _122 = _118 * 5.0;
        _86 = as_type<int>(_122);
    }
    int _124 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1671 = as_type<float>(_124);
        out.gl_Position.z = _1671;
    }
    if (_114)
    {
        return out;
    }
    float _126 = in.m_33.w;
    float _128 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _130 = in.m_35.w;
    bool _132 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _134 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = in.m_31.x;
    float _144 = in.m_31.y;
    float _146 = in.m_31.z;
    float _148 = in.m_26.x;
    float _150 = in.m_26.y;
    float _152 = in.m_26.z;
    float _154 = _128;
    if (!_140)
    {
        float _156 = _128 * _128;
        float _158 = _156 * 0.5;
        _120 = _158;
    }
    float _160 = _120;
    float _162 = _160;
    if (!_140)
    {
        float _164 = _160 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _162 = _164;
    }
    float _166 = _162;
    out.m_37.w = _126;
    bool _168 = !_140;
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
    bool _204 = !_140;
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
    bool _228 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _230 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _232 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _234 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _236 = fma(_226, _142, _230);
    float _238 = fma(_226, _144, _232);
    float _240 = fma(_226, _146, _234);
    float _242 = fma(_236, _130, _148);
    float _244 = fma(_238, _130, _150);
    float _246 = fma(_240, _130, _152);
    bool _248 = !_228;
    float _266;
    if (!_248)
    {
        float _250 = in.m_39.x;
        float _252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _254 = _250 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _258 = _256 * _252;
        float _260 = floor(_258);
        float _262 = -_260;
        float _264 = _258 + _262;
        _266 = _264;
        _268 = true;
    }
    else
    {
        float _270 = float(_70);
        float _272 = 1.0 / _270;
        float _274 = _102 * _272;
        _266 = _274;
    }
    _268 = false;
    float _276 = _266;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _286 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _288 = isnan(_276);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = 1.0 / _280;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _304 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _306 = isnan(_276);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _316;
    float _320 = -_296;
    float _322 = _320 + 1.0;
    bool _324 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _326 = isnan(_276);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    bool _336 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _338 = 1.0 / _284;
    float _340 = _314 * _322;
    float _342 = -_314;
    float _344 = _342 + 1.0;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _350 = _334 * _344;
    float _352 = -_334;
    float _354 = _352 + 1.0;
    float _356 = 1.0 / _302;
    float _358 = _318 * _298;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _362 = _276 + _360;
    float _364 = fma(_358, _362, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _368 = _276 + _366;
    float _370 = _348 * _338;
    bool _372 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _374 = isnan(_276);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _384;
    float _388 = _364 * _350;
    float _390 = fma(_370, _368, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _394 = _276 + _392;
    float _396 = -_382;
    float _398 = _396 + 1.0;
    float _400 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[115].x, _388);
    float _402 = _386 * _356;
    float _404 = _296 * _398;
    float _406 = fma(_390, _340, _400);
    float _408 = fma(_402, _394, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _410 = fma(_408, _404, _406);
    float _412 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[118].x, _410);
    float _414 = _412 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.w = _414;
    bool _416 = !_336;
    float _434;
    if (!_416)
    {
        float _418 = in.m_39.x;
        float _420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _422 = _418 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _424 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _426 = _424 * _420;
        float _428 = floor(_426);
        float _430 = -_428;
        float _432 = _426 + _430;
        _434 = _432;
        _436 = true;
    }
    else
    {
        float _438 = float(_70);
        float _440 = 1.0 / _438;
        float _442 = _102 * _440;
        _434 = _442;
    }
    _436 = false;
    float _444 = _434;
    bool _446 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _448 = isnan(_444);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _462 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _464 = isnan(_444);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _480 = _444 + _478;
    float _482 = 1.0 / _460;
    float _484 = -_456;
    float _486 = _484 + 1.0;
    bool _488 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _490 = _472 * _486;
    float _492 = -_472;
    float _494 = _492 + 1.0;
    float _496 = _476 * _482;
    float _498 = fma(_496, _480, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _500 = _498 * _490;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _506 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[131].x, _500);
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _510 = _502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _512 = _504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _514 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[132].x, _506);
    float _516 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = _514 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_43.x = _510;
    out.m_43.y = _512;
    out.m_43.z = _516;
    out.m_43.w = _518;
    bool _520 = !_488;
    float _538;
    if (!_520)
    {
        float _522 = in.m_39.x;
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _526 = _522 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _530 = _528 * _524;
        float _532 = floor(_530);
        float _534 = -_532;
        float _536 = _530 + _534;
        _538 = _536;
        _540 = true;
    }
    else
    {
        float _542 = float(_70);
        float _544 = 1.0 / _542;
        float _546 = _102 * _544;
        _538 = _546;
    }
    _540 = false;
    float _548 = _538;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _552 = _548 + _550;
    bool _554 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _556 = isnan(_548);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _570 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _572 = isnan(_548);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _582;
    bool _586 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _588 = isnan(_548);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -_564;
    float _600 = _598 + 1.0;
    float _602 = 1.0 / _568;
    bool _604 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _606 = isnan(_548);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -_596;
    float _618 = _616 + 1.0;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _624 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _626 = 1.0 / _622;
    float _628 = _584 * _602;
    float _630 = -_580;
    float _632 = _630 + 1.0;
    float _634 = _580 * _600;
    bool _636 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _638 = isnan(_548);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = fma(_628, _552, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _650 = _596 * _632;
    float _652 = _614 * _618;
    float _654 = -_614;
    float _656 = _654 + 1.0;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _662 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _664 = isnan(_548);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    float _674 = _646 * _656;
    float _676 = -_646;
    float _678 = _676 + 1.0;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _684 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _686 = isnan(_548);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = 1.0 / _660;
    float _698 = _672 * _678;
    float _700 = -_672;
    float _702 = _700 + 1.0;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _708 = _694 * _702;
    float _710 = 1.0 / _682;
    float _712 = _706 * _626;
    float _714 = -_694;
    float _716 = _714 + 1.0;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _722;
    float _726 = 1.0 / _720;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _732 = _648 * _708;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _736 = _548 + _734;
    float _738 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[159].x, _732);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _744 = 1.0 / _730;
    float _746 = fma(_712, _736, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _748 = _724 * _710;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _752 = _548 + _750;
    float _754 = fma(_746, _698, _738);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _758 = _548 + _756;
    float _760 = fma(_748, _752, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _762 = 1.0 / _742;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _776 = _766 * _696;
    float _778 = fma(_760, _674, _754);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _782 = _548 + _780;
    float _784 = _770 * _744;
    float _786 = fma(_776, _758, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _788;
    bool _792 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _794 = isnan(_548);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = _774 * _726;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _808 = _548 + _806;
    float _810 = fma(_784, _782, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _812 = fma(_786, _652, _778);
    float _814 = _790 * _762;
    float _816 = fma(_804, _808, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _818 = -_802;
    float _820 = _818 + 1.0;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _824 = _548 + _822;
    float _826 = fma(_810, _650, _812);
    float _828 = _564 * _820;
    float _830 = fma(_814, _824, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _832 = fma(_816, _634, _826);
    float _834 = fma(_830, _828, _832);
    float _836 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[166].x, _834);
    out.m_45.x = _836;
    bool _838 = !_624;
    float _856;
    if (!_838)
    {
        float _840 = in.m_39.x;
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _844 = _840 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[14].y, _102);
        float _848 = _846 * _842;
        float _850 = floor(_848);
        float _852 = -_850;
        float _854 = _848 + _852;
        _856 = _854;
        _858 = true;
    }
    else
    {
        float _860 = float(_70);
        float _862 = 1.0 / _860;
        float _864 = _102 * _862;
        _856 = _864;
    }
    _858 = false;
    float _866 = _856;
    float _868 = in.m_39.w;
    float _870 = _244 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _872 = _244 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _874 = in.m_35.x;
    float _876 = in.m_35.y;
    float _878 = in.m_35.z;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _882 = _880 != 0;
    float _884 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].x, _870);
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _888 = _886 != 0;
    float _890 = in.m_39.x;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _894 = _892 != 0;
    float _896 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].x, _872);
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _900 = _898 != 0;
    float _902 = in.m_47.x;
    float _904 = in.m_47.y;
    float _906 = in.m_47.z;
    float _908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _910 = in.m_33.x;
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _914 = _912 != 0;
    float _916 = _244 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _918 = in.m_39.y;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _924 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].x, _916);
    float _926 = 0.0;
    if (_888)
    {
        float _928 = in.m_39.z;
        _926 = _928;
    }
    float _930 = _926;
    bool _932 = _868 > 0.5;
    float _934 = 1.0 / _922;
    float _936 = _874 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _938 = _876 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _946 = 1.0 / _942;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _950 = _948 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _952 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _902);
    float _954 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _906);
    float _956 = _878 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _964 = _918 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _970 = _890 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _972 = 1.0 / _950;
    float _974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _904);
    float _976 = fma(_964, -2.0, _962);
    float _978 = -_944;
    float _980 = fma(_970, 2.0, _978);
    float _982 = in.m_33.y;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _988 = 1.0 / _960;
    float _990 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].z, _924);
    float _992 = _908 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _994;
    bool _998 = false;
    bool _1000 = _932;
    if (_888)
    {
        bool _1002 = _930 > 0.5;
        _998 = _1002;
    }
    bool _1004 = _998;
    float _1006 = _938 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1008 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1010 = isnan(_866);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = 1.0 / _968;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1030 = _996 * _972;
    float _1032 = _1006 * _974;
    float _1034 = -_1018;
    float _1036 = _1034 + 1.0;
    float _1038 = _1028 * _946;
    float _1040 = _936 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1042 = 1.0 / _986;
    float _1044 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].z, _884);
    float _1046 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].z, _896);
    float _1048 = _1024 * _934;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1054 = -_982;
    float _1056 = _1054 + 1.0;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1066 = _1052 * _1020;
    float _1068 = _1060 * _988;
    float _1070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1072 = _932 ? as_type<int>(_1056) : as_type<int>(_982);
    float _1074 = -_102;
    float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[76].x, _980);
    float _1078 = _1064 * _1042;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1088 = _1040;
    float _1090 = _1078;
    float _1092 = _982;
    if (!_914)
    {
        _1086 = _918;
    }
    float _1094 = _1086;
    float _1096 = _1044 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1098 = _1094;
    if (_882)
    {
        bool _1100 = _890 > 0.5;
        _1000 = _1100;
    }
    bool _1102 = _1000;
    float _1104 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1080);
    if (_914)
    {
        _1098 = _890;
    }
    float _1106 = _1098;
    float _1108 = 1.0 / _1084;
    float _1110 = _956 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1114 = _866 + _1112;
    float _1116 = _1040 * _952;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1120 = _866 + _1118;
    float _1122 = _1110 * _954;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1126 = _866 + _1124;
    float _1128 = fma(_1048, _1114, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1130 = fma(_1030, _1120, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1132;
    float _1136 = fma(_1038, _1126, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1140 = _866 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1144 = _866 + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1148 = _866 + _1146;
    if (!_882)
    {
        _1088 = _910;
    }
    float _1150 = _1088;
    float _1152 = fma(_1068, _1140, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _1154 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1156 = isnan(_866);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[174].x;
    float _1168 = _1150;
    if (!_914)
    {
        float _1170 = in.m_39.z;
        _1166 = _1170;
    }
    float _1172 = _1166;
    float _1174 = _1134 * _1108;
    float _1176 = fma(_1066, _1144, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    bool _1178 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1180 = isnan(_866);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = fma(_1078, _1148, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    if (!_882)
    {
        _1090 = _1150;
    }
    float _1192 = _1090;
    float _1194 = _1164 * _1036;
    float _1196 = _1192;
    if (_882)
    {
        _1168 = _910;
    }
    float _1198 = _1168;
    float _1200 = -_1164;
    float _1202 = _1200 + 1.0;
    float _1204 = _894 ? as_type<float>(_1072) : _982;
    float _1206 = -_1188;
    float _1208 = _1206 + 1.0;
    bool _1210 = _918 > 0.5;
    float _1212 = _1188 * _1202;
    bool _1214 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1216 = isnan(_866);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = _990 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1228 = _1202;
    float _1230 = _1198;
    if (_900)
    {
        float _1232 = _1210 ? _1056 : _982;
        _1092 = _1232;
    }
    float _1234 = _1092;
    float _1236 = _1046 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1238 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1240 = isnan(_866);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1246 = _1242 || _1244;
    float _1248 = float(_1246);
    float _1250 = _1224 * _1208;
    float _1252 = -_1224;
    float _1254 = _1252 + 1.0;
    bool _1256 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1258 = isnan(_866);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1264 = _1260 || _1262;
    float _1266 = float(_1264);
    float _1268 = _1248 * _1254;
    float _1270 = -_1248;
    float _1272 = _1270 + 1.0;
    bool _1274 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1276 = isnan(_866);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1288 = -_1266;
    float _1290 = _1288 + 1.0;
    float _1292 = _1266 * _1272;
    bool _1294 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1296 = isnan(_866);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1302 = _1298 || _1300;
    int _1304 = _1302 ? 1065353216 : 0;
    float _1306 = -_1284;
    float _1308 = _1306 + 1.0;
    float _1310 = _1172;
    int _1312 = as_type<int>(_1234);
    int _1314 = _1304;
    if (!_914)
    {
        _1228 = _1172;
    }
    float _1316 = _1228;
    float _1318 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1286);
    float _1320 = _1316;
    if (_914)
    {
        _1320 = _918;
    }
    float _1322 = _1320;
    if (_914)
    {
        _1310 = _918;
    }
    float _1324 = _1310;
    float _1326 = _1284 * _1290;
    float _1328 = as_type<float>(_1304) * _1308;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1332 = _866 + _1330;
    float _1334 = fma(_1204, _992, -0.5);
    float _1336 = _1128 * _1328;
    float _1338 = fma(_1174, _1332, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1342 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1346 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1350 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1340);
    float _1352 = fma(_1342, _1234, -0.5);
    float _1354 = -_1344;
    float _1356 = fma(_1346, 2.0, _1354);
    float _1358 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1348);
    float _1360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1362 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1364 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1366 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_882)
    {
        float _1368 = -_1198;
        float _1370 = _1368 + 1.0;
        _1312 = as_type<int>(_1370);
    }
    int _1372 = _1312;
    float _1374 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1362);
    float _1376 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1364);
    float _1378 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1366);
    float _1380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1382 = -as_type<float>(_1304);
    float _1384 = _1382 + 1.0;
    if (_882)
    {
        float _1386 = _1102 ? as_type<float>(_1372) : _1198;
        _1196 = _1386;
    }
    float _1388 = _1196;
    if (_888)
    {
        float _1390 = -_1198;
        float _1392 = _1390 + 1.0;
        _1314 = as_type<int>(_1392);
    }
    int _1394 = _1314;
    float _1396 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1318);
    float _1398 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _976);
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1402 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_888)
    {
        float _1404 = _1004 ? as_type<float>(_1394) : _1198;
        _1230 = _1404;
    }
    float _1406 = _1230;
    float _1408 = -_1398;
    float _1410 = fma(_1396, _1352, _1408);
    float _1412 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1376);
    float _1414 = fma(_1402, -2.0, _1400);
    float _1416 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1418 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1374);
    float _1420 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1422 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1424 = fma(_1416, _1388, -0.5);
    float _1426 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1378);
    float _1428 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1350);
    float _1430 = fma(_1422, _1406, -0.5);
    float _1432 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1104);
    float _1434 = -_102;
    float _1436 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1356);
    float _1438 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1358);
    float _1440 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1414);
    float _1442 = fma(_1432, _1424, _1076);
    float _1444 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1336);
    float _1446 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1448 = _1096 + _1420;
    float _1450 = -_1440;
    float _1452 = fma(_1438, _1334, _1450);
    float _1454 = fma(_1136, _1326, _1444);
    float _1456 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1458 = _1226 + _1446;
    float _1460 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1462 = fma(_1130, _1292, _1454);
    float _1464 = _1236 + _1456;
    float _1466 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1468 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1460);
    float _1470 = fma(_1428, _1430, _1436);
    float _1472 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1474 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1476 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1466);
    float _1478 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1468);
    float _1480 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1472);
    float _1482 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1474);
    float _1484 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1476);
    float _1486 = _1478 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1488 = fma(_1176, _1268, _1462);
    float _1490 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1480);
    float _1492 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1482);
    float _1494 = _1484 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1496 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1498 = fma(_1152, _1250, _1488);
    float _1500 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1502 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1504 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1506 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1508 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1496);
    float _1510 = fma(_1190, _1212, _1498);
    float _1512 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1500);
    float _1514 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1502);
    float _1516 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1504);
    float _1518 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1508);
    float _1520 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1522 = fma(_1338, _1194, _1510);
    float _1524 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1512);
    float _1526 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1514);
    float _1528 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1516);
    float _1530 = _1470 + 0.5;
    float _1532 = _1410 + 0.5;
    float _1534 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1518);
    float _1536 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1522);
    float _1538 = _1442 + 0.5;
    float _1540 = _1452 + 0.5;
    float _1542 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1524);
    float _1544 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1526);
    float _1546 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1528);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_49.x = _1538;
    out.m_49.y = _1532;
    out.m_49.z = _1530;
    out.m_49.w = _1540;
    out.m_51.x = _1536;
    out.gl_Position.x = _1542;
    out.gl_Position.y = _1534;
    out.gl_Position.z = _1544;
    out.gl_Position.w = _1546;
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
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _858 = false;
    bool _540 = false;
    bool _436 = false;
    bool _268 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_26.w;
    float _67 = trunc(_65);
    int _70 = int(_67);
    bool _74 = _70 >= 1;
    float _76 = 0.0;
    if (!_74)
    {
        _76 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _78 = _76;
    if (!_74)
    {
        out.m_29.x = 0.0;
    }
    int _80 = 0;
    if (!_74)
    {
        float _82 = _78 * 5.0;
        _80 = as_type<int>(_82);
    }
    int _84 = _80;
    int _86 = _84;
    if (!_74)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1602 = as_type<float>(_84);
        out.gl_Position.z = _1602;
    }
    if (!_74)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _88 = in.m_31.w;
    bool _90 = _88 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _92 = isnan(_88);
    bool _94 = _90 || _92;
    bool _96 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _98 = _94 || _96;
    float _100 = -_88;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _104 = 0.0;
    if (_98)
    {
        float _106 = float(_70);
        _104 = _106;
    }
    float _108 = _104;
    bool _110 = _102 >= _108;
    bool _112 = !_98;
    bool _114 = _110 || _112;
    float _116 = 0.0;
    if (_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (_114)
    {
        out.m_29.x = 0.0;
    }
    if (_114)
    {
        float _122 = _118 * 5.0;
        _86 = as_type<int>(_122);
    }
    int _124 = _86;
    if (_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1671 = as_type<float>(_124);
        out.gl_Position.z = _1671;
    }
    if (_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_33.w;
    float _128 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _130 = in.m_35.w;
    bool _132 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _134 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = in.m_31.x;
    float _144 = in.m_31.y;
    float _146 = in.m_31.z;
    float _148 = in.m_26.x;
    float _150 = in.m_26.y;
    float _152 = in.m_26.z;
    float _154 = _128;
    if (!_140)
    {
        float _156 = _128 * _128;
        float _158 = _156 * 0.5;
        _120 = _158;
    }
    float _160 = _120;
    float _162 = _160;
    if (!_140)
    {
        float _164 = _160 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _162 = _164;
    }
    float _166 = _162;
    out.m_37.w = _126;
    bool _168 = !_140;
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
    bool _204 = !_140;
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
    bool _228 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _230 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _232 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _234 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _236 = fma(_226, _142, _230);
    float _238 = fma(_226, _144, _232);
    float _240 = fma(_226, _146, _234);
    float _242 = fma(_236, _130, _148);
    float _244 = fma(_238, _130, _150);
    float _246 = fma(_240, _130, _152);
    bool _248 = !_228;
    float _266;
    if (!_248)
    {
        float _250 = in.m_39.x;
        float _252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _254 = _250 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[11].y, _102);
        float _258 = _256 * _252;
        float _260 = floor(_258);
        float _262 = -_260;
        float _264 = _258 + _262;
        _266 = _264;
        _268 = true;
    }
    else
    {
        float _270 = float(_70);
        float _272 = 1.0 / _270;
        float _274 = _102 * _272;
        _266 = _274;
    }
    _268 = false;
    float _276 = _266;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _286 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _288 = isnan(_276);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = 1.0 / _280;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _304 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _306 = isnan(_276);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _316;
    float _320 = -_296;
    float _322 = _320 + 1.0;
    bool _324 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _326 = isnan(_276);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    bool _336 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _338 = 1.0 / _284;
    float _340 = _314 * _322;
    float _342 = -_314;
    float _344 = _342 + 1.0;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _350 = _334 * _344;
    float _352 = -_334;
    float _354 = _352 + 1.0;
    float _356 = 1.0 / _302;
    float _358 = _318 * _298;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _362 = _276 + _360;
    float _364 = fma(_358, _362, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _368 = _276 + _366;
    float _370 = _348 * _338;
    bool _372 = _276 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _374 = isnan(_276);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _384;
    float _388 = _364 * _350;
    float _390 = fma(_370, _368, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _394 = _276 + _392;
    float _396 = -_382;
    float _398 = _396 + 1.0;
    float _400 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[115].x, _388);
    float _402 = _386 * _356;
    float _404 = _296 * _398;
    float _406 = fma(_390, _340, _400);
    float _408 = fma(_402, _394, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _410 = fma(_408, _404, _406);
    float _412 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[118].x, _410);
    float _414 = _412 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_41.w = _414;
    bool _416 = !_336;
    float _434;
    if (!_416)
    {
        float _418 = in.m_39.x;
        float _420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _422 = _418 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _424 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _426 = _424 * _420;
        float _428 = floor(_426);
        float _430 = -_428;
        float _432 = _426 + _430;
        _434 = _432;
        _436 = true;
    }
    else
    {
        float _438 = float(_70);
        float _440 = 1.0 / _438;
        float _442 = _102 * _440;
        _434 = _442;
    }
    _436 = false;
    float _444 = _434;
    bool _446 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _448 = isnan(_444);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _462 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _464 = isnan(_444);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _480 = _444 + _478;
    float _482 = 1.0 / _460;
    float _484 = -_456;
    float _486 = _484 + 1.0;
    bool _488 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _490 = _472 * _486;
    float _492 = -_472;
    float _494 = _492 + 1.0;
    float _496 = _476 * _482;
    float _498 = fma(_496, _480, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _500 = _498 * _490;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _506 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[131].x, _500);
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _510 = _502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _512 = _504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _514 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[132].x, _506);
    float _516 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = _514 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_43.x = _510;
    out.m_43.y = _512;
    out.m_43.z = _516;
    out.m_43.w = _518;
    bool _520 = !_488;
    float _538;
    if (!_520)
    {
        float _522 = in.m_39.x;
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _526 = _522 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _530 = _528 * _524;
        float _532 = floor(_530);
        float _534 = -_532;
        float _536 = _530 + _534;
        _538 = _536;
        _540 = true;
    }
    else
    {
        float _542 = float(_70);
        float _544 = 1.0 / _542;
        float _546 = _102 * _544;
        _538 = _546;
    }
    _540 = false;
    float _548 = _538;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _552 = _548 + _550;
    bool _554 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _556 = isnan(_548);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _570 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _572 = isnan(_548);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _582;
    bool _586 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _588 = isnan(_548);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -_564;
    float _600 = _598 + 1.0;
    float _602 = 1.0 / _568;
    bool _604 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _606 = isnan(_548);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -_596;
    float _618 = _616 + 1.0;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _624 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _626 = 1.0 / _622;
    float _628 = _584 * _602;
    float _630 = -_580;
    float _632 = _630 + 1.0;
    float _634 = _580 * _600;
    bool _636 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _638 = isnan(_548);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = fma(_628, _552, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _650 = _596 * _632;
    float _652 = _614 * _618;
    float _654 = -_614;
    float _656 = _654 + 1.0;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _662 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _664 = isnan(_548);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    float _674 = _646 * _656;
    float _676 = -_646;
    float _678 = _676 + 1.0;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _684 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _686 = isnan(_548);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = 1.0 / _660;
    float _698 = _672 * _678;
    float _700 = -_672;
    float _702 = _700 + 1.0;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _708 = _694 * _702;
    float _710 = 1.0 / _682;
    float _712 = _706 * _626;
    float _714 = -_694;
    float _716 = _714 + 1.0;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _722;
    float _726 = 1.0 / _720;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _732 = _648 * _708;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _736 = _548 + _734;
    float _738 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[159].x, _732);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _744 = 1.0 / _730;
    float _746 = fma(_712, _736, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _748 = _724 * _710;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _752 = _548 + _750;
    float _754 = fma(_746, _698, _738);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _758 = _548 + _756;
    float _760 = fma(_748, _752, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _762 = 1.0 / _742;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _774 = _772 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _776 = _766 * _696;
    float _778 = fma(_760, _674, _754);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _782 = _548 + _780;
    float _784 = _770 * _744;
    float _786 = fma(_776, _758, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _788;
    bool _792 = _548 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _794 = isnan(_548);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = _774 * _726;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _808 = _548 + _806;
    float _810 = fma(_784, _782, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _812 = fma(_786, _652, _778);
    float _814 = _790 * _762;
    float _816 = fma(_804, _808, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _818 = -_802;
    float _820 = _818 + 1.0;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _824 = _548 + _822;
    float _826 = fma(_810, _650, _812);
    float _828 = _564 * _820;
    float _830 = fma(_814, _824, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _832 = fma(_816, _634, _826);
    float _834 = fma(_830, _828, _832);
    float _836 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[166].x, _834);
    out.m_45.x = _836;
    bool _838 = !_624;
    float _856;
    if (!_838)
    {
        float _840 = in.m_39.x;
        float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _844 = _840 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[14].y, _102);
        float _848 = _846 * _842;
        float _850 = floor(_848);
        float _852 = -_850;
        float _854 = _848 + _852;
        _856 = _854;
        _858 = true;
    }
    else
    {
        float _860 = float(_70);
        float _862 = 1.0 / _860;
        float _864 = _102 * _862;
        _856 = _864;
    }
    _858 = false;
    float _866 = _856;
    float _868 = in.m_39.w;
    float _870 = _244 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _872 = _244 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _874 = in.m_35.x;
    float _876 = in.m_35.y;
    float _878 = in.m_35.z;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _882 = _880 != 0;
    float _884 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[5].x, _870);
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _888 = _886 != 0;
    float _890 = in.m_39.x;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _894 = _892 != 0;
    float _896 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[6].x, _872);
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _900 = _898 != 0;
    float _902 = in.m_47.x;
    float _904 = in.m_47.y;
    float _906 = in.m_47.z;
    float _908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _910 = in.m_33.x;
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _914 = _912 != 0;
    float _916 = _244 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _918 = in.m_39.y;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _924 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[4].x, _916);
    float _926 = 0.0;
    if (_888)
    {
        float _928 = in.m_39.z;
        _926 = _928;
    }
    float _930 = _926;
    bool _932 = _868 > 0.5;
    float _934 = 1.0 / _922;
    float _936 = _874 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _938 = _876 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _946 = 1.0 / _942;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _950 = _948 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _952 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _902);
    float _954 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _906);
    float _956 = _878 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _964 = _918 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _970 = _890 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _972 = 1.0 / _950;
    float _974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _904);
    float _976 = fma(_964, -2.0, _962);
    float _978 = -_944;
    float _980 = fma(_970, 2.0, _978);
    float _982 = in.m_33.y;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _988 = 1.0 / _960;
    float _990 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].z, _924);
    float _992 = _908 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _994;
    bool _998 = false;
    bool _1000 = _932;
    if (_888)
    {
        bool _1002 = _930 > 0.5;
        _998 = _1002;
    }
    bool _1004 = _998;
    float _1006 = _938 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1008 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1010 = isnan(_866);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = 1.0 / _968;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1030 = _996 * _972;
    float _1032 = _1006 * _974;
    float _1034 = -_1018;
    float _1036 = _1034 + 1.0;
    float _1038 = _1028 * _946;
    float _1040 = _936 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1042 = 1.0 / _986;
    float _1044 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].z, _884);
    float _1046 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].z, _896);
    float _1048 = _1024 * _934;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1054 = -_982;
    float _1056 = _1054 + 1.0;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1066 = _1052 * _1020;
    float _1068 = _1060 * _988;
    float _1070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1072 = _932 ? as_type<int>(_1056) : as_type<int>(_982);
    float _1074 = -_102;
    float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[76].x, _980);
    float _1078 = _1064 * _1042;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1088 = _1040;
    float _1090 = _1078;
    float _1092 = _982;
    if (!_914)
    {
        _1086 = _918;
    }
    float _1094 = _1086;
    float _1096 = _1044 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1098 = _1094;
    if (_882)
    {
        bool _1100 = _890 > 0.5;
        _1000 = _1100;
    }
    bool _1102 = _1000;
    float _1104 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1080);
    if (_914)
    {
        _1098 = _890;
    }
    float _1106 = _1098;
    float _1108 = 1.0 / _1084;
    float _1110 = _956 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1114 = _866 + _1112;
    float _1116 = _1040 * _952;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1120 = _866 + _1118;
    float _1122 = _1110 * _954;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1126 = _866 + _1124;
    float _1128 = fma(_1048, _1114, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1130 = fma(_1030, _1120, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1132;
    float _1136 = fma(_1038, _1126, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1140 = _866 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1144 = _866 + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1148 = _866 + _1146;
    if (!_882)
    {
        _1088 = _910;
    }
    float _1150 = _1088;
    float _1152 = fma(_1068, _1140, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _1154 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1156 = isnan(_866);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[174].x;
    float _1168 = _1150;
    if (!_914)
    {
        float _1170 = in.m_39.z;
        _1166 = _1170;
    }
    float _1172 = _1166;
    float _1174 = _1134 * _1108;
    float _1176 = fma(_1066, _1144, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    bool _1178 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1180 = isnan(_866);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = fma(_1078, _1148, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    if (!_882)
    {
        _1090 = _1150;
    }
    float _1192 = _1090;
    float _1194 = _1164 * _1036;
    float _1196 = _1192;
    if (_882)
    {
        _1168 = _910;
    }
    float _1198 = _1168;
    float _1200 = -_1164;
    float _1202 = _1200 + 1.0;
    float _1204 = _894 ? as_type<float>(_1072) : _982;
    float _1206 = -_1188;
    float _1208 = _1206 + 1.0;
    bool _1210 = _918 > 0.5;
    float _1212 = _1188 * _1202;
    bool _1214 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1216 = isnan(_866);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = _990 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1228 = _1202;
    float _1230 = _1198;
    if (_900)
    {
        float _1232 = _1210 ? _1056 : _982;
        _1092 = _1232;
    }
    float _1234 = _1092;
    float _1236 = _1046 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1238 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1240 = isnan(_866);
    bool _1242 = _1238 || _1240;
    bool _1244 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1246 = _1242 || _1244;
    float _1248 = float(_1246);
    float _1250 = _1224 * _1208;
    float _1252 = -_1224;
    float _1254 = _1252 + 1.0;
    bool _1256 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1258 = isnan(_866);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1264 = _1260 || _1262;
    float _1266 = float(_1264);
    float _1268 = _1248 * _1254;
    float _1270 = -_1248;
    float _1272 = _1270 + 1.0;
    bool _1274 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1276 = isnan(_866);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1282 = _1278 || _1280;
    float _1284 = float(_1282);
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1288 = -_1266;
    float _1290 = _1288 + 1.0;
    float _1292 = _1266 * _1272;
    bool _1294 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1296 = isnan(_866);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1302 = _1298 || _1300;
    int _1304 = _1302 ? 1065353216 : 0;
    float _1306 = -_1284;
    float _1308 = _1306 + 1.0;
    float _1310 = _1172;
    int _1312 = as_type<int>(_1234);
    int _1314 = _1304;
    if (!_914)
    {
        _1228 = _1172;
    }
    float _1316 = _1228;
    float _1318 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1286);
    float _1320 = _1316;
    if (_914)
    {
        _1320 = _918;
    }
    float _1322 = _1320;
    if (_914)
    {
        _1310 = _918;
    }
    float _1324 = _1310;
    float _1326 = _1284 * _1290;
    float _1328 = as_type<float>(_1304) * _1308;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1332 = _866 + _1330;
    float _1334 = fma(_1204, _992, -0.5);
    float _1336 = _1128 * _1328;
    float _1338 = fma(_1174, _1332, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1342 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1346 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1350 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1340);
    float _1352 = fma(_1342, _1234, -0.5);
    float _1354 = -_1344;
    float _1356 = fma(_1346, 2.0, _1354);
    float _1358 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1348);
    float _1360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1362 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1364 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1366 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_882)
    {
        float _1368 = -_1198;
        float _1370 = _1368 + 1.0;
        _1312 = as_type<int>(_1370);
    }
    int _1372 = _1312;
    float _1374 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1362);
    float _1376 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1364);
    float _1378 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1366);
    float _1380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1382 = -as_type<float>(_1304);
    float _1384 = _1382 + 1.0;
    if (_882)
    {
        float _1386 = _1102 ? as_type<float>(_1372) : _1198;
        _1196 = _1386;
    }
    float _1388 = _1196;
    if (_888)
    {
        float _1390 = -_1198;
        float _1392 = _1390 + 1.0;
        _1314 = as_type<int>(_1392);
    }
    int _1394 = _1314;
    float _1396 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1318);
    float _1398 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _976);
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1402 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_888)
    {
        float _1404 = _1004 ? as_type<float>(_1394) : _1198;
        _1230 = _1404;
    }
    float _1406 = _1230;
    float _1408 = -_1398;
    float _1410 = fma(_1396, _1352, _1408);
    float _1412 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1376);
    float _1414 = fma(_1402, -2.0, _1400);
    float _1416 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1418 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1374);
    float _1420 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1422 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1424 = fma(_1416, _1388, -0.5);
    float _1426 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1378);
    float _1428 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1350);
    float _1430 = fma(_1422, _1406, -0.5);
    float _1432 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1104);
    float _1434 = -_102;
    float _1436 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1356);
    float _1438 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1358);
    float _1440 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1414);
    float _1442 = fma(_1432, _1424, _1076);
    float _1444 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1336);
    float _1446 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1448 = _1096 + _1420;
    float _1450 = -_1440;
    float _1452 = fma(_1438, _1334, _1450);
    float _1454 = fma(_1136, _1326, _1444);
    float _1456 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1458 = _1226 + _1446;
    float _1460 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1462 = fma(_1130, _1292, _1454);
    float _1464 = _1236 + _1456;
    float _1466 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1468 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1460);
    float _1470 = fma(_1428, _1430, _1436);
    float _1472 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1474 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1476 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1466);
    float _1478 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1468);
    float _1480 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1472);
    float _1482 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1474);
    float _1484 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1476);
    float _1486 = _1478 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1488 = fma(_1176, _1268, _1462);
    float _1490 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1480);
    float _1492 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1482);
    float _1494 = _1484 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1496 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1498 = fma(_1152, _1250, _1488);
    float _1500 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1502 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1504 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1506 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1508 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1496);
    float _1510 = fma(_1190, _1212, _1498);
    float _1512 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1500);
    float _1514 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1502);
    float _1516 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1504);
    float _1518 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1508);
    float _1520 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1522 = fma(_1338, _1194, _1510);
    float _1524 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1512);
    float _1526 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1514);
    float _1528 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1516);
    float _1530 = _1470 + 0.5;
    float _1532 = _1410 + 0.5;
    float _1534 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1518);
    float _1536 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1522);
    float _1538 = _1442 + 0.5;
    float _1540 = _1452 + 0.5;
    float _1542 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1524);
    float _1544 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1526);
    float _1546 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1528);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_49.x = _1538;
    out.m_49.y = _1532;
    out.m_49.z = _1530;
    out.m_49.w = _1540;
    out.m_51.x = _1536;
    out.gl_Position.x = _1542;
    out.gl_Position.y = _1534;
    out.gl_Position.z = _1544;
    out.gl_Position.w = _1546;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

