#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_53 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_61 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _520 = false;
    bool _414 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1844 = as_type<float>(_106);
        out.gl_Position.z = _1844;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1914 = as_type<float>(_144);
        out.gl_Position.z = _1914;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_51.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = -_312;
    float _320 = _318 + 1.0;
    bool _322 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_296);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = 1.0 / _316;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _340;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _346 = _300 * _334;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _348;
    float _352 = in.m_49.x;
    float _354 = in.m_49.y;
    float _356 = in.m_49.z;
    float _358 = _332 * _320;
    float _360 = fma(_338, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _362 = fma(_350, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _364 = fma(_342, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _366 = -_332;
    float _368 = _366 + 1.0;
    float _370 = _360 * _358;
    float _372 = _362 * _358;
    float _374 = _364 * _358;
    float _376 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].x, _370);
    float _378 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].y, _372);
    float _380 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].z, _374);
    float _382 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _376);
    float _384 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _378);
    float _386 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _380);
    float _388 = _382 * _352;
    float _390 = _384 * _354;
    float _392 = _386 * _356;
    bool _394 = !_344;
    float _412;
    if (!_394)
    {
        float _396 = in.m_51.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_90);
        float _418 = 1.0 / _416;
        float _420 = _124 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    bool _424 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _426 = isnan(_422);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _440 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _442 = isnan(_422);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _458 = _422 + _456;
    float _460 = -_434;
    float _462 = _460 + 1.0;
    float _464 = 1.0 / _438;
    bool _466 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _468 = _450 * _462;
    float _470 = -_450;
    float _472 = _470 + 1.0;
    float _474 = _454 * _464;
    float _476 = fma(_474, _458, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _478 = _476 * _468;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _484 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[115].x, _478);
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _488 = _480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = _482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _492 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[116].x, _484);
    float _494 = _486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _496 = _492 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _488;
    out.m_53.y = _490;
    out.m_53.z = _494;
    out.m_53.w = _496;
    bool _498 = !_466;
    float _500 = _492;
    float _518;
    if (!_498)
    {
        float _502 = in.m_51.x;
        float _504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _506 = _502 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _510 = _508 * _504;
        float _512 = floor(_510);
        float _514 = -_512;
        float _516 = _510 + _514;
        _518 = _516;
        _520 = true;
    }
    else
    {
        float _522 = float(_90);
        float _524 = 1.0 / _522;
        float _526 = _124 * _524;
        _518 = _526;
    }
    _520 = false;
    float _528 = _518;
    float _530 = in.m_51.z;
    float _532 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _534 = log2(_532);
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _538 = _536 != 0;
    float _540 = in.m_51.x;
    float _542 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _554 = _552 != 0;
    float _556 = _388 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _560 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _562 = _434;
    if (!_538)
    {
        float _564 = in.m_51.y;
        _562 = _564;
    }
    float _566 = _562;
    float _568 = _530 * 2.0;
    float _570 = _540 * 2.0;
    float _572 = floor(_568);
    float _574 = floor(_570);
    int _576 = as_type<int>(_530);
    if (!_538)
    {
        _500 = _566;
    }
    float _578 = _500;
    float _580 = _578;
    float _582 = _566;
    if (_538)
    {
        float _584 = in.m_51.x;
        float _586 = in.m_51.y;
        _580 = _584;
        _582 = _586;
    }
    float _588 = _580;
    float _590 = _582;
    bool _592 = _572 >= 0.0;
    bool _594 = isnan(_572);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    bool _602 = _572 > 0.0;
    int _604 = _600 ? 0 : 1;
    float _606 = _572;
    if (!_538)
    {
        _606 = _530;
    }
    float _608 = _606;
    bool _610 = _574 > 0.0;
    bool _612 = _574 >= 0.0;
    bool _614 = isnan(_574);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _624 = ~_604;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    int _630 = _628;
    float _632 = _608;
    if (!_602)
    {
        int _634 = ~_604;
        int _636 = _634 + 1;
        _630 = _636;
    }
    int _638 = _630;
    float _640 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[83].z, _558);
    if (_538)
    {
        _632 = _590;
    }
    float _642 = _632;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _646 = _588 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _648 = _620 ? 0 : 1;
    float _650 = _590 * 2.0;
    float _652 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[83].w, _644);
    float _654 = -_622;
    float _656 = fma(_646, 2.0, _654);
    float _658 = _642;
    if (!_538)
    {
        _658 = _530;
    }
    float _660 = _658;
    float _662 = _540 + _590;
    float _664 = _534 * _124;
    float _666 = _660;
    if (_538)
    {
        _666 = _590;
    }
    float _668 = _666;
    float _670 = _662 + (-1.0);
    int _672 = ~_648;
    int _674 = _672 + 1;
    int _676 = _674 + 1;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _680 = _676;
    if (!_610)
    {
        int _682 = ~_648;
        int _684 = _682 + 1;
        _680 = _684;
    }
    int _686 = _680;
    float _688 = _530 + _590;
    float _690 = _668 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _692 = exp2(_664);
    float _694 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _696 = _688 + (-1.0);
    float _698 = fma(_690, -2.0, _678);
    bool _700 = !_546;
    int _702 = _700 ? 0 : 1;
    float _704 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _640);
    bool _706 = !_550;
    int _708 = _706 ? 0 : 1;
    float _710 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _712 = floor(_650);
    int _714 = abs(_702);
    float _716 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _698);
    int _718 = abs(_708);
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _722 = 1.0 + _720;
    float _724 = in.m_55.x;
    float _726 = in.m_55.y;
    float _728 = in.m_55.z;
    bool _730 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _732 = isnan(1.0);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _738 = _734 || _736;
    float _740 = -_692;
    float _742 = _740 + 1.0;
    float _744 = 1.0 / _722;
    float _746 = float(_714);
    float _748 = float(_718);
    float _750 = float(_638);
    bool _752 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _760 = _756 || _758;
    bool _762 = _712 > 0.0;
    float _764 = _746 * _750;
    float _766 = _760 ? _742 : 0.0;
    float _768 = -_124;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[81].x, _656);
    float _772 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _652);
    float _774 = _764 * (-2.0);
    bool _776 = !_554;
    int _778 = _776 ? 0 : 1;
    if (_738)
    {
        float _780 = _766 * _744;
        _126 = _780;
    }
    float _782 = _126;
    bool _784 = _712 >= 0.0;
    bool _786 = isnan(_712);
    bool _788 = _784 || _786;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    float _794 = _540 + (-0.5);
    float _796 = float(_686);
    float _798 = fma(_774, _724, _724);
    int _800 = abs(_778);
    float _802 = fma(_694, _774, _694);
    int _804 = _792 ? 0 : 1;
    float _806 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[196].x, _798);
    float _808 = _748 * _796;
    int _810 = ~_804;
    int _812 = _810 + 1;
    int _814 = _812 + 1;
    float _816 = fma(_802, _782, _806);
    int _818 = _814;
    if (!_762)
    {
        int _820 = ~_804;
        int _822 = _820 + 1;
        _818 = _822;
    }
    int _824 = _818;
    float _826 = _808 * (-2.0);
    float _828 = float(_800);
    float _830 = _816 * 0.15915493667125701904296875;
    float _832 = float(_824);
    float _834 = fma(_710, _826, _710);
    float _836 = fma(_826, _726, _726);
    float _838 = _590 + (-0.5);
    float _840 = _540 + _530;
    float _842 = _828 * _832;
    float _844 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[196].y, _836);
    float _846 = _840 + (-1.0);
    float _848 = _842 * (-2.0);
    float _850 = _530 + (-0.5);
    float _852 = fma(_834, _782, _844);
    float _854 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _856 = fma(_848, _728, _728);
    float _858 = _830 * 6.283185482025146484375;
    float _860 = sin(_858);
    float _862 = in.m_57.x;
    float _864 = in.m_57.y;
    float _866 = in.m_57.z;
    float _868 = fma(_854, _848, _854);
    float _870 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[196].z, _856);
    float _872 = _852 * 0.15915493667125701904296875;
    float _874 = fma(_868, _782, _870);
    float _876 = _830 * 6.283185482025146484375;
    float _878 = cos(_876);
    float _880 = _874 * 0.15915493667125701904296875;
    float _882 = _872 * 6.283185482025146484375;
    float _884 = sin(_882);
    bool _886 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _888 = isnan(0.5);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _894 = _890 || _892;
    float _896 = _872 * 6.283185482025146484375;
    float _898 = cos(_896);
    float _900 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _862);
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _864);
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _866);
    float _906 = _556 * _900;
    float _908 = _542 * _902;
    float _910 = _560 * _904;
    float _912 = _880 * 6.283185482025146484375;
    float _914 = cos(_912);
    float _916 = _878 * _884;
    float _918 = _860 * _884;
    float _920 = _880 * 6.283185482025146484375;
    float _922 = sin(_920);
    float _924 = _860 * _898;
    float _926 = _878 * _898;
    float _928 = _914 * _908;
    float _930 = _898 * _914;
    float _932 = _884 * _914;
    float _934 = _878 * _928;
    float _936 = _860 * _928;
    float _938 = -_916;
    float _940 = fma(_922, _924, _938);
    float _942 = -_924;
    float _944 = fma(_922, _916, _942);
    float _946 = fma(_922, _926, _918);
    float _948 = fma(_922, _918, _926);
    float _950 = -_908;
    float _952 = _922 * _950;
    float _954 = fma(_940, _906, _936);
    float _956 = fma(_946, _906, _934);
    float _958 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _960 = fma(_930, _906, _952);
    float _962 = fma(_948, _910, _954);
    float _964 = fma(_944, _910, _956);
    float _966 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _968 = fma(_932, _910, _960);
    float _970 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _972 = _964 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _974 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _958);
    float _976 = _964 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _978 = _964 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _980 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].x, _972);
    float _982 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _966);
    float _984 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _974);
    float _986 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].x, _976);
    float _988 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[26].z, _980);
    float _990 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _982);
    float _992 = _984 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _994 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[24].z, _986);
    float _996 = _988 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _998 = _990 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1000 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _970);
    float _1002 = _994 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1004 = _992 + _996;
    float _1006 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].x, _978);
    float _1008 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1000);
    float _1010 = _998 + _1002;
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1014 = _1004 + _1012;
    float _1016 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1006);
    float _1018 = _1008 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1022 = _1010 + _1020;
    float _1024 = _1014 * _1014;
    float _1026 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1028 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1030 = _962;
    float _1032 = _1018;
    float _1034 = _1026;
    if (_894)
    {
        _1030 = 1.0;
    }
    float _1036 = _1030;
    float _1038 = fma(_1022, _1022, _1024);
    float _1040 = _1018 + _1026;
    float _1042 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1028);
    float _1044 = sqrt(_1038);
    float _1046 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1042);
    float _1048 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1050 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1052 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1048);
    float _1054 = 1.0 / _1050;
    float _1056 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1052);
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1060 = _1044 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = _1058 + _1050;
    float _1064 = _1062 * _1054;
    float _1066 = _1064 * 0.5;
    float _1068 = _1050;
    float _1070 = _1062;
    float _1072 = _1036;
    float _1074 = _1066;
    if (!_1060)
    {
        _1068 = _1010;
    }
    float _1076 = _1068;
    float _1078 = _1076;
    if (!_1060)
    {
        _1070 = _1004;
    }
    float _1080 = _1070;
    float _1082 = _1080;
    if (!_1060)
    {
        _1032 = _1040;
    }
    float _1084 = _1032;
    bool _1086 = !_1060;
    float _1088 = _1084;
    if (!_1086)
    {
        float _1090 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1094 = _1044 + _1092;
        float _1096 = rsqrt(_1038);
        float _1098 = _1094 * _1090;
        float _1100 = _1040 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1102 = _1098 * 0.15915493667125701904296875;
        float _1104 = _1102 * 6.283185482025146484375;
        float _1106 = cos(_1104);
        float _1108 = _1102 * 6.283185482025146484375;
        float _1110 = sin(_1108);
        float _1112 = _1106 + (-1.0);
        float _1114 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1116 = fma(_1110, _1100, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1118 = fma(_1040, _1106, _1114);
        float _1120 = _1096 * _1116;
        float _1122 = fma(_1022, _1120, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1124 = fma(_1014, _1120, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1088 = _1118;
        _1078 = _1122;
        _1082 = _1124;
    }
    float _1126 = _1088;
    float _1128 = _1078;
    float _1130 = _1082;
    if (!_894)
    {
        float _1132 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1134 = _1132 * 0.15915493667125701904296875;
        float _1136 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1140 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1138);
        float _1142 = _1134 * 6.283185482025146484375;
        float _1144 = cos(_1142);
        float _1146 = _1136 * 0.15915493667125701904296875;
        float _1148 = _1134 * 6.283185482025146484375;
        float _1150 = sin(_1148);
        float _1152 = 1.0 / _1144;
        float _1154 = _1146 * 6.283185482025146484375;
        float _1156 = cos(_1154);
        float _1158 = _1150 * _1152;
        float _1160 = _1146 * 6.283185482025146484375;
        float _1162 = sin(_1160);
        float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1166 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1164;
        float _1168 = _1156 * _1158;
        float _1170 = 1.0 / _1140;
        float _1172 = 1.0 / _1168;
        float _1174 = 1.0 / _1166;
        float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1178 = _1170 * _1176;
        float _1180 = _1162 * _1172;
        float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1184 = fma(_1180, _1178, _1182);
        float _1186 = _1184 * _1174;
        float _1188 = precise::clamp(_1186, 0.0, 1.0);
        _1034 = _1170;
        _1072 = _1188;
    }
    float _1190 = _1034;
    float _1192 = _1072;
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1196 = _1126 + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1200 = _1128 + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1204 = _1130 + _1202;
    float _1206 = _1196 * _1196;
    float _1208 = fma(_1200, _1200, _1206);
    float _1210 = fma(_1204, _1204, _1208);
    float _1212 = rsqrt(_1210);
    float _1214 = sqrt(_1210);
    float _1216 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1218 = _1200 * _1216;
    float _1220 = _1204 * _1216;
    float _1222 = _1218 * _1218;
    float _1224 = _1220 * _1220;
    float _1226 = _1222 + _1224;
    float _1228 = sqrt(_1226);
    bool _1230 = _1228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1228 + _1232;
    float _1236 = _1212;
    float _1238 = _1226;
    float _1240 = _1234;
    float _1242 = _1196;
    float _1244 = _1216;
    if (_1230)
    {
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1236 = _1246;
    }
    float _1248 = _1236;
    if (_1230)
    {
        float _1250 = rsqrt(_1226);
        _1238 = _1250;
    }
    float _1252 = _1238;
    float _1254 = _1252;
    if (_1230)
    {
        float _1256 = _1234 * _1248;
        _1240 = _1256;
    }
    float _1258 = _1240;
    if (_1230)
    {
        float _1260 = _1258 * 0.15915493667125701904296875;
        _1074 = _1260;
    }
    float _1262 = _1074;
    float _1264 = _1204;
    float _1266 = _1262;
    if (_1230)
    {
        float _1268 = _1262 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        _1264 = _1270;
    }
    float _1272 = _1264;
    float _1274 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1276 = precise::max(0.0, _1274);
    float _1278 = _1190;
    float _1280 = _1276;
    float _1282 = _1274;
    if (_1230)
    {
        float _1284 = _1262 * 6.283185482025146484375;
        float _1286 = cos(_1284);
        _1278 = _1286;
    }
    float _1288 = _1278;
    float _1290 = -_1216;
    float _1292 = -_1276;
    float _1294 = fma(_1196, _1290, _1292);
    if (!_1230)
    {
        _1242 = _1220;
    }
    float _1296 = _1242;
    float _1298 = _1296;
    if (_1230)
    {
        float _1300 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1280 = _1300;
    }
    float _1302 = _1280;
    float _1304 = _1272;
    float _1306 = _1302;
    if (_1230)
    {
        float _1308 = fma(_1272, _1302, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1304 = _1308;
    }
    float _1310 = _1304;
    float _1312 = _1310;
    if (!_1230)
    {
        _1306 = _1218;
    }
    float _1314 = _1306;
    float _1316 = _1314;
    if (_1230)
    {
        float _1318 = _1288 + (-1.0);
        _1282 = _1318;
    }
    float _1320 = _1282;
    float _1322 = _1320;
    if (_1230)
    {
        float _1324 = _1252 * _1310;
        _1244 = _1324;
    }
    float _1326 = _1244;
    if (!_1230)
    {
        _1312 = _1294;
    }
    float _1328 = _1312;
    float _1330 = _1328;
    if (_1230)
    {
        float _1332 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1266 = _1332;
    }
    float _1334 = _1266;
    if (_1230)
    {
        float _1336 = _1218 * _1326;
        _1316 = _1336;
    }
    float _1338 = _1316;
    if (!_1230)
    {
        _1254 = _1222;
    }
    float _1340 = _1254;
    float _1342 = _1340;
    if (_1230)
    {
        float _1344 = _1220 * _1326;
        _1298 = _1344;
    }
    float _1346 = _1298;
    if (_1230)
    {
        float _1348 = fma(_1294, _1288, _1334);
        _1330 = _1348;
    }
    float _1350 = _1330;
    if (_1230)
    {
        float _1352 = _1338 * _1338;
        _1342 = _1352;
    }
    float _1354 = _1342;
    if (!_1230)
    {
        _1322 = _1224;
    }
    float _1356 = _1322;
    float _1358 = _1356;
    if (_1230)
    {
        float _1360 = _1346 * _1346;
        _1358 = _1360;
    }
    float _1362 = _1358;
    float _1364 = fma(_1350, _1350, _1354);
    float _1366 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1368 = _1364 + _1362;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1372 = fma(_1214, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1370);
    float _1374 = precise::clamp(_1372, 0.0, 1.0);
    float _1376 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1378 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1366);
    float _1380 = rsqrt(_1368);
    float _1382 = -_1374;
    float _1384 = _1382 + 1.0;
    float _1386 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1388 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1376);
    float _1390 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1392 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1394 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1386);
    float _1396 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1388);
    float _1398 = abs(_1384);
    float _1400 = log2(_1398);
    float _1402 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1392);
    float _1404 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1394);
    float _1406 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1408 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1378);
    float _1410 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1414 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1416 = _1380 * _1338;
    float _1418 = _1380 * _1350;
    float _1420 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1422 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1414);
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1426 = _1380 * _1346;
    float _1428 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1430 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1432 = -_1424;
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1432);
    float _1436 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1422);
    float _1438 = -_1428;
    float _1440 = fma(_1438, _1390, 1.0);
    float _1442 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1444 = -_1426;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1434);
    float _1448 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1436);
    float _1450 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1452 = exp2(_1442);
    float _1454 = fma(_1446, -0.5, 0.5);
    float _1456 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1458 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1450);
    float _1460 = fma(_1446, 0.5, 0.5);
    float _1462 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1456);
    float _1464 = log2(_1440);
    float _1466 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1458);
    float _1468 = fma(_1460, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1470 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1462);
    float _1472 = _1418 + 1.0;
    float _1474 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1466);
    float _1476 = fma(_1460, _1468, -0.212114393711090087890625);
    float _1478 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1470);
    float _1480 = 1.0 / _1448;
    float _1482 = -_1418;
    float _1484 = fma(_1452, _1472, _1482);
    float _1486 = fma(_1460, _1476, 1.570728778839111328125);
    float _1488 = sqrt(_1454);
    float _1490 = _1464 * 0.693147182464599609375;
    float _1492 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1494 = _1474 * _1480;
    float _1496 = _1478 * _1480;
    float _1498 = fma(_1494, 0.5, 0.5);
    float _1500 = fma(_1496, -0.5, 0.5);
    float _1502 = fma(_1484, 0.5, 0.5);
    float _1504 = _1488 * 0.636619746685028076171875;
    float _1506 = -_1486;
    float _1508 = fma(_1504, _1506, 1.0);
    float3 _4058 = float3(_1498, _1500, _1492);
    float _1510 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4058, float3(0.0), isnan(_4058)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4058, float3(0.0), isnan(_4058)), level(0.0)).x;
    float3 _4069 = float3(_1498, _1500, _1492);
    float4 _1513 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4069, float3(0.0), isnan(_4069)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4069, float3(0.0), isnan(_4069)), level(0.0)).xyzw;
    float _1515 = _1513.x;
    float _1517 = _1513.y;
    float _1519 = _1513.z;
    float _1521 = _1513.w;
    float2 _4086 = float2(_1508, _1502);
    float3 _1525 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4086, float2(0.0), isnan(_4086)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4086, float2(0.0), isnan(_4086)), level(0.0)).xyz;
    float _1527 = _1525.x;
    float _1529 = _1525.y;
    float _1531 = _1525.z;
    float _1533 = in.m_51.w;
    float _1535 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1537 = _590 > 0.5;
    float _1539 = in.m_59.z;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1543 = _1541 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1545 = in.m_61.y;
    float _1547 = 1.0 / _1543;
    float _1549 = in.m_59.y;
    int _1551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1553 = _1551 != 0;
    float _1555 = in.m_59.w;
    int _1557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1559 = _1557 != 0;
    float _1561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1563 = _528 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1565 = isnan(_528);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1571 = _1567 || _1569;
    float _1573 = float(_1571);
    float _1575 = in.m_61.x;
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1579 = _1577 != 0;
    int _1581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1583 = _1581 != 0;
    float _1585 = in.m_59.x;
    bool _1587 = _1533 > 0.5;
    out.m_63.z = _1539;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1589;
    float _1593 = -_1545;
    float _1595 = _1593 + 1.0;
    float _1597 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1599 = _1591 * _1547;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1603 = _528 + _1601;
    float _1605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1607 = _528 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1609 = isnan(_528);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1615 = _1611 || _1613;
    float _1617 = float(_1615);
    out.m_63.y = _1549;
    float _1619 = fma(_1599, _1603, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1621 = -_1573;
    float _1623 = _1621 + 1.0;
    out.m_63.w = _1555;
    float _1625 = _1617 * _1623;
    float _1627 = -_1617;
    float _1629 = _1627 + 1.0;
    int _1631 = _1587 ? as_type<int>(_1595) : as_type<int>(_1545);
    out.m_63.x = _1585;
    float _1633 = _1619 * _1625;
    float _1635 = _1619;
    int _1637 = as_type<int>(_1555);
    bool _1639 = _1579;
    bool _1641 = _1587;
    float _1643 = _1585;
    float _1645 = _1545;
    if (!_1553)
    {
        _1635 = _1575;
    }
    float _1647 = _1635;
    float _1649 = _1647;
    if (_1553)
    {
        float _1651 = -_1575;
        float _1653 = _1651 + 1.0;
        _1637 = as_type<int>(_1653);
    }
    int _1655 = _1637;
    float _1657 = _1579 ? as_type<float>(_1631) : _1545;
    float _1659 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1633);
    if (_1553)
    {
        bool _1661 = _530 > 0.5;
        _1639 = _1661;
    }
    bool _1663 = _1639;
    float _1665 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1559)
    {
        float _1667 = -_1575;
        float _1669 = _1667 + 1.0;
        _576 = as_type<int>(_1669);
    }
    int _1671 = _576;
    if (_1553)
    {
        float _1673 = _1663 ? as_type<float>(_1655) : _1575;
        _1649 = _1673;
    }
    float _1675 = _1649;
    float _1677 = fma(_1597, _1657, -0.5);
    if (_1559)
    {
        bool _1679 = _540 > 0.5;
        _1641 = _1679;
    }
    bool _1681 = _1641;
    float _1683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1685 = fma(_1665, _1675, -0.5);
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1689 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (!_1559)
    {
        _1643 = _1575;
    }
    float _1693 = _1643;
    float _1695 = -_716;
    float _1697 = fma(_772, _1677, _1695);
    float _1699 = _1693;
    if (_1559)
    {
        float _1701 = _1681 ? as_type<float>(_1671) : _1575;
        _1699 = _1701;
    }
    float _1703 = _1699;
    float _1705 = exp2(_1689);
    float _1707 = fma(_1573, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1659);
    if (_1583)
    {
        float _1709 = _1537 ? _1595 : _1545;
        _1645 = _1709;
    }
    float _1711 = _1645;
    float _1713 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1715 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1535);
    float _1717 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1719 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1721 = _1713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1725 = _1707 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1727 = _1711 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1729 = _1697 + 0.5;
    float _1731 = _1192 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1733 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1715);
    out.m_65.x = _1717;
    out.m_65.y = _1719;
    out.m_65.z = _1721;
    out.m_65.w = _1725;
    bool _1735 = _1192 > 0.0;
    bool _1737 = isnan(_1192);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan(0.0);
    bool _1743 = _1739 || _1741;
    float _1745 = -_1705;
    float _1747 = _1745 + 1.0;
    float _1749 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1733);
    float _1751 = fma(_704, _1685, _770);
    float _1753 = _1747 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1755 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1757 = _1751 + 0.5;
    out.gl_Position.x = _1474;
    out.gl_Position.y = _1478;
    out.gl_Position.z = _1749;
    out.gl_Position.w = _1448;
    float _1759 = _1755 * _1683;
    float _1761 = _1727 * _1723;
    float _1763 = _1731 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1765 = _1749 + _1448;
    out.m_67.x = _1759;
    out.m_67.y = _1761;
    out.m_67.z = _1757;
    out.m_67.w = _1729;
    float _1767 = _1765 * 0.5;
    out.m_45.x = _1763;
    out.m_69.z = _1767;
    out.m_69.w = _1448;
    float _1769 = _1753 * _1510;
    float _1771 = -_1753;
    float _1773 = _1771 + 1.0;
    float _1775 = _1521 * _1769;
    float _1777 = _1531 * _1769;
    float _1779 = _1521 * _1773;
    float _1781 = fma(_1527, _1775, _1515);
    float _1783 = fma(_1529, _1775, _1517);
    float _1785 = fma(_1521, _1777, _1519);
    out.m_71.x = _1781;
    out.m_71.y = _1783;
    out.m_71.z = _1785;
    out.m_71.w = _1779;
    if (_1743)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1787 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1787;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _520 = false;
    bool _414 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1844 = as_type<float>(_106);
        out.gl_Position.z = _1844;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1914 = as_type<float>(_144);
        out.gl_Position.z = _1914;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_51.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = -_312;
    float _320 = _318 + 1.0;
    bool _322 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_296);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = 1.0 / _316;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _340;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _346 = _300 * _334;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _348;
    float _352 = in.m_49.x;
    float _354 = in.m_49.y;
    float _356 = in.m_49.z;
    float _358 = _332 * _320;
    float _360 = fma(_338, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _362 = fma(_350, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _364 = fma(_342, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _366 = -_332;
    float _368 = _366 + 1.0;
    float _370 = _360 * _358;
    float _372 = _362 * _358;
    float _374 = _364 * _358;
    float _376 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].x, _370);
    float _378 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].y, _372);
    float _380 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].z, _374);
    float _382 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _376);
    float _384 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _378);
    float _386 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _380);
    float _388 = _382 * _352;
    float _390 = _384 * _354;
    float _392 = _386 * _356;
    bool _394 = !_344;
    float _412;
    if (!_394)
    {
        float _396 = in.m_51.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_90);
        float _418 = 1.0 / _416;
        float _420 = _124 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    bool _424 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _426 = isnan(_422);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _440 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _442 = isnan(_422);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _458 = _422 + _456;
    float _460 = -_434;
    float _462 = _460 + 1.0;
    float _464 = 1.0 / _438;
    bool _466 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _468 = _450 * _462;
    float _470 = -_450;
    float _472 = _470 + 1.0;
    float _474 = _454 * _464;
    float _476 = fma(_474, _458, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _478 = _476 * _468;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _484 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[115].x, _478);
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _488 = _480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = _482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _492 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[116].x, _484);
    float _494 = _486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _496 = _492 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _488;
    out.m_53.y = _490;
    out.m_53.z = _494;
    out.m_53.w = _496;
    bool _498 = !_466;
    float _500 = _492;
    float _518;
    if (!_498)
    {
        float _502 = in.m_51.x;
        float _504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _506 = _502 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _510 = _508 * _504;
        float _512 = floor(_510);
        float _514 = -_512;
        float _516 = _510 + _514;
        _518 = _516;
        _520 = true;
    }
    else
    {
        float _522 = float(_90);
        float _524 = 1.0 / _522;
        float _526 = _124 * _524;
        _518 = _526;
    }
    _520 = false;
    float _528 = _518;
    float _530 = in.m_51.z;
    float _532 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _534 = log2(_532);
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _538 = _536 != 0;
    float _540 = in.m_51.x;
    float _542 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _554 = _552 != 0;
    float _556 = _388 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _560 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _562 = _434;
    if (!_538)
    {
        float _564 = in.m_51.y;
        _562 = _564;
    }
    float _566 = _562;
    float _568 = _530 * 2.0;
    float _570 = _540 * 2.0;
    float _572 = floor(_568);
    float _574 = floor(_570);
    int _576 = as_type<int>(_530);
    if (!_538)
    {
        _500 = _566;
    }
    float _578 = _500;
    float _580 = _578;
    float _582 = _566;
    if (_538)
    {
        float _584 = in.m_51.x;
        float _586 = in.m_51.y;
        _580 = _584;
        _582 = _586;
    }
    float _588 = _580;
    float _590 = _582;
    bool _592 = _572 >= 0.0;
    bool _594 = isnan(_572);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    bool _602 = _572 > 0.0;
    int _604 = _600 ? 0 : 1;
    float _606 = _572;
    if (!_538)
    {
        _606 = _530;
    }
    float _608 = _606;
    bool _610 = _574 > 0.0;
    bool _612 = _574 >= 0.0;
    bool _614 = isnan(_574);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _624 = ~_604;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    int _630 = _628;
    float _632 = _608;
    if (!_602)
    {
        int _634 = ~_604;
        int _636 = _634 + 1;
        _630 = _636;
    }
    int _638 = _630;
    float _640 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[83].z, _558);
    if (_538)
    {
        _632 = _590;
    }
    float _642 = _632;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _646 = _588 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _648 = _620 ? 0 : 1;
    float _650 = _590 * 2.0;
    float _652 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[83].w, _644);
    float _654 = -_622;
    float _656 = fma(_646, 2.0, _654);
    float _658 = _642;
    if (!_538)
    {
        _658 = _530;
    }
    float _660 = _658;
    float _662 = _540 + _590;
    float _664 = _534 * _124;
    float _666 = _660;
    if (_538)
    {
        _666 = _590;
    }
    float _668 = _666;
    float _670 = _662 + (-1.0);
    int _672 = ~_648;
    int _674 = _672 + 1;
    int _676 = _674 + 1;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _680 = _676;
    if (!_610)
    {
        int _682 = ~_648;
        int _684 = _682 + 1;
        _680 = _684;
    }
    int _686 = _680;
    float _688 = _530 + _590;
    float _690 = _668 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _692 = exp2(_664);
    float _694 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _696 = _688 + (-1.0);
    float _698 = fma(_690, -2.0, _678);
    bool _700 = !_546;
    int _702 = _700 ? 0 : 1;
    float _704 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _640);
    bool _706 = !_550;
    int _708 = _706 ? 0 : 1;
    float _710 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _712 = floor(_650);
    int _714 = abs(_702);
    float _716 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _698);
    int _718 = abs(_708);
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _722 = 1.0 + _720;
    float _724 = in.m_55.x;
    float _726 = in.m_55.y;
    float _728 = in.m_55.z;
    bool _730 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _732 = isnan(1.0);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _738 = _734 || _736;
    float _740 = -_692;
    float _742 = _740 + 1.0;
    float _744 = 1.0 / _722;
    float _746 = float(_714);
    float _748 = float(_718);
    float _750 = float(_638);
    bool _752 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _760 = _756 || _758;
    bool _762 = _712 > 0.0;
    float _764 = _746 * _750;
    float _766 = _760 ? _742 : 0.0;
    float _768 = -_124;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[81].x, _656);
    float _772 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _652);
    float _774 = _764 * (-2.0);
    bool _776 = !_554;
    int _778 = _776 ? 0 : 1;
    if (_738)
    {
        float _780 = _766 * _744;
        _126 = _780;
    }
    float _782 = _126;
    bool _784 = _712 >= 0.0;
    bool _786 = isnan(_712);
    bool _788 = _784 || _786;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    float _794 = _540 + (-0.5);
    float _796 = float(_686);
    float _798 = fma(_774, _724, _724);
    int _800 = abs(_778);
    float _802 = fma(_694, _774, _694);
    int _804 = _792 ? 0 : 1;
    float _806 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[196].x, _798);
    float _808 = _748 * _796;
    int _810 = ~_804;
    int _812 = _810 + 1;
    int _814 = _812 + 1;
    float _816 = fma(_802, _782, _806);
    int _818 = _814;
    if (!_762)
    {
        int _820 = ~_804;
        int _822 = _820 + 1;
        _818 = _822;
    }
    int _824 = _818;
    float _826 = _808 * (-2.0);
    float _828 = float(_800);
    float _830 = _816 * 0.15915493667125701904296875;
    float _832 = float(_824);
    float _834 = fma(_710, _826, _710);
    float _836 = fma(_826, _726, _726);
    float _838 = _590 + (-0.5);
    float _840 = _540 + _530;
    float _842 = _828 * _832;
    float _844 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[196].y, _836);
    float _846 = _840 + (-1.0);
    float _848 = _842 * (-2.0);
    float _850 = _530 + (-0.5);
    float _852 = fma(_834, _782, _844);
    float _854 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _856 = fma(_848, _728, _728);
    float _858 = _830 * 6.283185482025146484375;
    float _860 = sin(_858);
    float _862 = in.m_57.x;
    float _864 = in.m_57.y;
    float _866 = in.m_57.z;
    float _868 = fma(_854, _848, _854);
    float _870 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[196].z, _856);
    float _872 = _852 * 0.15915493667125701904296875;
    float _874 = fma(_868, _782, _870);
    float _876 = _830 * 6.283185482025146484375;
    float _878 = cos(_876);
    float _880 = _874 * 0.15915493667125701904296875;
    float _882 = _872 * 6.283185482025146484375;
    float _884 = sin(_882);
    bool _886 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _888 = isnan(0.5);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _894 = _890 || _892;
    float _896 = _872 * 6.283185482025146484375;
    float _898 = cos(_896);
    float _900 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _862);
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _864);
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _866);
    float _906 = _556 * _900;
    float _908 = _542 * _902;
    float _910 = _560 * _904;
    float _912 = _880 * 6.283185482025146484375;
    float _914 = cos(_912);
    float _916 = _878 * _884;
    float _918 = _860 * _884;
    float _920 = _880 * 6.283185482025146484375;
    float _922 = sin(_920);
    float _924 = _860 * _898;
    float _926 = _878 * _898;
    float _928 = _914 * _908;
    float _930 = _898 * _914;
    float _932 = _884 * _914;
    float _934 = _878 * _928;
    float _936 = _860 * _928;
    float _938 = -_916;
    float _940 = fma(_922, _924, _938);
    float _942 = -_924;
    float _944 = fma(_922, _916, _942);
    float _946 = fma(_922, _926, _918);
    float _948 = fma(_922, _918, _926);
    float _950 = -_908;
    float _952 = _922 * _950;
    float _954 = fma(_940, _906, _936);
    float _956 = fma(_946, _906, _934);
    float _958 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _960 = fma(_930, _906, _952);
    float _962 = fma(_948, _910, _954);
    float _964 = fma(_944, _910, _956);
    float _966 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _968 = fma(_932, _910, _960);
    float _970 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _972 = _964 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _974 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _958);
    float _976 = _964 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _978 = _964 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _980 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].x, _972);
    float _982 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _966);
    float _984 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _974);
    float _986 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].x, _976);
    float _988 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[26].z, _980);
    float _990 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _982);
    float _992 = _984 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _994 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[24].z, _986);
    float _996 = _988 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _998 = _990 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1000 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _970);
    float _1002 = _994 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1004 = _992 + _996;
    float _1006 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].x, _978);
    float _1008 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1000);
    float _1010 = _998 + _1002;
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1014 = _1004 + _1012;
    float _1016 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1006);
    float _1018 = _1008 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1022 = _1010 + _1020;
    float _1024 = _1014 * _1014;
    float _1026 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1028 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1030 = _962;
    float _1032 = _1018;
    float _1034 = _1026;
    if (_894)
    {
        _1030 = 1.0;
    }
    float _1036 = _1030;
    float _1038 = fma(_1022, _1022, _1024);
    float _1040 = _1018 + _1026;
    float _1042 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1028);
    float _1044 = sqrt(_1038);
    float _1046 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1042);
    float _1048 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1050 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1052 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1048);
    float _1054 = 1.0 / _1050;
    float _1056 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1052);
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1060 = _1044 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = _1058 + _1050;
    float _1064 = _1062 * _1054;
    float _1066 = _1064 * 0.5;
    float _1068 = _1050;
    float _1070 = _1062;
    float _1072 = _1036;
    float _1074 = _1066;
    if (!_1060)
    {
        _1068 = _1010;
    }
    float _1076 = _1068;
    float _1078 = _1076;
    if (!_1060)
    {
        _1070 = _1004;
    }
    float _1080 = _1070;
    float _1082 = _1080;
    if (!_1060)
    {
        _1032 = _1040;
    }
    float _1084 = _1032;
    bool _1086 = !_1060;
    float _1088 = _1084;
    if (!_1086)
    {
        float _1090 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1094 = _1044 + _1092;
        float _1096 = rsqrt(_1038);
        float _1098 = _1094 * _1090;
        float _1100 = _1040 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1102 = _1098 * 0.15915493667125701904296875;
        float _1104 = _1102 * 6.283185482025146484375;
        float _1106 = cos(_1104);
        float _1108 = _1102 * 6.283185482025146484375;
        float _1110 = sin(_1108);
        float _1112 = _1106 + (-1.0);
        float _1114 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1116 = fma(_1110, _1100, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1118 = fma(_1040, _1106, _1114);
        float _1120 = _1096 * _1116;
        float _1122 = fma(_1022, _1120, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1124 = fma(_1014, _1120, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1088 = _1118;
        _1078 = _1122;
        _1082 = _1124;
    }
    float _1126 = _1088;
    float _1128 = _1078;
    float _1130 = _1082;
    if (!_894)
    {
        float _1132 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1134 = _1132 * 0.15915493667125701904296875;
        float _1136 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1140 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1138);
        float _1142 = _1134 * 6.283185482025146484375;
        float _1144 = cos(_1142);
        float _1146 = _1136 * 0.15915493667125701904296875;
        float _1148 = _1134 * 6.283185482025146484375;
        float _1150 = sin(_1148);
        float _1152 = 1.0 / _1144;
        float _1154 = _1146 * 6.283185482025146484375;
        float _1156 = cos(_1154);
        float _1158 = _1150 * _1152;
        float _1160 = _1146 * 6.283185482025146484375;
        float _1162 = sin(_1160);
        float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1166 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1164;
        float _1168 = _1156 * _1158;
        float _1170 = 1.0 / _1140;
        float _1172 = 1.0 / _1168;
        float _1174 = 1.0 / _1166;
        float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1178 = _1170 * _1176;
        float _1180 = _1162 * _1172;
        float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1184 = fma(_1180, _1178, _1182);
        float _1186 = _1184 * _1174;
        float _1188 = precise::clamp(_1186, 0.0, 1.0);
        _1034 = _1170;
        _1072 = _1188;
    }
    float _1190 = _1034;
    float _1192 = _1072;
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1196 = _1126 + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1200 = _1128 + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1204 = _1130 + _1202;
    float _1206 = _1196 * _1196;
    float _1208 = fma(_1200, _1200, _1206);
    float _1210 = fma(_1204, _1204, _1208);
    float _1212 = rsqrt(_1210);
    float _1214 = sqrt(_1210);
    float _1216 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1218 = _1200 * _1216;
    float _1220 = _1204 * _1216;
    float _1222 = _1218 * _1218;
    float _1224 = _1220 * _1220;
    float _1226 = _1222 + _1224;
    float _1228 = sqrt(_1226);
    bool _1230 = _1228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1228 + _1232;
    float _1236 = _1212;
    float _1238 = _1226;
    float _1240 = _1234;
    float _1242 = _1196;
    float _1244 = _1216;
    if (_1230)
    {
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1236 = _1246;
    }
    float _1248 = _1236;
    if (_1230)
    {
        float _1250 = rsqrt(_1226);
        _1238 = _1250;
    }
    float _1252 = _1238;
    float _1254 = _1252;
    if (_1230)
    {
        float _1256 = _1234 * _1248;
        _1240 = _1256;
    }
    float _1258 = _1240;
    if (_1230)
    {
        float _1260 = _1258 * 0.15915493667125701904296875;
        _1074 = _1260;
    }
    float _1262 = _1074;
    float _1264 = _1204;
    float _1266 = _1262;
    if (_1230)
    {
        float _1268 = _1262 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        _1264 = _1270;
    }
    float _1272 = _1264;
    float _1274 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1276 = precise::max(0.0, _1274);
    float _1278 = _1190;
    float _1280 = _1276;
    float _1282 = _1274;
    if (_1230)
    {
        float _1284 = _1262 * 6.283185482025146484375;
        float _1286 = cos(_1284);
        _1278 = _1286;
    }
    float _1288 = _1278;
    float _1290 = -_1216;
    float _1292 = -_1276;
    float _1294 = fma(_1196, _1290, _1292);
    if (!_1230)
    {
        _1242 = _1220;
    }
    float _1296 = _1242;
    float _1298 = _1296;
    if (_1230)
    {
        float _1300 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1280 = _1300;
    }
    float _1302 = _1280;
    float _1304 = _1272;
    float _1306 = _1302;
    if (_1230)
    {
        float _1308 = fma(_1272, _1302, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1304 = _1308;
    }
    float _1310 = _1304;
    float _1312 = _1310;
    if (!_1230)
    {
        _1306 = _1218;
    }
    float _1314 = _1306;
    float _1316 = _1314;
    if (_1230)
    {
        float _1318 = _1288 + (-1.0);
        _1282 = _1318;
    }
    float _1320 = _1282;
    float _1322 = _1320;
    if (_1230)
    {
        float _1324 = _1252 * _1310;
        _1244 = _1324;
    }
    float _1326 = _1244;
    if (!_1230)
    {
        _1312 = _1294;
    }
    float _1328 = _1312;
    float _1330 = _1328;
    if (_1230)
    {
        float _1332 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1266 = _1332;
    }
    float _1334 = _1266;
    if (_1230)
    {
        float _1336 = _1218 * _1326;
        _1316 = _1336;
    }
    float _1338 = _1316;
    if (!_1230)
    {
        _1254 = _1222;
    }
    float _1340 = _1254;
    float _1342 = _1340;
    if (_1230)
    {
        float _1344 = _1220 * _1326;
        _1298 = _1344;
    }
    float _1346 = _1298;
    if (_1230)
    {
        float _1348 = fma(_1294, _1288, _1334);
        _1330 = _1348;
    }
    float _1350 = _1330;
    if (_1230)
    {
        float _1352 = _1338 * _1338;
        _1342 = _1352;
    }
    float _1354 = _1342;
    if (!_1230)
    {
        _1322 = _1224;
    }
    float _1356 = _1322;
    float _1358 = _1356;
    if (_1230)
    {
        float _1360 = _1346 * _1346;
        _1358 = _1360;
    }
    float _1362 = _1358;
    float _1364 = fma(_1350, _1350, _1354);
    float _1366 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1368 = _1364 + _1362;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1372 = fma(_1214, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1370);
    float _1374 = precise::clamp(_1372, 0.0, 1.0);
    float _1376 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1378 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1366);
    float _1380 = rsqrt(_1368);
    float _1382 = -_1374;
    float _1384 = _1382 + 1.0;
    float _1386 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1388 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1376);
    float _1390 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1392 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1394 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1386);
    float _1396 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1388);
    float _1398 = abs(_1384);
    float _1400 = log2(_1398);
    float _1402 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1392);
    float _1404 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1394);
    float _1406 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1408 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1378);
    float _1410 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1414 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1416 = _1380 * _1338;
    float _1418 = _1380 * _1350;
    float _1420 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1422 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1414);
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1426 = _1380 * _1346;
    float _1428 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1430 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1432 = -_1424;
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1432);
    float _1436 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1422);
    float _1438 = -_1428;
    float _1440 = fma(_1438, _1390, 1.0);
    float _1442 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1444 = -_1426;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1434);
    float _1448 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1436);
    float _1450 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1452 = exp2(_1442);
    float _1454 = fma(_1446, -0.5, 0.5);
    float _1456 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1458 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1450);
    float _1460 = fma(_1446, 0.5, 0.5);
    float _1462 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1456);
    float _1464 = log2(_1440);
    float _1466 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1458);
    float _1468 = fma(_1460, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1470 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1462);
    float _1472 = _1418 + 1.0;
    float _1474 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1466);
    float _1476 = fma(_1460, _1468, -0.212114393711090087890625);
    float _1478 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1470);
    float _1480 = 1.0 / _1448;
    float _1482 = -_1418;
    float _1484 = fma(_1452, _1472, _1482);
    float _1486 = fma(_1460, _1476, 1.570728778839111328125);
    float _1488 = sqrt(_1454);
    float _1490 = _1464 * 0.693147182464599609375;
    float _1492 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1494 = _1474 * _1480;
    float _1496 = _1478 * _1480;
    float _1498 = fma(_1494, 0.5, 0.5);
    float _1500 = fma(_1496, -0.5, 0.5);
    float _1502 = fma(_1484, 0.5, 0.5);
    float _1504 = _1488 * 0.636619746685028076171875;
    float _1506 = -_1486;
    float _1508 = fma(_1504, _1506, 1.0);
    float3 _4058 = float3(_1498, _1500, _1492);
    float _1510 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4058, float3(0.0), isnan(_4058)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4058, float3(0.0), isnan(_4058)), level(0.0)).x;
    float3 _4069 = float3(_1498, _1500, _1492);
    float4 _1513 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4069, float3(0.0), isnan(_4069)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4069, float3(0.0), isnan(_4069)), level(0.0)).xyzw;
    float _1515 = _1513.x;
    float _1517 = _1513.y;
    float _1519 = _1513.z;
    float _1521 = _1513.w;
    float2 _4086 = float2(_1508, _1502);
    float3 _1525 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4086, float2(0.0), isnan(_4086)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4086, float2(0.0), isnan(_4086)), level(0.0)).xyz;
    float _1527 = _1525.x;
    float _1529 = _1525.y;
    float _1531 = _1525.z;
    float _1533 = in.m_51.w;
    float _1535 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1537 = _590 > 0.5;
    float _1539 = in.m_59.z;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1543 = _1541 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1545 = in.m_61.y;
    float _1547 = 1.0 / _1543;
    float _1549 = in.m_59.y;
    int _1551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1553 = _1551 != 0;
    float _1555 = in.m_59.w;
    int _1557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1559 = _1557 != 0;
    float _1561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1563 = _528 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1565 = isnan(_528);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1571 = _1567 || _1569;
    float _1573 = float(_1571);
    float _1575 = in.m_61.x;
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1579 = _1577 != 0;
    int _1581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1583 = _1581 != 0;
    float _1585 = in.m_59.x;
    bool _1587 = _1533 > 0.5;
    out.m_63.z = _1539;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1589;
    float _1593 = -_1545;
    float _1595 = _1593 + 1.0;
    float _1597 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1599 = _1591 * _1547;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1603 = _528 + _1601;
    float _1605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1607 = _528 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1609 = isnan(_528);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1615 = _1611 || _1613;
    float _1617 = float(_1615);
    out.m_63.y = _1549;
    float _1619 = fma(_1599, _1603, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1621 = -_1573;
    float _1623 = _1621 + 1.0;
    out.m_63.w = _1555;
    float _1625 = _1617 * _1623;
    float _1627 = -_1617;
    float _1629 = _1627 + 1.0;
    int _1631 = _1587 ? as_type<int>(_1595) : as_type<int>(_1545);
    out.m_63.x = _1585;
    float _1633 = _1619 * _1625;
    float _1635 = _1619;
    int _1637 = as_type<int>(_1555);
    bool _1639 = _1579;
    bool _1641 = _1587;
    float _1643 = _1585;
    float _1645 = _1545;
    if (!_1553)
    {
        _1635 = _1575;
    }
    float _1647 = _1635;
    float _1649 = _1647;
    if (_1553)
    {
        float _1651 = -_1575;
        float _1653 = _1651 + 1.0;
        _1637 = as_type<int>(_1653);
    }
    int _1655 = _1637;
    float _1657 = _1579 ? as_type<float>(_1631) : _1545;
    float _1659 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1633);
    if (_1553)
    {
        bool _1661 = _530 > 0.5;
        _1639 = _1661;
    }
    bool _1663 = _1639;
    float _1665 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1559)
    {
        float _1667 = -_1575;
        float _1669 = _1667 + 1.0;
        _576 = as_type<int>(_1669);
    }
    int _1671 = _576;
    if (_1553)
    {
        float _1673 = _1663 ? as_type<float>(_1655) : _1575;
        _1649 = _1673;
    }
    float _1675 = _1649;
    float _1677 = fma(_1597, _1657, -0.5);
    if (_1559)
    {
        bool _1679 = _540 > 0.5;
        _1641 = _1679;
    }
    bool _1681 = _1641;
    float _1683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1685 = fma(_1665, _1675, -0.5);
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1689 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (!_1559)
    {
        _1643 = _1575;
    }
    float _1693 = _1643;
    float _1695 = -_716;
    float _1697 = fma(_772, _1677, _1695);
    float _1699 = _1693;
    if (_1559)
    {
        float _1701 = _1681 ? as_type<float>(_1671) : _1575;
        _1699 = _1701;
    }
    float _1703 = _1699;
    float _1705 = exp2(_1689);
    float _1707 = fma(_1573, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1659);
    if (_1583)
    {
        float _1709 = _1537 ? _1595 : _1545;
        _1645 = _1709;
    }
    float _1711 = _1645;
    float _1713 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1715 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1535);
    float _1717 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1719 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1721 = _1713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1725 = _1707 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1727 = _1711 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1729 = _1697 + 0.5;
    float _1731 = _1192 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1733 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1715);
    out.m_65.x = _1717;
    out.m_65.y = _1719;
    out.m_65.z = _1721;
    out.m_65.w = _1725;
    bool _1735 = _1192 > 0.0;
    bool _1737 = isnan(_1192);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan(0.0);
    bool _1743 = _1739 || _1741;
    float _1745 = -_1705;
    float _1747 = _1745 + 1.0;
    float _1749 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1733);
    float _1751 = fma(_704, _1685, _770);
    float _1753 = _1747 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1755 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1757 = _1751 + 0.5;
    out.gl_Position.x = _1474;
    out.gl_Position.y = _1478;
    out.gl_Position.z = _1749;
    out.gl_Position.w = _1448;
    float _1759 = _1755 * _1683;
    float _1761 = _1727 * _1723;
    float _1763 = _1731 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1765 = _1749 + _1448;
    out.m_67.x = _1759;
    out.m_67.y = _1761;
    out.m_67.z = _1757;
    out.m_67.w = _1729;
    float _1767 = _1765 * 0.5;
    out.m_45.x = _1763;
    out.m_69.z = _1767;
    out.m_69.w = _1448;
    float _1769 = _1753 * _1510;
    float _1771 = -_1753;
    float _1773 = _1771 + 1.0;
    float _1775 = _1521 * _1769;
    float _1777 = _1531 * _1769;
    float _1779 = _1521 * _1773;
    float _1781 = fma(_1527, _1775, _1515);
    float _1783 = fma(_1529, _1775, _1517);
    float _1785 = fma(_1521, _1777, _1519);
    out.m_71.x = _1781;
    out.m_71.y = _1783;
    out.m_71.z = _1785;
    out.m_71.w = _1779;
    if (_1743)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1787 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1787;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _520 = false;
    bool _414 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1844 = as_type<float>(_106);
        out.gl_Position.z = _1844;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1914 = as_type<float>(_144);
        out.gl_Position.z = _1914;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_51.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = -_312;
    float _320 = _318 + 1.0;
    bool _322 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_296);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = 1.0 / _316;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _340;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _346 = _300 * _334;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _348;
    float _352 = in.m_49.x;
    float _354 = in.m_49.y;
    float _356 = in.m_49.z;
    float _358 = _332 * _320;
    float _360 = fma(_338, _346, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _362 = fma(_350, _346, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _364 = fma(_342, _346, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _366 = -_332;
    float _368 = _366 + 1.0;
    float _370 = _360 * _358;
    float _372 = _362 * _358;
    float _374 = _364 * _358;
    float _376 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].x, _370);
    float _378 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].y, _372);
    float _380 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].z, _374);
    float _382 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _376);
    float _384 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _378);
    float _386 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _380);
    float _388 = _382 * _352;
    float _390 = _384 * _354;
    float _392 = _386 * _356;
    bool _394 = !_344;
    float _412;
    if (!_394)
    {
        float _396 = in.m_51.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_90);
        float _418 = 1.0 / _416;
        float _420 = _124 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    bool _424 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _426 = isnan(_422);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _440 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _442 = isnan(_422);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _458 = _422 + _456;
    float _460 = -_434;
    float _462 = _460 + 1.0;
    float _464 = 1.0 / _438;
    bool _466 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _468 = _450 * _462;
    float _470 = -_450;
    float _472 = _470 + 1.0;
    float _474 = _454 * _464;
    float _476 = fma(_474, _458, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _478 = _476 * _468;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _484 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[115].x, _478);
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _488 = _480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = _482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _492 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[116].x, _484);
    float _494 = _486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _496 = _492 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _488;
    out.m_53.y = _490;
    out.m_53.z = _494;
    out.m_53.w = _496;
    bool _498 = !_466;
    float _500 = _492;
    float _518;
    if (!_498)
    {
        float _502 = in.m_51.x;
        float _504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _506 = _502 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _510 = _508 * _504;
        float _512 = floor(_510);
        float _514 = -_512;
        float _516 = _510 + _514;
        _518 = _516;
        _520 = true;
    }
    else
    {
        float _522 = float(_90);
        float _524 = 1.0 / _522;
        float _526 = _124 * _524;
        _518 = _526;
    }
    _520 = false;
    float _528 = _518;
    float _530 = in.m_51.z;
    float _532 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _534 = log2(_532);
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _538 = _536 != 0;
    float _540 = in.m_51.x;
    float _542 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _554 = _552 != 0;
    float _556 = _388 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _560 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _562 = _434;
    if (!_538)
    {
        float _564 = in.m_51.y;
        _562 = _564;
    }
    float _566 = _562;
    float _568 = _530 * 2.0;
    float _570 = _540 * 2.0;
    float _572 = floor(_568);
    float _574 = floor(_570);
    int _576 = as_type<int>(_530);
    if (!_538)
    {
        _500 = _566;
    }
    float _578 = _500;
    float _580 = _578;
    float _582 = _566;
    if (_538)
    {
        float _584 = in.m_51.x;
        float _586 = in.m_51.y;
        _580 = _584;
        _582 = _586;
    }
    float _588 = _580;
    float _590 = _582;
    bool _592 = _572 >= 0.0;
    bool _594 = isnan(_572);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    bool _602 = _572 > 0.0;
    int _604 = _600 ? 0 : 1;
    float _606 = _572;
    if (!_538)
    {
        _606 = _530;
    }
    float _608 = _606;
    bool _610 = _574 > 0.0;
    bool _612 = _574 >= 0.0;
    bool _614 = isnan(_574);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _624 = ~_604;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    int _630 = _628;
    float _632 = _608;
    if (!_602)
    {
        int _634 = ~_604;
        int _636 = _634 + 1;
        _630 = _636;
    }
    int _638 = _630;
    float _640 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[83].z, _558);
    if (_538)
    {
        _632 = _590;
    }
    float _642 = _632;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _646 = _588 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _648 = _620 ? 0 : 1;
    float _650 = _590 * 2.0;
    float _652 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[83].w, _644);
    float _654 = -_622;
    float _656 = fma(_646, 2.0, _654);
    float _658 = _642;
    if (!_538)
    {
        _658 = _530;
    }
    float _660 = _658;
    float _662 = _540 + _590;
    float _664 = _534 * _124;
    float _666 = _660;
    if (_538)
    {
        _666 = _590;
    }
    float _668 = _666;
    float _670 = _662 + (-1.0);
    int _672 = ~_648;
    int _674 = _672 + 1;
    int _676 = _674 + 1;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _680 = _676;
    if (!_610)
    {
        int _682 = ~_648;
        int _684 = _682 + 1;
        _680 = _684;
    }
    int _686 = _680;
    float _688 = _530 + _590;
    float _690 = _668 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _692 = exp2(_664);
    float _694 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _696 = _688 + (-1.0);
    float _698 = fma(_690, -2.0, _678);
    bool _700 = !_546;
    int _702 = _700 ? 0 : 1;
    float _704 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _640);
    bool _706 = !_550;
    int _708 = _706 ? 0 : 1;
    float _710 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _712 = floor(_650);
    int _714 = abs(_702);
    float _716 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _698);
    int _718 = abs(_708);
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _722 = 1.0 + _720;
    float _724 = in.m_55.x;
    float _726 = in.m_55.y;
    float _728 = in.m_55.z;
    bool _730 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _732 = isnan(1.0);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _738 = _734 || _736;
    float _740 = -_692;
    float _742 = _740 + 1.0;
    float _744 = 1.0 / _722;
    float _746 = float(_714);
    float _748 = float(_718);
    float _750 = float(_638);
    bool _752 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _760 = _756 || _758;
    bool _762 = _712 > 0.0;
    float _764 = _746 * _750;
    float _766 = _760 ? _742 : 0.0;
    float _768 = -_124;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[81].x, _656);
    float _772 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _652);
    float _774 = _764 * (-2.0);
    bool _776 = !_554;
    int _778 = _776 ? 0 : 1;
    if (_738)
    {
        float _780 = _766 * _744;
        _126 = _780;
    }
    float _782 = _126;
    bool _784 = _712 >= 0.0;
    bool _786 = isnan(_712);
    bool _788 = _784 || _786;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    float _794 = _540 + (-0.5);
    float _796 = float(_686);
    float _798 = fma(_774, _724, _724);
    int _800 = abs(_778);
    float _802 = fma(_694, _774, _694);
    int _804 = _792 ? 0 : 1;
    float _806 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[196].x, _798);
    float _808 = _748 * _796;
    int _810 = ~_804;
    int _812 = _810 + 1;
    int _814 = _812 + 1;
    float _816 = fma(_802, _782, _806);
    int _818 = _814;
    if (!_762)
    {
        int _820 = ~_804;
        int _822 = _820 + 1;
        _818 = _822;
    }
    int _824 = _818;
    float _826 = _808 * (-2.0);
    float _828 = float(_800);
    float _830 = _816 * 0.15915493667125701904296875;
    float _832 = float(_824);
    float _834 = fma(_710, _826, _710);
    float _836 = fma(_826, _726, _726);
    float _838 = _590 + (-0.5);
    float _840 = _540 + _530;
    float _842 = _828 * _832;
    float _844 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[196].y, _836);
    float _846 = _840 + (-1.0);
    float _848 = _842 * (-2.0);
    float _850 = _530 + (-0.5);
    float _852 = fma(_834, _782, _844);
    float _854 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _856 = fma(_848, _728, _728);
    float _858 = _830 * 6.283185482025146484375;
    float _860 = sin(_858);
    float _862 = in.m_57.x;
    float _864 = in.m_57.y;
    float _866 = in.m_57.z;
    float _868 = fma(_854, _848, _854);
    float _870 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[196].z, _856);
    float _872 = _852 * 0.15915493667125701904296875;
    float _874 = fma(_868, _782, _870);
    float _876 = _830 * 6.283185482025146484375;
    float _878 = cos(_876);
    float _880 = _874 * 0.15915493667125701904296875;
    float _882 = _872 * 6.283185482025146484375;
    float _884 = sin(_882);
    bool _886 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _888 = isnan(0.5);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _894 = _890 || _892;
    float _896 = _872 * 6.283185482025146484375;
    float _898 = cos(_896);
    float _900 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _862);
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _864);
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _866);
    float _906 = _556 * _900;
    float _908 = _542 * _902;
    float _910 = _560 * _904;
    float _912 = _880 * 6.283185482025146484375;
    float _914 = cos(_912);
    float _916 = _878 * _884;
    float _918 = _860 * _884;
    float _920 = _880 * 6.283185482025146484375;
    float _922 = sin(_920);
    float _924 = _860 * _898;
    float _926 = _878 * _898;
    float _928 = _914 * _908;
    float _930 = _898 * _914;
    float _932 = _884 * _914;
    float _934 = _878 * _928;
    float _936 = _860 * _928;
    float _938 = -_916;
    float _940 = fma(_922, _924, _938);
    float _942 = -_924;
    float _944 = fma(_922, _916, _942);
    float _946 = fma(_922, _926, _918);
    float _948 = fma(_922, _918, _926);
    float _950 = -_908;
    float _952 = _922 * _950;
    float _954 = fma(_940, _906, _936);
    float _956 = fma(_946, _906, _934);
    float _958 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _960 = fma(_930, _906, _952);
    float _962 = fma(_948, _910, _954);
    float _964 = fma(_944, _910, _956);
    float _966 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _968 = fma(_932, _910, _960);
    float _970 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _972 = _964 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _974 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _958);
    float _976 = _964 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _978 = _964 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _980 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].x, _972);
    float _982 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _966);
    float _984 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _974);
    float _986 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].x, _976);
    float _988 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[26].z, _980);
    float _990 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _982);
    float _992 = _984 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _994 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[24].z, _986);
    float _996 = _988 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _998 = _990 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1000 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _970);
    float _1002 = _994 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1004 = _992 + _996;
    float _1006 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].x, _978);
    float _1008 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1000);
    float _1010 = _998 + _1002;
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1014 = _1004 + _1012;
    float _1016 = fma(_962, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1006);
    float _1018 = _1008 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1020 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1022 = _1010 + _1020;
    float _1024 = _1014 * _1014;
    float _1026 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1028 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1030 = _962;
    float _1032 = _1018;
    float _1034 = _1026;
    if (_894)
    {
        _1030 = 1.0;
    }
    float _1036 = _1030;
    float _1038 = fma(_1022, _1022, _1024);
    float _1040 = _1018 + _1026;
    float _1042 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1028);
    float _1044 = sqrt(_1038);
    float _1046 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1042);
    float _1048 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1050 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1052 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1048);
    float _1054 = 1.0 / _1050;
    float _1056 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1052);
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1060 = _1044 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = _1058 + _1050;
    float _1064 = _1062 * _1054;
    float _1066 = _1064 * 0.5;
    float _1068 = _1050;
    float _1070 = _1062;
    float _1072 = _1036;
    float _1074 = _1066;
    if (!_1060)
    {
        _1068 = _1010;
    }
    float _1076 = _1068;
    float _1078 = _1076;
    if (!_1060)
    {
        _1070 = _1004;
    }
    float _1080 = _1070;
    float _1082 = _1080;
    if (!_1060)
    {
        _1032 = _1040;
    }
    float _1084 = _1032;
    bool _1086 = !_1060;
    float _1088 = _1084;
    if (!_1086)
    {
        float _1090 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1094 = _1044 + _1092;
        float _1096 = rsqrt(_1038);
        float _1098 = _1094 * _1090;
        float _1100 = _1040 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1102 = _1098 * 0.15915493667125701904296875;
        float _1104 = _1102 * 6.283185482025146484375;
        float _1106 = cos(_1104);
        float _1108 = _1102 * 6.283185482025146484375;
        float _1110 = sin(_1108);
        float _1112 = _1106 + (-1.0);
        float _1114 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1116 = fma(_1110, _1100, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1118 = fma(_1040, _1106, _1114);
        float _1120 = _1096 * _1116;
        float _1122 = fma(_1022, _1120, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1124 = fma(_1014, _1120, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1088 = _1118;
        _1078 = _1122;
        _1082 = _1124;
    }
    float _1126 = _1088;
    float _1128 = _1078;
    float _1130 = _1082;
    if (!_894)
    {
        float _1132 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1134 = _1132 * 0.15915493667125701904296875;
        float _1136 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1140 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1138);
        float _1142 = _1134 * 6.283185482025146484375;
        float _1144 = cos(_1142);
        float _1146 = _1136 * 0.15915493667125701904296875;
        float _1148 = _1134 * 6.283185482025146484375;
        float _1150 = sin(_1148);
        float _1152 = 1.0 / _1144;
        float _1154 = _1146 * 6.283185482025146484375;
        float _1156 = cos(_1154);
        float _1158 = _1150 * _1152;
        float _1160 = _1146 * 6.283185482025146484375;
        float _1162 = sin(_1160);
        float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1166 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1164;
        float _1168 = _1156 * _1158;
        float _1170 = 1.0 / _1140;
        float _1172 = 1.0 / _1168;
        float _1174 = 1.0 / _1166;
        float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1178 = _1170 * _1176;
        float _1180 = _1162 * _1172;
        float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1184 = fma(_1180, _1178, _1182);
        float _1186 = _1184 * _1174;
        float _1188 = precise::clamp(_1186, 0.0, 1.0);
        _1034 = _1170;
        _1072 = _1188;
    }
    float _1190 = _1034;
    float _1192 = _1072;
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1196 = _1126 + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1200 = _1128 + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1204 = _1130 + _1202;
    float _1206 = _1196 * _1196;
    float _1208 = fma(_1200, _1200, _1206);
    float _1210 = fma(_1204, _1204, _1208);
    float _1212 = rsqrt(_1210);
    float _1214 = sqrt(_1210);
    float _1216 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1218 = _1200 * _1216;
    float _1220 = _1204 * _1216;
    float _1222 = _1218 * _1218;
    float _1224 = _1220 * _1220;
    float _1226 = _1222 + _1224;
    float _1228 = sqrt(_1226);
    bool _1230 = _1228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1228 + _1232;
    float _1236 = _1212;
    float _1238 = _1226;
    float _1240 = _1234;
    float _1242 = _1196;
    float _1244 = _1216;
    if (_1230)
    {
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1236 = _1246;
    }
    float _1248 = _1236;
    if (_1230)
    {
        float _1250 = rsqrt(_1226);
        _1238 = _1250;
    }
    float _1252 = _1238;
    float _1254 = _1252;
    if (_1230)
    {
        float _1256 = _1234 * _1248;
        _1240 = _1256;
    }
    float _1258 = _1240;
    if (_1230)
    {
        float _1260 = _1258 * 0.15915493667125701904296875;
        _1074 = _1260;
    }
    float _1262 = _1074;
    float _1264 = _1204;
    float _1266 = _1262;
    if (_1230)
    {
        float _1268 = _1262 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        _1264 = _1270;
    }
    float _1272 = _1264;
    float _1274 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1276 = precise::max(0.0, _1274);
    float _1278 = _1190;
    float _1280 = _1276;
    float _1282 = _1274;
    if (_1230)
    {
        float _1284 = _1262 * 6.283185482025146484375;
        float _1286 = cos(_1284);
        _1278 = _1286;
    }
    float _1288 = _1278;
    float _1290 = -_1216;
    float _1292 = -_1276;
    float _1294 = fma(_1196, _1290, _1292);
    if (!_1230)
    {
        _1242 = _1220;
    }
    float _1296 = _1242;
    float _1298 = _1296;
    if (_1230)
    {
        float _1300 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1280 = _1300;
    }
    float _1302 = _1280;
    float _1304 = _1272;
    float _1306 = _1302;
    if (_1230)
    {
        float _1308 = fma(_1272, _1302, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1304 = _1308;
    }
    float _1310 = _1304;
    float _1312 = _1310;
    if (!_1230)
    {
        _1306 = _1218;
    }
    float _1314 = _1306;
    float _1316 = _1314;
    if (_1230)
    {
        float _1318 = _1288 + (-1.0);
        _1282 = _1318;
    }
    float _1320 = _1282;
    float _1322 = _1320;
    if (_1230)
    {
        float _1324 = _1252 * _1310;
        _1244 = _1324;
    }
    float _1326 = _1244;
    if (!_1230)
    {
        _1312 = _1294;
    }
    float _1328 = _1312;
    float _1330 = _1328;
    if (_1230)
    {
        float _1332 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1266 = _1332;
    }
    float _1334 = _1266;
    if (_1230)
    {
        float _1336 = _1218 * _1326;
        _1316 = _1336;
    }
    float _1338 = _1316;
    if (!_1230)
    {
        _1254 = _1222;
    }
    float _1340 = _1254;
    float _1342 = _1340;
    if (_1230)
    {
        float _1344 = _1220 * _1326;
        _1298 = _1344;
    }
    float _1346 = _1298;
    if (_1230)
    {
        float _1348 = fma(_1294, _1288, _1334);
        _1330 = _1348;
    }
    float _1350 = _1330;
    if (_1230)
    {
        float _1352 = _1338 * _1338;
        _1342 = _1352;
    }
    float _1354 = _1342;
    if (!_1230)
    {
        _1322 = _1224;
    }
    float _1356 = _1322;
    float _1358 = _1356;
    if (_1230)
    {
        float _1360 = _1346 * _1346;
        _1358 = _1360;
    }
    float _1362 = _1358;
    float _1364 = fma(_1350, _1350, _1354);
    float _1366 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1368 = _1364 + _1362;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1372 = fma(_1214, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1370);
    float _1374 = precise::clamp(_1372, 0.0, 1.0);
    float _1376 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1378 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1366);
    float _1380 = rsqrt(_1368);
    float _1382 = -_1374;
    float _1384 = _1382 + 1.0;
    float _1386 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1388 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1376);
    float _1390 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1392 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1394 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1386);
    float _1396 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1388);
    float _1398 = abs(_1384);
    float _1400 = log2(_1398);
    float _1402 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1392);
    float _1404 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1394);
    float _1406 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1408 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1378);
    float _1410 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1414 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1416 = _1380 * _1338;
    float _1418 = _1380 * _1350;
    float _1420 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1422 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1414);
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1426 = _1380 * _1346;
    float _1428 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1430 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1432 = -_1424;
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1432);
    float _1436 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1422);
    float _1438 = -_1428;
    float _1440 = fma(_1438, _1390, 1.0);
    float _1442 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1444 = -_1426;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1434);
    float _1448 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1436);
    float _1450 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1452 = exp2(_1442);
    float _1454 = fma(_1446, -0.5, 0.5);
    float _1456 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1458 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1450);
    float _1460 = fma(_1446, 0.5, 0.5);
    float _1462 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1456);
    float _1464 = log2(_1440);
    float _1466 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1458);
    float _1468 = fma(_1460, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1470 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1462);
    float _1472 = _1418 + 1.0;
    float _1474 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1466);
    float _1476 = fma(_1460, _1468, -0.212114393711090087890625);
    float _1478 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1470);
    float _1480 = 1.0 / _1448;
    float _1482 = -_1418;
    float _1484 = fma(_1452, _1472, _1482);
    float _1486 = fma(_1460, _1476, 1.570728778839111328125);
    float _1488 = sqrt(_1454);
    float _1490 = _1464 * 0.693147182464599609375;
    float _1492 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1494 = _1474 * _1480;
    float _1496 = _1478 * _1480;
    float _1498 = fma(_1494, 0.5, 0.5);
    float _1500 = fma(_1496, -0.5, 0.5);
    float _1502 = fma(_1484, 0.5, 0.5);
    float _1504 = _1488 * 0.636619746685028076171875;
    float _1506 = -_1486;
    float _1508 = fma(_1504, _1506, 1.0);
    float3 _4058 = float3(_1498, _1500, _1492);
    float _1510 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4058, float3(0.0), isnan(_4058)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4058, float3(0.0), isnan(_4058)), level(0.0)).x;
    float3 _4069 = float3(_1498, _1500, _1492);
    float4 _1513 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4069, float3(0.0), isnan(_4069)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4069, float3(0.0), isnan(_4069)), level(0.0)).xyzw;
    float _1515 = _1513.x;
    float _1517 = _1513.y;
    float _1519 = _1513.z;
    float _1521 = _1513.w;
    float2 _4086 = float2(_1508, _1502);
    float3 _1525 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4086, float2(0.0), isnan(_4086)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4086, float2(0.0), isnan(_4086)), level(0.0)).xyz;
    float _1527 = _1525.x;
    float _1529 = _1525.y;
    float _1531 = _1525.z;
    float _1533 = in.m_51.w;
    float _1535 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1537 = _590 > 0.5;
    float _1539 = in.m_59.z;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1543 = _1541 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1545 = in.m_61.y;
    float _1547 = 1.0 / _1543;
    float _1549 = in.m_59.y;
    int _1551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1553 = _1551 != 0;
    float _1555 = in.m_59.w;
    int _1557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1559 = _1557 != 0;
    float _1561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1563 = _528 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1565 = isnan(_528);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1571 = _1567 || _1569;
    float _1573 = float(_1571);
    float _1575 = in.m_61.x;
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1579 = _1577 != 0;
    int _1581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1583 = _1581 != 0;
    float _1585 = in.m_59.x;
    bool _1587 = _1533 > 0.5;
    out.m_63.z = _1539;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1589;
    float _1593 = -_1545;
    float _1595 = _1593 + 1.0;
    float _1597 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1599 = _1591 * _1547;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1603 = _528 + _1601;
    float _1605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1607 = _528 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1609 = isnan(_528);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1615 = _1611 || _1613;
    float _1617 = float(_1615);
    out.m_63.y = _1549;
    float _1619 = fma(_1599, _1603, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1621 = -_1573;
    float _1623 = _1621 + 1.0;
    out.m_63.w = _1555;
    float _1625 = _1617 * _1623;
    float _1627 = -_1617;
    float _1629 = _1627 + 1.0;
    int _1631 = _1587 ? as_type<int>(_1595) : as_type<int>(_1545);
    out.m_63.x = _1585;
    float _1633 = _1619 * _1625;
    float _1635 = _1619;
    int _1637 = as_type<int>(_1555);
    bool _1639 = _1579;
    bool _1641 = _1587;
    float _1643 = _1585;
    float _1645 = _1545;
    if (!_1553)
    {
        _1635 = _1575;
    }
    float _1647 = _1635;
    float _1649 = _1647;
    if (_1553)
    {
        float _1651 = -_1575;
        float _1653 = _1651 + 1.0;
        _1637 = as_type<int>(_1653);
    }
    int _1655 = _1637;
    float _1657 = _1579 ? as_type<float>(_1631) : _1545;
    float _1659 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1633);
    if (_1553)
    {
        bool _1661 = _530 > 0.5;
        _1639 = _1661;
    }
    bool _1663 = _1639;
    float _1665 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1559)
    {
        float _1667 = -_1575;
        float _1669 = _1667 + 1.0;
        _576 = as_type<int>(_1669);
    }
    int _1671 = _576;
    if (_1553)
    {
        float _1673 = _1663 ? as_type<float>(_1655) : _1575;
        _1649 = _1673;
    }
    float _1675 = _1649;
    float _1677 = fma(_1597, _1657, -0.5);
    if (_1559)
    {
        bool _1679 = _540 > 0.5;
        _1641 = _1679;
    }
    bool _1681 = _1641;
    float _1683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1685 = fma(_1665, _1675, -0.5);
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1689 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (!_1559)
    {
        _1643 = _1575;
    }
    float _1693 = _1643;
    float _1695 = -_716;
    float _1697 = fma(_772, _1677, _1695);
    float _1699 = _1693;
    if (_1559)
    {
        float _1701 = _1681 ? as_type<float>(_1671) : _1575;
        _1699 = _1701;
    }
    float _1703 = _1699;
    float _1705 = exp2(_1689);
    float _1707 = fma(_1573, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1659);
    if (_1583)
    {
        float _1709 = _1537 ? _1595 : _1545;
        _1645 = _1709;
    }
    float _1711 = _1645;
    float _1713 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1715 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1535);
    float _1717 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1719 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1721 = _1713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1725 = _1707 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1727 = _1711 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1729 = _1697 + 0.5;
    float _1731 = _1192 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1733 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1715);
    out.m_65.x = _1717;
    out.m_65.y = _1719;
    out.m_65.z = _1721;
    out.m_65.w = _1725;
    bool _1735 = _1192 > 0.0;
    bool _1737 = isnan(_1192);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan(0.0);
    bool _1743 = _1739 || _1741;
    float _1745 = -_1705;
    float _1747 = _1745 + 1.0;
    float _1749 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1733);
    float _1751 = fma(_704, _1685, _770);
    float _1753 = _1747 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1755 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1757 = _1751 + 0.5;
    out.gl_Position.x = _1474;
    out.gl_Position.y = _1478;
    out.gl_Position.z = _1749;
    out.gl_Position.w = _1448;
    float _1759 = _1755 * _1683;
    float _1761 = _1727 * _1723;
    float _1763 = _1731 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1765 = _1749 + _1448;
    out.m_67.x = _1759;
    out.m_67.y = _1761;
    out.m_67.z = _1757;
    out.m_67.w = _1729;
    float _1767 = _1765 * 0.5;
    out.m_45.x = _1763;
    out.m_69.z = _1767;
    out.m_69.w = _1448;
    float _1769 = _1753 * _1510;
    float _1771 = -_1753;
    float _1773 = _1771 + 1.0;
    float _1775 = _1521 * _1769;
    float _1777 = _1531 * _1769;
    float _1779 = _1521 * _1773;
    float _1781 = fma(_1527, _1775, _1515);
    float _1783 = fma(_1529, _1775, _1517);
    float _1785 = fma(_1521, _1777, _1519);
    out.m_71.x = _1781;
    out.m_71.y = _1783;
    out.m_71.z = _1785;
    out.m_71.w = _1779;
    if (_1743)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1787 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1787;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

