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
    float4 m_43 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_37 [[attribute(2)]];
    float4 m_30 [[attribute(3)]];
    float4 m_35 [[attribute(4)]];
    float4 m_51 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
    float4 m_41 [[attribute(8)]];
    float4 m_47 [[attribute(10)]];
    float4 m_45 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1206 = false;
    bool _764 = false;
    bool _584 = false;
    bool _404 = false;
    bool _182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_30.w;
    float _73 = trunc(_71);
    int _76 = int(_73);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    float _86 = _84;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _84 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2309 = as_type<float>(_92);
        out.gl_Position.z = _2309;
    }
    if (!_80)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _112 = 0.0;
    if (_106)
    {
        float _114 = float(_76);
        _112 = _114;
    }
    float _116 = _112;
    bool _118 = _110 >= _116;
    bool _120 = !_106;
    bool _122 = _118 || _120;
    if (_122)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _86;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _126 = _124 * 5.0;
        _94 = as_type<int>(_126);
    }
    int _128 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2377 = as_type<float>(_128);
        out.gl_Position.z = _2377;
    }
    if (_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_37.x;
    float _132 = in.m_37.y;
    float _134 = in.m_37.z;
    bool _136 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _138 = _132 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _140 = _132 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _142 = _132 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _144 = fma(_130, (*spvDescriptorSet0.vp_c10)._m0[4].x, _138);
    float _146 = fma(_130, (*spvDescriptorSet0.vp_c10)._m0[5].x, _140);
    float _148 = fma(_130, (*spvDescriptorSet0.vp_c10)._m0[6].x, _142);
    float _150 = fma(_134, (*spvDescriptorSet0.vp_c10)._m0[4].z, _144);
    float _152 = fma(_134, (*spvDescriptorSet0.vp_c10)._m0[5].z, _146);
    float _154 = fma(_134, (*spvDescriptorSet0.vp_c10)._m0[6].z, _148);
    bool _156 = !_136;
    float _158 = _150;
    float _160 = _152;
    float _162 = _154;
    float _180;
    if (!_156)
    {
        float _164 = in.m_39.x;
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _170 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _172 = _170 * _166;
        float _174 = floor(_172);
        float _176 = -_174;
        float _178 = _172 + _176;
        _180 = _178;
        _182 = true;
    }
    else
    {
        float _184 = float(_76);
        float _186 = 1.0 / _184;
        float _188 = _110 * _186;
        _180 = _188;
    }
    _182 = false;
    float _190 = _180;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _194 = _190 + _192;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _198 = _190 + _196;
    bool _200 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _202 = isnan(_190);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = _190 + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = 1.0 / _214;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _232 = 1.0 / _226;
    float _234 = 1.0 / _222;
    float _236 = _194 * _228;
    bool _238 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _240 = isnan(_190);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -_210;
    float _252 = _250 + 1.0;
    float _254 = _248 * _252;
    float _256 = _198 * _232;
    bool _258 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _260 = isnan(_190);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _266 = _262 || _264;
    float _268 = float(_266);
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _274;
    bool _278 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _280 = isnan(_190);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _294 = -_268;
    float _296 = _294 + 1.0;
    float _298 = _218 * _234;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = -_248;
    float _306 = _304 + 1.0;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _312 = fma(_272, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _314 = fma(_302, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _316 = fma(_276, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _318 = _268 * _306;
    float _320 = _288 * _296;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _326 = -_288;
    float _328 = _326 + 1.0;
    float _330 = _316 * _320;
    float _332 = _312 * _320;
    float _334 = _314 * _320;
    float _336 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[143].x, _332);
    float _338 = fma(_292, _256, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _340 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[143].y, _334);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _342;
    float _346 = fma(_324, _256, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _348 = fma(_310, _256, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _350 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[143].z, _330);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _356;
    float _360 = fma(_338, _318, _336);
    float _362 = fma(_344, _236, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _364 = fma(_354, _236, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _366 = fma(_358, _236, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _368 = fma(_346, _318, _340);
    float _370 = fma(_348, _318, _350);
    float _372 = fma(_362, _254, _360);
    float _374 = fma(_364, _254, _368);
    float _376 = fma(_366, _254, _370);
    float _378 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[146].x, _372);
    float _380 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[146].y, _374);
    float _382 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[146].z, _376);
    bool _384 = !_230;
    float _402;
    if (!_384)
    {
        float _386 = in.m_39.x;
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _390 = _386 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[11].x, _110);
        float _394 = _392 * _388;
        float _396 = floor(_394);
        float _398 = -_396;
        float _400 = _394 + _398;
        _402 = _400;
        _404 = true;
    }
    else
    {
        float _406 = float(_76);
        float _408 = 1.0 / _406;
        float _410 = _110 * _408;
        _402 = _410;
    }
    _404 = false;
    float _412 = _402;
    float _414 = in.m_41.x;
    float _416 = in.m_41.y;
    float _418 = in.m_41.z;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _422 = _412 + _420;
    bool _424 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _426 = isnan(_412);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _436;
    bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _442 = 1.0 / _438;
    float _444 = _382 * _418;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _450 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _452 = isnan(_412);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = _380 * _416;
    float _464 = _422 * _442;
    float _466 = 1.0 / _448;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _470 = _412 + _468;
    bool _472 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _474 = isnan(_412);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -_434;
    float _486 = _484 + 1.0;
    float _488 = _378 * _414;
    float _490 = _482 * _486;
    float _492 = -_482;
    float _494 = _492 + 1.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _504;
    float _508 = _460 * _494;
    float _510 = fma(_498, _464, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = fma(_502, _464, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _514 = fma(_506, _464, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _516 = _470 * _466;
    float _518 = _510 * _508;
    float _520 = _512 * _508;
    float _522 = _514 * _508;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _532 = -_460;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _540 = fma(_526, _516, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _542 = fma(_530, _516, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _544 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[107].x, _518);
    float _546 = fma(_538, _516, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _548 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[107].y, _520);
    float _550 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[107].z, _522);
    float _552 = fma(_540, _490, _544);
    float _554 = fma(_542, _490, _548);
    float _556 = fma(_546, _490, _550);
    float _558 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[109].x, _552);
    float _560 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[109].y, _554);
    float _562 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[109].z, _556);
    bool _564 = !_440;
    float _582;
    if (!_564)
    {
        float _566 = in.m_39.x;
        float _568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _570 = _566 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _572 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[11].y, _110);
        float _574 = _572 * _568;
        float _576 = floor(_574);
        float _578 = -_576;
        float _580 = _574 + _578;
        _582 = _580;
        _584 = true;
    }
    else
    {
        float _586 = float(_76);
        float _588 = 1.0 / _586;
        float _590 = _110 * _588;
        _582 = _590;
    }
    _584 = false;
    float _592 = _582;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _602 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _604 = isnan(_592);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = 1.0 / _596;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _620 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _622 = isnan(_592);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _632;
    float _636 = -_612;
    float _638 = _636 + 1.0;
    bool _640 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _642 = isnan(_592);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    bool _652 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _654 = 1.0 / _600;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _660 = _630 * _638;
    float _662 = -_630;
    float _664 = _662 + 1.0;
    float _666 = _650 * _664;
    float _668 = 1.0 / _618;
    float _670 = _634 * _614;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _674 = _592 + _672;
    float _676 = -_650;
    float _678 = _676 + 1.0;
    float _680 = fma(_670, _674, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _684 = _592 + _682;
    float _686 = _658 * _654;
    bool _688 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _690 = isnan(_592);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _700;
    float _704 = _680 * _666;
    float _706 = fma(_686, _684, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _710 = _592 + _708;
    float _712 = -_698;
    float _714 = _712 + 1.0;
    float _716 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[115].x, _704);
    float _718 = _702 * _668;
    float _720 = _558 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _722 = _612 * _714;
    float _724 = fma(_706, _660, _716);
    float _726 = fma(_718, _710, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _728 = _562 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _730 = fma(_726, _722, _724);
    float _732 = _560 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _734 = _720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _736 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _738 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[118].x, _730);
    float _740 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = _738 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _734;
    out.m_43.y = _740;
    out.m_43.z = _736;
    out.m_43.w = _742;
    bool _744 = !_652;
    float _762;
    if (!_744)
    {
        float _746 = in.m_39.x;
        float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _750 = _746 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _752 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[11].z, _110);
        float _754 = _752 * _748;
        float _756 = floor(_754);
        float _758 = -_756;
        float _760 = _754 + _758;
        _762 = _760;
        _764 = true;
    }
    else
    {
        float _766 = float(_76);
        float _768 = 1.0 / _766;
        float _770 = _110 * _768;
        _762 = _770;
    }
    _764 = false;
    float _772 = _762;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _776 = _772 + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _778;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _786;
    float _790 = 1.0 / _780;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _804;
    float _808 = 1.0 / _784;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _812 = _772 + _810;
    bool _814 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _816 = isnan(_772);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    bool _826 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _828 = isnan(_772);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = 1.0 / _788;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _842 = _772 + _840;
    float _844 = _812 * _790;
    bool _846 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _848 = isnan(_772);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    bool _858 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _860 = isnan(_772);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = 1.0 / _794;
    float _872 = _842 * _808;
    bool _874 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _876 = isnan(_772);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _882 = _878 || _880;
    float _884 = float(_882);
    float _886 = -_856;
    float _888 = _886 + 1.0;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _892 = _772 + _890;
    float _894 = _884 * _888;
    float _896 = 1.0 / _798;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _900 = _772 + _898;
    float _902 = _776 * _838;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _906 = _772 + _904;
    float _908 = -_884;
    float _910 = _908 + 1.0;
    bool _912 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _914 = 1.0 / _806;
    float _916 = _900 * _870;
    bool _918 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _920 = isnan(_772);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _930;
    float _934 = -_928;
    float _936 = _934 + 1.0;
    float _938 = 1.0 / _802;
    float _940 = _928 * _910;
    float _942 = _906 * _914;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _946 = _772 + _944;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _948;
    float _952 = _946 * _896;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _954;
    float _958 = fma(_950, _844, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _960 = _892 * _938;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _962;
    float _966 = fma(_956, _844, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _968 = -_824;
    float _970 = _968 + 1.0;
    float _972 = _824 * _936;
    float _974 = fma(_964, _844, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _984 = _836 * _970;
    float _986 = -_836;
    float _988 = _986 + 1.0;
    float _990 = fma(_978, _872, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _992 = fma(_982, _872, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _994 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _996 = isnan(_772);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1002 = _998 || _1000;
    float _1004 = float(_1002);
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1010 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1012 = isnan(_772);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = _868 * _988;
    float _1024 = -_868;
    float _1026 = _1024 + 1.0;
    float _1028 = -_1004;
    float _1030 = _1028 + 1.0;
    float _1032 = fma(_1008, _872, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1034;
    float _1038 = _1004 * _1026;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1040;
    float _1044 = _1020 * _1030;
    float _1046 = fma(_1036, _902, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1052 = fma(_1042, _902, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1054 = _958 * _1044;
    float _1056 = fma(_932, _902, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1066 = _966 * _1044;
    float _1068 = -_1020;
    float _1070 = _1068 + 1.0;
    float _1072 = fma(_1060, _960, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1074 = fma(_1064, _960, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1076 = fma(_1050, _960, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1078 = _974 * _1044;
    float _1080 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1066);
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1054);
    float _1084 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1078);
    float _1086 = fma(_990, _1038, _1080);
    float _1088 = fma(_1032, _1038, _1082);
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1090;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1094;
    float _1098 = fma(_992, _1038, _1084);
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1100;
    float _1104 = fma(_1052, _1022, _1086);
    float _1106 = fma(_1092, _916, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1108 = fma(_1096, _916, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1110 = fma(_1102, _916, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1112 = fma(_1046, _1022, _1088);
    float _1114 = fma(_1056, _1022, _1098);
    float _1116 = fma(_1072, _984, _1104);
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1122 = fma(_1074, _984, _1112);
    float _1124 = fma(_1076, _984, _1114);
    float _1126 = fma(_1106, _972, _1116);
    float _1128 = fma(_1120, _952, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1136 = _1134 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1138 = fma(_1132, _952, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1140 = fma(_1108, _972, _1122);
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1146;
    float _1150 = fma(_1136, _952, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1152 = fma(_1110, _972, _1124);
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1154;
    float _1158 = fma(_1128, _940, _1126);
    float _1160 = fma(_1144, _942, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1162 = fma(_1148, _942, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1164 = fma(_1138, _940, _1140);
    float _1166 = fma(_1156, _942, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1168 = fma(_1150, _940, _1152);
    float _1170 = fma(_1160, _894, _1158);
    float _1172 = fma(_1162, _894, _1164);
    float _1174 = fma(_1166, _894, _1168);
    float _1176 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1170);
    float _1178 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1172);
    float _1180 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1174);
    bool _1182 = !_912;
    bool _1184 = _912;
    float _1186 = _1038;
    float _1204;
    if (!_1182)
    {
        float _1188 = in.m_39.x;
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1192 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[11].w, _110);
        float _1196 = _1194 * _1190;
        float _1198 = floor(_1196);
        float _1200 = -_1198;
        float _1202 = _1196 + _1200;
        _1204 = _1202;
        _1206 = true;
    }
    else
    {
        float _1208 = float(_76);
        float _1210 = 1.0 / _1208;
        float _1212 = _110 * _1210;
        _1204 = _1212;
    }
    _1206 = false;
    float _1214 = _1204;
    float _1216 = in.m_45.x;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1220 = _1214 + _1218;
    float _1222 = in.m_45.y;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1230 = _1228 != 0;
    float _1232 = in.m_39.x;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1236 = _1234 != 0;
    float _1238 = 1.0 / _1226;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1242 = _1240 != 0;
    float _1244 = in.m_39.w;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1248 = _1246 != 0;
    float _1250 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1252 = in.m_39.y;
    float _1254 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1256 = in.m_45.w;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1264 = _1262 != 0;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1268 = in.m_47.y;
    float _1270 = 1.0 / _1260;
    float _1272 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_49.x = _1216;
    out.m_49.y = _1222;
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1276 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1278 = _1244 > 0.5;
    float _1280 = in.m_45.z;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1284;
    float _1288 = _1136;
    bool _1290 = _1278;
    if (_1230)
    {
        float _1292 = in.m_39.z;
        _1288 = _1292;
    }
    float _1294 = _1288;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1300 = -_1282;
    float _1302 = fma(_1276, 2.0, _1300);
    float _1304 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1308 = _1306 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1310 = _1286 * _1238;
    float _1312 = _152 * _152;
    float _1314 = fma(_1304, -2.0, _1266);
    float _1316 = 1.0 / _1308;
    out.m_49.w = _1256;
    float _1318 = _1298 * _1270;
    float _1320 = -_1268;
    float _1322 = _1320 + 1.0;
    float _1324 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[193].x + _1324;
    float _1328 = _1114;
    float _1330 = _1268;
    float _1332 = _1312;
    if (!_1264)
    {
        float _1334 = in.m_39.z;
        _1328 = _1334;
    }
    float _1336 = _1328;
    float _1338 = fma(_1310, _1220, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1342 = _1214 + _1340;
    float _1344 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1346 = fma(_150, _150, _1312);
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1348;
    out.m_49.z = _1280;
    int _1352 = _1278 ? as_type<int>(_1322) : as_type<int>(_1268);
    float _1354 = fma(_154, _154, _1346);
    float _1356 = precise::max(0.0, _1344);
    float _1358 = _1350 * _1316;
    float _1360 = rsqrt(_1354);
    float _1362 = precise::max(_1356, 375.0);
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1366 = _1214 + _1364;
    if (_1230)
    {
        bool _1368 = _1294 > 0.5;
        _1184 = _1368;
    }
    bool _1370 = _1184;
    float _1372 = fma(_1318, _1342, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1374 = fma(_1358, _1366, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1376 = _1242 ? as_type<float>(_1352) : _1268;
    float _1378 = in.m_51.x;
    float _1380 = in.m_51.y;
    float _1382 = in.m_51.z;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1386 = _1252 > 0.5;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _1390 = _1388 + 1.0;
    float _1392 = precise::min(_1362, 550.0);
    float _1394 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1384);
    if (_1248)
    {
        float _1396 = _1386 ? _1322 : _1268;
        _1330 = _1396;
    }
    float _1398 = _1330;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _1402 = _1400 + 1.0;
    if (!_1264)
    {
        _1186 = _1252;
    }
    float _1404 = _1186;
    float _1406 = fma(_1392, 0.0057142856530845165252685546875, -2.142857074737548828125);
    float _1408 = precise::clamp(_1406, 0.0, 1.0);
    float _1410 = _1404;
    if (_1236)
    {
        bool _1412 = _1232 > 0.5;
        _1290 = _1412;
    }
    bool _1414 = _1290;
    float _1416 = _154 * _1360;
    if (_1264)
    {
        _1410 = _1232;
    }
    float _1418 = _1410;
    float _1420 = -_1408;
    float _1422 = _1420 + 1.0;
    float _1424 = in.m_47.x;
    float _1426 = fma(_1422, _1390, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _1428 = fma(_1422, _1402, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1432 = _152 * _1360;
    float _1434 = fma(_1422, 0.10000002384185791015625, 0.89999997615814208984375);
    float _1436 = _150 * _1360;
    float _1438 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1440 = _1416 * _1438;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _1444 = _1336;
    if (!_1264)
    {
        _1442 = _1336;
    }
    float _1446 = _1442;
    float _1448 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1430);
    float _1450 = _1446;
    if (_1264)
    {
        _1450 = _1252;
    }
    float _1452 = _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1456 = _1432 * _1454;
    if (_1264)
    {
        _1444 = _1252;
    }
    float _1458 = _1444;
    float _1460 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1462 = -_1440;
    float _1464 = fma(_1436, _1460, _1462);
    float _1466 = in.m_30.x;
    float _1468 = in.m_30.y;
    float _1470 = in.m_30.z;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1474 = _1436 * _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1478 = -_1456;
    float _1480 = fma(_1416, _1476, _1478);
    float _1482 = _1464 * _1464;
    float _1484 = _1428 * _1378;
    float _1486 = _1428 * _1380;
    float _1488 = _1428 * _1382;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1492 = -_1474;
    float _1494 = fma(_1432, _1490, _1492);
    float _1496 = fma(_1480, _1480, _1482);
    float _1498 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1488);
    float _1500 = fma(_1494, _1494, _1496);
    bool _1502 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1504 = isnan(0.5);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1510 = _1506 || _1508;
    float _1512 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1484);
    bool _1514 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1516 = isnan(0.5);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1522 = _1518 || _1520;
    float _1524 = rsqrt(_1500);
    float _1526 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1486);
    float _1528 = _1458;
    if (!_1236)
    {
        _1332 = _1424;
    }
    float _1530 = _1332;
    float _1532 = _1468 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1534 = _1468 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1536 = -_1468;
    float _1538 = fma(_1434, _1468, _1536);
    float _1540 = _1468 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1542 = fma(_1466, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1532);
    float _1544 = fma(_1466, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1534);
    float _1546 = _1250 * _1512;
    float _1548 = fma(_1466, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1540);
    float _1550 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1542);
    float _1552 = _1254 * _1526;
    float _1554 = _1464 * _1524;
    float _1556 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1548);
    float _1558 = -_1466;
    float _1560 = fma(_1426, _1466, _1558);
    float _1562 = -_1470;
    float _1564 = fma(_1426, _1470, _1562);
    float _1566 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1544);
    float _1568 = _1272 * _1498;
    float _1570 = _1550 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1572 = _1480 * _1524;
    float _1574 = _1494 * _1524;
    float _1576 = _1436 * _1554;
    float _1578 = _1552 * _1416;
    float _1580 = _1556 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1582 = _1566 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1584 = -_1576;
    float _1586 = fma(_1432, _1572, _1584);
    float _1588 = fma(_1546, _1574, _1578);
    float _1590 = _1564 + _1580;
    float _1592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1594 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1596 = isnan(_1214);
    bool _1598 = _1594 || _1596;
    bool _1600 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1602 = _1598 || _1600;
    float _1604 = float(_1602);
    float _1606 = _1560 + _1570;
    float _1608 = _1538 + _1582;
    float _1610 = fma(_1568, _1586, _1588);
    float _1612 = _1552 * _1436;
    float _1614 = _1432 * _1574;
    bool _1616 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1618 = isnan(_1214);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1624 = _1620 || _1622;
    float _1626 = float(_1624);
    float _1628 = -_1604;
    float _1630 = _1628 + 1.0;
    float _1632 = fma(_1546, _1572, _1612);
    float _1634 = -_1614;
    float _1636 = fma(_1416, _1554, _1634);
    bool _1638 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1640 = isnan(_1214);
    bool _1642 = _1638 || _1640;
    bool _1644 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1646 = _1642 || _1644;
    float _1648 = float(_1646);
    float _1650 = _1626 * _1630;
    float _1652 = -_1626;
    float _1654 = _1652 + 1.0;
    bool _1656 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1658 = isnan(_1214);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1664 = _1660 || _1662;
    float _1666 = float(_1664);
    float _1668 = fma(_1568, _1636, _1632);
    float _1670 = _1590 + _1610;
    float _1672 = _1648 * _1654;
    float _1674 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1676 = _1606 + _1668;
    float _1678 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1680 = _1670 + _1678;
    float _1682 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1684 = -_1648;
    float _1686 = _1684 + 1.0;
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1690 = _1676 + _1688;
    float _1692 = _1680 * _1680;
    float _1694 = fma(_1376, _1674, -0.5);
    float _1696 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1682);
    float _1698 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1700 = fma(_1690, _1690, _1692);
    float _1702 = _1666 * _1686;
    float _1704 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1696);
    float _1706 = fma(_1698, _1398, -0.5);
    float _1708 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1710 = _1338 * _1702;
    float _1712 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1714 = sqrt(_1700);
    float _1716 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1708);
    float _1718 = _1552 * _1432;
    float _1720 = _1416 * _1572;
    float _1722 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1716);
    float _1724 = fma(_1546, _1554, _1718);
    float _1726 = 1.0 / _1712;
    float _1728 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1734 = -_1720;
    float _1736 = fma(_1436, _1574, _1734);
    float _1738 = _1728 + _1712;
    float _1740 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1730);
    float _1742 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1744 = _1714 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1748 = fma(_1568, _1736, _1724);
    float _1750 = -_1732;
    float _1752 = fma(_1742, 2.0, _1750);
    int _1754 = as_type<int>(_1736);
    float _1756 = _1742;
    float _1758 = _1530;
    float _1760 = _1738;
    float _1762 = _1670;
    float _1764 = _1700;
    float _1766 = _1690;
    float _1768 = _1666;
    float _1770 = _1672;
    float _1772 = _1740;
    if (_1236)
    {
        float _1774 = -_1424;
        float _1776 = _1774 + 1.0;
        _1754 = as_type<int>(_1776);
    }
    int _1778 = _1754;
    float _1780 = as_type<float>(_1778);
    if (!_1522)
    {
        _1756 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1782 = _1756;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1786 = _1738 * _1726;
    float _1788 = _1786 * 0.5;
    float _1790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1792 = _1608 + _1748;
    float _1794 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1784);
    int _1796 = as_type<int>(_1792);
    if (_1236)
    {
        float _1798 = _1414 ? as_type<float>(_1778) : _1424;
        _1758 = _1798;
    }
    float _1800 = _1758;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1804 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1802);
    if (!_1522)
    {
        float _1806 = -_1782;
        float _1808 = _1806 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1760 = _1808;
    }
    float _1810 = _1760;
    if (!_1744)
    {
        _1528 = _1676;
    }
    float _1812 = _1528;
    float _1814 = _1812;
    if (!_1744)
    {
        _1780 = _1792;
    }
    float _1816 = _1780;
    bool _1818 = !_1744;
    float _1820 = _1816;
    float _1822 = _1746;
    if (!_1818)
    {
        float _1824 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1828 = _1714 + _1826;
        float _1830 = rsqrt(_1700);
        float _1832 = _1828 * _1824;
        float _1834 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1836 = _1832 * 0.15915493667125701904296875;
        float _1838 = _1836 * 6.283185482025146484375;
        float _1840 = sin(_1838);
        float _1842 = _1836 * 6.283185482025146484375;
        float _1844 = cos(_1842);
        float _1846 = fma(_1840, _1834, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1848 = _1830 * _1846;
        float _1850 = _1844 + (-1.0);
        float _1852 = fma(_1690, _1848, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1854 = fma(_1680, _1848, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1856 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1858 = fma(_1792, _1844, _1856);
        _1820 = _1858;
        _1814 = _1852;
        _1762 = _1854;
        _1764 = _1830;
    }
    float _1860 = _1820;
    float _1862 = _1814;
    float _1864 = _1762;
    float _1866 = _1764;
    float _1868 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1448);
    float _1870 = -_1608;
    float _1872 = _1870 + _1860;
    float _1874 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1314);
    float _1876 = -_1606;
    float _1878 = _1876 + _1862;
    float _1880 = _1866;
    float _1882 = _1862;
    float _1884 = _1860;
    float _1886 = _1864;
    if (_1230)
    {
        float _1888 = -_1424;
        float _1890 = _1888 + 1.0;
        _1796 = as_type<int>(_1890);
    }
    int _1892 = _1796;
    float _1894 = _1872 * _1872;
    float _1896 = -_1590;
    float _1898 = _1896 + _1864;
    if (!_1230)
    {
        _1880 = _1424;
    }
    float _1900 = _1880;
    float _1902 = _1900;
    if (!_1522)
    {
        float _1904 = 1.0 / _1810;
        _1766 = _1904;
    }
    float _1906 = _1766;
    float _1908 = fma(_1878, _1878, _1894);
    if (_1230)
    {
        float _1910 = _1370 ? as_type<float>(_1892) : _1424;
        _1902 = _1910;
    }
    float _1912 = _1902;
    float _1914 = -_1874;
    float _1916 = fma(_1868, _1706, _1914);
    float _1918 = -_1666;
    float _1920 = _1918 + 1.0;
    float _1922 = fma(_1898, _1898, _1908);
    if (!_1522)
    {
        _1768 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1924 = _1768;
    float _1926 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1928 = 1.0 / _1804;
    float _1930 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1932 = _1924;
    if (!_1522)
    {
        float _1934 = -_1924;
        float _1936 = _1934 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1822 = _1936;
    }
    float _1938 = _1822;
    float _1940 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1710);
    float _1942 = fma(_1926, _1800, -0.5);
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1946 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1394);
    float _1948 = sqrt(_1922);
    float _1950 = fma(_1372, _1672, _1940);
    float _1952 = fma(_1930, -2.0, _1944);
    float _1954 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1740);
    float _1956 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1958 = -_110;
    float _1960 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1302);
    float _1962 = _1946;
    if (_1522)
    {
        _1770 = 1.0;
    }
    float _1964 = _1770;
    float _1966 = -_110;
    float _1968 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1752);
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1972 = _1964;
    if (!_1522)
    {
        float _1974 = 1.0 / _1938;
        _1970 = _1974;
    }
    float _1976 = _1970;
    if (!_1522)
    {
        float _1978 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1980 = -_1782;
        float _1982 = fma(_1928, _1978, _1980);
        _1772 = _1982;
    }
    float _1984 = _1772;
    if (!_1522)
    {
        float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1988 = -_1924;
        float _1990 = fma(_1928, _1986, _1988);
        _1932 = _1990;
    }
    float _1992 = _1932;
    float _1994 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1794);
    float _1996 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1952);
    float _1998 = _1992;
    if (!_1522)
    {
        float _2000 = _1984 * _1906;
        float _2002 = precise::clamp(_2000, 0.0, 1.0);
        _1972 = _2002;
    }
    float _2004 = _1972;
    float _2006 = fma(_1956, _1912, -0.5);
    float _2008 = fma(_1374, _1650, _1950);
    bool _2010 = _1948 > 0.0;
    float _2012 = fma(_1946, _1942, _1960);
    if (_1522)
    {
        _1962 = 1.0;
    }
    float _2014 = _1962;
    float _2016 = fma(_1954, _2006, _1968);
    bool _2018 = _2004 > 0.0;
    bool _2020 = isnan(_2004);
    bool _2022 = _2018 || _2020;
    bool _2024 = isnan(0.0);
    bool _2026 = _2022 || _2024;
    float _2028 = -_1996;
    float _2030 = fma(_1994, _1694, _2028);
    float _2032 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2008);
    float _2034 = _2014;
    if (!_1522)
    {
        float _2036 = _1992 * _1976;
        float _2038 = precise::clamp(_2036, 0.0, 1.0);
        _1998 = _2038;
    }
    float _2040 = _1998;
    if (!_1522)
    {
        float _2042 = -_2040;
        float _2044 = _2042 + 1.0;
        _2034 = _2044;
    }
    float _2046 = _2034;
    bool _2048 = !_2010;
    if (!_2048)
    {
        float _2050 = sqrt(_1354);
        float _2052 = rsqrt(_1922);
        bool _2054 = _2050 > 0.0;
        float _2056 = _1878 * _2052;
        float _2058 = _1872 * _2052;
        float _2060 = _1898 * _2052;
        bool _2062 = !_2054;
        if (!_2062)
        {
            float _2064 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2066 = _1432 * _2058;
            float _2068 = fma(_1436, _2056, _2066);
            float _2070 = fma(_1416, _2060, _2068);
            float _2072 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2074 = _2070 * _2072;
            float _2076 = fma(_150, _2074, _1862);
            float _2078 = fma(_152, _2074, _1860);
            float _2080 = fma(_154, _2074, _1864);
            _1882 = _2076;
            _1884 = _2078;
            _1886 = _2080;
        }
    }
    float _2082 = _1882;
    float _2084 = _1884;
    float _2086 = _1886;
    if (_1510)
    {
        _158 = _2082;
    }
    float _2088 = _158;
    float _2090 = _2088;
    if (_1510)
    {
        _160 = _2084;
    }
    float _2092 = _160;
    float _2094 = _2092;
    if (_1510)
    {
        _162 = _2086;
    }
    float _2096 = _162;
    float _2098 = _2096;
    if (!_1510)
    {
        float _2100 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2102 = _1608 + _2100;
        float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2106 = _1606 + _2104;
        float _2108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2110 = _2102 * _2102;
        float _2112 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2114 = _1590 + _2112;
        float _2116 = fma(_2106, _2106, _2110);
        float _2118 = fma(_2114, _2114, _2116);
        float _2120 = -_1606;
        float _2122 = _2120 + _2082;
        float _2124 = -_1608;
        float _2126 = _2124 + _2084;
        float _2128 = sqrt(_2118);
        float _2130 = precise::min(_2128, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2132 = _2130 * _2108;
        float _2134 = -_1590;
        float _2136 = _2134 + _2086;
        float _2138 = fma(_2122, _2132, _1606);
        float _2140 = fma(_2126, _2132, _1608);
        float _2142 = fma(_2136, _2132, _1590);
        _2094 = _2140;
        _2090 = _2138;
        _2098 = _2142;
    }
    float _2144 = _2094;
    float _2146 = _2090;
    float _2148 = _2098;
    float _2150 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2152 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2154 = _2004 * _2046;
    bool _2156 = _2046 <= 0.0;
    bool _2158 = !_2026;
    bool _2160 = _2156 || _2158;
    float _2162 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2150);
    float _2164 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2166 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2152);
    float _2168 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2170 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2162);
    float _2172 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2164);
    float _2174 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2166);
    float _2176 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2168);
    float _2178 = _2170 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2180 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2172);
    float _2182 = _2174 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2184 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2176);
    float _2186 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2188 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2190 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2192 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2194 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2196 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2186);
    float _2198 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2188);
    float _2200 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2190);
    float _2202 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2192);
    float _2204 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2196);
    float _2206 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2208 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2198);
    float _2210 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2200);
    float _2212 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2202);
    float _2214 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2204);
    float _2216 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2208);
    float _2218 = _2012 + 0.5;
    float _2220 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2222 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2224 = _1180 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2226 = _2154 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2228 = _2214 + _2216;
    float _2230 = _1916 + 0.5;
    float _2232 = _2032 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2234 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2210);
    float _2236 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2212);
    float _2238 = _2220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2240 = _2222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2242 = _2224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2244 = _2016 + 0.5;
    float _2246 = _2030 + 0.5;
    float _2248 = _2226 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2250 = _2228 * 0.5;
    out.m_53.x = _2238;
    out.m_53.y = _2240;
    out.m_53.z = _2242;
    out.m_53.w = _2232;
    out.m_55.x = _2218;
    out.m_55.y = _2230;
    out.m_55.z = _2244;
    out.m_55.w = _2246;
    out.m_33.x = _2248;
    out.gl_Position.x = _2234;
    out.gl_Position.y = _2236;
    out.gl_Position.z = _2214;
    out.gl_Position.w = _2216;
    out.m_57.z = _2250;
    out.m_57.w = _2216;
    if (!_2160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _2252 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2252;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1206 = false;
    bool _764 = false;
    bool _584 = false;
    bool _404 = false;
    bool _182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_30.w;
    float _73 = trunc(_71);
    int _76 = int(_73);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    float _86 = _84;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _84 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2309 = as_type<float>(_92);
        out.gl_Position.z = _2309;
    }
    if (!_80)
    {
        return out;
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _112 = 0.0;
    if (_106)
    {
        float _114 = float(_76);
        _112 = _114;
    }
    float _116 = _112;
    bool _118 = _110 >= _116;
    bool _120 = !_106;
    bool _122 = _118 || _120;
    if (_122)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _86;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _126 = _124 * 5.0;
        _94 = as_type<int>(_126);
    }
    int _128 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2377 = as_type<float>(_128);
        out.gl_Position.z = _2377;
    }
    if (_122)
    {
        return out;
    }
    float _130 = in.m_37.x;
    float _132 = in.m_37.y;
    float _134 = in.m_37.z;
    bool _136 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _138 = _132 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _140 = _132 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _142 = _132 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _144 = fma(_130, (*spvDescriptorSet0.vp_c10)._m0[4].x, _138);
    float _146 = fma(_130, (*spvDescriptorSet0.vp_c10)._m0[5].x, _140);
    float _148 = fma(_130, (*spvDescriptorSet0.vp_c10)._m0[6].x, _142);
    float _150 = fma(_134, (*spvDescriptorSet0.vp_c10)._m0[4].z, _144);
    float _152 = fma(_134, (*spvDescriptorSet0.vp_c10)._m0[5].z, _146);
    float _154 = fma(_134, (*spvDescriptorSet0.vp_c10)._m0[6].z, _148);
    bool _156 = !_136;
    float _158 = _150;
    float _160 = _152;
    float _162 = _154;
    float _180;
    if (!_156)
    {
        float _164 = in.m_39.x;
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _170 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _172 = _170 * _166;
        float _174 = floor(_172);
        float _176 = -_174;
        float _178 = _172 + _176;
        _180 = _178;
        _182 = true;
    }
    else
    {
        float _184 = float(_76);
        float _186 = 1.0 / _184;
        float _188 = _110 * _186;
        _180 = _188;
    }
    _182 = false;
    float _190 = _180;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _194 = _190 + _192;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _198 = _190 + _196;
    bool _200 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _202 = isnan(_190);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = _190 + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = 1.0 / _214;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _232 = 1.0 / _226;
    float _234 = 1.0 / _222;
    float _236 = _194 * _228;
    bool _238 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _240 = isnan(_190);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -_210;
    float _252 = _250 + 1.0;
    float _254 = _248 * _252;
    float _256 = _198 * _232;
    bool _258 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _260 = isnan(_190);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _266 = _262 || _264;
    float _268 = float(_266);
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _274;
    bool _278 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _280 = isnan(_190);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _294 = -_268;
    float _296 = _294 + 1.0;
    float _298 = _218 * _234;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = -_248;
    float _306 = _304 + 1.0;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _312 = fma(_272, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _314 = fma(_302, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _316 = fma(_276, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _318 = _268 * _306;
    float _320 = _288 * _296;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _326 = -_288;
    float _328 = _326 + 1.0;
    float _330 = _316 * _320;
    float _332 = _312 * _320;
    float _334 = _314 * _320;
    float _336 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[143].x, _332);
    float _338 = fma(_292, _256, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _340 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[143].y, _334);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _342;
    float _346 = fma(_324, _256, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _348 = fma(_310, _256, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _350 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[143].z, _330);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _356;
    float _360 = fma(_338, _318, _336);
    float _362 = fma(_344, _236, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _364 = fma(_354, _236, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _366 = fma(_358, _236, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _368 = fma(_346, _318, _340);
    float _370 = fma(_348, _318, _350);
    float _372 = fma(_362, _254, _360);
    float _374 = fma(_364, _254, _368);
    float _376 = fma(_366, _254, _370);
    float _378 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[146].x, _372);
    float _380 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[146].y, _374);
    float _382 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[146].z, _376);
    bool _384 = !_230;
    float _402;
    if (!_384)
    {
        float _386 = in.m_39.x;
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _390 = _386 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[11].x, _110);
        float _394 = _392 * _388;
        float _396 = floor(_394);
        float _398 = -_396;
        float _400 = _394 + _398;
        _402 = _400;
        _404 = true;
    }
    else
    {
        float _406 = float(_76);
        float _408 = 1.0 / _406;
        float _410 = _110 * _408;
        _402 = _410;
    }
    _404 = false;
    float _412 = _402;
    float _414 = in.m_41.x;
    float _416 = in.m_41.y;
    float _418 = in.m_41.z;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _422 = _412 + _420;
    bool _424 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _426 = isnan(_412);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _436;
    bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _442 = 1.0 / _438;
    float _444 = _382 * _418;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _450 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _452 = isnan(_412);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = _380 * _416;
    float _464 = _422 * _442;
    float _466 = 1.0 / _448;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _470 = _412 + _468;
    bool _472 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _474 = isnan(_412);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -_434;
    float _486 = _484 + 1.0;
    float _488 = _378 * _414;
    float _490 = _482 * _486;
    float _492 = -_482;
    float _494 = _492 + 1.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _504;
    float _508 = _460 * _494;
    float _510 = fma(_498, _464, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = fma(_502, _464, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _514 = fma(_506, _464, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _516 = _470 * _466;
    float _518 = _510 * _508;
    float _520 = _512 * _508;
    float _522 = _514 * _508;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _532 = -_460;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _540 = fma(_526, _516, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _542 = fma(_530, _516, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _544 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[107].x, _518);
    float _546 = fma(_538, _516, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _548 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[107].y, _520);
    float _550 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[107].z, _522);
    float _552 = fma(_540, _490, _544);
    float _554 = fma(_542, _490, _548);
    float _556 = fma(_546, _490, _550);
    float _558 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[109].x, _552);
    float _560 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[109].y, _554);
    float _562 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[109].z, _556);
    bool _564 = !_440;
    float _582;
    if (!_564)
    {
        float _566 = in.m_39.x;
        float _568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _570 = _566 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _572 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[11].y, _110);
        float _574 = _572 * _568;
        float _576 = floor(_574);
        float _578 = -_576;
        float _580 = _574 + _578;
        _582 = _580;
        _584 = true;
    }
    else
    {
        float _586 = float(_76);
        float _588 = 1.0 / _586;
        float _590 = _110 * _588;
        _582 = _590;
    }
    _584 = false;
    float _592 = _582;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _602 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _604 = isnan(_592);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = 1.0 / _596;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _620 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _622 = isnan(_592);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _632;
    float _636 = -_612;
    float _638 = _636 + 1.0;
    bool _640 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _642 = isnan(_592);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    bool _652 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _654 = 1.0 / _600;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _660 = _630 * _638;
    float _662 = -_630;
    float _664 = _662 + 1.0;
    float _666 = _650 * _664;
    float _668 = 1.0 / _618;
    float _670 = _634 * _614;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _674 = _592 + _672;
    float _676 = -_650;
    float _678 = _676 + 1.0;
    float _680 = fma(_670, _674, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _684 = _592 + _682;
    float _686 = _658 * _654;
    bool _688 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _690 = isnan(_592);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _700;
    float _704 = _680 * _666;
    float _706 = fma(_686, _684, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _710 = _592 + _708;
    float _712 = -_698;
    float _714 = _712 + 1.0;
    float _716 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[115].x, _704);
    float _718 = _702 * _668;
    float _720 = _558 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _722 = _612 * _714;
    float _724 = fma(_706, _660, _716);
    float _726 = fma(_718, _710, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _728 = _562 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _730 = fma(_726, _722, _724);
    float _732 = _560 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _734 = _720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _736 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _738 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[118].x, _730);
    float _740 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = _738 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _734;
    out.m_43.y = _740;
    out.m_43.z = _736;
    out.m_43.w = _742;
    bool _744 = !_652;
    float _762;
    if (!_744)
    {
        float _746 = in.m_39.x;
        float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _750 = _746 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _752 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[11].z, _110);
        float _754 = _752 * _748;
        float _756 = floor(_754);
        float _758 = -_756;
        float _760 = _754 + _758;
        _762 = _760;
        _764 = true;
    }
    else
    {
        float _766 = float(_76);
        float _768 = 1.0 / _766;
        float _770 = _110 * _768;
        _762 = _770;
    }
    _764 = false;
    float _772 = _762;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _776 = _772 + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _778;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _786;
    float _790 = 1.0 / _780;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _804;
    float _808 = 1.0 / _784;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _812 = _772 + _810;
    bool _814 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _816 = isnan(_772);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    bool _826 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _828 = isnan(_772);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = 1.0 / _788;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _842 = _772 + _840;
    float _844 = _812 * _790;
    bool _846 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _848 = isnan(_772);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    bool _858 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _860 = isnan(_772);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = 1.0 / _794;
    float _872 = _842 * _808;
    bool _874 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _876 = isnan(_772);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _882 = _878 || _880;
    float _884 = float(_882);
    float _886 = -_856;
    float _888 = _886 + 1.0;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _892 = _772 + _890;
    float _894 = _884 * _888;
    float _896 = 1.0 / _798;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _900 = _772 + _898;
    float _902 = _776 * _838;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _906 = _772 + _904;
    float _908 = -_884;
    float _910 = _908 + 1.0;
    bool _912 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _914 = 1.0 / _806;
    float _916 = _900 * _870;
    bool _918 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _920 = isnan(_772);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _930;
    float _934 = -_928;
    float _936 = _934 + 1.0;
    float _938 = 1.0 / _802;
    float _940 = _928 * _910;
    float _942 = _906 * _914;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _946 = _772 + _944;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _948;
    float _952 = _946 * _896;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _954;
    float _958 = fma(_950, _844, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _960 = _892 * _938;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _962;
    float _966 = fma(_956, _844, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _968 = -_824;
    float _970 = _968 + 1.0;
    float _972 = _824 * _936;
    float _974 = fma(_964, _844, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _984 = _836 * _970;
    float _986 = -_836;
    float _988 = _986 + 1.0;
    float _990 = fma(_978, _872, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _992 = fma(_982, _872, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _994 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _996 = isnan(_772);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1002 = _998 || _1000;
    float _1004 = float(_1002);
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1010 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1012 = isnan(_772);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = _868 * _988;
    float _1024 = -_868;
    float _1026 = _1024 + 1.0;
    float _1028 = -_1004;
    float _1030 = _1028 + 1.0;
    float _1032 = fma(_1008, _872, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1034;
    float _1038 = _1004 * _1026;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1040;
    float _1044 = _1020 * _1030;
    float _1046 = fma(_1036, _902, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1052 = fma(_1042, _902, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1054 = _958 * _1044;
    float _1056 = fma(_932, _902, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1066 = _966 * _1044;
    float _1068 = -_1020;
    float _1070 = _1068 + 1.0;
    float _1072 = fma(_1060, _960, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1074 = fma(_1064, _960, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1076 = fma(_1050, _960, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1078 = _974 * _1044;
    float _1080 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1066);
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1054);
    float _1084 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1078);
    float _1086 = fma(_990, _1038, _1080);
    float _1088 = fma(_1032, _1038, _1082);
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1090;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1094;
    float _1098 = fma(_992, _1038, _1084);
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1100;
    float _1104 = fma(_1052, _1022, _1086);
    float _1106 = fma(_1092, _916, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1108 = fma(_1096, _916, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1110 = fma(_1102, _916, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1112 = fma(_1046, _1022, _1088);
    float _1114 = fma(_1056, _1022, _1098);
    float _1116 = fma(_1072, _984, _1104);
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1122 = fma(_1074, _984, _1112);
    float _1124 = fma(_1076, _984, _1114);
    float _1126 = fma(_1106, _972, _1116);
    float _1128 = fma(_1120, _952, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1136 = _1134 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1138 = fma(_1132, _952, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1140 = fma(_1108, _972, _1122);
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1146;
    float _1150 = fma(_1136, _952, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1152 = fma(_1110, _972, _1124);
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1154;
    float _1158 = fma(_1128, _940, _1126);
    float _1160 = fma(_1144, _942, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1162 = fma(_1148, _942, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1164 = fma(_1138, _940, _1140);
    float _1166 = fma(_1156, _942, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1168 = fma(_1150, _940, _1152);
    float _1170 = fma(_1160, _894, _1158);
    float _1172 = fma(_1162, _894, _1164);
    float _1174 = fma(_1166, _894, _1168);
    float _1176 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1170);
    float _1178 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1172);
    float _1180 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1174);
    bool _1182 = !_912;
    bool _1184 = _912;
    float _1186 = _1038;
    float _1204;
    if (!_1182)
    {
        float _1188 = in.m_39.x;
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1192 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[11].w, _110);
        float _1196 = _1194 * _1190;
        float _1198 = floor(_1196);
        float _1200 = -_1198;
        float _1202 = _1196 + _1200;
        _1204 = _1202;
        _1206 = true;
    }
    else
    {
        float _1208 = float(_76);
        float _1210 = 1.0 / _1208;
        float _1212 = _110 * _1210;
        _1204 = _1212;
    }
    _1206 = false;
    float _1214 = _1204;
    float _1216 = in.m_45.x;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1220 = _1214 + _1218;
    float _1222 = in.m_45.y;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1230 = _1228 != 0;
    float _1232 = in.m_39.x;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1236 = _1234 != 0;
    float _1238 = 1.0 / _1226;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1242 = _1240 != 0;
    float _1244 = in.m_39.w;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1248 = _1246 != 0;
    float _1250 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1252 = in.m_39.y;
    float _1254 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1256 = in.m_45.w;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1264 = _1262 != 0;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1268 = in.m_47.y;
    float _1270 = 1.0 / _1260;
    float _1272 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_49.x = _1216;
    out.m_49.y = _1222;
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1276 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1278 = _1244 > 0.5;
    float _1280 = in.m_45.z;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1284;
    float _1288 = _1136;
    bool _1290 = _1278;
    if (_1230)
    {
        float _1292 = in.m_39.z;
        _1288 = _1292;
    }
    float _1294 = _1288;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1300 = -_1282;
    float _1302 = fma(_1276, 2.0, _1300);
    float _1304 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1308 = _1306 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1310 = _1286 * _1238;
    float _1312 = _152 * _152;
    float _1314 = fma(_1304, -2.0, _1266);
    float _1316 = 1.0 / _1308;
    out.m_49.w = _1256;
    float _1318 = _1298 * _1270;
    float _1320 = -_1268;
    float _1322 = _1320 + 1.0;
    float _1324 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[193].x + _1324;
    float _1328 = _1114;
    float _1330 = _1268;
    float _1332 = _1312;
    if (!_1264)
    {
        float _1334 = in.m_39.z;
        _1328 = _1334;
    }
    float _1336 = _1328;
    float _1338 = fma(_1310, _1220, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1342 = _1214 + _1340;
    float _1344 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1346 = fma(_150, _150, _1312);
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1348;
    out.m_49.z = _1280;
    int _1352 = _1278 ? as_type<int>(_1322) : as_type<int>(_1268);
    float _1354 = fma(_154, _154, _1346);
    float _1356 = precise::max(0.0, _1344);
    float _1358 = _1350 * _1316;
    float _1360 = rsqrt(_1354);
    float _1362 = precise::max(_1356, 375.0);
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1366 = _1214 + _1364;
    if (_1230)
    {
        bool _1368 = _1294 > 0.5;
        _1184 = _1368;
    }
    bool _1370 = _1184;
    float _1372 = fma(_1318, _1342, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1374 = fma(_1358, _1366, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1376 = _1242 ? as_type<float>(_1352) : _1268;
    float _1378 = in.m_51.x;
    float _1380 = in.m_51.y;
    float _1382 = in.m_51.z;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1386 = _1252 > 0.5;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _1390 = _1388 + 1.0;
    float _1392 = precise::min(_1362, 550.0);
    float _1394 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1384);
    if (_1248)
    {
        float _1396 = _1386 ? _1322 : _1268;
        _1330 = _1396;
    }
    float _1398 = _1330;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _1402 = _1400 + 1.0;
    if (!_1264)
    {
        _1186 = _1252;
    }
    float _1404 = _1186;
    float _1406 = fma(_1392, 0.0057142856530845165252685546875, -2.142857074737548828125);
    float _1408 = precise::clamp(_1406, 0.0, 1.0);
    float _1410 = _1404;
    if (_1236)
    {
        bool _1412 = _1232 > 0.5;
        _1290 = _1412;
    }
    bool _1414 = _1290;
    float _1416 = _154 * _1360;
    if (_1264)
    {
        _1410 = _1232;
    }
    float _1418 = _1410;
    float _1420 = -_1408;
    float _1422 = _1420 + 1.0;
    float _1424 = in.m_47.x;
    float _1426 = fma(_1422, _1390, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _1428 = fma(_1422, _1402, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1432 = _152 * _1360;
    float _1434 = fma(_1422, 0.10000002384185791015625, 0.89999997615814208984375);
    float _1436 = _150 * _1360;
    float _1438 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1440 = _1416 * _1438;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _1444 = _1336;
    if (!_1264)
    {
        _1442 = _1336;
    }
    float _1446 = _1442;
    float _1448 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1430);
    float _1450 = _1446;
    if (_1264)
    {
        _1450 = _1252;
    }
    float _1452 = _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1456 = _1432 * _1454;
    if (_1264)
    {
        _1444 = _1252;
    }
    float _1458 = _1444;
    float _1460 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1462 = -_1440;
    float _1464 = fma(_1436, _1460, _1462);
    float _1466 = in.m_30.x;
    float _1468 = in.m_30.y;
    float _1470 = in.m_30.z;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1474 = _1436 * _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1478 = -_1456;
    float _1480 = fma(_1416, _1476, _1478);
    float _1482 = _1464 * _1464;
    float _1484 = _1428 * _1378;
    float _1486 = _1428 * _1380;
    float _1488 = _1428 * _1382;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1492 = -_1474;
    float _1494 = fma(_1432, _1490, _1492);
    float _1496 = fma(_1480, _1480, _1482);
    float _1498 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1488);
    float _1500 = fma(_1494, _1494, _1496);
    bool _1502 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1504 = isnan(0.5);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1510 = _1506 || _1508;
    float _1512 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1484);
    bool _1514 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1516 = isnan(0.5);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1522 = _1518 || _1520;
    float _1524 = rsqrt(_1500);
    float _1526 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1486);
    float _1528 = _1458;
    if (!_1236)
    {
        _1332 = _1424;
    }
    float _1530 = _1332;
    float _1532 = _1468 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1534 = _1468 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1536 = -_1468;
    float _1538 = fma(_1434, _1468, _1536);
    float _1540 = _1468 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1542 = fma(_1466, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1532);
    float _1544 = fma(_1466, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1534);
    float _1546 = _1250 * _1512;
    float _1548 = fma(_1466, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1540);
    float _1550 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1542);
    float _1552 = _1254 * _1526;
    float _1554 = _1464 * _1524;
    float _1556 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1548);
    float _1558 = -_1466;
    float _1560 = fma(_1426, _1466, _1558);
    float _1562 = -_1470;
    float _1564 = fma(_1426, _1470, _1562);
    float _1566 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1544);
    float _1568 = _1272 * _1498;
    float _1570 = _1550 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1572 = _1480 * _1524;
    float _1574 = _1494 * _1524;
    float _1576 = _1436 * _1554;
    float _1578 = _1552 * _1416;
    float _1580 = _1556 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1582 = _1566 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1584 = -_1576;
    float _1586 = fma(_1432, _1572, _1584);
    float _1588 = fma(_1546, _1574, _1578);
    float _1590 = _1564 + _1580;
    float _1592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1594 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1596 = isnan(_1214);
    bool _1598 = _1594 || _1596;
    bool _1600 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1602 = _1598 || _1600;
    float _1604 = float(_1602);
    float _1606 = _1560 + _1570;
    float _1608 = _1538 + _1582;
    float _1610 = fma(_1568, _1586, _1588);
    float _1612 = _1552 * _1436;
    float _1614 = _1432 * _1574;
    bool _1616 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1618 = isnan(_1214);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1624 = _1620 || _1622;
    float _1626 = float(_1624);
    float _1628 = -_1604;
    float _1630 = _1628 + 1.0;
    float _1632 = fma(_1546, _1572, _1612);
    float _1634 = -_1614;
    float _1636 = fma(_1416, _1554, _1634);
    bool _1638 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1640 = isnan(_1214);
    bool _1642 = _1638 || _1640;
    bool _1644 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1646 = _1642 || _1644;
    float _1648 = float(_1646);
    float _1650 = _1626 * _1630;
    float _1652 = -_1626;
    float _1654 = _1652 + 1.0;
    bool _1656 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1658 = isnan(_1214);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1664 = _1660 || _1662;
    float _1666 = float(_1664);
    float _1668 = fma(_1568, _1636, _1632);
    float _1670 = _1590 + _1610;
    float _1672 = _1648 * _1654;
    float _1674 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1676 = _1606 + _1668;
    float _1678 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1680 = _1670 + _1678;
    float _1682 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1684 = -_1648;
    float _1686 = _1684 + 1.0;
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1690 = _1676 + _1688;
    float _1692 = _1680 * _1680;
    float _1694 = fma(_1376, _1674, -0.5);
    float _1696 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1682);
    float _1698 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1700 = fma(_1690, _1690, _1692);
    float _1702 = _1666 * _1686;
    float _1704 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1696);
    float _1706 = fma(_1698, _1398, -0.5);
    float _1708 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1710 = _1338 * _1702;
    float _1712 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1714 = sqrt(_1700);
    float _1716 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1708);
    float _1718 = _1552 * _1432;
    float _1720 = _1416 * _1572;
    float _1722 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1716);
    float _1724 = fma(_1546, _1554, _1718);
    float _1726 = 1.0 / _1712;
    float _1728 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1734 = -_1720;
    float _1736 = fma(_1436, _1574, _1734);
    float _1738 = _1728 + _1712;
    float _1740 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1730);
    float _1742 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1744 = _1714 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1748 = fma(_1568, _1736, _1724);
    float _1750 = -_1732;
    float _1752 = fma(_1742, 2.0, _1750);
    int _1754 = as_type<int>(_1736);
    float _1756 = _1742;
    float _1758 = _1530;
    float _1760 = _1738;
    float _1762 = _1670;
    float _1764 = _1700;
    float _1766 = _1690;
    float _1768 = _1666;
    float _1770 = _1672;
    float _1772 = _1740;
    if (_1236)
    {
        float _1774 = -_1424;
        float _1776 = _1774 + 1.0;
        _1754 = as_type<int>(_1776);
    }
    int _1778 = _1754;
    float _1780 = as_type<float>(_1778);
    if (!_1522)
    {
        _1756 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1782 = _1756;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1786 = _1738 * _1726;
    float _1788 = _1786 * 0.5;
    float _1790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1792 = _1608 + _1748;
    float _1794 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1784);
    int _1796 = as_type<int>(_1792);
    if (_1236)
    {
        float _1798 = _1414 ? as_type<float>(_1778) : _1424;
        _1758 = _1798;
    }
    float _1800 = _1758;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1804 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1802);
    if (!_1522)
    {
        float _1806 = -_1782;
        float _1808 = _1806 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1760 = _1808;
    }
    float _1810 = _1760;
    if (!_1744)
    {
        _1528 = _1676;
    }
    float _1812 = _1528;
    float _1814 = _1812;
    if (!_1744)
    {
        _1780 = _1792;
    }
    float _1816 = _1780;
    bool _1818 = !_1744;
    float _1820 = _1816;
    float _1822 = _1746;
    if (!_1818)
    {
        float _1824 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1828 = _1714 + _1826;
        float _1830 = rsqrt(_1700);
        float _1832 = _1828 * _1824;
        float _1834 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1836 = _1832 * 0.15915493667125701904296875;
        float _1838 = _1836 * 6.283185482025146484375;
        float _1840 = sin(_1838);
        float _1842 = _1836 * 6.283185482025146484375;
        float _1844 = cos(_1842);
        float _1846 = fma(_1840, _1834, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1848 = _1830 * _1846;
        float _1850 = _1844 + (-1.0);
        float _1852 = fma(_1690, _1848, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1854 = fma(_1680, _1848, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1856 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1858 = fma(_1792, _1844, _1856);
        _1820 = _1858;
        _1814 = _1852;
        _1762 = _1854;
        _1764 = _1830;
    }
    float _1860 = _1820;
    float _1862 = _1814;
    float _1864 = _1762;
    float _1866 = _1764;
    float _1868 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1448);
    float _1870 = -_1608;
    float _1872 = _1870 + _1860;
    float _1874 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1314);
    float _1876 = -_1606;
    float _1878 = _1876 + _1862;
    float _1880 = _1866;
    float _1882 = _1862;
    float _1884 = _1860;
    float _1886 = _1864;
    if (_1230)
    {
        float _1888 = -_1424;
        float _1890 = _1888 + 1.0;
        _1796 = as_type<int>(_1890);
    }
    int _1892 = _1796;
    float _1894 = _1872 * _1872;
    float _1896 = -_1590;
    float _1898 = _1896 + _1864;
    if (!_1230)
    {
        _1880 = _1424;
    }
    float _1900 = _1880;
    float _1902 = _1900;
    if (!_1522)
    {
        float _1904 = 1.0 / _1810;
        _1766 = _1904;
    }
    float _1906 = _1766;
    float _1908 = fma(_1878, _1878, _1894);
    if (_1230)
    {
        float _1910 = _1370 ? as_type<float>(_1892) : _1424;
        _1902 = _1910;
    }
    float _1912 = _1902;
    float _1914 = -_1874;
    float _1916 = fma(_1868, _1706, _1914);
    float _1918 = -_1666;
    float _1920 = _1918 + 1.0;
    float _1922 = fma(_1898, _1898, _1908);
    if (!_1522)
    {
        _1768 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1924 = _1768;
    float _1926 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1928 = 1.0 / _1804;
    float _1930 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1932 = _1924;
    if (!_1522)
    {
        float _1934 = -_1924;
        float _1936 = _1934 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1822 = _1936;
    }
    float _1938 = _1822;
    float _1940 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1710);
    float _1942 = fma(_1926, _1800, -0.5);
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1946 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1394);
    float _1948 = sqrt(_1922);
    float _1950 = fma(_1372, _1672, _1940);
    float _1952 = fma(_1930, -2.0, _1944);
    float _1954 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1740);
    float _1956 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1958 = -_110;
    float _1960 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1302);
    float _1962 = _1946;
    if (_1522)
    {
        _1770 = 1.0;
    }
    float _1964 = _1770;
    float _1966 = -_110;
    float _1968 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1752);
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1972 = _1964;
    if (!_1522)
    {
        float _1974 = 1.0 / _1938;
        _1970 = _1974;
    }
    float _1976 = _1970;
    if (!_1522)
    {
        float _1978 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1980 = -_1782;
        float _1982 = fma(_1928, _1978, _1980);
        _1772 = _1982;
    }
    float _1984 = _1772;
    if (!_1522)
    {
        float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1988 = -_1924;
        float _1990 = fma(_1928, _1986, _1988);
        _1932 = _1990;
    }
    float _1992 = _1932;
    float _1994 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1794);
    float _1996 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1952);
    float _1998 = _1992;
    if (!_1522)
    {
        float _2000 = _1984 * _1906;
        float _2002 = precise::clamp(_2000, 0.0, 1.0);
        _1972 = _2002;
    }
    float _2004 = _1972;
    float _2006 = fma(_1956, _1912, -0.5);
    float _2008 = fma(_1374, _1650, _1950);
    bool _2010 = _1948 > 0.0;
    float _2012 = fma(_1946, _1942, _1960);
    if (_1522)
    {
        _1962 = 1.0;
    }
    float _2014 = _1962;
    float _2016 = fma(_1954, _2006, _1968);
    bool _2018 = _2004 > 0.0;
    bool _2020 = isnan(_2004);
    bool _2022 = _2018 || _2020;
    bool _2024 = isnan(0.0);
    bool _2026 = _2022 || _2024;
    float _2028 = -_1996;
    float _2030 = fma(_1994, _1694, _2028);
    float _2032 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2008);
    float _2034 = _2014;
    if (!_1522)
    {
        float _2036 = _1992 * _1976;
        float _2038 = precise::clamp(_2036, 0.0, 1.0);
        _1998 = _2038;
    }
    float _2040 = _1998;
    if (!_1522)
    {
        float _2042 = -_2040;
        float _2044 = _2042 + 1.0;
        _2034 = _2044;
    }
    float _2046 = _2034;
    bool _2048 = !_2010;
    if (!_2048)
    {
        float _2050 = sqrt(_1354);
        float _2052 = rsqrt(_1922);
        bool _2054 = _2050 > 0.0;
        float _2056 = _1878 * _2052;
        float _2058 = _1872 * _2052;
        float _2060 = _1898 * _2052;
        bool _2062 = !_2054;
        if (!_2062)
        {
            float _2064 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2066 = _1432 * _2058;
            float _2068 = fma(_1436, _2056, _2066);
            float _2070 = fma(_1416, _2060, _2068);
            float _2072 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2074 = _2070 * _2072;
            float _2076 = fma(_150, _2074, _1862);
            float _2078 = fma(_152, _2074, _1860);
            float _2080 = fma(_154, _2074, _1864);
            _1882 = _2076;
            _1884 = _2078;
            _1886 = _2080;
        }
    }
    float _2082 = _1882;
    float _2084 = _1884;
    float _2086 = _1886;
    if (_1510)
    {
        _158 = _2082;
    }
    float _2088 = _158;
    float _2090 = _2088;
    if (_1510)
    {
        _160 = _2084;
    }
    float _2092 = _160;
    float _2094 = _2092;
    if (_1510)
    {
        _162 = _2086;
    }
    float _2096 = _162;
    float _2098 = _2096;
    if (!_1510)
    {
        float _2100 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2102 = _1608 + _2100;
        float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2106 = _1606 + _2104;
        float _2108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2110 = _2102 * _2102;
        float _2112 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2114 = _1590 + _2112;
        float _2116 = fma(_2106, _2106, _2110);
        float _2118 = fma(_2114, _2114, _2116);
        float _2120 = -_1606;
        float _2122 = _2120 + _2082;
        float _2124 = -_1608;
        float _2126 = _2124 + _2084;
        float _2128 = sqrt(_2118);
        float _2130 = precise::min(_2128, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2132 = _2130 * _2108;
        float _2134 = -_1590;
        float _2136 = _2134 + _2086;
        float _2138 = fma(_2122, _2132, _1606);
        float _2140 = fma(_2126, _2132, _1608);
        float _2142 = fma(_2136, _2132, _1590);
        _2094 = _2140;
        _2090 = _2138;
        _2098 = _2142;
    }
    float _2144 = _2094;
    float _2146 = _2090;
    float _2148 = _2098;
    float _2150 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2152 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2154 = _2004 * _2046;
    bool _2156 = _2046 <= 0.0;
    bool _2158 = !_2026;
    bool _2160 = _2156 || _2158;
    float _2162 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2150);
    float _2164 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2166 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2152);
    float _2168 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2170 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2162);
    float _2172 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2164);
    float _2174 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2166);
    float _2176 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2168);
    float _2178 = _2170 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2180 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2172);
    float _2182 = _2174 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2184 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2176);
    float _2186 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2188 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2190 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2192 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2194 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2196 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2186);
    float _2198 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2188);
    float _2200 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2190);
    float _2202 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2192);
    float _2204 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2196);
    float _2206 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2208 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2198);
    float _2210 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2200);
    float _2212 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2202);
    float _2214 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2204);
    float _2216 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2208);
    float _2218 = _2012 + 0.5;
    float _2220 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2222 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2224 = _1180 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2226 = _2154 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2228 = _2214 + _2216;
    float _2230 = _1916 + 0.5;
    float _2232 = _2032 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2234 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2210);
    float _2236 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2212);
    float _2238 = _2220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2240 = _2222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2242 = _2224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2244 = _2016 + 0.5;
    float _2246 = _2030 + 0.5;
    float _2248 = _2226 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2250 = _2228 * 0.5;
    out.m_53.x = _2238;
    out.m_53.y = _2240;
    out.m_53.z = _2242;
    out.m_53.w = _2232;
    out.m_55.x = _2218;
    out.m_55.y = _2230;
    out.m_55.z = _2244;
    out.m_55.w = _2246;
    out.m_33.x = _2248;
    out.gl_Position.x = _2234;
    out.gl_Position.y = _2236;
    out.gl_Position.z = _2214;
    out.gl_Position.w = _2216;
    out.m_57.z = _2250;
    out.m_57.w = _2216;
    if (!_2160)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _2252 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2252;
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
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1206 = false;
    bool _764 = false;
    bool _584 = false;
    bool _404 = false;
    bool _182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _71 = in.m_30.w;
    float _73 = trunc(_71);
    int _76 = int(_73);
    bool _80 = _76 >= 1;
    float _82 = 0.0;
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    float _86 = _84;
    if (!_80)
    {
        out.m_33.x = 0.0;
    }
    int _88 = 0;
    if (!_80)
    {
        float _90 = _84 * 5.0;
        _88 = as_type<int>(_90);
    }
    int _92 = _88;
    int _94 = _92;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2309 = as_type<float>(_92);
        out.gl_Position.z = _2309;
    }
    if (!_80)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _112 = 0.0;
    if (_106)
    {
        float _114 = float(_76);
        _112 = _114;
    }
    float _116 = _112;
    bool _118 = _110 >= _116;
    bool _120 = !_106;
    bool _122 = _118 || _120;
    if (_122)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _86;
    if (_122)
    {
        out.m_33.x = 0.0;
    }
    if (_122)
    {
        float _126 = _124 * 5.0;
        _94 = as_type<int>(_126);
    }
    int _128 = _94;
    if (_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2377 = as_type<float>(_128);
        out.gl_Position.z = _2377;
    }
    if (_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_37.x;
    float _132 = in.m_37.y;
    float _134 = in.m_37.z;
    bool _136 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _138 = _132 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _140 = _132 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _142 = _132 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _144 = fma(_130, (*spvDescriptorSet0.vp_c10)._m0[4].x, _138);
    float _146 = fma(_130, (*spvDescriptorSet0.vp_c10)._m0[5].x, _140);
    float _148 = fma(_130, (*spvDescriptorSet0.vp_c10)._m0[6].x, _142);
    float _150 = fma(_134, (*spvDescriptorSet0.vp_c10)._m0[4].z, _144);
    float _152 = fma(_134, (*spvDescriptorSet0.vp_c10)._m0[5].z, _146);
    float _154 = fma(_134, (*spvDescriptorSet0.vp_c10)._m0[6].z, _148);
    bool _156 = !_136;
    float _158 = _150;
    float _160 = _152;
    float _162 = _154;
    float _180;
    if (!_156)
    {
        float _164 = in.m_39.x;
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _170 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _172 = _170 * _166;
        float _174 = floor(_172);
        float _176 = -_174;
        float _178 = _172 + _176;
        _180 = _178;
        _182 = true;
    }
    else
    {
        float _184 = float(_76);
        float _186 = 1.0 / _184;
        float _188 = _110 * _186;
        _180 = _188;
    }
    _182 = false;
    float _190 = _180;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _194 = _190 + _192;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _198 = _190 + _196;
    bool _200 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _202 = isnan(_190);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = _190 + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = 1.0 / _214;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _232 = 1.0 / _226;
    float _234 = 1.0 / _222;
    float _236 = _194 * _228;
    bool _238 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _240 = isnan(_190);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -_210;
    float _252 = _250 + 1.0;
    float _254 = _248 * _252;
    float _256 = _198 * _232;
    bool _258 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _260 = isnan(_190);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _266 = _262 || _264;
    float _268 = float(_266);
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _274;
    bool _278 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _280 = isnan(_190);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _294 = -_268;
    float _296 = _294 + 1.0;
    float _298 = _218 * _234;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = -_248;
    float _306 = _304 + 1.0;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _312 = fma(_272, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _314 = fma(_302, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _316 = fma(_276, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _318 = _268 * _306;
    float _320 = _288 * _296;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _326 = -_288;
    float _328 = _326 + 1.0;
    float _330 = _316 * _320;
    float _332 = _312 * _320;
    float _334 = _314 * _320;
    float _336 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[143].x, _332);
    float _338 = fma(_292, _256, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _340 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[143].y, _334);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _342;
    float _346 = fma(_324, _256, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _348 = fma(_310, _256, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _350 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[143].z, _330);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _356;
    float _360 = fma(_338, _318, _336);
    float _362 = fma(_344, _236, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _364 = fma(_354, _236, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _366 = fma(_358, _236, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _368 = fma(_346, _318, _340);
    float _370 = fma(_348, _318, _350);
    float _372 = fma(_362, _254, _360);
    float _374 = fma(_364, _254, _368);
    float _376 = fma(_366, _254, _370);
    float _378 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[146].x, _372);
    float _380 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[146].y, _374);
    float _382 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[146].z, _376);
    bool _384 = !_230;
    float _402;
    if (!_384)
    {
        float _386 = in.m_39.x;
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _390 = _386 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[11].x, _110);
        float _394 = _392 * _388;
        float _396 = floor(_394);
        float _398 = -_396;
        float _400 = _394 + _398;
        _402 = _400;
        _404 = true;
    }
    else
    {
        float _406 = float(_76);
        float _408 = 1.0 / _406;
        float _410 = _110 * _408;
        _402 = _410;
    }
    _404 = false;
    float _412 = _402;
    float _414 = in.m_41.x;
    float _416 = in.m_41.y;
    float _418 = in.m_41.z;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _422 = _412 + _420;
    bool _424 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _426 = isnan(_412);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _436;
    bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _442 = 1.0 / _438;
    float _444 = _382 * _418;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _450 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _452 = isnan(_412);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = _380 * _416;
    float _464 = _422 * _442;
    float _466 = 1.0 / _448;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _470 = _412 + _468;
    bool _472 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _474 = isnan(_412);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -_434;
    float _486 = _484 + 1.0;
    float _488 = _378 * _414;
    float _490 = _482 * _486;
    float _492 = -_482;
    float _494 = _492 + 1.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _504;
    float _508 = _460 * _494;
    float _510 = fma(_498, _464, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = fma(_502, _464, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _514 = fma(_506, _464, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _516 = _470 * _466;
    float _518 = _510 * _508;
    float _520 = _512 * _508;
    float _522 = _514 * _508;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _532 = -_460;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _540 = fma(_526, _516, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _542 = fma(_530, _516, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _544 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[107].x, _518);
    float _546 = fma(_538, _516, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _548 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[107].y, _520);
    float _550 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[107].z, _522);
    float _552 = fma(_540, _490, _544);
    float _554 = fma(_542, _490, _548);
    float _556 = fma(_546, _490, _550);
    float _558 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[109].x, _552);
    float _560 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[109].y, _554);
    float _562 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[109].z, _556);
    bool _564 = !_440;
    float _582;
    if (!_564)
    {
        float _566 = in.m_39.x;
        float _568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _570 = _566 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _572 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[11].y, _110);
        float _574 = _572 * _568;
        float _576 = floor(_574);
        float _578 = -_576;
        float _580 = _574 + _578;
        _582 = _580;
        _584 = true;
    }
    else
    {
        float _586 = float(_76);
        float _588 = 1.0 / _586;
        float _590 = _110 * _588;
        _582 = _590;
    }
    _584 = false;
    float _592 = _582;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _602 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _604 = isnan(_592);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = 1.0 / _596;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _620 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _622 = isnan(_592);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _632;
    float _636 = -_612;
    float _638 = _636 + 1.0;
    bool _640 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _642 = isnan(_592);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    bool _652 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _654 = 1.0 / _600;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _660 = _630 * _638;
    float _662 = -_630;
    float _664 = _662 + 1.0;
    float _666 = _650 * _664;
    float _668 = 1.0 / _618;
    float _670 = _634 * _614;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _674 = _592 + _672;
    float _676 = -_650;
    float _678 = _676 + 1.0;
    float _680 = fma(_670, _674, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _684 = _592 + _682;
    float _686 = _658 * _654;
    bool _688 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _690 = isnan(_592);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _700;
    float _704 = _680 * _666;
    float _706 = fma(_686, _684, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _710 = _592 + _708;
    float _712 = -_698;
    float _714 = _712 + 1.0;
    float _716 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[115].x, _704);
    float _718 = _702 * _668;
    float _720 = _558 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _722 = _612 * _714;
    float _724 = fma(_706, _660, _716);
    float _726 = fma(_718, _710, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _728 = _562 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _730 = fma(_726, _722, _724);
    float _732 = _560 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _734 = _720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _736 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _738 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[118].x, _730);
    float _740 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = _738 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _734;
    out.m_43.y = _740;
    out.m_43.z = _736;
    out.m_43.w = _742;
    bool _744 = !_652;
    float _762;
    if (!_744)
    {
        float _746 = in.m_39.x;
        float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _750 = _746 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _752 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[11].z, _110);
        float _754 = _752 * _748;
        float _756 = floor(_754);
        float _758 = -_756;
        float _760 = _754 + _758;
        _762 = _760;
        _764 = true;
    }
    else
    {
        float _766 = float(_76);
        float _768 = 1.0 / _766;
        float _770 = _110 * _768;
        _762 = _770;
    }
    _764 = false;
    float _772 = _762;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _776 = _772 + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _778;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _786;
    float _790 = 1.0 / _780;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _804;
    float _808 = 1.0 / _784;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _812 = _772 + _810;
    bool _814 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _816 = isnan(_772);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    bool _826 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _828 = isnan(_772);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = 1.0 / _788;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _842 = _772 + _840;
    float _844 = _812 * _790;
    bool _846 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _848 = isnan(_772);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    bool _858 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _860 = isnan(_772);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = 1.0 / _794;
    float _872 = _842 * _808;
    bool _874 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _876 = isnan(_772);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _882 = _878 || _880;
    float _884 = float(_882);
    float _886 = -_856;
    float _888 = _886 + 1.0;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _892 = _772 + _890;
    float _894 = _884 * _888;
    float _896 = 1.0 / _798;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _900 = _772 + _898;
    float _902 = _776 * _838;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _906 = _772 + _904;
    float _908 = -_884;
    float _910 = _908 + 1.0;
    bool _912 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _914 = 1.0 / _806;
    float _916 = _900 * _870;
    bool _918 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _920 = isnan(_772);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _930;
    float _934 = -_928;
    float _936 = _934 + 1.0;
    float _938 = 1.0 / _802;
    float _940 = _928 * _910;
    float _942 = _906 * _914;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _946 = _772 + _944;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _948;
    float _952 = _946 * _896;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _954;
    float _958 = fma(_950, _844, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _960 = _892 * _938;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _962;
    float _966 = fma(_956, _844, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _968 = -_824;
    float _970 = _968 + 1.0;
    float _972 = _824 * _936;
    float _974 = fma(_964, _844, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _984 = _836 * _970;
    float _986 = -_836;
    float _988 = _986 + 1.0;
    float _990 = fma(_978, _872, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _992 = fma(_982, _872, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _994 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _996 = isnan(_772);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1002 = _998 || _1000;
    float _1004 = float(_1002);
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1010 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1012 = isnan(_772);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = _868 * _988;
    float _1024 = -_868;
    float _1026 = _1024 + 1.0;
    float _1028 = -_1004;
    float _1030 = _1028 + 1.0;
    float _1032 = fma(_1008, _872, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1034;
    float _1038 = _1004 * _1026;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1040;
    float _1044 = _1020 * _1030;
    float _1046 = fma(_1036, _902, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1052 = fma(_1042, _902, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1054 = _958 * _1044;
    float _1056 = fma(_932, _902, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1066 = _966 * _1044;
    float _1068 = -_1020;
    float _1070 = _1068 + 1.0;
    float _1072 = fma(_1060, _960, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1074 = fma(_1064, _960, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1076 = fma(_1050, _960, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1078 = _974 * _1044;
    float _1080 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1066);
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1054);
    float _1084 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1078);
    float _1086 = fma(_990, _1038, _1080);
    float _1088 = fma(_1032, _1038, _1082);
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1090;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1094;
    float _1098 = fma(_992, _1038, _1084);
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1100;
    float _1104 = fma(_1052, _1022, _1086);
    float _1106 = fma(_1092, _916, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1108 = fma(_1096, _916, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1110 = fma(_1102, _916, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1112 = fma(_1046, _1022, _1088);
    float _1114 = fma(_1056, _1022, _1098);
    float _1116 = fma(_1072, _984, _1104);
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1122 = fma(_1074, _984, _1112);
    float _1124 = fma(_1076, _984, _1114);
    float _1126 = fma(_1106, _972, _1116);
    float _1128 = fma(_1120, _952, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1134 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1136 = _1134 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1138 = fma(_1132, _952, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1140 = fma(_1108, _972, _1122);
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1146;
    float _1150 = fma(_1136, _952, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1152 = fma(_1110, _972, _1124);
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1154;
    float _1158 = fma(_1128, _940, _1126);
    float _1160 = fma(_1144, _942, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1162 = fma(_1148, _942, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1164 = fma(_1138, _940, _1140);
    float _1166 = fma(_1156, _942, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1168 = fma(_1150, _940, _1152);
    float _1170 = fma(_1160, _894, _1158);
    float _1172 = fma(_1162, _894, _1164);
    float _1174 = fma(_1166, _894, _1168);
    float _1176 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1170);
    float _1178 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1172);
    float _1180 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1174);
    bool _1182 = !_912;
    bool _1184 = _912;
    float _1186 = _1038;
    float _1204;
    if (!_1182)
    {
        float _1188 = in.m_39.x;
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1192 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[11].w, _110);
        float _1196 = _1194 * _1190;
        float _1198 = floor(_1196);
        float _1200 = -_1198;
        float _1202 = _1196 + _1200;
        _1204 = _1202;
        _1206 = true;
    }
    else
    {
        float _1208 = float(_76);
        float _1210 = 1.0 / _1208;
        float _1212 = _110 * _1210;
        _1204 = _1212;
    }
    _1206 = false;
    float _1214 = _1204;
    float _1216 = in.m_45.x;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1220 = _1214 + _1218;
    float _1222 = in.m_45.y;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1230 = _1228 != 0;
    float _1232 = in.m_39.x;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1236 = _1234 != 0;
    float _1238 = 1.0 / _1226;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1242 = _1240 != 0;
    float _1244 = in.m_39.w;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1248 = _1246 != 0;
    float _1250 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1252 = in.m_39.y;
    float _1254 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1256 = in.m_45.w;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1264 = _1262 != 0;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1268 = in.m_47.y;
    float _1270 = 1.0 / _1260;
    float _1272 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_49.x = _1216;
    out.m_49.y = _1222;
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1276 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1278 = _1244 > 0.5;
    float _1280 = in.m_45.z;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1284;
    float _1288 = _1136;
    bool _1290 = _1278;
    if (_1230)
    {
        float _1292 = in.m_39.z;
        _1288 = _1292;
    }
    float _1294 = _1288;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1300 = -_1282;
    float _1302 = fma(_1276, 2.0, _1300);
    float _1304 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1308 = _1306 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1310 = _1286 * _1238;
    float _1312 = _152 * _152;
    float _1314 = fma(_1304, -2.0, _1266);
    float _1316 = 1.0 / _1308;
    out.m_49.w = _1256;
    float _1318 = _1298 * _1270;
    float _1320 = -_1268;
    float _1322 = _1320 + 1.0;
    float _1324 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[193].x + _1324;
    float _1328 = _1114;
    float _1330 = _1268;
    float _1332 = _1312;
    if (!_1264)
    {
        float _1334 = in.m_39.z;
        _1328 = _1334;
    }
    float _1336 = _1328;
    float _1338 = fma(_1310, _1220, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1342 = _1214 + _1340;
    float _1344 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1346 = fma(_150, _150, _1312);
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1348;
    out.m_49.z = _1280;
    int _1352 = _1278 ? as_type<int>(_1322) : as_type<int>(_1268);
    float _1354 = fma(_154, _154, _1346);
    float _1356 = precise::max(0.0, _1344);
    float _1358 = _1350 * _1316;
    float _1360 = rsqrt(_1354);
    float _1362 = precise::max(_1356, 375.0);
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1366 = _1214 + _1364;
    if (_1230)
    {
        bool _1368 = _1294 > 0.5;
        _1184 = _1368;
    }
    bool _1370 = _1184;
    float _1372 = fma(_1318, _1342, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1374 = fma(_1358, _1366, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1376 = _1242 ? as_type<float>(_1352) : _1268;
    float _1378 = in.m_51.x;
    float _1380 = in.m_51.y;
    float _1382 = in.m_51.z;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1386 = _1252 > 0.5;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _1390 = _1388 + 1.0;
    float _1392 = precise::min(_1362, 550.0);
    float _1394 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1384);
    if (_1248)
    {
        float _1396 = _1386 ? _1322 : _1268;
        _1330 = _1396;
    }
    float _1398 = _1330;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _1402 = _1400 + 1.0;
    if (!_1264)
    {
        _1186 = _1252;
    }
    float _1404 = _1186;
    float _1406 = fma(_1392, 0.0057142856530845165252685546875, -2.142857074737548828125);
    float _1408 = precise::clamp(_1406, 0.0, 1.0);
    float _1410 = _1404;
    if (_1236)
    {
        bool _1412 = _1232 > 0.5;
        _1290 = _1412;
    }
    bool _1414 = _1290;
    float _1416 = _154 * _1360;
    if (_1264)
    {
        _1410 = _1232;
    }
    float _1418 = _1410;
    float _1420 = -_1408;
    float _1422 = _1420 + 1.0;
    float _1424 = in.m_47.x;
    float _1426 = fma(_1422, _1390, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _1428 = fma(_1422, _1402, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1432 = _152 * _1360;
    float _1434 = fma(_1422, 0.10000002384185791015625, 0.89999997615814208984375);
    float _1436 = _150 * _1360;
    float _1438 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1440 = _1416 * _1438;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _1444 = _1336;
    if (!_1264)
    {
        _1442 = _1336;
    }
    float _1446 = _1442;
    float _1448 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1430);
    float _1450 = _1446;
    if (_1264)
    {
        _1450 = _1252;
    }
    float _1452 = _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1456 = _1432 * _1454;
    if (_1264)
    {
        _1444 = _1252;
    }
    float _1458 = _1444;
    float _1460 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1462 = -_1440;
    float _1464 = fma(_1436, _1460, _1462);
    float _1466 = in.m_30.x;
    float _1468 = in.m_30.y;
    float _1470 = in.m_30.z;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1474 = _1436 * _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1478 = -_1456;
    float _1480 = fma(_1416, _1476, _1478);
    float _1482 = _1464 * _1464;
    float _1484 = _1428 * _1378;
    float _1486 = _1428 * _1380;
    float _1488 = _1428 * _1382;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1492 = -_1474;
    float _1494 = fma(_1432, _1490, _1492);
    float _1496 = fma(_1480, _1480, _1482);
    float _1498 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1488);
    float _1500 = fma(_1494, _1494, _1496);
    bool _1502 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1504 = isnan(0.5);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1510 = _1506 || _1508;
    float _1512 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1484);
    bool _1514 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1516 = isnan(0.5);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1522 = _1518 || _1520;
    float _1524 = rsqrt(_1500);
    float _1526 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1486);
    float _1528 = _1458;
    if (!_1236)
    {
        _1332 = _1424;
    }
    float _1530 = _1332;
    float _1532 = _1468 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1534 = _1468 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1536 = -_1468;
    float _1538 = fma(_1434, _1468, _1536);
    float _1540 = _1468 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1542 = fma(_1466, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1532);
    float _1544 = fma(_1466, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1534);
    float _1546 = _1250 * _1512;
    float _1548 = fma(_1466, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1540);
    float _1550 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1542);
    float _1552 = _1254 * _1526;
    float _1554 = _1464 * _1524;
    float _1556 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1548);
    float _1558 = -_1466;
    float _1560 = fma(_1426, _1466, _1558);
    float _1562 = -_1470;
    float _1564 = fma(_1426, _1470, _1562);
    float _1566 = fma(_1470, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1544);
    float _1568 = _1272 * _1498;
    float _1570 = _1550 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1572 = _1480 * _1524;
    float _1574 = _1494 * _1524;
    float _1576 = _1436 * _1554;
    float _1578 = _1552 * _1416;
    float _1580 = _1556 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1582 = _1566 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1584 = -_1576;
    float _1586 = fma(_1432, _1572, _1584);
    float _1588 = fma(_1546, _1574, _1578);
    float _1590 = _1564 + _1580;
    float _1592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1594 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1596 = isnan(_1214);
    bool _1598 = _1594 || _1596;
    bool _1600 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1602 = _1598 || _1600;
    float _1604 = float(_1602);
    float _1606 = _1560 + _1570;
    float _1608 = _1538 + _1582;
    float _1610 = fma(_1568, _1586, _1588);
    float _1612 = _1552 * _1436;
    float _1614 = _1432 * _1574;
    bool _1616 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1618 = isnan(_1214);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1624 = _1620 || _1622;
    float _1626 = float(_1624);
    float _1628 = -_1604;
    float _1630 = _1628 + 1.0;
    float _1632 = fma(_1546, _1572, _1612);
    float _1634 = -_1614;
    float _1636 = fma(_1416, _1554, _1634);
    bool _1638 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1640 = isnan(_1214);
    bool _1642 = _1638 || _1640;
    bool _1644 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1646 = _1642 || _1644;
    float _1648 = float(_1646);
    float _1650 = _1626 * _1630;
    float _1652 = -_1626;
    float _1654 = _1652 + 1.0;
    bool _1656 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1658 = isnan(_1214);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1664 = _1660 || _1662;
    float _1666 = float(_1664);
    float _1668 = fma(_1568, _1636, _1632);
    float _1670 = _1590 + _1610;
    float _1672 = _1648 * _1654;
    float _1674 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1676 = _1606 + _1668;
    float _1678 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1680 = _1670 + _1678;
    float _1682 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1684 = -_1648;
    float _1686 = _1684 + 1.0;
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1690 = _1676 + _1688;
    float _1692 = _1680 * _1680;
    float _1694 = fma(_1376, _1674, -0.5);
    float _1696 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1682);
    float _1698 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1700 = fma(_1690, _1690, _1692);
    float _1702 = _1666 * _1686;
    float _1704 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1696);
    float _1706 = fma(_1698, _1398, -0.5);
    float _1708 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1710 = _1338 * _1702;
    float _1712 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1714 = sqrt(_1700);
    float _1716 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1708);
    float _1718 = _1552 * _1432;
    float _1720 = _1416 * _1572;
    float _1722 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1716);
    float _1724 = fma(_1546, _1554, _1718);
    float _1726 = 1.0 / _1712;
    float _1728 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1734 = -_1720;
    float _1736 = fma(_1436, _1574, _1734);
    float _1738 = _1728 + _1712;
    float _1740 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1730);
    float _1742 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1744 = _1714 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1748 = fma(_1568, _1736, _1724);
    float _1750 = -_1732;
    float _1752 = fma(_1742, 2.0, _1750);
    int _1754 = as_type<int>(_1736);
    float _1756 = _1742;
    float _1758 = _1530;
    float _1760 = _1738;
    float _1762 = _1670;
    float _1764 = _1700;
    float _1766 = _1690;
    float _1768 = _1666;
    float _1770 = _1672;
    float _1772 = _1740;
    if (_1236)
    {
        float _1774 = -_1424;
        float _1776 = _1774 + 1.0;
        _1754 = as_type<int>(_1776);
    }
    int _1778 = _1754;
    float _1780 = as_type<float>(_1778);
    if (!_1522)
    {
        _1756 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1782 = _1756;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1786 = _1738 * _1726;
    float _1788 = _1786 * 0.5;
    float _1790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1792 = _1608 + _1748;
    float _1794 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1784);
    int _1796 = as_type<int>(_1792);
    if (_1236)
    {
        float _1798 = _1414 ? as_type<float>(_1778) : _1424;
        _1758 = _1798;
    }
    float _1800 = _1758;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1804 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1802);
    if (!_1522)
    {
        float _1806 = -_1782;
        float _1808 = _1806 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1760 = _1808;
    }
    float _1810 = _1760;
    if (!_1744)
    {
        _1528 = _1676;
    }
    float _1812 = _1528;
    float _1814 = _1812;
    if (!_1744)
    {
        _1780 = _1792;
    }
    float _1816 = _1780;
    bool _1818 = !_1744;
    float _1820 = _1816;
    float _1822 = _1746;
    if (!_1818)
    {
        float _1824 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1828 = _1714 + _1826;
        float _1830 = rsqrt(_1700);
        float _1832 = _1828 * _1824;
        float _1834 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1836 = _1832 * 0.15915493667125701904296875;
        float _1838 = _1836 * 6.283185482025146484375;
        float _1840 = sin(_1838);
        float _1842 = _1836 * 6.283185482025146484375;
        float _1844 = cos(_1842);
        float _1846 = fma(_1840, _1834, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1848 = _1830 * _1846;
        float _1850 = _1844 + (-1.0);
        float _1852 = fma(_1690, _1848, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1854 = fma(_1680, _1848, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1856 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1858 = fma(_1792, _1844, _1856);
        _1820 = _1858;
        _1814 = _1852;
        _1762 = _1854;
        _1764 = _1830;
    }
    float _1860 = _1820;
    float _1862 = _1814;
    float _1864 = _1762;
    float _1866 = _1764;
    float _1868 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1448);
    float _1870 = -_1608;
    float _1872 = _1870 + _1860;
    float _1874 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1314);
    float _1876 = -_1606;
    float _1878 = _1876 + _1862;
    float _1880 = _1866;
    float _1882 = _1862;
    float _1884 = _1860;
    float _1886 = _1864;
    if (_1230)
    {
        float _1888 = -_1424;
        float _1890 = _1888 + 1.0;
        _1796 = as_type<int>(_1890);
    }
    int _1892 = _1796;
    float _1894 = _1872 * _1872;
    float _1896 = -_1590;
    float _1898 = _1896 + _1864;
    if (!_1230)
    {
        _1880 = _1424;
    }
    float _1900 = _1880;
    float _1902 = _1900;
    if (!_1522)
    {
        float _1904 = 1.0 / _1810;
        _1766 = _1904;
    }
    float _1906 = _1766;
    float _1908 = fma(_1878, _1878, _1894);
    if (_1230)
    {
        float _1910 = _1370 ? as_type<float>(_1892) : _1424;
        _1902 = _1910;
    }
    float _1912 = _1902;
    float _1914 = -_1874;
    float _1916 = fma(_1868, _1706, _1914);
    float _1918 = -_1666;
    float _1920 = _1918 + 1.0;
    float _1922 = fma(_1898, _1898, _1908);
    if (!_1522)
    {
        _1768 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1924 = _1768;
    float _1926 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1928 = 1.0 / _1804;
    float _1930 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1932 = _1924;
    if (!_1522)
    {
        float _1934 = -_1924;
        float _1936 = _1934 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1822 = _1936;
    }
    float _1938 = _1822;
    float _1940 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1710);
    float _1942 = fma(_1926, _1800, -0.5);
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1946 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1394);
    float _1948 = sqrt(_1922);
    float _1950 = fma(_1372, _1672, _1940);
    float _1952 = fma(_1930, -2.0, _1944);
    float _1954 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1740);
    float _1956 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1958 = -_110;
    float _1960 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1302);
    float _1962 = _1946;
    if (_1522)
    {
        _1770 = 1.0;
    }
    float _1964 = _1770;
    float _1966 = -_110;
    float _1968 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1752);
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1972 = _1964;
    if (!_1522)
    {
        float _1974 = 1.0 / _1938;
        _1970 = _1974;
    }
    float _1976 = _1970;
    if (!_1522)
    {
        float _1978 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1980 = -_1782;
        float _1982 = fma(_1928, _1978, _1980);
        _1772 = _1982;
    }
    float _1984 = _1772;
    if (!_1522)
    {
        float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1988 = -_1924;
        float _1990 = fma(_1928, _1986, _1988);
        _1932 = _1990;
    }
    float _1992 = _1932;
    float _1994 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1794);
    float _1996 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1952);
    float _1998 = _1992;
    if (!_1522)
    {
        float _2000 = _1984 * _1906;
        float _2002 = precise::clamp(_2000, 0.0, 1.0);
        _1972 = _2002;
    }
    float _2004 = _1972;
    float _2006 = fma(_1956, _1912, -0.5);
    float _2008 = fma(_1374, _1650, _1950);
    bool _2010 = _1948 > 0.0;
    float _2012 = fma(_1946, _1942, _1960);
    if (_1522)
    {
        _1962 = 1.0;
    }
    float _2014 = _1962;
    float _2016 = fma(_1954, _2006, _1968);
    bool _2018 = _2004 > 0.0;
    bool _2020 = isnan(_2004);
    bool _2022 = _2018 || _2020;
    bool _2024 = isnan(0.0);
    bool _2026 = _2022 || _2024;
    float _2028 = -_1996;
    float _2030 = fma(_1994, _1694, _2028);
    float _2032 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2008);
    float _2034 = _2014;
    if (!_1522)
    {
        float _2036 = _1992 * _1976;
        float _2038 = precise::clamp(_2036, 0.0, 1.0);
        _1998 = _2038;
    }
    float _2040 = _1998;
    if (!_1522)
    {
        float _2042 = -_2040;
        float _2044 = _2042 + 1.0;
        _2034 = _2044;
    }
    float _2046 = _2034;
    bool _2048 = !_2010;
    if (!_2048)
    {
        float _2050 = sqrt(_1354);
        float _2052 = rsqrt(_1922);
        bool _2054 = _2050 > 0.0;
        float _2056 = _1878 * _2052;
        float _2058 = _1872 * _2052;
        float _2060 = _1898 * _2052;
        bool _2062 = !_2054;
        if (!_2062)
        {
            float _2064 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2066 = _1432 * _2058;
            float _2068 = fma(_1436, _2056, _2066);
            float _2070 = fma(_1416, _2060, _2068);
            float _2072 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2074 = _2070 * _2072;
            float _2076 = fma(_150, _2074, _1862);
            float _2078 = fma(_152, _2074, _1860);
            float _2080 = fma(_154, _2074, _1864);
            _1882 = _2076;
            _1884 = _2078;
            _1886 = _2080;
        }
    }
    float _2082 = _1882;
    float _2084 = _1884;
    float _2086 = _1886;
    if (_1510)
    {
        _158 = _2082;
    }
    float _2088 = _158;
    float _2090 = _2088;
    if (_1510)
    {
        _160 = _2084;
    }
    float _2092 = _160;
    float _2094 = _2092;
    if (_1510)
    {
        _162 = _2086;
    }
    float _2096 = _162;
    float _2098 = _2096;
    if (!_1510)
    {
        float _2100 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2102 = _1608 + _2100;
        float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2106 = _1606 + _2104;
        float _2108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2110 = _2102 * _2102;
        float _2112 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2114 = _1590 + _2112;
        float _2116 = fma(_2106, _2106, _2110);
        float _2118 = fma(_2114, _2114, _2116);
        float _2120 = -_1606;
        float _2122 = _2120 + _2082;
        float _2124 = -_1608;
        float _2126 = _2124 + _2084;
        float _2128 = sqrt(_2118);
        float _2130 = precise::min(_2128, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2132 = _2130 * _2108;
        float _2134 = -_1590;
        float _2136 = _2134 + _2086;
        float _2138 = fma(_2122, _2132, _1606);
        float _2140 = fma(_2126, _2132, _1608);
        float _2142 = fma(_2136, _2132, _1590);
        _2094 = _2140;
        _2090 = _2138;
        _2098 = _2142;
    }
    float _2144 = _2094;
    float _2146 = _2090;
    float _2148 = _2098;
    float _2150 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2152 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2154 = _2004 * _2046;
    bool _2156 = _2046 <= 0.0;
    bool _2158 = !_2026;
    bool _2160 = _2156 || _2158;
    float _2162 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2150);
    float _2164 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2166 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2152);
    float _2168 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2170 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2162);
    float _2172 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2164);
    float _2174 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2166);
    float _2176 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2168);
    float _2178 = _2170 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2180 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2172);
    float _2182 = _2174 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2184 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2176);
    float _2186 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2188 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2190 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2192 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2194 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2196 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2186);
    float _2198 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2188);
    float _2200 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2190);
    float _2202 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2192);
    float _2204 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2196);
    float _2206 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2208 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2198);
    float _2210 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2200);
    float _2212 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2202);
    float _2214 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2204);
    float _2216 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2208);
    float _2218 = _2012 + 0.5;
    float _2220 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2222 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2224 = _1180 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2226 = _2154 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2228 = _2214 + _2216;
    float _2230 = _1916 + 0.5;
    float _2232 = _2032 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2234 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2210);
    float _2236 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2212);
    float _2238 = _2220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2240 = _2222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2242 = _2224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2244 = _2016 + 0.5;
    float _2246 = _2030 + 0.5;
    float _2248 = _2226 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2250 = _2228 * 0.5;
    out.m_53.x = _2238;
    out.m_53.y = _2240;
    out.m_53.z = _2242;
    out.m_53.w = _2232;
    out.m_55.x = _2218;
    out.m_55.y = _2230;
    out.m_55.z = _2244;
    out.m_55.w = _2246;
    out.m_33.x = _2248;
    out.gl_Position.x = _2234;
    out.gl_Position.y = _2236;
    out.gl_Position.z = _2214;
    out.gl_Position.w = _2216;
    out.m_57.z = _2250;
    out.m_57.w = _2216;
    if (!_2160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _2252 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2252;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

