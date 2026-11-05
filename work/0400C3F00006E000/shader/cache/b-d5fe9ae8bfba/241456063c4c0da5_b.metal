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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c9 [[id(3)]];
    constant _16* fp_c15 [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_1ESmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_46 [[user(locn6)]];
    float4 m_42 [[user(locn7)]];
    float4 m_44 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_52 [[user(locn10)]];
    float4 m_63 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_40.z;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_40.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / _72;
    float _88 = _86 * _78;
    float _90 = _86 * _84;
    float2 _776 = float2(_88, _90);
    float2 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_776, float2(0.0), isnan(_776))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_776, float2(0.0), isnan(_776))).xy;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = in.m_42.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_42.x;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_42.z;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_44.y;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_44.x;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_46.y;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_46.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_44.z;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_46.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_48.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = _86 * _104;
    float _162 = _86 * _110;
    float _164 = _86 * _116;
    float _166 = _86 * _122;
    float _168 = _160 * _160;
    float _170 = _86 * _140;
    float _172 = _166 * _166;
    float _174 = fma(_162, _162, _168);
    float _176 = _86 * _146;
    float _178 = _86 * _152;
    float _180 = fma(_164, _164, _174);
    float _182 = _86 * _128;
    float _184 = _86 * _134;
    float _186 = in.m_50.z;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = fma(_182, _182, _172);
    float _194 = rsqrt(_180);
    float _196 = _184 * _184;
    float _198 = fma(_176, _176, _192);
    float _200 = fma(_170, _170, _196);
    float _202 = fma(_178, _178, _200);
    float _204 = rsqrt(_198);
    float _206 = _160 * _194;
    float _208 = _162 * _194;
    float _210 = _164 * _194;
    float _212 = rsqrt(_202);
    float _214 = _206 * _206;
    float _216 = fma(_208, _208, _214);
    float _218 = fma(_210, _210, _216);
    float _220 = rsqrt(_218);
    float _222 = _178 * _212;
    float _224 = _98 * _98;
    float _226 = _212 * _98;
    float _228 = (*spvDescriptorSet0.fp_c10)._m0[9].y * (*spvDescriptorSet0.fp_c10)._m0[9].y;
    float _230 = _96 * _204;
    float _232 = fma(_96, _96, _224);
    float _234 = precise::clamp(_232, 0.0, 1.0);
    float _236 = _184 * _226;
    float _238 = _170 * _226;
    float _240 = -_234;
    float _242 = _240 + 1.0;
    float _244 = fma(_166, _230, _236);
    float _246 = fma(_182, _230, _238);
    float _248 = _98 * _222;
    float _250 = sqrt(_242);
    float _252 = fma((*spvDescriptorSet0.fp_c10)._m0[8].y, (*spvDescriptorSet0.fp_c10)._m0[8].y, _228);
    float _254 = fma(_176, _230, _248);
    float _256 = in.m_50.x;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = fma((*spvDescriptorSet0.fp_c10)._m0[10].y, (*spvDescriptorSet0.fp_c10)._m0[10].y, _252);
    float _264 = in.m_52.w;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_50.y;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = rsqrt(_262);
    float _278 = _220 * _250;
    float _280 = fma(_206, _278, _244);
    float _282 = fma(_208, _278, _246);
    float _284 = fma(_210, _278, _254);
    float _286 = _280 * _280;
    float _288 = fma(_282, _282, _286);
    float _290 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _292 = fma(_284, _284, _288);
    float _294 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _290);
    float _296 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _294);
    float _298 = rsqrt(_292);
    float _300 = _276 * (*spvDescriptorSet0.fp_c10)._m0[9].y;
    float _302 = _276 * (*spvDescriptorSet0.fp_c10)._m0[8].y;
    float _304 = rsqrt(_296);
    float _306 = _280 * _298;
    float _308 = _282 * _298;
    float _310 = _284 * _298;
    float _312 = _276 * (*spvDescriptorSet0.fp_c10)._m0[10].y;
    float _314 = _306 * _300;
    float _316 = _304 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _318 = _304 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _320 = fma(_308, _302, _314);
    float _322 = _306 * _316;
    float _324 = _304 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _326 = fma(_310, _312, _320);
    float _328 = fma(_308, _318, _322);
    float _330 = -(*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _332 = (*spvDescriptorSet0.fp_c9)._m0[191].w + _330;
    float _334 = fma(_326, 0.5, 0.5);
    float _336 = fma(_310, _324, _328);
    float _338 = _86 * _268;
    float _340 = -(*spvDescriptorSet0.fp_c9)._m0[193].x;
    float _342 = (*spvDescriptorSet0.fp_c9)._m0[193].y + _340;
    float _344 = in.m_52.x;
    float _346 = gl_FragCoord.w;
    float _348 = _344 * _346;
    float _350 = fma(_336, -0.5, 0.5);
    float _352 = _334 * _334;
    float _354 = 1.0 / _332;
    bool _358 = _338 != 1.0;
    bool _360 = isnan(_338);
    bool _362 = _358 || _360;
    bool _364 = isnan(1.0);
    bool _366 = _362 || _364;
    float _368 = _86 * _190;
    float _370 = precise::max(_350, (*spvDescriptorSet0.fp_c9)._m0[191].z);
    float _372 = precise::max(_352, (*spvDescriptorSet0.fp_c9)._m0[193].x);
    float _374 = precise::min(_370, (*spvDescriptorSet0.fp_c9)._m0[191].w);
    float _376 = 1.0 / _342;
    float _378 = precise::min(_372, (*spvDescriptorSet0.fp_c9)._m0[193].y);
    float _380 = -(*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _382 = _374 + _380;
    float _384 = -(*spvDescriptorSet0.fp_c9)._m0[193].x;
    float _386 = _378 + _384;
    float _388 = _382 * _354;
    float _390 = _86 * _158;
    float _392 = _386 * _376;
    float _394 = _86 * _260;
    float _396 = _86 * _274;
    float _398 = fma(_388, (*spvDescriptorSet0.fp_c9)._m0[192].x, _392);
    float _400 = _394 * _398;
    float _402 = _396 * _398;
    float _404 = _368 * _398;
    bool _406 = !_366;
    if (!_406)
    {
        float _408 = gl_FragCoord.x;
        float _410 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _412 = _408 / _410;
        float _414 = gl_FragCoord.y;
        float _416 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _418 = _414 / _416;
        float _420 = _338 * 256.0;
        float _422 = trunc(_420);
        int _425 = int(_422);
        uint _428 = uint(int(uint(_425) >> uint(7)));
        int _430 = int(_428) + _425;
        float _432 = trunc(_412);
        int _434 = int(_432);
        float _436 = trunc(_418);
        int _438 = int(_436);
        int _440 = _434 + 2;
        int _442 = _440 >> 1;
        uint _444 = uint(int(uint(_438) >> uint(1)));
        int _446 = _442 ^ int(_444);
        int _448 = _446 << 16;
        int _450 = _448 ^ _442;
        int _452 = 983055 & _450;
        int _454 = _452 << 6;
        int _456 = _454 + _452;
        int _458 = _456 & 13369548;
        uint _460 = uint(int(uint(_458) >> uint(3)));
        int _462 = _458 | int(_460);
        int _464 = _462 & 5570560;
        int _466 = _462 & 85;
        uint _468 = uint(int(uint(_464) >> uint(15)));
        int _470 = int(_468) + _466;
        bool _472 = uint(_430) > uint(_470);
        if (!_472)
        {
            discard_fragment();
        }
        if (!_472)
        {
            out.m_55.x = _400;
            out.m_55.y = _402;
            out.m_55.z = _404;
            out.m_55.w = _390;
            return out;
        }
    }
    float _474 = abs(_208);
    float _476 = abs(_206);
    float _478 = precise::max(_474, _476);
    float _480 = _86 * _348;
    float _482 = abs(_210);
    float _484 = precise::max(_482, _478);
    float _486 = -_398;
    float _488 = _486 + 1.0;
    float _490 = precise::clamp(_488, 0.0, 1.0);
    float _492 = _480 + _490;
    float _494 = 1.0 / _484;
    float _496 = _208 * _494;
    float _498 = _206 * _494;
    float _500 = -_494;
    float _502 = _210 * _500;
    float _504 = precise::min(_492, 1.0);
    float3 _1418 = float3(_496, _498, _502);
    float3 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1418, float3(0.0), isnan(_1418)), level(_504)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1418, float3(0.0), isnan(_1418)), level(_504)).xyz;
    float _510 = _508.x;
    float _512 = _508.y;
    float _514 = _508.z;
    float _516 = in.m_57.y;
    float _518 = gl_FragCoord.w;
    float _520 = _516 * _518;
    float _522 = in.m_57.x;
    float _524 = gl_FragCoord.w;
    float _526 = _522 * _524;
    float _528 = in.m_57.z;
    float _530 = gl_FragCoord.w;
    float _532 = _528 * _530;
    float _534 = in.m_59.x;
    float _536 = gl_FragCoord.w;
    float _538 = _534 * _536;
    float _540 = in.m_59.y;
    float _542 = gl_FragCoord.w;
    float _544 = _540 * _542;
    float _546 = in.m_59.z;
    float _548 = gl_FragCoord.w;
    float _550 = _546 * _548;
    float _552 = in.m_61.x;
    float _554 = gl_FragCoord.w;
    float _556 = _552 * _554;
    float _558 = in.m_61.y;
    float _560 = gl_FragCoord.w;
    float _562 = _558 * _560;
    float _564 = in.m_61.z;
    float _566 = gl_FragCoord.w;
    float _568 = _564 * _566;
    bool _570 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _572 = _86 * _520;
    float _574 = _86 * _526;
    float _576 = _86 * _532;
    float _578 = -_572;
    float _580 = _396 + _578;
    float _582 = -_574;
    float _584 = _394 + _582;
    float _586 = -_576;
    float _588 = _368 + _586;
    float _590 = fma(_392, _580, _572);
    float _592 = fma(_392, _584, _574);
    float _594 = fma(_392, _588, _576);
    float _596 = in.m_63.x;
    float _598 = gl_FragCoord.w;
    float _600 = _596 * _598;
    float _602 = _590 * 0.3576000034809112548828125;
    float _604 = in.m_63.w;
    float _606 = gl_FragCoord.w;
    float _608 = _604 * _606;
    float _610 = in.m_63.y;
    float _612 = gl_FragCoord.w;
    float _614 = _610 * _612;
    float _616 = fma(_592, 0.10629999637603759765625, _602);
    float _618 = fma(_594, 0.0361000001430511474609375, _616);
    float _620 = _86 * _550;
    float _622 = in.m_63.z;
    float _624 = gl_FragCoord.w;
    float _626 = _622 * _624;
    float _628 = 1.0 / _618;
    float _630 = _628 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _632 = precise::clamp(_630, 0.0, 1.0);
    float _634 = fma(_632, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _636 = _86 * _538;
    float _638 = _86 * _544;
    float _640 = _86 * _608;
    float _642 = _592 * _634;
    float _644 = _642 * 0.5;
    float _646 = _590 * _634;
    float _648 = _646 * 0.5;
    float _650 = _594 * _634;
    float _652 = _650 * 0.5;
    float _654 = _86 * _556;
    float _656 = _86 * _568;
    float _658 = _86 * _614;
    float _660 = fma(_510, 0.20999999344348907470703125, _636);
    float _662 = fma(_512, 0.20999999344348907470703125, _638);
    float _664 = fma(_514, 0.20999999344348907470703125, _620);
    float _666 = _86 * _562;
    float _668 = _660 + _654;
    float _670 = _664 + _656;
    float _672 = _662 + _666;
    float _674 = 0.0 + _390;
    float _676 = precise::clamp(_674, 0.0, 1.0);
    float _678 = fma(_400, _668, _644);
    float _680 = _86 * _600;
    float _682 = fma(_402, _672, _648);
    float _684 = fma(_404, _670, _652);
    float _686 = _86 * _626;
    float _688 = fma(_678, _640, _680);
    float _690 = fma(_682, _640, _658);
    float _692 = _680;
    if (!_570)
    {
        _692 = _676;
    }
    float _694 = _692;
    float _696 = fma(_684, _640, _686);
    bool _698 = !_570;
    float _700 = _694;
    if (!_698)
    {
        float _702 = in.m_65.w;
        float _704 = gl_FragCoord.w;
        float _706 = _702 * _704;
        float _708 = in.m_65.z;
        float _710 = gl_FragCoord.w;
        float _712 = _708 * _710;
        float _714 = _86 * _706;
        float _716 = _86 * _712;
        float _718 = 1.0 / _714;
        float _720 = _716 * _718;
        float _722 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _724 = fma(_720, (*spvDescriptorSet0.fp_c8)._m0[30].w, _722);
        float _726 = 1.0 / _724;
        float _728 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _730 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _732 = fma(_726, _728, _730);
        float _734 = _732 * 8.0;
        float _736 = precise::clamp(_734, 0.0, 1.0);
        float _738 = _676 * _736;
        _700 = _738;
    }
    float _740 = _700;
    float _742 = 0.0 + _740;
    float _744 = precise::clamp(_742, 0.0, 1.0);
    out.m_55.x = _688;
    out.m_55.y = _690;
    out.m_55.z = _696;
    out.m_55.w = _744;
    return out;
}

