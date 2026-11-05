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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_54 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_50 [[user(locn6)]];
    float4 m_44 [[user(locn7)]];
    float4 m_48 [[user(locn8)]];
    float4 m_46 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
    float4 m_59 [[user(locn11)]];
    float4 m_65 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_40.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = 1.0 / _74;
    float _90 = _88 * _80;
    float _92 = _88 * _86;
    float2 _717 = float2(_90, _92);
    float _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_717, float2(0.0), isnan(_717))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_717, float2(0.0), isnan(_717))).w;
    float _96 = in.m_42.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_40.z;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_40.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = _88 * _100;
    float _116 = 0.0 + _94;
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = _118 * _114;
    bool _124 = _120 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _126 = isnan(_120);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _132 = _128 || _130;
    if (!_132)
    {
        discard_fragment();
    }
    float _134 = _88 * _106;
    float _136 = _88 * _112;
    float2 _788 = float2(_134, _136);
    float2 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_788, float2(0.0), isnan(_788))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_788, float2(0.0), isnan(_788))).xy;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = in.m_44.y;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_44.x;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_44.z;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_46.y;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_48.y;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_50.y;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_48.x;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_50.x;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_48.z;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_50.z;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_46.x;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_46.z;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = _88 * _150;
    float _220 = _88 * _156;
    float _222 = _88 * _162;
    float _224 = _218 * _218;
    float _226 = _88 * _174;
    float _228 = _88 * _180;
    float _230 = _88 * _186;
    float _232 = fma(_220, _220, _224);
    float _234 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _236 = _226 + _234;
    float _238 = _88 * _192;
    float _240 = _228 * _228;
    float _242 = fma(_222, _222, _232);
    float _244 = _88 * _168;
    float _246 = _88 * _198;
    float _248 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _250 = _230 + _248;
    float _252 = rsqrt(_242);
    float _254 = _236 * _236;
    float _256 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _258 = _246 + _256;
    float _260 = _88 * _210;
    float _262 = in.m_52.x;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = fma(_250, _250, _254);
    float _270 = _244 * _244;
    float _272 = in.m_54.x;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_52.z;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = _88 * _204;
    float _286 = fma(_238, _238, _240);
    float _288 = fma(_258, _258, _268);
    float _290 = _88 * _216;
    float _292 = fma(_260, _260, _270);
    float _294 = fma(_284, _284, _286);
    float _296 = rsqrt(_288);
    float _298 = _218 * _252;
    float _300 = _220 * _252;
    float _302 = _222 * _252;
    float _304 = fma(_290, _290, _292);
    float _306 = _298 * _298;
    float _308 = rsqrt(_294);
    float _310 = fma(_300, _300, _306);
    float _312 = fma(_302, _302, _310);
    float _314 = rsqrt(_304);
    float _316 = _250 * _296;
    float _318 = _236 * _296;
    float _320 = _258 * _296;
    float _322 = in.m_54.y;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = in.m_52.y;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = rsqrt(_312);
    float _336 = _284 * _308;
    float _338 = _88 * _276;
    float _340 = _88 * _282;
    float _342 = in.m_54.z;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = _88 * _332;
    float _350 = _144 * _144;
    float _352 = _308 * _144;
    float _354 = fma(_142, _142, _350);
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = _142 * _314;
    float _360 = _228 * _352;
    float _362 = _238 * _352;
    float _364 = -_356;
    float _366 = _364 + 1.0;
    float _368 = fma(_244, _358, _360);
    float _370 = fma(_260, _358, _362);
    float _372 = _144 * _336;
    float _374 = sqrt(_366);
    float _376 = _88 * _346;
    float _378 = fma(_290, _358, _372);
    float _380 = _88 * _266;
    float _382 = _334 * _374;
    float _384 = fma(_298, _382, _368);
    float _386 = fma(_300, _382, _370);
    float _388 = fma(_302, _382, _378);
    float _390 = _384 * _318;
    float _392 = fma(_386, _316, _390);
    float _394 = _388 * 0.577381789684295654296875;
    float _396 = fma(_388, _320, _392);
    float _398 = fma(_384, 0.816474258899688720703125, _394);
    float _400 = 0.0 + _384;
    float _402 = precise::clamp(_400, 0.0, 1.0);
    float _404 = _88 * _326;
    float _406 = -_380;
    float _408 = _406 + _338;
    float _410 = fma(_398, 0.5, 0.5);
    float _412 = _402 * _402;
    float _414 = -_348;
    float _416 = _414 + _404;
    float _418 = abs(_396);
    float _420 = -_418;
    float _422 = _420 + 1.0;
    float _424 = -_340;
    float _426 = _424 + _376;
    float _428 = fma(_412, _408, _380);
    float _430 = _410 * _410;
    float _432 = _422 * _422;
    float _434 = fma(_412, _416, _348);
    float _436 = fma(_412, _426, _340);
    float _438 = -_428;
    float _440 = fma(_338, 4.0, _438);
    float _442 = _430 * _432;
    float _444 = -_434;
    float _446 = fma(_404, 4.0, _444);
    float _448 = -_436;
    float _450 = fma(_376, 4.0, _448);
    float _452 = fma(_442, _440, _428);
    float _454 = precise::clamp(_452, 0.0, 1.0);
    float _456 = fma(_442, _446, _434);
    float _458 = precise::clamp(_456, 0.0, 1.0);
    float _460 = fma(_442, _450, _436);
    float _462 = precise::clamp(_460, 0.0, 1.0);
    if (!_132)
    {
        out.m_57.x = _454;
        out.m_57.y = _458;
        out.m_57.z = _462;
        out.m_57.w = _118;
        return out;
    }
    float _464 = fma(_298, _374, _368);
    float _466 = fma(_300, _374, _370);
    float _468 = fma(_302, _374, _378);
    float _470 = _464 * _464;
    float _472 = in.m_59.x;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = fma(_466, _466, _470);
    float _480 = fma(_468, _468, _478);
    float _482 = rsqrt(_480);
    float _484 = _466 * _482;
    float _486 = _464 * _482;
    float _488 = _468 * _482;
    float _490 = abs(_484);
    float _492 = abs(_486);
    float _494 = precise::max(_490, _492);
    float _496 = abs(_488);
    float _498 = precise::max(_496, _494);
    float _500 = _88 * _476;
    float _502 = 1.0 / _498;
    float _504 = _484 * _502;
    float _506 = _486 * _502;
    float _508 = -_502;
    float _510 = _488 * _508;
    float _512 = precise::min(_500, 1.0);
    float3 _1331 = float3(_504, _506, _510);
    float3 _516 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1331, float3(0.0), isnan(_1331)), level(_512)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1331, float3(0.0), isnan(_1331)), level(_512)).xyz;
    float _518 = _516.x;
    float _520 = _516.y;
    float _522 = _516.z;
    float _524 = in.m_61.y;
    float _526 = gl_FragCoord.w;
    float _528 = _524 * _526;
    float _530 = in.m_61.z;
    float _532 = gl_FragCoord.w;
    float _534 = _530 * _532;
    float _536 = in.m_61.x;
    float _538 = gl_FragCoord.w;
    float _540 = _536 * _538;
    float _542 = in.m_63.y;
    float _544 = gl_FragCoord.w;
    float _546 = _542 * _544;
    float _548 = in.m_63.z;
    float _550 = gl_FragCoord.w;
    float _552 = _548 * _550;
    float _554 = in.m_63.x;
    float _556 = gl_FragCoord.w;
    float _558 = _554 * _556;
    float _560 = in.m_65.x;
    float _562 = gl_FragCoord.w;
    float _564 = _560 * _562;
    float _566 = in.m_65.w;
    float _568 = gl_FragCoord.w;
    float _570 = _566 * _568;
    float _572 = in.m_65.y;
    float _574 = gl_FragCoord.w;
    float _576 = _572 * _574;
    float _578 = in.m_65.z;
    float _580 = gl_FragCoord.w;
    float _582 = _578 * _580;
    bool _584 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _586 = _88 * _528;
    float _588 = _88 * _534;
    float _590 = _88 * _540;
    float _592 = fma(_520, 0.20999999344348907470703125, _586);
    float _594 = fma(_522, 0.20999999344348907470703125, _588);
    float _596 = fma(_518, 0.20999999344348907470703125, _590);
    float _598 = _88 * _546;
    float _600 = _88 * _552;
    float _602 = _88 * _558;
    float _604 = _592 + _598;
    float _606 = _594 + _600;
    float _608 = _596 + _602;
    float _610 = _88 * _570;
    float _612 = _458 * _604;
    float _614 = _462 * _606;
    float _616 = _454 * _608;
    float _618 = 0.0 + _120;
    float _620 = precise::clamp(_618, 0.0, 1.0);
    float _622 = _88 * _564;
    float _624 = _88 * _576;
    float _626 = _88 * _582;
    float _628 = fma(_616, _610, _622);
    float _630 = fma(_612, _610, _624);
    float _632 = fma(_614, _610, _626);
    float _634 = _622;
    if (!_584)
    {
        _634 = _620;
    }
    float _636 = _634;
    bool _638 = !_584;
    float _640 = _636;
    if (!_638)
    {
        float _642 = in.m_67.w;
        float _644 = gl_FragCoord.w;
        float _646 = _642 * _644;
        float _648 = in.m_67.z;
        float _650 = gl_FragCoord.w;
        float _652 = _648 * _650;
        float _654 = _88 * _646;
        float _656 = _88 * _652;
        float _658 = 1.0 / _654;
        float _660 = _656 * _658;
        float _662 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _664 = fma(_660, (*spvDescriptorSet0.fp_c8)._m0[30].w, _662);
        float _666 = 1.0 / _664;
        float _668 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _670 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _672 = fma(_666, _668, _670);
        float _674 = _672 * 8.0;
        float _676 = precise::clamp(_674, 0.0, 1.0);
        float _678 = _620 * _676;
        _640 = _678;
    }
    float _680 = _640;
    float _682 = 0.0 + _680;
    float _684 = precise::clamp(_682, 0.0, 1.0);
    out.m_57.x = _628;
    out.m_57.y = _630;
    out.m_57.z = _632;
    out.m_57.w = _684;
    return out;
}

