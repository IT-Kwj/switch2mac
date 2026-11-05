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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texturecube<float> fp_t_tcb_1E [[id(6)]];
    sampler fp_t_tcb_1ESmplr [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_1ESmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_38 [[user(locn7)]];
    float4 m_42 [[user(locn8)]];
    float4 m_46 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_54 [[user(locn11)]];
    float4 m_63 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_38.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_38.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_38.z;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_40.z;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_40.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = 1.0 / _72;
    float _106 = _104 * _78;
    float _108 = _104 * _84;
    float _110 = _104 * _90;
    float _112 = _106 * _106;
    float _114 = fma(_108, _108, _112);
    float _116 = fma(_110, _110, _114);
    float _118 = rsqrt(_116);
    float _120 = _106 * _118;
    float _122 = _108 * _118;
    float _124 = _110 * _118;
    float _126 = _120 * _120;
    float _128 = fma(_122, _122, _126);
    float _130 = fma(_124, _124, _128);
    float _132 = rsqrt(_130);
    float _134 = _122 * _132;
    float _136 = _120 * _132;
    float _138 = _124 * _132;
    float _140 = _104 * _96;
    float _142 = abs(_134);
    float _144 = abs(_136);
    float _146 = precise::max(_142, _144);
    float _148 = abs(_138);
    float _150 = precise::max(_148, _146);
    float _152 = _104 * _102;
    float _154 = 1.0 / _150;
    float2 _829 = float2(_140, _152);
    float2 _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_829, float2(0.0), isnan(_829))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_829, float2(0.0), isnan(_829))).xy;
    float _160 = _158.x;
    float _162 = _158.y;
    float _164 = -_154;
    float _166 = _138 * _164;
    float _168 = _134 * _154;
    float _170 = _136 * _154;
    float3 _856 = float3(_168, _170, _166);
    float3 _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_856, float3(0.0), isnan(_856)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_856, float3(0.0), isnan(_856)), level(0.0)).xyz;
    float _176 = _174.x;
    float _178 = _174.y;
    float _180 = _174.z;
    float _182 = in.m_42.y;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_42.x;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_42.z;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_44.y;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_44.x;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_46.y;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_44.z;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_46.x;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_46.z;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_48.w;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_50.x;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = _104 * _186;
    float _250 = _104 * _192;
    float _252 = _104 * _204;
    float _254 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _256 = _248 + _254;
    float _258 = _104 * _198;
    float _260 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _262 = _250 + _260;
    float _264 = _256 * _256;
    float _266 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _268 = _258 + _266;
    float _270 = _104 * _234;
    float _272 = _104 * _240;
    float _274 = fma(_262, _262, _264);
    float _276 = _104 * _246;
    float _278 = fma(_268, _268, _274);
    float _280 = rsqrt(_278);
    float _282 = _104 * _222;
    float _284 = _256 * _280;
    float _286 = _262 * _280;
    float _288 = _268 * _280;
    float _290 = _104 * _210;
    float _292 = _284 * _284;
    float _294 = _252 * _252;
    float _296 = _104 * _216;
    float _298 = in.m_52.x;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = fma(_286, _286, _292);
    float _306 = fma(_288, _288, _304);
    float _308 = fma(_290, _290, _294);
    float _310 = _104 * _228;
    float _312 = _296 * _296;
    float _314 = rsqrt(_306);
    float _316 = fma(_282, _282, _308);
    float _318 = _286 * _314;
    float _320 = fma(_310, _310, _312);
    float _322 = _284 * _314;
    float _324 = rsqrt(_316);
    float _326 = _288 * _314;
    float _328 = fma(_270, _270, _320);
    float _330 = 0.0 + _272;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = in.m_48.x;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_48.z;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = _104 * _302;
    float _348 = _332 * _276;
    float _350 = rsqrt(_328);
    float _352 = in.m_48.y;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = _162 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _360 = _358 * 2.0;
    float _362 = _160 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _364 = _362 * 2.0;
    float _366 = _360 * _360;
    float _368 = _360 * _324;
    float _370 = in.m_52.y;
    float _372 = gl_FragCoord.w;
    float _374 = _370 * _372;
    float _376 = fma(_364, _364, _366);
    float _378 = precise::clamp(_376, 0.0, 1.0);
    float _380 = _364 * _350;
    float _382 = _252 * _368;
    float _384 = in.m_52.z;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = -_378;
    float _392 = _390 + 1.0;
    float _394 = _290 * _368;
    float _396 = in.m_54.w;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = fma(_296, _380, _382);
    float _404 = _282 * _368;
    float _406 = fma(_310, _380, _394);
    float _408 = sqrt(_392);
    float _410 = fma(_270, _380, _404);
    float _412 = fma(_136, _408, _402);
    float _414 = fma(_134, _408, _406);
    float _416 = fma(_138, _408, _410);
    float _418 = _412 * _322;
    float _420 = _104 * _374;
    float _422 = _104 * _356;
    float _424 = fma(_414, _318, _418);
    float _426 = _104 * _388;
    float _428 = _104 * _400;
    float _430 = fma(_416, _326, _424);
    bool _434 = _428 != 1.0;
    bool _436 = isnan(_428);
    bool _438 = _434 || _436;
    bool _440 = isnan(1.0);
    bool _442 = _438 || _440;
    float _444 = abs(_430);
    float _446 = fma(_444, 1.4285714626312255859375, -0.14285714924335479736328125);
    float _448 = precise::clamp(_446, 0.0, 1.0);
    float _450 = _104 * _338;
    float _452 = fma(_448, -2.0, 3.0);
    float _454 = _448 * _448;
    float _456 = _104 * _344;
    float _458 = _452 * _454;
    float _460 = -_346;
    float _462 = _460 + _450;
    float _464 = -_420;
    float _466 = _464 + _422;
    float _468 = -_426;
    float _470 = _468 + _456;
    float _472 = fma(_458, _462, _346);
    float _474 = fma(_458, _466, _420);
    float _476 = fma(_458, _470, _426);
    bool _478 = !_442;
    if (!_478)
    {
        float _480 = gl_FragCoord.x;
        float _482 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _484 = _480 / _482;
        float _486 = gl_FragCoord.y;
        float _488 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _490 = _486 / _488;
        float _492 = trunc(_484);
        int _495 = int(_492);
        float _497 = trunc(_490);
        int _499 = int(_497);
        int _501 = _495 + 2;
        int _503 = _501 >> 1;
        uint _506 = uint(int(uint(_499) >> uint(1)));
        int _508 = _503 ^ int(_506);
        int _510 = _508 << 16;
        int _512 = _510 ^ _503;
        int _514 = 983055 & _512;
        float _516 = _428 * 256.0;
        int _518 = _514 << 6;
        int _520 = _518 + _514;
        float _522 = trunc(_516);
        int _524 = int(_522);
        int _526 = _520 & 13369548;
        uint _528 = uint(int(uint(_526) >> uint(3)));
        int _530 = _526 | int(_528);
        int _532 = _530 & 5570560;
        int _534 = _530 & 85;
        uint _536 = uint(int(uint(_524) >> uint(7)));
        int _538 = int(_536) + _524;
        uint _540 = uint(int(uint(_532) >> uint(15)));
        int _542 = int(_540) + _534;
        bool _544 = uint(_538) > uint(_542);
        if (!_544)
        {
            discard_fragment();
        }
        if (!_544)
        {
            out.m_57.x = _472;
            out.m_57.y = _474;
            out.m_57.z = _476;
            out.m_57.w = _348;
            return out;
        }
    }
    float _546 = in.m_59.x;
    float _548 = gl_FragCoord.w;
    float _550 = _546 * _548;
    float _552 = in.m_59.y;
    float _554 = gl_FragCoord.w;
    float _556 = _552 * _554;
    float _558 = in.m_59.z;
    float _560 = gl_FragCoord.w;
    float _562 = _558 * _560;
    float _564 = in.m_61.x;
    float _566 = gl_FragCoord.w;
    float _568 = _564 * _566;
    float _570 = in.m_61.y;
    float _572 = gl_FragCoord.w;
    float _574 = _570 * _572;
    float _576 = in.m_61.z;
    float _578 = gl_FragCoord.w;
    float _580 = _576 * _578;
    float _582 = in.m_63.x;
    float _584 = gl_FragCoord.w;
    float _586 = _582 * _584;
    float _588 = in.m_63.w;
    float _590 = gl_FragCoord.w;
    float _592 = _588 * _590;
    float _594 = in.m_63.y;
    float _596 = gl_FragCoord.w;
    float _598 = _594 * _596;
    float _600 = in.m_63.z;
    float _602 = gl_FragCoord.w;
    float _604 = _600 * _602;
    float _606 = _104 * _550;
    float _608 = _104 * _556;
    float _610 = _104 * _562;
    float _612 = fma(_176, 0.20999999344348907470703125, _606);
    float _614 = fma(_178, 0.20999999344348907470703125, _608);
    bool _616 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _618 = fma(_180, 0.20999999344348907470703125, _610);
    float _620 = _104 * _568;
    float _622 = _104 * _574;
    float _624 = _104 * _580;
    float _626 = _612 + _620;
    float _628 = _614 + _622;
    float _630 = _618 + _624;
    float _632 = 0.0 + _348;
    float _634 = precise::clamp(_632, 0.0, 1.0);
    float _636 = _472 * _626;
    float _638 = _474 * _628;
    float _640 = _104 * _586;
    float _642 = _104 * _592;
    float _644 = _476 * _630;
    float _646 = _104 * _598;
    float _648 = _104 * _604;
    float _650 = fma(_636, _642, _640);
    float _652 = _640;
    if (!_616)
    {
        _652 = _634;
    }
    float _654 = _652;
    float _656 = fma(_638, _642, _646);
    float _658 = fma(_644, _642, _648);
    bool _660 = !_616;
    float _662 = _654;
    if (!_660)
    {
        float _664 = in.m_65.w;
        float _666 = gl_FragCoord.w;
        float _668 = _664 * _666;
        float _670 = in.m_65.z;
        float _672 = gl_FragCoord.w;
        float _674 = _670 * _672;
        float _676 = _104 * _668;
        float _678 = _104 * _674;
        float _680 = 1.0 / _676;
        float _682 = _678 * _680;
        float _684 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _686 = fma(_682, (*spvDescriptorSet0.fp_c8)._m0[30].w, _684);
        float _688 = 1.0 / _686;
        float _690 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _692 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _694 = fma(_688, _690, _692);
        float _696 = _694 * 8.0;
        float _698 = precise::clamp(_696, 0.0, 1.0);
        float _700 = _634 * _698;
        _662 = _700;
    }
    float _702 = _662;
    float _704 = 0.0 + _702;
    float _706 = precise::clamp(_704, 0.0, 1.0);
    out.m_57.x = _650;
    out.m_57.y = _656;
    out.m_57.z = _658;
    out.m_57.w = _706;
    return out;
}

