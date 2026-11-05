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
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texturecube<float> fp_t_tcb_1E [[id(5)]];
    sampler fp_t_tcb_1ESmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_1ESmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_36 [[user(locn6)]];
    float4 m_40 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
    float4 m_42 [[user(locn9)]];
    float4 m_57 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = gl_FragCoord.w;
    float _68 = in.m_36.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_36.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_36.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_38.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = 1.0 / _66;
    float _94 = _92 * _72;
    float _96 = _92 * _78;
    float _98 = _92 * _84;
    float _100 = _94 * _94;
    float _102 = fma(_96, _96, _100);
    float _104 = in.m_38.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = fma(_98, _98, _102);
    float _112 = rsqrt(_110);
    float _114 = _96 * _112;
    float _116 = _94 * _112;
    float _118 = _98 * _112;
    float _120 = abs(_114);
    float _122 = abs(_116);
    float _124 = precise::max(_120, _122);
    float _126 = abs(_118);
    float _128 = precise::max(_126, _124);
    float _130 = _92 * _108;
    float _132 = _92 * _90;
    float _134 = 1.0 / _128;
    float2 _742 = float2(_130, _132);
    float3 _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_742, float2(0.0), isnan(_742))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_742, float2(0.0), isnan(_742))).xyz;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = _138.z;
    float _146 = -_134;
    float _148 = _118 * _146;
    float _150 = _114 * _134;
    float _152 = _116 * _134;
    float3 _771 = float3(_150, _152, _148);
    float3 _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_771, float3(0.0), isnan(_771)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_771, float3(0.0), isnan(_771)), level(0.0)).xyz;
    float _156 = _154.x;
    float _158 = _154.y;
    float _160 = _154.z;
    float _162 = in.m_40.y;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_40.x;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_40.z;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_42.w;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = _92 * _166;
    float _188 = _92 * _172;
    float _190 = _92 * _178;
    float _192 = _92 * _184;
    float _194 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _196 = _186 + _194;
    float _198 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _200 = _188 + _198;
    float _202 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _204 = _190 + _202;
    float _206 = -_188;
    float _208 = _206 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _210 = _196 * _196;
    float _212 = -_190;
    float _214 = _212 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _216 = fma(_200, _200, _210);
    float _218 = 1.0 / (*spvDescriptorSet0.fp_c8)._m0[31].x;
    float _220 = fma(_204, _204, _216);
    float _222 = _116 * _116;
    float _224 = fma(_114, _114, _222);
    float _226 = rsqrt(_220);
    float _228 = -_186;
    float _230 = _228 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _232 = fma(_118, _118, _224);
    float _234 = rsqrt(_232);
    float _236 = _196 * _226;
    float _238 = _200 * _226;
    float _240 = _204 * _226;
    float _242 = _230 * _230;
    float _244 = _236 * _236;
    float _246 = in.m_44.x;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = fma(_208, _208, _242);
    float _254 = fma(_238, _238, _244);
    float _256 = _116 * _234;
    float _258 = _114 * _234;
    float _260 = fma(_214, _214, _252);
    float _262 = fma(_240, _240, _254);
    float _264 = in.m_46.y;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_44.y;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = in.m_44.z;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = rsqrt(_262);
    float _284 = _118 * _234;
    float _286 = in.m_48.x;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = sqrt(_260);
    float _294 = in.m_46.z;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = _236 * _282;
    float _302 = _238 * _282;
    float _304 = in.m_46.x;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = _256 * _300;
    float _312 = _218 * (*spvDescriptorSet0.fp_c8)._m0[31].y;
    float _314 = _92 * _250;
    float _316 = fma(_258, _302, _310);
    float _318 = _292 * _312;
    float _320 = _240 * _282;
    float _322 = precise::max(_318, 1.0);
    float _324 = fma(_284, _320, _316);
    float _326 = _92 * _274;
    float _328 = _92 * _280;
    float _330 = precise::min(_322, 2.0);
    float _332 = abs(_324);
    float _334 = fma(_332, -1.25000011920928955078125, 1.12500011920928955078125);
    float _336 = precise::clamp(_334, 0.0, 1.0);
    float _338 = _92 * _290;
    float _340 = _330 + (-1.0);
    float _342 = fma(_336, -2.0, 3.0);
    float _344 = _336 * _336;
    float _346 = _92 * _298;
    float _348 = _340 * _192;
    float _350 = _342 * _344;
    float _352 = _92 * _268;
    bool _356 = _348 != 1.0;
    bool _358 = isnan(_348);
    bool _360 = _356 || _358;
    bool _362 = isnan(1.0);
    bool _364 = _360 || _362;
    float _366 = _92 * _308;
    float _368 = -_326;
    float _370 = _368 + _352;
    float _372 = fma(_142, 0.5, _350);
    float _374 = fma(_140, 0.5, _350);
    float _376 = fma(_144, 0.5, _350);
    float _378 = -_314;
    float _380 = _378 + _366;
    float _382 = fma(_372, _370, _326);
    float _384 = -_328;
    float _386 = _384 + _346;
    bool _388 = !_364;
    if (!_388)
    {
        float _390 = gl_FragCoord.x;
        float _392 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _394 = _390 / _392;
        float _396 = gl_FragCoord.y;
        float _398 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _400 = _396 / _398;
        float _402 = trunc(_394);
        int _405 = int(_402);
        float _407 = trunc(_400);
        int _409 = int(_407);
        int _411 = _405 + 2;
        int _413 = _411 >> 1;
        uint _416 = uint(int(uint(_409) >> uint(1)));
        int _418 = _413 ^ int(_416);
        int _420 = _418 << 16;
        int _422 = _420 ^ _413;
        int _424 = 983055 & _422;
        float _426 = _348 * 256.0;
        int _428 = _424 << 6;
        int _430 = _428 + _424;
        float _432 = trunc(_426);
        int _434 = int(_432);
        int _436 = _430 & 13369548;
        uint _438 = uint(int(uint(_436) >> uint(3)));
        int _440 = _436 | int(_438);
        int _442 = _440 & 5570560;
        int _444 = _440 & 85;
        uint _446 = uint(int(uint(_434) >> uint(7)));
        int _448 = int(_446) + _434;
        uint _450 = uint(int(uint(_442) >> uint(15)));
        int _452 = int(_450) + _444;
        bool _454 = uint(_448) > uint(_452);
        if (!_454)
        {
            discard_fragment();
        }
        if (!_454)
        {
            out.m_51.x = 0.006000000052154064178466796875;
            out.m_51.y = 0.00200000009499490261077880859375;
            out.m_51.z = 0.001000000047497451305389404296875;
            out.m_51.w = _338;
            return out;
        }
    }
    float _456 = fma(_374, _380, _314);
    float _458 = _382 * 0.715200006961822509765625;
    float _460 = in.m_53.x;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = in.m_53.y;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = in.m_53.z;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = fma(_376, _386, _328);
    float _480 = fma(_456, 0.2125999927520751953125, _458);
    float _482 = in.m_55.z;
    float _484 = gl_FragCoord.w;
    float _486 = _482 * _484;
    float _488 = in.m_55.x;
    float _490 = gl_FragCoord.w;
    float _492 = _488 * _490;
    float _494 = in.m_55.y;
    float _496 = gl_FragCoord.w;
    float _498 = _494 * _496;
    float _500 = fma(_478, 0.072200000286102294921875, _480);
    float _502 = in.m_57.w;
    float _504 = gl_FragCoord.w;
    float _506 = _502 * _504;
    float _508 = in.m_57.z;
    float _510 = gl_FragCoord.w;
    float _512 = _508 * _510;
    float _514 = in.m_57.x;
    float _516 = gl_FragCoord.w;
    float _518 = _514 * _516;
    float _520 = 1.0 / _500;
    float _522 = in.m_57.y;
    float _524 = gl_FragCoord.w;
    float _526 = _522 * _524;
    bool _528 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _530 = _520 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _532 = precise::clamp(_530, 0.0, 1.0);
    float _534 = fma(_532, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _536 = _92 * _464;
    float _538 = _92 * _470;
    float _540 = _92 * _476;
    float _542 = _456 * _534;
    float _544 = fma(_156, 0.20999999344348907470703125, _536);
    float _546 = fma(_158, 0.20999999344348907470703125, _538);
    float _548 = fma(_160, 0.20999999344348907470703125, _540);
    float _550 = _92 * _486;
    float _552 = _92 * _492;
    float _554 = _92 * _498;
    float _556 = _382 * _534;
    float _558 = _478 * _534;
    float _560 = _548 + _550;
    float _562 = _544 + _552;
    float _564 = _546 + _554;
    float _566 = 0.0 + _338;
    float _568 = precise::clamp(_566, 0.0, 1.0);
    float _570 = fma(_560, 0.001000000047497451305389404296875, _558);
    float _572 = _92 * _506;
    float _574 = _92 * _512;
    float _576 = fma(_562, 0.006000000052154064178466796875, _542);
    float _578 = fma(_564, 0.00200000009499490261077880859375, _556);
    float _580 = _92 * _518;
    float _582 = _92 * _526;
    float _584 = fma(_570, _572, _574);
    float _586 = _574;
    if (!_528)
    {
        _586 = _568;
    }
    float _588 = _586;
    float _590 = fma(_576, _572, _580);
    float _592 = fma(_578, _572, _582);
    bool _594 = !_528;
    float _596 = _588;
    if (!_594)
    {
        float _598 = in.m_59.w;
        float _600 = gl_FragCoord.w;
        float _602 = _598 * _600;
        float _604 = in.m_59.z;
        float _606 = gl_FragCoord.w;
        float _608 = _604 * _606;
        float _610 = _92 * _602;
        float _612 = _92 * _608;
        float _614 = 1.0 / _610;
        float _616 = _612 * _614;
        float _618 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _620 = fma(_616, (*spvDescriptorSet0.fp_c8)._m0[30].w, _618);
        float _622 = 1.0 / _620;
        float _624 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _626 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _628 = fma(_622, _624, _626);
        float _630 = _628 * 8.0;
        float _632 = precise::clamp(_630, 0.0, 1.0);
        float _634 = _568 * _632;
        _596 = _634;
    }
    float _636 = _596;
    float _638 = 0.0 + _636;
    float _640 = precise::clamp(_638, 0.0, 1.0);
    out.m_51.x = _590;
    out.m_51.y = _592;
    out.m_51.z = _584;
    out.m_51.w = _640;
    return out;
}

