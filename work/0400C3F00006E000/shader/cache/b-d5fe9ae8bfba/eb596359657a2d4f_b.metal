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
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c13 [[id(3)]];
    constant _16* fp_c14 [[id(4)]];
    texture2d<float> fp_t_tcb_16 [[id(5)]];
    sampler fp_t_tcb_16Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_14 [[id(9)]];
    sampler fp_t_tcb_14Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_1A [[id(11)]];
    sampler fp_t_tcb_1ASmplr [[id(12)]];
    texture2d<float> fp_t_tcb_8 [[id(13)]];
    sampler fp_t_tcb_8Smplr [[id(14)]];
    texture2d<float> fp_t_tcb_10 [[id(15)]];
    sampler fp_t_tcb_10Smplr [[id(16)]];
    texture2d_array<float> fp_t_tcb_18 [[id(17)]];
    sampler fp_t_tcb_18Smplr [[id(18)]];
    sampler fp_t_tcb_16Smplr_w [[id(19)]];
    sampler fp_t_tcb_12Smplr_w [[id(20)]];
    sampler fp_t_tcb_14Smplr_w [[id(21)]];
    sampler fp_t_tcb_1ASmplr_w [[id(22)]];
    sampler fp_t_tcb_8Smplr_w [[id(23)]];
    sampler fp_t_tcb_10Smplr_w [[id(24)]];
    sampler fp_t_tcb_18Smplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_61 [[color(0)]];
    float4 m_63 [[color(1)]];
};

