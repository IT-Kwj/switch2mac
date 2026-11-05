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
    float _102 = in.m_38.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = fma(_96, _96, _100);
    float _110 = fma(_98, _98, _108);
    float _112 = rsqrt(_110);
    float _114 = _96 * _112;
    float _116 = _94 * _112;
    float _118 = _98 * _112;
    float _120 = _92 * _106;
    float _122 = abs(_114);
    float _124 = abs(_116);
    float _126 = precise::max(_122, _124);
    float _128 = abs(_118);
    float _130 = precise::max(_128, _126);
    float _132 = _92 * _90;
    float _134 = 1.0 / _130;
    float2 _708 = float2(_120, _132);
    float3 _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_708, float2(0.0), isnan(_708))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_708, float2(0.0), isnan(_708))).xyz;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = _138.z;
    float _146 = -_134;
    float _148 = _118 * _146;
    float _150 = _114 * _134;
    float _152 = _116 * _134;
    float3 _737 = float3(_150, _152, _148);
    float3 _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_737, float3(0.0), isnan(_737)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_737, float3(0.0), isnan(_737)), level(0.0)).xyz;
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
    float _180 = _116 * _116;
    float _182 = in.m_42.w;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_44.y;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_46.y;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = _92 * _166;
    float _202 = _92 * _172;
    float _204 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _206 = _200 + _204;
    float _208 = _92 * _178;
    float _210 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _212 = _202 + _210;
    float _214 = _92 * _198;
    float _216 = _206 * _206;
    float _218 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _220 = _208 + _218;
    float _222 = fma(_212, _212, _216);
    float _224 = fma(_220, _220, _222);
    float _226 = rsqrt(_224);
    float _228 = _206 * _226;
    float _230 = _212 * _226;
    float _232 = fma(_114, _114, _180);
    float _234 = _220 * _226;
    float _236 = _228 * _228;
    float _238 = in.m_44.x;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = fma(_118, _118, _232);
    float _246 = fma(_230, _230, _236);
    float _248 = rsqrt(_244);
    float _250 = fma(_234, _234, _246);
    float _252 = in.m_46.x;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = rsqrt(_250);
    float _260 = in.m_46.z;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = _116 * _248;
    float _268 = _114 * _248;
    float _270 = _118 * _248;
    float _272 = _228 * _258;
    float _274 = _230 * _258;
    float _276 = in.m_44.z;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = _234 * _258;
    float _284 = _266 * _272;
    float _286 = _92 * _186;
    float _288 = fma(_268, _274, _284);
    float _290 = _92 * _192;
    float _292 = in.m_48.x;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    bool _300 = _286 != 1.0;
    bool _302 = isnan(_286);
    bool _304 = _300 || _302;
    bool _306 = isnan(1.0);
    bool _308 = _304 || _306;
    float _310 = fma(_270, _282, _288);
    float _312 = -_290;
    float _314 = _312 + _214;
    float _316 = _92 * _256;
    float _318 = abs(_310);
    float _320 = fma(_318, -1.25000011920928955078125, 1.12500011920928955078125);
    float _322 = precise::clamp(_320, 0.0, 1.0);
    float _324 = fma(_322, -2.0, 3.0);
    float _326 = _322 * _322;
    float _328 = _92 * _242;
    float _330 = _324 * _326;
    float _332 = _92 * _280;
    float _334 = _92 * _296;
    float _336 = fma(_142, 0.5, _330);
    float _338 = _92 * _264;
    float _340 = fma(_140, 0.5, _330);
    float _342 = fma(_144, 0.5, _330);
    float _344 = fma(_336, _314, _290);
    float _346 = -_328;
    float _348 = _346 + _316;
    float _350 = -_332;
    float _352 = _350 + _338;
    bool _354 = !_308;
    if (!_354)
    {
        float _356 = gl_FragCoord.x;
        float _358 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _360 = _356 / _358;
        float _362 = gl_FragCoord.y;
        float _364 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _366 = _362 / _364;
        float _368 = trunc(_360);
        int _371 = int(_368);
        float _373 = trunc(_366);
        int _375 = int(_373);
        int _377 = _371 + 2;
        int _379 = _377 >> 1;
        uint _382 = uint(int(uint(_375) >> uint(1)));
        int _384 = _379 ^ int(_382);
        int _386 = _384 << 16;
        int _388 = _386 ^ _379;
        int _390 = 983055 & _388;
        float _392 = _286 * 256.0;
        int _394 = _390 << 6;
        int _396 = _394 + _390;
        float _398 = trunc(_392);
        int _400 = int(_398);
        int _402 = _396 & 13369548;
        uint _404 = uint(int(uint(_402) >> uint(3)));
        int _406 = _402 | int(_404);
        int _408 = _406 & 5570560;
        int _410 = _406 & 85;
        uint _412 = uint(int(uint(_400) >> uint(7)));
        int _414 = int(_412) + _400;
        uint _416 = uint(int(uint(_408) >> uint(15)));
        int _418 = int(_416) + _410;
        bool _420 = uint(_414) > uint(_418);
        if (!_420)
        {
            discard_fragment();
        }
        if (!_420)
        {
            out.m_51.x = 0.006000000052154064178466796875;
            out.m_51.y = 0.00200000009499490261077880859375;
            out.m_51.z = 0.001000000047497451305389404296875;
            out.m_51.w = _334;
            return out;
        }
    }
    float _422 = fma(_340, _348, _328);
    float _424 = _344 * 0.715200006961822509765625;
    float _426 = in.m_53.y;
    float _428 = gl_FragCoord.w;
    float _430 = _426 * _428;
    float _432 = in.m_53.z;
    float _434 = gl_FragCoord.w;
    float _436 = _432 * _434;
    float _438 = in.m_53.x;
    float _440 = gl_FragCoord.w;
    float _442 = _438 * _440;
    float _444 = fma(_342, _352, _332);
    float _446 = fma(_422, 0.2125999927520751953125, _424);
    float _448 = in.m_55.z;
    float _450 = gl_FragCoord.w;
    float _452 = _448 * _450;
    float _454 = in.m_55.x;
    float _456 = gl_FragCoord.w;
    float _458 = _454 * _456;
    float _460 = in.m_55.y;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = fma(_444, 0.072200000286102294921875, _446);
    float _468 = in.m_57.w;
    float _470 = gl_FragCoord.w;
    float _472 = _468 * _470;
    float _474 = in.m_57.z;
    float _476 = gl_FragCoord.w;
    float _478 = _474 * _476;
    float _480 = in.m_57.x;
    float _482 = gl_FragCoord.w;
    float _484 = _480 * _482;
    float _486 = 1.0 / _466;
    float _488 = in.m_57.y;
    float _490 = gl_FragCoord.w;
    float _492 = _488 * _490;
    bool _494 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _496 = _486 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _498 = precise::clamp(_496, 0.0, 1.0);
    float _500 = fma(_498, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _502 = _92 * _430;
    float _504 = _92 * _436;
    float _506 = _92 * _442;
    float _508 = _344 * _500;
    float _510 = fma(_158, 0.20999999344348907470703125, _502);
    float _512 = fma(_160, 0.20999999344348907470703125, _504);
    float _514 = _92 * _452;
    float _516 = fma(_156, 0.20999999344348907470703125, _506);
    float _518 = _92 * _458;
    float _520 = _92 * _464;
    float _522 = _422 * _500;
    float _524 = _444 * _500;
    float _526 = _512 + _514;
    float _528 = _516 + _518;
    float _530 = _510 + _520;
    float _532 = 0.0 + _334;
    float _534 = precise::clamp(_532, 0.0, 1.0);
    float _536 = fma(_526, 0.001000000047497451305389404296875, _524);
    float _538 = _92 * _472;
    float _540 = _92 * _478;
    float _542 = fma(_528, 0.006000000052154064178466796875, _522);
    float _544 = fma(_530, 0.00200000009499490261077880859375, _508);
    float _546 = _92 * _484;
    float _548 = _92 * _492;
    float _550 = fma(_536, _538, _540);
    float _552 = _540;
    if (!_494)
    {
        _552 = _534;
    }
    float _554 = _552;
    float _556 = fma(_542, _538, _546);
    float _558 = fma(_544, _538, _548);
    bool _560 = !_494;
    float _562 = _554;
    if (!_560)
    {
        float _564 = in.m_59.w;
        float _566 = gl_FragCoord.w;
        float _568 = _564 * _566;
        float _570 = in.m_59.z;
        float _572 = gl_FragCoord.w;
        float _574 = _570 * _572;
        float _576 = _92 * _568;
        float _578 = _92 * _574;
        float _580 = 1.0 / _576;
        float _582 = _578 * _580;
        float _584 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _586 = fma(_582, (*spvDescriptorSet0.fp_c8)._m0[30].w, _584);
        float _588 = 1.0 / _586;
        float _590 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _592 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _594 = fma(_588, _590, _592);
        float _596 = _594 * 8.0;
        float _598 = precise::clamp(_596, 0.0, 1.0);
        float _600 = _534 * _598;
        _562 = _600;
    }
    float _602 = _562;
    float _604 = 0.0 + _602;
    float _606 = precise::clamp(_604, 0.0, 1.0);
    out.m_51.x = _556;
    out.m_51.y = _558;
    out.m_51.z = _550;
    out.m_51.w = _606;
    return out;
}

