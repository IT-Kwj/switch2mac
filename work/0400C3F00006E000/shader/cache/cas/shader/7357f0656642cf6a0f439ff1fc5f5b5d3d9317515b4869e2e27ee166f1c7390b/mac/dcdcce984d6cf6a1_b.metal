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
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_1ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_67 [[user(locn9)]];
    float4 m_51 [[user(locn10)]];
    float4 m_53 [[user(locn12)]];
    float4 m_69 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _78 = gl_FragCoord.w;
    float _80 = in.m_40.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_40.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = 1.0 / _78;
    float _94 = _92 * _84;
    float _96 = _92 * _90;
    float2 _775 = float2(_94, _96);
    float4 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_775, float2(0.0), isnan(_775))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_775, float2(0.0), isnan(_775))).xyzw;
    float _101 = _99.x;
    float _103 = _99.y;
    float _105 = _99.z;
    float _107 = _99.w;
    float _109 = in.m_42.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_40.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _92 * _113;
    float _123 = _92 * _119;
    float _125 = 0.0 + _107;
    float _127 = precise::clamp(_125, 0.0, 1.0);
    float _129 = _127 * _121;
    bool _132 = _129 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _134 = isnan(_129);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _140 = _136 || _138;
    float _142 = in.m_40.z;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    if (!_140)
    {
        discard_fragment();
    }
    float _148 = _92 * _146;
    float2 _854 = float2(_148, _123);
    float2 _152 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_854, float2(0.0), isnan(_854))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_854, float2(0.0), isnan(_854))).xy;
    float _154 = _152.x;
    float _156 = _152.y;
    float _158 = in.m_44.y;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_44.z;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_44.x;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_46.x;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_46.y;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_46.z;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = _103 * _103;
    float _196 = _101 * _101;
    float _198 = _105 * _105;
    float _200 = -_194;
    float _202 = _200 + 1.0;
    float _204 = _92 * _162;
    float _206 = _92 * _168;
    float _208 = _92 * _174;
    float _210 = -_198;
    float _212 = _210 + 1.0;
    float _214 = -_196;
    float _216 = _214 + 1.0;
    float _218 = _204 * _202;
    float _220 = _92 * _192;
    float _222 = _206 * _212;
    float _224 = _208 * _216;
    float _226 = _92 * _180;
    float _228 = _92 * _186;
    float _230 = fma(_198, _220, _222);
    float _232 = fma(_196, _226, _224);
    float _234 = fma(_194, _228, _218);
    if (!_140)
    {
        out.m_49.x = _232;
        out.m_49.y = _234;
        out.m_49.z = _230;
        out.m_49.w = _107;
        return out;
    }
    float _236 = in.m_51.w;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_46.w;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_53.w;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = _92 * _240;
    float _256 = precise::max(_254, 0.949999988079071044921875);
    float _258 = precise::max(0.0, _254);
    float _260 = precise::min(_256, 1.0);
    float _262 = precise::min(_258, 0.0500000007450580596923828125);
    float _264 = fma(_260, -19.999996185302734375, 19.999996185302734375);
    float _266 = _262 * 20.0;
    float _268 = _92 * _246;
    float _270 = _264 * _266;
    float _272 = _270 * _270;
    float _274 = _92 * _252;
    float _276 = _268 * _272;
    float _278 = _274 * _276;
    bool _280 = _278 != 1.0;
    bool _282 = isnan(_278);
    bool _284 = _280 || _282;
    bool _286 = isnan(1.0);
    bool _288 = _284 || _286;
    bool _290 = !_288;
    if (!_290)
    {
        float _292 = gl_FragCoord.x;
        float _294 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _296 = _292 / _294;
        float _298 = gl_FragCoord.y;
        float _300 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _302 = _298 / _300;
        float _304 = _278 * 256.0;
        float _306 = trunc(_304);
        int _309 = int(_306);
        float _311 = trunc(_296);
        int _313 = int(_311);
        float _315 = trunc(_302);
        int _317 = int(_315);
        int _319 = _313 + 2;
        int _321 = _319 >> 1;
        uint _324 = uint(int(uint(_317) >> uint(1)));
        int _326 = _321 ^ int(_324);
        int _328 = _326 << 16;
        int _330 = _328 ^ _321;
        int _332 = 983055 & _330;
        int _334 = _332 << 6;
        int _336 = _334 + _332;
        int _338 = _336 & 13369548;
        uint _340 = uint(int(uint(_338) >> uint(3)));
        int _342 = _338 | int(_340);
        uint _344 = uint(int(uint(_309) >> uint(7)));
        int _346 = int(_344) + _309;
        int _348 = _342 & 5570560;
        int _350 = _342 & 85;
        uint _352 = uint(int(uint(_348) >> uint(15)));
        int _354 = int(_352) + _350;
        bool _356 = uint(_346) > uint(_354);
        if (!_356)
        {
            discard_fragment();
        }
        if (!_356)
        {
            out.m_49.x = _232;
            out.m_49.y = _234;
            out.m_49.z = _230;
            out.m_49.w = _129;
            return out;
        }
    }
    float _358 = in.m_55.y;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = in.m_57.x;
    float _366 = gl_FragCoord.w;
    float _368 = _364 * _366;
    float _370 = in.m_57.z;
    float _372 = gl_FragCoord.w;
    float _374 = _370 * _372;
    float _376 = in.m_55.x;
    float _378 = gl_FragCoord.w;
    float _380 = _376 * _378;
    float _382 = in.m_57.y;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = in.m_55.z;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = in.m_59.y;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = in.m_59.x;
    float _402 = gl_FragCoord.w;
    float _404 = _400 * _402;
    float _406 = in.m_59.z;
    float _408 = gl_FragCoord.w;
    float _410 = _406 * _408;
    float _412 = _156 * _156;
    float _414 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _416 = fma(_154, _154, _412);
    float _418 = precise::clamp(_416, 0.0, 1.0);
    float _420 = _92 * _362;
    float _422 = _92 * _368;
    float _424 = -_418;
    float _426 = _424 + 1.0;
    float _428 = _92 * _374;
    float _430 = _92 * _380;
    float _432 = _420 * _420;
    float _434 = _92 * _386;
    float _436 = _92 * _392;
    float _438 = _92 * _398;
    float _440 = fma(_430, _430, _432);
    float _442 = _434 * _434;
    float _444 = _92 * _404;
    float _446 = _438 * _438;
    float _448 = fma(_436, _436, _440);
    float _450 = fma(_422, _422, _442);
    float _452 = _92 * _410;
    float _454 = fma(_444, _444, _446);
    float _456 = sqrt(_426);
    float _458 = fma(_428, _428, _450);
    bool _460 = as_type<int>(_414) != 0;
    float _462 = fma(_452, _452, _454);
    float _464 = rsqrt(_448);
    float _466 = rsqrt(_458);
    float _468 = rsqrt(_462);
    float _470 = _464 * _156;
    float _472 = _420 * _470;
    float _474 = _430 * _470;
    float _476 = _466 * _154;
    float _478 = _436 * _470;
    float _480 = fma(_434, _476, _472);
    float _482 = fma(_422, _476, _474);
    float _484 = fma(_428, _476, _478);
    float _486 = _468 * _456;
    float _488 = fma(_438, _486, _480);
    float _490 = fma(_444, _486, _482);
    float _492 = fma(_452, _486, _484);
    float _494 = in.m_53.x;
    float _496 = gl_FragCoord.w;
    float _498 = _494 * _496;
    bool _500 = !_460;
    float _502 = -_488;
    float _504 = _500 ? _502 : _488;
    bool _506 = !_460;
    float _508 = -_490;
    float _510 = _506 ? _508 : _490;
    bool _512 = !_460;
    float _514 = -_492;
    float _516 = _512 ? _514 : _492;
    float _518 = _504 * _504;
    float _520 = fma(_510, _510, _518);
    float _522 = fma(_516, _516, _520);
    float _524 = rsqrt(_522);
    float _526 = _510 * _524;
    float _528 = _504 * _524;
    float _530 = _516 * _524;
    float _532 = _92 * _498;
    float _534 = abs(_526);
    float _536 = abs(_528);
    float _538 = precise::max(_534, _536);
    float _540 = abs(_530);
    float _542 = precise::max(_540, _538);
    float _544 = precise::min(_532, 1.0);
    float _546 = 1.0 / _542;
    float _548 = -_546;
    float _550 = _530 * _548;
    float _552 = _526 * _546;
    float _554 = _528 * _546;
    float3 _1443 = float3(_552, _554, _550);
    float3 _558 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1443, float3(0.0), isnan(_1443)), level(_544)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1443, float3(0.0), isnan(_1443)), level(_544)).xyz;
    float _560 = _558.x;
    float _562 = _558.y;
    float _564 = _558.z;
    float _566 = in.m_65.x;
    float _568 = gl_FragCoord.w;
    float _570 = _566 * _568;
    float _572 = in.m_65.y;
    float _574 = gl_FragCoord.w;
    float _576 = _572 * _574;
    float _578 = in.m_65.z;
    float _580 = gl_FragCoord.w;
    float _582 = _578 * _580;
    float _584 = in.m_67.z;
    float _586 = gl_FragCoord.w;
    float _588 = _584 * _586;
    float _590 = in.m_67.x;
    float _592 = gl_FragCoord.w;
    float _594 = _590 * _592;
    float _596 = in.m_67.y;
    float _598 = gl_FragCoord.w;
    float _600 = _596 * _598;
    float _602 = in.m_69.w;
    float _604 = gl_FragCoord.w;
    float _606 = _602 * _604;
    float _608 = in.m_69.z;
    float _610 = gl_FragCoord.w;
    float _612 = _608 * _610;
    float _614 = in.m_69.x;
    float _616 = gl_FragCoord.w;
    float _618 = _614 * _616;
    float _620 = in.m_69.y;
    float _622 = gl_FragCoord.w;
    float _624 = _620 * _622;
    float _626 = _196 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _628 = -_532;
    float _630 = _628 + 1.0;
    float _632 = _630 * _626;
    bool _634 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _636 = _632 * 0.02624999918043613433837890625;
    float _638 = _92 * _570;
    float _640 = _92 * _576;
    float _642 = _92 * _582;
    float _644 = _92 * _606;
    float _646 = _92 * _612;
    float _648 = _92 * _618;
    float _650 = fma(_560, 0.20999999344348907470703125, _638);
    float _652 = fma(_562, 0.20999999344348907470703125, _640);
    float _654 = fma(_564, 0.20999999344348907470703125, _642);
    float _656 = _92 * _588;
    float _658 = fma(_636, (*spvDescriptorSet0.fp_c15)._m0[17].x, _650);
    float _660 = fma(_636, (*spvDescriptorSet0.fp_c15)._m0[17].y, _652);
    float _662 = fma(_636, (*spvDescriptorSet0.fp_c15)._m0[17].z, _654);
    float _664 = _92 * _594;
    float _666 = _92 * _600;
    float _668 = _662 + _656;
    float _670 = _658 + _664;
    float _672 = _660 + _666;
    float _674 = 0.0 + _129;
    float _676 = precise::clamp(_674, 0.0, 1.0);
    float _678 = _230 * _668;
    float _680 = _232 * _670;
    float _682 = _234 * _672;
    float _684 = _92 * _624;
    float _686 = fma(_678, _644, _646);
    float _688 = fma(_680, _644, _648);
    float _690 = _646;
    if (!_634)
    {
        _690 = _676;
    }
    float _692 = _690;
    float _694 = fma(_682, _644, _684);
    bool _696 = !_634;
    float _698 = _692;
    if (!_696)
    {
        float _700 = in.m_71.w;
        float _702 = gl_FragCoord.w;
        float _704 = _700 * _702;
        float _706 = in.m_71.z;
        float _708 = gl_FragCoord.w;
        float _710 = _706 * _708;
        float _712 = _92 * _704;
        float _714 = _92 * _710;
        float _716 = 1.0 / _712;
        float _718 = _714 * _716;
        float _720 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _722 = fma(_718, (*spvDescriptorSet0.fp_c8)._m0[30].w, _720);
        float _724 = 1.0 / _722;
        float _726 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _728 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _730 = fma(_724, _726, _728);
        float _732 = _730 * 8.0;
        float _734 = precise::clamp(_732, 0.0, 1.0);
        float _736 = _676 * _734;
        _698 = _736;
    }
    float _738 = _698;
    float _740 = 0.0 + _738;
    float _742 = precise::clamp(_740, 0.0, 1.0);
    out.m_49.x = _688;
    out.m_49.y = _694;
    out.m_49.z = _686;
    out.m_49.w = _742;
    return out;
}

