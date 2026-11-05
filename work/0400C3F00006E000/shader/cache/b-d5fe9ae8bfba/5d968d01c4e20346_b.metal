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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_34 [[id(11)]];
    sampler fp_t_tcb_34Smplr [[id(12)]];
    texturecube<float> fp_t_tcb_1E [[id(13)]];
    sampler fp_t_tcb_1ESmplr [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    sampler fp_t_tcb_8Smplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    sampler fp_t_tcb_CSmplr_w [[id(18)]];
    sampler fp_t_tcb_34Smplr_w [[id(19)]];
    sampler fp_t_tcb_1ESmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_67 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_54 [[user(locn5)]];
    float4 m_56 [[user(locn6)]];
    float4 m_58 [[user(locn7)]];
    float4 m_62 [[user(locn8)]];
    float4 m_60 [[user(locn9)]];
    float4 m_64 [[user(locn10)]];
    float4 m_71 [[user(locn11)]];
    float4 m_69 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _80 = gl_FragCoord.w;
    float _82 = in.m_46.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_46.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_46.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_48.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_48.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_48.z;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_48.w;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = 1.0 / _80;
    float _126 = _124 * _86;
    float _128 = _124 * _92;
    float _130 = _124 * _98;
    float _132 = _124 * _104;
    float _134 = _124 * _110;
    float _136 = _124 * _116;
    float _138 = 1.0 / _126;
    float _140 = _124 * _122;
    float _142 = _128 * _138;
    float _144 = _130 * _138;
    float2 _712 = float2(_144, _142);
    float _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_712, float2(0.0), isnan(_712))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_712, float2(0.0), isnan(_712))).x;
    float2 _723 = float2(_132, _134);
    float _148 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_723, float2(0.0), isnan(_723))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_723, float2(0.0), isnan(_723))).w;
    float2 _731 = float2(_136, _140);
    float _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_731, float2(0.0), isnan(_731))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_731, float2(0.0), isnan(_731))).w;
    float _152 = in.m_46.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_50.w;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_52.w;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_54.x;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _178 = _124 * _156;
    float _180 = _124 * _162;
    float _182 = _178 * _138;
    float _184 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _186 = fma(_182, (*spvDescriptorSet0.fp_c8)._m0[30].w, _184);
    float _188 = 1.0 / _186;
    float _190 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _192 = _188 * _190;
    float _194 = in.m_56.y;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = _124 * _198;
    float _202 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _204 = fma(_146, (*spvDescriptorSet0.fp_c8)._m0[30].w, _202);
    float _206 = -_180;
    float _208 = fma(_148, _150, _206);
    float _210 = _124 * _168;
    float _212 = 1.0 / _204;
    float _214 = _208 * _210;
    float _216 = 0.0 + _214;
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _222 = -_192;
    float _224 = fma(_212, _220, _222);
    float _226 = _224 * _176;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = _124 * _174;
    float _232 = _218 * _228;
    float _234 = _232 * _230;
    bool _238 = _234 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _240 = isnan(_234);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _246 = _242 || _244;
    float _248 = in.m_56.x;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_58.x;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_58.y;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = _192;
    if (!_246)
    {
        discard_fragment();
    }
    float _268 = _124 * _252;
    float _270 = _124 * _258;
    float _272 = _124 * _264;
    float2 _909 = float2(_268, _200);
    float2 _276 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_909, float2(0.0), isnan(_909))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_909, float2(0.0), isnan(_909))).xy;
    float _278 = _276.x;
    float _280 = _276.y;
    float2 _921 = float2(_270, _272);
    float2 _282 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_921, float2(0.0), isnan(_921))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_921, float2(0.0), isnan(_921))).xy;
    float _284 = _282.x;
    float _286 = _282.y;
    float _288 = in.m_60.y;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_60.x;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_60.z;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = in.m_62.y;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_62.x;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_62.z;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = in.m_64.y;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = in.m_64.x;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = in.m_64.z;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = _124 * _292;
    float _344 = _124 * _298;
    float _346 = _124 * _304;
    float _348 = _124 * _310;
    float _350 = _342 * _342;
    float _352 = _124 * _316;
    float _354 = _124 * _322;
    float _356 = _124 * _328;
    float _358 = fma(_344, _344, _350);
    float _360 = _124 * _334;
    float _362 = _124 * _340;
    float _364 = _356 * _356;
    float _366 = fma(_346, _346, _358);
    float _368 = fma(_360, _360, _364);
    float _370 = rsqrt(_366);
    float _372 = fma(_362, _362, _368);
    float _374 = _344 * _370;
    float _376 = _342 * _370;
    float _378 = _346 * _370;
    float _380 = _348 * _348;
    float _382 = fma(_352, _352, _380);
    float _384 = fma(_354, _354, _382);
    float _386 = rsqrt(_384);
    if (!_246)
    {
        out.m_67.x = 0.0500000007450580596923828125;
        out.m_67.y = 0.0;
        out.m_67.z = 0.0;
        out.m_67.w = _214;
        return out;
    }
    float _388 = _280 * _280;
    float _390 = rsqrt(_372);
    float _392 = _348 * _386;
    float _394 = fma(_278, _278, _388);
    float _396 = precise::clamp(_394, 0.0, 1.0);
    float _398 = _280 * _392;
    float _400 = -_396;
    float _402 = _400 + 1.0;
    float _404 = sqrt(_402);
    float _406 = _356 * _390;
    float _408 = _280 * _386;
    float _410 = _278 * _390;
    float _412 = fma(_278, _406, _398);
    float _414 = _352 * _408;
    float _416 = _354 * _408;
    float _418 = fma(_360, _410, _414);
    float _420 = fma(_362, _410, _416);
    float _422 = fma(_376, _404, _412);
    float _424 = fma(_374, _404, _418);
    float _426 = fma(_378, _404, _420);
    float _428 = _422 * _422;
    float _430 = fma(_424, _424, _428);
    float _432 = fma(_426, _426, _430);
    float _434 = rsqrt(_432);
    float _436 = _424 * _434;
    float _438 = _422 * _434;
    float _440 = _426 * _434;
    float _442 = abs(_436);
    float _444 = abs(_438);
    float _446 = precise::max(_442, _444);
    float _448 = abs(_440);
    float _450 = precise::max(_448, _446);
    float _452 = 1.0 / _450;
    float _454 = -_452;
    float _456 = _440 * _454;
    float _458 = _436 * _452;
    float _460 = _438 * _452;
    float3 _1191 = float3(_458, _460, _456);
    float _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1191, float3(0.0), isnan(_1191)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1191, float3(0.0), isnan(_1191)), level(0.0)).x;
    float _464 = -_280;
    float _466 = _464 + _286;
    float _468 = -_278;
    float _470 = _468 + _284;
    float _472 = _376 * _376;
    float _474 = fma(_466, 0.20000000298023223876953125, _280);
    float _476 = fma(_470, 0.20000000298023223876953125, _278);
    float _478 = fma(_374, _374, _472);
    float _480 = in.m_69.w;
    float _482 = gl_FragCoord.w;
    float _484 = _480 * _482;
    float _486 = _474 * _474;
    float _488 = _474 * _392;
    float _490 = fma(_378, _378, _478);
    float _492 = in.m_69.y;
    float _494 = gl_FragCoord.w;
    float _496 = _492 * _494;
    float _498 = fma(_476, _476, _486);
    float _500 = precise::clamp(_498, 0.0, 1.0);
    float _502 = fma(_476, _406, _488);
    float _504 = rsqrt(_490);
    float _506 = in.m_69.z;
    float _508 = gl_FragCoord.w;
    float _510 = _506 * _508;
    float _512 = -_500;
    float _514 = _512 + 1.0;
    bool _516 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _518 = sqrt(_514);
    float _520 = in.m_69.x;
    float _522 = gl_FragCoord.w;
    float _524 = _520 * _522;
    float _526 = _376 * _504;
    float _528 = in.m_71.x;
    float _530 = gl_FragCoord.w;
    float _532 = _528 * _530;
    if (_516)
    {
        float _534 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _536 = _192 + _534;
        _266 = _536;
    }
    float _538 = _266;
    float _540 = fma(_526, _518, _502);
    float _542 = _124 * _484;
    float _544 = in.m_73.x;
    float _546 = gl_FragCoord.w;
    float _548 = _544 * _546;
    float _550 = fma(_540, -0.5, 0.5);
    float _552 = _550 * _550;
    float _554 = _550 * _552;
    float _556 = _554 * 2.1456000804901123046875;
    float _558 = fma(_554, 14.94999980926513671875, 0.0500000007450580596923828125);
    float _560 = fma(_558, 0.2125999927520751953125, _556);
    float _562 = fma(_554, 0.05415000021457672119140625, _560);
    float _564 = 1.0 / _562;
    float _566 = _124 * _548;
    float _568 = _124 * _510;
    float _570 = _564 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _572 = precise::clamp(_570, 0.0, 1.0);
    float _574 = fma(_572, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _576 = _554 * _574;
    float _578 = _124 * _496;
    float _580 = _558 * _574;
    float _582 = _124 * _524;
    float _584 = _542 * _576;
    float _586 = fma(_584, 3.0, _578);
    float _588 = fma(_584, 0.75, _568);
    float _590 = _124 * _532;
    float _592 = fma(_462, 0.20999999344348907470703125, _566);
    float _594 = _566;
    if (_516)
    {
        float _596 = _538 * 8.0;
        float _598 = precise::clamp(_596, 0.0, 1.0);
        _594 = _598;
    }
    float _600 = _594;
    float _602 = _592 + _590;
    float _604 = 0.0 + _234;
    float _606 = precise::clamp(_604, 0.0, 1.0);
    float _608 = fma(_602, 0.0500000007450580596923828125, _580);
    float _610 = _606;
    if (_516)
    {
        float _612 = _606 * _600;
        _610 = _612;
    }
    float _614 = _610;
    float _616 = fma(_608, _542, _582);
    float _618 = 0.0 + _614;
    float _620 = precise::clamp(_618, 0.0, 1.0);
    out.m_67.x = _616;
    out.m_67.y = _586;
    out.m_67.z = _588;
    out.m_67.w = _620;
    return out;
}

