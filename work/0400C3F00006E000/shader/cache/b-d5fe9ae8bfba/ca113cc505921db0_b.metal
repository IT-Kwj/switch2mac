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
    float4 m_67 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _724 = false;
    bool _582 = false;
    bool _402 = false;
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
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2423 = as_type<float>(_104);
        out.gl_Position.z = _2423;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    float _126 = _122;
    if (_118)
    {
        float _128 = float(_90);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _144 = _140 * 5.0;
        _106 = as_type<int>(_144);
    }
    int _146 = _106;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2494 = as_type<float>(_146);
        out.gl_Position.z = _2494;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_49.w;
    float _150 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_47.x;
    float _164 = in.m_47.y;
    float _166 = in.m_47.z;
    float _168 = in.m_42.x;
    float _170 = in.m_42.y;
    float _172 = in.m_42.z;
    float _174 = _150;
    if (!_160)
    {
        float _176 = _150 * _150;
        float _178 = _176 * 0.5;
        _142 = _178;
    }
    float _180 = _142;
    float _182 = _180;
    if (!_160)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_160;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _150 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _150);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_160;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _150 * _228;
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
    float _256 = fma(_246, _162, _250);
    float _258 = fma(_246, _164, _252);
    float _260 = fma(_246, _166, _254);
    float _262 = fma(_256, _148, _168);
    float _264 = fma(_258, _148, _170);
    float _266 = fma(_260, _148, _172);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_51.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
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
        float _294 = _122 * _292;
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
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_312;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = 1.0 / _316;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _342 = _328 * _332;
    float _344 = -_328;
    float _346 = _344 + 1.0;
    float _348 = _300 * _338;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    float _354 = fma(_336, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _356;
    float _360 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = _354 * _342;
    float _364 = fma(_358, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = _360 * _342;
    float _368 = _364 * _342;
    float _370 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _362);
    float _372 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _368);
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _366);
    float _376 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _370);
    float _378 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _372);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _374);
    bool _382 = !_340;
    float _400;
    if (!_382)
    {
        float _384 = in.m_51.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_90);
        float _406 = 1.0 / _404;
        float _408 = _122 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = in.m_49.x;
    float _414 = in.m_49.y;
    float _416 = in.m_49.z;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _420 = _410 + _418;
    bool _422 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _424 = isnan(_410);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _434;
    bool _438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _440 = 1.0 / _436;
    float _442 = _380 * _416;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _448 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _450 = isnan(_410);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = _378 * _414;
    float _462 = _420 * _440;
    float _464 = 1.0 / _446;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _468 = _410 + _466;
    bool _470 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _472 = isnan(_410);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -_432;
    float _484 = _482 + 1.0;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _486;
    float _490 = _376 * _412;
    float _492 = _480 * _484;
    float _494 = -_480;
    float _496 = _494 + 1.0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _502;
    float _506 = fma(_488, _462, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _508 = _458 * _496;
    float _510 = fma(_500, _462, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = fma(_504, _462, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _514 = -_458;
    float _516 = _514 + 1.0;
    float _518 = _468 * _464;
    float _520 = _510 * _508;
    float _522 = _506 * _508;
    float _524 = _512 * _508;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _538 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[107].x, _520);
    float _540 = fma(_528, _518, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _542 = fma(_532, _518, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _544 = fma(_536, _518, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _546 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[107].y, _522);
    float _548 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[107].z, _524);
    float _550 = fma(_540, _492, _538);
    float _552 = fma(_542, _492, _546);
    float _554 = fma(_544, _492, _548);
    float _556 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].x, _550);
    float _558 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].y, _552);
    float _560 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].z, _554);
    bool _562 = !_438;
    float _580;
    if (!_562)
    {
        float _564 = in.m_51.x;
        float _566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _568 = _564 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _570 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _572 = _570 * _566;
        float _574 = floor(_572);
        float _576 = -_574;
        float _578 = _572 + _576;
        _580 = _578;
        _582 = true;
    }
    else
    {
        float _584 = float(_90);
        float _586 = 1.0 / _584;
        float _588 = _122 * _586;
        _580 = _588;
    }
    _582 = false;
    float _590 = _580;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _594 = _590 + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _600 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _602 = isnan(_590);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _616 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _618 = isnan(_590);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _628;
    bool _632 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _634 = isnan(_590);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = 1.0 / _598;
    float _646 = -_610;
    float _648 = _646 + 1.0;
    bool _650 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _652 = _626 * _648;
    float _654 = -_626;
    float _656 = _654 + 1.0;
    float _658 = 1.0 / _614;
    float _660 = _630 * _644;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _666 = fma(_660, _594, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _668 = -_642;
    float _670 = _668 + 1.0;
    float _672 = _666 * _652;
    float _674 = _664 * _658;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _678 = _590 + _676;
    float _680 = _610 * _670;
    float _682 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[115].x, _672);
    float _684 = _556 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _686 = fma(_674, _678, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _688 = _558 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _690 = _560 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = fma(_686, _680, _682);
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[117].x, _694);
    float _702 = _700 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _692;
    out.m_53.y = _696;
    out.m_53.z = _698;
    out.m_53.w = _702;
    bool _704 = !_650;
    float _722;
    if (!_704)
    {
        float _706 = in.m_51.x;
        float _708 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _710 = _706 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _714 = _712 * _708;
        float _716 = floor(_714);
        float _718 = -_716;
        float _720 = _714 + _718;
        _722 = _720;
        _724 = true;
    }
    else
    {
        float _726 = float(_90);
        float _728 = 1.0 / _726;
        float _730 = _122 * _728;
        _722 = _730;
    }
    _724 = false;
    float _732 = _722;
    float _734 = in.m_51.z;
    float _736 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _738 = log2(_736);
    float _740 = in.m_51.x;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _746 = _744 != 0;
    float _748 = in.m_55.x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _752 = in.m_55.z;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _756 = in.m_51.y;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _760 = _734 * 2.0;
    float _762 = _740 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _764 = _740 * 2.0;
    float _766 = floor(_760);
    float _768 = -_742;
    float _770 = fma(_762, 2.0, _768);
    float _772 = abs(_748);
    float _774 = abs(_752);
    float _776 = precise::max(_772, _774);
    float _778 = floor(_764);
    float _780 = _740 + _756;
    bool _782 = _776 >= 16.0;
    float _784 = _756 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _786 = _780 + (-1.0);
    float _788 = _756 * 2.0;
    float _790 = fma(_784, -2.0, _750);
    float _792 = _748 * 0.0625;
    float _794 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _796 = _752 * 0.0625;
    bool _798 = _766 > 0.0;
    float _800 = floor(_788);
    bool _802 = _766 >= 0.0;
    bool _804 = isnan(_766);
    bool _806 = _802 || _804;
    bool _808 = isnan(0.0);
    bool _810 = _806 || _808;
    float _812 = _782 ? _796 : _752;
    float _814 = _786;
    float _816 = _796;
    if (_746)
    {
        _814 = _740;
    }
    float _818 = _814;
    float _820 = _782 ? _792 : _748;
    float _822 = _818;
    if (!_746)
    {
        _822 = _734;
    }
    float _824 = _822;
    float _826 = abs(_812);
    bool _828 = _826 != 0.0;
    bool _830 = isnan(_826);
    bool _832 = _828 || _830;
    bool _834 = isnan(0.0);
    bool _836 = _832 || _834;
    if (_746)
    {
        _816 = _756;
    }
    float _838 = _816;
    float _840 = _824 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _842 = _838;
    if (!_746)
    {
        _842 = _740;
    }
    float _844 = _842;
    float _846 = abs(_820);
    bool _848 = _846 == 0.0;
    bool _850 = !_836;
    bool _852 = _848 && _850;
    float _854 = -_754;
    float _856 = fma(_840, 2.0, _854);
    bool _858 = _778 >= 0.0;
    bool _860 = isnan(_778);
    bool _862 = _858 || _860;
    bool _864 = isnan(0.0);
    bool _866 = _862 || _864;
    float _868 = _844 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _870 = _810 ? 0 : 1;
    int _872 = _866 ? 0 : 1;
    float _874 = fma(_868, -2.0, _758);
    float _876 = abs(_820);
    bool _878 = _876 == 0.0;
    bool _880 = _778 > 0.0;
    bool _882 = _800 > 0.0;
    bool _884 = _800 >= 0.0;
    bool _886 = isnan(_800);
    bool _888 = _884 || _886;
    bool _890 = isnan(0.0);
    bool _892 = _888 || _890;
    int _894 = ~_870;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    int _900 = _892 ? 0 : 1;
    bool _902 = _892;
    int _904 = _898;
    int _906 = _878 ? (-1) : 0;
    if (_852)
    {
        bool _908 = as_type<int>(_820) >= 0;
        _902 = _908;
    }
    bool _910 = _902;
    int _912 = ~_872;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    int _918 = 0;
    int _920 = _916;
    if (_852)
    {
        int _922 = _910 ? 0 : 1078530011;
        _918 = _922;
    }
    int _924 = _918;
    int _926 = ~_900;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    int _932 = _930;
    int _934 = _924;
    if (!_798)
    {
        int _936 = ~_870;
        int _938 = _936 + 1;
        _904 = _938;
    }
    int _940 = _904;
    if (!_880)
    {
        int _942 = ~_872;
        int _944 = _942 + 1;
        _920 = _944;
    }
    int _946 = _920;
    if (!_882)
    {
        int _948 = ~_900;
        int _950 = _948 + 1;
        _932 = _950;
    }
    int _952 = _932;
    if (_852)
    {
        int _954 = int(0x80000000) & as_type<int>(_812);
        int _956 = _924 | _954;
        _934 = _956;
    }
    int _958 = _934;
    bool _960 = !_836;
    bool _962 = _960 && _878;
    int _964 = _958;
    float _966 = as_type<float>(_958);
    if (!_962)
    {
        float _968 = abs(_812);
        bool _970 = _968 != as_type<float>(0x7f800000u /* inf */);
        bool _972 = isnan(_968);
        bool _974 = _970 || _972;
        bool _976 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _978 = _974 || _976;
        float _980 = abs(_820);
        bool _982 = _980 == as_type<float>(0x7f800000u /* inf */);
        float _984 = abs(_820);
        bool _986 = _984 == as_type<float>(0x7f800000u /* inf */);
        bool _988 = !_978;
        bool _990 = _986 && _988;
        if (_990)
        {
            bool _992 = as_type<int>(_820) >= 0;
            _906 = _992 ? (-1) : 0;
        }
        int _994 = _906;
        if (_990)
        {
            _964 = 1075235812;
        }
        int _996 = _964;
        int _998 = _996;
        if (_990)
        {
            int _1000 = ~_994;
            int _1002 = (_1000 != 0) ? _996 : 1061752795;
            _998 = _1002;
        }
        int _1004 = _998;
        float _1006 = as_type<float>(_1004);
        if (_990)
        {
            int _1008 = int(0x80000000) & as_type<int>(_812);
            int _1010 = _1004 | _1008;
            _1006 = as_type<float>(_1010);
        }
        float _1012 = _1006;
        bool _1014 = !_978;
        bool _1016 = _1014 && _982;
        _966 = _1012;
        if (!_1016)
        {
            float _1018 = abs(_812);
            float _1020 = abs(_820);
            float _1022 = precise::max(_1018, _1020);
            float _1024 = abs(_812);
            float _1026 = abs(_820);
            float _1028 = _1024 + _1026;
            float _1030 = abs(_812);
            float _1032 = abs(_820);
            float _1034 = precise::min(_1030, _1032);
            float _1036 = 1.0 / _1022;
            float _1038 = abs(_812);
            float _1040 = abs(_820);
            bool _1042 = _1038 > _1040;
            bool _1044 = as_type<int>(_820) >= 0;
            bool _1046 = _1028 > as_type<float>(0x7f800000u /* inf */);
            bool _1048 = isnan(_1028);
            bool _1050 = _1046 || _1048;
            bool _1052 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1054 = _1050 || _1052;
            int _1056 = as_type<int>(_812) & int(0x80000000);
            float _1058 = _1034 * _1036;
            float _1060 = _1058 * _1058;
            float _1062 = _1060 + 11.33538818359375;
            float _1064 = fma(_1060, _1062, 28.84246826171875);
            float _1066 = fma(_1060, _1064, 19.6966705322265625);
            float _1068 = fma(_1060, -0.82336294651031494140625, -5.674867153167724609375);
            float _1070 = fma(_1060, _1068, -6.565555095672607421875);
            float _1072 = 1.0 / _1066;
            float _1074 = _1060 * _1070;
            float _1076 = _1058 * _1074;
            float _1078 = fma(_1076, _1072, _1058);
            float _1080 = _1078;
            _966 = _1028;
            if (_1042)
            {
                float _1082 = -_1078;
                float _1084 = _1082 + 1.57079637050628662109375;
                _1080 = _1084;
            }
            float _1086 = _1080;
            int _1088 = as_type<int>(_1086);
            if (!_1044)
            {
                float _1090 = -_1086;
                float _1092 = _1090 + 3.1415927410125732421875;
                _1088 = as_type<int>(_1092);
            }
            int _1094 = _1088;
            if (!_1054)
            {
                int _1096 = _1056 | _1094;
                _966 = as_type<float>(_1096);
            }
        }
    }
    float _1098 = _966;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1102 = _1100 != 0;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1106 = _1104 != 0;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1110 = _1108 != 0;
    float _1112 = _738 * _122;
    float _1114 = in.m_57.x;
    float _1116 = in.m_57.y;
    float _1118 = in.m_57.z;
    float _1120 = -_122;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[76].x, _770);
    float _1124 = exp2(_1112);
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1134 = 1.0 + _1132;
    float _1136 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1126);
    float _1138 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1128);
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1142 = 1.0 / _1134;
    float _1144 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1136);
    bool _1146 = !_1102;
    int _1148 = _1146 ? 0 : 1;
    float _1150 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1130);
    bool _1152 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1154 = isnan(1.0);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1160 = _1156 || _1158;
    float _1162 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1140);
    float _1164 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1138);
    float _1166 = -_1124;
    float _1168 = _1166 + 1.0;
    int _1170 = abs(_1148);
    float _1172 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1162);
    bool _1174 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1176 = isnan(0.0);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1182 = _1178 || _1180;
    float _1184 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1150);
    float _1186 = float(_940);
    float _1188 = -_122;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[86].x, _856);
    float _1192 = float(_1170);
    float _1194 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _790);
    float _1196 = _1182 ? _1168 : 0.0;
    float _1198 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _874);
    bool _1200 = !_1106;
    int _1202 = _1200 ? 0 : 1;
    float _1204 = _1192 * _1186;
    float _1206 = _740 + (-0.5);
    if (_1160)
    {
        float _1208 = _1196 * _1142;
        _126 = _1208;
    }
    float _1210 = _126;
    int _1212 = abs(_1202);
    float _1214 = _1204 * (-2.0);
    float _1216 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1218 = float(_946);
    float _1220 = fma(_1214, _1114, _1114);
    bool _1222 = !_1110;
    int _1224 = _1222 ? 0 : 1;
    float _1226 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0500000081956386566162109375, _1098);
    float _1228 = float(_1212);
    float _1230 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0500000081956386566162109375, _1098);
    float _1232 = fma(_794, _1214, _794);
    float _1234 = _1226 * 4.0;
    float _1236 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1220);
    int _1238 = abs(_1224);
    float _1240 = _756 + _734;
    float _1242 = _1228 * _1218;
    float _1244 = _1234 * 0.15915493667125701904296875;
    float _1246 = fma(_1232, _1210, _1236);
    float _1248 = _1230 * 2.0;
    float _1250 = _1240 + (-1.0);
    float _1252 = float(_952);
    float _1254 = _1242 * (-2.0);
    float _1256 = float(_1238);
    float _1258 = _1248 * 0.15915493667125701904296875;
    float _1260 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1262 = fma(_1254, _1116, _1116);
    float _1264 = _1244 * 6.283185482025146484375;
    float _1266 = sin(_1264);
    float _1268 = _1256 * _1252;
    float _1270 = _756 + (-0.5);
    float _1272 = _740 + _734;
    float _1274 = fma(_1260, _1254, _1260);
    float _1276 = _1246 * 0.15915493667125701904296875;
    float _1278 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1262);
    float _1280 = _1258 * 6.283185482025146484375;
    float _1282 = sin(_1280);
    float _1284 = _1272 + (-1.0);
    float _1286 = fma(_1274, _1210, _1278);
    float _1288 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1290 = _1286 * 0.15915493667125701904296875;
    float _1292 = in.m_55.y;
    float _1294 = _1268 * (-2.0);
    float _1296 = _1276 * 6.283185482025146484375;
    float _1298 = sin(_1296);
    bool _1300 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1302 = isnan(0.5);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1308 = _1304 || _1306;
    float _1310 = fma(_1294, _1118, _1118);
    float _1312 = _734 + (-0.5);
    float _1314 = fma(_1288, _1294, _1288);
    float _1316 = fma(_1266, 0.5, 0.5);
    float _1318 = fma(_1282, 0.5, 0.5);
    float _1320 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1310);
    float _1322 = _1276 * 6.283185482025146484375;
    float _1324 = cos(_1322);
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _748);
    float _1328 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _752);
    float _1330 = precise::max(_1316, _1318);
    float _1332 = fma(_1314, _1210, _1320);
    float _1334 = _1326 * _1216;
    float _1336 = _1332 * 0.15915493667125701904296875;
    float _1338 = _1330 * _1330;
    float _1340 = _1290 * 6.283185482025146484375;
    float _1342 = sin(_1340);
    float _1344 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1346 = _1338 * _1338;
    float _1348 = _1328 * _1344;
    float _1350 = _1346 * _1292;
    float _1352 = _1290 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1350);
    float _1360 = _1358 * _1356;
    float _1362 = _1336 * 6.283185482025146484375;
    float _1364 = cos(_1362);
    float _1366 = _1298 * _1342;
    float _1368 = _1336 * 6.283185482025146484375;
    float _1370 = sin(_1368);
    float _1372 = _1324 * _1354;
    float _1374 = _1298 * _1354;
    float _1376 = _1364 * _1360;
    float _1378 = _1298 * _1376;
    float _1380 = fma(_1370, _1372, _1366);
    float _1382 = fma(_1370, _1366, _1372);
    float _1384 = _1324 * _1342;
    float _1386 = _1324 * _1376;
    float _1388 = _1342 * _1364;
    float _1390 = _1354 * _1364;
    float _1392 = -_1384;
    float _1394 = fma(_1370, _1374, _1392);
    float _1396 = -_1360;
    float _1398 = _1370 * _1396;
    float _1400 = -_1374;
    float _1402 = fma(_1370, _1384, _1400);
    float _1404 = fma(_1380, _1334, _1386);
    float _1406 = fma(_1394, _1334, _1378);
    float _1408 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1410 = fma(_1390, _1334, _1398);
    float _1412 = fma(_1402, _1348, _1404);
    float _1414 = fma(_1382, _1348, _1406);
    float _1416 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1408);
    float _1418 = fma(_1388, _1348, _1410);
    float _1420 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1422 = _1412 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1424 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1416);
    float _1426 = _1412 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1428 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1420);
    float _1430 = fma(_1418, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1426);
    float _1436 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1428);
    float _1438 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1430);
    float _1440 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1442 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1434);
    float _1444 = _1436 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1446 = _1432 + _1438;
    float _1448 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1440);
    float _1450 = _1444 + _1442;
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1454 = _1446 + _1452;
    float _1456 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1448);
    float _1458 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1460 = _1450 + _1458;
    float _1462 = _1454 * _1454;
    float _1464 = _1456 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1466 = fma(_1460, _1460, _1462);
    float _1468 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1470 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1472 = sqrt(_1466);
    float _1474 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1468);
    float _1476 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1470);
    float _1478 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1474);
    float _1480 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1476);
    float _1482 = _1478 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1484 = _1412 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1486 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1488 = 1.0 / _1482;
    float _1490 = fma(_1418, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1484);
    float _1492 = _1486 + _1482;
    bool _1494 = _1472 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1496 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1490);
    float _1498 = _1464 + _1496;
    float _1500 = _1496;
    float _1502 = _1484;
    float _1504 = _1492;
    float _1506 = _1482;
    float _1508 = _1444;
    float _1510 = _1412;
    if (_1308)
    {
        _1500 = 1.0;
    }
    float _1512 = _1500;
    float _1514 = _1492 * _1488;
    float _1516 = _1514 * 0.5;
    float _1518 = _1512;
    if (!_1494)
    {
        _1502 = _1450;
    }
    float _1520 = _1502;
    float _1522 = _1520;
    if (!_1494)
    {
        _1504 = _1446;
    }
    float _1524 = _1504;
    float _1526 = _1524;
    if (!_1494)
    {
        _1506 = _1498;
    }
    float _1528 = _1506;
    bool _1530 = !_1494;
    float _1532 = _1528;
    if (!_1530)
    {
        float _1534 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1536 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1538 = _1472 + _1536;
        float _1540 = rsqrt(_1466);
        float _1542 = _1538 * _1534;
        float _1544 = _1498 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1546 = _1542 * 0.15915493667125701904296875;
        float _1548 = _1546 * 6.283185482025146484375;
        float _1550 = sin(_1548);
        float _1552 = _1546 * 6.283185482025146484375;
        float _1554 = cos(_1552);
        float _1556 = fma(_1550, _1544, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1558 = _1540 * _1556;
        float _1560 = _1554 + (-1.0);
        float _1562 = fma(_1460, _1558, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1564 = fma(_1454, _1558, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1566 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1568 = fma(_1498, _1554, _1566);
        _1532 = _1568;
        _1522 = _1562;
        _1526 = _1564;
    }
    float _1570 = _1532;
    float _1572 = _1522;
    float _1574 = _1526;
    if (!_1308)
    {
        float _1576 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1578 = _1576 * 0.15915493667125701904296875;
        float _1580 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1582 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1584 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1582);
        float _1586 = _1578 * 6.283185482025146484375;
        float _1588 = cos(_1586);
        float _1590 = _1580 * 0.15915493667125701904296875;
        float _1592 = _1578 * 6.283185482025146484375;
        float _1594 = sin(_1592);
        float _1596 = 1.0 / _1588;
        float _1598 = _1590 * 6.283185482025146484375;
        float _1600 = cos(_1598);
        float _1602 = _1594 * _1596;
        float _1604 = _1590 * 6.283185482025146484375;
        float _1606 = sin(_1604);
        float _1608 = _1600 * _1602;
        float _1610 = 1.0 / _1584;
        float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1614 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1612;
        float _1616 = 1.0 / _1608;
        float _1618 = 1.0 / _1614;
        float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1622 = _1610 * _1620;
        float _1624 = _1606 * _1616;
        float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1628 = fma(_1624, _1622, _1626);
        float _1630 = _1628 * _1618;
        float _1632 = precise::clamp(_1630, 0.0, 1.0);
        float _1634 = -_1632;
        float _1636 = _1634 + 1.0;
        _1508 = _1618;
        _1510 = _1610;
        _1518 = _1636;
    }
    float _1638 = _1508;
    float _1640 = _1510;
    float _1642 = _1518;
    float _1644 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1646 = _1570 + _1644;
    float _1648 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1650 = _1572 + _1648;
    float _1652 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1654 = _1574 + _1652;
    float _1656 = _1646 * _1646;
    float _1658 = fma(_1650, _1650, _1656);
    float _1660 = fma(_1654, _1654, _1658);
    float _1662 = rsqrt(_1660);
    float _1664 = sqrt(_1660);
    float _1666 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1668 = _1650 * _1666;
    float _1670 = _1654 * _1666;
    float _1672 = _1668 * _1668;
    float _1674 = _1670 * _1670;
    float _1676 = _1672 + _1674;
    float _1678 = sqrt(_1676);
    bool _1680 = _1678 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1684 = _1678 + _1682;
    float _1686 = _1662;
    float _1688 = _1684;
    float _1690 = _1638;
    float _1692 = _1646;
    float _1694 = _1666;
    if (_1680)
    {
        float _1696 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1686 = _1696;
    }
    float _1698 = _1686;
    float _1700 = _1698;
    if (_1680)
    {
        float _1702 = _1684 * _1698;
        _1688 = _1702;
    }
    float _1704 = _1688;
    if (_1680)
    {
        float _1706 = rsqrt(_1676);
        _1700 = _1706;
    }
    float _1708 = _1700;
    float _1710 = _1708;
    if (_1680)
    {
        float _1712 = _1704 * 0.15915493667125701904296875;
        _1690 = _1712;
    }
    float _1714 = _1690;
    float _1716 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1718 = _1654;
    float _1720 = _1714;
    if (_1680)
    {
        float _1722 = _1714 * 6.283185482025146484375;
        float _1724 = sin(_1722);
        _1718 = _1724;
    }
    float _1726 = _1718;
    float _1728 = precise::max(0.0, _1716);
    float _1730 = _1640;
    float _1732 = _1728;
    if (_1680)
    {
        float _1734 = _1714 * 6.283185482025146484375;
        float _1736 = cos(_1734);
        _1730 = _1736;
    }
    float _1738 = _1730;
    float _1740 = -_1666;
    float _1742 = -_1728;
    float _1744 = fma(_1646, _1740, _1742);
    if (_1680)
    {
        float _1746 = _1744 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1692 = _1746;
    }
    float _1748 = _1692;
    float _1750 = _1726;
    float _1752 = _1748;
    if (_1680)
    {
        float _1754 = fma(_1726, _1748, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1750 = _1754;
    }
    float _1756 = _1750;
    float _1758 = _1756;
    if (!_1680)
    {
        _1752 = _1672;
    }
    float _1760 = _1752;
    float _1762 = _1760;
    if (_1680)
    {
        float _1764 = _1708 * _1756;
        _1694 = _1764;
    }
    float _1766 = _1694;
    if (!_1680)
    {
        _1710 = _1668;
    }
    float _1768 = _1710;
    float _1770 = _1768;
    float _1772 = _1738;
    if (_1680)
    {
        float _1774 = _1738 + (-1.0);
        _1732 = _1774;
    }
    float _1776 = _1732;
    float _1778 = _1776;
    if (_1680)
    {
        float _1780 = _1668 * _1766;
        _1770 = _1780;
    }
    float _1782 = _1770;
    if (!_1680)
    {
        _1758 = _1744;
    }
    float _1784 = _1758;
    float _1786 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1788 = _1784;
    if (_1680)
    {
        float _1790 = _1776 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1720 = _1790;
    }
    float _1792 = _1720;
    if (!_1680)
    {
        _1778 = _1670;
    }
    float _1794 = _1778;
    float _1796 = _1794;
    if (_1680)
    {
        float _1798 = _1670 * _1766;
        _1796 = _1798;
    }
    float _1800 = _1796;
    if (_1680)
    {
        float _1802 = _1782 * _1782;
        _1762 = _1802;
    }
    float _1804 = _1762;
    if (_1680)
    {
        float _1806 = fma(_1744, _1738, _1792);
        _1788 = _1806;
    }
    float _1808 = _1788;
    if (!_1680)
    {
        _1772 = _1674;
    }
    float _1810 = _1772;
    float _1812 = _1810;
    if (_1680)
    {
        float _1814 = _1800 * _1800;
        _1812 = _1814;
    }
    float _1816 = _1812;
    float _1818 = fma(_1808, _1808, _1804);
    float _1820 = _1818 + _1816;
    float _1822 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1824 = fma(_1664, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1822);
    float _1826 = precise::clamp(_1824, 0.0, 1.0);
    float _1828 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1786);
    float _1830 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1832 = rsqrt(_1820);
    float _1834 = -_1826;
    float _1836 = _1834 + 1.0;
    float _1838 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1840 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1830);
    float _1842 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1844 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1828);
    float _1846 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1838);
    float _1848 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1840);
    float _1850 = abs(_1836);
    float _1852 = log2(_1850);
    float _1854 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1842);
    float _1856 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1846);
    float _1858 = _1848 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1860 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1862 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1854);
    float _1864 = _1856 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1866 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1868 = _1832 * _1782;
    float _1870 = _1832 * _1808;
    float _1872 = _1832 * _1800;
    float _1874 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1866);
    float _1876 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1878 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1880 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1882 = _1862 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1884 = -_1876;
    float _1886 = fma(_1870, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1884);
    float _1888 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1874);
    float _1890 = -_1880;
    float _1892 = fma(_1890, _1878, 1.0);
    float _1894 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1896 = -_1872;
    float _1898 = fma(_1896, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1886);
    float _1900 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1888);
    float _1902 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1904 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1906 = fma(_1898, -0.5, 0.5);
    float _1908 = log2(_1892);
    float _1910 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1902);
    float _1912 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1904);
    float _1914 = fma(_1898, 0.5, 0.5);
    float _1916 = _1870 + 1.0;
    float _1918 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1910);
    float _1920 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1912);
    float _1922 = fma(_1914, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1924 = 1.0 / _1900;
    float _1926 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1918);
    float _1928 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1920);
    float _1930 = fma(_1914, _1922, -0.212114393711090087890625);
    float _1932 = fma(_1914, _1930, 1.570728778839111328125);
    float _1934 = exp2(_1894);
    float _1936 = _1908 * 0.693147182464599609375;
    float _1938 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1940 = sqrt(_1906);
    float _1942 = _1926 * _1924;
    float _1944 = _1928 * _1924;
    float _1946 = fma(_1942, 0.5, 0.5);
    float _1948 = fma(_1944, -0.5, 0.5);
    float _1950 = -_1870;
    float _1952 = fma(_1934, _1916, _1950);
    float3 _5330 = float3(_1946, _1948, _1938);
    float _1954 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5330, float3(0.0), isnan(_5330)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5330, float3(0.0), isnan(_5330)), level(0.0)).x;
    float _1956 = fma(_1952, 0.5, 0.5);
    float _1958 = _1940 * 0.636619746685028076171875;
    float _1960 = -_1932;
    float _1962 = fma(_1958, _1960, 1.0);
    float3 _5351 = float3(_1946, _1948, _1938);
    float4 _1965 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5351, float3(0.0), isnan(_5351)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5351, float3(0.0), isnan(_5351)), level(0.0)).xyzw;
    float _1967 = _1965.x;
    float _1969 = _1965.y;
    float _1971 = _1965.z;
    float _1973 = _1965.w;
    float2 _5368 = float2(_1962, _1956);
    float3 _1977 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5368, float2(0.0), isnan(_5368)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5368, float2(0.0), isnan(_5368)), level(0.0)).xyz;
    float _1979 = _1977.x;
    float _1981 = _1977.y;
    float _1983 = _1977.z;
    float _1985 = in.m_51.w;
    float _1987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1989 = _734 > 0.5;
    float _1991 = in.m_59.y;
    float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1993;
    float _1997 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1999 = _1997 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2001 = in.m_59.x;
    int _2003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2005 = _2003 != 0;
    float _2007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2009 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2011 = _756 > 0.5;
    float _2013 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2015 = _732 + _2013;
    int _2017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2019 = _2017 != 0;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    int _2021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2023 = _2021 != 0;
    float _2025 = 1.0 / _1995;
    int _2027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2029 = _2027 != 0;
    float _2031 = _1987 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2033 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2035 = _1985 > 0.5;
    float _2037 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2033);
    float _2039 = 1.0 / _1999;
    float _2041 = -_1991;
    float _2043 = _2041 + 1.0;
    float _2045 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2037);
    int _2047 = _2035 ? as_type<int>(_2043) : as_type<int>(_1991);
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2049;
    int _2053 = _2011 ? as_type<int>(_2043) : as_type<int>(_1991);
    float _2055 = _2015 * _2025;
    float _2057 = _2019 ? as_type<float>(_2047) : _1991;
    float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2061 = _732 + _2059;
    bool _2063 = _2019;
    float _2065 = _1991;
    if (_2005)
    {
        bool _2067 = _740 > 0.5;
        _2063 = _2067;
    }
    bool _2069 = _2063;
    float _2071 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2073 = _2071 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2075 = fma(_2051, _2055, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2077 = _2061 * _2039;
    float _2079 = _2023 ? as_type<float>(_2053) : _1991;
    float _2081 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2085 = _2083 != 0;
    float _2087 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2089 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2087;
    int _2091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2093 = _2091 != 0;
    float _2095 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2097 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2095;
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2101 = _2099 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2103 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2105 = _2103 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _2107 = _732 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2109 = isnan(_732);
    bool _2111 = _2107 || _2109;
    bool _2113 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2115 = _2111 || _2113;
    float _2117 = float(_2115);
    float _2119 = fma(_2073, _2077, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2121 = fma(_2101, _2077, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2123 = fma(_2105, _2077, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _2125 = _732 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2127 = isnan(_732);
    bool _2129 = _2125 || _2127;
    bool _2131 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2133 = _2129 || _2131;
    float _2135 = float(_2133);
    float _2137 = fma(_2031, _2079, -0.5);
    float _2139 = fma(_2097, _2055, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2143 = fma(_2089, _2055, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _2145 = _732 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2147 = isnan(_732);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2153 = _2149 || _2151;
    float _2155 = float(_2153);
    float _2157 = -_2117;
    float _2159 = _2157 + 1.0;
    float _2161 = -_2135;
    float _2163 = _2161 + 1.0;
    int _2165 = as_type<int>(_2143);
    float _2167 = _2135;
    int _2169 = as_type<int>(_2137);
    if (_2093)
    {
        float _2171 = _1989 ? _2043 : _1991;
        _2065 = _2171;
    }
    float _2173 = _2065;
    float _2175 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2177 = _2135 * _2159;
    float _2179 = _2155 * _2163;
    int _2181 = 0;
    float _2183 = _2173;
    float _2185 = _2175;
    if (_2085)
    {
        float _2187 = -_2001;
        float _2189 = _2187 + 1.0;
        _2181 = as_type<int>(_2189);
    }
    int _2191 = _2181;
    float _2193 = -_2155;
    float _2195 = _2193 + 1.0;
    float _2197 = exp2(_2009);
    float _2199 = _2139 * _2179;
    float _2201 = _2143 * _2179;
    float _2203 = _2075 * _2179;
    float _2205 = fma(_2175, _2173, -0.5);
    if (_2005)
    {
        float _2207 = -_2001;
        float _2209 = _2207 + 1.0;
        _2165 = as_type<int>(_2209);
    }
    int _2211 = _2165;
    if (!_2085)
    {
        _2183 = _2001;
    }
    float _2213 = _2183;
    float _2215 = -_1194;
    float _2217 = fma(_1164, _2137, _2215);
    float _2219 = _2213;
    if (_2085)
    {
        float _2221 = _2011 ? as_type<float>(_2191) : _2001;
        _2219 = _2221;
    }
    float _2223 = _2219;
    float _2225 = _2141 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_2005)
    {
        _2167 = _2001;
    }
    float _2227 = _2167;
    float _2229 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2231 = fma(_2195, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2199);
    float _2233 = fma(_2195, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2201);
    float _2235 = fma(_2195, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2203);
    float _2237 = _2227;
    if (_2005)
    {
        float _2239 = _2069 ? as_type<float>(_2211) : _2001;
        _2237 = _2239;
    }
    float _2241 = _2237;
    float _2243 = _2081 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2029)
    {
        float _2245 = -_2001;
        float _2247 = _2245 + 1.0;
        _2169 = as_type<int>(_2247);
    }
    int _2249 = _2169;
    float _2251 = fma(_2225, _2223, -0.5);
    float _2253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2255 = fma(_2243, _2241, -0.5);
    if (!_2029)
    {
        _2185 = _2001;
    }
    float _2257 = _2185;
    float _2259 = -_1198;
    float _2261 = fma(_1172, _2205, _2259);
    float _2263 = fma(_1184, _2251, _1190);
    float _2265 = _2257;
    if (_2029)
    {
        float _2267 = _1989 ? as_type<float>(_2249) : _2001;
        _2265 = _2267;
    }
    float _2269 = _2265;
    float _2271 = fma(_1144, _2255, _1122);
    float _2273 = _2217 + 0.5;
    float _2275 = fma(_2121, _2177, _2231);
    float _2277 = fma(_2123, _2177, _2233);
    float _2279 = fma(_2119, _2177, _2235);
    float _2281 = _2261 + 0.5;
    float _2283 = _2263 + 0.5;
    float _2285 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2287 = _2269 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2289 = -_2197;
    float _2291 = _2289 + 1.0;
    float _2293 = fma(_2117, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2275);
    float _2295 = fma(_2117, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2277);
    float _2297 = fma(_2117, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2279);
    float _2299 = _2285 * _2229;
    out.m_63.x = _2283;
    out.m_63.y = _2281;
    float _2301 = _2287 * _2253;
    float _2303 = _2271 + 0.5;
    float _2305 = _2293 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2307 = _2295 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2309 = _2297 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2311 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2045);
    out.m_65.x = _2303;
    out.m_65.y = _2273;
    out.m_65.z = _2301;
    out.m_65.w = _2299;
    bool _2313 = _1642 > 0.0;
    bool _2315 = isnan(_1642);
    bool _2317 = _2313 || _2315;
    bool _2319 = isnan(0.0);
    bool _2321 = _2317 || _2319;
    float _2323 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2325 = _1900 * 0.5;
    float _2327 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2329 = _2305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2331 = _2307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2333 = _2309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2335 = _1642 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1926;
    out.gl_Position.y = _1928;
    out.gl_Position.z = _2311;
    out.gl_Position.w = _1900;
    float _2337 = _2335 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _2329;
    out.m_67.y = _2331;
    out.m_67.z = _2333;
    out.m_67.w = _2327;
    float _2339 = fma(_1928, -0.5, _2325);
    float _2341 = -_2323;
    float _2343 = _2341 + 1.0;
    float _2345 = _2311 + _1900;
    float _2347 = _1926 + _1900;
    out.m_45.x = _2337;
    float _2349 = _2345 * 0.5;
    float _2351 = _2347 * 0.5;
    out.m_69.x = _2351;
    out.m_69.y = _2339;
    out.m_69.z = _2349;
    out.m_69.w = _1900;
    float _2353 = _2323 * _1954;
    float _2355 = _1973 * _2353;
    float _2357 = _1973 * _2343;
    float _2359 = _1983 * _2353;
    float _2361 = fma(_1979, _2355, _1967);
    float _2363 = fma(_1981, _2355, _1969);
    float _2365 = fma(_1973, _2359, _1971);
    out.m_71.x = _2361;
    out.m_71.y = _2363;
    out.m_71.z = _2365;
    out.m_71.w = _2357;
    if (_2321)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2367 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2367;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _724 = false;
    bool _582 = false;
    bool _402 = false;
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
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2423 = as_type<float>(_104);
        out.gl_Position.z = _2423;
    }
    if (!_94)
    {
        return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    float _126 = _122;
    if (_118)
    {
        float _128 = float(_90);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _144 = _140 * 5.0;
        _106 = as_type<int>(_144);
    }
    int _146 = _106;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2494 = as_type<float>(_146);
        out.gl_Position.z = _2494;
    }
    if (_136)
    {
        return out;
    }
    float _148 = in.m_49.w;
    float _150 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_47.x;
    float _164 = in.m_47.y;
    float _166 = in.m_47.z;
    float _168 = in.m_42.x;
    float _170 = in.m_42.y;
    float _172 = in.m_42.z;
    float _174 = _150;
    if (!_160)
    {
        float _176 = _150 * _150;
        float _178 = _176 * 0.5;
        _142 = _178;
    }
    float _180 = _142;
    float _182 = _180;
    if (!_160)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_160;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _150 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _150);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_160;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _150 * _228;
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
    float _256 = fma(_246, _162, _250);
    float _258 = fma(_246, _164, _252);
    float _260 = fma(_246, _166, _254);
    float _262 = fma(_256, _148, _168);
    float _264 = fma(_258, _148, _170);
    float _266 = fma(_260, _148, _172);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_51.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
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
        float _294 = _122 * _292;
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
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_312;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = 1.0 / _316;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _342 = _328 * _332;
    float _344 = -_328;
    float _346 = _344 + 1.0;
    float _348 = _300 * _338;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    float _354 = fma(_336, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _356;
    float _360 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = _354 * _342;
    float _364 = fma(_358, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = _360 * _342;
    float _368 = _364 * _342;
    float _370 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _362);
    float _372 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _368);
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _366);
    float _376 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _370);
    float _378 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _372);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _374);
    bool _382 = !_340;
    float _400;
    if (!_382)
    {
        float _384 = in.m_51.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_90);
        float _406 = 1.0 / _404;
        float _408 = _122 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = in.m_49.x;
    float _414 = in.m_49.y;
    float _416 = in.m_49.z;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _420 = _410 + _418;
    bool _422 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _424 = isnan(_410);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _434;
    bool _438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _440 = 1.0 / _436;
    float _442 = _380 * _416;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _448 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _450 = isnan(_410);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = _378 * _414;
    float _462 = _420 * _440;
    float _464 = 1.0 / _446;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _468 = _410 + _466;
    bool _470 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _472 = isnan(_410);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -_432;
    float _484 = _482 + 1.0;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _486;
    float _490 = _376 * _412;
    float _492 = _480 * _484;
    float _494 = -_480;
    float _496 = _494 + 1.0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _502;
    float _506 = fma(_488, _462, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _508 = _458 * _496;
    float _510 = fma(_500, _462, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = fma(_504, _462, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _514 = -_458;
    float _516 = _514 + 1.0;
    float _518 = _468 * _464;
    float _520 = _510 * _508;
    float _522 = _506 * _508;
    float _524 = _512 * _508;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _538 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[107].x, _520);
    float _540 = fma(_528, _518, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _542 = fma(_532, _518, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _544 = fma(_536, _518, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _546 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[107].y, _522);
    float _548 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[107].z, _524);
    float _550 = fma(_540, _492, _538);
    float _552 = fma(_542, _492, _546);
    float _554 = fma(_544, _492, _548);
    float _556 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].x, _550);
    float _558 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].y, _552);
    float _560 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].z, _554);
    bool _562 = !_438;
    float _580;
    if (!_562)
    {
        float _564 = in.m_51.x;
        float _566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _568 = _564 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _570 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _572 = _570 * _566;
        float _574 = floor(_572);
        float _576 = -_574;
        float _578 = _572 + _576;
        _580 = _578;
        _582 = true;
    }
    else
    {
        float _584 = float(_90);
        float _586 = 1.0 / _584;
        float _588 = _122 * _586;
        _580 = _588;
    }
    _582 = false;
    float _590 = _580;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _594 = _590 + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _600 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _602 = isnan(_590);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _616 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _618 = isnan(_590);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _628;
    bool _632 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _634 = isnan(_590);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = 1.0 / _598;
    float _646 = -_610;
    float _648 = _646 + 1.0;
    bool _650 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _652 = _626 * _648;
    float _654 = -_626;
    float _656 = _654 + 1.0;
    float _658 = 1.0 / _614;
    float _660 = _630 * _644;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _666 = fma(_660, _594, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _668 = -_642;
    float _670 = _668 + 1.0;
    float _672 = _666 * _652;
    float _674 = _664 * _658;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _678 = _590 + _676;
    float _680 = _610 * _670;
    float _682 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[115].x, _672);
    float _684 = _556 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _686 = fma(_674, _678, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _688 = _558 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _690 = _560 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = fma(_686, _680, _682);
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[117].x, _694);
    float _702 = _700 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _692;
    out.m_53.y = _696;
    out.m_53.z = _698;
    out.m_53.w = _702;
    bool _704 = !_650;
    float _722;
    if (!_704)
    {
        float _706 = in.m_51.x;
        float _708 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _710 = _706 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _714 = _712 * _708;
        float _716 = floor(_714);
        float _718 = -_716;
        float _720 = _714 + _718;
        _722 = _720;
        _724 = true;
    }
    else
    {
        float _726 = float(_90);
        float _728 = 1.0 / _726;
        float _730 = _122 * _728;
        _722 = _730;
    }
    _724 = false;
    float _732 = _722;
    float _734 = in.m_51.z;
    float _736 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _738 = log2(_736);
    float _740 = in.m_51.x;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _746 = _744 != 0;
    float _748 = in.m_55.x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _752 = in.m_55.z;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _756 = in.m_51.y;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _760 = _734 * 2.0;
    float _762 = _740 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _764 = _740 * 2.0;
    float _766 = floor(_760);
    float _768 = -_742;
    float _770 = fma(_762, 2.0, _768);
    float _772 = abs(_748);
    float _774 = abs(_752);
    float _776 = precise::max(_772, _774);
    float _778 = floor(_764);
    float _780 = _740 + _756;
    bool _782 = _776 >= 16.0;
    float _784 = _756 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _786 = _780 + (-1.0);
    float _788 = _756 * 2.0;
    float _790 = fma(_784, -2.0, _750);
    float _792 = _748 * 0.0625;
    float _794 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _796 = _752 * 0.0625;
    bool _798 = _766 > 0.0;
    float _800 = floor(_788);
    bool _802 = _766 >= 0.0;
    bool _804 = isnan(_766);
    bool _806 = _802 || _804;
    bool _808 = isnan(0.0);
    bool _810 = _806 || _808;
    float _812 = _782 ? _796 : _752;
    float _814 = _786;
    float _816 = _796;
    if (_746)
    {
        _814 = _740;
    }
    float _818 = _814;
    float _820 = _782 ? _792 : _748;
    float _822 = _818;
    if (!_746)
    {
        _822 = _734;
    }
    float _824 = _822;
    float _826 = abs(_812);
    bool _828 = _826 != 0.0;
    bool _830 = isnan(_826);
    bool _832 = _828 || _830;
    bool _834 = isnan(0.0);
    bool _836 = _832 || _834;
    if (_746)
    {
        _816 = _756;
    }
    float _838 = _816;
    float _840 = _824 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _842 = _838;
    if (!_746)
    {
        _842 = _740;
    }
    float _844 = _842;
    float _846 = abs(_820);
    bool _848 = _846 == 0.0;
    bool _850 = !_836;
    bool _852 = _848 && _850;
    float _854 = -_754;
    float _856 = fma(_840, 2.0, _854);
    bool _858 = _778 >= 0.0;
    bool _860 = isnan(_778);
    bool _862 = _858 || _860;
    bool _864 = isnan(0.0);
    bool _866 = _862 || _864;
    float _868 = _844 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _870 = _810 ? 0 : 1;
    int _872 = _866 ? 0 : 1;
    float _874 = fma(_868, -2.0, _758);
    float _876 = abs(_820);
    bool _878 = _876 == 0.0;
    bool _880 = _778 > 0.0;
    bool _882 = _800 > 0.0;
    bool _884 = _800 >= 0.0;
    bool _886 = isnan(_800);
    bool _888 = _884 || _886;
    bool _890 = isnan(0.0);
    bool _892 = _888 || _890;
    int _894 = ~_870;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    int _900 = _892 ? 0 : 1;
    bool _902 = _892;
    int _904 = _898;
    int _906 = _878 ? (-1) : 0;
    if (_852)
    {
        bool _908 = as_type<int>(_820) >= 0;
        _902 = _908;
    }
    bool _910 = _902;
    int _912 = ~_872;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    int _918 = 0;
    int _920 = _916;
    if (_852)
    {
        int _922 = _910 ? 0 : 1078530011;
        _918 = _922;
    }
    int _924 = _918;
    int _926 = ~_900;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    int _932 = _930;
    int _934 = _924;
    if (!_798)
    {
        int _936 = ~_870;
        int _938 = _936 + 1;
        _904 = _938;
    }
    int _940 = _904;
    if (!_880)
    {
        int _942 = ~_872;
        int _944 = _942 + 1;
        _920 = _944;
    }
    int _946 = _920;
    if (!_882)
    {
        int _948 = ~_900;
        int _950 = _948 + 1;
        _932 = _950;
    }
    int _952 = _932;
    if (_852)
    {
        int _954 = int(0x80000000) & as_type<int>(_812);
        int _956 = _924 | _954;
        _934 = _956;
    }
    int _958 = _934;
    bool _960 = !_836;
    bool _962 = _960 && _878;
    int _964 = _958;
    float _966 = as_type<float>(_958);
    if (!_962)
    {
        float _968 = abs(_812);
        bool _970 = _968 != as_type<float>(0x7f800000u /* inf */);
        bool _972 = isnan(_968);
        bool _974 = _970 || _972;
        bool _976 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _978 = _974 || _976;
        float _980 = abs(_820);
        bool _982 = _980 == as_type<float>(0x7f800000u /* inf */);
        float _984 = abs(_820);
        bool _986 = _984 == as_type<float>(0x7f800000u /* inf */);
        bool _988 = !_978;
        bool _990 = _986 && _988;
        if (_990)
        {
            bool _992 = as_type<int>(_820) >= 0;
            _906 = _992 ? (-1) : 0;
        }
        int _994 = _906;
        if (_990)
        {
            _964 = 1075235812;
        }
        int _996 = _964;
        int _998 = _996;
        if (_990)
        {
            int _1000 = ~_994;
            int _1002 = (_1000 != 0) ? _996 : 1061752795;
            _998 = _1002;
        }
        int _1004 = _998;
        float _1006 = as_type<float>(_1004);
        if (_990)
        {
            int _1008 = int(0x80000000) & as_type<int>(_812);
            int _1010 = _1004 | _1008;
            _1006 = as_type<float>(_1010);
        }
        float _1012 = _1006;
        bool _1014 = !_978;
        bool _1016 = _1014 && _982;
        _966 = _1012;
        if (!_1016)
        {
            float _1018 = abs(_812);
            float _1020 = abs(_820);
            float _1022 = precise::max(_1018, _1020);
            float _1024 = abs(_812);
            float _1026 = abs(_820);
            float _1028 = _1024 + _1026;
            float _1030 = abs(_812);
            float _1032 = abs(_820);
            float _1034 = precise::min(_1030, _1032);
            float _1036 = 1.0 / _1022;
            float _1038 = abs(_812);
            float _1040 = abs(_820);
            bool _1042 = _1038 > _1040;
            bool _1044 = as_type<int>(_820) >= 0;
            bool _1046 = _1028 > as_type<float>(0x7f800000u /* inf */);
            bool _1048 = isnan(_1028);
            bool _1050 = _1046 || _1048;
            bool _1052 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1054 = _1050 || _1052;
            int _1056 = as_type<int>(_812) & int(0x80000000);
            float _1058 = _1034 * _1036;
            float _1060 = _1058 * _1058;
            float _1062 = _1060 + 11.33538818359375;
            float _1064 = fma(_1060, _1062, 28.84246826171875);
            float _1066 = fma(_1060, _1064, 19.6966705322265625);
            float _1068 = fma(_1060, -0.82336294651031494140625, -5.674867153167724609375);
            float _1070 = fma(_1060, _1068, -6.565555095672607421875);
            float _1072 = 1.0 / _1066;
            float _1074 = _1060 * _1070;
            float _1076 = _1058 * _1074;
            float _1078 = fma(_1076, _1072, _1058);
            float _1080 = _1078;
            _966 = _1028;
            if (_1042)
            {
                float _1082 = -_1078;
                float _1084 = _1082 + 1.57079637050628662109375;
                _1080 = _1084;
            }
            float _1086 = _1080;
            int _1088 = as_type<int>(_1086);
            if (!_1044)
            {
                float _1090 = -_1086;
                float _1092 = _1090 + 3.1415927410125732421875;
                _1088 = as_type<int>(_1092);
            }
            int _1094 = _1088;
            if (!_1054)
            {
                int _1096 = _1056 | _1094;
                _966 = as_type<float>(_1096);
            }
        }
    }
    float _1098 = _966;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1102 = _1100 != 0;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1106 = _1104 != 0;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1110 = _1108 != 0;
    float _1112 = _738 * _122;
    float _1114 = in.m_57.x;
    float _1116 = in.m_57.y;
    float _1118 = in.m_57.z;
    float _1120 = -_122;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[76].x, _770);
    float _1124 = exp2(_1112);
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1134 = 1.0 + _1132;
    float _1136 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1126);
    float _1138 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1128);
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1142 = 1.0 / _1134;
    float _1144 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1136);
    bool _1146 = !_1102;
    int _1148 = _1146 ? 0 : 1;
    float _1150 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1130);
    bool _1152 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1154 = isnan(1.0);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1160 = _1156 || _1158;
    float _1162 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1140);
    float _1164 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1138);
    float _1166 = -_1124;
    float _1168 = _1166 + 1.0;
    int _1170 = abs(_1148);
    float _1172 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1162);
    bool _1174 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1176 = isnan(0.0);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1182 = _1178 || _1180;
    float _1184 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1150);
    float _1186 = float(_940);
    float _1188 = -_122;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[86].x, _856);
    float _1192 = float(_1170);
    float _1194 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _790);
    float _1196 = _1182 ? _1168 : 0.0;
    float _1198 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _874);
    bool _1200 = !_1106;
    int _1202 = _1200 ? 0 : 1;
    float _1204 = _1192 * _1186;
    float _1206 = _740 + (-0.5);
    if (_1160)
    {
        float _1208 = _1196 * _1142;
        _126 = _1208;
    }
    float _1210 = _126;
    int _1212 = abs(_1202);
    float _1214 = _1204 * (-2.0);
    float _1216 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1218 = float(_946);
    float _1220 = fma(_1214, _1114, _1114);
    bool _1222 = !_1110;
    int _1224 = _1222 ? 0 : 1;
    float _1226 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0500000081956386566162109375, _1098);
    float _1228 = float(_1212);
    float _1230 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0500000081956386566162109375, _1098);
    float _1232 = fma(_794, _1214, _794);
    float _1234 = _1226 * 4.0;
    float _1236 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1220);
    int _1238 = abs(_1224);
    float _1240 = _756 + _734;
    float _1242 = _1228 * _1218;
    float _1244 = _1234 * 0.15915493667125701904296875;
    float _1246 = fma(_1232, _1210, _1236);
    float _1248 = _1230 * 2.0;
    float _1250 = _1240 + (-1.0);
    float _1252 = float(_952);
    float _1254 = _1242 * (-2.0);
    float _1256 = float(_1238);
    float _1258 = _1248 * 0.15915493667125701904296875;
    float _1260 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1262 = fma(_1254, _1116, _1116);
    float _1264 = _1244 * 6.283185482025146484375;
    float _1266 = sin(_1264);
    float _1268 = _1256 * _1252;
    float _1270 = _756 + (-0.5);
    float _1272 = _740 + _734;
    float _1274 = fma(_1260, _1254, _1260);
    float _1276 = _1246 * 0.15915493667125701904296875;
    float _1278 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1262);
    float _1280 = _1258 * 6.283185482025146484375;
    float _1282 = sin(_1280);
    float _1284 = _1272 + (-1.0);
    float _1286 = fma(_1274, _1210, _1278);
    float _1288 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1290 = _1286 * 0.15915493667125701904296875;
    float _1292 = in.m_55.y;
    float _1294 = _1268 * (-2.0);
    float _1296 = _1276 * 6.283185482025146484375;
    float _1298 = sin(_1296);
    bool _1300 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1302 = isnan(0.5);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1308 = _1304 || _1306;
    float _1310 = fma(_1294, _1118, _1118);
    float _1312 = _734 + (-0.5);
    float _1314 = fma(_1288, _1294, _1288);
    float _1316 = fma(_1266, 0.5, 0.5);
    float _1318 = fma(_1282, 0.5, 0.5);
    float _1320 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1310);
    float _1322 = _1276 * 6.283185482025146484375;
    float _1324 = cos(_1322);
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _748);
    float _1328 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _752);
    float _1330 = precise::max(_1316, _1318);
    float _1332 = fma(_1314, _1210, _1320);
    float _1334 = _1326 * _1216;
    float _1336 = _1332 * 0.15915493667125701904296875;
    float _1338 = _1330 * _1330;
    float _1340 = _1290 * 6.283185482025146484375;
    float _1342 = sin(_1340);
    float _1344 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1346 = _1338 * _1338;
    float _1348 = _1328 * _1344;
    float _1350 = _1346 * _1292;
    float _1352 = _1290 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1350);
    float _1360 = _1358 * _1356;
    float _1362 = _1336 * 6.283185482025146484375;
    float _1364 = cos(_1362);
    float _1366 = _1298 * _1342;
    float _1368 = _1336 * 6.283185482025146484375;
    float _1370 = sin(_1368);
    float _1372 = _1324 * _1354;
    float _1374 = _1298 * _1354;
    float _1376 = _1364 * _1360;
    float _1378 = _1298 * _1376;
    float _1380 = fma(_1370, _1372, _1366);
    float _1382 = fma(_1370, _1366, _1372);
    float _1384 = _1324 * _1342;
    float _1386 = _1324 * _1376;
    float _1388 = _1342 * _1364;
    float _1390 = _1354 * _1364;
    float _1392 = -_1384;
    float _1394 = fma(_1370, _1374, _1392);
    float _1396 = -_1360;
    float _1398 = _1370 * _1396;
    float _1400 = -_1374;
    float _1402 = fma(_1370, _1384, _1400);
    float _1404 = fma(_1380, _1334, _1386);
    float _1406 = fma(_1394, _1334, _1378);
    float _1408 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1410 = fma(_1390, _1334, _1398);
    float _1412 = fma(_1402, _1348, _1404);
    float _1414 = fma(_1382, _1348, _1406);
    float _1416 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1408);
    float _1418 = fma(_1388, _1348, _1410);
    float _1420 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1422 = _1412 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1424 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1416);
    float _1426 = _1412 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1428 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1420);
    float _1430 = fma(_1418, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1426);
    float _1436 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1428);
    float _1438 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1430);
    float _1440 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1442 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1434);
    float _1444 = _1436 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1446 = _1432 + _1438;
    float _1448 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1440);
    float _1450 = _1444 + _1442;
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1454 = _1446 + _1452;
    float _1456 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1448);
    float _1458 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1460 = _1450 + _1458;
    float _1462 = _1454 * _1454;
    float _1464 = _1456 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1466 = fma(_1460, _1460, _1462);
    float _1468 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1470 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1472 = sqrt(_1466);
    float _1474 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1468);
    float _1476 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1470);
    float _1478 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1474);
    float _1480 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1476);
    float _1482 = _1478 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1484 = _1412 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1486 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1488 = 1.0 / _1482;
    float _1490 = fma(_1418, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1484);
    float _1492 = _1486 + _1482;
    bool _1494 = _1472 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1496 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1490);
    float _1498 = _1464 + _1496;
    float _1500 = _1496;
    float _1502 = _1484;
    float _1504 = _1492;
    float _1506 = _1482;
    float _1508 = _1444;
    float _1510 = _1412;
    if (_1308)
    {
        _1500 = 1.0;
    }
    float _1512 = _1500;
    float _1514 = _1492 * _1488;
    float _1516 = _1514 * 0.5;
    float _1518 = _1512;
    if (!_1494)
    {
        _1502 = _1450;
    }
    float _1520 = _1502;
    float _1522 = _1520;
    if (!_1494)
    {
        _1504 = _1446;
    }
    float _1524 = _1504;
    float _1526 = _1524;
    if (!_1494)
    {
        _1506 = _1498;
    }
    float _1528 = _1506;
    bool _1530 = !_1494;
    float _1532 = _1528;
    if (!_1530)
    {
        float _1534 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1536 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1538 = _1472 + _1536;
        float _1540 = rsqrt(_1466);
        float _1542 = _1538 * _1534;
        float _1544 = _1498 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1546 = _1542 * 0.15915493667125701904296875;
        float _1548 = _1546 * 6.283185482025146484375;
        float _1550 = sin(_1548);
        float _1552 = _1546 * 6.283185482025146484375;
        float _1554 = cos(_1552);
        float _1556 = fma(_1550, _1544, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1558 = _1540 * _1556;
        float _1560 = _1554 + (-1.0);
        float _1562 = fma(_1460, _1558, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1564 = fma(_1454, _1558, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1566 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1568 = fma(_1498, _1554, _1566);
        _1532 = _1568;
        _1522 = _1562;
        _1526 = _1564;
    }
    float _1570 = _1532;
    float _1572 = _1522;
    float _1574 = _1526;
    if (!_1308)
    {
        float _1576 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1578 = _1576 * 0.15915493667125701904296875;
        float _1580 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1582 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1584 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1582);
        float _1586 = _1578 * 6.283185482025146484375;
        float _1588 = cos(_1586);
        float _1590 = _1580 * 0.15915493667125701904296875;
        float _1592 = _1578 * 6.283185482025146484375;
        float _1594 = sin(_1592);
        float _1596 = 1.0 / _1588;
        float _1598 = _1590 * 6.283185482025146484375;
        float _1600 = cos(_1598);
        float _1602 = _1594 * _1596;
        float _1604 = _1590 * 6.283185482025146484375;
        float _1606 = sin(_1604);
        float _1608 = _1600 * _1602;
        float _1610 = 1.0 / _1584;
        float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1614 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1612;
        float _1616 = 1.0 / _1608;
        float _1618 = 1.0 / _1614;
        float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1622 = _1610 * _1620;
        float _1624 = _1606 * _1616;
        float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1628 = fma(_1624, _1622, _1626);
        float _1630 = _1628 * _1618;
        float _1632 = precise::clamp(_1630, 0.0, 1.0);
        float _1634 = -_1632;
        float _1636 = _1634 + 1.0;
        _1508 = _1618;
        _1510 = _1610;
        _1518 = _1636;
    }
    float _1638 = _1508;
    float _1640 = _1510;
    float _1642 = _1518;
    float _1644 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1646 = _1570 + _1644;
    float _1648 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1650 = _1572 + _1648;
    float _1652 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1654 = _1574 + _1652;
    float _1656 = _1646 * _1646;
    float _1658 = fma(_1650, _1650, _1656);
    float _1660 = fma(_1654, _1654, _1658);
    float _1662 = rsqrt(_1660);
    float _1664 = sqrt(_1660);
    float _1666 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1668 = _1650 * _1666;
    float _1670 = _1654 * _1666;
    float _1672 = _1668 * _1668;
    float _1674 = _1670 * _1670;
    float _1676 = _1672 + _1674;
    float _1678 = sqrt(_1676);
    bool _1680 = _1678 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1684 = _1678 + _1682;
    float _1686 = _1662;
    float _1688 = _1684;
    float _1690 = _1638;
    float _1692 = _1646;
    float _1694 = _1666;
    if (_1680)
    {
        float _1696 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1686 = _1696;
    }
    float _1698 = _1686;
    float _1700 = _1698;
    if (_1680)
    {
        float _1702 = _1684 * _1698;
        _1688 = _1702;
    }
    float _1704 = _1688;
    if (_1680)
    {
        float _1706 = rsqrt(_1676);
        _1700 = _1706;
    }
    float _1708 = _1700;
    float _1710 = _1708;
    if (_1680)
    {
        float _1712 = _1704 * 0.15915493667125701904296875;
        _1690 = _1712;
    }
    float _1714 = _1690;
    float _1716 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1718 = _1654;
    float _1720 = _1714;
    if (_1680)
    {
        float _1722 = _1714 * 6.283185482025146484375;
        float _1724 = sin(_1722);
        _1718 = _1724;
    }
    float _1726 = _1718;
    float _1728 = precise::max(0.0, _1716);
    float _1730 = _1640;
    float _1732 = _1728;
    if (_1680)
    {
        float _1734 = _1714 * 6.283185482025146484375;
        float _1736 = cos(_1734);
        _1730 = _1736;
    }
    float _1738 = _1730;
    float _1740 = -_1666;
    float _1742 = -_1728;
    float _1744 = fma(_1646, _1740, _1742);
    if (_1680)
    {
        float _1746 = _1744 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1692 = _1746;
    }
    float _1748 = _1692;
    float _1750 = _1726;
    float _1752 = _1748;
    if (_1680)
    {
        float _1754 = fma(_1726, _1748, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1750 = _1754;
    }
    float _1756 = _1750;
    float _1758 = _1756;
    if (!_1680)
    {
        _1752 = _1672;
    }
    float _1760 = _1752;
    float _1762 = _1760;
    if (_1680)
    {
        float _1764 = _1708 * _1756;
        _1694 = _1764;
    }
    float _1766 = _1694;
    if (!_1680)
    {
        _1710 = _1668;
    }
    float _1768 = _1710;
    float _1770 = _1768;
    float _1772 = _1738;
    if (_1680)
    {
        float _1774 = _1738 + (-1.0);
        _1732 = _1774;
    }
    float _1776 = _1732;
    float _1778 = _1776;
    if (_1680)
    {
        float _1780 = _1668 * _1766;
        _1770 = _1780;
    }
    float _1782 = _1770;
    if (!_1680)
    {
        _1758 = _1744;
    }
    float _1784 = _1758;
    float _1786 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1788 = _1784;
    if (_1680)
    {
        float _1790 = _1776 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1720 = _1790;
    }
    float _1792 = _1720;
    if (!_1680)
    {
        _1778 = _1670;
    }
    float _1794 = _1778;
    float _1796 = _1794;
    if (_1680)
    {
        float _1798 = _1670 * _1766;
        _1796 = _1798;
    }
    float _1800 = _1796;
    if (_1680)
    {
        float _1802 = _1782 * _1782;
        _1762 = _1802;
    }
    float _1804 = _1762;
    if (_1680)
    {
        float _1806 = fma(_1744, _1738, _1792);
        _1788 = _1806;
    }
    float _1808 = _1788;
    if (!_1680)
    {
        _1772 = _1674;
    }
    float _1810 = _1772;
    float _1812 = _1810;
    if (_1680)
    {
        float _1814 = _1800 * _1800;
        _1812 = _1814;
    }
    float _1816 = _1812;
    float _1818 = fma(_1808, _1808, _1804);
    float _1820 = _1818 + _1816;
    float _1822 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1824 = fma(_1664, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1822);
    float _1826 = precise::clamp(_1824, 0.0, 1.0);
    float _1828 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1786);
    float _1830 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1832 = rsqrt(_1820);
    float _1834 = -_1826;
    float _1836 = _1834 + 1.0;
    float _1838 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1840 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1830);
    float _1842 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1844 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1828);
    float _1846 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1838);
    float _1848 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1840);
    float _1850 = abs(_1836);
    float _1852 = log2(_1850);
    float _1854 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1842);
    float _1856 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1846);
    float _1858 = _1848 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1860 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1862 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1854);
    float _1864 = _1856 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1866 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1868 = _1832 * _1782;
    float _1870 = _1832 * _1808;
    float _1872 = _1832 * _1800;
    float _1874 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1866);
    float _1876 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1878 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1880 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1882 = _1862 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1884 = -_1876;
    float _1886 = fma(_1870, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1884);
    float _1888 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1874);
    float _1890 = -_1880;
    float _1892 = fma(_1890, _1878, 1.0);
    float _1894 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1896 = -_1872;
    float _1898 = fma(_1896, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1886);
    float _1900 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1888);
    float _1902 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1904 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1906 = fma(_1898, -0.5, 0.5);
    float _1908 = log2(_1892);
    float _1910 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1902);
    float _1912 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1904);
    float _1914 = fma(_1898, 0.5, 0.5);
    float _1916 = _1870 + 1.0;
    float _1918 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1910);
    float _1920 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1912);
    float _1922 = fma(_1914, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1924 = 1.0 / _1900;
    float _1926 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1918);
    float _1928 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1920);
    float _1930 = fma(_1914, _1922, -0.212114393711090087890625);
    float _1932 = fma(_1914, _1930, 1.570728778839111328125);
    float _1934 = exp2(_1894);
    float _1936 = _1908 * 0.693147182464599609375;
    float _1938 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1940 = sqrt(_1906);
    float _1942 = _1926 * _1924;
    float _1944 = _1928 * _1924;
    float _1946 = fma(_1942, 0.5, 0.5);
    float _1948 = fma(_1944, -0.5, 0.5);
    float _1950 = -_1870;
    float _1952 = fma(_1934, _1916, _1950);
    float3 _5330 = float3(_1946, _1948, _1938);
    float _1954 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5330, float3(0.0), isnan(_5330)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5330, float3(0.0), isnan(_5330)), level(0.0)).x;
    float _1956 = fma(_1952, 0.5, 0.5);
    float _1958 = _1940 * 0.636619746685028076171875;
    float _1960 = -_1932;
    float _1962 = fma(_1958, _1960, 1.0);
    float3 _5351 = float3(_1946, _1948, _1938);
    float4 _1965 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5351, float3(0.0), isnan(_5351)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5351, float3(0.0), isnan(_5351)), level(0.0)).xyzw;
    float _1967 = _1965.x;
    float _1969 = _1965.y;
    float _1971 = _1965.z;
    float _1973 = _1965.w;
    float2 _5368 = float2(_1962, _1956);
    float3 _1977 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5368, float2(0.0), isnan(_5368)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5368, float2(0.0), isnan(_5368)), level(0.0)).xyz;
    float _1979 = _1977.x;
    float _1981 = _1977.y;
    float _1983 = _1977.z;
    float _1985 = in.m_51.w;
    float _1987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1989 = _734 > 0.5;
    float _1991 = in.m_59.y;
    float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1993;
    float _1997 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1999 = _1997 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2001 = in.m_59.x;
    int _2003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2005 = _2003 != 0;
    float _2007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2009 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2011 = _756 > 0.5;
    float _2013 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2015 = _732 + _2013;
    int _2017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2019 = _2017 != 0;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    int _2021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2023 = _2021 != 0;
    float _2025 = 1.0 / _1995;
    int _2027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2029 = _2027 != 0;
    float _2031 = _1987 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2033 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2035 = _1985 > 0.5;
    float _2037 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2033);
    float _2039 = 1.0 / _1999;
    float _2041 = -_1991;
    float _2043 = _2041 + 1.0;
    float _2045 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2037);
    int _2047 = _2035 ? as_type<int>(_2043) : as_type<int>(_1991);
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2049;
    int _2053 = _2011 ? as_type<int>(_2043) : as_type<int>(_1991);
    float _2055 = _2015 * _2025;
    float _2057 = _2019 ? as_type<float>(_2047) : _1991;
    float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2061 = _732 + _2059;
    bool _2063 = _2019;
    float _2065 = _1991;
    if (_2005)
    {
        bool _2067 = _740 > 0.5;
        _2063 = _2067;
    }
    bool _2069 = _2063;
    float _2071 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2073 = _2071 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2075 = fma(_2051, _2055, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2077 = _2061 * _2039;
    float _2079 = _2023 ? as_type<float>(_2053) : _1991;
    float _2081 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2085 = _2083 != 0;
    float _2087 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2089 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2087;
    int _2091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2093 = _2091 != 0;
    float _2095 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2097 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2095;
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2101 = _2099 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2103 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2105 = _2103 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _2107 = _732 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2109 = isnan(_732);
    bool _2111 = _2107 || _2109;
    bool _2113 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2115 = _2111 || _2113;
    float _2117 = float(_2115);
    float _2119 = fma(_2073, _2077, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2121 = fma(_2101, _2077, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2123 = fma(_2105, _2077, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _2125 = _732 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2127 = isnan(_732);
    bool _2129 = _2125 || _2127;
    bool _2131 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2133 = _2129 || _2131;
    float _2135 = float(_2133);
    float _2137 = fma(_2031, _2079, -0.5);
    float _2139 = fma(_2097, _2055, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2143 = fma(_2089, _2055, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _2145 = _732 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2147 = isnan(_732);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2153 = _2149 || _2151;
    float _2155 = float(_2153);
    float _2157 = -_2117;
    float _2159 = _2157 + 1.0;
    float _2161 = -_2135;
    float _2163 = _2161 + 1.0;
    int _2165 = as_type<int>(_2143);
    float _2167 = _2135;
    int _2169 = as_type<int>(_2137);
    if (_2093)
    {
        float _2171 = _1989 ? _2043 : _1991;
        _2065 = _2171;
    }
    float _2173 = _2065;
    float _2175 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2177 = _2135 * _2159;
    float _2179 = _2155 * _2163;
    int _2181 = 0;
    float _2183 = _2173;
    float _2185 = _2175;
    if (_2085)
    {
        float _2187 = -_2001;
        float _2189 = _2187 + 1.0;
        _2181 = as_type<int>(_2189);
    }
    int _2191 = _2181;
    float _2193 = -_2155;
    float _2195 = _2193 + 1.0;
    float _2197 = exp2(_2009);
    float _2199 = _2139 * _2179;
    float _2201 = _2143 * _2179;
    float _2203 = _2075 * _2179;
    float _2205 = fma(_2175, _2173, -0.5);
    if (_2005)
    {
        float _2207 = -_2001;
        float _2209 = _2207 + 1.0;
        _2165 = as_type<int>(_2209);
    }
    int _2211 = _2165;
    if (!_2085)
    {
        _2183 = _2001;
    }
    float _2213 = _2183;
    float _2215 = -_1194;
    float _2217 = fma(_1164, _2137, _2215);
    float _2219 = _2213;
    if (_2085)
    {
        float _2221 = _2011 ? as_type<float>(_2191) : _2001;
        _2219 = _2221;
    }
    float _2223 = _2219;
    float _2225 = _2141 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_2005)
    {
        _2167 = _2001;
    }
    float _2227 = _2167;
    float _2229 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2231 = fma(_2195, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2199);
    float _2233 = fma(_2195, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2201);
    float _2235 = fma(_2195, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2203);
    float _2237 = _2227;
    if (_2005)
    {
        float _2239 = _2069 ? as_type<float>(_2211) : _2001;
        _2237 = _2239;
    }
    float _2241 = _2237;
    float _2243 = _2081 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2029)
    {
        float _2245 = -_2001;
        float _2247 = _2245 + 1.0;
        _2169 = as_type<int>(_2247);
    }
    int _2249 = _2169;
    float _2251 = fma(_2225, _2223, -0.5);
    float _2253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2255 = fma(_2243, _2241, -0.5);
    if (!_2029)
    {
        _2185 = _2001;
    }
    float _2257 = _2185;
    float _2259 = -_1198;
    float _2261 = fma(_1172, _2205, _2259);
    float _2263 = fma(_1184, _2251, _1190);
    float _2265 = _2257;
    if (_2029)
    {
        float _2267 = _1989 ? as_type<float>(_2249) : _2001;
        _2265 = _2267;
    }
    float _2269 = _2265;
    float _2271 = fma(_1144, _2255, _1122);
    float _2273 = _2217 + 0.5;
    float _2275 = fma(_2121, _2177, _2231);
    float _2277 = fma(_2123, _2177, _2233);
    float _2279 = fma(_2119, _2177, _2235);
    float _2281 = _2261 + 0.5;
    float _2283 = _2263 + 0.5;
    float _2285 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2287 = _2269 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2289 = -_2197;
    float _2291 = _2289 + 1.0;
    float _2293 = fma(_2117, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2275);
    float _2295 = fma(_2117, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2277);
    float _2297 = fma(_2117, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2279);
    float _2299 = _2285 * _2229;
    out.m_63.x = _2283;
    out.m_63.y = _2281;
    float _2301 = _2287 * _2253;
    float _2303 = _2271 + 0.5;
    float _2305 = _2293 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2307 = _2295 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2309 = _2297 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2311 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2045);
    out.m_65.x = _2303;
    out.m_65.y = _2273;
    out.m_65.z = _2301;
    out.m_65.w = _2299;
    bool _2313 = _1642 > 0.0;
    bool _2315 = isnan(_1642);
    bool _2317 = _2313 || _2315;
    bool _2319 = isnan(0.0);
    bool _2321 = _2317 || _2319;
    float _2323 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2325 = _1900 * 0.5;
    float _2327 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2329 = _2305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2331 = _2307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2333 = _2309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2335 = _1642 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1926;
    out.gl_Position.y = _1928;
    out.gl_Position.z = _2311;
    out.gl_Position.w = _1900;
    float _2337 = _2335 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _2329;
    out.m_67.y = _2331;
    out.m_67.z = _2333;
    out.m_67.w = _2327;
    float _2339 = fma(_1928, -0.5, _2325);
    float _2341 = -_2323;
    float _2343 = _2341 + 1.0;
    float _2345 = _2311 + _1900;
    float _2347 = _1926 + _1900;
    out.m_45.x = _2337;
    float _2349 = _2345 * 0.5;
    float _2351 = _2347 * 0.5;
    out.m_69.x = _2351;
    out.m_69.y = _2339;
    out.m_69.z = _2349;
    out.m_69.w = _1900;
    float _2353 = _2323 * _1954;
    float _2355 = _1973 * _2353;
    float _2357 = _1973 * _2343;
    float _2359 = _1983 * _2353;
    float _2361 = fma(_1979, _2355, _1967);
    float _2363 = fma(_1981, _2355, _1969);
    float _2365 = fma(_1973, _2359, _1971);
    out.m_71.x = _2361;
    out.m_71.y = _2363;
    out.m_71.z = _2365;
    out.m_71.w = _2357;
    if (_2321)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2367 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2367;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _724 = false;
    bool _582 = false;
    bool _402 = false;
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
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2423 = as_type<float>(_104);
        out.gl_Position.z = _2423;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    float _126 = _122;
    if (_118)
    {
        float _128 = float(_90);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _144 = _140 * 5.0;
        _106 = as_type<int>(_144);
    }
    int _146 = _106;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2494 = as_type<float>(_146);
        out.gl_Position.z = _2494;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_49.w;
    float _150 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_47.x;
    float _164 = in.m_47.y;
    float _166 = in.m_47.z;
    float _168 = in.m_42.x;
    float _170 = in.m_42.y;
    float _172 = in.m_42.z;
    float _174 = _150;
    if (!_160)
    {
        float _176 = _150 * _150;
        float _178 = _176 * 0.5;
        _142 = _178;
    }
    float _180 = _142;
    float _182 = _180;
    if (!_160)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_160;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _150 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _150);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_160;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _150 * _228;
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
    float _256 = fma(_246, _162, _250);
    float _258 = fma(_246, _164, _252);
    float _260 = fma(_246, _166, _254);
    float _262 = fma(_256, _148, _168);
    float _264 = fma(_258, _148, _170);
    float _266 = fma(_260, _148, _172);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_51.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
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
        float _294 = _122 * _292;
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
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_312;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = 1.0 / _316;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _342 = _328 * _332;
    float _344 = -_328;
    float _346 = _344 + 1.0;
    float _348 = _300 * _338;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    float _354 = fma(_336, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _356;
    float _360 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = _354 * _342;
    float _364 = fma(_358, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = _360 * _342;
    float _368 = _364 * _342;
    float _370 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _362);
    float _372 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _368);
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _366);
    float _376 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _370);
    float _378 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _372);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _374);
    bool _382 = !_340;
    float _400;
    if (!_382)
    {
        float _384 = in.m_51.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_90);
        float _406 = 1.0 / _404;
        float _408 = _122 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = in.m_49.x;
    float _414 = in.m_49.y;
    float _416 = in.m_49.z;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _420 = _410 + _418;
    bool _422 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _424 = isnan(_410);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _434;
    bool _438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _440 = 1.0 / _436;
    float _442 = _380 * _416;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _448 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _450 = isnan(_410);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = _378 * _414;
    float _462 = _420 * _440;
    float _464 = 1.0 / _446;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _468 = _410 + _466;
    bool _470 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _472 = isnan(_410);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -_432;
    float _484 = _482 + 1.0;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _486;
    float _490 = _376 * _412;
    float _492 = _480 * _484;
    float _494 = -_480;
    float _496 = _494 + 1.0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _502;
    float _506 = fma(_488, _462, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _508 = _458 * _496;
    float _510 = fma(_500, _462, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = fma(_504, _462, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _514 = -_458;
    float _516 = _514 + 1.0;
    float _518 = _468 * _464;
    float _520 = _510 * _508;
    float _522 = _506 * _508;
    float _524 = _512 * _508;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _538 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[107].x, _520);
    float _540 = fma(_528, _518, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _542 = fma(_532, _518, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _544 = fma(_536, _518, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _546 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[107].y, _522);
    float _548 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[107].z, _524);
    float _550 = fma(_540, _492, _538);
    float _552 = fma(_542, _492, _546);
    float _554 = fma(_544, _492, _548);
    float _556 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].x, _550);
    float _558 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].y, _552);
    float _560 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].z, _554);
    bool _562 = !_438;
    float _580;
    if (!_562)
    {
        float _564 = in.m_51.x;
        float _566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _568 = _564 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _570 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _572 = _570 * _566;
        float _574 = floor(_572);
        float _576 = -_574;
        float _578 = _572 + _576;
        _580 = _578;
        _582 = true;
    }
    else
    {
        float _584 = float(_90);
        float _586 = 1.0 / _584;
        float _588 = _122 * _586;
        _580 = _588;
    }
    _582 = false;
    float _590 = _580;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _594 = _590 + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _600 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _602 = isnan(_590);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _616 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _618 = isnan(_590);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _628;
    bool _632 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _634 = isnan(_590);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = 1.0 / _598;
    float _646 = -_610;
    float _648 = _646 + 1.0;
    bool _650 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _652 = _626 * _648;
    float _654 = -_626;
    float _656 = _654 + 1.0;
    float _658 = 1.0 / _614;
    float _660 = _630 * _644;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _666 = fma(_660, _594, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _668 = -_642;
    float _670 = _668 + 1.0;
    float _672 = _666 * _652;
    float _674 = _664 * _658;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _678 = _590 + _676;
    float _680 = _610 * _670;
    float _682 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[115].x, _672);
    float _684 = _556 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _686 = fma(_674, _678, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _688 = _558 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _690 = _560 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = fma(_686, _680, _682);
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[117].x, _694);
    float _702 = _700 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _692;
    out.m_53.y = _696;
    out.m_53.z = _698;
    out.m_53.w = _702;
    bool _704 = !_650;
    float _722;
    if (!_704)
    {
        float _706 = in.m_51.x;
        float _708 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _710 = _706 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _714 = _712 * _708;
        float _716 = floor(_714);
        float _718 = -_716;
        float _720 = _714 + _718;
        _722 = _720;
        _724 = true;
    }
    else
    {
        float _726 = float(_90);
        float _728 = 1.0 / _726;
        float _730 = _122 * _728;
        _722 = _730;
    }
    _724 = false;
    float _732 = _722;
    float _734 = in.m_51.z;
    float _736 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _738 = log2(_736);
    float _740 = in.m_51.x;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _746 = _744 != 0;
    float _748 = in.m_55.x;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _752 = in.m_55.z;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _756 = in.m_51.y;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _760 = _734 * 2.0;
    float _762 = _740 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _764 = _740 * 2.0;
    float _766 = floor(_760);
    float _768 = -_742;
    float _770 = fma(_762, 2.0, _768);
    float _772 = abs(_748);
    float _774 = abs(_752);
    float _776 = precise::max(_772, _774);
    float _778 = floor(_764);
    float _780 = _740 + _756;
    bool _782 = _776 >= 16.0;
    float _784 = _756 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _786 = _780 + (-1.0);
    float _788 = _756 * 2.0;
    float _790 = fma(_784, -2.0, _750);
    float _792 = _748 * 0.0625;
    float _794 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _796 = _752 * 0.0625;
    bool _798 = _766 > 0.0;
    float _800 = floor(_788);
    bool _802 = _766 >= 0.0;
    bool _804 = isnan(_766);
    bool _806 = _802 || _804;
    bool _808 = isnan(0.0);
    bool _810 = _806 || _808;
    float _812 = _782 ? _796 : _752;
    float _814 = _786;
    float _816 = _796;
    if (_746)
    {
        _814 = _740;
    }
    float _818 = _814;
    float _820 = _782 ? _792 : _748;
    float _822 = _818;
    if (!_746)
    {
        _822 = _734;
    }
    float _824 = _822;
    float _826 = abs(_812);
    bool _828 = _826 != 0.0;
    bool _830 = isnan(_826);
    bool _832 = _828 || _830;
    bool _834 = isnan(0.0);
    bool _836 = _832 || _834;
    if (_746)
    {
        _816 = _756;
    }
    float _838 = _816;
    float _840 = _824 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _842 = _838;
    if (!_746)
    {
        _842 = _740;
    }
    float _844 = _842;
    float _846 = abs(_820);
    bool _848 = _846 == 0.0;
    bool _850 = !_836;
    bool _852 = _848 && _850;
    float _854 = -_754;
    float _856 = fma(_840, 2.0, _854);
    bool _858 = _778 >= 0.0;
    bool _860 = isnan(_778);
    bool _862 = _858 || _860;
    bool _864 = isnan(0.0);
    bool _866 = _862 || _864;
    float _868 = _844 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _870 = _810 ? 0 : 1;
    int _872 = _866 ? 0 : 1;
    float _874 = fma(_868, -2.0, _758);
    float _876 = abs(_820);
    bool _878 = _876 == 0.0;
    bool _880 = _778 > 0.0;
    bool _882 = _800 > 0.0;
    bool _884 = _800 >= 0.0;
    bool _886 = isnan(_800);
    bool _888 = _884 || _886;
    bool _890 = isnan(0.0);
    bool _892 = _888 || _890;
    int _894 = ~_870;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    int _900 = _892 ? 0 : 1;
    bool _902 = _892;
    int _904 = _898;
    int _906 = _878 ? (-1) : 0;
    if (_852)
    {
        bool _908 = as_type<int>(_820) >= 0;
        _902 = _908;
    }
    bool _910 = _902;
    int _912 = ~_872;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    int _918 = 0;
    int _920 = _916;
    if (_852)
    {
        int _922 = _910 ? 0 : 1078530011;
        _918 = _922;
    }
    int _924 = _918;
    int _926 = ~_900;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    int _932 = _930;
    int _934 = _924;
    if (!_798)
    {
        int _936 = ~_870;
        int _938 = _936 + 1;
        _904 = _938;
    }
    int _940 = _904;
    if (!_880)
    {
        int _942 = ~_872;
        int _944 = _942 + 1;
        _920 = _944;
    }
    int _946 = _920;
    if (!_882)
    {
        int _948 = ~_900;
        int _950 = _948 + 1;
        _932 = _950;
    }
    int _952 = _932;
    if (_852)
    {
        int _954 = int(0x80000000) & as_type<int>(_812);
        int _956 = _924 | _954;
        _934 = _956;
    }
    int _958 = _934;
    bool _960 = !_836;
    bool _962 = _960 && _878;
    int _964 = _958;
    float _966 = as_type<float>(_958);
    if (!_962)
    {
        float _968 = abs(_812);
        bool _970 = _968 != as_type<float>(0x7f800000u /* inf */);
        bool _972 = isnan(_968);
        bool _974 = _970 || _972;
        bool _976 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _978 = _974 || _976;
        float _980 = abs(_820);
        bool _982 = _980 == as_type<float>(0x7f800000u /* inf */);
        float _984 = abs(_820);
        bool _986 = _984 == as_type<float>(0x7f800000u /* inf */);
        bool _988 = !_978;
        bool _990 = _986 && _988;
        if (_990)
        {
            bool _992 = as_type<int>(_820) >= 0;
            _906 = _992 ? (-1) : 0;
        }
        int _994 = _906;
        if (_990)
        {
            _964 = 1075235812;
        }
        int _996 = _964;
        int _998 = _996;
        if (_990)
        {
            int _1000 = ~_994;
            int _1002 = (_1000 != 0) ? _996 : 1061752795;
            _998 = _1002;
        }
        int _1004 = _998;
        float _1006 = as_type<float>(_1004);
        if (_990)
        {
            int _1008 = int(0x80000000) & as_type<int>(_812);
            int _1010 = _1004 | _1008;
            _1006 = as_type<float>(_1010);
        }
        float _1012 = _1006;
        bool _1014 = !_978;
        bool _1016 = _1014 && _982;
        _966 = _1012;
        if (!_1016)
        {
            float _1018 = abs(_812);
            float _1020 = abs(_820);
            float _1022 = precise::max(_1018, _1020);
            float _1024 = abs(_812);
            float _1026 = abs(_820);
            float _1028 = _1024 + _1026;
            float _1030 = abs(_812);
            float _1032 = abs(_820);
            float _1034 = precise::min(_1030, _1032);
            float _1036 = 1.0 / _1022;
            float _1038 = abs(_812);
            float _1040 = abs(_820);
            bool _1042 = _1038 > _1040;
            bool _1044 = as_type<int>(_820) >= 0;
            bool _1046 = _1028 > as_type<float>(0x7f800000u /* inf */);
            bool _1048 = isnan(_1028);
            bool _1050 = _1046 || _1048;
            bool _1052 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1054 = _1050 || _1052;
            int _1056 = as_type<int>(_812) & int(0x80000000);
            float _1058 = _1034 * _1036;
            float _1060 = _1058 * _1058;
            float _1062 = _1060 + 11.33538818359375;
            float _1064 = fma(_1060, _1062, 28.84246826171875);
            float _1066 = fma(_1060, _1064, 19.6966705322265625);
            float _1068 = fma(_1060, -0.82336294651031494140625, -5.674867153167724609375);
            float _1070 = fma(_1060, _1068, -6.565555095672607421875);
            float _1072 = 1.0 / _1066;
            float _1074 = _1060 * _1070;
            float _1076 = _1058 * _1074;
            float _1078 = fma(_1076, _1072, _1058);
            float _1080 = _1078;
            _966 = _1028;
            if (_1042)
            {
                float _1082 = -_1078;
                float _1084 = _1082 + 1.57079637050628662109375;
                _1080 = _1084;
            }
            float _1086 = _1080;
            int _1088 = as_type<int>(_1086);
            if (!_1044)
            {
                float _1090 = -_1086;
                float _1092 = _1090 + 3.1415927410125732421875;
                _1088 = as_type<int>(_1092);
            }
            int _1094 = _1088;
            if (!_1054)
            {
                int _1096 = _1056 | _1094;
                _966 = as_type<float>(_1096);
            }
        }
    }
    float _1098 = _966;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1102 = _1100 != 0;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1106 = _1104 != 0;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1110 = _1108 != 0;
    float _1112 = _738 * _122;
    float _1114 = in.m_57.x;
    float _1116 = in.m_57.y;
    float _1118 = in.m_57.z;
    float _1120 = -_122;
    float _1122 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[76].x, _770);
    float _1124 = exp2(_1112);
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1134 = 1.0 + _1132;
    float _1136 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1126);
    float _1138 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1128);
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1142 = 1.0 / _1134;
    float _1144 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1136);
    bool _1146 = !_1102;
    int _1148 = _1146 ? 0 : 1;
    float _1150 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1130);
    bool _1152 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1154 = isnan(1.0);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1160 = _1156 || _1158;
    float _1162 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1140);
    float _1164 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1138);
    float _1166 = -_1124;
    float _1168 = _1166 + 1.0;
    int _1170 = abs(_1148);
    float _1172 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1162);
    bool _1174 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1176 = isnan(0.0);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1182 = _1178 || _1180;
    float _1184 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1150);
    float _1186 = float(_940);
    float _1188 = -_122;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[86].x, _856);
    float _1192 = float(_1170);
    float _1194 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _790);
    float _1196 = _1182 ? _1168 : 0.0;
    float _1198 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _874);
    bool _1200 = !_1106;
    int _1202 = _1200 ? 0 : 1;
    float _1204 = _1192 * _1186;
    float _1206 = _740 + (-0.5);
    if (_1160)
    {
        float _1208 = _1196 * _1142;
        _126 = _1208;
    }
    float _1210 = _126;
    int _1212 = abs(_1202);
    float _1214 = _1204 * (-2.0);
    float _1216 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1218 = float(_946);
    float _1220 = fma(_1214, _1114, _1114);
    bool _1222 = !_1110;
    int _1224 = _1222 ? 0 : 1;
    float _1226 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0500000081956386566162109375, _1098);
    float _1228 = float(_1212);
    float _1230 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0500000081956386566162109375, _1098);
    float _1232 = fma(_794, _1214, _794);
    float _1234 = _1226 * 4.0;
    float _1236 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1220);
    int _1238 = abs(_1224);
    float _1240 = _756 + _734;
    float _1242 = _1228 * _1218;
    float _1244 = _1234 * 0.15915493667125701904296875;
    float _1246 = fma(_1232, _1210, _1236);
    float _1248 = _1230 * 2.0;
    float _1250 = _1240 + (-1.0);
    float _1252 = float(_952);
    float _1254 = _1242 * (-2.0);
    float _1256 = float(_1238);
    float _1258 = _1248 * 0.15915493667125701904296875;
    float _1260 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1262 = fma(_1254, _1116, _1116);
    float _1264 = _1244 * 6.283185482025146484375;
    float _1266 = sin(_1264);
    float _1268 = _1256 * _1252;
    float _1270 = _756 + (-0.5);
    float _1272 = _740 + _734;
    float _1274 = fma(_1260, _1254, _1260);
    float _1276 = _1246 * 0.15915493667125701904296875;
    float _1278 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1262);
    float _1280 = _1258 * 6.283185482025146484375;
    float _1282 = sin(_1280);
    float _1284 = _1272 + (-1.0);
    float _1286 = fma(_1274, _1210, _1278);
    float _1288 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1290 = _1286 * 0.15915493667125701904296875;
    float _1292 = in.m_55.y;
    float _1294 = _1268 * (-2.0);
    float _1296 = _1276 * 6.283185482025146484375;
    float _1298 = sin(_1296);
    bool _1300 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1302 = isnan(0.5);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1308 = _1304 || _1306;
    float _1310 = fma(_1294, _1118, _1118);
    float _1312 = _734 + (-0.5);
    float _1314 = fma(_1288, _1294, _1288);
    float _1316 = fma(_1266, 0.5, 0.5);
    float _1318 = fma(_1282, 0.5, 0.5);
    float _1320 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1310);
    float _1322 = _1276 * 6.283185482025146484375;
    float _1324 = cos(_1322);
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _748);
    float _1328 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _752);
    float _1330 = precise::max(_1316, _1318);
    float _1332 = fma(_1314, _1210, _1320);
    float _1334 = _1326 * _1216;
    float _1336 = _1332 * 0.15915493667125701904296875;
    float _1338 = _1330 * _1330;
    float _1340 = _1290 * 6.283185482025146484375;
    float _1342 = sin(_1340);
    float _1344 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1346 = _1338 * _1338;
    float _1348 = _1328 * _1344;
    float _1350 = _1346 * _1292;
    float _1352 = _1290 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1350);
    float _1360 = _1358 * _1356;
    float _1362 = _1336 * 6.283185482025146484375;
    float _1364 = cos(_1362);
    float _1366 = _1298 * _1342;
    float _1368 = _1336 * 6.283185482025146484375;
    float _1370 = sin(_1368);
    float _1372 = _1324 * _1354;
    float _1374 = _1298 * _1354;
    float _1376 = _1364 * _1360;
    float _1378 = _1298 * _1376;
    float _1380 = fma(_1370, _1372, _1366);
    float _1382 = fma(_1370, _1366, _1372);
    float _1384 = _1324 * _1342;
    float _1386 = _1324 * _1376;
    float _1388 = _1342 * _1364;
    float _1390 = _1354 * _1364;
    float _1392 = -_1384;
    float _1394 = fma(_1370, _1374, _1392);
    float _1396 = -_1360;
    float _1398 = _1370 * _1396;
    float _1400 = -_1374;
    float _1402 = fma(_1370, _1384, _1400);
    float _1404 = fma(_1380, _1334, _1386);
    float _1406 = fma(_1394, _1334, _1378);
    float _1408 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1410 = fma(_1390, _1334, _1398);
    float _1412 = fma(_1402, _1348, _1404);
    float _1414 = fma(_1382, _1348, _1406);
    float _1416 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1408);
    float _1418 = fma(_1388, _1348, _1410);
    float _1420 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1422 = _1412 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1424 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1416);
    float _1426 = _1412 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1428 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1420);
    float _1430 = fma(_1418, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1426);
    float _1436 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1428);
    float _1438 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1430);
    float _1440 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1442 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1434);
    float _1444 = _1436 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1446 = _1432 + _1438;
    float _1448 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1440);
    float _1450 = _1444 + _1442;
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1454 = _1446 + _1452;
    float _1456 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1448);
    float _1458 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1460 = _1450 + _1458;
    float _1462 = _1454 * _1454;
    float _1464 = _1456 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1466 = fma(_1460, _1460, _1462);
    float _1468 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1470 = _1464 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1472 = sqrt(_1466);
    float _1474 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1468);
    float _1476 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1470);
    float _1478 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1474);
    float _1480 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1476);
    float _1482 = _1478 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1484 = _1412 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1486 = _1480 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1488 = 1.0 / _1482;
    float _1490 = fma(_1418, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1484);
    float _1492 = _1486 + _1482;
    bool _1494 = _1472 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1496 = fma(_1414, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1490);
    float _1498 = _1464 + _1496;
    float _1500 = _1496;
    float _1502 = _1484;
    float _1504 = _1492;
    float _1506 = _1482;
    float _1508 = _1444;
    float _1510 = _1412;
    if (_1308)
    {
        _1500 = 1.0;
    }
    float _1512 = _1500;
    float _1514 = _1492 * _1488;
    float _1516 = _1514 * 0.5;
    float _1518 = _1512;
    if (!_1494)
    {
        _1502 = _1450;
    }
    float _1520 = _1502;
    float _1522 = _1520;
    if (!_1494)
    {
        _1504 = _1446;
    }
    float _1524 = _1504;
    float _1526 = _1524;
    if (!_1494)
    {
        _1506 = _1498;
    }
    float _1528 = _1506;
    bool _1530 = !_1494;
    float _1532 = _1528;
    if (!_1530)
    {
        float _1534 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1536 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1538 = _1472 + _1536;
        float _1540 = rsqrt(_1466);
        float _1542 = _1538 * _1534;
        float _1544 = _1498 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1546 = _1542 * 0.15915493667125701904296875;
        float _1548 = _1546 * 6.283185482025146484375;
        float _1550 = sin(_1548);
        float _1552 = _1546 * 6.283185482025146484375;
        float _1554 = cos(_1552);
        float _1556 = fma(_1550, _1544, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1558 = _1540 * _1556;
        float _1560 = _1554 + (-1.0);
        float _1562 = fma(_1460, _1558, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1564 = fma(_1454, _1558, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1566 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1568 = fma(_1498, _1554, _1566);
        _1532 = _1568;
        _1522 = _1562;
        _1526 = _1564;
    }
    float _1570 = _1532;
    float _1572 = _1522;
    float _1574 = _1526;
    if (!_1308)
    {
        float _1576 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1578 = _1576 * 0.15915493667125701904296875;
        float _1580 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1582 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1584 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1582);
        float _1586 = _1578 * 6.283185482025146484375;
        float _1588 = cos(_1586);
        float _1590 = _1580 * 0.15915493667125701904296875;
        float _1592 = _1578 * 6.283185482025146484375;
        float _1594 = sin(_1592);
        float _1596 = 1.0 / _1588;
        float _1598 = _1590 * 6.283185482025146484375;
        float _1600 = cos(_1598);
        float _1602 = _1594 * _1596;
        float _1604 = _1590 * 6.283185482025146484375;
        float _1606 = sin(_1604);
        float _1608 = _1600 * _1602;
        float _1610 = 1.0 / _1584;
        float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1614 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1612;
        float _1616 = 1.0 / _1608;
        float _1618 = 1.0 / _1614;
        float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1622 = _1610 * _1620;
        float _1624 = _1606 * _1616;
        float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1628 = fma(_1624, _1622, _1626);
        float _1630 = _1628 * _1618;
        float _1632 = precise::clamp(_1630, 0.0, 1.0);
        float _1634 = -_1632;
        float _1636 = _1634 + 1.0;
        _1508 = _1618;
        _1510 = _1610;
        _1518 = _1636;
    }
    float _1638 = _1508;
    float _1640 = _1510;
    float _1642 = _1518;
    float _1644 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1646 = _1570 + _1644;
    float _1648 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1650 = _1572 + _1648;
    float _1652 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1654 = _1574 + _1652;
    float _1656 = _1646 * _1646;
    float _1658 = fma(_1650, _1650, _1656);
    float _1660 = fma(_1654, _1654, _1658);
    float _1662 = rsqrt(_1660);
    float _1664 = sqrt(_1660);
    float _1666 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1668 = _1650 * _1666;
    float _1670 = _1654 * _1666;
    float _1672 = _1668 * _1668;
    float _1674 = _1670 * _1670;
    float _1676 = _1672 + _1674;
    float _1678 = sqrt(_1676);
    bool _1680 = _1678 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1684 = _1678 + _1682;
    float _1686 = _1662;
    float _1688 = _1684;
    float _1690 = _1638;
    float _1692 = _1646;
    float _1694 = _1666;
    if (_1680)
    {
        float _1696 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1686 = _1696;
    }
    float _1698 = _1686;
    float _1700 = _1698;
    if (_1680)
    {
        float _1702 = _1684 * _1698;
        _1688 = _1702;
    }
    float _1704 = _1688;
    if (_1680)
    {
        float _1706 = rsqrt(_1676);
        _1700 = _1706;
    }
    float _1708 = _1700;
    float _1710 = _1708;
    if (_1680)
    {
        float _1712 = _1704 * 0.15915493667125701904296875;
        _1690 = _1712;
    }
    float _1714 = _1690;
    float _1716 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1718 = _1654;
    float _1720 = _1714;
    if (_1680)
    {
        float _1722 = _1714 * 6.283185482025146484375;
        float _1724 = sin(_1722);
        _1718 = _1724;
    }
    float _1726 = _1718;
    float _1728 = precise::max(0.0, _1716);
    float _1730 = _1640;
    float _1732 = _1728;
    if (_1680)
    {
        float _1734 = _1714 * 6.283185482025146484375;
        float _1736 = cos(_1734);
        _1730 = _1736;
    }
    float _1738 = _1730;
    float _1740 = -_1666;
    float _1742 = -_1728;
    float _1744 = fma(_1646, _1740, _1742);
    if (_1680)
    {
        float _1746 = _1744 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1692 = _1746;
    }
    float _1748 = _1692;
    float _1750 = _1726;
    float _1752 = _1748;
    if (_1680)
    {
        float _1754 = fma(_1726, _1748, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1750 = _1754;
    }
    float _1756 = _1750;
    float _1758 = _1756;
    if (!_1680)
    {
        _1752 = _1672;
    }
    float _1760 = _1752;
    float _1762 = _1760;
    if (_1680)
    {
        float _1764 = _1708 * _1756;
        _1694 = _1764;
    }
    float _1766 = _1694;
    if (!_1680)
    {
        _1710 = _1668;
    }
    float _1768 = _1710;
    float _1770 = _1768;
    float _1772 = _1738;
    if (_1680)
    {
        float _1774 = _1738 + (-1.0);
        _1732 = _1774;
    }
    float _1776 = _1732;
    float _1778 = _1776;
    if (_1680)
    {
        float _1780 = _1668 * _1766;
        _1770 = _1780;
    }
    float _1782 = _1770;
    if (!_1680)
    {
        _1758 = _1744;
    }
    float _1784 = _1758;
    float _1786 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1788 = _1784;
    if (_1680)
    {
        float _1790 = _1776 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1720 = _1790;
    }
    float _1792 = _1720;
    if (!_1680)
    {
        _1778 = _1670;
    }
    float _1794 = _1778;
    float _1796 = _1794;
    if (_1680)
    {
        float _1798 = _1670 * _1766;
        _1796 = _1798;
    }
    float _1800 = _1796;
    if (_1680)
    {
        float _1802 = _1782 * _1782;
        _1762 = _1802;
    }
    float _1804 = _1762;
    if (_1680)
    {
        float _1806 = fma(_1744, _1738, _1792);
        _1788 = _1806;
    }
    float _1808 = _1788;
    if (!_1680)
    {
        _1772 = _1674;
    }
    float _1810 = _1772;
    float _1812 = _1810;
    if (_1680)
    {
        float _1814 = _1800 * _1800;
        _1812 = _1814;
    }
    float _1816 = _1812;
    float _1818 = fma(_1808, _1808, _1804);
    float _1820 = _1818 + _1816;
    float _1822 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1824 = fma(_1664, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1822);
    float _1826 = precise::clamp(_1824, 0.0, 1.0);
    float _1828 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1786);
    float _1830 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1832 = rsqrt(_1820);
    float _1834 = -_1826;
    float _1836 = _1834 + 1.0;
    float _1838 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1840 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1830);
    float _1842 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1844 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1828);
    float _1846 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1838);
    float _1848 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1840);
    float _1850 = abs(_1836);
    float _1852 = log2(_1850);
    float _1854 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1842);
    float _1856 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1846);
    float _1858 = _1848 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1860 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1862 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1854);
    float _1864 = _1856 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1866 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1868 = _1832 * _1782;
    float _1870 = _1832 * _1808;
    float _1872 = _1832 * _1800;
    float _1874 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1866);
    float _1876 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1878 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1880 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1882 = _1862 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1884 = -_1876;
    float _1886 = fma(_1870, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1884);
    float _1888 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1874);
    float _1890 = -_1880;
    float _1892 = fma(_1890, _1878, 1.0);
    float _1894 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1896 = -_1872;
    float _1898 = fma(_1896, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1886);
    float _1900 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1888);
    float _1902 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1904 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1906 = fma(_1898, -0.5, 0.5);
    float _1908 = log2(_1892);
    float _1910 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1902);
    float _1912 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1904);
    float _1914 = fma(_1898, 0.5, 0.5);
    float _1916 = _1870 + 1.0;
    float _1918 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1910);
    float _1920 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1912);
    float _1922 = fma(_1914, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1924 = 1.0 / _1900;
    float _1926 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1918);
    float _1928 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1920);
    float _1930 = fma(_1914, _1922, -0.212114393711090087890625);
    float _1932 = fma(_1914, _1930, 1.570728778839111328125);
    float _1934 = exp2(_1894);
    float _1936 = _1908 * 0.693147182464599609375;
    float _1938 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1940 = sqrt(_1906);
    float _1942 = _1926 * _1924;
    float _1944 = _1928 * _1924;
    float _1946 = fma(_1942, 0.5, 0.5);
    float _1948 = fma(_1944, -0.5, 0.5);
    float _1950 = -_1870;
    float _1952 = fma(_1934, _1916, _1950);
    float3 _5330 = float3(_1946, _1948, _1938);
    float _1954 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5330, float3(0.0), isnan(_5330)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5330, float3(0.0), isnan(_5330)), level(0.0)).x;
    float _1956 = fma(_1952, 0.5, 0.5);
    float _1958 = _1940 * 0.636619746685028076171875;
    float _1960 = -_1932;
    float _1962 = fma(_1958, _1960, 1.0);
    float3 _5351 = float3(_1946, _1948, _1938);
    float4 _1965 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5351, float3(0.0), isnan(_5351)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5351, float3(0.0), isnan(_5351)), level(0.0)).xyzw;
    float _1967 = _1965.x;
    float _1969 = _1965.y;
    float _1971 = _1965.z;
    float _1973 = _1965.w;
    float2 _5368 = float2(_1962, _1956);
    float3 _1977 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5368, float2(0.0), isnan(_5368)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5368, float2(0.0), isnan(_5368)), level(0.0)).xyz;
    float _1979 = _1977.x;
    float _1981 = _1977.y;
    float _1983 = _1977.z;
    float _1985 = in.m_51.w;
    float _1987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1989 = _734 > 0.5;
    float _1991 = in.m_59.y;
    float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1993;
    float _1997 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1999 = _1997 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2001 = in.m_59.x;
    int _2003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2005 = _2003 != 0;
    float _2007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2009 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2011 = _756 > 0.5;
    float _2013 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2015 = _732 + _2013;
    int _2017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2019 = _2017 != 0;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    int _2021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2023 = _2021 != 0;
    float _2025 = 1.0 / _1995;
    int _2027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2029 = _2027 != 0;
    float _2031 = _1987 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2033 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2035 = _1985 > 0.5;
    float _2037 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2033);
    float _2039 = 1.0 / _1999;
    float _2041 = -_1991;
    float _2043 = _2041 + 1.0;
    float _2045 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2037);
    int _2047 = _2035 ? as_type<int>(_2043) : as_type<int>(_1991);
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2049;
    int _2053 = _2011 ? as_type<int>(_2043) : as_type<int>(_1991);
    float _2055 = _2015 * _2025;
    float _2057 = _2019 ? as_type<float>(_2047) : _1991;
    float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2061 = _732 + _2059;
    bool _2063 = _2019;
    float _2065 = _1991;
    if (_2005)
    {
        bool _2067 = _740 > 0.5;
        _2063 = _2067;
    }
    bool _2069 = _2063;
    float _2071 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2073 = _2071 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2075 = fma(_2051, _2055, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2077 = _2061 * _2039;
    float _2079 = _2023 ? as_type<float>(_2053) : _1991;
    float _2081 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2085 = _2083 != 0;
    float _2087 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2089 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2087;
    int _2091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2093 = _2091 != 0;
    float _2095 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2097 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2095;
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2101 = _2099 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2103 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2105 = _2103 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _2107 = _732 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2109 = isnan(_732);
    bool _2111 = _2107 || _2109;
    bool _2113 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2115 = _2111 || _2113;
    float _2117 = float(_2115);
    float _2119 = fma(_2073, _2077, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2121 = fma(_2101, _2077, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2123 = fma(_2105, _2077, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _2125 = _732 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2127 = isnan(_732);
    bool _2129 = _2125 || _2127;
    bool _2131 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2133 = _2129 || _2131;
    float _2135 = float(_2133);
    float _2137 = fma(_2031, _2079, -0.5);
    float _2139 = fma(_2097, _2055, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2143 = fma(_2089, _2055, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _2145 = _732 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2147 = isnan(_732);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2153 = _2149 || _2151;
    float _2155 = float(_2153);
    float _2157 = -_2117;
    float _2159 = _2157 + 1.0;
    float _2161 = -_2135;
    float _2163 = _2161 + 1.0;
    int _2165 = as_type<int>(_2143);
    float _2167 = _2135;
    int _2169 = as_type<int>(_2137);
    if (_2093)
    {
        float _2171 = _1989 ? _2043 : _1991;
        _2065 = _2171;
    }
    float _2173 = _2065;
    float _2175 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2177 = _2135 * _2159;
    float _2179 = _2155 * _2163;
    int _2181 = 0;
    float _2183 = _2173;
    float _2185 = _2175;
    if (_2085)
    {
        float _2187 = -_2001;
        float _2189 = _2187 + 1.0;
        _2181 = as_type<int>(_2189);
    }
    int _2191 = _2181;
    float _2193 = -_2155;
    float _2195 = _2193 + 1.0;
    float _2197 = exp2(_2009);
    float _2199 = _2139 * _2179;
    float _2201 = _2143 * _2179;
    float _2203 = _2075 * _2179;
    float _2205 = fma(_2175, _2173, -0.5);
    if (_2005)
    {
        float _2207 = -_2001;
        float _2209 = _2207 + 1.0;
        _2165 = as_type<int>(_2209);
    }
    int _2211 = _2165;
    if (!_2085)
    {
        _2183 = _2001;
    }
    float _2213 = _2183;
    float _2215 = -_1194;
    float _2217 = fma(_1164, _2137, _2215);
    float _2219 = _2213;
    if (_2085)
    {
        float _2221 = _2011 ? as_type<float>(_2191) : _2001;
        _2219 = _2221;
    }
    float _2223 = _2219;
    float _2225 = _2141 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_2005)
    {
        _2167 = _2001;
    }
    float _2227 = _2167;
    float _2229 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2231 = fma(_2195, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2199);
    float _2233 = fma(_2195, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2201);
    float _2235 = fma(_2195, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2203);
    float _2237 = _2227;
    if (_2005)
    {
        float _2239 = _2069 ? as_type<float>(_2211) : _2001;
        _2237 = _2239;
    }
    float _2241 = _2237;
    float _2243 = _2081 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2029)
    {
        float _2245 = -_2001;
        float _2247 = _2245 + 1.0;
        _2169 = as_type<int>(_2247);
    }
    int _2249 = _2169;
    float _2251 = fma(_2225, _2223, -0.5);
    float _2253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2255 = fma(_2243, _2241, -0.5);
    if (!_2029)
    {
        _2185 = _2001;
    }
    float _2257 = _2185;
    float _2259 = -_1198;
    float _2261 = fma(_1172, _2205, _2259);
    float _2263 = fma(_1184, _2251, _1190);
    float _2265 = _2257;
    if (_2029)
    {
        float _2267 = _1989 ? as_type<float>(_2249) : _2001;
        _2265 = _2267;
    }
    float _2269 = _2265;
    float _2271 = fma(_1144, _2255, _1122);
    float _2273 = _2217 + 0.5;
    float _2275 = fma(_2121, _2177, _2231);
    float _2277 = fma(_2123, _2177, _2233);
    float _2279 = fma(_2119, _2177, _2235);
    float _2281 = _2261 + 0.5;
    float _2283 = _2263 + 0.5;
    float _2285 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2287 = _2269 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2289 = -_2197;
    float _2291 = _2289 + 1.0;
    float _2293 = fma(_2117, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2275);
    float _2295 = fma(_2117, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2277);
    float _2297 = fma(_2117, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2279);
    float _2299 = _2285 * _2229;
    out.m_63.x = _2283;
    out.m_63.y = _2281;
    float _2301 = _2287 * _2253;
    float _2303 = _2271 + 0.5;
    float _2305 = _2293 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2307 = _2295 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2309 = _2297 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2311 = fma(_1882, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2045);
    out.m_65.x = _2303;
    out.m_65.y = _2273;
    out.m_65.z = _2301;
    out.m_65.w = _2299;
    bool _2313 = _1642 > 0.0;
    bool _2315 = isnan(_1642);
    bool _2317 = _2313 || _2315;
    bool _2319 = isnan(0.0);
    bool _2321 = _2317 || _2319;
    float _2323 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2325 = _1900 * 0.5;
    float _2327 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2329 = _2305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2331 = _2307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2333 = _2309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2335 = _1642 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1926;
    out.gl_Position.y = _1928;
    out.gl_Position.z = _2311;
    out.gl_Position.w = _1900;
    float _2337 = _2335 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _2329;
    out.m_67.y = _2331;
    out.m_67.z = _2333;
    out.m_67.w = _2327;
    float _2339 = fma(_1928, -0.5, _2325);
    float _2341 = -_2323;
    float _2343 = _2341 + 1.0;
    float _2345 = _2311 + _1900;
    float _2347 = _1926 + _1900;
    out.m_45.x = _2337;
    float _2349 = _2345 * 0.5;
    float _2351 = _2347 * 0.5;
    out.m_69.x = _2351;
    out.m_69.y = _2339;
    out.m_69.z = _2349;
    out.m_69.w = _1900;
    float _2353 = _2323 * _1954;
    float _2355 = _1973 * _2353;
    float _2357 = _1973 * _2343;
    float _2359 = _1983 * _2353;
    float _2361 = fma(_1979, _2355, _1967);
    float _2363 = fma(_1981, _2355, _1969);
    float _2365 = fma(_1973, _2359, _1971);
    out.m_71.x = _2361;
    out.m_71.y = _2363;
    out.m_71.z = _2365;
    out.m_71.w = _2357;
    if (_2321)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2367 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2367;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

