#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c11 [[id(2)]];
    constant _16* fp_c13 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_14 [[id(6)]];
    sampler fp_t_tcb_14Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_16 [[id(8)]];
    sampler fp_t_tcb_16Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_18 [[id(10)]];
    sampler fp_t_tcb_18Smplr [[id(11)]];
    texture2d<float> fp_t_tcb_12 [[id(12)]];
    sampler fp_t_tcb_12Smplr [[id(13)]];
    texture2d_array<float> fp_t_tcb_8 [[id(14)]];
    sampler fp_t_tcb_8Smplr [[id(15)]];
    texture2d_array<float> fp_t_tcb_C [[id(16)]];
    sampler fp_t_tcb_CSmplr [[id(17)]];
    texture2d<float> fp_t_tcb_1C [[id(18)]];
    sampler fp_t_tcb_1CSmplr [[id(19)]];
    texture2d_array<float> fp_t_tcb_1A [[id(20)]];
    sampler fp_t_tcb_1ASmplr [[id(21)]];
    sampler fp_t_tcb_10Smplr_w [[id(22)]];
    sampler fp_t_tcb_14Smplr_w [[id(23)]];
    sampler fp_t_tcb_16Smplr_w [[id(24)]];
    sampler fp_t_tcb_18Smplr_w [[id(25)]];
    sampler fp_t_tcb_12Smplr_w [[id(26)]];
    sampler fp_t_tcb_8Smplr_w [[id(27)]];
    sampler fp_t_tcb_CSmplr_w [[id(28)]];
    sampler fp_t_tcb_1CSmplr_w [[id(29)]];
    sampler fp_t_tcb_1ASmplr_w [[id(30)]];
    constant dm_border_t* dm_border [[id(31)]];
};

struct main0_out
{
    float4 m_67 [[color(0)]];
    float4 m_69 [[color(1)]];
};

