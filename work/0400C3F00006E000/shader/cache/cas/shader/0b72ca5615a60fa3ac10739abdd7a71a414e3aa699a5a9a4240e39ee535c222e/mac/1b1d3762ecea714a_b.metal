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
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_56 [[user(locn7)]];
    float4 m_52 [[user(locn8)]];
    float4 m_54 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_61 [[user(locn11)]];
    float4 m_67 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_42.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_42.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_44.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = 1.0 / _76;
    float _104 = _102 * _82;
    float _106 = _102 * _88;
    float _108 = _102 * _94;
    float _110 = _102 * _100;
    float2 _855 = float2(_104, _106);
    float _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_855, float2(0.0), isnan(_855))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_855, float2(0.0), isnan(_855))).w;
    float2 _866 = float2(_108, _110);
    float2 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_866, float2(0.0), isnan(_866))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_866, float2(0.0), isnan(_866))).xw;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = in.m_46.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_48.w;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_50.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = _102 * _126;
    float _142 = _102 * _132;
    float _144 = _102 * _138;
    float _146 = in.m_44.z;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = _102 * _150;
    float _154 = _112 * _120;
    float _156 = -_154;
    float _158 = _120 + _156;
    float _160 = fma(_140, _158, _154);
    bool _164 = _160 >= _142;
    bool _166 = isnan(_160);
    bool _168 = _164 || _166;
    bool _170 = isnan(_142);
    bool _172 = _168 || _170;
    float _174 = float(_172);
    float _176 = 0.0 + _174;
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = _178 * _144;
    bool _182 = _180 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _184 = isnan(_180);
    bool _186 = _182 || _184;
    bool _188 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _190 = _186 || _188;
    float _192 = in.m_44.w;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    if (!_190)
    {
        discard_fragment();
    }
    float _198 = _102 * _196;
    float2 _985 = float2(_152, _198);
    float2 _200 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_985, float2(0.0), isnan(_985))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_985, float2(0.0), isnan(_985))).xy;
    float _202 = _200.x;
    float _204 = _200.y;
    float _206 = in.m_52.y;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_52.x;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_52.z;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_54.y;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_54.x;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_56.y;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_54.z;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_56.x;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_56.z;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = _102 * _210;
    float _262 = _102 * _216;
    float _264 = _102 * _222;
    float _266 = _260 * _260;
    float _268 = _102 * _234;
    float _270 = _102 * _240;
    float _272 = fma(_262, _262, _266);
    float _274 = _102 * _228;
    float _276 = _102 * _252;
    float _278 = _270 * _270;
    float _280 = fma(_264, _264, _272);
    float _282 = _274 * _274;
    float _284 = _102 * _246;
    float _286 = _102 * _258;
    float _288 = fma(_268, _268, _282);
    float _290 = rsqrt(_280);
    float _292 = in.m_46.z;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = fma(_284, _284, _288);
    float _300 = fma(_276, _276, _278);
    float _302 = fma(_286, _286, _300);
    float _304 = rsqrt(_298);
    float _306 = _260 * _290;
    float _308 = _262 * _290;
    float _310 = _264 * _290;
    float _312 = rsqrt(_302);
    float _314 = _306 * _306;
    float _316 = fma(_308, _308, _314);
    float _318 = fma(_310, _310, _316);
    float _320 = rsqrt(_318);
    float _322 = _286 * _312;
    float _324 = _204 * _204;
    float _326 = _312 * _204;
    float _328 = _202 * _304;
    float _330 = _204 * _322;
    float _332 = fma(_202, _202, _324);
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = _270 * _326;
    float _338 = _276 * _326;
    float _340 = fma(_284, _328, _330);
    float _342 = -_334;
    float _344 = _342 + 1.0;
    float _346 = fma(_274, _328, _336);
    float _348 = fma(_268, _328, _338);
    float _350 = in.m_46.y;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = sqrt(_344);
    float _358 = _320 * _356;
    float _360 = in.m_46.x;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = fma(_306, _358, _346);
    float _368 = fma(_308, _358, _348);
    float _370 = fma(_310, _358, _340);
    float _372 = _366 * _366;
    float _374 = fma(_368, _368, _372);
    float _376 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _378 = fma(_370, _370, _374);
    float _380 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _376);
    float _382 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _380);
    float _384 = rsqrt(_378);
    float _386 = rsqrt(_382);
    float _388 = _366 * _384;
    float _390 = _368 * _384;
    float _392 = _370 * _384;
    float _394 = _388 * (-0.816474258899688720703125);
    float _396 = _386 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _398 = -_394;
    float _400 = fma(_392, 0.577381789684295654296875, _398);
    float _402 = _386 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _404 = _388 * _396;
    float _406 = _386 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _408 = _102 * _296;
    float _410 = fma(_390, _406, _404);
    float _412 = fma(_400, 0.5, 0.5);
    float _414 = fma(_392, _402, _410);
    float _416 = _412 * _412;
    float _418 = _102 * _364;
    float _420 = fma(_414, -0.5, 0.5);
    float _422 = _102 * _354;
    float _424 = precise::max(_416, -0.5);
    float _426 = precise::max(0.0, _420);
    float _428 = precise::min(_424, 1.2000000476837158203125);
    float _430 = precise::min(_426, 1.5);
    float _432 = fma(_428, 0.58823525905609130859375, 0.294117629528045654296875);
    float _434 = fma(_430, 0.3333333432674407958984375, _432);
    float _436 = _418 * _434;
    float _438 = _422 * _434;
    float _440 = _408 * _434;
    if (!_190)
    {
        out.m_59.x = _436;
        out.m_59.y = _438;
        out.m_59.z = _440;
        out.m_59.w = _174;
        return out;
    }
    float _442 = in.m_61.w;
    float _444 = gl_FragCoord.w;
    float _446 = _442 * _444;
    float _448 = in.m_61.x;
    float _450 = gl_FragCoord.w;
    float _452 = _448 * _450;
    float _454 = _102 * _446;
    bool _456 = _454 != 1.0;
    bool _458 = isnan(_454);
    bool _460 = _456 || _458;
    bool _462 = isnan(1.0);
    bool _464 = _460 || _462;
    bool _466 = !_464;
    if (!_466)
    {
        float _468 = gl_FragCoord.x;
        float _470 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _472 = _468 / _470;
        float _474 = gl_FragCoord.y;
        float _476 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _478 = _474 / _476;
        float _480 = _454 * 256.0;
        float _482 = trunc(_480);
        int _485 = int(_482);
        float _487 = trunc(_472);
        int _489 = int(_487);
        float _491 = trunc(_478);
        int _493 = int(_491);
        int _495 = _489 + 2;
        int _497 = _495 >> 1;
        uint _500 = uint(int(uint(_493) >> uint(1)));
        int _502 = _497 ^ int(_500);
        int _504 = _502 << 16;
        int _506 = _504 ^ _497;
        int _508 = 983055 & _506;
        uint _510 = uint(int(uint(_485) >> uint(7)));
        int _512 = int(_510) + _485;
        int _514 = _508 << 6;
        int _516 = _514 + _508;
        int _518 = _516 & 13369548;
        uint _520 = uint(int(uint(_518) >> uint(3)));
        int _522 = _518 | int(_520);
        int _524 = _522 & 5570560;
        int _526 = _522 & 85;
        uint _528 = uint(int(uint(_524) >> uint(15)));
        int _530 = int(_528) + _526;
        bool _532 = uint(_512) > uint(_530);
        if (!_532)
        {
            discard_fragment();
        }
        if (!_532)
        {
            out.m_59.x = _436;
            out.m_59.y = _438;
            out.m_59.z = _440;
            out.m_59.w = _180;
            return out;
        }
    }
    float _534 = abs(_308);
    float _536 = abs(_306);
    float _538 = precise::max(_534, _536);
    float _540 = fma(_118, 0.100000001490116119384765625, _434);
    float _542 = _102 * _452;
    float _544 = abs(_310);
    float _546 = precise::max(_544, _538);
    float _548 = -_540;
    float _550 = _548 + 1.10000002384185791015625;
    float _552 = precise::clamp(_550, 0.0, 1.0);
    float _554 = _542 + _552;
    float _556 = 1.0 / _546;
    float _558 = precise::min(_554, 1.0);
    float _560 = _308 * _556;
    float _562 = _306 * _556;
    float _564 = -_556;
    float _566 = _310 * _564;
    float3 _1549 = float3(_560, _562, _566);
    float3 _570 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1549, float3(0.0), isnan(_1549)), level(_558)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1549, float3(0.0), isnan(_1549)), level(_558)).xyz;
    float _572 = _570.x;
    float _574 = _570.y;
    float _576 = _570.z;
    float _578 = in.m_48.y;
    float _580 = gl_FragCoord.w;
    float _582 = _578 * _580;
    float _584 = in.m_48.x;
    float _586 = gl_FragCoord.w;
    float _588 = _584 * _586;
    float _590 = in.m_48.z;
    float _592 = gl_FragCoord.w;
    float _594 = _590 * _592;
    float _596 = in.m_63.y;
    float _598 = gl_FragCoord.w;
    float _600 = _596 * _598;
    float _602 = in.m_63.z;
    float _604 = gl_FragCoord.w;
    float _606 = _602 * _604;
    float _608 = in.m_65.z;
    float _610 = gl_FragCoord.w;
    float _612 = _608 * _610;
    float _614 = in.m_65.x;
    float _616 = gl_FragCoord.w;
    float _618 = _614 * _616;
    float _620 = in.m_65.y;
    float _622 = gl_FragCoord.w;
    float _624 = _620 * _622;
    bool _626 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _628 = _102 * _582;
    float _630 = _102 * _588;
    float _632 = _102 * _594;
    float _634 = -_628;
    float _636 = _422 + _634;
    float _638 = -_630;
    float _640 = _418 + _638;
    float _642 = -_632;
    float _644 = _408 + _642;
    float _646 = in.m_67.w;
    float _648 = gl_FragCoord.w;
    float _650 = _646 * _648;
    float _652 = fma(_432, _636, _628);
    float _654 = fma(_432, _640, _630);
    float _656 = fma(_432, _644, _632);
    float _658 = in.m_67.x;
    float _660 = gl_FragCoord.w;
    float _662 = _658 * _660;
    float _664 = _652 * 0.3576000034809112548828125;
    float _666 = in.m_63.x;
    float _668 = gl_FragCoord.w;
    float _670 = _666 * _668;
    float _672 = in.m_67.y;
    float _674 = gl_FragCoord.w;
    float _676 = _672 * _674;
    float _678 = fma(_654, 0.10629999637603759765625, _664);
    float _680 = fma(_656, 0.0361000001430511474609375, _678);
    float _682 = in.m_67.z;
    float _684 = gl_FragCoord.w;
    float _686 = _682 * _684;
    float _688 = _102 * _606;
    float _690 = 1.0 / _680;
    float _692 = _102 * _650;
    float _694 = _690 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _696 = precise::clamp(_694, 0.0, 1.0);
    float _698 = _102 * _662;
    float _700 = fma(_696, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _702 = _102 * _600;
    float _704 = _102 * _670;
    float _706 = _654 * _700;
    float _708 = _706 * 0.5;
    float _710 = _102 * _624;
    float _712 = _652 * _700;
    float _714 = _712 * 0.5;
    float _716 = _656 * _700;
    float _718 = _716 * 0.5;
    float _720 = _102 * _686;
    float _722 = fma(_574, 0.20999999344348907470703125, _702);
    float _724 = fma(_576, 0.20999999344348907470703125, _688);
    float _726 = _102 * _612;
    float _728 = fma(_572, 0.20999999344348907470703125, _704);
    float _730 = _102 * _618;
    float _732 = _722 + _710;
    float _734 = _724 + _726;
    float _736 = _728 + _730;
    float _738 = fma(_438, _732, _714);
    float _740 = fma(_440, _734, _718);
    float _742 = 0.0 + _180;
    float _744 = precise::clamp(_742, 0.0, 1.0);
    float _746 = fma(_436, _736, _708);
    float _748 = _102 * _676;
    float _750 = fma(_740, _692, _720);
    float _752 = fma(_746, _692, _698);
    float _754 = fma(_738, _692, _748);
    bool _756 = !_626;
    float _758 = _744;
    if (!_756)
    {
        float _760 = in.m_69.w;
        float _762 = gl_FragCoord.w;
        float _764 = _760 * _762;
        float _766 = in.m_69.z;
        float _768 = gl_FragCoord.w;
        float _770 = _766 * _768;
        float _772 = _102 * _764;
        float _774 = _102 * _770;
        float _776 = 1.0 / _772;
        float _778 = _774 * _776;
        float _780 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _782 = fma(_778, (*spvDescriptorSet0.fp_c8)._m0[30].w, _780);
        float _784 = 1.0 / _782;
        float _786 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _788 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _790 = fma(_784, _786, _788);
        float _792 = _790 * 8.0;
        float _794 = precise::clamp(_792, 0.0, 1.0);
        float _796 = _744 * _794;
        _758 = _796;
    }
    float _798 = _758;
    float _800 = 0.0 + _798;
    float _802 = precise::clamp(_800, 0.0, 1.0);
    out.m_59.x = _752;
    out.m_59.y = _754;
    out.m_59.z = _750;
    out.m_59.w = _802;
    return out;
}

