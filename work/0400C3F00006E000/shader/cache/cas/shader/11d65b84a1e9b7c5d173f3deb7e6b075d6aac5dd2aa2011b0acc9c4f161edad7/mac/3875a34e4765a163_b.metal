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
    float2 _831 = float2(_104, _106);
    float _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_831, float2(0.0), isnan(_831))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_831, float2(0.0), isnan(_831))).w;
    float2 _842 = float2(_108, _110);
    float2 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_842, float2(0.0), isnan(_842))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_842, float2(0.0), isnan(_842))).xw;
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
    float2 _961 = float2(_152, _198);
    float2 _200 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_961, float2(0.0), isnan(_961))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_961, float2(0.0), isnan(_961))).xy;
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
    float _260 = in.m_46.y;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = in.m_46.z;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = _102 * _210;
    float _274 = _102 * _216;
    float _276 = _102 * _222;
    float _278 = _272 * _272;
    float _280 = _102 * _234;
    float _282 = _102 * _240;
    float _284 = fma(_274, _274, _278);
    float _286 = _102 * _228;
    float _288 = _102 * _252;
    float _290 = _282 * _282;
    float _292 = fma(_276, _276, _284);
    float _294 = _286 * _286;
    float _296 = _102 * _246;
    float _298 = _102 * _258;
    float _300 = fma(_280, _280, _294);
    float _302 = rsqrt(_292);
    float _304 = in.m_46.x;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = fma(_296, _296, _300);
    float _312 = fma(_288, _288, _290);
    float _314 = fma(_298, _298, _312);
    float _316 = rsqrt(_310);
    float _318 = _272 * _302;
    float _320 = _274 * _302;
    float _322 = _276 * _302;
    float _324 = rsqrt(_314);
    float _326 = _318 * _318;
    float _328 = fma(_320, _320, _326);
    float _330 = fma(_322, _322, _328);
    float _332 = rsqrt(_330);
    float _334 = _298 * _324;
    float _336 = _204 * _204;
    float _338 = _324 * _204;
    float _340 = _202 * _316;
    float _342 = _204 * _334;
    float _344 = fma(_202, _202, _336);
    float _346 = precise::clamp(_344, 0.0, 1.0);
    float _348 = _282 * _338;
    float _350 = _288 * _338;
    float _352 = fma(_296, _340, _342);
    float _354 = -_346;
    float _356 = _354 + 1.0;
    float _358 = fma(_286, _340, _348);
    float _360 = fma(_280, _340, _350);
    float _362 = in.m_48.z;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = in.m_48.y;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = sqrt(_356);
    float _376 = _332 * _374;
    float _378 = in.m_48.x;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = fma(_318, _376, _358);
    float _386 = fma(_320, _376, _360);
    float _388 = fma(_322, _376, _352);
    float _390 = _384 * _384;
    float _392 = fma(_386, _386, _390);
    float _394 = _102 * _372;
    float _396 = _102 * _264;
    float _398 = fma(_388, _388, _392);
    float _400 = -_394;
    float _402 = _400 + _396;
    float _404 = rsqrt(_398);
    float _406 = _102 * _382;
    float _408 = _384 * _404;
    float _410 = _388 * _404;
    float _412 = _408 * (-0.816474258899688720703125);
    float _414 = -_412;
    float _416 = fma(_410, 0.577381789684295654296875, _414);
    float _418 = _102 * _308;
    float _420 = fma(_416, 0.5, 0.5);
    float _422 = _102 * _366;
    float _424 = _102 * _270;
    float _426 = -_406;
    float _428 = _426 + _418;
    float _430 = _420 * _420;
    float _432 = -_422;
    float _434 = _432 + _424;
    float _436 = fma(_430, _428, _406);
    float _438 = fma(_430, _402, _394);
    float _440 = fma(_430, _434, _422);
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
    float _454 = _386 * _404;
    float _456 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _458 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _456);
    float _460 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _458);
    float _462 = rsqrt(_460);
    float _464 = _102 * _446;
    float _466 = _462 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _468 = _462 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    bool _470 = _464 != 1.0;
    bool _472 = isnan(_464);
    bool _474 = _470 || _472;
    bool _476 = isnan(1.0);
    bool _478 = _474 || _476;
    float _480 = _408 * _466;
    float _482 = fma(_454, _468, _480);
    bool _484 = !_478;
    if (!_484)
    {
        float _486 = gl_FragCoord.x;
        float _488 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _490 = _486 / _488;
        float _492 = gl_FragCoord.y;
        float _494 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _496 = _492 / _494;
        float _498 = trunc(_490);
        int _501 = int(_498);
        float _503 = trunc(_496);
        int _505 = int(_503);
        int _507 = _501 + 2;
        int _509 = _507 >> 1;
        uint _512 = uint(int(uint(_505) >> uint(1)));
        int _514 = _509 ^ int(_512);
        int _516 = _514 << 16;
        int _518 = _516 ^ _509;
        int _520 = 983055 & _518;
        float _522 = _464 * 256.0;
        int _524 = _520 << 6;
        int _526 = _524 + _520;
        float _528 = trunc(_522);
        int _530 = int(_528);
        int _532 = _526 & 13369548;
        uint _534 = uint(int(uint(_532) >> uint(3)));
        int _536 = _532 | int(_534);
        int _538 = _536 & 5570560;
        int _540 = _536 & 85;
        uint _542 = uint(int(uint(_530) >> uint(7)));
        int _544 = int(_542) + _530;
        uint _546 = uint(int(uint(_538) >> uint(15)));
        int _548 = int(_546) + _540;
        bool _550 = uint(_544) > uint(_548);
        if (!_550)
        {
            discard_fragment();
        }
        if (!_550)
        {
            out.m_59.x = _436;
            out.m_59.y = _438;
            out.m_59.z = _440;
            out.m_59.w = _180;
            return out;
        }
    }
    float _552 = _462 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _554 = -_430;
    float _556 = _554 + 1.0;
    float _558 = abs(_320);
    float _560 = abs(_318);
    float _562 = precise::max(_558, _560);
    float _564 = fma(_410, _552, _482);
    float _566 = -_118;
    float _568 = _566 + 1.0;
    float _570 = -_556;
    float _572 = fma(_570, (*spvDescriptorSet0.fp_c9)._m0[191].y, 1.0);
    float _574 = abs(_322);
    float _576 = precise::max(_574, _562);
    float _578 = fma(_564, -0.5, 0.5);
    float _580 = _102 * _452;
    float _582 = fma(_578, (*spvDescriptorSet0.fp_c9)._m0[191].z, _572);
    float _584 = precise::clamp(_582, 0.0, 1.0);
    float _586 = 1.0 / _576;
    float _588 = -_584;
    float _590 = _588 + 1.0;
    float _592 = fma(_568, (*spvDescriptorSet0.fp_c9)._m0[191].x, _590);
    float _594 = precise::clamp(_592, 0.0, 1.0);
    float _596 = _580 + _594;
    float _598 = _320 * _586;
    float _600 = _318 * _586;
    float _602 = -_586;
    float _604 = _322 * _602;
    float _606 = precise::min(_596, 1.0);
    float3 _1577 = float3(_598, _600, _604);
    float3 _610 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1577, float3(0.0), isnan(_1577)), level(_606)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1577, float3(0.0), isnan(_1577)), level(_606)).xyz;
    float _612 = _610.x;
    float _614 = _610.y;
    float _616 = _610.z;
    float _618 = in.m_63.z;
    float _620 = gl_FragCoord.w;
    float _622 = _618 * _620;
    float _624 = in.m_63.x;
    float _626 = gl_FragCoord.w;
    float _628 = _624 * _626;
    float _630 = in.m_63.y;
    float _632 = gl_FragCoord.w;
    float _634 = _630 * _632;
    float _636 = in.m_65.z;
    float _638 = gl_FragCoord.w;
    float _640 = _636 * _638;
    float _642 = in.m_65.x;
    float _644 = gl_FragCoord.w;
    float _646 = _642 * _644;
    float _648 = in.m_65.y;
    float _650 = gl_FragCoord.w;
    float _652 = _648 * _650;
    float _654 = in.m_67.x;
    float _656 = gl_FragCoord.w;
    float _658 = _654 * _656;
    float _660 = in.m_67.w;
    float _662 = gl_FragCoord.w;
    float _664 = _660 * _662;
    float _666 = in.m_67.y;
    float _668 = gl_FragCoord.w;
    float _670 = _666 * _668;
    float _672 = in.m_67.z;
    float _674 = gl_FragCoord.w;
    float _676 = _672 * _674;
    bool _678 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _680 = _102 * _622;
    float _682 = _102 * _628;
    float _684 = _102 * _634;
    float _686 = fma(_616, 0.20999999344348907470703125, _680);
    float _688 = fma(_612, 0.20999999344348907470703125, _682);
    float _690 = _102 * _640;
    float _692 = fma(_614, 0.20999999344348907470703125, _684);
    float _694 = _102 * _646;
    float _696 = _102 * _652;
    float _698 = _686 + _690;
    float _700 = _688 + _694;
    float _702 = _692 + _696;
    float _704 = _440 * _698;
    float _706 = 0.0 + _180;
    float _708 = precise::clamp(_706, 0.0, 1.0);
    float _710 = _436 * _700;
    float _712 = _102 * _658;
    float _714 = _102 * _664;
    float _716 = _438 * _702;
    float _718 = _102 * _670;
    float _720 = _102 * _676;
    float _722 = fma(_710, _714, _712);
    float _724 = _712;
    if (!_678)
    {
        _724 = _708;
    }
    float _726 = _724;
    float _728 = fma(_716, _714, _718);
    float _730 = fma(_704, _714, _720);
    bool _732 = !_678;
    float _734 = _726;
    if (!_732)
    {
        float _736 = in.m_69.w;
        float _738 = gl_FragCoord.w;
        float _740 = _736 * _738;
        float _742 = in.m_69.z;
        float _744 = gl_FragCoord.w;
        float _746 = _742 * _744;
        float _748 = _102 * _740;
        float _750 = _102 * _746;
        float _752 = 1.0 / _748;
        float _754 = _750 * _752;
        float _756 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _758 = fma(_754, (*spvDescriptorSet0.fp_c8)._m0[30].w, _756);
        float _760 = 1.0 / _758;
        float _762 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _764 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _766 = fma(_760, _762, _764);
        float _768 = _766 * 8.0;
        float _770 = precise::clamp(_768, 0.0, 1.0);
        float _772 = _708 * _770;
        _734 = _772;
    }
    float _774 = _734;
    float _776 = 0.0 + _774;
    float _778 = precise::clamp(_776, 0.0, 1.0);
    out.m_59.x = _722;
    out.m_59.y = _728;
    out.m_59.z = _730;
    out.m_59.w = _778;
    return out;
}

