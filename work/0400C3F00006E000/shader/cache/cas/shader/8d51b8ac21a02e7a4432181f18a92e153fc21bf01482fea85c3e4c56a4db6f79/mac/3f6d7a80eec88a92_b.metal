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
    float4 m_47 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_43 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
    float4 m_45 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    bool _354 = false;
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
        float _995 = as_type<float>(_88);
        out.gl_Position.z = _995;
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
    float _108 = 0.0;
    if (_102)
    {
        float _110 = float(_72);
        _108 = _110;
    }
    float _112 = _108;
    bool _114 = _106 >= _112;
    bool _116 = !_102;
    bool _118 = _114 || _116;
    if (_118)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _82;
    if (_118)
    {
        out.m_33.x = 0.0;
    }
    if (_118)
    {
        float _122 = _120 * 5.0;
        _90 = as_type<int>(_122);
    }
    int _124 = _90;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1063 = as_type<float>(_124);
        out.gl_Position.z = _1063;
    }
    if (_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_37.x;
    float _128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _130 = _106 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _132 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _134 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _136 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _138 = _134 || _136;
    bool _140 = isnan(1.0);
    bool _142 = _138 || _140;
    int _144 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _146 = _144 != 0;
    float _148 = _130 * _128;
    float _150 = 0.0;
    float _152 = _132;
    if (!_142)
    {
        float _154 = _132 * _132;
        float _156 = _154 * 0.5;
        _150 = _156;
    }
    float _158 = _150;
    float _160 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[20].x, _148);
    float _162 = _158;
    if (!_142)
    {
        float _164 = _158 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _162 = _164;
    }
    float _166 = _162;
    float _168 = in.m_35.x;
    float _170 = in.m_35.y;
    float _172 = in.m_35.z;
    float _174 = _160 * 6.283185482025146484375;
    float _176 = floor(_160);
    float _178 = _174 * 0.15915493667125701904296875;
    float _180 = _178 * 6.283185482025146484375;
    float _182 = cos(_180);
    float _184 = -_176;
    float _186 = _160 + _184;
    bool _188 = !_142;
    float _190 = _166;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _132 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _132);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_142;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _132 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _152 = _244;
    }
    float _246 = _152;
    float _248 = in.m_39.w;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _254 = _252 != 0;
    int _256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _258 = _256 != 0;
    float _260 = -_186;
    float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _264 = _186 < 0.5;
    float _266 = float(_264);
    float _268 = fma(_182, 0.5, 0.5);
    float _270 = in.m_30.x;
    float _272 = in.m_30.y;
    float _274 = in.m_30.z;
    bool _276 = !_254;
    int _278 = _276 ? 0 : 1;
    float _280 = -_266;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _284 = !_146;
    int _286 = _284 ? 0 : 1;
    float _288 = -_268;
    float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _292 = abs(_278);
    float _294 = fma(_246, _168, _250);
    int _296 = abs(_286);
    float _298 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _300 = !_258;
    int _302 = _300 ? 0 : 1;
    float _304 = fma(_246, _170, _298);
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _308 = abs(_302);
    float _310 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _312 = float(_292);
    float _314 = float(_296);
    float _316 = fma(_246, _172, _310);
    float _318 = abs(_262);
    float _320 = _312 * _318;
    float _322 = fma(_294, _248, _270);
    float _324 = fma(_304, _248, _272);
    float _326 = float(_308);
    float _328 = fma(_314, _290, _320);
    float _330 = fma(_316, _248, _274);
    float _332 = abs(_282);
    float _334 = fma(_326, _332, _328);
    bool _336 = !_306;
    float _352;
    if (!_336)
    {
        float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _340 = _126 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[12].x, _106);
        float _344 = _342 * _338;
        float _346 = floor(_344);
        float _348 = -_346;
        float _350 = _344 + _348;
        _352 = _350;
        _354 = true;
    }
    else
    {
        float _356 = float(_72);
        float _358 = 1.0 / _356;
        float _360 = _106 * _358;
        _352 = _360;
    }
    _354 = false;
    float _362 = _352;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _366 = _362 + _364;
    float _368 = in.m_37.y;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _378 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _380 = isnan(_362);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = 1.0 / _372;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _394 = _392 != 0;
    out.m_41.x = 1.0;
    out.m_41.y = 1.0;
    out.m_41.z = 1.0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _398 = _396 != 0;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _402 = _362 + _400;
    bool _404 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _406 = isnan(_362);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    bool _416 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _418 = isnan(_362);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = 1.0 / _376;
    bool _430 = _126 > 0.5;
    bool _432 = _430 && _394;
    float _434 = -_426;
    float _436 = _434 + 1.0;
    float _438 = _366 * _390;
    float _440 = -_388;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _448;
    float _452 = _426 * _442;
    float _454 = _414 * _436;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _456;
    float _460 = fma(_446, _438, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _462 = fma(_450, _438, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _464 = _402 * _428;
    float _466 = fma(_458, _438, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _468 = _460 * _454;
    float _470 = _462 * _454;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _476 = _466 * _454;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _482 = in.m_39.x;
    float _484 = in.m_39.y;
    float _486 = in.m_39.z;
    float _488 = -_414;
    float _490 = _488 + 1.0;
    float _492 = fma(_474, _464, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _494 = fma(_480, _464, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _496 = in.m_43.x;
    float _498 = in.m_43.y;
    float _500 = in.m_43.z;
    float _502 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[143].y, _476);
    float _504 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[143].x, _468);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _510 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[143].z, _470);
    float _512 = fma(_494, _452, _502);
    float _514 = fma(_492, _452, _504);
    float _516 = _324 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _518 = _324 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _520 = fma(_508, _464, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _522 = _324 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _524 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[145].y, _512);
    float _526 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[4].x, _516);
    float _528 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[5].x, _518);
    float _530 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[6].x, _522);
    float _532 = fma(_520, _452, _510);
    float _534 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[145].x, _514);
    float _536 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[6].z, _530);
    float _538 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[145].z, _532);
    float _540 = _524 * _484;
    float _542 = _534 * _482;
    float _544 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
    float _546 = _538 * _486;
    float _548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _498);
    float _550 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _552 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _496);
    float _554 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _556 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _500);
    float _558 = _550 * _548;
    float _560 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _562 = _554 * _552;
    float _564 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[5].z, _528);
    float _566 = _558 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _568 = _560 * _556;
    float _570 = _558 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _572 = _536 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _574 = fma(_562, (*spvDescriptorSet0.vp_c10)._m0[10].x, _566);
    float _576 = fma(_562, (*spvDescriptorSet0.vp_c10)._m0[8].x, _570);
    float _578 = _564 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _580 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[10].z, _574);
    float _582 = _544 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _584 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[8].z, _576);
    float _586 = _578 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _588 = _578 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _590 = _572 + _580;
    float _592 = _582 + _584;
    float _594 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[11].x, _586);
    float _596 = in.m_45.x;
    float _598 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _600 = _590 + _598;
    float _602 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _604 = _592 + _602;
    float _606 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[10].x, _588);
    float _608 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[11].z, _594);
    float _610 = _600 * _600;
    float _612 = in.m_45.y;
    float _614 = _608 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _616 = fma(_604, _604, _610);
    float _618 = _558 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _620 = 1.0 / _614;
    float _622 = fma(_562, (*spvDescriptorSet0.vp_c10)._m0[9].x, _618);
    float _624 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[10].z, _606);
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _632 = sqrt(_616);
    float _634 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[9].z, _622);
    float _636 = _624 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _640 = _618;
    float _642 = _558;
    float _644 = _634;
    float _646 = _568;
    if (_394)
    {
        _640 = _596;
    }
    float _648 = _640;
    float _650 = _626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _652 = _628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _630 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _656 = _368 > 0.5;
    float _658 = _648;
    if (_432)
    {
        float _660 = -_648;
        float _662 = _660 + 1.0;
        _658 = _662;
    }
    float _664 = _658;
    float _666 = -_612;
    float _668 = _666 + 1.0;
    float _670 = _578 + _634;
    float _672 = _636 + _614;
    float _674 = _612;
    float _676 = _668;
    float _678 = _664;
    if (!_394)
    {
        _642 = _596;
    }
    float _680 = _642;
    out.m_47.x = _650;
    out.m_47.y = _652;
    out.m_47.z = _654;
    out.m_47.w = _638;
    float _682 = _680;
    if (_398)
    {
        float _684 = _656 ? _668 : _612;
        _674 = _684;
    }
    float _686 = _674;
    bool _688 = _632 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (_394)
    {
        _682 = _664;
    }
    float _690 = _682;
    bool _692 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _694 = isnan(0.5);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _700 = _696 || _698;
    float _702 = _672 * _620;
    float _704 = _702 * 0.5;
    if (!_688)
    {
        _644 = _592;
    }
    float _706 = _644;
    float _708 = _706;
    if (!_688)
    {
        _676 = _590;
    }
    float _710 = _676;
    float _712 = _710;
    if (!_688)
    {
        _678 = _670;
    }
    float _714 = _678;
    bool _716 = !_688;
    float _718 = _714;
    if (!_716)
    {
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _722 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _724 = _632 + _722;
        float _726 = rsqrt(_616);
        float _728 = _724 * _720;
        float _730 = _670 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _732 = _728 * 0.15915493667125701904296875;
        float _734 = _732 * 6.283185482025146484375;
        float _736 = cos(_734);
        float _738 = _732 * 6.283185482025146484375;
        float _740 = sin(_738);
        float _742 = _736 + (-1.0);
        float _744 = _742 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _746 = fma(_740, _730, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _748 = fma(_670, _736, _744);
        float _750 = _726 * _746;
        float _752 = fma(_604, _750, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _754 = fma(_600, _750, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _718 = _748;
        _708 = _752;
        _646 = _740;
        _712 = _754;
    }
    float _756 = _718;
    float _758 = _708;
    float _760 = _646;
    float _762 = _712;
    float _764 = _760;
    if (_700)
    {
        _764 = 1.0;
    }
    float _766 = _764;
    float _768 = _766;
    if (!_700)
    {
        float _770 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _772 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _774 = _770 * 0.15915493667125701904296875;
        float _776 = _772 * 0.15915493667125701904296875;
        float _778 = _774 * 6.283185482025146484375;
        float _780 = cos(_778);
        float _782 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _784 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[30].w, _782);
        float _786 = _774 * 6.283185482025146484375;
        float _788 = sin(_786);
        float _790 = 1.0 / _780;
        float _792 = _776 * 6.283185482025146484375;
        float _794 = cos(_792);
        float _796 = _788 * _790;
        float _798 = _776 * 6.283185482025146484375;
        float _800 = sin(_798);
        float _802 = _794 * _796;
        float _804 = 1.0 / _784;
        float _806 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _808 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _806;
        float _810 = 1.0 / _802;
        float _812 = 1.0 / _808;
        float _814 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _816 = _804 * _814;
        float _818 = _800 * _810;
        float _820 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _822 = fma(_818, _816, _820);
        float _824 = _822 * _812;
        float _826 = precise::clamp(_824, 0.0, 1.0);
        _768 = _826;
    }
    float _828 = _768;
    float _830 = _756 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _832 = _756 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _834 = _756 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _836 = _756 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _838 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[1].x, _830);
    float _840 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[0].x, _832);
    float _842 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _846 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[1].z, _838);
    float _848 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[2].x, _834);
    float _850 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[0].z, _840);
    float _852 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[3].x, _836);
    float _854 = _846 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _856 = _334 * _842;
    float _858 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[2].z, _848);
    float _860 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _862 = _850 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _864 = _854 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _866 = _854 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _868 = _854 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _870 = _854 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _872 = _858 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _874 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[4].x, _864);
    float _876 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[5].x, _866);
    float _878 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[6].x, _868);
    float _880 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[3].z, _852);
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[7].x, _870);
    float _884 = _686 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _886 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[4].z, _874);
    float _888 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[5].z, _876);
    float _890 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[6].z, _878);
    float _892 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[7].z, _882);
    float _894 = _880 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _896 = _828 > 0.0;
    bool _898 = isnan(_828);
    bool _900 = _896 || _898;
    bool _902 = isnan(0.0);
    bool _904 = _900 || _902;
    float _906 = _884 * _844;
    float _908 = _690 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _910 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[6].w, _890);
    float _912 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[7].w, _892);
    float _914 = _908 * _860;
    float _916 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[4].w, _886);
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _920 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[5].w, _888);
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _926 = _910 + _912;
    float _928 = _922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = _918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _932 = _924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _934 = _856 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _936 = _926 * 0.5;
    out.m_49.x = _914;
    out.m_49.y = _906;
    out.m_51.x = _928;
    out.m_51.y = _930;
    out.m_51.z = _932;
    out.m_33.x = _934;
    out.gl_Position.x = _916;
    out.gl_Position.y = _920;
    out.gl_Position.z = _910;
    out.gl_Position.w = _912;
    out.m_53.z = _936;
    out.m_53.w = _912;
    if (_904)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _938 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _938;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    bool _354 = false;
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
        float _995 = as_type<float>(_88);
        out.gl_Position.z = _995;
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
    float _108 = 0.0;
    if (_102)
    {
        float _110 = float(_72);
        _108 = _110;
    }
    float _112 = _108;
    bool _114 = _106 >= _112;
    bool _116 = !_102;
    bool _118 = _114 || _116;
    if (_118)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _82;
    if (_118)
    {
        out.m_33.x = 0.0;
    }
    if (_118)
    {
        float _122 = _120 * 5.0;
        _90 = as_type<int>(_122);
    }
    int _124 = _90;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1063 = as_type<float>(_124);
        out.gl_Position.z = _1063;
    }
    if (_118)
    {
        return out;
    }
    float _126 = in.m_37.x;
    float _128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _130 = _106 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _132 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _134 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _136 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _138 = _134 || _136;
    bool _140 = isnan(1.0);
    bool _142 = _138 || _140;
    int _144 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _146 = _144 != 0;
    float _148 = _130 * _128;
    float _150 = 0.0;
    float _152 = _132;
    if (!_142)
    {
        float _154 = _132 * _132;
        float _156 = _154 * 0.5;
        _150 = _156;
    }
    float _158 = _150;
    float _160 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[20].x, _148);
    float _162 = _158;
    if (!_142)
    {
        float _164 = _158 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _162 = _164;
    }
    float _166 = _162;
    float _168 = in.m_35.x;
    float _170 = in.m_35.y;
    float _172 = in.m_35.z;
    float _174 = _160 * 6.283185482025146484375;
    float _176 = floor(_160);
    float _178 = _174 * 0.15915493667125701904296875;
    float _180 = _178 * 6.283185482025146484375;
    float _182 = cos(_180);
    float _184 = -_176;
    float _186 = _160 + _184;
    bool _188 = !_142;
    float _190 = _166;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _132 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _132);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_142;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _132 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _152 = _244;
    }
    float _246 = _152;
    float _248 = in.m_39.w;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _254 = _252 != 0;
    int _256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _258 = _256 != 0;
    float _260 = -_186;
    float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _264 = _186 < 0.5;
    float _266 = float(_264);
    float _268 = fma(_182, 0.5, 0.5);
    float _270 = in.m_30.x;
    float _272 = in.m_30.y;
    float _274 = in.m_30.z;
    bool _276 = !_254;
    int _278 = _276 ? 0 : 1;
    float _280 = -_266;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _284 = !_146;
    int _286 = _284 ? 0 : 1;
    float _288 = -_268;
    float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _292 = abs(_278);
    float _294 = fma(_246, _168, _250);
    int _296 = abs(_286);
    float _298 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _300 = !_258;
    int _302 = _300 ? 0 : 1;
    float _304 = fma(_246, _170, _298);
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _308 = abs(_302);
    float _310 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _312 = float(_292);
    float _314 = float(_296);
    float _316 = fma(_246, _172, _310);
    float _318 = abs(_262);
    float _320 = _312 * _318;
    float _322 = fma(_294, _248, _270);
    float _324 = fma(_304, _248, _272);
    float _326 = float(_308);
    float _328 = fma(_314, _290, _320);
    float _330 = fma(_316, _248, _274);
    float _332 = abs(_282);
    float _334 = fma(_326, _332, _328);
    bool _336 = !_306;
    float _352;
    if (!_336)
    {
        float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _340 = _126 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[12].x, _106);
        float _344 = _342 * _338;
        float _346 = floor(_344);
        float _348 = -_346;
        float _350 = _344 + _348;
        _352 = _350;
        _354 = true;
    }
    else
    {
        float _356 = float(_72);
        float _358 = 1.0 / _356;
        float _360 = _106 * _358;
        _352 = _360;
    }
    _354 = false;
    float _362 = _352;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _366 = _362 + _364;
    float _368 = in.m_37.y;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _378 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _380 = isnan(_362);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = 1.0 / _372;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _394 = _392 != 0;
    out.m_41.x = 1.0;
    out.m_41.y = 1.0;
    out.m_41.z = 1.0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _398 = _396 != 0;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _402 = _362 + _400;
    bool _404 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _406 = isnan(_362);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    bool _416 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _418 = isnan(_362);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = 1.0 / _376;
    bool _430 = _126 > 0.5;
    bool _432 = _430 && _394;
    float _434 = -_426;
    float _436 = _434 + 1.0;
    float _438 = _366 * _390;
    float _440 = -_388;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _448;
    float _452 = _426 * _442;
    float _454 = _414 * _436;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _456;
    float _460 = fma(_446, _438, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _462 = fma(_450, _438, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _464 = _402 * _428;
    float _466 = fma(_458, _438, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _468 = _460 * _454;
    float _470 = _462 * _454;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _476 = _466 * _454;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _482 = in.m_39.x;
    float _484 = in.m_39.y;
    float _486 = in.m_39.z;
    float _488 = -_414;
    float _490 = _488 + 1.0;
    float _492 = fma(_474, _464, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _494 = fma(_480, _464, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _496 = in.m_43.x;
    float _498 = in.m_43.y;
    float _500 = in.m_43.z;
    float _502 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[143].y, _476);
    float _504 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[143].x, _468);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _510 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[143].z, _470);
    float _512 = fma(_494, _452, _502);
    float _514 = fma(_492, _452, _504);
    float _516 = _324 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _518 = _324 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _520 = fma(_508, _464, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _522 = _324 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _524 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[145].y, _512);
    float _526 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[4].x, _516);
    float _528 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[5].x, _518);
    float _530 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[6].x, _522);
    float _532 = fma(_520, _452, _510);
    float _534 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[145].x, _514);
    float _536 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[6].z, _530);
    float _538 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[145].z, _532);
    float _540 = _524 * _484;
    float _542 = _534 * _482;
    float _544 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
    float _546 = _538 * _486;
    float _548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _498);
    float _550 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _552 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _496);
    float _554 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _556 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _500);
    float _558 = _550 * _548;
    float _560 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _562 = _554 * _552;
    float _564 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[5].z, _528);
    float _566 = _558 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _568 = _560 * _556;
    float _570 = _558 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _572 = _536 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _574 = fma(_562, (*spvDescriptorSet0.vp_c10)._m0[10].x, _566);
    float _576 = fma(_562, (*spvDescriptorSet0.vp_c10)._m0[8].x, _570);
    float _578 = _564 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _580 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[10].z, _574);
    float _582 = _544 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _584 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[8].z, _576);
    float _586 = _578 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _588 = _578 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _590 = _572 + _580;
    float _592 = _582 + _584;
    float _594 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[11].x, _586);
    float _596 = in.m_45.x;
    float _598 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _600 = _590 + _598;
    float _602 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _604 = _592 + _602;
    float _606 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[10].x, _588);
    float _608 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[11].z, _594);
    float _610 = _600 * _600;
    float _612 = in.m_45.y;
    float _614 = _608 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _616 = fma(_604, _604, _610);
    float _618 = _558 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _620 = 1.0 / _614;
    float _622 = fma(_562, (*spvDescriptorSet0.vp_c10)._m0[9].x, _618);
    float _624 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[10].z, _606);
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _632 = sqrt(_616);
    float _634 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[9].z, _622);
    float _636 = _624 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _640 = _618;
    float _642 = _558;
    float _644 = _634;
    float _646 = _568;
    if (_394)
    {
        _640 = _596;
    }
    float _648 = _640;
    float _650 = _626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _652 = _628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _630 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _656 = _368 > 0.5;
    float _658 = _648;
    if (_432)
    {
        float _660 = -_648;
        float _662 = _660 + 1.0;
        _658 = _662;
    }
    float _664 = _658;
    float _666 = -_612;
    float _668 = _666 + 1.0;
    float _670 = _578 + _634;
    float _672 = _636 + _614;
    float _674 = _612;
    float _676 = _668;
    float _678 = _664;
    if (!_394)
    {
        _642 = _596;
    }
    float _680 = _642;
    out.m_47.x = _650;
    out.m_47.y = _652;
    out.m_47.z = _654;
    out.m_47.w = _638;
    float _682 = _680;
    if (_398)
    {
        float _684 = _656 ? _668 : _612;
        _674 = _684;
    }
    float _686 = _674;
    bool _688 = _632 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (_394)
    {
        _682 = _664;
    }
    float _690 = _682;
    bool _692 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _694 = isnan(0.5);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _700 = _696 || _698;
    float _702 = _672 * _620;
    float _704 = _702 * 0.5;
    if (!_688)
    {
        _644 = _592;
    }
    float _706 = _644;
    float _708 = _706;
    if (!_688)
    {
        _676 = _590;
    }
    float _710 = _676;
    float _712 = _710;
    if (!_688)
    {
        _678 = _670;
    }
    float _714 = _678;
    bool _716 = !_688;
    float _718 = _714;
    if (!_716)
    {
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _722 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _724 = _632 + _722;
        float _726 = rsqrt(_616);
        float _728 = _724 * _720;
        float _730 = _670 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _732 = _728 * 0.15915493667125701904296875;
        float _734 = _732 * 6.283185482025146484375;
        float _736 = cos(_734);
        float _738 = _732 * 6.283185482025146484375;
        float _740 = sin(_738);
        float _742 = _736 + (-1.0);
        float _744 = _742 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _746 = fma(_740, _730, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _748 = fma(_670, _736, _744);
        float _750 = _726 * _746;
        float _752 = fma(_604, _750, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _754 = fma(_600, _750, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _718 = _748;
        _708 = _752;
        _646 = _740;
        _712 = _754;
    }
    float _756 = _718;
    float _758 = _708;
    float _760 = _646;
    float _762 = _712;
    float _764 = _760;
    if (_700)
    {
        _764 = 1.0;
    }
    float _766 = _764;
    float _768 = _766;
    if (!_700)
    {
        float _770 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _772 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _774 = _770 * 0.15915493667125701904296875;
        float _776 = _772 * 0.15915493667125701904296875;
        float _778 = _774 * 6.283185482025146484375;
        float _780 = cos(_778);
        float _782 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _784 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[30].w, _782);
        float _786 = _774 * 6.283185482025146484375;
        float _788 = sin(_786);
        float _790 = 1.0 / _780;
        float _792 = _776 * 6.283185482025146484375;
        float _794 = cos(_792);
        float _796 = _788 * _790;
        float _798 = _776 * 6.283185482025146484375;
        float _800 = sin(_798);
        float _802 = _794 * _796;
        float _804 = 1.0 / _784;
        float _806 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _808 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _806;
        float _810 = 1.0 / _802;
        float _812 = 1.0 / _808;
        float _814 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _816 = _804 * _814;
        float _818 = _800 * _810;
        float _820 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _822 = fma(_818, _816, _820);
        float _824 = _822 * _812;
        float _826 = precise::clamp(_824, 0.0, 1.0);
        _768 = _826;
    }
    float _828 = _768;
    float _830 = _756 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _832 = _756 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _834 = _756 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _836 = _756 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _838 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[1].x, _830);
    float _840 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[0].x, _832);
    float _842 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _846 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[1].z, _838);
    float _848 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[2].x, _834);
    float _850 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[0].z, _840);
    float _852 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[3].x, _836);
    float _854 = _846 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _856 = _334 * _842;
    float _858 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[2].z, _848);
    float _860 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _862 = _850 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _864 = _854 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _866 = _854 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _868 = _854 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _870 = _854 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _872 = _858 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _874 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[4].x, _864);
    float _876 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[5].x, _866);
    float _878 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[6].x, _868);
    float _880 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[3].z, _852);
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[7].x, _870);
    float _884 = _686 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _886 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[4].z, _874);
    float _888 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[5].z, _876);
    float _890 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[6].z, _878);
    float _892 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[7].z, _882);
    float _894 = _880 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _896 = _828 > 0.0;
    bool _898 = isnan(_828);
    bool _900 = _896 || _898;
    bool _902 = isnan(0.0);
    bool _904 = _900 || _902;
    float _906 = _884 * _844;
    float _908 = _690 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _910 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[6].w, _890);
    float _912 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[7].w, _892);
    float _914 = _908 * _860;
    float _916 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[4].w, _886);
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _920 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[5].w, _888);
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _926 = _910 + _912;
    float _928 = _922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = _918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _932 = _924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _934 = _856 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _936 = _926 * 0.5;
    out.m_49.x = _914;
    out.m_49.y = _906;
    out.m_51.x = _928;
    out.m_51.y = _930;
    out.m_51.z = _932;
    out.m_33.x = _934;
    out.gl_Position.x = _916;
    out.gl_Position.y = _920;
    out.gl_Position.z = _910;
    out.gl_Position.w = _912;
    out.m_53.z = _936;
    out.m_53.w = _912;
    if (_904)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _938 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _938;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    bool _354 = false;
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
        float _995 = as_type<float>(_88);
        out.gl_Position.z = _995;
    }
    if (!_76)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _92 = in.m_35.w;
    bool _94 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_92);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = -_92;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _108 = 0.0;
    if (_102)
    {
        float _110 = float(_72);
        _108 = _110;
    }
    float _112 = _108;
    bool _114 = _106 >= _112;
    bool _116 = !_102;
    bool _118 = _114 || _116;
    if (_118)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _82;
    if (_118)
    {
        out.m_33.x = 0.0;
    }
    if (_118)
    {
        float _122 = _120 * 5.0;
        _90 = as_type<int>(_122);
    }
    int _124 = _90;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1063 = as_type<float>(_124);
        out.gl_Position.z = _1063;
    }
    if (_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_37.x;
    float _128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _130 = _106 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _132 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _134 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _136 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _138 = _134 || _136;
    bool _140 = isnan(1.0);
    bool _142 = _138 || _140;
    int _144 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _146 = _144 != 0;
    float _148 = _130 * _128;
    float _150 = 0.0;
    float _152 = _132;
    if (!_142)
    {
        float _154 = _132 * _132;
        float _156 = _154 * 0.5;
        _150 = _156;
    }
    float _158 = _150;
    float _160 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[20].x, _148);
    float _162 = _158;
    if (!_142)
    {
        float _164 = _158 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _162 = _164;
    }
    float _166 = _162;
    float _168 = in.m_35.x;
    float _170 = in.m_35.y;
    float _172 = in.m_35.z;
    float _174 = _160 * 6.283185482025146484375;
    float _176 = floor(_160);
    float _178 = _174 * 0.15915493667125701904296875;
    float _180 = _178 * 6.283185482025146484375;
    float _182 = cos(_180);
    float _184 = -_176;
    float _186 = _160 + _184;
    bool _188 = !_142;
    float _190 = _166;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _132 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _132);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_142;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _132 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _152 = _244;
    }
    float _246 = _152;
    float _248 = in.m_39.w;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _254 = _252 != 0;
    int _256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _258 = _256 != 0;
    float _260 = -_186;
    float _262 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _264 = _186 < 0.5;
    float _266 = float(_264);
    float _268 = fma(_182, 0.5, 0.5);
    float _270 = in.m_30.x;
    float _272 = in.m_30.y;
    float _274 = in.m_30.z;
    bool _276 = !_254;
    int _278 = _276 ? 0 : 1;
    float _280 = -_266;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _284 = !_146;
    int _286 = _284 ? 0 : 1;
    float _288 = -_268;
    float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _292 = abs(_278);
    float _294 = fma(_246, _168, _250);
    int _296 = abs(_286);
    float _298 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _300 = !_258;
    int _302 = _300 ? 0 : 1;
    float _304 = fma(_246, _170, _298);
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _308 = abs(_302);
    float _310 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _312 = float(_292);
    float _314 = float(_296);
    float _316 = fma(_246, _172, _310);
    float _318 = abs(_262);
    float _320 = _312 * _318;
    float _322 = fma(_294, _248, _270);
    float _324 = fma(_304, _248, _272);
    float _326 = float(_308);
    float _328 = fma(_314, _290, _320);
    float _330 = fma(_316, _248, _274);
    float _332 = abs(_282);
    float _334 = fma(_326, _332, _328);
    bool _336 = !_306;
    float _352;
    if (!_336)
    {
        float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _340 = _126 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[12].x, _106);
        float _344 = _342 * _338;
        float _346 = floor(_344);
        float _348 = -_346;
        float _350 = _344 + _348;
        _352 = _350;
        _354 = true;
    }
    else
    {
        float _356 = float(_72);
        float _358 = 1.0 / _356;
        float _360 = _106 * _358;
        _352 = _360;
    }
    _354 = false;
    float _362 = _352;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _366 = _362 + _364;
    float _368 = in.m_37.y;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _378 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _380 = isnan(_362);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = 1.0 / _372;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _394 = _392 != 0;
    out.m_41.x = 1.0;
    out.m_41.y = 1.0;
    out.m_41.z = 1.0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _398 = _396 != 0;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _402 = _362 + _400;
    bool _404 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _406 = isnan(_362);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    bool _416 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _418 = isnan(_362);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = 1.0 / _376;
    bool _430 = _126 > 0.5;
    bool _432 = _430 && _394;
    float _434 = -_426;
    float _436 = _434 + 1.0;
    float _438 = _366 * _390;
    float _440 = -_388;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _448;
    float _452 = _426 * _442;
    float _454 = _414 * _436;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _456;
    float _460 = fma(_446, _438, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _462 = fma(_450, _438, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _464 = _402 * _428;
    float _466 = fma(_458, _438, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _468 = _460 * _454;
    float _470 = _462 * _454;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _476 = _466 * _454;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _482 = in.m_39.x;
    float _484 = in.m_39.y;
    float _486 = in.m_39.z;
    float _488 = -_414;
    float _490 = _488 + 1.0;
    float _492 = fma(_474, _464, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _494 = fma(_480, _464, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _496 = in.m_43.x;
    float _498 = in.m_43.y;
    float _500 = in.m_43.z;
    float _502 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[143].y, _476);
    float _504 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[143].x, _468);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _510 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[143].z, _470);
    float _512 = fma(_494, _452, _502);
    float _514 = fma(_492, _452, _504);
    float _516 = _324 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _518 = _324 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _520 = fma(_508, _464, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _522 = _324 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _524 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[145].y, _512);
    float _526 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[4].x, _516);
    float _528 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[5].x, _518);
    float _530 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[6].x, _522);
    float _532 = fma(_520, _452, _510);
    float _534 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[145].x, _514);
    float _536 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[6].z, _530);
    float _538 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[145].z, _532);
    float _540 = _524 * _484;
    float _542 = _534 * _482;
    float _544 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
    float _546 = _538 * _486;
    float _548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _498);
    float _550 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _552 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _496);
    float _554 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _556 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _500);
    float _558 = _550 * _548;
    float _560 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _562 = _554 * _552;
    float _564 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[5].z, _528);
    float _566 = _558 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _568 = _560 * _556;
    float _570 = _558 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _572 = _536 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _574 = fma(_562, (*spvDescriptorSet0.vp_c10)._m0[10].x, _566);
    float _576 = fma(_562, (*spvDescriptorSet0.vp_c10)._m0[8].x, _570);
    float _578 = _564 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _580 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[10].z, _574);
    float _582 = _544 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _584 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[8].z, _576);
    float _586 = _578 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _588 = _578 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _590 = _572 + _580;
    float _592 = _582 + _584;
    float _594 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[11].x, _586);
    float _596 = in.m_45.x;
    float _598 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _600 = _590 + _598;
    float _602 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _604 = _592 + _602;
    float _606 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[10].x, _588);
    float _608 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[11].z, _594);
    float _610 = _600 * _600;
    float _612 = in.m_45.y;
    float _614 = _608 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _616 = fma(_604, _604, _610);
    float _618 = _558 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _620 = 1.0 / _614;
    float _622 = fma(_562, (*spvDescriptorSet0.vp_c10)._m0[9].x, _618);
    float _624 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[10].z, _606);
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _632 = sqrt(_616);
    float _634 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[9].z, _622);
    float _636 = _624 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _640 = _618;
    float _642 = _558;
    float _644 = _634;
    float _646 = _568;
    if (_394)
    {
        _640 = _596;
    }
    float _648 = _640;
    float _650 = _626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _652 = _628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _630 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _656 = _368 > 0.5;
    float _658 = _648;
    if (_432)
    {
        float _660 = -_648;
        float _662 = _660 + 1.0;
        _658 = _662;
    }
    float _664 = _658;
    float _666 = -_612;
    float _668 = _666 + 1.0;
    float _670 = _578 + _634;
    float _672 = _636 + _614;
    float _674 = _612;
    float _676 = _668;
    float _678 = _664;
    if (!_394)
    {
        _642 = _596;
    }
    float _680 = _642;
    out.m_47.x = _650;
    out.m_47.y = _652;
    out.m_47.z = _654;
    out.m_47.w = _638;
    float _682 = _680;
    if (_398)
    {
        float _684 = _656 ? _668 : _612;
        _674 = _684;
    }
    float _686 = _674;
    bool _688 = _632 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (_394)
    {
        _682 = _664;
    }
    float _690 = _682;
    bool _692 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _694 = isnan(0.5);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _700 = _696 || _698;
    float _702 = _672 * _620;
    float _704 = _702 * 0.5;
    if (!_688)
    {
        _644 = _592;
    }
    float _706 = _644;
    float _708 = _706;
    if (!_688)
    {
        _676 = _590;
    }
    float _710 = _676;
    float _712 = _710;
    if (!_688)
    {
        _678 = _670;
    }
    float _714 = _678;
    bool _716 = !_688;
    float _718 = _714;
    if (!_716)
    {
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _722 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _724 = _632 + _722;
        float _726 = rsqrt(_616);
        float _728 = _724 * _720;
        float _730 = _670 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _732 = _728 * 0.15915493667125701904296875;
        float _734 = _732 * 6.283185482025146484375;
        float _736 = cos(_734);
        float _738 = _732 * 6.283185482025146484375;
        float _740 = sin(_738);
        float _742 = _736 + (-1.0);
        float _744 = _742 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _746 = fma(_740, _730, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _748 = fma(_670, _736, _744);
        float _750 = _726 * _746;
        float _752 = fma(_604, _750, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _754 = fma(_600, _750, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _718 = _748;
        _708 = _752;
        _646 = _740;
        _712 = _754;
    }
    float _756 = _718;
    float _758 = _708;
    float _760 = _646;
    float _762 = _712;
    float _764 = _760;
    if (_700)
    {
        _764 = 1.0;
    }
    float _766 = _764;
    float _768 = _766;
    if (!_700)
    {
        float _770 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _772 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _774 = _770 * 0.15915493667125701904296875;
        float _776 = _772 * 0.15915493667125701904296875;
        float _778 = _774 * 6.283185482025146484375;
        float _780 = cos(_778);
        float _782 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _784 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[30].w, _782);
        float _786 = _774 * 6.283185482025146484375;
        float _788 = sin(_786);
        float _790 = 1.0 / _780;
        float _792 = _776 * 6.283185482025146484375;
        float _794 = cos(_792);
        float _796 = _788 * _790;
        float _798 = _776 * 6.283185482025146484375;
        float _800 = sin(_798);
        float _802 = _794 * _796;
        float _804 = 1.0 / _784;
        float _806 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _808 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _806;
        float _810 = 1.0 / _802;
        float _812 = 1.0 / _808;
        float _814 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _816 = _804 * _814;
        float _818 = _800 * _810;
        float _820 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _822 = fma(_818, _816, _820);
        float _824 = _822 * _812;
        float _826 = precise::clamp(_824, 0.0, 1.0);
        _768 = _826;
    }
    float _828 = _768;
    float _830 = _756 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _832 = _756 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _834 = _756 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _836 = _756 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _838 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[1].x, _830);
    float _840 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[0].x, _832);
    float _842 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _846 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[1].z, _838);
    float _848 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[2].x, _834);
    float _850 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[0].z, _840);
    float _852 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[3].x, _836);
    float _854 = _846 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _856 = _334 * _842;
    float _858 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[2].z, _848);
    float _860 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _862 = _850 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _864 = _854 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _866 = _854 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _868 = _854 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _870 = _854 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _872 = _858 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _874 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[4].x, _864);
    float _876 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[5].x, _866);
    float _878 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[6].x, _868);
    float _880 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[3].z, _852);
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[7].x, _870);
    float _884 = _686 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _886 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[4].z, _874);
    float _888 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[5].z, _876);
    float _890 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[6].z, _878);
    float _892 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[7].z, _882);
    float _894 = _880 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _896 = _828 > 0.0;
    bool _898 = isnan(_828);
    bool _900 = _896 || _898;
    bool _902 = isnan(0.0);
    bool _904 = _900 || _902;
    float _906 = _884 * _844;
    float _908 = _690 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _910 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[6].w, _890);
    float _912 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[7].w, _892);
    float _914 = _908 * _860;
    float _916 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[4].w, _886);
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _920 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[5].w, _888);
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _926 = _910 + _912;
    float _928 = _922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = _918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _932 = _924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _934 = _856 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _936 = _926 * 0.5;
    out.m_49.x = _914;
    out.m_49.y = _906;
    out.m_51.x = _928;
    out.m_51.y = _930;
    out.m_51.z = _932;
    out.m_33.x = _934;
    out.gl_Position.x = _916;
    out.gl_Position.y = _920;
    out.gl_Position.z = _910;
    out.gl_Position.w = _912;
    out.m_53.z = _936;
    out.m_53.w = _912;
    if (_904)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _938 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _938;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