struct main0_in
{
    float4 m_54 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_52 [[user(locn5)]];
    float4 m_56 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_52.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_52.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_52.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = 1.0 / _70;
    float _92 = _90 * _76;
    float _94 = _90 * _82;
    float _96 = _90 * _88;
    float _98 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _100 = _92 + _98;
    float _102 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _104 = _94 + _102;
    float _106 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _108 = _96 + _106;
    float _110 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _112 = _94 + _110;
    float _114 = _100 * _100;
    float _116 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _118 = _92 + _116;
    float _120 = fma(_104, _104, _114);
    float _122 = sqrt(_120);
    bool _126 = _122 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _128 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _130 = _122 + _128;
    float _132 = 0.0;
    float _134 = _130;
    float _136 = _76;
    if (_126)
    {
        float _138 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _132 = _138;
    }
    float _140 = _132;
    float _142 = 0.0;
    if (_126)
    {
        float _144 = rsqrt(_120);
        _142 = _144;
    }
    float _146 = _142;
    float _148 = _140;
    float _150 = _146;
    if (_126)
    {
        float _152 = _130 * _140;
        _134 = _152;
    }
    float _154 = _134;
    if (_126)
    {
        float _156 = _96 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _148 = _156;
    }
    float _158 = _148;
    float _160 = 0.0;
    float _162 = _158;
    if (_126)
    {
        float _164 = _154 * 0.15915493667125701904296875;
        _160 = _164;
    }
    float _166 = _160;
    float _168 = 0.0;
    if (_126)
    {
        float _170 = _166 * 6.283185482025146484375;
        float _172 = cos(_170);
        _168 = _172;
    }
    float _174 = _168;
    float _176 = _154;
    if (_126)
    {
        float _178 = _166 * 6.283185482025146484375;
        float _180 = sin(_178);
        _176 = _180;
    }
    float _182 = _176;
    if (_126)
    {
        float _184 = _174 + (-1.0);
        _136 = _184;
    }
    float _186 = _136;
    float _188 = 0.0;
    float _190 = _186;
    if (_126)
    {
        float _192 = _186 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _188 = _192;
    }
    float _194 = _188;
    if (!_126)
    {
        _190 = _94;
    }
    float _196 = _190;
    float _198 = 0.0;
    float _200 = _182;
    float _202 = _196;
    if (_126)
    {
        float _204 = fma(_182, _158, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _198 = _204;
    }
    float _206 = _198;
    if (!_126)
    {
        _162 = _96;
    }
    float _208 = _162;
    float _210 = _208;
    if (_126)
    {
        float _212 = fma(_96, _174, _194);
        _210 = _212;
    }
    float _214 = _210;
    if (!_126)
    {
        _200 = _92;
    }
    float _216 = _200;
    float _218 = _216;
    if (_126)
    {
        float _220 = _146 * _206;
        _150 = _220;
    }
    float _222 = _150;
    if (_126)
    {
        float _224 = fma(_104, _222, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _202 = _224;
    }
    float _226 = _202;
    float _228 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _230 = _214 + _228;
    float _232 = _230;
    if (_126)
    {
        float _234 = fma(_100, _222, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _218 = _234;
    }
    float _236 = _218;
    float _238 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _240 = _226 + _238;
    float _242 = _230 * _230;
    float _244 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _246 = _236 + _244;
    float _248 = fma(_240, _240, _242);
    float _250 = fma(_246, _246, _248);
    float _252 = rsqrt(_250);
    float _254 = _252 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _256 = _240 * _254;
    float _258 = _246 * _254;
    float _260 = _108 * _108;
    float _262 = _256 * _256;
    float _264 = _258 * _258;
    float _266 = fma(_112, _112, _260);
    float _268 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _270 = _262 + _264;
    float _272 = fma(_118, _118, _266);
    float _274 = precise::max(0.0, _268);
    float _276 = sqrt(_270);
    float _278 = -_254;
    float _280 = -_274;
    float _282 = fma(_230, _278, _280);
    float _284 = sqrt(_272);
    bool _286 = _276 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _288 = (*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _290 = _276;
    float _292 = _266;
    float _294 = _274;
    if (!_286)
    {
        _232 = _264;
    }
    float _296 = _232;
    float _298 = _296;
    if (!_286)
    {
        _288 = _262;
    }
    float _300 = _288;
    float _302 = _300;
    if (!_286)
    {
        _290 = _256;
    }
    float _304 = _290;
    float _306 = _304;
    if (!_286)
    {
        _292 = _282;
    }
    float _308 = _292;
    float _310 = _308;
    if (!_286)
    {
        _294 = _258;
    }
    float _312 = _294;
    bool _314 = !_286;
    float _316 = _312;
    if (!_314)
    {
        float _318 = _256 * _256;
        float _320 = _258 * _258;
        float _322 = _282 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _324 = _318 + _320;
        float _326 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _328 = sqrt(_324);
        float _330 = rsqrt(_324);
        float _332 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _334 = _328 + _332;
        float _336 = _334 * _326;
        float _338 = _336 * 0.15915493667125701904296875;
        float _340 = _338 * 6.283185482025146484375;
        float _342 = sin(_340);
        float _344 = _338 * 6.283185482025146484375;
        float _346 = cos(_344);
        float _348 = fma(_342, _322, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _350 = _330 * _348;
        float _352 = _346 + (-1.0);
        float _354 = _256 * _350;
        float _356 = _352 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _358 = _258 * _350;
        float _360 = fma(_282, _346, _356);
        float _362 = _354 * _354;
        float _364 = _358 * _358;
        _310 = _360;
        _302 = _362;
        _298 = _364;
        _306 = _354;
        _316 = _358;
    }
    float _366 = _310;
    float _368 = _302;
    float _370 = _298;
    float _372 = _306;
    float _374 = _316;
    float _376 = fma(_366, _366, _368);
    float _378 = in.m_54.z;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = _376 + _370;
    float _386 = in.m_54.w;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _394 = fma(_284, (*spvDescriptorSet0.fp_c9)._m0[63].x, _392);
    float _396 = precise::clamp(_394, 0.0, 1.0);
    float _398 = rsqrt(_384);
    float _400 = -_396;
    float _402 = _400 + 1.0;
    float _404 = abs(_402);
    float _406 = log2(_404);
    float _408 = _398 * _372;
    float _410 = _398 * _366;
    float _412 = _398 * _374;
    float _414 = _408 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _416 = -_414;
    float _418 = fma(_410, (*spvDescriptorSet0.fp_c9)._m0[69].y, _416);
    float _420 = _406 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _422 = -_412;
    float _424 = fma(_422, (*spvDescriptorSet0.fp_c9)._m0[69].z, _418);
    float _426 = exp2(_420);
    float _428 = fma(_424, -0.5, 0.5);
    float _430 = fma(_424, 0.5, 0.5);
    float _432 = _410 + 1.0;
    float _434 = fma(_430, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _436 = sqrt(_428);
    float _438 = fma(_430, _434, -0.212114393711090087890625);
    float _440 = fma(_430, _438, 1.570728778839111328125);
    float _442 = -_410;
    float _444 = fma(_426, _432, _442);
    float _446 = fma(_94, (*spvDescriptorSet0.fp_c15)._m0[5].x, (*spvDescriptorSet0.fp_c15)._m0[5].z);
    float _448 = fma(_92, (*spvDescriptorSet0.fp_c15)._m0[5].x, (*spvDescriptorSet0.fp_c15)._m0[5].w);
    float _450 = fma(_446, (*spvDescriptorSet0.fp_c15)._m0[13].x, (*spvDescriptorSet0.fp_c15)._m0[13].z);
    float _452 = fma(_448, (*spvDescriptorSet0.fp_c15)._m0[13].x, (*spvDescriptorSet0.fp_c15)._m0[13].w);
    float _454 = fma(_446, (*spvDescriptorSet0.fp_c15)._m0[11].x, (*spvDescriptorSet0.fp_c15)._m0[11].z);
    float _456 = _436 * 0.636619746685028076171875;
    float _458 = fma(_446, (*spvDescriptorSet0.fp_c15)._m0[12].x, (*spvDescriptorSet0.fp_c15)._m0[12].z);
    float _460 = fma(_448, (*spvDescriptorSet0.fp_c15)._m0[11].x, (*spvDescriptorSet0.fp_c15)._m0[11].w);
    float _462 = fma(_448, (*spvDescriptorSet0.fp_c15)._m0[12].x, (*spvDescriptorSet0.fp_c15)._m0[12].w);
    float _464 = fma(_446, (*spvDescriptorSet0.fp_c15)._m0[10].x, (*spvDescriptorSet0.fp_c15)._m0[10].z);
    float _466 = fma(_448, (*spvDescriptorSet0.fp_c15)._m0[10].x, (*spvDescriptorSet0.fp_c15)._m0[10].w);
    float _468 = fma(_444, 0.5, 0.5);
    float _470 = -_440;
    float _472 = fma(_456, _470, 1.0);
    float _474 = _90 * _382;
    float _476 = _90 * _390;
    float2 _1954 = float2(_450, _452);
    float3 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_1954, float2(0.0), isnan(_1954))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_1954, float2(0.0), isnan(_1954))).xyz;
    float _482 = _480.x;
    float _484 = _480.y;
    float _486 = _480.z;
    float2 _1970 = float2(_454, _460);
    float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1970, float2(0.0), isnan(_1970))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1970, float2(0.0), isnan(_1970))).xyz;
    float _490 = _488.x;
    float _492 = _488.y;
    float _494 = _488.z;
    float2 _1984 = float2(_458, _462);
    float3 _496 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1984, float2(0.0), isnan(_1984))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1984, float2(0.0), isnan(_1984))).xyz;
    float _498 = _496.x;
    float _500 = _496.y;
    float _502 = _496.z;
    float2 _1998 = float2(_472, _468);
    float3 _504 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_1998, float2(0.0), isnan(_1998))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_1998, float2(0.0), isnan(_1998))).xyz;
    float _506 = _504.x;
    float _508 = _504.y;
    float _510 = _504.z;
    float2 _2012 = float2(_474, _476);
    float2 _514 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2012, float2(0.0), isnan(_2012))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2012, float2(0.0), isnan(_2012))).xy;
    float _516 = _514.x;
    float _518 = _514.y;
    float2 _2024 = float2(_464, _466);
    float4 _521 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2024, float2(0.0), isnan(_2024))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2024, float2(0.0), isnan(_2024))).xyzw;
    float _523 = _521.x;
    float _525 = _521.y;
    float _527 = _521.z;
    float _529 = _521.w;
    float _531 = spvFAdd(_284, 9.9999997473787516355514526367188e-06);
    float _533 = _96 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _535 = _96 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _537 = abs(_108);
    bool _539 = _537 > 0.00999999977648258209228515625;
    float _541 = 1.0 / _531;
    float _543 = fma(_94, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _533);
    float _545 = fma(_94, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _535);
    float _547 = _539 ? _108 : 0.00999999977648258209228515625;
    float _549 = fma(_92, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _543);
    float _551 = fma(_92, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _545);
    float _553 = _549 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _555 = _551 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _557 = _547 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _559 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _561 = trunc(_553);
    int _564 = int(_561);
    float _566 = _108 * _541;
    float _568 = _112 * _541;
    float _570 = _118 * _541;
    float _572 = precise::max(_557, -127.0);
    float _574 = _566 + (*spvDescriptorSet0.fp_c9)._m0[67].y;
    float _576 = trunc(_555);
    int _578 = int(_576);
    float _580 = _568 + (*spvDescriptorSet0.fp_c9)._m0[67].x;
    float _582 = in.m_56.w;
    float _584 = gl_FragCoord.w;
    float _586 = _582 * _584;
    float _588 = _574 * _574;
    float _590 = _570 + (*spvDescriptorSet0.fp_c9)._m0[67].z;
    float _592 = fma(_580, _580, _588);
    int _594 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _596 = _564 + _594;
    int _598 = _596 + 1;
    float _600 = -_572;
    float _602 = exp2(_600);
    float _604 = fma(_590, _590, _592);
    bool _606 = _598 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    int _608 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _610 = _578 + _608;
    int _612 = _610 + 1;
    float _614 = rsqrt(_604);
    int _616 = _598 | _612;
    bool _618 = _616 < 0;
    bool _620 = _618 || _606;
    float _622 = -_559;
    float _624 = exp2(_622);
    float _626 = -_602;
    float _628 = _626 + 1.0;
    bool _630 = _612 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _632 = _630 || _620;
    float _634 = 1.0 / _572;
    float _636 = _574 * _614;
    float _638 = _90 * _586;
    float _640 = _590 * _614;
    float _642 = _636 * (*spvDescriptorSet0.fp_c9)._m0[67].y;
    float _644 = _624 * _628;
    float _646 = _566 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _648 = _580 * _614;
    float _650 = fma(_568, (*spvDescriptorSet0.fp_c9)._m0[69].x, _646);
    float _652 = -_638;
    float _654 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _656 = _652 + _654;
    float _658 = fma(_648, (*spvDescriptorSet0.fp_c9)._m0[67].x, _642);
    float _660 = _644 * _634;
    float _662 = fma(_570, (*spvDescriptorSet0.fp_c9)._m0[69].z, _650);
    float _664 = _638;
    if (_632)
    {
        _664 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _666 = _664;
    float _668 = _666;
    if (!_632)
    {
        int _670 = _612 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _672 = _670 + _598;
        float _674 = floor(_555);
        int _676 = _672 << 2;
        int _678 = _672 >> 2;
        int _680 = 12 & _676;
        float _682 = floor(_553);
        int _684 = _678 << 4;
        int _686 = _684 + _680;
        int _688 = _686 + 16256;
        uint _691 = uint(int(uint(_688) >> uint(2)));
        uint _693 = uint(int(uint(int(_691)) >> uint(2)));
        int _695 = int(_691) & 3;
        float _697 = (*spvDescriptorSet0.fp_c9)._m0[int(_693)][_695];
        float _699 = -_674;
        float _701 = _555 + _699;
        float _703 = -_682;
        float _705 = _553 + _703;
        float _707 = rint(_697);
        float _709 = precise::max(_707, 0.0);
        uint _711 = uint(_709);
        uint _713 = clamp(_711, 0u, 65535u);
        float3 _2334 = float3(_705, _701, float(int(_713)));
        float3 _2338 = select(_2334, float3(0.0), isnan(_2334));
        float _715 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, _2338.xy, uint(rint(_2338.z))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, _2338.xy, uint(rint(_2338.z))).x;
        int _717 = _672 << 4;
        int _719 = _717 + 17904;
        int _721 = _686 + 24304;
        uint _723 = uint(int(uint(_721) >> uint(2)));
        uint _725 = uint(int(uint(int(_723)) >> uint(2)));
        int _727 = int(_723) & 3;
        float _729 = (*spvDescriptorSet0.fp_c9)._m0[int(_725)][_727];
        uint _731 = uint(int(uint(_719) >> uint(2)));
        uint _733 = uint(int(uint(int(_731)) >> uint(2)));
        int _735 = int(_731) & 3;
        float _737 = (*spvDescriptorSet0.fp_c9)._m0[int(_733)][_735];
        int _739 = int(_731) + 1;
        uint _741 = uint(int(uint(_739) >> uint(2)));
        int _743 = _739 & 3;
        float _745 = (*spvDescriptorSet0.fp_c9)._m0[int(_741)][_743];
        int _747 = _719 + 8;
        uint _749 = uint(int(uint(_747) >> uint(2)));
        uint _751 = uint(int(uint(int(_749)) >> uint(2)));
        int _753 = int(_749) & 3;
        float _755 = (*spvDescriptorSet0.fp_c9)._m0[int(_751)][_753];
        int _757 = int(_749) + 1;
        uint _759 = uint(int(uint(_757) >> uint(2)));
        int _761 = _757 & 3;
        float _763 = (*spvDescriptorSet0.fp_c9)._m0[int(_759)][_761];
        float _765 = _96 * _745;
        float _767 = fma(_94, _737, _765);
        float _769 = 1.0 / _729;
        float _771 = fma(_92, _755, _767);
        float _773 = _729 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _775 = _771 + _763;
        float _777 = precise::clamp(_775, 0.0, 1.0);
        float _779 = -_777;
        float _781 = _779 + _715;
        float _783 = fma(_769, (*spvDescriptorSet0.fp_c13)._m0[4].w, _781);
        float _785 = _773 * _783;
        float _787 = exp2(_785);
        float _789 = 0.0 + _787;
        float _791 = precise::clamp(_789, 0.0, 1.0);
        float _793 = precise::min(_791, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _668 = _793;
    }
    float _795 = _668;
    float _797 = _656 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _799 = precise::clamp(_797, 0.0, 1.0);
    float _801 = -_795;
    float _803 = _801 + 1.0;
    float _805 = in.m_58.w;
    float _807 = gl_FragCoord.w;
    float _809 = _805 * _807;
    float _811 = fma(_662, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _813 = fma(_799, _803, _795);
    float _815 = in.m_56.x;
    float _817 = gl_FragCoord.w;
    float _819 = _815 * _817;
    float _821 = fma(_518, 2.007874011993408203125, -1.007874011993408203125);
    float _823 = fma(_811, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _825 = fma(_516, 2.007874011993408203125, -1.007874011993408203125);
    float _827 = in.m_56.z;
    float _829 = gl_FragCoord.w;
    float _831 = _827 * _829;
    float _833 = _821 * _821;
    float _835 = _821 * (*spvDescriptorSet0.fp_c14)._m0[0].y;
    float _837 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _839 = fma(_837, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _841 = abs(_823);
    float _843 = log2(_841);
    float _845 = fma(_825, _825, _833);
    float _847 = _825 * (*spvDescriptorSet0.fp_c14)._m0[0].y;
    float _849 = _406 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _851 = fma(_640, (*spvDescriptorSet0.fp_c9)._m0[67].z, _658);
    float _853 = precise::clamp(_851, 0.0, 1.0);
    float _855 = -_845;
    float _857 = _855 + 1.0;
    float _859 = precise::clamp(_857, 0.0, 1.0);
    float _861 = _502 * 0.4774648249149322509765625;
    float _863 = sqrt(_859);
    float _865 = _853 * _853;
    float _867 = _484 + (*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _869 = precise::clamp(_867, 0.0, 1.0);
    float _871 = -(*spvDescriptorSet0.fp_c9)._m0[1001].y;
    float _873 = _871 + (*spvDescriptorSet0.fp_c9)._m0[1000].y;
    float _875 = -(*spvDescriptorSet0.fp_c9)._m0[1001].z;
    float _877 = _875 + (*spvDescriptorSet0.fp_c9)._m0[1000].z;
    float _879 = _843 * 1.5;
    float _881 = exp2(_849);
    float _883 = _284 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _885 = _529 * _865;
    float _887 = _885 * 2.0;
    float _889 = _90 * _809;
    float _891 = _660 * _883;
    float _893 = fma(_529, 0.5, _887);
    float _895 = exp2(_879);
    float _897 = _889 * _863;
    float _899 = _893 + (-1.0);
    float _901 = _90 * _831;
    float _903 = _897 * _897;
    float _905 = -_881;
    float _907 = _905 + 1.0;
    float _909 = fma(_847, _847, _903);
    float _911 = -(*spvDescriptorSet0.fp_c9)._m0[1001].x;
    float _913 = _911 + (*spvDescriptorSet0.fp_c9)._m0[1000].x;
    float _915 = fma(_835, _835, _909);
    float _917 = _895 * 12.56637096405029296875;
    float _919 = rsqrt(_915);
    float _921 = 1.0 / _917;
    float _923 = _897 * _919;
    float _925 = in.m_56.y;
    float _927 = gl_FragCoord.w;
    float _929 = _925 * _927;
    float _931 = _839 * _921;
    float _933 = _847 * _919;
    float _935 = _835 * _919;
    float _937 = precise::min(_813, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _939 = -_891;
    float _941 = exp2(_939);
    float _943 = _568 * _933;
    float _945 = -_566;
    float _947 = -_943;
    float _949 = fma(_945, _923, _947);
    float _951 = _907 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _953 = _933 * (*spvDescriptorSet0.fp_c9)._m0[67].x;
    float _955 = -_570;
    float _957 = fma(_955, _935, _949);
    float _959 = precise::clamp(_957, 0.0, 1.0);
    float _961 = -_951;
    float _963 = _961 + 1.0;
    float _965 = -_923;
    float _967 = -_953;
    float _969 = fma(_965, (*spvDescriptorSet0.fp_c9)._m0[67].y, _967);
    float _971 = -_941;
    float _973 = _971 + 1.0;
    float _975 = -_935;
    float _977 = fma(_975, (*spvDescriptorSet0.fp_c9)._m0[67].z, _969);
    float _979 = precise::clamp(_977, 0.0, 1.0);
    float _981 = -_959;
    float _983 = _981 + 1.0;
    float _985 = _973 * _931;
    float _987 = _90 * _819;
    float _989 = _90 * _929;
    float _991 = _937 * _985;
    float _993 = -(*spvDescriptorSet0.fp_c9)._m0[1007].y;
    float _995 = _993 + (*spvDescriptorSet0.fp_c9)._m0[1006].y;
    float _997 = fma(_923, 0.5, 0.5);
    float _999 = _923 * _923;
    float _1001 = -(*spvDescriptorSet0.fp_c9)._m0[1007].x;
    float _1003 = _1001 + (*spvDescriptorSet0.fp_c9)._m0[1006].x;
    float _1005 = fma(_997, _995, (*spvDescriptorSet0.fp_c9)._m0[1007].y);
    float _1007 = -(*spvDescriptorSet0.fp_c9)._m0[1007].z;
    float _1009 = _1007 + (*spvDescriptorSet0.fp_c9)._m0[1006].z;
    float _1011 = fma(_997, _1003, (*spvDescriptorSet0.fp_c9)._m0[1007].x);
    float _1013 = _951 * _941;
    float _1015 = _1005 * 0.715200006961822509765625;
    float _1017 = fma(_997, _1009, (*spvDescriptorSet0.fp_c9)._m0[1007].z);
    float _1019 = fma(_933, _933, _999);
    float _1021 = _941 * _963;
    float _1023 = fma(_1011, 0.2125999927520751953125, _1015);
    float _1025 = fma(_997, _913, (*spvDescriptorSet0.fp_c9)._m0[1001].x);
    float _1027 = fma(_935, _935, _1019);
    float _1029 = precise::clamp(_1027, 0.0, 1.0);
    float _1031 = -_979;
    float _1033 = _1031 + 1.0;
    float _1035 = fma(_1017, 0.072200000286102294921875, _1023);
    float _1037 = _983 * _983;
    float _1039 = fma(_997, _873, (*spvDescriptorSet0.fp_c9)._m0[1001].y);
    float _1041 = _1033 * _1033;
    float _1043 = _494 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1045 = _1037 * _1037;
    float _1047 = 1.0 / _1035;
    float _1049 = _1041 * _1041;
    float _1051 = _861 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1053 = _983 * _1045;
    float _1055 = _1039 * 0.31830990314483642578125;
    float _1057 = fma(_997, _877, (*spvDescriptorSet0.fp_c9)._m0[1001].z);
    float _1059 = _1057 * 0.31830990314483642578125;
    float _1061 = precise::max(_1043, _1059);
    float _1063 = _1047 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1065 = precise::clamp(_1063, 0.0, 1.0);
    float _1067 = fma(_1065, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _1069 = fma(_1029, 0.5, 0.5);
    float _1071 = _1033 * _1049;
    float _1073 = _989 * 0.18672408163547515869140625;
    float _1075 = _1067 * 0.31830990314483642578125;
    float _1077 = fma(_1071, _899, 1.0);
    float _1079 = fma(_987, 0.095146648585796356201171875, _1073);
    float _1081 = _1011 * _1075;
    float _1083 = _1005 * _1075;
    float _1085 = _1017 * _1075;
    float _1087 = _500 * 0.4774648249149322509765625;
    float _1089 = fma(_901, 0.0364394821226596832275390625, _1079);
    float _1091 = _498 * 0.4774648249149322509765625;
    float _1093 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1095 = _1087 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1097 = _490 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1099 = _1025 * 0.31830990314483642578125;
    float _1101 = precise::max(_1089, 0.00999999977648258209228515625);
    float _1103 = _492 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1105 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1107 = _1091 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1109 = fma(_486, _1093, _1095);
    float _1111 = _959 * (-9.27999973297119140625);
    float _1113 = precise::max(_1097, _1099);
    float _1115 = fma(_486, _1105, _1107);
    float _1117 = _1109 * 0.586610972881317138671875;
    float _1119 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1121 = exp2(_1111);
    float _1123 = fma(_1115, 0.298911988735198974609375, _1117);
    float _1125 = fma(_486, _1119, _1051);
    float _1127 = precise::max(_1103, _1055);
    float _1129 = fma(_529, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1131 = fma(_1053, _899, 1.0);
    float _1133 = fma(_1125, 0.114477999508380889892578125, _1123);
    float _1135 = -_529;
    float _1137 = _1135 + 1.0;
    float _1139 = 1.0 / _1101;
    float _1141 = _869 * _1113;
    float _1143 = _869 * _1127;
    float _1145 = _1137 * _1137;
    float _1147 = _869 * _1061;
    float _1149 = _1077 * _1131;
    float _1151 = precise::max(_1051, _1085);
    float _1153 = _523 * _1141;
    float _1155 = precise::min(_1145, _1121);
    float _1157 = fma(_529, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1159 = fma(_486, _1119, _1151);
    float _1161 = precise::min(_1069, 1.0);
    float _1163 = fma(_1137, _1155, _1129);
    float _1165 = _527 * _1147;
    float _1167 = _1133 * _1139;
    float _1169 = fma(_529, -0.337748348712921142578125, 1.0);
    float _1171 = fma(_1163, 1.03999996185302734375, _1157);
    float _1173 = precise::clamp(_1171, 0.0, 1.0);
    float _1175 = _527 * _1159;
    float _1177 = precise::min(_1167, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1179 = _1169 * _1149;
    float _1181 = fma(_529, -0.572000026702880859375, 1.03999996185302734375);
    float _1183 = precise::max(_1095, _1083);
    float _1185 = _1161 * _1153;
    float _1187 = _979 * _1179;
    float _1189 = fma(_1163, -1.03999996185302734375, _1181);
    float _1191 = precise::clamp(_1189, 0.0, 1.0);
    float _1193 = precise::max(_1107, _1081);
    float _1195 = _1177 * 0.31830990314483642578125;
    float _1197 = _1187 * 0.31830990314483642578125;
    float _1199 = fma(_1191, 0.039999999105930328369140625, _1173);
    float _1201 = fma(_486, _1093, _1183);
    float _1203 = fma(_486, _1105, _1193);
    float _1205 = _1197 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1207 = _1199 * _1195;
    float _1209 = _525 * _1201;
    float _1211 = _523 * _1203;
    float _1213 = _523 * _1205;
    float _1215 = _1197 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1217 = _987 * _1207;
    float _1219 = _989 * _1207;
    float _1221 = _901 * _1207;
    float _1223 = _525 * _1143;
    float _1225 = _1197 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1227 = _525 * _1215;
    float _1229 = fma(_482, _1213, _1217);
    float _1231 = _991 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1233 = _527 * _1225;
    float _1235 = fma(_482, _1227, _1219);
    float _1237 = fma(_1161, _1211, _1229);
    float _1239 = _991 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1241 = fma(_482, _1233, _1221);
    float _1243 = fma(_1161, _1209, _1235);
    float _1245 = _991 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1247 = _1161 * _1223;
    float _1249 = _1161 * _1165;
    float _1251 = fma(_1161, _1175, _1241);
    float _1253 = fma(_506, _1013, _1245);
    float _1255 = precise::max(0.0, _1243);
    float _1257 = fma(_508, _1013, _1239);
    float _1259 = precise::max(0.0, _1237);
    float _1261 = fma(_510, _1013, _1231);
    float _1263 = precise::max(0.0, _1185);
    float _1265 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1267 = _284 + _1265;
    float _1269 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1271 = _284 + _1269;
    float _1273 = precise::max(0.0, _1247);
    float _1275 = fma(_1021, _1255, _1257);
    float _1277 = precise::max(0.0, _1249);
    float _1279 = fma(_1021, _1259, _1253);
    float _1281 = precise::max(0.0, _1251);
    float _1283 = _1267 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1285 = precise::clamp(_1283, 0.0, 1.0);
    float _1287 = _1021 * _1263;
    float _1289 = _1271 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1291 = precise::clamp(_1289, 0.0, 1.0);
    float _1293 = _1021 * _1273;
    float _1295 = _1021 * _1277;
    float _1297 = fma(_1021, _1281, _1261);
    float _1299 = fma(_1285, _1287, _1279);
    float _1301 = fma(_1291, _1287, _1279);
    float _1303 = fma(_1285, _1293, _1275);
    float _1305 = fma(_1291, _1293, _1275);
    float _1307 = fma(_1285, _1295, _1297);
    float _1309 = fma(_1291, _1295, _1297);
    out.m_61.x = _1299;
    out.m_61.y = _1303;
    out.m_61.z = _1307;
    out.m_61.w = 1.0;
    out.m_63.x = _1301;
    out.m_63.y = _1305;
    out.m_63.z = _1309;
    out.m_63.w = 1.0;
    return out;
}

