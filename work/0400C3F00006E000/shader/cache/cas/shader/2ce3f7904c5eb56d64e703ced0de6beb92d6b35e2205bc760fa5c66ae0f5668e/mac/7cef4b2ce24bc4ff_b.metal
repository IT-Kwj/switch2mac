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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texturecube<float> fp_t_tcb_1E [[id(5)]];
    sampler fp_t_tcb_1ESmplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_1ESmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0)]];
    float4 m_42 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_49 [[user(locn8)]];
    float4 m_53 [[user(locn9)]];
    float4 m_51 [[user(locn10)]];
    float4 m_57 [[user(locn11)]];
    float4 m_36 [[user(locn12)]];
    float4 m_59 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_36.w;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_38.w;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_38.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_40.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_38.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_40.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_38.z;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_40.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_42.x;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = 1.0 / _68;
    float _132 = _130 * _74;
    float _134 = _130 * _80;
    float _136 = _130 * _86;
    float _138 = _130 * _98;
    float _140 = _130 * _122;
    bool _144 = _132 != 1.0;
    bool _146 = isnan(_132);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = _134 * _136;
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = _130 * _92;
    float _160 = _130 * _104;
    float _162 = _130 * _110;
    float _164 = _130 * _116;
    float _166 = _130 * _128;
    float _168 = _158 * _138;
    float _170 = _160 * _162;
    float _172 = _164 * _140;
    float _174 = _156 * _166;
    bool _176 = !_152;
    if (!_176)
    {
        float _178 = gl_FragCoord.x;
        float _180 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _182 = _178 / _180;
        float _184 = gl_FragCoord.y;
        float _186 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _188 = _184 / _186;
        float _190 = trunc(_182);
        int _193 = int(_190);
        float _195 = trunc(_188);
        int _197 = int(_195);
        int _199 = _193 + 2;
        int _201 = _199 >> 1;
        uint _204 = uint(int(uint(_197) >> uint(1)));
        int _206 = _201 ^ int(_204);
        int _208 = _206 << 16;
        int _210 = _208 ^ _201;
        int _212 = 983055 & _210;
        float _214 = _132 * 256.0;
        int _216 = _212 << 6;
        int _218 = _216 + _212;
        float _220 = trunc(_214);
        int _222 = int(_220);
        int _224 = _218 & 13369548;
        uint _226 = uint(int(uint(_224) >> uint(3)));
        int _228 = _224 | int(_226);
        int _230 = _228 & 5570560;
        int _232 = _228 & 85;
        uint _234 = uint(int(uint(_222) >> uint(7)));
        int _236 = int(_234) + _222;
        uint _238 = uint(int(uint(_230) >> uint(15)));
        int _240 = int(_238) + _232;
        bool _242 = uint(_236) > uint(_240);
        if (!_242)
        {
            discard_fragment();
        }
        if (!_242)
        {
            out.m_45.x = _168;
            out.m_45.y = _170;
            out.m_45.z = _172;
            out.m_45.w = _174;
            return out;
        }
    }
    float _244 = in.m_47.z;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = in.m_47.w;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = _130 * _248;
    float _258 = _130 * _254;
    float2 _895 = float2(_256, _258);
    float2 _262 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_895, float2(0.0), isnan(_895))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_895, float2(0.0), isnan(_895))).xy;
    float _264 = _262.x;
    float _266 = _262.y;
    float _268 = in.m_49.y;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = in.m_49.x;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = in.m_51.y;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = in.m_49.z;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = in.m_51.x;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = in.m_53.y;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = in.m_51.z;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = in.m_53.x;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = in.m_53.z;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = _130 * _272;
    float _324 = _130 * _278;
    float _326 = _130 * _284;
    float _328 = _130 * _290;
    float _330 = _322 * _322;
    float _332 = _130 * _296;
    float _334 = _326 * _326;
    float _336 = _130 * _302;
    float _338 = fma(_324, _324, _330);
    float _340 = _130 * _308;
    float _342 = fma(_332, _332, _334);
    float _344 = _130 * _320;
    float _346 = fma(_328, _328, _338);
    float _348 = _130 * _314;
    float _350 = _336 * _336;
    float _352 = fma(_340, _340, _342);
    float _354 = fma(_348, _348, _350);
    float _356 = rsqrt(_346);
    float _358 = fma(_344, _344, _354);
    float _360 = rsqrt(_352);
    float _362 = rsqrt(_358);
    float _364 = _266 * _266;
    float _366 = _356 * _266;
    float _368 = _360 * _264;
    float _370 = fma(_264, _264, _364);
    float _372 = precise::clamp(_370, 0.0, 1.0);
    float _374 = _322 * _366;
    float _376 = _324 * _366;
    float _378 = _328 * _366;
    float _380 = -_372;
    float _382 = _380 + 1.0;
    float _384 = fma(_326, _368, _374);
    float _386 = fma(_332, _368, _376);
    float _388 = fma(_340, _368, _378);
    float _390 = in.m_36.x;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = sqrt(_382);
    float _398 = _362 * _396;
    float _400 = fma(_336, _398, _384);
    float _402 = fma(_348, _398, _386);
    float _404 = fma(_344, _398, _388);
    float _406 = _400 * _400;
    float _408 = fma(_402, _402, _406);
    float _410 = fma(_404, _404, _408);
    float _412 = rsqrt(_410);
    float _414 = _402 * _412;
    float _416 = _400 * _412;
    float _418 = _404 * _412;
    float _420 = abs(_414);
    float _422 = abs(_416);
    float _424 = precise::max(_420, _422);
    float _426 = abs(_418);
    float _428 = precise::max(_426, _424);
    float _430 = _130 * _394;
    float _432 = 1.0 / _428;
    float _434 = -_432;
    float _436 = _418 * _434;
    float _438 = precise::min(_430, 1.0);
    float _440 = _414 * _432;
    float _442 = _416 * _432;
    float3 _1155 = float3(_440, _442, _436);
    float3 _446 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1155, float3(0.0), isnan(_1155)), level(_438)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1155, float3(0.0), isnan(_1155)), level(_438)).xyz;
    float _448 = _446.x;
    float _450 = _446.y;
    float _452 = _446.z;
    float _454 = in.m_55.y;
    float _456 = gl_FragCoord.w;
    float _458 = _454 * _456;
    float _460 = in.m_55.x;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = in.m_55.z;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = in.m_57.y;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = in.m_57.x;
    float _480 = gl_FragCoord.w;
    float _482 = _478 * _480;
    float _484 = in.m_57.z;
    float _486 = gl_FragCoord.w;
    float _488 = _484 * _486;
    float _490 = in.m_59.x;
    float _492 = gl_FragCoord.w;
    float _494 = _490 * _492;
    float _496 = in.m_59.w;
    float _498 = gl_FragCoord.w;
    float _500 = _496 * _498;
    float _502 = in.m_59.y;
    float _504 = gl_FragCoord.w;
    float _506 = _502 * _504;
    float _508 = in.m_59.z;
    float _510 = gl_FragCoord.w;
    float _512 = _508 * _510;
    bool _514 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _516 = _130 * _458;
    float _518 = _130 * _464;
    float _520 = _130 * _470;
    float _522 = fma(_450, 0.20999999344348907470703125, _516);
    float _524 = _130 * _476;
    float _526 = fma(_448, 0.20999999344348907470703125, _518);
    float _528 = fma(_452, 0.20999999344348907470703125, _520);
    float _530 = _130 * _482;
    float _532 = _130 * _488;
    float _534 = _522 + _524;
    float _536 = _130 * _512;
    float _538 = _526 + _530;
    float _540 = _528 + _532;
    float _542 = _170 * _534;
    float _544 = 0.0 + _174;
    float _546 = precise::clamp(_544, 0.0, 1.0);
    float _548 = _168 * _538;
    float _550 = _130 * _494;
    float _552 = _130 * _500;
    float _554 = _172 * _540;
    float _556 = _130 * _506;
    float _558 = fma(_548, _552, _550);
    float _560 = fma(_554, _552, _536);
    float _562 = fma(_542, _552, _556);
    float _564 = _550;
    if (!_514)
    {
        _564 = _546;
    }
    float _566 = _564;
    bool _568 = !_514;
    float _570 = _566;
    if (!_568)
    {
        float _572 = in.m_61.w;
        float _574 = gl_FragCoord.w;
        float _576 = _572 * _574;
        float _578 = in.m_61.z;
        float _580 = gl_FragCoord.w;
        float _582 = _578 * _580;
        float _584 = _130 * _576;
        float _586 = _130 * _582;
        float _588 = 1.0 / _584;
        float _590 = _586 * _588;
        float _592 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _594 = fma(_590, (*spvDescriptorSet0.fp_c8)._m0[30].w, _592);
        float _596 = 1.0 / _594;
        float _598 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _600 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _602 = fma(_596, _598, _600);
        float _604 = _602 * 8.0;
        float _606 = precise::clamp(_604, 0.0, 1.0);
        float _608 = _546 * _606;
        _570 = _608;
    }
    float _610 = _570;
    float _612 = 0.0 + _610;
    float _614 = precise::clamp(_612, 0.0, 1.0);
    out.m_45.x = _558;
    out.m_45.y = _562;
    out.m_45.z = _560;
    out.m_45.w = _614;
    return out;
}

