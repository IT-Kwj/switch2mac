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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c13 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
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
    float4 m_56 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_54 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_44 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_69 [[user(locn10), flat]];
    float4 m_61 [[user(locn11)]];
    float4 m_50 [[user(locn12)]];
    float4 m_75 [[user(locn13)]];
    float4 m_67 [[user(locn14), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _82 = gl_FragCoord.w;
    float _84 = in.m_44.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = 1.0 / _82;
    float _98 = _96 * _88;
    float _100 = _96 * _94;
    float2 _779 = float2(_98, _100);
    float _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_779, float2(0.0), isnan(_779))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_779, float2(0.0), isnan(_779))).x;
    float _104 = in.m_46.w;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_48.w;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_50.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = _96 * _108;
    float _124 = _96 * _114;
    float _126 = _96 * _120;
    float _128 = in.m_44.z;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = _96 * _132;
    float _136 = -_122;
    float _138 = _136 + _102;
    float _140 = _124 * _138;
    float _142 = 0.0 + _140;
    float _144 = precise::clamp(_142, 0.0, 1.0);
    float _146 = _144 * _126;
    bool _150 = _146 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _152 = isnan(_146);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _158 = _154 || _156;
    float _160 = in.m_44.w;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _146;
    if (!_158)
    {
        discard_fragment();
    }
    float _168 = _96 * _164;
    float2 _879 = float2(_134, _168);
    float2 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_879, float2(0.0), isnan(_879))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_879, float2(0.0), isnan(_879))).xy;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = in.m_52.y;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_52.x;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_52.z;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_54.y;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_54.x;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_56.y;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_56.x;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_48.x;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_46.x;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_48.y;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_46.y;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_56.z;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = in.m_46.z;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_54.z;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_48.z;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = _96 * _182;
    float _270 = _96 * _188;
    float _272 = _96 * _194;
    float _274 = _96 * _200;
    float _276 = _268 * _268;
    float _278 = _96 * _206;
    float _280 = _274 * _274;
    float _282 = fma(_270, _270, _276);
    float _284 = _96 * _224;
    float _286 = _96 * _230;
    float _288 = fma(_278, _278, _280);
    float _290 = fma(_272, _272, _282);
    float _292 = _96 * _218;
    float _294 = _96 * _236;
    float _296 = _96 * _242;
    float _298 = _96 * _248;
    float _300 = -_284;
    float _302 = _300 + _286;
    float _304 = rsqrt(_290);
    float _306 = -_294;
    float _308 = _306 + _296;
    float _310 = _96 * _254;
    float _312 = _96 * _260;
    float _314 = fma(_102, _302, _284);
    float _316 = fma(_102, _308, _294);
    float _318 = _96 * _266;
    float _320 = fma(_312, _312, _288);
    float _322 = -_318;
    float _324 = _322 + _310;
    float _326 = rsqrt(_320);
    float _328 = fma(_102, _324, _318);
    float _330 = _270 * _304;
    float _332 = _268 * _304;
    float _334 = _272 * _304;
    float _336 = _96 * _212;
    float _338 = _336 * _336;
    float _340 = fma(_292, _292, _338);
    float _342 = fma(_298, _298, _340);
    float _344 = _332 * _332;
    float _346 = fma(_330, _330, _344);
    float _348 = rsqrt(_342);
    float _350 = fma(_334, _334, _346);
    float _352 = rsqrt(_350);
    float _354 = _298 * _348;
    float _356 = _176 * _176;
    float _358 = _176 * _348;
    float _360 = _174 * _326;
    float _362 = _176 * _354;
    float _364 = fma(_174, _174, _356);
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = _336 * _358;
    float _370 = _292 * _358;
    float _372 = fma(_312, _360, _362);
    float _374 = -_366;
    float _376 = _374 + 1.0;
    float _378 = fma(_274, _360, _368);
    float _380 = fma(_278, _360, _370);
    float _382 = abs(_330);
    float _384 = abs(_332);
    float _386 = precise::max(_382, _384);
    float _388 = sqrt(_376);
    float _390 = abs(_334);
    float _392 = precise::max(_390, _386);
    float _394 = 1.0 / _392;
    float _396 = _352 * _388;
    float _398 = fma(_332, _396, _378);
    float _400 = fma(_330, _396, _380);
    float _402 = fma(_334, _396, _372);
    float _404 = _398 * _398;
    float _406 = _330 * _394;
    float _408 = -_394;
    float _410 = _334 * _408;
    float _412 = fma(_400, _400, _404);
    float _414 = fma(_402, _402, _412);
    float _416 = rsqrt(_414);
    float _418 = _398 * _416;
    float _420 = _402 * _416;
    float _422 = _418 * (-0.816474258899688720703125);
    float _424 = -_422;
    float _426 = fma(_420, 0.577381789684295654296875, _424);
    float _428 = fma(_426, 0.5, 0.5);
    float _430 = precise::clamp(_428, 0.0, 1.0);
    float _432 = _430 * _430;
    float _434 = fma(_432, 0.699999988079071044921875, 0.300000011920928955078125);
    float _436 = _314 * _434;
    float _438 = _316 * _434;
    float _440 = _328 * _434;
    float _442 = _332 * _394;
    if (!_158)
    {
        out.m_59.x = _436;
        out.m_59.y = _438;
        out.m_59.z = _440;
        out.m_59.w = _140;
        return out;
    }
    float _444 = in.m_61.w;
    float _446 = gl_FragCoord.w;
    float _448 = _444 * _446;
    float _450 = in.m_61.y;
    float _452 = gl_FragCoord.w;
    float _454 = _450 * _452;
    float _456 = in.m_61.x;
    float _458 = gl_FragCoord.w;
    float _460 = _456 * _458;
    float _462 = in.m_63.x;
    float _464 = gl_FragCoord.w;
    float _466 = _462 * _464;
    float _468 = _96 * _448;
    float _470 = _96 * _454;
    float _472 = _96 * _460;
    float _474 = _96 * _466;
    float _476 = 1.0 / _468;
    float _478 = precise::min(_474, 1.0);
    float _480 = _470 * _476;
    float _482 = _472 * _476;
    float2 _1326 = float2(_482, _480);
    float _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1326, float2(0.0), isnan(_1326))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1326, float2(0.0), isnan(_1326))).x;
    float3 _1335 = float3(_406, _442, _410);
    float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1335, float3(0.0), isnan(_1335)), level(_478)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1335, float3(0.0), isnan(_1335)), level(_478)).xyz;
    float _490 = _488.x;
    float _492 = _488.y;
    float _494 = _488.z;
    float _496 = in.m_65.y;
    float _498 = gl_FragCoord.w;
    float _500 = _496 * _498;
    float _502 = in.m_65.x;
    float _504 = gl_FragCoord.w;
    float _506 = _502 * _504;
    float _508 = in.m_67.y;
    float _510 = in.m_67.x;
    float _512 = in.m_65.z;
    float _514 = gl_FragCoord.w;
    float _516 = _512 * _514;
    float _518 = in.m_61.z;
    float _520 = gl_FragCoord.w;
    float _522 = _518 * _520;
    float _524 = in.m_67.z;
    float _526 = in.m_69.x;
    float _528 = in.m_71.z;
    float _530 = gl_FragCoord.w;
    float _532 = _528 * _530;
    float _534 = in.m_71.y;
    float _536 = gl_FragCoord.w;
    float _538 = _534 * _536;
    float _540 = in.m_73.x;
    float _542 = gl_FragCoord.w;
    float _544 = _540 * _542;
    float _546 = in.m_73.w;
    float _548 = gl_FragCoord.w;
    float _550 = _546 * _548;
    bool _552 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _554 = _96 * _500;
    float _556 = _96 * _506;
    float _558 = in.m_75.z;
    float _560 = gl_FragCoord.w;
    float _562 = _558 * _560;
    float _564 = in.m_75.y;
    float _566 = gl_FragCoord.w;
    float _568 = _564 * _566;
    float _570 = -_508;
    float _572 = _554 + _570;
    float _574 = -_510;
    float _576 = _556 + _574;
    float _578 = _96 * _516;
    float _580 = _96 * _522;
    float _582 = _572 * _572;
    float _584 = -_524;
    float _586 = _578 + _584;
    float _588 = _580 * _476;
    float _590 = fma(_576, _576, _582);
    float _592 = in.m_75.w;
    float _594 = gl_FragCoord.w;
    float _596 = _592 * _594;
    float _598 = _526 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _600 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _602 = fma(_588, (*spvDescriptorSet0.fp_c8)._m0[30].w, _600);
    float _604 = fma(_586, _586, _590);
    float _606 = in.m_71.x;
    float _608 = gl_FragCoord.w;
    float _610 = _606 * _608;
    float _612 = _96 * _538;
    float _614 = -_604;
    float _616 = fma(_598, _598, _614);
    float _618 = 1.0 / _602;
    float _620 = precise::max(0.0, _616);
    float _622 = in.m_73.y;
    float _624 = gl_FragCoord.w;
    float _626 = _622 * _624;
    float _628 = sqrt(_620);
    float _630 = _96 * _562;
    float _632 = _96 * _626;
    float _634 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _636 = fma(_484, (*spvDescriptorSet0.fp_c8)._m0[30].w, _634);
    float _638 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _640 = _618 * _638;
    float _642 = in.m_75.x;
    float _644 = gl_FragCoord.w;
    float _646 = _642 * _644;
    float _648 = in.m_73.z;
    float _650 = gl_FragCoord.w;
    float _652 = _648 * _650;
    float _654 = fma(_494, 0.20999999344348907470703125, _630);
    float _656 = 1.0 / _636;
    float _658 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _660 = -_640;
    float _662 = fma(_656, _658, _660);
    float _664 = _628 + _662;
    float _666 = _96 * _596;
    float _668 = -_666;
    float _670 = _668 + _664;
    float _672 = _96 * _550;
    float _674 = _670 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _676 = _674 * (-1.44269502162933349609375);
    float _678 = _96 * _646;
    float _680 = _96 * _610;
    float _682 = fma(_490, 0.20999999344348907470703125, _678);
    float _684 = exp2(_676);
    float _686 = _96 * _568;
    float _688 = _96 * _532;
    float _690 = _682 + _680;
    float _692 = _96 * _544;
    float _694 = fma(_492, 0.20999999344348907470703125, _686);
    float _696 = _492;
    if (_552)
    {
        float _698 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _700 = _640 + _698;
        _696 = _700;
    }
    float _702 = _696;
    float _704 = _654 + _688;
    float _706 = _96 * _652;
    float _708 = _694 + _612;
    float _710 = _436 * _690;
    float _712 = _440 * _704;
    float _714 = _438 * _708;
    float _716 = fma(_710, _672, _692);
    float _718 = fma(_712, _672, _706);
    float _720 = -_684;
    float _722 = _720 + 1.0;
    float _724 = precise::clamp(_722, 0.0, 1.0);
    float _726 = fma(_714, _672, _632);
    float _728 = _146 * _724;
    float _730 = precise::clamp(_728, 0.0, 1.0);
    float _732 = _730;
    if (_552)
    {
        float _734 = _702 * 8.0;
        float _736 = precise::clamp(_734, 0.0, 1.0);
        _166 = _736;
    }
    float _738 = _166;
    if (_552)
    {
        float _740 = _730 * _738;
        _732 = _740;
    }
    float _742 = _732;
    float _744 = 0.0 + _742;
    float _746 = precise::clamp(_744, 0.0, 1.0);
    out.m_59.x = _716;
    out.m_59.y = _726;
    out.m_59.z = _718;
    out.m_59.w = _746;
    return out;
}

