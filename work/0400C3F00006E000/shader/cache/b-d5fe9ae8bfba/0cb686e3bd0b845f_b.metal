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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1458 = false;
    bool _670 = false;
    bool _528 = false;
    bool _402 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _1942 = as_type<float>(_106);
        out.gl_Position.z = _1942;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _2012 = as_type<float>(_144);
        out.gl_Position.z = _2012;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
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
        float _270 = in.m_53.x;
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
    float _362 = fma(_358, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _364 = _354 * _342;
    float _366 = _360 * _342;
    float _368 = _362 * _342;
    float _370 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _364);
    float _372 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _366);
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _368);
    float _376 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _370);
    float _378 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _372);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _374);
    bool _382 = !_340;
    float _400;
    if (!_382)
    {
        float _384 = in.m_53.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
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
        float _408 = _124 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = in.m_51.x;
    float _414 = in.m_51.y;
    float _416 = in.m_51.z;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _420 = _410 + _418;
    bool _422 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _424;
    float _428 = 1.0 / _426;
    float _430 = _378 * _416;
    float _432 = _380 * _414;
    bool _434 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _436 = isnan(_410);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = _420 * _428;
    bool _448 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _450 = isnan(_410);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _460;
    float _464 = -_444;
    float _466 = _464 + 1.0;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _472;
    float _476 = fma(_462, _446, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _478 = _458 * _466;
    float _480 = fma(_470, _446, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _482 = fma(_474, _446, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _484 = -_458;
    float _486 = _484 + 1.0;
    float _488 = _476 * _478;
    float _490 = _480 * _478;
    float _492 = _482 * _478;
    float _494 = _376 * _412;
    float _496 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[107].x, _488);
    float _498 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[107].y, _490);
    float _500 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[107].z, _492);
    float _502 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[108].x, _496);
    float _504 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[108].y, _498);
    float _506 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[108].z, _500);
    bool _508 = !_422;
    float _526;
    if (!_508)
    {
        float _510 = in.m_53.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_90);
        float _532 = 1.0 / _530;
        float _534 = _124 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _540 = _536 + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _546 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _548 = isnan(_536);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _562 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _564 = isnan(_536);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _574;
    bool _578 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _580 = isnan(_536);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = 1.0 / _544;
    float _592 = -_556;
    float _594 = _592 + 1.0;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _598 = _536 + _596;
    bool _600 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _602 = _572 * _594;
    float _604 = -_572;
    float _606 = _604 + 1.0;
    float _608 = 1.0 / _560;
    float _610 = _576 * _590;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _616 = fma(_610, _540, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _618 = -_588;
    float _620 = _618 + 1.0;
    float _622 = _614 * _608;
    float _624 = _616 * _602;
    float _626 = _556 * _620;
    float _628 = _502 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _630 = fma(_622, _598, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _632 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[115].x, _624);
    float _634 = _504 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _636 = _506 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _638 = _628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _640 = fma(_630, _626, _632);
    float _642 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _644 = _636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _646 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[117].x, _640);
    float _648 = _646 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _638;
    out.m_55.y = _642;
    out.m_55.z = _644;
    out.m_55.w = _648;
    bool _650 = !_600;
    float _668;
    if (!_650)
    {
        float _652 = in.m_53.x;
        float _654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _656 = _652 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _660 = _658 * _654;
        float _662 = floor(_660);
        float _664 = -_662;
        float _666 = _660 + _664;
        _668 = _666;
        _670 = true;
    }
    else
    {
        float _672 = float(_90);
        float _674 = 1.0 / _672;
        float _676 = _124 * _674;
        _668 = _676;
    }
    _670 = false;
    float _678 = _668;
    float _680 = in.m_53.z;
    float _682 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _684 = log2(_682);
    float _686 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _688 = in.m_53.x;
    float _690 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _694 = 1.0 + _692;
    float _696 = in.m_53.y;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _700 = _698 != 0;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _704 = _702 != 0;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _708 = _706 != 0;
    float _710 = _430 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _712 = 1.0 / _694;
    bool _714 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _716 = isnan(1.0);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _722 = _718 || _720;
    bool _724 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _726 = isnan(0.0);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _732 = _728 || _730;
    float _734 = _684 * _124;
    float _736 = exp2(_734);
    float _738 = _680 * 2.0;
    float _740 = _688 * 2.0;
    float _742 = floor(_738);
    float _744 = _696 * 2.0;
    float _746 = _696 + _680;
    float _748 = _688 + _696;
    float _750 = floor(_740);
    float _752 = -_736;
    float _754 = _752 + 1.0;
    float _756 = _746 + (-1.0);
    float _758 = _748 + (-1.0);
    float _760 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _762 = floor(_744);
    float _764 = _732 ? _754 : 0.0;
    float _766 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _768 = _742 > 0.0;
    bool _770 = _742 >= 0.0;
    bool _772 = isnan(_742);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.0);
    bool _778 = _774 || _776;
    if (_722)
    {
        float _780 = _764 * _712;
        _126 = _780;
    }
    float _782 = _126;
    bool _784 = !_700;
    int _786 = _784 ? 0 : 1;
    bool _788 = _750 > 0.0;
    bool _790 = _750 >= 0.0;
    bool _792 = isnan(_750);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    float _800 = in.m_57.x;
    float _802 = in.m_57.y;
    float _804 = in.m_57.z;
    int _806 = _778 ? 0 : 1;
    int _808 = abs(_786);
    int _810 = ~_806;
    int _812 = _810 + 1;
    int _814 = _812 + 1;
    int _816 = _814;
    if (!_768)
    {
        int _818 = ~_806;
        int _820 = _818 + 1;
        _816 = _820;
    }
    int _822 = _816;
    bool _824 = _762 > 0.0;
    bool _826 = _762 >= 0.0;
    bool _828 = isnan(_762);
    bool _830 = _826 || _828;
    bool _832 = isnan(0.0);
    bool _834 = _830 || _832;
    float _836 = float(_808);
    float _838 = float(_822);
    bool _840 = !_704;
    int _842 = _840 ? 0 : 1;
    int _844 = _798 ? 0 : 1;
    float _846 = _836 * _838;
    int _848 = abs(_842);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _850;
    int _854 = _834 ? 0 : 1;
    float _856 = _846 * (-2.0);
    int _858 = ~_844;
    int _860 = _858 + 1;
    int _862 = _860 + 1;
    int _864 = _862;
    if (!_788)
    {
        int _866 = ~_844;
        int _868 = _866 + 1;
        _864 = _868;
    }
    int _870 = _864;
    float _872 = fma(_856, _800, _800);
    float _874 = _688 + (-0.5);
    int _876 = ~_854;
    int _878 = _876 + 1;
    int _880 = _878 + 1;
    float _882 = fma(_766, _856, _766);
    int _884 = _880;
    if (!_824)
    {
        int _886 = ~_854;
        int _888 = _886 + 1;
        _884 = _888;
    }
    int _890 = _884;
    float _892 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[196].x, _872);
    bool _894 = !_708;
    int _896 = _894 ? 0 : 1;
    float _898 = 1.0 / _852;
    float _900 = float(_848);
    float _902 = float(_870);
    int _904 = abs(_896);
    float _906 = fma(_882, _782, _892);
    float _908 = float(_890);
    float _910 = _900 * _902;
    float _912 = _696 + (-0.5);
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _918 = _910 * (-2.0);
    float _920 = float(_904);
    float _922 = _906 * 0.15915493667125701904296875;
    bool _924 = _696 > 0.5;
    float _926 = fma(_918, _802, _802);
    float _928 = fma(_760, _918, _760);
    float _930 = _920 * _908;
    float _932 = _688 + _680;
    float _934 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[196].y, _926);
    float _936 = _680 + (-0.5);
    float _938 = _930 * (-2.0);
    float _940 = _932 + (-1.0);
    float _942 = fma(_928, _782, _934);
    float _944 = in.m_59.y;
    float _946 = fma(_938, _804, _804);
    float _948 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _950 = _922 * 6.283185482025146484375;
    float _952 = sin(_950);
    float _954 = in.m_61.x;
    float _956 = in.m_61.y;
    float _958 = in.m_61.z;
    float _960 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[196].z, _946);
    float _962 = fma(_948, _938, _948);
    float _964 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _966 = _942 * 0.15915493667125701904296875;
    float _968 = fma(_962, _782, _960);
    float _970 = _922 * 6.283185482025146484375;
    float _972 = cos(_970);
    float _974 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _976 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _964);
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _984 = _982 != 0;
    float _986 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _988 = _966 * 6.283185482025146484375;
    float _990 = sin(_988);
    float _992 = _968 * 0.15915493667125701904296875;
    float _994 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _974);
    float _996 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _986);
    bool _998 = _688 > 0.5;
    bool _1000 = _998 && _984;
    float _1002 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _996);
    float _1004 = _966 * 6.283185482025146484375;
    float _1006 = cos(_1004);
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _954);
    float _1010 = -_944;
    float _1012 = _1010 + 1.0;
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _956);
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1018 = _678 + _1016;
    float _1020 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _958);
    float _1022 = _690 * _1008;
    float _1024 = _686 * _1014;
    float _1026 = _992 * 6.283185482025146484375;
    float _1028 = cos(_1026);
    float _1030 = _944;
    if (_980)
    {
        float _1032 = _924 ? _1012 : _944;
        _1030 = _1032;
    }
    float _1034 = _1030;
    float _1036 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _994);
    float _1038 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _976);
    float _1040 = _1018 * _898;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1044 = _678 + _1042;
    float _1046 = _952 * _990;
    float _1048 = _710 * _1020;
    float _1050 = 1.0 / _916;
    float _1052 = _972 * _1006;
    float _1054 = _972 * _990;
    float _1056 = _1036 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1058 = _1002 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1060 = in.m_59.x;
    float _1062 = _1038 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1064 = _992 * 6.283185482025146484375;
    float _1066 = sin(_1064);
    float _1068 = _1028 * _1024;
    float _1070 = _990 * _1028;
    float _1072 = _1006 * _1028;
    float _1074 = _972 * _1068;
    float _1076 = _1044 * _1050;
    float _1078 = _952 * _1006;
    float _1080 = _952 * _1068;
    float _1082 = fma(_1066, _1052, _1046);
    float _1084 = -_1024;
    float _1086 = _1066 * _1084;
    float _1088 = fma(_1066, _1046, _1052);
    float _1090 = fma(_1082, _1022, _1074);
    float _1092 = -_1078;
    float _1094 = fma(_1066, _1054, _1092);
    float _1096 = -_1054;
    float _1098 = fma(_1066, _1078, _1096);
    float _1100 = fma(_1072, _1022, _1086);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1102;
    float _1106 = fma(_1094, _1048, _1090);
    float _1108 = fma(_1098, _1022, _1080);
    float _1110 = fma(_1070, _1048, _1100);
    float _1112 = fma(_1104, _1040, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1114 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1116 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1118 = fma(_1088, _1048, _1108);
    float _1120 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1114);
    float _1122 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1116);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1120);
    float _1130 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1122);
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1140 = _1056 + _1128;
    float _1142 = _1058 + _1130;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1144;
    bool _1148 = _678 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1150 = isnan(_678);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1156 = _1152 || _1154;
    float _1158 = float(_1156);
    float _1160 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1162 = _1140 + _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1166 = _1142 + _1164;
    float _1168 = fma(_1134, _1040, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1170 = fma(_1146, _1040, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1172 = _1162 * _1162;
    float _1174 = _1166 * _1166;
    bool _1176 = _678 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1178 = isnan(_678);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = -_1158;
    float _1190 = _1188 + 1.0;
    bool _1192 = _678 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1194 = isnan(_678);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = _1172 + _1174;
    float _1206 = _1134;
    float _1208 = _1190;
    float _1210 = _1062;
    if (_984)
    {
        _1206 = _1060;
    }
    float _1212 = _1206;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1216 = _1214 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1218 = fma(_1138, _1076, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1220 = sqrt(_1204);
    float _1222 = _1202 * _1190;
    float _1224 = -_1202;
    float _1226 = _1224 + 1.0;
    float _1228 = _1212;
    if (!_984)
    {
        _1208 = _1060;
    }
    float _1230 = _1208;
    float _1232 = _1230;
    if (_1000)
    {
        float _1234 = -_1212;
        float _1236 = _1234 + 1.0;
        _1228 = _1236;
    }
    float _1238 = _1228;
    float _1240 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1242 = _1186 * _1226;
    float _1244 = -_1186;
    float _1246 = _1244 + 1.0;
    float _1248 = fma(_1216, _1076, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1250 = _1246;
    float _1252 = _1242;
    if (_984)
    {
        _1232 = _1238;
    }
    float _1254 = _1232;
    float _1256 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1240);
    float _1258 = _1170 * _1242;
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1262 = _1168 * _1242;
    float _1264 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1256);
    float _1266 = _1112 * _1242;
    bool _1268 = _1220 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1270 = fma(_1126, _1076, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1272 = _1062 + _1264;
    float _1274 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1262);
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1278 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1258);
    float _1280 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1266);
    float _1282 = _1258;
    float _1284 = _1266;
    if (!_1268)
    {
        _1282 = _1174;
    }
    float _1286 = _1282;
    float _1288 = _1286;
    if (!_1268)
    {
        _1210 = _1172;
    }
    float _1290 = _1210;
    float _1292 = _1290;
    if (!_1268)
    {
        _1250 = _1140;
    }
    float _1294 = _1250;
    float _1296 = _1294;
    if (!_1268)
    {
        _1252 = _1142;
    }
    float _1298 = _1252;
    float _1300 = _1298;
    if (!_1268)
    {
        _1284 = _1272;
    }
    float _1302 = _1284;
    bool _1304 = !_1268;
    float _1306 = _1302;
    float _1308 = _1260;
    if (!_1304)
    {
        float _1310 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1314 = _1220 + _1312;
        float _1316 = rsqrt(_1204);
        float _1318 = _1314 * _1310;
        float _1320 = _1272 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1322 = _1318 * 0.15915493667125701904296875;
        float _1324 = _1322 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        float _1328 = _1322 * 6.283185482025146484375;
        float _1330 = cos(_1328);
        float _1332 = fma(_1326, _1320, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1334 = _1316 * _1332;
        float _1336 = _1330 + (-1.0);
        float _1338 = fma(_1162, _1334, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1340 = fma(_1166, _1334, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1342 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1346 = _1338 + _1344;
        float _1348 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1350 = _1340 + _1348;
        float _1352 = fma(_1272, _1330, _1342);
        float _1354 = _1346 * _1346;
        float _1356 = _1350 * _1350;
        _1306 = _1352;
        _1292 = _1354;
        _1288 = _1356;
        _1296 = _1338;
        _1300 = _1340;
    }
    float _1358 = _1306;
    float _1360 = _1292;
    float _1362 = _1288;
    float _1364 = _1296;
    float _1366 = _1300;
    float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1370 = _1358 + _1368;
    float _1372 = fma(_1218, _1222, _1274);
    float _1374 = fma(_1248, _1222, _1278);
    float _1376 = fma(_1270, _1222, _1280);
    float _1378 = fma(_1370, _1370, _1360);
    float _1380 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1382 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1372);
    float _1384 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1374);
    float _1386 = _1378 + _1362;
    float _1388 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1376);
    float _1390 = _1380 * _1276;
    float _1392 = _1382 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1394 = sqrt(_1386);
    float _1396 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1398 = _1384 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1400 = _1388 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1402 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1396 * _1260;
    float _1406 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1408 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _1404;
    out.m_63.y = _1390;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _1410 = _1394 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1412 = isnan(_1394);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1418 = _1414 || _1416;
    out.m_67.x = _1402;
    out.m_67.y = _1406;
    out.m_67.z = _1408;
    float _1420 = _1386;
    float _1422 = _1408;
    if (!_1418)
    {
        _1420 = 1.0;
    }
    float _1424 = _1420;
    bool _1426 = !_1418;
    float _1428 = _1424;
    if (!_1426)
    {
        bool _1430 = _1394 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1432 = isnan(_1394);
        bool _1434 = _1430 || _1432;
        bool _1436 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1438 = _1434 || _1436;
        if (!_1438)
        {
            float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1442 = _1394 + _1440;
            float _1444 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1446 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1444;
            float _1448 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1450 = _1448 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1452 = 1.0 / _1446;
            float _1454 = _1442 * _1452;
            float _1456 = fma(_1454, _1450, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1428 = _1456;
            _1458 = true;
        }
        else
        {
            bool _1460 = _1394 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1462 = isnan(_1394);
            bool _1464 = _1460 || _1462;
            bool _1466 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1468 = _1464 || _1466;
            if (!_1468)
            {
                float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1472 = _1394 + _1470;
                float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1476 = _1474 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1478 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1480 = _1478 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1482 = 1.0 / _1476;
                float _1484 = _1472 * _1482;
                float _1486 = fma(_1484, _1480, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1428 = _1486;
                _1458 = true;
            }
            else
            {
                _1428 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1458 = false;
    float _1488 = _1428;
    float _1490 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1492 = _1358 + _1490;
    float _1494 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1496 = _1364 + _1494;
    float _1498 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1500 = _1366 + _1498;
    float _1502 = fma(_1492, _1488, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1504 = fma(_1496, _1488, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1506 = fma(_1500, _1488, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1510 = _1502 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1514 = _1504 + _1512;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1518 = _1506 + _1516;
    float _1520 = _1510 * _1510;
    float _1522 = fma(_1514, _1514, _1520);
    float _1524 = fma(_1518, _1518, _1522);
    float _1526 = rsqrt(_1524);
    float _1528 = sqrt(_1524);
    float _1530 = _1526 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1532 = _1514 * _1530;
    float _1534 = _1518 * _1530;
    float _1536 = _1532 * _1532;
    float _1538 = _1534 * _1534;
    float _1540 = _1536 + _1538;
    float _1542 = sqrt(_1540);
    bool _1544 = _1542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1548 = _1542 + _1546;
    float _1550 = _1518;
    float _1552 = _1526;
    float _1554 = _1548;
    float _1556 = _1510;
    float _1558 = _1532;
    if (_1544)
    {
        float _1560 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1550 = _1560;
    }
    float _1562 = _1550;
    if (_1544)
    {
        float _1564 = rsqrt(_1540);
        _1552 = _1564;
    }
    float _1566 = _1552;
    float _1568 = _1566;
    if (_1544)
    {
        float _1570 = _1548 * _1562;
        _1554 = _1570;
    }
    float _1572 = _1554;
    if (_1544)
    {
        float _1574 = _1572 * 0.15915493667125701904296875;
        _1308 = _1574;
    }
    float _1576 = _1308;
    float _1578 = _1562;
    float _1580 = _1576;
    if (_1544)
    {
        float _1582 = _1576 * 6.283185482025146484375;
        float _1584 = sin(_1582);
        _1578 = _1584;
    }
    float _1586 = _1578;
    float _1588 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1590 = precise::max(0.0, _1588);
    float _1592 = _1364;
    float _1594 = _1590;
    if (_1544)
    {
        float _1596 = _1576 * 6.283185482025146484375;
        float _1598 = cos(_1596);
        _1592 = _1598;
    }
    float _1600 = _1592;
    float _1602 = -_1530;
    float _1604 = -_1590;
    float _1606 = fma(_1510, _1602, _1604);
    if (!_1544)
    {
        _1556 = _1536;
    }
    float _1608 = _1556;
    float _1610 = _1608;
    if (_1544)
    {
        float _1612 = _1606 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1612;
    }
    float _1614 = _1594;
    float _1616 = _1586;
    float _1618 = _1614;
    if (_1544)
    {
        float _1620 = fma(_1586, _1614, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1616 = _1620;
    }
    float _1622 = _1616;
    float _1624 = _1622;
    if (_1544)
    {
        float _1626 = _1600 + (-1.0);
        _1618 = _1626;
    }
    float _1628 = _1618;
    float _1630 = _1628;
    if (_1544)
    {
        float _1632 = _1566 * _1622;
        _1422 = _1632;
    }
    float _1634 = _1422;
    if (!_1544)
    {
        _1568 = _1606;
    }
    float _1636 = _1568;
    float _1638 = _1636;
    if (_1544)
    {
        float _1640 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1580 = _1640;
    }
    float _1642 = _1580;
    if (_1544)
    {
        float _1644 = _1532 * _1634;
        _1558 = _1644;
    }
    float _1646 = _1558;
    if (!_1544)
    {
        _1624 = _1534;
    }
    float _1648 = _1624;
    float _1650 = _1648;
    if (_1544)
    {
        float _1652 = _1534 * _1634;
        _1650 = _1652;
    }
    float _1654 = _1650;
    if (_1544)
    {
        float _1656 = fma(_1606, _1600, _1642);
        _1638 = _1656;
    }
    float _1658 = _1638;
    if (_1544)
    {
        float _1660 = _1646 * _1646;
        _1610 = _1660;
    }
    float _1662 = _1610;
    if (!_1544)
    {
        _1630 = _1538;
    }
    float _1664 = _1630;
    float _1666 = _1664;
    if (_1544)
    {
        float _1668 = _1654 * _1654;
        _1666 = _1668;
    }
    float _1670 = _1666;
    float _1672 = fma(_1658, _1658, _1662);
    float _1674 = _1672 + _1670;
    float _1676 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1678 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1680 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1678);
    float _1682 = precise::clamp(_1680, 0.0, 1.0);
    float _1684 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1686 = rsqrt(_1674);
    float _1688 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1676);
    float _1690 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1692 = -_1682;
    float _1694 = _1692 + 1.0;
    float _1696 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1688);
    float _1698 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1700 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1690);
    float _1702 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1704 = abs(_1694);
    float _1706 = log2(_1704);
    float _1708 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1698);
    float _1710 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1700);
    float _1712 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1702);
    float _1714 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1716 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1708);
    float _1718 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1720 = _1686 * _1646;
    float _1722 = _1686 * _1658;
    float _1724 = _1716 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1726 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1728 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1730 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1712);
    float _1732 = _1686 * _1654;
    float _1734 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1726);
    float _1736 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1738 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1740 = -_1728;
    float _1742 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1740);
    float _1744 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1746 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1734);
    float _1748 = -_1736;
    float _1750 = fma(_1748, _1684, 1.0);
    float _1752 = -_1732;
    float _1754 = fma(_1752, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1742);
    float _1756 = exp2(_1738);
    float _1758 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1746);
    float _1760 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1762 = fma(_1754, -0.5, 0.5);
    float _1764 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1766 = fma(_1754, 0.5, 0.5);
    float _1768 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1760);
    float _1770 = _1722 + 1.0;
    float _1772 = log2(_1750);
    float _1774 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1764);
    float _1776 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1768);
    float _1778 = fma(_1766, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1780 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1774);
    float _1782 = fma(_1766, _1778, -0.212114393711090087890625);
    float _1784 = 1.0 / _1758;
    float _1786 = -_1722;
    float _1788 = fma(_1756, _1770, _1786);
    float _1790 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1776);
    float _1792 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1780);
    float _1794 = fma(_1766, _1782, 1.570728778839111328125);
    float _1796 = fma(_1788, 0.5, 0.5);
    float _1798 = sqrt(_1762);
    float _1800 = _1772 * 0.693147182464599609375;
    float _1802 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1804 = _1790 * _1784;
    float _1806 = _1792 * _1784;
    float _1808 = fma(_1804, 0.5, 0.5);
    float _1810 = fma(_1806, -0.5, 0.5);
    float _1812 = _1798 * 0.636619746685028076171875;
    float _1814 = -_1794;
    float _1816 = fma(_1812, _1814, 1.0);
    float3 _4667 = float3(_1808, _1810, _1802);
    float _1818 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4667, float3(0.0), isnan(_4667)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4667, float3(0.0), isnan(_4667)), level(0.0)).x;
    float3 _4678 = float3(_1808, _1810, _1802);
    float4 _1821 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4678, float3(0.0), isnan(_4678)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4678, float3(0.0), isnan(_4678)), level(0.0)).xyzw;
    float _1823 = _1821.x;
    float _1825 = _1821.y;
    float _1827 = _1821.z;
    float _1829 = _1821.w;
    float2 _4695 = float2(_1816, _1796);
    float3 _1833 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4695, float2(0.0), isnan(_4695)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4695, float2(0.0), isnan(_4695)), level(0.0)).xyz;
    float _1835 = _1833.x;
    float _1837 = _1833.y;
    float _1839 = _1833.z;
    float _1841 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1843 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1845 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1841);
    float _1847 = exp2(_1843);
    float _1849 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1845);
    float _1851 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1853 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1849);
    out.m_47.x = _1851;
    float _1855 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1857 = _1853 + _1855;
    float _1859 = _1758 + _1857;
    out.gl_Position.x = _1790;
    out.gl_Position.y = _1792;
    out.gl_Position.z = _1857;
    out.gl_Position.w = _1758;
    float _1861 = -_1847;
    float _1863 = _1861 + 1.0;
    float _1865 = _1859 * 0.5;
    float _1867 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1865;
    out.m_69.w = _1758;
    float _1869 = -_1867;
    float _1871 = _1869 + 1.0;
    float _1873 = _1867 * _1818;
    float _1875 = _1829 * _1873;
    float _1877 = _1839 * _1873;
    float _1879 = _1829 * _1871;
    float _1881 = fma(_1835, _1875, _1823);
    float _1883 = fma(_1837, _1875, _1825);
    float _1885 = fma(_1829, _1877, _1827);
    out.m_71.x = _1881;
    out.m_71.y = _1883;
    out.m_71.z = _1885;
    out.m_71.w = _1879;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1458 = false;
    bool _670 = false;
    bool _528 = false;
    bool _402 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _1942 = as_type<float>(_106);
        out.gl_Position.z = _1942;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _2012 = as_type<float>(_144);
        out.gl_Position.z = _2012;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
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
        float _270 = in.m_53.x;
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
    float _362 = fma(_358, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _364 = _354 * _342;
    float _366 = _360 * _342;
    float _368 = _362 * _342;
    float _370 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _364);
    float _372 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _366);
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _368);
    float _376 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _370);
    float _378 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _372);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _374);
    bool _382 = !_340;
    float _400;
    if (!_382)
    {
        float _384 = in.m_53.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
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
        float _408 = _124 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = in.m_51.x;
    float _414 = in.m_51.y;
    float _416 = in.m_51.z;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _420 = _410 + _418;
    bool _422 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _424;
    float _428 = 1.0 / _426;
    float _430 = _378 * _416;
    float _432 = _380 * _414;
    bool _434 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _436 = isnan(_410);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = _420 * _428;
    bool _448 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _450 = isnan(_410);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _460;
    float _464 = -_444;
    float _466 = _464 + 1.0;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _472;
    float _476 = fma(_462, _446, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _478 = _458 * _466;
    float _480 = fma(_470, _446, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _482 = fma(_474, _446, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _484 = -_458;
    float _486 = _484 + 1.0;
    float _488 = _476 * _478;
    float _490 = _480 * _478;
    float _492 = _482 * _478;
    float _494 = _376 * _412;
    float _496 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[107].x, _488);
    float _498 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[107].y, _490);
    float _500 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[107].z, _492);
    float _502 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[108].x, _496);
    float _504 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[108].y, _498);
    float _506 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[108].z, _500);
    bool _508 = !_422;
    float _526;
    if (!_508)
    {
        float _510 = in.m_53.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_90);
        float _532 = 1.0 / _530;
        float _534 = _124 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _540 = _536 + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _546 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _548 = isnan(_536);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _562 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _564 = isnan(_536);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _574;
    bool _578 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _580 = isnan(_536);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = 1.0 / _544;
    float _592 = -_556;
    float _594 = _592 + 1.0;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _598 = _536 + _596;
    bool _600 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _602 = _572 * _594;
    float _604 = -_572;
    float _606 = _604 + 1.0;
    float _608 = 1.0 / _560;
    float _610 = _576 * _590;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _616 = fma(_610, _540, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _618 = -_588;
    float _620 = _618 + 1.0;
    float _622 = _614 * _608;
    float _624 = _616 * _602;
    float _626 = _556 * _620;
    float _628 = _502 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _630 = fma(_622, _598, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _632 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[115].x, _624);
    float _634 = _504 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _636 = _506 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _638 = _628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _640 = fma(_630, _626, _632);
    float _642 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _644 = _636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _646 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[117].x, _640);
    float _648 = _646 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _638;
    out.m_55.y = _642;
    out.m_55.z = _644;
    out.m_55.w = _648;
    bool _650 = !_600;
    float _668;
    if (!_650)
    {
        float _652 = in.m_53.x;
        float _654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _656 = _652 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _660 = _658 * _654;
        float _662 = floor(_660);
        float _664 = -_662;
        float _666 = _660 + _664;
        _668 = _666;
        _670 = true;
    }
    else
    {
        float _672 = float(_90);
        float _674 = 1.0 / _672;
        float _676 = _124 * _674;
        _668 = _676;
    }
    _670 = false;
    float _678 = _668;
    float _680 = in.m_53.z;
    float _682 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _684 = log2(_682);
    float _686 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _688 = in.m_53.x;
    float _690 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _694 = 1.0 + _692;
    float _696 = in.m_53.y;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _700 = _698 != 0;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _704 = _702 != 0;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _708 = _706 != 0;
    float _710 = _430 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _712 = 1.0 / _694;
    bool _714 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _716 = isnan(1.0);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _722 = _718 || _720;
    bool _724 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _726 = isnan(0.0);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _732 = _728 || _730;
    float _734 = _684 * _124;
    float _736 = exp2(_734);
    float _738 = _680 * 2.0;
    float _740 = _688 * 2.0;
    float _742 = floor(_738);
    float _744 = _696 * 2.0;
    float _746 = _696 + _680;
    float _748 = _688 + _696;
    float _750 = floor(_740);
    float _752 = -_736;
    float _754 = _752 + 1.0;
    float _756 = _746 + (-1.0);
    float _758 = _748 + (-1.0);
    float _760 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _762 = floor(_744);
    float _764 = _732 ? _754 : 0.0;
    float _766 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _768 = _742 > 0.0;
    bool _770 = _742 >= 0.0;
    bool _772 = isnan(_742);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.0);
    bool _778 = _774 || _776;
    if (_722)
    {
        float _780 = _764 * _712;
        _126 = _780;
    }
    float _782 = _126;
    bool _784 = !_700;
    int _786 = _784 ? 0 : 1;
    bool _788 = _750 > 0.0;
    bool _790 = _750 >= 0.0;
    bool _792 = isnan(_750);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    float _800 = in.m_57.x;
    float _802 = in.m_57.y;
    float _804 = in.m_57.z;
    int _806 = _778 ? 0 : 1;
    int _808 = abs(_786);
    int _810 = ~_806;
    int _812 = _810 + 1;
    int _814 = _812 + 1;
    int _816 = _814;
    if (!_768)
    {
        int _818 = ~_806;
        int _820 = _818 + 1;
        _816 = _820;
    }
    int _822 = _816;
    bool _824 = _762 > 0.0;
    bool _826 = _762 >= 0.0;
    bool _828 = isnan(_762);
    bool _830 = _826 || _828;
    bool _832 = isnan(0.0);
    bool _834 = _830 || _832;
    float _836 = float(_808);
    float _838 = float(_822);
    bool _840 = !_704;
    int _842 = _840 ? 0 : 1;
    int _844 = _798 ? 0 : 1;
    float _846 = _836 * _838;
    int _848 = abs(_842);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _850;
    int _854 = _834 ? 0 : 1;
    float _856 = _846 * (-2.0);
    int _858 = ~_844;
    int _860 = _858 + 1;
    int _862 = _860 + 1;
    int _864 = _862;
    if (!_788)
    {
        int _866 = ~_844;
        int _868 = _866 + 1;
        _864 = _868;
    }
    int _870 = _864;
    float _872 = fma(_856, _800, _800);
    float _874 = _688 + (-0.5);
    int _876 = ~_854;
    int _878 = _876 + 1;
    int _880 = _878 + 1;
    float _882 = fma(_766, _856, _766);
    int _884 = _880;
    if (!_824)
    {
        int _886 = ~_854;
        int _888 = _886 + 1;
        _884 = _888;
    }
    int _890 = _884;
    float _892 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[196].x, _872);
    bool _894 = !_708;
    int _896 = _894 ? 0 : 1;
    float _898 = 1.0 / _852;
    float _900 = float(_848);
    float _902 = float(_870);
    int _904 = abs(_896);
    float _906 = fma(_882, _782, _892);
    float _908 = float(_890);
    float _910 = _900 * _902;
    float _912 = _696 + (-0.5);
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _918 = _910 * (-2.0);
    float _920 = float(_904);
    float _922 = _906 * 0.15915493667125701904296875;
    bool _924 = _696 > 0.5;
    float _926 = fma(_918, _802, _802);
    float _928 = fma(_760, _918, _760);
    float _930 = _920 * _908;
    float _932 = _688 + _680;
    float _934 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[196].y, _926);
    float _936 = _680 + (-0.5);
    float _938 = _930 * (-2.0);
    float _940 = _932 + (-1.0);
    float _942 = fma(_928, _782, _934);
    float _944 = in.m_59.y;
    float _946 = fma(_938, _804, _804);
    float _948 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _950 = _922 * 6.283185482025146484375;
    float _952 = sin(_950);
    float _954 = in.m_61.x;
    float _956 = in.m_61.y;
    float _958 = in.m_61.z;
    float _960 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[196].z, _946);
    float _962 = fma(_948, _938, _948);
    float _964 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _966 = _942 * 0.15915493667125701904296875;
    float _968 = fma(_962, _782, _960);
    float _970 = _922 * 6.283185482025146484375;
    float _972 = cos(_970);
    float _974 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _976 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _964);
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _984 = _982 != 0;
    float _986 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _988 = _966 * 6.283185482025146484375;
    float _990 = sin(_988);
    float _992 = _968 * 0.15915493667125701904296875;
    float _994 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _974);
    float _996 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _986);
    bool _998 = _688 > 0.5;
    bool _1000 = _998 && _984;
    float _1002 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _996);
    float _1004 = _966 * 6.283185482025146484375;
    float _1006 = cos(_1004);
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _954);
    float _1010 = -_944;
    float _1012 = _1010 + 1.0;
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _956);
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1018 = _678 + _1016;
    float _1020 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _958);
    float _1022 = _690 * _1008;
    float _1024 = _686 * _1014;
    float _1026 = _992 * 6.283185482025146484375;
    float _1028 = cos(_1026);
    float _1030 = _944;
    if (_980)
    {
        float _1032 = _924 ? _1012 : _944;
        _1030 = _1032;
    }
    float _1034 = _1030;
    float _1036 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _994);
    float _1038 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _976);
    float _1040 = _1018 * _898;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1044 = _678 + _1042;
    float _1046 = _952 * _990;
    float _1048 = _710 * _1020;
    float _1050 = 1.0 / _916;
    float _1052 = _972 * _1006;
    float _1054 = _972 * _990;
    float _1056 = _1036 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1058 = _1002 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1060 = in.m_59.x;
    float _1062 = _1038 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1064 = _992 * 6.283185482025146484375;
    float _1066 = sin(_1064);
    float _1068 = _1028 * _1024;
    float _1070 = _990 * _1028;
    float _1072 = _1006 * _1028;
    float _1074 = _972 * _1068;
    float _1076 = _1044 * _1050;
    float _1078 = _952 * _1006;
    float _1080 = _952 * _1068;
    float _1082 = fma(_1066, _1052, _1046);
    float _1084 = -_1024;
    float _1086 = _1066 * _1084;
    float _1088 = fma(_1066, _1046, _1052);
    float _1090 = fma(_1082, _1022, _1074);
    float _1092 = -_1078;
    float _1094 = fma(_1066, _1054, _1092);
    float _1096 = -_1054;
    float _1098 = fma(_1066, _1078, _1096);
    float _1100 = fma(_1072, _1022, _1086);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1102;
    float _1106 = fma(_1094, _1048, _1090);
    float _1108 = fma(_1098, _1022, _1080);
    float _1110 = fma(_1070, _1048, _1100);
    float _1112 = fma(_1104, _1040, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1114 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1116 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1118 = fma(_1088, _1048, _1108);
    float _1120 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1114);
    float _1122 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1116);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1120);
    float _1130 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1122);
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1140 = _1056 + _1128;
    float _1142 = _1058 + _1130;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1144;
    bool _1148 = _678 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1150 = isnan(_678);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1156 = _1152 || _1154;
    float _1158 = float(_1156);
    float _1160 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1162 = _1140 + _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1166 = _1142 + _1164;
    float _1168 = fma(_1134, _1040, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1170 = fma(_1146, _1040, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1172 = _1162 * _1162;
    float _1174 = _1166 * _1166;
    bool _1176 = _678 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1178 = isnan(_678);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = -_1158;
    float _1190 = _1188 + 1.0;
    bool _1192 = _678 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1194 = isnan(_678);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = _1172 + _1174;
    float _1206 = _1134;
    float _1208 = _1190;
    float _1210 = _1062;
    if (_984)
    {
        _1206 = _1060;
    }
    float _1212 = _1206;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1216 = _1214 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1218 = fma(_1138, _1076, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1220 = sqrt(_1204);
    float _1222 = _1202 * _1190;
    float _1224 = -_1202;
    float _1226 = _1224 + 1.0;
    float _1228 = _1212;
    if (!_984)
    {
        _1208 = _1060;
    }
    float _1230 = _1208;
    float _1232 = _1230;
    if (_1000)
    {
        float _1234 = -_1212;
        float _1236 = _1234 + 1.0;
        _1228 = _1236;
    }
    float _1238 = _1228;
    float _1240 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1242 = _1186 * _1226;
    float _1244 = -_1186;
    float _1246 = _1244 + 1.0;
    float _1248 = fma(_1216, _1076, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1250 = _1246;
    float _1252 = _1242;
    if (_984)
    {
        _1232 = _1238;
    }
    float _1254 = _1232;
    float _1256 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1240);
    float _1258 = _1170 * _1242;
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1262 = _1168 * _1242;
    float _1264 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1256);
    float _1266 = _1112 * _1242;
    bool _1268 = _1220 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1270 = fma(_1126, _1076, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1272 = _1062 + _1264;
    float _1274 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1262);
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1278 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1258);
    float _1280 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1266);
    float _1282 = _1258;
    float _1284 = _1266;
    if (!_1268)
    {
        _1282 = _1174;
    }
    float _1286 = _1282;
    float _1288 = _1286;
    if (!_1268)
    {
        _1210 = _1172;
    }
    float _1290 = _1210;
    float _1292 = _1290;
    if (!_1268)
    {
        _1250 = _1140;
    }
    float _1294 = _1250;
    float _1296 = _1294;
    if (!_1268)
    {
        _1252 = _1142;
    }
    float _1298 = _1252;
    float _1300 = _1298;
    if (!_1268)
    {
        _1284 = _1272;
    }
    float _1302 = _1284;
    bool _1304 = !_1268;
    float _1306 = _1302;
    float _1308 = _1260;
    if (!_1304)
    {
        float _1310 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1314 = _1220 + _1312;
        float _1316 = rsqrt(_1204);
        float _1318 = _1314 * _1310;
        float _1320 = _1272 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1322 = _1318 * 0.15915493667125701904296875;
        float _1324 = _1322 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        float _1328 = _1322 * 6.283185482025146484375;
        float _1330 = cos(_1328);
        float _1332 = fma(_1326, _1320, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1334 = _1316 * _1332;
        float _1336 = _1330 + (-1.0);
        float _1338 = fma(_1162, _1334, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1340 = fma(_1166, _1334, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1342 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1346 = _1338 + _1344;
        float _1348 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1350 = _1340 + _1348;
        float _1352 = fma(_1272, _1330, _1342);
        float _1354 = _1346 * _1346;
        float _1356 = _1350 * _1350;
        _1306 = _1352;
        _1292 = _1354;
        _1288 = _1356;
        _1296 = _1338;
        _1300 = _1340;
    }
    float _1358 = _1306;
    float _1360 = _1292;
    float _1362 = _1288;
    float _1364 = _1296;
    float _1366 = _1300;
    float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1370 = _1358 + _1368;
    float _1372 = fma(_1218, _1222, _1274);
    float _1374 = fma(_1248, _1222, _1278);
    float _1376 = fma(_1270, _1222, _1280);
    float _1378 = fma(_1370, _1370, _1360);
    float _1380 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1382 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1372);
    float _1384 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1374);
    float _1386 = _1378 + _1362;
    float _1388 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1376);
    float _1390 = _1380 * _1276;
    float _1392 = _1382 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1394 = sqrt(_1386);
    float _1396 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1398 = _1384 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1400 = _1388 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1402 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1396 * _1260;
    float _1406 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1408 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _1404;
    out.m_63.y = _1390;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _1410 = _1394 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1412 = isnan(_1394);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1418 = _1414 || _1416;
    out.m_67.x = _1402;
    out.m_67.y = _1406;
    out.m_67.z = _1408;
    float _1420 = _1386;
    float _1422 = _1408;
    if (!_1418)
    {
        _1420 = 1.0;
    }
    float _1424 = _1420;
    bool _1426 = !_1418;
    float _1428 = _1424;
    if (!_1426)
    {
        bool _1430 = _1394 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1432 = isnan(_1394);
        bool _1434 = _1430 || _1432;
        bool _1436 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1438 = _1434 || _1436;
        if (!_1438)
        {
            float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1442 = _1394 + _1440;
            float _1444 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1446 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1444;
            float _1448 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1450 = _1448 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1452 = 1.0 / _1446;
            float _1454 = _1442 * _1452;
            float _1456 = fma(_1454, _1450, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1428 = _1456;
            _1458 = true;
        }
        else
        {
            bool _1460 = _1394 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1462 = isnan(_1394);
            bool _1464 = _1460 || _1462;
            bool _1466 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1468 = _1464 || _1466;
            if (!_1468)
            {
                float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1472 = _1394 + _1470;
                float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1476 = _1474 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1478 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1480 = _1478 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1482 = 1.0 / _1476;
                float _1484 = _1472 * _1482;
                float _1486 = fma(_1484, _1480, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1428 = _1486;
                _1458 = true;
            }
            else
            {
                _1428 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1458 = false;
    float _1488 = _1428;
    float _1490 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1492 = _1358 + _1490;
    float _1494 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1496 = _1364 + _1494;
    float _1498 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1500 = _1366 + _1498;
    float _1502 = fma(_1492, _1488, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1504 = fma(_1496, _1488, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1506 = fma(_1500, _1488, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1510 = _1502 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1514 = _1504 + _1512;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1518 = _1506 + _1516;
    float _1520 = _1510 * _1510;
    float _1522 = fma(_1514, _1514, _1520);
    float _1524 = fma(_1518, _1518, _1522);
    float _1526 = rsqrt(_1524);
    float _1528 = sqrt(_1524);
    float _1530 = _1526 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1532 = _1514 * _1530;
    float _1534 = _1518 * _1530;
    float _1536 = _1532 * _1532;
    float _1538 = _1534 * _1534;
    float _1540 = _1536 + _1538;
    float _1542 = sqrt(_1540);
    bool _1544 = _1542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1548 = _1542 + _1546;
    float _1550 = _1518;
    float _1552 = _1526;
    float _1554 = _1548;
    float _1556 = _1510;
    float _1558 = _1532;
    if (_1544)
    {
        float _1560 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1550 = _1560;
    }
    float _1562 = _1550;
    if (_1544)
    {
        float _1564 = rsqrt(_1540);
        _1552 = _1564;
    }
    float _1566 = _1552;
    float _1568 = _1566;
    if (_1544)
    {
        float _1570 = _1548 * _1562;
        _1554 = _1570;
    }
    float _1572 = _1554;
    if (_1544)
    {
        float _1574 = _1572 * 0.15915493667125701904296875;
        _1308 = _1574;
    }
    float _1576 = _1308;
    float _1578 = _1562;
    float _1580 = _1576;
    if (_1544)
    {
        float _1582 = _1576 * 6.283185482025146484375;
        float _1584 = sin(_1582);
        _1578 = _1584;
    }
    float _1586 = _1578;
    float _1588 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1590 = precise::max(0.0, _1588);
    float _1592 = _1364;
    float _1594 = _1590;
    if (_1544)
    {
        float _1596 = _1576 * 6.283185482025146484375;
        float _1598 = cos(_1596);
        _1592 = _1598;
    }
    float _1600 = _1592;
    float _1602 = -_1530;
    float _1604 = -_1590;
    float _1606 = fma(_1510, _1602, _1604);
    if (!_1544)
    {
        _1556 = _1536;
    }
    float _1608 = _1556;
    float _1610 = _1608;
    if (_1544)
    {
        float _1612 = _1606 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1612;
    }
    float _1614 = _1594;
    float _1616 = _1586;
    float _1618 = _1614;
    if (_1544)
    {
        float _1620 = fma(_1586, _1614, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1616 = _1620;
    }
    float _1622 = _1616;
    float _1624 = _1622;
    if (_1544)
    {
        float _1626 = _1600 + (-1.0);
        _1618 = _1626;
    }
    float _1628 = _1618;
    float _1630 = _1628;
    if (_1544)
    {
        float _1632 = _1566 * _1622;
        _1422 = _1632;
    }
    float _1634 = _1422;
    if (!_1544)
    {
        _1568 = _1606;
    }
    float _1636 = _1568;
    float _1638 = _1636;
    if (_1544)
    {
        float _1640 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1580 = _1640;
    }
    float _1642 = _1580;
    if (_1544)
    {
        float _1644 = _1532 * _1634;
        _1558 = _1644;
    }
    float _1646 = _1558;
    if (!_1544)
    {
        _1624 = _1534;
    }
    float _1648 = _1624;
    float _1650 = _1648;
    if (_1544)
    {
        float _1652 = _1534 * _1634;
        _1650 = _1652;
    }
    float _1654 = _1650;
    if (_1544)
    {
        float _1656 = fma(_1606, _1600, _1642);
        _1638 = _1656;
    }
    float _1658 = _1638;
    if (_1544)
    {
        float _1660 = _1646 * _1646;
        _1610 = _1660;
    }
    float _1662 = _1610;
    if (!_1544)
    {
        _1630 = _1538;
    }
    float _1664 = _1630;
    float _1666 = _1664;
    if (_1544)
    {
        float _1668 = _1654 * _1654;
        _1666 = _1668;
    }
    float _1670 = _1666;
    float _1672 = fma(_1658, _1658, _1662);
    float _1674 = _1672 + _1670;
    float _1676 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1678 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1680 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1678);
    float _1682 = precise::clamp(_1680, 0.0, 1.0);
    float _1684 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1686 = rsqrt(_1674);
    float _1688 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1676);
    float _1690 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1692 = -_1682;
    float _1694 = _1692 + 1.0;
    float _1696 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1688);
    float _1698 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1700 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1690);
    float _1702 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1704 = abs(_1694);
    float _1706 = log2(_1704);
    float _1708 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1698);
    float _1710 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1700);
    float _1712 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1702);
    float _1714 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1716 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1708);
    float _1718 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1720 = _1686 * _1646;
    float _1722 = _1686 * _1658;
    float _1724 = _1716 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1726 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1728 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1730 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1712);
    float _1732 = _1686 * _1654;
    float _1734 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1726);
    float _1736 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1738 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1740 = -_1728;
    float _1742 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1740);
    float _1744 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1746 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1734);
    float _1748 = -_1736;
    float _1750 = fma(_1748, _1684, 1.0);
    float _1752 = -_1732;
    float _1754 = fma(_1752, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1742);
    float _1756 = exp2(_1738);
    float _1758 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1746);
    float _1760 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1762 = fma(_1754, -0.5, 0.5);
    float _1764 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1766 = fma(_1754, 0.5, 0.5);
    float _1768 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1760);
    float _1770 = _1722 + 1.0;
    float _1772 = log2(_1750);
    float _1774 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1764);
    float _1776 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1768);
    float _1778 = fma(_1766, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1780 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1774);
    float _1782 = fma(_1766, _1778, -0.212114393711090087890625);
    float _1784 = 1.0 / _1758;
    float _1786 = -_1722;
    float _1788 = fma(_1756, _1770, _1786);
    float _1790 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1776);
    float _1792 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1780);
    float _1794 = fma(_1766, _1782, 1.570728778839111328125);
    float _1796 = fma(_1788, 0.5, 0.5);
    float _1798 = sqrt(_1762);
    float _1800 = _1772 * 0.693147182464599609375;
    float _1802 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1804 = _1790 * _1784;
    float _1806 = _1792 * _1784;
    float _1808 = fma(_1804, 0.5, 0.5);
    float _1810 = fma(_1806, -0.5, 0.5);
    float _1812 = _1798 * 0.636619746685028076171875;
    float _1814 = -_1794;
    float _1816 = fma(_1812, _1814, 1.0);
    float3 _4667 = float3(_1808, _1810, _1802);
    float _1818 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4667, float3(0.0), isnan(_4667)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4667, float3(0.0), isnan(_4667)), level(0.0)).x;
    float3 _4678 = float3(_1808, _1810, _1802);
    float4 _1821 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4678, float3(0.0), isnan(_4678)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4678, float3(0.0), isnan(_4678)), level(0.0)).xyzw;
    float _1823 = _1821.x;
    float _1825 = _1821.y;
    float _1827 = _1821.z;
    float _1829 = _1821.w;
    float2 _4695 = float2(_1816, _1796);
    float3 _1833 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4695, float2(0.0), isnan(_4695)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4695, float2(0.0), isnan(_4695)), level(0.0)).xyz;
    float _1835 = _1833.x;
    float _1837 = _1833.y;
    float _1839 = _1833.z;
    float _1841 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1843 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1845 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1841);
    float _1847 = exp2(_1843);
    float _1849 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1845);
    float _1851 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1853 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1849);
    out.m_47.x = _1851;
    float _1855 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1857 = _1853 + _1855;
    float _1859 = _1758 + _1857;
    out.gl_Position.x = _1790;
    out.gl_Position.y = _1792;
    out.gl_Position.z = _1857;
    out.gl_Position.w = _1758;
    float _1861 = -_1847;
    float _1863 = _1861 + 1.0;
    float _1865 = _1859 * 0.5;
    float _1867 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1865;
    out.m_69.w = _1758;
    float _1869 = -_1867;
    float _1871 = _1869 + 1.0;
    float _1873 = _1867 * _1818;
    float _1875 = _1829 * _1873;
    float _1877 = _1839 * _1873;
    float _1879 = _1829 * _1871;
    float _1881 = fma(_1835, _1875, _1823);
    float _1883 = fma(_1837, _1875, _1825);
    float _1885 = fma(_1829, _1877, _1827);
    out.m_71.x = _1881;
    out.m_71.y = _1883;
    out.m_71.z = _1885;
    out.m_71.w = _1879;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1458 = false;
    bool _670 = false;
    bool _528 = false;
    bool _402 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _1942 = as_type<float>(_106);
        out.gl_Position.z = _1942;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _2012 = as_type<float>(_144);
        out.gl_Position.z = _2012;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
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
        float _270 = in.m_53.x;
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
    float _362 = fma(_358, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _364 = _354 * _342;
    float _366 = _360 * _342;
    float _368 = _362 * _342;
    float _370 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _364);
    float _372 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _366);
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _368);
    float _376 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _370);
    float _378 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _372);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _374);
    bool _382 = !_340;
    float _400;
    if (!_382)
    {
        float _384 = in.m_53.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
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
        float _408 = _124 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = in.m_51.x;
    float _414 = in.m_51.y;
    float _416 = in.m_51.z;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _420 = _410 + _418;
    bool _422 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _424;
    float _428 = 1.0 / _426;
    float _430 = _378 * _416;
    float _432 = _380 * _414;
    bool _434 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _436 = isnan(_410);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = _420 * _428;
    bool _448 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _450 = isnan(_410);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _460;
    float _464 = -_444;
    float _466 = _464 + 1.0;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _472;
    float _476 = fma(_462, _446, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _478 = _458 * _466;
    float _480 = fma(_470, _446, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _482 = fma(_474, _446, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _484 = -_458;
    float _486 = _484 + 1.0;
    float _488 = _476 * _478;
    float _490 = _480 * _478;
    float _492 = _482 * _478;
    float _494 = _376 * _412;
    float _496 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[107].x, _488);
    float _498 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[107].y, _490);
    float _500 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[107].z, _492);
    float _502 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[108].x, _496);
    float _504 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[108].y, _498);
    float _506 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[108].z, _500);
    bool _508 = !_422;
    float _526;
    if (!_508)
    {
        float _510 = in.m_53.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_90);
        float _532 = 1.0 / _530;
        float _534 = _124 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _540 = _536 + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _546 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _548 = isnan(_536);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _562 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _564 = isnan(_536);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _574;
    bool _578 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _580 = isnan(_536);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = 1.0 / _544;
    float _592 = -_556;
    float _594 = _592 + 1.0;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _598 = _536 + _596;
    bool _600 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _602 = _572 * _594;
    float _604 = -_572;
    float _606 = _604 + 1.0;
    float _608 = 1.0 / _560;
    float _610 = _576 * _590;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _616 = fma(_610, _540, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _618 = -_588;
    float _620 = _618 + 1.0;
    float _622 = _614 * _608;
    float _624 = _616 * _602;
    float _626 = _556 * _620;
    float _628 = _502 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _630 = fma(_622, _598, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _632 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[115].x, _624);
    float _634 = _504 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _636 = _506 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _638 = _628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _640 = fma(_630, _626, _632);
    float _642 = _634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _644 = _636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _646 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[117].x, _640);
    float _648 = _646 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _638;
    out.m_55.y = _642;
    out.m_55.z = _644;
    out.m_55.w = _648;
    bool _650 = !_600;
    float _668;
    if (!_650)
    {
        float _652 = in.m_53.x;
        float _654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _656 = _652 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _658 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _660 = _658 * _654;
        float _662 = floor(_660);
        float _664 = -_662;
        float _666 = _660 + _664;
        _668 = _666;
        _670 = true;
    }
    else
    {
        float _672 = float(_90);
        float _674 = 1.0 / _672;
        float _676 = _124 * _674;
        _668 = _676;
    }
    _670 = false;
    float _678 = _668;
    float _680 = in.m_53.z;
    float _682 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _684 = log2(_682);
    float _686 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _688 = in.m_53.x;
    float _690 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _694 = 1.0 + _692;
    float _696 = in.m_53.y;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _700 = _698 != 0;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _704 = _702 != 0;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _708 = _706 != 0;
    float _710 = _430 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _712 = 1.0 / _694;
    bool _714 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _716 = isnan(1.0);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _722 = _718 || _720;
    bool _724 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _726 = isnan(0.0);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _732 = _728 || _730;
    float _734 = _684 * _124;
    float _736 = exp2(_734);
    float _738 = _680 * 2.0;
    float _740 = _688 * 2.0;
    float _742 = floor(_738);
    float _744 = _696 * 2.0;
    float _746 = _696 + _680;
    float _748 = _688 + _696;
    float _750 = floor(_740);
    float _752 = -_736;
    float _754 = _752 + 1.0;
    float _756 = _746 + (-1.0);
    float _758 = _748 + (-1.0);
    float _760 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _762 = floor(_744);
    float _764 = _732 ? _754 : 0.0;
    float _766 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _768 = _742 > 0.0;
    bool _770 = _742 >= 0.0;
    bool _772 = isnan(_742);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.0);
    bool _778 = _774 || _776;
    if (_722)
    {
        float _780 = _764 * _712;
        _126 = _780;
    }
    float _782 = _126;
    bool _784 = !_700;
    int _786 = _784 ? 0 : 1;
    bool _788 = _750 > 0.0;
    bool _790 = _750 >= 0.0;
    bool _792 = isnan(_750);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    float _800 = in.m_57.x;
    float _802 = in.m_57.y;
    float _804 = in.m_57.z;
    int _806 = _778 ? 0 : 1;
    int _808 = abs(_786);
    int _810 = ~_806;
    int _812 = _810 + 1;
    int _814 = _812 + 1;
    int _816 = _814;
    if (!_768)
    {
        int _818 = ~_806;
        int _820 = _818 + 1;
        _816 = _820;
    }
    int _822 = _816;
    bool _824 = _762 > 0.0;
    bool _826 = _762 >= 0.0;
    bool _828 = isnan(_762);
    bool _830 = _826 || _828;
    bool _832 = isnan(0.0);
    bool _834 = _830 || _832;
    float _836 = float(_808);
    float _838 = float(_822);
    bool _840 = !_704;
    int _842 = _840 ? 0 : 1;
    int _844 = _798 ? 0 : 1;
    float _846 = _836 * _838;
    int _848 = abs(_842);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _850;
    int _854 = _834 ? 0 : 1;
    float _856 = _846 * (-2.0);
    int _858 = ~_844;
    int _860 = _858 + 1;
    int _862 = _860 + 1;
    int _864 = _862;
    if (!_788)
    {
        int _866 = ~_844;
        int _868 = _866 + 1;
        _864 = _868;
    }
    int _870 = _864;
    float _872 = fma(_856, _800, _800);
    float _874 = _688 + (-0.5);
    int _876 = ~_854;
    int _878 = _876 + 1;
    int _880 = _878 + 1;
    float _882 = fma(_766, _856, _766);
    int _884 = _880;
    if (!_824)
    {
        int _886 = ~_854;
        int _888 = _886 + 1;
        _884 = _888;
    }
    int _890 = _884;
    float _892 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[196].x, _872);
    bool _894 = !_708;
    int _896 = _894 ? 0 : 1;
    float _898 = 1.0 / _852;
    float _900 = float(_848);
    float _902 = float(_870);
    int _904 = abs(_896);
    float _906 = fma(_882, _782, _892);
    float _908 = float(_890);
    float _910 = _900 * _902;
    float _912 = _696 + (-0.5);
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _918 = _910 * (-2.0);
    float _920 = float(_904);
    float _922 = _906 * 0.15915493667125701904296875;
    bool _924 = _696 > 0.5;
    float _926 = fma(_918, _802, _802);
    float _928 = fma(_760, _918, _760);
    float _930 = _920 * _908;
    float _932 = _688 + _680;
    float _934 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[196].y, _926);
    float _936 = _680 + (-0.5);
    float _938 = _930 * (-2.0);
    float _940 = _932 + (-1.0);
    float _942 = fma(_928, _782, _934);
    float _944 = in.m_59.y;
    float _946 = fma(_938, _804, _804);
    float _948 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _950 = _922 * 6.283185482025146484375;
    float _952 = sin(_950);
    float _954 = in.m_61.x;
    float _956 = in.m_61.y;
    float _958 = in.m_61.z;
    float _960 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[196].z, _946);
    float _962 = fma(_948, _938, _948);
    float _964 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _966 = _942 * 0.15915493667125701904296875;
    float _968 = fma(_962, _782, _960);
    float _970 = _922 * 6.283185482025146484375;
    float _972 = cos(_970);
    float _974 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _976 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _964);
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _984 = _982 != 0;
    float _986 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _988 = _966 * 6.283185482025146484375;
    float _990 = sin(_988);
    float _992 = _968 * 0.15915493667125701904296875;
    float _994 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _974);
    float _996 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _986);
    bool _998 = _688 > 0.5;
    bool _1000 = _998 && _984;
    float _1002 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _996);
    float _1004 = _966 * 6.283185482025146484375;
    float _1006 = cos(_1004);
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _954);
    float _1010 = -_944;
    float _1012 = _1010 + 1.0;
    float _1014 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _956);
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1018 = _678 + _1016;
    float _1020 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _958);
    float _1022 = _690 * _1008;
    float _1024 = _686 * _1014;
    float _1026 = _992 * 6.283185482025146484375;
    float _1028 = cos(_1026);
    float _1030 = _944;
    if (_980)
    {
        float _1032 = _924 ? _1012 : _944;
        _1030 = _1032;
    }
    float _1034 = _1030;
    float _1036 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _994);
    float _1038 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _976);
    float _1040 = _1018 * _898;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1044 = _678 + _1042;
    float _1046 = _952 * _990;
    float _1048 = _710 * _1020;
    float _1050 = 1.0 / _916;
    float _1052 = _972 * _1006;
    float _1054 = _972 * _990;
    float _1056 = _1036 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1058 = _1002 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1060 = in.m_59.x;
    float _1062 = _1038 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1064 = _992 * 6.283185482025146484375;
    float _1066 = sin(_1064);
    float _1068 = _1028 * _1024;
    float _1070 = _990 * _1028;
    float _1072 = _1006 * _1028;
    float _1074 = _972 * _1068;
    float _1076 = _1044 * _1050;
    float _1078 = _952 * _1006;
    float _1080 = _952 * _1068;
    float _1082 = fma(_1066, _1052, _1046);
    float _1084 = -_1024;
    float _1086 = _1066 * _1084;
    float _1088 = fma(_1066, _1046, _1052);
    float _1090 = fma(_1082, _1022, _1074);
    float _1092 = -_1078;
    float _1094 = fma(_1066, _1054, _1092);
    float _1096 = -_1054;
    float _1098 = fma(_1066, _1078, _1096);
    float _1100 = fma(_1072, _1022, _1086);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1102;
    float _1106 = fma(_1094, _1048, _1090);
    float _1108 = fma(_1098, _1022, _1080);
    float _1110 = fma(_1070, _1048, _1100);
    float _1112 = fma(_1104, _1040, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1114 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1116 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1118 = fma(_1088, _1048, _1108);
    float _1120 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1114);
    float _1122 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1116);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1120);
    float _1130 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1122);
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1140 = _1056 + _1128;
    float _1142 = _1058 + _1130;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1144;
    bool _1148 = _678 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1150 = isnan(_678);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1156 = _1152 || _1154;
    float _1158 = float(_1156);
    float _1160 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1162 = _1140 + _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1166 = _1142 + _1164;
    float _1168 = fma(_1134, _1040, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1170 = fma(_1146, _1040, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1172 = _1162 * _1162;
    float _1174 = _1166 * _1166;
    bool _1176 = _678 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1178 = isnan(_678);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = -_1158;
    float _1190 = _1188 + 1.0;
    bool _1192 = _678 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1194 = isnan(_678);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = _1172 + _1174;
    float _1206 = _1134;
    float _1208 = _1190;
    float _1210 = _1062;
    if (_984)
    {
        _1206 = _1060;
    }
    float _1212 = _1206;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1216 = _1214 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1218 = fma(_1138, _1076, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1220 = sqrt(_1204);
    float _1222 = _1202 * _1190;
    float _1224 = -_1202;
    float _1226 = _1224 + 1.0;
    float _1228 = _1212;
    if (!_984)
    {
        _1208 = _1060;
    }
    float _1230 = _1208;
    float _1232 = _1230;
    if (_1000)
    {
        float _1234 = -_1212;
        float _1236 = _1234 + 1.0;
        _1228 = _1236;
    }
    float _1238 = _1228;
    float _1240 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1242 = _1186 * _1226;
    float _1244 = -_1186;
    float _1246 = _1244 + 1.0;
    float _1248 = fma(_1216, _1076, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1250 = _1246;
    float _1252 = _1242;
    if (_984)
    {
        _1232 = _1238;
    }
    float _1254 = _1232;
    float _1256 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1240);
    float _1258 = _1170 * _1242;
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1262 = _1168 * _1242;
    float _1264 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1256);
    float _1266 = _1112 * _1242;
    bool _1268 = _1220 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1270 = fma(_1126, _1076, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1272 = _1062 + _1264;
    float _1274 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1262);
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1278 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1258);
    float _1280 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1266);
    float _1282 = _1258;
    float _1284 = _1266;
    if (!_1268)
    {
        _1282 = _1174;
    }
    float _1286 = _1282;
    float _1288 = _1286;
    if (!_1268)
    {
        _1210 = _1172;
    }
    float _1290 = _1210;
    float _1292 = _1290;
    if (!_1268)
    {
        _1250 = _1140;
    }
    float _1294 = _1250;
    float _1296 = _1294;
    if (!_1268)
    {
        _1252 = _1142;
    }
    float _1298 = _1252;
    float _1300 = _1298;
    if (!_1268)
    {
        _1284 = _1272;
    }
    float _1302 = _1284;
    bool _1304 = !_1268;
    float _1306 = _1302;
    float _1308 = _1260;
    if (!_1304)
    {
        float _1310 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1314 = _1220 + _1312;
        float _1316 = rsqrt(_1204);
        float _1318 = _1314 * _1310;
        float _1320 = _1272 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1322 = _1318 * 0.15915493667125701904296875;
        float _1324 = _1322 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        float _1328 = _1322 * 6.283185482025146484375;
        float _1330 = cos(_1328);
        float _1332 = fma(_1326, _1320, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1334 = _1316 * _1332;
        float _1336 = _1330 + (-1.0);
        float _1338 = fma(_1162, _1334, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1340 = fma(_1166, _1334, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1342 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1346 = _1338 + _1344;
        float _1348 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1350 = _1340 + _1348;
        float _1352 = fma(_1272, _1330, _1342);
        float _1354 = _1346 * _1346;
        float _1356 = _1350 * _1350;
        _1306 = _1352;
        _1292 = _1354;
        _1288 = _1356;
        _1296 = _1338;
        _1300 = _1340;
    }
    float _1358 = _1306;
    float _1360 = _1292;
    float _1362 = _1288;
    float _1364 = _1296;
    float _1366 = _1300;
    float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1370 = _1358 + _1368;
    float _1372 = fma(_1218, _1222, _1274);
    float _1374 = fma(_1248, _1222, _1278);
    float _1376 = fma(_1270, _1222, _1280);
    float _1378 = fma(_1370, _1370, _1360);
    float _1380 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1382 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1372);
    float _1384 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1374);
    float _1386 = _1378 + _1362;
    float _1388 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1376);
    float _1390 = _1380 * _1276;
    float _1392 = _1382 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1394 = sqrt(_1386);
    float _1396 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1398 = _1384 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1400 = _1388 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1402 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1396 * _1260;
    float _1406 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1408 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _1404;
    out.m_63.y = _1390;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _1410 = _1394 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1412 = isnan(_1394);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1418 = _1414 || _1416;
    out.m_67.x = _1402;
    out.m_67.y = _1406;
    out.m_67.z = _1408;
    float _1420 = _1386;
    float _1422 = _1408;
    if (!_1418)
    {
        _1420 = 1.0;
    }
    float _1424 = _1420;
    bool _1426 = !_1418;
    float _1428 = _1424;
    if (!_1426)
    {
        bool _1430 = _1394 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1432 = isnan(_1394);
        bool _1434 = _1430 || _1432;
        bool _1436 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1438 = _1434 || _1436;
        if (!_1438)
        {
            float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1442 = _1394 + _1440;
            float _1444 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1446 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1444;
            float _1448 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1450 = _1448 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1452 = 1.0 / _1446;
            float _1454 = _1442 * _1452;
            float _1456 = fma(_1454, _1450, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1428 = _1456;
            _1458 = true;
        }
        else
        {
            bool _1460 = _1394 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1462 = isnan(_1394);
            bool _1464 = _1460 || _1462;
            bool _1466 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1468 = _1464 || _1466;
            if (!_1468)
            {
                float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1472 = _1394 + _1470;
                float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1476 = _1474 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1478 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1480 = _1478 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1482 = 1.0 / _1476;
                float _1484 = _1472 * _1482;
                float _1486 = fma(_1484, _1480, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1428 = _1486;
                _1458 = true;
            }
            else
            {
                _1428 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1458 = false;
    float _1488 = _1428;
    float _1490 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1492 = _1358 + _1490;
    float _1494 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1496 = _1364 + _1494;
    float _1498 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1500 = _1366 + _1498;
    float _1502 = fma(_1492, _1488, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1504 = fma(_1496, _1488, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1506 = fma(_1500, _1488, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1510 = _1502 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1514 = _1504 + _1512;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1518 = _1506 + _1516;
    float _1520 = _1510 * _1510;
    float _1522 = fma(_1514, _1514, _1520);
    float _1524 = fma(_1518, _1518, _1522);
    float _1526 = rsqrt(_1524);
    float _1528 = sqrt(_1524);
    float _1530 = _1526 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1532 = _1514 * _1530;
    float _1534 = _1518 * _1530;
    float _1536 = _1532 * _1532;
    float _1538 = _1534 * _1534;
    float _1540 = _1536 + _1538;
    float _1542 = sqrt(_1540);
    bool _1544 = _1542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1548 = _1542 + _1546;
    float _1550 = _1518;
    float _1552 = _1526;
    float _1554 = _1548;
    float _1556 = _1510;
    float _1558 = _1532;
    if (_1544)
    {
        float _1560 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1550 = _1560;
    }
    float _1562 = _1550;
    if (_1544)
    {
        float _1564 = rsqrt(_1540);
        _1552 = _1564;
    }
    float _1566 = _1552;
    float _1568 = _1566;
    if (_1544)
    {
        float _1570 = _1548 * _1562;
        _1554 = _1570;
    }
    float _1572 = _1554;
    if (_1544)
    {
        float _1574 = _1572 * 0.15915493667125701904296875;
        _1308 = _1574;
    }
    float _1576 = _1308;
    float _1578 = _1562;
    float _1580 = _1576;
    if (_1544)
    {
        float _1582 = _1576 * 6.283185482025146484375;
        float _1584 = sin(_1582);
        _1578 = _1584;
    }
    float _1586 = _1578;
    float _1588 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1590 = precise::max(0.0, _1588);
    float _1592 = _1364;
    float _1594 = _1590;
    if (_1544)
    {
        float _1596 = _1576 * 6.283185482025146484375;
        float _1598 = cos(_1596);
        _1592 = _1598;
    }
    float _1600 = _1592;
    float _1602 = -_1530;
    float _1604 = -_1590;
    float _1606 = fma(_1510, _1602, _1604);
    if (!_1544)
    {
        _1556 = _1536;
    }
    float _1608 = _1556;
    float _1610 = _1608;
    if (_1544)
    {
        float _1612 = _1606 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1612;
    }
    float _1614 = _1594;
    float _1616 = _1586;
    float _1618 = _1614;
    if (_1544)
    {
        float _1620 = fma(_1586, _1614, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1616 = _1620;
    }
    float _1622 = _1616;
    float _1624 = _1622;
    if (_1544)
    {
        float _1626 = _1600 + (-1.0);
        _1618 = _1626;
    }
    float _1628 = _1618;
    float _1630 = _1628;
    if (_1544)
    {
        float _1632 = _1566 * _1622;
        _1422 = _1632;
    }
    float _1634 = _1422;
    if (!_1544)
    {
        _1568 = _1606;
    }
    float _1636 = _1568;
    float _1638 = _1636;
    if (_1544)
    {
        float _1640 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1580 = _1640;
    }
    float _1642 = _1580;
    if (_1544)
    {
        float _1644 = _1532 * _1634;
        _1558 = _1644;
    }
    float _1646 = _1558;
    if (!_1544)
    {
        _1624 = _1534;
    }
    float _1648 = _1624;
    float _1650 = _1648;
    if (_1544)
    {
        float _1652 = _1534 * _1634;
        _1650 = _1652;
    }
    float _1654 = _1650;
    if (_1544)
    {
        float _1656 = fma(_1606, _1600, _1642);
        _1638 = _1656;
    }
    float _1658 = _1638;
    if (_1544)
    {
        float _1660 = _1646 * _1646;
        _1610 = _1660;
    }
    float _1662 = _1610;
    if (!_1544)
    {
        _1630 = _1538;
    }
    float _1664 = _1630;
    float _1666 = _1664;
    if (_1544)
    {
        float _1668 = _1654 * _1654;
        _1666 = _1668;
    }
    float _1670 = _1666;
    float _1672 = fma(_1658, _1658, _1662);
    float _1674 = _1672 + _1670;
    float _1676 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1678 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1680 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1678);
    float _1682 = precise::clamp(_1680, 0.0, 1.0);
    float _1684 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1686 = rsqrt(_1674);
    float _1688 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1676);
    float _1690 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1692 = -_1682;
    float _1694 = _1692 + 1.0;
    float _1696 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1688);
    float _1698 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1700 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1690);
    float _1702 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1704 = abs(_1694);
    float _1706 = log2(_1704);
    float _1708 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1698);
    float _1710 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1700);
    float _1712 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1702);
    float _1714 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1716 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1708);
    float _1718 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1720 = _1686 * _1646;
    float _1722 = _1686 * _1658;
    float _1724 = _1716 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1726 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1728 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1730 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1712);
    float _1732 = _1686 * _1654;
    float _1734 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1726);
    float _1736 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1738 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1740 = -_1728;
    float _1742 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1740);
    float _1744 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1746 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1734);
    float _1748 = -_1736;
    float _1750 = fma(_1748, _1684, 1.0);
    float _1752 = -_1732;
    float _1754 = fma(_1752, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1742);
    float _1756 = exp2(_1738);
    float _1758 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1746);
    float _1760 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1762 = fma(_1754, -0.5, 0.5);
    float _1764 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1766 = fma(_1754, 0.5, 0.5);
    float _1768 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1760);
    float _1770 = _1722 + 1.0;
    float _1772 = log2(_1750);
    float _1774 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1764);
    float _1776 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1768);
    float _1778 = fma(_1766, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1780 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1774);
    float _1782 = fma(_1766, _1778, -0.212114393711090087890625);
    float _1784 = 1.0 / _1758;
    float _1786 = -_1722;
    float _1788 = fma(_1756, _1770, _1786);
    float _1790 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1776);
    float _1792 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1780);
    float _1794 = fma(_1766, _1782, 1.570728778839111328125);
    float _1796 = fma(_1788, 0.5, 0.5);
    float _1798 = sqrt(_1762);
    float _1800 = _1772 * 0.693147182464599609375;
    float _1802 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1804 = _1790 * _1784;
    float _1806 = _1792 * _1784;
    float _1808 = fma(_1804, 0.5, 0.5);
    float _1810 = fma(_1806, -0.5, 0.5);
    float _1812 = _1798 * 0.636619746685028076171875;
    float _1814 = -_1794;
    float _1816 = fma(_1812, _1814, 1.0);
    float3 _4667 = float3(_1808, _1810, _1802);
    float _1818 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4667, float3(0.0), isnan(_4667)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4667, float3(0.0), isnan(_4667)), level(0.0)).x;
    float3 _4678 = float3(_1808, _1810, _1802);
    float4 _1821 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4678, float3(0.0), isnan(_4678)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4678, float3(0.0), isnan(_4678)), level(0.0)).xyzw;
    float _1823 = _1821.x;
    float _1825 = _1821.y;
    float _1827 = _1821.z;
    float _1829 = _1821.w;
    float2 _4695 = float2(_1816, _1796);
    float3 _1833 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4695, float2(0.0), isnan(_4695)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4695, float2(0.0), isnan(_4695)), level(0.0)).xyz;
    float _1835 = _1833.x;
    float _1837 = _1833.y;
    float _1839 = _1833.z;
    float _1841 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1843 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1845 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1841);
    float _1847 = exp2(_1843);
    float _1849 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1845);
    float _1851 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1853 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1849);
    out.m_47.x = _1851;
    float _1855 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1857 = _1853 + _1855;
    float _1859 = _1758 + _1857;
    out.gl_Position.x = _1790;
    out.gl_Position.y = _1792;
    out.gl_Position.z = _1857;
    out.gl_Position.w = _1758;
    float _1861 = -_1847;
    float _1863 = _1861 + 1.0;
    float _1865 = _1859 * 0.5;
    float _1867 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1865;
    out.m_69.w = _1758;
    float _1869 = -_1867;
    float _1871 = _1869 + 1.0;
    float _1873 = _1867 * _1818;
    float _1875 = _1829 * _1873;
    float _1877 = _1839 * _1873;
    float _1879 = _1829 * _1871;
    float _1881 = fma(_1835, _1875, _1823);
    float _1883 = fma(_1837, _1875, _1825);
    float _1885 = fma(_1829, _1877, _1827);
    out.m_71.x = _1881;
    out.m_71.y = _1883;
    out.m_71.z = _1885;
    out.m_71.w = _1879;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

