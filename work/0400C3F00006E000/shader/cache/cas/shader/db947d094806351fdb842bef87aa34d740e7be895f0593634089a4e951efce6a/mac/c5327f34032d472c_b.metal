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
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
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
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_61 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_50 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_46 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_42.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_42.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / _72;
    float _88 = _86 * _78;
    float _90 = _86 * _84;
    float2 _727 = float2(_88, _90);
    float2 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_727, float2(0.0), isnan(_727))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_727, float2(0.0), isnan(_727))).xw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = in.m_44.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_42.w;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = _86 * _104;
    float _114 = _86 * _110;
    float _116 = 0.0 + _98;
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = _118 * _112;
    bool _124 = _120 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _126 = isnan(_120);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _132 = _128 || _130;
    float _134 = in.m_42.z;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    if (!_132)
    {
        discard_fragment();
    }
    float _140 = _86 * _138;
    float2 _802 = float2(_140, _114);
    float2 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_802, float2(0.0), isnan(_802))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_802, float2(0.0), isnan(_802))).xy;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = in.m_46.y;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_48.y;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_46.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_48.x;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_46.z;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_48.z;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_50.y;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_50.x;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_50.z;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = _86 * _152;
    float _204 = _86 * _158;
    float _206 = _86 * _164;
    float _208 = _86 * _170;
    float _210 = _202 * _202;
    float _212 = _204 * _204;
    float _214 = _86 * _176;
    float _216 = _86 * _182;
    float _218 = fma(_206, _206, _210);
    float _220 = _86 * _188;
    float _222 = fma(_208, _208, _212);
    float _224 = _86 * _200;
    float _226 = fma(_214, _214, _218);
    float _228 = _86 * _194;
    float _230 = _220 * _220;
    float _232 = fma(_216, _216, _222);
    float _234 = fma(_228, _228, _230);
    float _236 = rsqrt(_226);
    float _238 = fma(_224, _224, _234);
    float _240 = rsqrt(_232);
    float _242 = rsqrt(_238);
    float _244 = _216 * _240;
    float _246 = _224 * _242;
    float _248 = _146 * _146;
    float _250 = _240 * _146;
    float _252 = _236 * _144;
    float _254 = fma(_144, _144, _248);
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = _208 * _250;
    float _260 = _204 * _250;
    float _262 = _228 * _242;
    float _264 = -_256;
    float _266 = _264 + 1.0;
    float _268 = _220 * _242;
    float _270 = _146 * _244;
    float _272 = fma(_202, _252, _260);
    float _274 = fma(_206, _252, _258);
    float _276 = sqrt(_266);
    if (!_132)
    {
        out.m_53.x = 0.0500000007450580596923828125;
        out.m_53.y = 0.02999999932944774627685546875;
        out.m_53.z = 0.0199999995529651641845703125;
        out.m_53.w = _98;
        return out;
    }
    float _278 = fma(_268, _276, _272);
    float _280 = fma(_214, _252, _270);
    float _282 = fma(_262, _276, _274);
    float _284 = _278 * _278;
    float _286 = fma(_246, _276, _280);
    float _288 = fma(_282, _282, _284);
    float _290 = fma(_286, _286, _288);
    float _292 = rsqrt(_290);
    float _294 = _282 * _292;
    float _296 = _278 * _292;
    float _298 = _286 * _292;
    float _300 = abs(_294);
    float _302 = abs(_296);
    float _304 = precise::max(_300, _302);
    float _306 = abs(_298);
    float _308 = precise::max(_306, _304);
    float _310 = 1.0 / _308;
    float _312 = -_310;
    float _314 = _298 * _312;
    float _316 = _294 * _310;
    float _318 = _296 * _310;
    float3 _1070 = float3(_316, _318, _314);
    float3 _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1070, float3(0.0), isnan(_1070)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1070, float3(0.0), isnan(_1070)), level(0.0)).xyz;
    float _324 = _322.x;
    float _326 = _322.y;
    float _328 = _322.z;
    float _330 = in.m_55.y;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = in.m_55.x;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_55.z;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = in.m_57.y;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = in.m_57.z;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = (*spvDescriptorSet0.fp_c10)._m0[9].w + 2.0;
    float _362 = _86 * _334;
    float _364 = _86 * _340;
    float _366 = _86 * _346;
    float _368 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _370 = _362 + _368;
    float _372 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _374 = _364 + _372;
    float _376 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _378 = _366 + _376;
    float _380 = -_360;
    float _382 = _362 + _380;
    float _384 = _370 * _370;
    float _386 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _388 = _364 + _386;
    float _390 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _392 = _366 + _390;
    float _394 = _382 * _382;
    float _396 = fma(_374, _374, _384);
    float _398 = fma(_388, _388, _394);
    float _400 = fma(_378, _378, _396);
    float _402 = _268 * _268;
    float _404 = fma(_392, _392, _398);
    float _406 = fma(_262, _262, _402);
    float _408 = rsqrt(_400);
    float _410 = fma(_246, _246, _406);
    float _412 = rsqrt(_404);
    float _414 = _370 * _408;
    float _416 = _374 * _408;
    float _418 = _378 * _408;
    float _420 = _414 * _414;
    float _422 = fma(_416, _416, _420);
    float _424 = _382 * _412;
    float _426 = rsqrt(_410);
    float _428 = fma(_418, _418, _422);
    float _430 = rsqrt(_428);
    float _432 = in.m_59.y;
    float _434 = gl_FragCoord.w;
    float _436 = _432 * _434;
    float _438 = _276 * _426;
    float _440 = _392 * _412;
    float _442 = in.m_61.z;
    float _444 = gl_FragCoord.w;
    float _446 = _442 * _444;
    float _448 = fma(_268, _438, _272);
    float _450 = _388 * _412;
    float _452 = fma(_262, _438, _274);
    float _454 = fma(_246, _438, _280);
    float _456 = _414 * _430;
    float _458 = _416 * _430;
    float _460 = _418 * _430;
    float _462 = in.m_61.x;
    float _464 = gl_FragCoord.w;
    float _466 = _462 * _464;
    float _468 = _448 * _456;
    float _470 = _448 * _424;
    float _472 = in.m_59.z;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = fma(_452, _458, _468);
    float _480 = fma(_452, _450, _470);
    float _482 = in.m_61.y;
    float _484 = gl_FragCoord.w;
    float _486 = _482 * _484;
    float _488 = fma(_454, _460, _478);
    float _490 = fma(_454, _440, _480);
    float _492 = abs(_488);
    float _494 = fma(_492, 100.00009918212890625, -98.00009918212890625);
    float _496 = precise::clamp(_494, 0.0, 1.0);
    float _498 = in.m_57.x;
    float _500 = gl_FragCoord.w;
    float _502 = _498 * _500;
    float _504 = fma(_490, -1.25, 0.24999998509883880615234375);
    float _506 = precise::clamp(_504, 0.0, 1.0);
    float _508 = fma(_496, -2.0, 3.0);
    float _510 = _496 * _496;
    float _512 = fma(_506, -2.0, 3.0);
    float _514 = _506 * _506;
    float _516 = in.m_59.x;
    float _518 = gl_FragCoord.w;
    float _520 = _516 * _518;
    float _522 = _508 * _510;
    float _524 = precise::clamp(_522, 0.0, 1.0);
    float _526 = _512 * _514;
    float _528 = fma(_524, -2.0, 3.0);
    float _530 = _524 * _524;
    float _532 = _528 * _530;
    float _534 = fma(_532, 0.100000001490116119384765625, _526);
    float _536 = _86 * _476;
    float _538 = in.m_63.w;
    float _540 = gl_FragCoord.w;
    float _542 = _538 * _540;
    float _544 = _96 * _534;
    float _546 = _86 * _486;
    float _548 = _86 * _466;
    float _550 = _86 * _446;
    float _552 = in.m_63.x;
    float _554 = gl_FragCoord.w;
    float _556 = _552 * _554;
    float _558 = _546 * _544;
    float _560 = _548 * _544;
    float _562 = _550 * _544;
    float _564 = _558 * 0.715200006961822509765625;
    float _566 = in.m_63.y;
    float _568 = gl_FragCoord.w;
    float _570 = _566 * _568;
    float _572 = fma(_560, 0.2125999927520751953125, _564);
    float _574 = fma(_562, 0.072200000286102294921875, _572);
    float _576 = in.m_63.z;
    float _578 = gl_FragCoord.w;
    float _580 = _576 * _578;
    float _582 = 1.0 / _574;
    float _584 = _86 * _542;
    float _586 = _582 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _588 = precise::clamp(_586, 0.0, 1.0);
    float _590 = fma(_588, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _592 = _86 * _520;
    float _594 = _86 * _436;
    float _596 = _86 * _570;
    float _598 = _560 * _590;
    float _600 = _558 * _590;
    float _602 = _562 * _590;
    float _604 = _86 * _502;
    float _606 = _86 * _358;
    float _608 = fma(_324, 0.20999999344348907470703125, _592);
    float _610 = fma(_326, 0.20999999344348907470703125, _594);
    float _612 = fma(_328, 0.20999999344348907470703125, _536);
    float _614 = _86 * _352;
    bool _616 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _618 = _608 + _604;
    float _620 = _612 + _606;
    float _622 = _610 + _614;
    float _624 = 0.0 + _120;
    float _626 = precise::clamp(_624, 0.0, 1.0);
    float _628 = fma(_618, 0.0500000007450580596923828125, _598);
    float _630 = _86 * _556;
    float _632 = fma(_622, 0.02999999932944774627685546875, _600);
    float _634 = fma(_620, 0.0199999995529651641845703125, _602);
    float _636 = _86 * _580;
    float _638 = fma(_628, _584, _630);
    float _640 = fma(_632, _584, _596);
    float _642 = fma(_634, _584, _636);
    float _644 = _630;
    if (!_616)
    {
        _644 = _626;
    }
    float _646 = _644;
    bool _648 = !_616;
    float _650 = _646;
    if (!_648)
    {
        float _652 = in.m_65.w;
        float _654 = gl_FragCoord.w;
        float _656 = _652 * _654;
        float _658 = in.m_65.z;
        float _660 = gl_FragCoord.w;
        float _662 = _658 * _660;
        float _664 = _86 * _656;
        float _666 = _86 * _662;
        float _668 = 1.0 / _664;
        float _670 = _666 * _668;
        float _672 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _674 = fma(_670, (*spvDescriptorSet0.fp_c8)._m0[30].w, _672);
        float _676 = 1.0 / _674;
        float _678 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _680 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _682 = fma(_676, _678, _680);
        float _684 = _682 * 8.0;
        float _686 = precise::clamp(_684, 0.0, 1.0);
        float _688 = _626 * _686;
        _650 = _688;
    }
    float _690 = _650;
    float _692 = 0.0 + _690;
    float _694 = precise::clamp(_692, 0.0, 1.0);
    out.m_53.x = _638;
    out.m_53.y = _640;
    out.m_53.z = _642;
    out.m_53.w = _694;
    return out;
}