struct main0_in
{
    float4 m_58 [[user(locn0)]];
    float4 m_56 [[user(locn4)]];
    float4 m_62 [[user(locn5)]];
    float4 m_60 [[user(locn6)]];
    float4 m_54 [[user(locn7)]];
    float4 m_64 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_54.z;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_54.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_54.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_56.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_56.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_58.z;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_56.z;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_58.w;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = 1.0 / _76;
    float _128 = _126 * _82;
    float _130 = _126 * _88;
    float _132 = _126 * _94;
    float _134 = _126 * _100;
    float _136 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _138 = _128 + _136;
    float _140 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _142 = _130 + _140;
    float _144 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _146 = _132 + _144;
    float _148 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _150 = _130 + _148;
    float _152 = _138 * _138;
    float _154 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _156 = _128 + _154;
    float _158 = _126 * _106;
    float _160 = fma(_142, _142, _152);
    float _162 = sqrt(_160);
    bool _166 = _162 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _168 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _170 = _162 + _168;
    float _172 = 0.0;
    float _174 = _170;
    float _176 = _82;
    if (_166)
    {
        float _178 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = 0.0;
    if (_166)
    {
        float _184 = rsqrt(_160);
        _182 = _184;
    }
    float _186 = _182;
    float _188 = _180;
    float _190 = _186;
    if (_166)
    {
        float _192 = _170 * _180;
        _174 = _192;
    }
    float _194 = _174;
    if (_166)
    {
        float _196 = _132 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _188 = _196;
    }
    float _198 = _188;
    float _200 = 0.0;
    float _202 = _198;
    if (_166)
    {
        float _204 = _194 * 0.15915493667125701904296875;
        _200 = _204;
    }
    float _206 = _200;
    float _208 = 0.0;
    if (_166)
    {
        float _210 = _206 * 6.283185482025146484375;
        float _212 = cos(_210);
        _208 = _212;
    }
    float _214 = _208;
    float _216 = _194;
    if (_166)
    {
        float _218 = _206 * 6.283185482025146484375;
        float _220 = sin(_218);
        _216 = _220;
    }
    float _222 = _216;
    if (_166)
    {
        float _224 = _214 + (-1.0);
        _176 = _224;
    }
    float _226 = _176;
    float _228 = 0.0;
    float _230 = _226;
    if (_166)
    {
        float _232 = _226 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _228 = _232;
    }
    float _234 = _228;
    if (!_166)
    {
        _230 = _130;
    }
    float _236 = _230;
    float _238 = 0.0;
    float _240 = _222;
    float _242 = _236;
    if (_166)
    {
        float _244 = fma(_222, _198, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _238 = _244;
    }
    float _246 = _238;
    float _248 = _246;
    if (!_166)
    {
        _202 = _132;
    }
    float _250 = _202;
    float _252 = _250;
    if (_166)
    {
        float _254 = fma(_132, _214, _234);
        _252 = _254;
    }
    float _256 = _252;
    if (!_166)
    {
        _240 = _128;
    }
    float _258 = _240;
    float _260 = _258;
    if (_166)
    {
        float _262 = _186 * _246;
        _190 = _262;
    }
    float _264 = _190;
    if (_166)
    {
        float _266 = fma(_142, _264, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _242 = _266;
    }
    float _268 = _242;
    float _270 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _272 = _256 + _270;
    float _274 = _272;
    if (_166)
    {
        float _276 = fma(_138, _264, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _260 = _276;
    }
    float _278 = _260;
    float _280 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _282 = _268 + _280;
    float _284 = _272 * _272;
    float _286 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _288 = _278 + _286;
    float _290 = fma(_282, _282, _284);
    float _292 = fma(_288, _288, _290);
    float _294 = rsqrt(_292);
    float _296 = _294 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _298 = _282 * _296;
    float _300 = _288 * _296;
    float _302 = _298 * _298;
    float _304 = _300 * _300;
    float _306 = _302 + _304;
    float _308 = sqrt(_306);
    bool _310 = _308 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _312 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _314 = _308 + _312;
    float _316 = _282;
    float _318 = _306;
    float _320 = _314;
    float _322 = _294;
    if (_310)
    {
        float _324 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _316 = _324;
    }
    float _326 = _316;
    if (_310)
    {
        float _328 = rsqrt(_306);
        _318 = _328;
    }
    float _330 = _318;
    if (_310)
    {
        float _332 = _314 * _326;
        _320 = _332;
    }
    float _334 = _320;
    if (_310)
    {
        float _336 = _334 * 0.15915493667125701904296875;
        _322 = _336;
    }
    float _338 = _322;
    float _340 = _284;
    float _342 = _338;
    if (_310)
    {
        float _344 = _338 * 6.283185482025146484375;
        float _346 = cos(_344);
        _340 = _346;
    }
    float _348 = _340;
    float _350 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _352 = precise::max(0.0, _350);
    float _354 = _326;
    float _356 = _352;
    if (_310)
    {
        float _358 = _338 * 6.283185482025146484375;
        float _360 = sin(_358);
        _354 = _360;
    }
    float _362 = _354;
    float _364 = -_296;
    float _366 = -_352;
    float _368 = fma(_272, _364, _366);
    if (_310)
    {
        float _370 = _368 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _356 = _370;
    }
    float _372 = _356;
    float _374 = _372;
    if (_310)
    {
        float _376 = _348 + (-1.0);
        _274 = _376;
    }
    float _378 = _274;
    float _380 = _378;
    if (!_310)
    {
        _342 = _302;
    }
    float _382 = _342;
    float _384 = _382;
    if (_310)
    {
        float _386 = _378 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _380 = _386;
    }
    float _388 = _380;
    float _390 = _362;
    float _392 = _388;
    if (_310)
    {
        float _394 = fma(_362, _372, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _390 = _394;
    }
    float _396 = _390;
    if (!_310)
    {
        _374 = _368;
    }
    float _398 = _374;
    float _400 = _398;
    if (_310)
    {
        float _402 = fma(_368, _348, _388);
        _400 = _402;
    }
    float _404 = _400;
    if (!_310)
    {
        _392 = _298;
    }
    float _406 = _392;
    float _408 = _406;
    if (_310)
    {
        float _410 = _330 * _396;
        _248 = _410;
    }
    float _412 = _248;
    float _414 = _146 * _146;
    float _416 = in.m_58.x;
    float _418 = gl_FragCoord.w;
    float _420 = _416 * _418;
    float _422 = _414;
    if (_310)
    {
        float _424 = _298 * _412;
        _408 = _424;
    }
    float _426 = _408;
    float _428 = fma(_150, _150, _414);
    float _430 = _428;
    if (!_310)
    {
        _422 = _300;
    }
    float _432 = _422;
    float _434 = _432;
    if (_310)
    {
        float _436 = _300 * _412;
        _434 = _436;
    }
    float _438 = _434;
    if (_310)
    {
        float _440 = _426 * _426;
        _384 = _440;
    }
    float _442 = _384;
    float _444 = fma(_156, _156, _428);
    if (!_310)
    {
        _430 = _304;
    }
    float _446 = _430;
    float _448 = _446;
    if (_310)
    {
        float _450 = _438 * _438;
        _448 = _450;
    }
    float _452 = _448;
    float _454 = fma(_404, _404, _442);
    float _456 = sqrt(_444);
    float _458 = _454 + _452;
    float _460 = in.m_58.y;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = rsqrt(_458);
    float _468 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _470 = fma(_456, (*spvDescriptorSet0.fp_c9)._m0[63].x, _468);
    float _472 = precise::clamp(_470, 0.0, 1.0);
    float _474 = _126 * _420;
    float _476 = -_472;
    float _478 = _476 + 1.0;
    float _480 = _466 * _426;
    float _482 = _466 * _404;
    float _484 = _466 * _438;
    float _486 = abs(_478);
    float _488 = log2(_486);
    float _490 = _480 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _492 = -_490;
    float _494 = fma(_482, (*spvDescriptorSet0.fp_c9)._m0[69].y, _492);
    float _496 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 0.0625;
    float _498 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 0.75;
    float _500 = _126 * _464;
    float _502 = -_484;
    float _504 = fma(_502, (*spvDescriptorSet0.fp_c9)._m0[69].z, _494);
    float _506 = -_496;
    float _508 = fma(_474, 0.75, _506);
    float _510 = _126 * _112;
    float _512 = in.m_56.w;
    float _514 = gl_FragCoord.w;
    float _516 = _512 * _514;
    float _518 = fma(_504, -0.5, 0.5);
    float _520 = fma(_504, 0.5, 0.5);
    float _522 = _474 + _496;
    float _524 = _500 + _496;
    float _526 = -_496;
    float _528 = fma(_500, 0.75, _526);
    float _530 = fma(_520, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _532 = sqrt(_518);
    float _534 = _488 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _536 = _482 + 1.0;
    float _538 = fma(_520, _530, -0.212114393711090087890625);
    float _540 = fma(_520, _538, 1.570728778839111328125);
    float _542 = exp2(_534);
    float _544 = _532 * 0.636619746685028076171875;
    float _546 = -_498;
    float _548 = fma(_546, (*spvDescriptorSet0.fp_c11)._m0[40].z, _524);
    float _550 = -_498;
    float _552 = fma(_550, (*spvDescriptorSet0.fp_c11)._m0[40].z, _528);
    float2 _2300 = float2(_522, _548);
    float2 _556 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2300, float2(0.0), isnan(_2300))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2300, float2(0.0), isnan(_2300))).xy;
    float _558 = _556.x;
    float _560 = _556.y;
    float2 _2314 = float2(_508, _552);
    float2 _562 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2314, float2(0.0), isnan(_2314))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2314, float2(0.0), isnan(_2314))).xy;
    float _564 = _562.x;
    float _566 = _562.y;
    float2 _2326 = float2(_134, _158);
    float _568 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2326, float2(0.0), isnan(_2326))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2326, float2(0.0), isnan(_2326))).x;
    float _570 = -_482;
    float _572 = fma(_542, _536, _570);
    float _574 = -_540;
    float _576 = fma(_544, _574, 1.0);
    float _578 = _126 * _118;
    float _580 = _126 * _124;
    float2 _2351 = float2(_134, _158);
    float _582 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2351, float2(0.0), isnan(_2351))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2351, float2(0.0), isnan(_2351))).x;
    float _584 = _126 * _516;
    float _586 = fma(_572, 0.5, 0.5);
    float2 _2364 = float2(_510, _580);
    float3 _590 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2364, float2(0.0), isnan(_2364))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2364, float2(0.0), isnan(_2364))).xyz;
    float _592 = _590.x;
    float _594 = _590.y;
    float _596 = _590.z;
    float3 _2379 = float3(_578, _584, float(0));
    float3 _2383 = select(_2379, float3(0.0), isnan(_2379));
    float2 _598 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2383.xy, uint(rint(_2383.z))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2383.xy, uint(rint(_2383.z))).xz;
    float _600 = _598.x;
    float _602 = _598.y;
    float3 _2394 = float3(_578, _584, float(0));
    float3 _2396 = select(_2394, float3(0.0), isnan(_2394));
    float3 _604 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2396.xy, uint(rint(_2396.z))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2396.xy, uint(rint(_2396.z))).xyz;
    float _606 = _604.x;
    float _608 = _604.y;
    float _610 = _604.z;
    float2 _2408 = float2(_576, _586);
    float3 _612 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2408, float2(0.0), isnan(_2408))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2408, float2(0.0), isnan(_2408))).xyz;
    float _614 = _612.x;
    float _616 = _612.y;
    float _618 = _612.z;
    float _620 = in.m_60.y;
    float _622 = gl_FragCoord.w;
    float _624 = _620 * _622;
    float _626 = in.m_62.y;
    float _628 = gl_FragCoord.w;
    float _630 = _626 * _628;
    float _632 = in.m_60.x;
    float _634 = gl_FragCoord.w;
    float _636 = _632 * _634;
    float _638 = in.m_62.x;
    float _640 = gl_FragCoord.w;
    float _642 = _638 * _640;
    float _644 = in.m_60.z;
    float _646 = gl_FragCoord.w;
    float _648 = _644 * _646;
    float _650 = in.m_62.z;
    float _652 = gl_FragCoord.w;
    float _654 = _650 * _652;
    float _656 = _126 * _630;
    float _658 = _126 * _648;
    bool _660 = _558 >= 0.5;
    bool _662 = isnan(_558);
    bool _664 = _660 || _662;
    bool _666 = isnan(0.5);
    bool _668 = _664 || _666;
    float _670 = -_558;
    float _672 = _670 + 1.0;
    bool _674 = _560 >= 0.5;
    bool _676 = isnan(_560);
    bool _678 = _674 || _676;
    bool _680 = isnan(0.5);
    bool _682 = _678 || _680;
    float _684 = _558 * _564;
    float _686 = _684 * 2.0;
    float _688 = -_560;
    float _690 = _688 + 1.0;
    float _692 = -_564;
    float _694 = _692 + 1.0;
    float _696 = _560 * _566;
    float _698 = _696 * 2.0;
    float _700 = -_566;
    float _702 = _700 + 1.0;
    float _704 = _568 + (*spvDescriptorSet0.fp_c9)._m0[983].y;
    float _706 = _672 * _694;
    float _708 = _690 * _702;
    float _710 = _126 * _624;
    float _712 = _126 * _642;
    float _714 = _704 * (*spvDescriptorSet0.fp_c11)._m0[40].w;
    float _716 = _686;
    float _718 = _698;
    float _720 = _594;
    if (_668)
    {
        float _722 = fma(_706, -2.0, 1.0);
        _716 = _722;
    }
    float _724 = _716;
    if (_682)
    {
        float _726 = fma(_708, -2.0, 1.0);
        _718 = _726;
    }
    float _728 = _718;
    float _730 = _126 * _636;
    float _732 = _710 * _710;
    float _734 = _656 * _656;
    float _736 = in.m_62.w;
    float _738 = gl_FragCoord.w;
    float _740 = _736 * _738;
    float _742 = _126 * _654;
    float _744 = fma(_730, _730, _732);
    float _746 = fma(_712, _712, _734);
    float _748 = _714 * 0.15915493667125701904296875;
    float _750 = fma(_658, _658, _744);
    float _752 = fma(_742, _742, _746);
    float _754 = _748 * 6.283185482025146484375;
    float _756 = sin(_754);
    float _758 = rsqrt(_750);
    float _760 = rsqrt(_752);
    float _762 = fma(_756, 0.5, 0.5);
    float _764 = _730 * _758;
    float _766 = _658 * _758;
    float _768 = _126 * _740;
    float _770 = _710 * _758;
    float _772 = _656 * _760;
    float _774 = _742 * _760;
    float _776 = _712 * _760;
    float _778 = _766 * _772;
    float _780 = _764 * _774;
    float _782 = _770 * _776;
    float _784 = -_778;
    float _786 = fma(_770, _774, _784);
    float _788 = -_780;
    float _790 = fma(_766, _776, _788);
    float _792 = -_782;
    float _794 = fma(_764, _772, _792);
    float _796 = _768 * _786;
    float _798 = _768 * _790;
    float _800 = _768 * _794;
    float _802 = _798 * _798;
    float _804 = fma(2.007874011993408203125, _724, -1.007874011993408203125);
    float _806 = fma(2.007874011993408203125, _728, -1.007874011993408203125);
    float _808 = fma(_796, _796, _802);
    float _810 = fma(_800, _800, _808);
    float _812 = rsqrt(_810);
    float _814 = _812 * _806;
    float _816 = _806 * _806;
    float _818 = in.m_64.x;
    float _820 = gl_FragCoord.w;
    float _822 = _818 * _820;
    float _824 = _796 * _814;
    float _826 = fma(_804, _804, _816);
    float _828 = _798 * _814;
    float _830 = _800 * _814;
    float _832 = fma(_776, _804, _824);
    float _834 = -_826;
    float _836 = _834 + 1.0;
    float _838 = precise::clamp(_836, 0.0, 1.0);
    float _840 = fma(_772, _804, _828);
    float _842 = fma(_774, _804, _830);
    float _844 = _132 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _846 = _132 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _848 = in.m_64.y;
    float _850 = gl_FragCoord.w;
    float _852 = _848 * _850;
    float _854 = sqrt(_838);
    float _856 = fma(_130, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _844);
    float _858 = fma(_130, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _846);
    float _860 = fma(_128, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _856);
    float _862 = fma(_128, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _858);
    float _864 = _860 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _866 = _862 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _868 = trunc(_866);
    int _871 = int(_868);
    float _873 = fma(_764, _854, _832);
    float _875 = fma(_770, _854, _840);
    float _877 = fma(_766, _854, _842);
    float _879 = in.m_64.z;
    float _881 = gl_FragCoord.w;
    float _883 = _879 * _881;
    float _885 = in.m_64.w;
    float _887 = gl_FragCoord.w;
    float _889 = _885 * _887;
    float _891 = _875 * _875;
    float _893 = trunc(_864);
    int _895 = int(_893);
    float _897 = fma(_873, _873, _891);
    float _899 = fma(_877, _877, _897);
    int _901 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _903 = _871 + _901;
    int _905 = _903 + 1;
    float _907 = rsqrt(_899);
    int _909 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _911 = _895 + _909;
    int _913 = _911 + 1;
    bool _915 = _913 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    int _917 = _913 | _905;
    bool _919 = _917 < 0;
    bool _921 = _919 || _915;
    float _923 = _762 * _762;
    float _925 = _873 * _907;
    bool _927 = _905 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _929 = _927 || _921;
    float _931 = _875 * _907;
    float _933 = _582 * _923;
    float _935 = _877 * _907;
    float _937 = _126 * _852;
    float _939 = _126 * _822;
    float _941 = _126 * _883;
    float _943 = fma(_933, (*spvDescriptorSet0.fp_c11)._m0[18].y, _594);
    float _945 = _126 * _889;
    float _947 = fma(_933, (*spvDescriptorSet0.fp_c11)._m0[18].x, _592);
    float _949 = fma(_933, (*spvDescriptorSet0.fp_c11)._m0[18].z, _596);
    if (_929)
    {
        _720 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _951 = _720;
    float _953 = _951;
    if (!_929)
    {
        int _955 = _905 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _957 = _955 + _913;
        float _959 = floor(_864);
        int _961 = _957 << 2;
        int _963 = _957 >> 2;
        int _965 = 12 & _961;
        int _967 = _963 << 4;
        int _969 = _967 + _965;
        float _971 = floor(_866);
        int _973 = _969 + 16256;
        uint _976 = uint(int(uint(_973) >> uint(2)));
        uint _978 = uint(int(uint(int(_976)) >> uint(2)));
        int _980 = int(_976) & 3;
        float _982 = (*spvDescriptorSet0.fp_c9)._m0[int(_978)][_980];
        float _984 = -_959;
        float _986 = _864 + _984;
        float _988 = -_971;
        float _990 = _866 + _988;
        float _992 = rint(_982);
        float _994 = precise::max(_992, 0.0);
        uint _996 = uint(_994);
        uint _998 = clamp(_996, 0u, 65535u);
        float3 _2976 = float3(_986, _990, float(int(_998)));
        float3 _2978 = select(_2976, float3(0.0), isnan(_2976));
        float _1000 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, _2978.xy, uint(rint(_2978.z))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, _2978.xy, uint(rint(_2978.z))).x;
        int _1002 = _957 << 4;
        int _1004 = _1002 + 17904;
        int _1006 = _969 + 24304;
        uint _1008 = uint(int(uint(_1006) >> uint(2)));
        uint _1010 = uint(int(uint(int(_1008)) >> uint(2)));
        int _1012 = int(_1008) & 3;
        float _1014 = (*spvDescriptorSet0.fp_c9)._m0[int(_1010)][_1012];
        uint _1016 = uint(int(uint(_1004) >> uint(2)));
        uint _1018 = uint(int(uint(int(_1016)) >> uint(2)));
        int _1020 = int(_1016) & 3;
        float _1022 = (*spvDescriptorSet0.fp_c9)._m0[int(_1018)][_1020];
        int _1024 = int(_1016) + 1;
        uint _1026 = uint(int(uint(_1024) >> uint(2)));
        int _1028 = _1024 & 3;
        float _1030 = (*spvDescriptorSet0.fp_c9)._m0[int(_1026)][_1028];
        int _1032 = _1004 + 8;
        uint _1034 = uint(int(uint(_1032) >> uint(2)));
        uint _1036 = uint(int(uint(int(_1034)) >> uint(2)));
        int _1038 = int(_1034) & 3;
        float _1040 = (*spvDescriptorSet0.fp_c9)._m0[int(_1036)][_1038];
        int _1042 = int(_1034) + 1;
        uint _1044 = uint(int(uint(_1042) >> uint(2)));
        int _1046 = _1042 & 3;
        float _1048 = (*spvDescriptorSet0.fp_c9)._m0[int(_1044)][_1046];
        float _1050 = _132 * _1030;
        float _1052 = fma(_130, _1022, _1050);
        float _1054 = 1.0 / _1014;
        float _1056 = fma(_128, _1040, _1052);
        float _1058 = _1056 + _1048;
        float _1060 = precise::clamp(_1058, 0.0, 1.0);
        float _1062 = _1014 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _1064 = -_1060;
        float _1066 = _1064 + _1000;
        float _1068 = fma(_1054, (*spvDescriptorSet0.fp_c13)._m0[4].w, _1066);
        float _1070 = _1062 * _1068;
        float _1072 = exp2(_1070);
        float _1074 = 0.0 + _1072;
        float _1076 = precise::clamp(_1074, 0.0, 1.0);
        float _1078 = precise::min(_1076, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _953 = _1078;
    }
    float _1080 = _953;
    float _1082 = -_945;
    float _1084 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _1086 = _1082 + _1084;
    float _1088 = -_1080;
    float _1090 = _1088 + 1.0;
    float _1092 = spvFAdd(_456, 9.9999997473787516355514526367188e-06);
    float _1094 = _1086 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1096 = precise::clamp(_1094, 0.0, 1.0);
    float _1098 = _456 + (-250.0);
    float _1100 = -(*spvDescriptorSet0.fp_c9)._m0[1007].y;
    float _1102 = _1100 + (*spvDescriptorSet0.fp_c9)._m0[1006].y;
    float _1104 = fma(_1096, _1090, _1080);
    float _1106 = fma(_931, 0.5, 0.5);
    float _1108 = -(*spvDescriptorSet0.fp_c9)._m0[1007].x;
    float _1110 = _1108 + (*spvDescriptorSet0.fp_c9)._m0[1006].x;
    float _1112 = 1.0 / _1092;
    float _1114 = fma(_1106, _1102, (*spvDescriptorSet0.fp_c9)._m0[1007].y);
    float _1116 = -(*spvDescriptorSet0.fp_c9)._m0[1007].z;
    float _1118 = _1116 + (*spvDescriptorSet0.fp_c9)._m0[1006].z;
    float _1120 = fma(_1106, _1110, (*spvDescriptorSet0.fp_c9)._m0[1007].x);
    float _1122 = _1114 * 0.715200006961822509765625;
    float _1124 = precise::max(0.0, _1098);
    float _1126 = fma(_1106, _1118, (*spvDescriptorSet0.fp_c9)._m0[1007].z);
    float _1128 = fma(_1120, 0.2125999927520751953125, _1122);
    float _1130 = abs(_146);
    bool _1132 = _1130 > 0.00999999977648258209228515625;
    float _1134 = _608 * 0.4774648249149322509765625;
    float _1136 = precise::min(_1104, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1138 = fma(_1126, 0.072200000286102294921875, _1128);
    float _1140 = _610 * 0.4774648249149322509765625;
    float _1142 = 1.0 / _1138;
    float _1144 = _150 * _1112;
    float _1146 = _156 * _1112;
    float _1148 = _146 * _1112;
    float _1150 = _1132 ? _146 : 0.00999999977648258209228515625;
    float _1152 = _1144 * _925;
    float _1154 = _1142 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1156 = precise::clamp(_1154, 0.0, 1.0);
    float _1158 = _1150 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _1160 = fma(_1156, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _1162 = _1160 * 0.31830990314483642578125;
    float _1164 = _1124 * 0.001000000047497451305389404296875;
    float _1166 = precise::clamp(_1164, 0.0, 1.0);
    float _1168 = _1120 * _1162;
    float _1170 = _1114 * _1162;
    float _1172 = _1126 * _1162;
    float _1174 = -_1148;
    float _1176 = -_1152;
    float _1178 = fma(_1174, _931, _1176);
    float _1180 = fma(_1166, 0.20000000298023223876953125, 0.00999999977648258209228515625);
    float _1182 = fma(_1166, -0.20000000298023223876953125, 0.9900000095367431640625);
    float _1184 = fma(_1148, _931, _1152);
    float _1186 = -_1146;
    float _1188 = fma(_1186, _935, _1178);
    float _1190 = precise::clamp(_1188, 0.0, 1.0);
    float _1192 = _1182 * _1182;
    float _1194 = fma(_1146, _935, _1184);
    float _1196 = _1190 * (-9.27999973297119140625);
    float _1198 = exp2(_1196);
    float _1200 = precise::min(_1192, _1198);
    float _1202 = fma(_1180, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1204 = precise::max(_1158, -127.0);
    float _1206 = fma(_1182, _1200, _1202);
    float _1208 = -_1204;
    float _1210 = exp2(_1208);
    float _1212 = fma(_1180, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1214 = fma(_1180, -0.572000026702880859375, 1.03999996185302734375);
    float _1216 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1218 = fma(_1206, -1.03999996185302734375, _1214);
    float _1220 = precise::clamp(_1218, 0.0, 1.0);
    float _1222 = fma(_1206, 1.03999996185302734375, _1212);
    float _1224 = precise::clamp(_1222, 0.0, 1.0);
    float _1226 = _456 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1228 = -_1216;
    float _1230 = exp2(_1228);
    float _1232 = -_1210;
    float _1234 = _1232 + 1.0;
    float _1236 = fma(_1220, 0.02005931176245212554931640625, _1224);
    float _1238 = -_1224;
    float _1240 = _1238 + 1.0;
    float _1242 = _1230 * _1234;
    float _1244 = 1.0 / _1204;
    float _1246 = _488 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1248 = exp2(_1246);
    float _1250 = _1242 * _1244;
    float _1252 = _1148 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _1254 = _1250 * _1226;
    float _1256 = fma(_1144, (*spvDescriptorSet0.fp_c9)._m0[69].x, _1252);
    float _1258 = _1144 * 0.75187969207763671875;
    float _1260 = fma(_1146, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1256);
    float _1262 = -_1254;
    float _1264 = exp2(_1262);
    float _1266 = _1146 * 0.75187969207763671875;
    float _1268 = fma(_1260, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _1270 = -_1248;
    float _1272 = _1270 + 1.0;
    float _1274 = _1148 * 0.75187969207763671875;
    float _1276 = fma(_1268, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1278 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1280 = fma(_1278, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1282 = _1140 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1284 = abs(_1276);
    float _1286 = log2(_1284);
    float _1288 = -_1264;
    float _1290 = _1288 + 1.0;
    float _1292 = _1286 * 1.5;
    float _1294 = exp2(_1292);
    float _1296 = _1294 * 12.56637096405029296875;
    float _1298 = 1.0 / _1296;
    float _1300 = _1280 * _1298;
    float _1302 = _1290 * _1300;
    float _1304 = _1272 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1306 = _1136 * _1302;
    float _1308 = -_1304;
    float _1310 = _1308 + 1.0;
    float _1312 = _1304 * _1264;
    float _1314 = _1264 * _1310;
    float _1316 = _1194 * _1194;
    float _1318 = fma(_1316, 0.565323054790496826171875, 0.434676945209503173828125);
    float _1320 = sqrt(_1318);
    bool _1322 = _1318 >= 0.0;
    bool _1324 = isnan(_1318);
    bool _1326 = _1322 || _1324;
    bool _1328 = isnan(0.0);
    bool _1330 = _1326 || _1328;
    float _1332 = fma(_1194, 0.75187969207763671875, _1320);
    float _1334 = -_1274;
    float _1336 = fma(_931, _1332, _1334);
    float _1338 = -_1258;
    float _1340 = fma(_925, _1332, _1338);
    float _1342 = -_1266;
    float _1344 = fma(_935, _1332, _1342);
    float _1346 = _1134 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1348 = _1330 ? _1336 : (-0.0);
    float _1350 = _1330 ? _1340 : (-0.0);
    float _1352 = _1330 ? _1344 : (-0.0);
    float _1354 = _1348 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _1356 = precise::max(_1346, _1170);
    float _1358 = fma(_1350, (*spvDescriptorSet0.fp_c9)._m0[69].x, _1354);
    float _1360 = fma(_1352, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1358);
    float _1362 = fma((*spvDescriptorSet0.fp_c11)._m0[15].w, (*spvDescriptorSet0.fp_c11)._m0[15].w, 1.0);
    float _1364 = (*spvDescriptorSet0.fp_c11)._m0[15].w * 2.0;
    float _1366 = -_1364;
    float _1368 = fma(_1360, _1366, _1362);
    float _1370 = _937 * 0.18672408163547515869140625;
    float _1372 = -(*spvDescriptorSet0.fp_c11)._m0[15].w;
    float _1374 = fma(_1372, (*spvDescriptorSet0.fp_c11)._m0[15].w, 1.0);
    float _1376 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1378 = fma(_939, 0.095146648585796356201171875, _1370);
    float _1380 = abs(_1368);
    float _1382 = log2(_1380);
    float _1384 = fma(_602, _1376, _1356);
    float _1386 = _1382 * 1.5;
    float _1388 = fma(_941, 0.0364394821226596832275390625, _1378);
    float _1390 = _606 * 0.4774648249149322509765625;
    float _1392 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1394 = exp2(_1386);
    float _1396 = _1390 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1398 = precise::max(_1396, _1168);
    float _1400 = _1394 * 12.56637096405029296875;
    float _1402 = precise::max(_1388, 0.00999999977648258209228515625);
    float _1404 = fma(_602, _1376, _1346);
    float _1406 = _1240 * 3.1415927410125732421875;
    float _1408 = 1.0 / _1400;
    float _1410 = _600 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1412 = _1404 * 0.586610972881317138671875;
    float _1414 = 1.0 / _1402;
    float _1416 = (*spvDescriptorSet0.fp_c11)._m0[40].y + (*spvDescriptorSet0.fp_c11)._m0[15].x;
    float _1418 = _1374 * _1408;
    float _1420 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1422 = fma(_602, _1420, _1396);
    float _1424 = fma(_602, _1420, _1398);
    float _1426 = precise::max(_1282, _1172);
    float _1428 = (*spvDescriptorSet0.fp_c11)._m0[40].y + (*spvDescriptorSet0.fp_c11)._m0[15].y;
    float _1430 = fma(_1422, 0.298911988735198974609375, _1412);
    float _1432 = fma(_602, _1392, _1282);
    float _1434 = _1424 * _1406;
    float _1436 = fma(_602, _1392, _1426);
    float _1438 = 1.0 / _1416;
    float _1440 = fma(_1432, 0.114477999508380889892578125, _1430);
    float _1442 = _600 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1444 = _1434 * (*spvDescriptorSet0.fp_c11)._m0[17].x;
    float _1446 = _1436 * _1406;
    float _1448 = _1440 * _1414;
    float _1450 = _1384 * _1406;
    float _1452 = (*spvDescriptorSet0.fp_c11)._m0[40].y + (*spvDescriptorSet0.fp_c11)._m0[15].z;
    float _1454 = 1.0 / _1428;
    float _1456 = _600 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1458 = _1450 * (*spvDescriptorSet0.fp_c11)._m0[17].y;
    float _1460 = _1442 * (*spvDescriptorSet0.fp_c11)._m0[17].x;
    float _1462 = _1444 * 0.079577468335628509521484375;
    float _1464 = _1456 * (*spvDescriptorSet0.fp_c11)._m0[17].y;
    float _1466 = precise::min(_1448, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1468 = 1.0 / _1452;
    float _1470 = _1446 * (*spvDescriptorSet0.fp_c11)._m0[17].z;
    float _1472 = _1458 * 0.079577468335628509521484375;
    float _1474 = fma(_1418, _1460, _1462);
    float _1476 = (*spvDescriptorSet0.fp_c11)._m0[35].x * 1.60000002384185791015625;
    float _1478 = _1410 * (*spvDescriptorSet0.fp_c11)._m0[17].z;
    float _1480 = _1470 * 0.079577468335628509521484375;
    float _1482 = fma(_1418, _1464, _1472);
    float _1484 = _1466 * 0.31830990314483642578125;
    float _1486 = _1474 * (*spvDescriptorSet0.fp_c11)._m0[40].y;
    float _1488 = _947 * _1476;
    float _1490 = _943 * _1476;
    float _1492 = _949 * _1476;
    float _1494 = fma(_1418, _1478, _1480);
    float _1496 = _1482 * (*spvDescriptorSet0.fp_c11)._m0[40].y;
    float _1498 = _1236 * _1484;
    float _1500 = _1486 * _1438;
    float _1502 = _1494 * (*spvDescriptorSet0.fp_c11)._m0[40].y;
    float _1504 = _1496 * _1454;
    float _1506 = _1306 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1508 = fma(_939, _1498, _1500);
    float _1510 = _1502 * _1468;
    float _1512 = fma(_937, _1498, _1504);
    float _1514 = fma(_614, _1312, _1506);
    float _1516 = _1306 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1518 = precise::max(0.0, _1508);
    float _1520 = fma(_941, _1498, _1510);
    float _1522 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1524 = _456 + _1522;
    float _1526 = precise::max(0.0, _1488);
    float _1528 = _1306 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1530 = fma(_616, _1312, _1516);
    float _1532 = precise::max(0.0, _1512);
    float _1534 = fma(_1314, _1518, _1514);
    float _1536 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1538 = _456 + _1536;
    float _1540 = precise::max(0.0, _1490);
    float _1542 = _1524 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1544 = precise::clamp(_1542, 0.0, 1.0);
    float _1546 = precise::max(0.0, _1492);
    float _1548 = fma(_618, _1312, _1528);
    float _1550 = precise::max(0.0, _1520);
    float _1552 = _1314 * _1526;
    float _1554 = _1538 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1556 = precise::clamp(_1554, 0.0, 1.0);
    float _1558 = fma(_1314, _1532, _1530);
    float _1560 = _1314 * _1540;
    float _1562 = _1314 * _1546;
    float _1564 = fma(_1314, _1550, _1548);
    float _1566 = fma(_1544, _1552, _1534);
    float _1568 = fma(_1556, _1552, _1534);
    float _1570 = fma(_1544, _1560, _1558);
    float _1572 = fma(_1556, _1560, _1558);
    float _1574 = fma(_1544, _1562, _1564);
    float _1576 = fma(_1556, _1562, _1564);
    out.m_67.x = _1566;
    out.m_67.y = _1570;
    out.m_67.z = _1574;
    out.m_67.w = 1.0;
    out.m_69.x = _1568;
    out.m_69.y = _1572;
    out.m_69.z = _1576;
    out.m_69.w = 1.0;
    return out;
}

