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
    constant _16* fp_c13 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
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
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_44 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
    float4 m_53 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_57 [[user(locn11)]];
    float4 m_38 [[user(locn12)]];
    float4 m_63 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_38.w;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_40.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_42.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_40.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_42.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_40.y;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_42.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_40.z;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_42.z;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_44.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = 1.0 / _72;
    float _136 = _134 * _78;
    float _138 = _134 * _84;
    float _140 = _134 * _90;
    float _142 = _134 * _102;
    float _144 = _134 * _126;
    bool _148 = _136 != 1.0;
    bool _150 = isnan(_136);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = _138 * _140;
    float _160 = precise::clamp(_158, 0.0, 1.0);
    float _162 = _134 * _96;
    float _164 = _134 * _108;
    float _166 = _134 * _114;
    float _168 = _134 * _120;
    float _170 = _134 * _132;
    float _172 = _162 * _142;
    float _174 = _164 * _166;
    float _176 = _168 * _144;
    float _178 = _160 * _170;
    bool _180 = !_156;
    if (!_180)
    {
        float _182 = gl_FragCoord.x;
        float _184 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _186 = _182 / _184;
        float _188 = gl_FragCoord.y;
        float _190 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _192 = _188 / _190;
        float _194 = trunc(_186);
        int _197 = int(_194);
        float _199 = trunc(_192);
        int _201 = int(_199);
        int _203 = _197 + 2;
        int _205 = _203 >> 1;
        uint _208 = uint(int(uint(_201) >> uint(1)));
        int _210 = _205 ^ int(_208);
        int _212 = _210 << 16;
        int _214 = _212 ^ _205;
        int _216 = 983055 & _214;
        float _218 = _136 * 256.0;
        int _220 = _216 << 6;
        int _222 = _220 + _216;
        float _224 = trunc(_218);
        int _226 = int(_224);
        int _228 = _222 & 13369548;
        uint _230 = uint(int(uint(_228) >> uint(3)));
        int _232 = _228 | int(_230);
        int _234 = _232 & 5570560;
        int _236 = _232 & 85;
        uint _238 = uint(int(uint(_226) >> uint(7)));
        int _240 = int(_238) + _226;
        uint _242 = uint(int(uint(_234) >> uint(15)));
        int _244 = int(_242) + _236;
        bool _246 = uint(_240) > uint(_244);
        if (!_246)
        {
            discard_fragment();
        }
        if (!_246)
        {
            out.m_47.x = _172;
            out.m_47.y = _174;
            out.m_47.z = _176;
            out.m_47.w = _178;
            return out;
        }
    }
    float _248 = in.m_49.z;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_49.w;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = _134 * _252;
    float _262 = _134 * _258;
    float2 _945 = float2(_260, _262);
    float2 _266 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_945, float2(0.0), isnan(_945))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_945, float2(0.0), isnan(_945))).xy;
    float _268 = _266.x;
    float _270 = _266.y;
    float _272 = in.m_51.y;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_51.x;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = in.m_53.y;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = in.m_51.z;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = in.m_53.x;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_55.y;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_53.z;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = in.m_55.x;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = in.m_55.z;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = _134 * _276;
    float _328 = _134 * _282;
    float _330 = _134 * _288;
    float _332 = _134 * _294;
    float _334 = _326 * _326;
    float _336 = _134 * _300;
    float _338 = _330 * _330;
    float _340 = _134 * _306;
    float _342 = fma(_328, _328, _334);
    float _344 = _134 * _312;
    float _346 = fma(_336, _336, _338);
    float _348 = _134 * _324;
    float _350 = fma(_332, _332, _342);
    float _352 = _134 * _318;
    float _354 = _340 * _340;
    float _356 = fma(_344, _344, _346);
    float _358 = fma(_352, _352, _354);
    float _360 = rsqrt(_350);
    float _362 = fma(_348, _348, _358);
    float _364 = rsqrt(_356);
    float _366 = rsqrt(_362);
    float _368 = _270 * _270;
    float _370 = _360 * _270;
    float _372 = _364 * _268;
    float _374 = fma(_268, _268, _368);
    float _376 = precise::clamp(_374, 0.0, 1.0);
    float _378 = _326 * _370;
    float _380 = _328 * _370;
    float _382 = _332 * _370;
    float _384 = -_376;
    float _386 = _384 + 1.0;
    float _388 = fma(_330, _372, _378);
    float _390 = fma(_336, _372, _380);
    float _392 = fma(_344, _372, _382);
    float _394 = in.m_38.x;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = sqrt(_386);
    float _402 = _366 * _400;
    float _404 = fma(_340, _402, _388);
    float _406 = fma(_352, _402, _390);
    float _408 = fma(_348, _402, _392);
    float _410 = _404 * _404;
    float _412 = fma(_406, _406, _410);
    float _414 = fma(_408, _408, _412);
    float _416 = rsqrt(_414);
    float _418 = _406 * _416;
    float _420 = _404 * _416;
    float _422 = _408 * _416;
    float _424 = abs(_418);
    float _426 = abs(_420);
    float _428 = precise::max(_424, _426);
    float _430 = abs(_422);
    float _432 = precise::max(_430, _428);
    float _434 = _134 * _398;
    float _436 = 1.0 / _432;
    float _438 = -_436;
    float _440 = _422 * _438;
    float _442 = precise::min(_434, 1.0);
    float _444 = _418 * _436;
    float _446 = _420 * _436;
    float3 _1205 = float3(_444, _446, _440);
    float3 _450 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1205, float3(0.0), isnan(_1205)), level(_442)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1205, float3(0.0), isnan(_1205)), level(_442)).xyz;
    float _452 = _450.x;
    float _454 = _450.y;
    float _456 = _450.z;
    float _458 = in.m_57.x;
    float _460 = gl_FragCoord.w;
    float _462 = _458 * _460;
    float _464 = in.m_57.y;
    float _466 = gl_FragCoord.w;
    float _468 = _464 * _466;
    float _470 = in.m_59.x;
    float _472 = gl_FragCoord.w;
    float _474 = _470 * _472;
    float _476 = in.m_57.z;
    float _478 = gl_FragCoord.w;
    float _480 = _476 * _478;
    float _482 = in.m_59.y;
    float _484 = gl_FragCoord.w;
    float _486 = _482 * _484;
    float _488 = in.m_59.z;
    float _490 = gl_FragCoord.w;
    float _492 = _488 * _490;
    float _494 = in.m_61.x;
    float _496 = gl_FragCoord.w;
    float _498 = _494 * _496;
    float _500 = in.m_61.y;
    float _502 = gl_FragCoord.w;
    float _504 = _500 * _502;
    float _506 = in.m_61.z;
    float _508 = gl_FragCoord.w;
    float _510 = _506 * _508;
    float _512 = in.m_63.x;
    float _514 = gl_FragCoord.w;
    float _516 = _512 * _514;
    float _518 = in.m_63.y;
    float _520 = gl_FragCoord.w;
    float _522 = _518 * _520;
    float _524 = in.m_63.z;
    float _526 = gl_FragCoord.w;
    float _528 = _524 * _526;
    float _530 = in.m_63.w;
    float _532 = gl_FragCoord.w;
    float _534 = _530 * _532;
    float _536 = _134 * _462;
    float _538 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _540 = _538 + 1.0;
    float _542 = _134 * _468;
    float _544 = _134 * _480;
    float _546 = fma(_536, (*spvDescriptorSet0.fp_c13)._m0[0].y, _540);
    float _548 = fma(_542, (*spvDescriptorSet0.fp_c13)._m0[0].y, _540);
    float _550 = fma(_544, (*spvDescriptorSet0.fp_c13)._m0[0].y, _540);
    float _552 = _134 * _492;
    float _554 = _172 * _546;
    float _556 = precise::clamp(_554, 0.0, 1.0);
    float _558 = _174 * _548;
    float _560 = precise::clamp(_558, 0.0, 1.0);
    float _562 = _134 * _474;
    float _564 = _134 * _486;
    float _566 = _176 * _550;
    float _568 = precise::clamp(_566, 0.0, 1.0);
    float _570 = _134 * _498;
    float _572 = _134 * _510;
    float _574 = _134 * _534;
    float _576 = _134 * _522;
    float _578 = fma(_452, 0.20999999344348907470703125, _562);
    float _580 = fma(_454, 0.20999999344348907470703125, _564);
    float _582 = _134 * _504;
    float _584 = fma(_456, 0.20999999344348907470703125, _552);
    bool _586 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _588 = _578 + _570;
    float _590 = _580 + _582;
    float _592 = _584 + _572;
    float _594 = 0.0 + _178;
    float _596 = precise::clamp(_594, 0.0, 1.0);
    float _598 = _556 * _588;
    float _600 = _560 * _590;
    float _602 = _134 * _516;
    float _604 = _568 * _592;
    float _606 = _134 * _528;
    float _608 = fma(_600, _574, _576);
    float _610 = fma(_598, _574, _602);
    float _612 = fma(_604, _574, _606);
    float _614 = _602;
    if (!_586)
    {
        _614 = _596;
    }
    float _616 = _614;
    bool _618 = !_586;
    float _620 = _616;
    if (!_618)
    {
        float _622 = in.m_65.w;
        float _624 = gl_FragCoord.w;
        float _626 = _622 * _624;
        float _628 = in.m_65.z;
        float _630 = gl_FragCoord.w;
        float _632 = _628 * _630;
        float _634 = _134 * _626;
        float _636 = _134 * _632;
        float _638 = 1.0 / _634;
        float _640 = _636 * _638;
        float _642 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _644 = fma(_640, (*spvDescriptorSet0.fp_c8)._m0[30].w, _642);
        float _646 = 1.0 / _644;
        float _648 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _650 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _652 = fma(_646, _648, _650);
        float _654 = _652 * 8.0;
        float _656 = precise::clamp(_654, 0.0, 1.0);
        float _658 = _596 * _656;
        _620 = _658;
    }
    float _660 = _620;
    float _662 = 0.0 + _660;
    float _664 = precise::clamp(_662, 0.0, 1.0);
    out.m_47.x = _610;
    out.m_47.y = _608;
    out.m_47.z = _612;
    out.m_47.w = _664;
    return out;
}

