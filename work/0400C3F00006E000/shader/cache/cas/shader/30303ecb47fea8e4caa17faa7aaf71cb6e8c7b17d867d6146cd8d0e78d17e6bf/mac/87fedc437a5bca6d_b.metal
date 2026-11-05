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
    texture2d<float> fp_t_tcb_16 [[id(4)]];
    sampler fp_t_tcb_16Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_12 [[id(6)]];
    sampler fp_t_tcb_12Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_14 [[id(8)]];
    sampler fp_t_tcb_14Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_1A [[id(10)]];
    sampler fp_t_tcb_1ASmplr [[id(11)]];
    texture2d<float> fp_t_tcb_8 [[id(12)]];
    sampler fp_t_tcb_8Smplr [[id(13)]];
    texture2d<float> fp_t_tcb_10 [[id(14)]];
    sampler fp_t_tcb_10Smplr [[id(15)]];
    texture2d_array<float> fp_t_tcb_18 [[id(16)]];
    sampler fp_t_tcb_18Smplr [[id(17)]];
    sampler fp_t_tcb_16Smplr_w [[id(18)]];
    sampler fp_t_tcb_12Smplr_w [[id(19)]];
    sampler fp_t_tcb_14Smplr_w [[id(20)]];
    sampler fp_t_tcb_1ASmplr_w [[id(21)]];
    sampler fp_t_tcb_8Smplr_w [[id(22)]];
    sampler fp_t_tcb_10Smplr_w [[id(23)]];
    sampler fp_t_tcb_18Smplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
    float4 m_59 [[color(1)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_50 [[user(locn5)]];
    float4 m_54 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = gl_FragCoord.w;
    float _68 = in.m_50.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_50.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_50.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / _66;
    float _88 = _86 * _72;
    float _90 = _86 * _78;
    float _92 = _86 * _84;
    float _94 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _96 = _88 + _94;
    float _98 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _100 = _90 + _98;
    float _102 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _104 = _92 + _102;
    float _106 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _108 = _90 + _106;
    float _110 = _96 * _96;
    float _112 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _114 = _88 + _112;
    float _116 = fma(_100, _100, _110);
    float _118 = sqrt(_116);
    bool _122 = _118 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _124 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _126 = _118 + _124;
    float _128 = 0.0;
    float _130 = _126;
    float _132 = _84;
    if (_122)
    {
        float _134 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _128 = _134;
    }
    float _136 = _128;
    float _138 = 0.0;
    if (_122)
    {
        float _140 = rsqrt(_116);
        _138 = _140;
    }
    float _142 = _138;
    float _144 = _136;
    float _146 = _142;
    if (_122)
    {
        float _148 = _126 * _136;
        _130 = _148;
    }
    float _150 = _130;
    if (_122)
    {
        float _152 = _92 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _144 = _152;
    }
    float _154 = _144;
    float _156 = 0.0;
    float _158 = _154;
    if (_122)
    {
        float _160 = _150 * 0.15915493667125701904296875;
        _156 = _160;
    }
    float _162 = _156;
    float _164 = 0.0;
    if (_122)
    {
        float _166 = _162 * 6.283185482025146484375;
        float _168 = cos(_166);
        _164 = _168;
    }
    float _170 = _164;
    float _172 = _150;
    if (_122)
    {
        float _174 = _162 * 6.283185482025146484375;
        float _176 = sin(_174);
        _172 = _176;
    }
    float _178 = _172;
    float _180 = 0.0;
    if (_122)
    {
        float _182 = _170 + (-1.0);
        _180 = _182;
    }
    float _184 = _180;
    float _186 = _184;
    if (_122)
    {
        float _188 = _184 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _132 = _188;
    }
    float _190 = _132;
    if (!_122)
    {
        _186 = _90;
    }
    float _192 = _186;
    float _194 = 0.0;
    float _196 = _178;
    float _198 = _192;
    if (_122)
    {
        float _200 = fma(_178, _154, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _194 = _200;
    }
    float _202 = _194;
    if (!_122)
    {
        _158 = _92;
    }
    float _204 = _158;
    float _206 = _204;
    if (_122)
    {
        float _208 = fma(_92, _170, _190);
        _206 = _208;
    }
    float _210 = _206;
    if (!_122)
    {
        _196 = _88;
    }
    float _212 = _196;
    float _214 = _212;
    if (_122)
    {
        float _216 = _142 * _202;
        _146 = _216;
    }
    float _218 = _146;
    if (_122)
    {
        float _220 = fma(_100, _218, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _198 = _220;
    }
    float _222 = _198;
    float _224 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _226 = _210 + _224;
    float _228 = _226;
    if (_122)
    {
        float _230 = fma(_96, _218, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _214 = _230;
    }
    float _232 = _214;
    float _234 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _236 = _222 + _234;
    float _238 = _226 * _226;
    float _240 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _242 = _232 + _240;
    float _244 = fma(_236, _236, _238);
    float _246 = fma(_242, _242, _244);
    float _248 = rsqrt(_246);
    float _250 = _248 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _252 = _236 * _250;
    float _254 = _242 * _250;
    float _256 = _104 * _104;
    float _258 = _252 * _252;
    float _260 = _254 * _254;
    float _262 = fma(_108, _108, _256);
    float _264 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _266 = _258 + _260;
    float _268 = fma(_114, _114, _262);
    float _270 = precise::max(0.0, _264);
    float _272 = sqrt(_266);
    float _274 = -_250;
    float _276 = -_270;
    float _278 = fma(_226, _274, _276);
    float _280 = sqrt(_268);
    bool _282 = _272 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _284 = (*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _286 = _272;
    float _288 = _264;
    float _290 = _270;
    if (!_282)
    {
        _228 = _260;
    }
    float _292 = _228;
    float _294 = _292;
    if (!_282)
    {
        _284 = _258;
    }
    float _296 = _284;
    float _298 = _296;
    if (!_282)
    {
        _286 = _252;
    }
    float _300 = _286;
    float _302 = _300;
    if (!_282)
    {
        _288 = _278;
    }
    float _304 = _288;
    float _306 = _304;
    if (!_282)
    {
        _290 = _254;
    }
    float _308 = _290;
    bool _310 = !_282;
    float _312 = _308;
    if (!_310)
    {
        float _314 = _252 * _252;
        float _316 = _254 * _254;
        float _318 = _278 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _320 = _314 + _316;
        float _322 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _324 = sqrt(_320);
        float _326 = rsqrt(_320);
        float _328 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _330 = _324 + _328;
        float _332 = _330 * _322;
        float _334 = _332 * 0.15915493667125701904296875;
        float _336 = _334 * 6.283185482025146484375;
        float _338 = sin(_336);
        float _340 = _334 * 6.283185482025146484375;
        float _342 = cos(_340);
        float _344 = fma(_338, _318, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _346 = _326 * _344;
        float _348 = _342 + (-1.0);
        float _350 = _252 * _346;
        float _352 = _348 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _354 = _254 * _346;
        float _356 = fma(_278, _342, _352);
        float _358 = _350 * _350;
        float _360 = _354 * _354;
        _306 = _356;
        _298 = _358;
        _294 = _360;
        _302 = _350;
        _312 = _354;
    }
    float _362 = _306;
    float _364 = _298;
    float _366 = _294;
    float _368 = _302;
    float _370 = _312;
    float _372 = fma(_362, _362, _364);
    float _374 = in.m_52.z;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_52.w;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = _372 + _366;
    float _388 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _390 = fma(_280, (*spvDescriptorSet0.fp_c9)._m0[63].x, _388);
    float _392 = precise::clamp(_390, 0.0, 1.0);
    float _394 = rsqrt(_386);
    float _396 = -_392;
    float _398 = _396 + 1.0;
    float _400 = abs(_398);
    float _402 = log2(_400);
    float _404 = _394 * _368;
    float _406 = _394 * _362;
    float _408 = _394 * _370;
    float _410 = _404 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _412 = _402 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _414 = -_410;
    float _416 = fma(_406, (*spvDescriptorSet0.fp_c9)._m0[69].y, _414);
    float _418 = _86 * _384;
    float _420 = -_408;
    float _422 = fma(_420, (*spvDescriptorSet0.fp_c9)._m0[69].z, _416);
    float _424 = exp2(_412);
    float _426 = fma(_422, -0.5, 0.5);
    float _428 = fma(_422, 0.5, 0.5);
    float _430 = _406 + 1.0;
    float _432 = sqrt(_426);
    float _434 = fma(_428, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _436 = fma(_428, _434, -0.212114393711090087890625);
    float _438 = -_406;
    float _440 = fma(_424, _430, _438);
    float _442 = fma(_428, _436, 1.570728778839111328125);
    float _444 = fma(_90, (*spvDescriptorSet0.fp_c15)._m0[5].x, (*spvDescriptorSet0.fp_c15)._m0[5].z);
    float _446 = fma(_88, (*spvDescriptorSet0.fp_c15)._m0[5].x, (*spvDescriptorSet0.fp_c15)._m0[5].w);
    float _448 = fma(_440, 0.5, 0.5);
    float _450 = fma(_444, (*spvDescriptorSet0.fp_c15)._m0[13].x, (*spvDescriptorSet0.fp_c15)._m0[13].z);
    float _452 = fma(_446, (*spvDescriptorSet0.fp_c15)._m0[13].x, (*spvDescriptorSet0.fp_c15)._m0[13].w);
    float _454 = _432 * 0.636619746685028076171875;
    float _456 = fma(_444, (*spvDescriptorSet0.fp_c15)._m0[11].x, (*spvDescriptorSet0.fp_c15)._m0[11].z);
    float _458 = fma(_444, (*spvDescriptorSet0.fp_c15)._m0[12].x, (*spvDescriptorSet0.fp_c15)._m0[12].z);
    float _460 = fma(_446, (*spvDescriptorSet0.fp_c15)._m0[12].x, (*spvDescriptorSet0.fp_c15)._m0[12].w);
    float _462 = fma(_446, (*spvDescriptorSet0.fp_c15)._m0[11].x, (*spvDescriptorSet0.fp_c15)._m0[11].w);
    float _464 = fma(_444, (*spvDescriptorSet0.fp_c15)._m0[10].x, (*spvDescriptorSet0.fp_c15)._m0[10].z);
    float _466 = fma(_446, (*spvDescriptorSet0.fp_c15)._m0[10].x, (*spvDescriptorSet0.fp_c15)._m0[10].w);
    float _468 = -_442;
    float _470 = fma(_454, _468, 1.0);
    float _472 = _86 * _378;
    float2 _1934 = float2(_450, _452);
    float3 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_1934, float2(0.0), isnan(_1934))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_1934, float2(0.0), isnan(_1934))).xyz;
    float _478 = _476.x;
    float _480 = _476.y;
    float _482 = _476.z;
    float2 _1950 = float2(_456, _462);
    float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1950, float2(0.0), isnan(_1950))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1950, float2(0.0), isnan(_1950))).xyz;
    float _486 = _484.x;
    float _488 = _484.y;
    float _490 = _484.z;
    float2 _1964 = float2(_458, _460);
    float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1964, float2(0.0), isnan(_1964))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1964, float2(0.0), isnan(_1964))).xyz;
    float _494 = _492.x;
    float _496 = _492.y;
    float _498 = _492.z;
    float2 _1978 = float2(_470, _448);
    float3 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_1978, float2(0.0), isnan(_1978))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_1978, float2(0.0), isnan(_1978))).xyz;
    float _502 = _500.x;
    float _504 = _500.y;
    float _506 = _500.z;
    float2 _1992 = float2(_472, _418);
    float2 _510 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1992, float2(0.0), isnan(_1992))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1992, float2(0.0), isnan(_1992))).xy;
    float _512 = _510.x;
    float _514 = _510.y;
    float2 _2004 = float2(_464, _466);
    float4 _517 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2004, float2(0.0), isnan(_2004))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2004, float2(0.0), isnan(_2004))).xyzw;
    float _519 = _517.x;
    float _521 = _517.y;
    float _523 = _517.z;
    float _525 = _517.w;
    float _527 = spvFAdd(_280, 9.9999997473787516355514526367188e-06);
    float _529 = _92 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _531 = _92 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _533 = abs(_104);
    bool _535 = _533 > 0.00999999977648258209228515625;
    float _537 = 1.0 / _527;
    float _539 = fma(_90, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _529);
    float _541 = fma(_90, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _531);
    float _543 = _535 ? _104 : 0.00999999977648258209228515625;
    float _545 = in.m_54.w;
    float _547 = gl_FragCoord.w;
    float _549 = _545 * _547;
    float _551 = fma(_88, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _539);
    float _553 = fma(_88, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _541);
    float _555 = _543 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _557 = _551 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _559 = _553 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _561 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _563 = trunc(_557);
    int _566 = int(_563);
    float _568 = precise::max(_555, -127.0);
    float _570 = _104 * _537;
    float _572 = _108 * _537;
    float _574 = _114 * _537;
    float _576 = _570 + (*spvDescriptorSet0.fp_c9)._m0[67].y;
    float _578 = trunc(_559);
    int _580 = int(_578);
    float _582 = _572 + (*spvDescriptorSet0.fp_c9)._m0[67].x;
    float _584 = _574 + (*spvDescriptorSet0.fp_c9)._m0[67].z;
    float _586 = _576 * _576;
    float _588 = fma(_582, _582, _586);
    float _590 = _570 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    int _592 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _594 = _566 + _592;
    int _596 = _594 + 1;
    float _598 = -_568;
    float _600 = exp2(_598);
    float _602 = fma(_584, _584, _588);
    float _604 = fma(_572, (*spvDescriptorSet0.fp_c9)._m0[69].x, _590);
    bool _606 = _596 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    float _608 = fma(_574, (*spvDescriptorSet0.fp_c9)._m0[69].z, _604);
    int _610 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _612 = _580 + _610;
    int _614 = _612 + 1;
    float _616 = rsqrt(_602);
    float _618 = _86 * _549;
    float _620 = fma(_608, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    int _622 = _596 | _614;
    bool _624 = _622 < 0;
    bool _626 = _624 || _606;
    float _628 = -_561;
    float _630 = exp2(_628);
    float _632 = fma(_620, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _634 = -_600;
    float _636 = _634 + 1.0;
    bool _638 = _614 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _640 = _638 || _626;
    float _642 = 1.0 / _568;
    float _644 = _576 * _616;
    float _646 = _584 * _616;
    float _648 = _644 * (*spvDescriptorSet0.fp_c9)._m0[67].y;
    float _650 = abs(_632);
    float _652 = log2(_650);
    float _654 = _630 * _636;
    float _656 = _582 * _616;
    float _658 = -_618;
    float _660 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _662 = _658 + _660;
    float _664 = _582;
    if (_640)
    {
        _664 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _666 = _664;
    float _668 = fma(_656, (*spvDescriptorSet0.fp_c9)._m0[67].x, _648);
    float _670 = _666;
    if (!_640)
    {
        int _672 = _614 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _674 = _672 + _596;
        float _676 = floor(_557);
        int _678 = _674 << 2;
        int _680 = _674 >> 2;
        int _682 = 12 & _678;
        int _684 = _680 << 4;
        int _686 = _684 + _682;
        float _688 = floor(_559);
        int _690 = _686 + 16256;
        uint _693 = uint(int(uint(_690) >> uint(2)));
        uint _695 = uint(int(uint(int(_693)) >> uint(2)));
        int _697 = int(_693) & 3;
        float _699 = (*spvDescriptorSet0.fp_c9)._m0[int(_695)][_697];
        float _701 = -_676;
        float _703 = _557 + _701;
        float _705 = -_688;
        float _707 = _559 + _705;
        float _709 = rint(_699);
        float _711 = precise::max(_709, 0.0);
        uint _713 = uint(_711);
        uint _715 = clamp(_713, 0u, 65535u);
        float3 _2324 = float3(_703, _707, float(int(_715)));
        float3 _2328 = select(_2324, float3(0.0), isnan(_2324));
        float _717 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, _2328.xy, uint(rint(_2328.z))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, _2328.xy, uint(rint(_2328.z))).x;
        int _719 = _674 << 4;
        int _721 = _719 + 17904;
        int _723 = _686 + 24304;
        uint _725 = uint(int(uint(_723) >> uint(2)));
        uint _727 = uint(int(uint(int(_725)) >> uint(2)));
        int _729 = int(_725) & 3;
        float _731 = (*spvDescriptorSet0.fp_c9)._m0[int(_727)][_729];
        uint _733 = uint(int(uint(_721) >> uint(2)));
        uint _735 = uint(int(uint(int(_733)) >> uint(2)));
        int _737 = int(_733) & 3;
        float _739 = (*spvDescriptorSet0.fp_c9)._m0[int(_735)][_737];
        int _741 = int(_733) + 1;
        uint _743 = uint(int(uint(_741) >> uint(2)));
        int _745 = _741 & 3;
        float _747 = (*spvDescriptorSet0.fp_c9)._m0[int(_743)][_745];
        int _749 = _721 + 8;
        uint _751 = uint(int(uint(_749) >> uint(2)));
        uint _753 = uint(int(uint(int(_751)) >> uint(2)));
        int _755 = int(_751) & 3;
        float _757 = (*spvDescriptorSet0.fp_c9)._m0[int(_753)][_755];
        int _759 = int(_751) + 1;
        uint _761 = uint(int(uint(_759) >> uint(2)));
        int _763 = _759 & 3;
        float _765 = (*spvDescriptorSet0.fp_c9)._m0[int(_761)][_763];
        float _767 = _92 * _747;
        float _769 = fma(_90, _739, _767);
        float _771 = 1.0 / _731;
        float _773 = fma(_88, _757, _769);
        float _775 = _773 + _765;
        float _777 = precise::clamp(_775, 0.0, 1.0);
        float _779 = _731 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _781 = -_777;
        float _783 = _781 + _717;
        float _785 = fma(_771, (*spvDescriptorSet0.fp_c13)._m0[4].w, _783);
        float _787 = _779 * _785;
        float _789 = exp2(_787);
        float _791 = 0.0 + _789;
        float _793 = precise::clamp(_791, 0.0, 1.0);
        float _795 = precise::min(_793, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _670 = _795;
    }
    float _797 = _670;
    float _799 = _662 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _801 = precise::clamp(_799, 0.0, 1.0);
    float _803 = -_797;
    float _805 = _803 + 1.0;
    float _807 = _652 * 1.5;
    float _809 = _654 * _642;
    float _811 = fma(_512, 2.007874011993408203125, -1.007874011993408203125);
    float _813 = fma(_801, _805, _797);
    float _815 = fma(_514, 2.007874011993408203125, -1.007874011993408203125);
    float _817 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _819 = fma(_817, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _821 = _811 * _811;
    float _823 = exp2(_807);
    float _825 = in.m_54.y;
    float _827 = gl_FragCoord.w;
    float _829 = _825 * _827;
    float _831 = fma(_646, (*spvDescriptorSet0.fp_c9)._m0[67].z, _668);
    float _833 = precise::clamp(_831, 0.0, 1.0);
    float _835 = fma(_815, _815, _821);
    float _837 = _498 * 0.4774648249149322509765625;
    float _839 = -_835;
    float _841 = _839 + 1.0;
    float _843 = precise::clamp(_841, 0.0, 1.0);
    float _845 = _833 * _833;
    float _847 = -(*spvDescriptorSet0.fp_c9)._m0[1001].z;
    float _849 = _847 + (*spvDescriptorSet0.fp_c9)._m0[1000].z;
    float _851 = _480 + (*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _853 = precise::clamp(_851, 0.0, 1.0);
    float _855 = sqrt(_843);
    float _857 = _525 * _845;
    float _859 = _857 * 2.0;
    float _861 = _823 * 12.56637096405029296875;
    float _863 = fma(_525, 0.5, _859);
    float _865 = 1.0 / _861;
    float _867 = _402 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _869 = _863 + (-1.0);
    float _871 = fma(_855, _855, _821);
    float _873 = exp2(_867);
    float _875 = in.m_54.z;
    float _877 = gl_FragCoord.w;
    float _879 = _875 * _877;
    float _881 = fma(_815, _815, _871);
    float _883 = _819 * _865;
    float _885 = rsqrt(_881);
    float _887 = in.m_54.x;
    float _889 = gl_FragCoord.w;
    float _891 = _887 * _889;
    float _893 = -_873;
    float _895 = _893 + 1.0;
    float _897 = _815 * _885;
    float _899 = _280 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _901 = _811 * _885;
    float _903 = _855 * _885;
    float _905 = precise::min(_813, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _907 = _809 * _899;
    float _909 = _86 * _829;
    float _911 = -_907;
    float _913 = exp2(_911);
    float _915 = -(*spvDescriptorSet0.fp_c9)._m0[1001].x;
    float _917 = _915 + (*spvDescriptorSet0.fp_c9)._m0[1000].x;
    float _919 = -_913;
    float _921 = _919 + 1.0;
    float _923 = _921 * _883;
    float _925 = _86 * _891;
    float _927 = _572 * _901;
    float _929 = _905 * _923;
    float _931 = fma(_903, 0.5, 0.5);
    float _933 = _86 * _879;
    float _935 = -(*spvDescriptorSet0.fp_c9)._m0[1007].x;
    float _937 = _935 + (*spvDescriptorSet0.fp_c9)._m0[1006].x;
    float _939 = -(*spvDescriptorSet0.fp_c9)._m0[1007].y;
    float _941 = _939 + (*spvDescriptorSet0.fp_c9)._m0[1006].y;
    float _943 = -_570;
    float _945 = -_927;
    float _947 = fma(_943, _903, _945);
    float _949 = fma(_931, _917, (*spvDescriptorSet0.fp_c9)._m0[1001].x);
    float _951 = -(*spvDescriptorSet0.fp_c9)._m0[1007].z;
    float _953 = _951 + (*spvDescriptorSet0.fp_c9)._m0[1006].z;
    float _955 = fma(_931, _941, (*spvDescriptorSet0.fp_c9)._m0[1007].y);
    float _957 = _895 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _959 = fma(_931, _937, (*spvDescriptorSet0.fp_c9)._m0[1007].x);
    float _961 = fma(_931, _953, (*spvDescriptorSet0.fp_c9)._m0[1007].z);
    float _963 = _955 * 0.715200006961822509765625;
    float _965 = -_957;
    float _967 = _965 + 1.0;
    float _969 = _957 * _913;
    float _971 = _901 * (*spvDescriptorSet0.fp_c9)._m0[67].x;
    float _973 = fma(_959, 0.2125999927520751953125, _963);
    float _975 = _913 * _967;
    float _977 = -_574;
    float _979 = fma(_977, _897, _947);
    float _981 = precise::clamp(_979, 0.0, 1.0);
    float _983 = -_903;
    float _985 = -_971;
    float _987 = fma(_983, (*spvDescriptorSet0.fp_c9)._m0[67].y, _985);
    float _989 = fma(_961, 0.072200000286102294921875, _973);
    float _991 = _903 * _903;
    float _993 = -_897;
    float _995 = fma(_993, (*spvDescriptorSet0.fp_c9)._m0[67].z, _987);
    float _997 = precise::clamp(_995, 0.0, 1.0);
    float _999 = fma(_901, _901, _991);
    float _1001 = 1.0 / _989;
    float _1003 = -_981;
    float _1005 = _1003 + 1.0;
    float _1007 = -_997;
    float _1009 = _1007 + 1.0;
    float _1011 = -(*spvDescriptorSet0.fp_c9)._m0[1001].y;
    float _1013 = _1011 + (*spvDescriptorSet0.fp_c9)._m0[1000].y;
    float _1015 = fma(_897, _897, _999);
    float _1017 = precise::clamp(_1015, 0.0, 1.0);
    float _1019 = _1005 * _1005;
    float _1021 = _1009 * _1009;
    float _1023 = fma(_931, _1013, (*spvDescriptorSet0.fp_c9)._m0[1001].y);
    float _1025 = fma(_931, _849, (*spvDescriptorSet0.fp_c9)._m0[1001].z);
    float _1027 = _1019 * _1019;
    float _1029 = _1021 * _1021;
    float _1031 = _909 * 0.18672408163547515869140625;
    float _1033 = _1001 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1035 = precise::clamp(_1033, 0.0, 1.0);
    float _1037 = fma(_1035, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _1039 = fma(_1017, 0.5, 0.5);
    float _1041 = _1005 * _1027;
    float _1043 = _1009 * _1029;
    float _1045 = _1037 * 0.31830990314483642578125;
    float _1047 = _496 * 0.4774648249149322509765625;
    float _1049 = fma(_925, 0.095146648585796356201171875, _1031);
    float _1051 = _959 * _1045;
    float _1053 = _955 * _1045;
    float _1055 = _961 * _1045;
    float _1057 = _486 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1059 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1061 = _1047 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1063 = fma(_933, 0.0364394821226596832275390625, _1049);
    float _1065 = _494 * 0.4774648249149322509765625;
    float _1067 = _949 * 0.31830990314483642578125;
    float _1069 = fma(_482, _1059, _1061);
    float _1071 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1073 = _1065 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1075 = precise::max(_1063, 0.00999999977648258209228515625);
    float _1077 = _488 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1079 = _981 * (-9.27999973297119140625);
    float _1081 = precise::max(_1057, _1067);
    float _1083 = _1069 * 0.586610972881317138671875;
    float _1085 = fma(_482, _1071, _1073);
    float _1087 = _490 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1089 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1091 = _837 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1093 = fma(_1085, 0.298911988735198974609375, _1083);
    float _1095 = exp2(_1079);
    float _1097 = _1023 * 0.31830990314483642578125;
    float _1099 = fma(_482, _1089, _1091);
    float _1101 = _1025 * 0.31830990314483642578125;
    float _1103 = _853 * _1081;
    float _1105 = fma(_1099, 0.114477999508380889892578125, _1093);
    float _1107 = precise::max(_1077, _1097);
    float _1109 = 1.0 / _1075;
    float _1111 = -_525;
    float _1113 = _1111 + 1.0;
    float _1115 = precise::max(_1087, _1101);
    float _1117 = fma(_1043, _869, 1.0);
    float _1119 = _853 * _1107;
    float _1121 = _1113 * _1113;
    float _1123 = fma(_1041, _869, 1.0);
    float _1125 = _853 * _1115;
    float _1127 = fma(_525, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1129 = precise::min(_1121, _1095);
    float _1131 = _1117 * _1123;
    float _1133 = fma(_525, -0.337748348712921142578125, 1.0);
    float _1135 = _521 * _1119;
    float _1137 = fma(_1113, _1129, _1127);
    float _1139 = _1105 * _1109;
    float _1141 = fma(_525, -0.572000026702880859375, 1.03999996185302734375);
    float _1143 = _1133 * _1131;
    float _1145 = precise::max(_1073, _1051);
    float _1147 = fma(_525, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1149 = fma(_1137, -1.03999996185302734375, _1141);
    float _1151 = precise::clamp(_1149, 0.0, 1.0);
    float _1153 = precise::min(_1139, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1155 = _997 * _1143;
    float _1157 = fma(_1137, 1.03999996185302734375, _1147);
    float _1159 = precise::clamp(_1157, 0.0, 1.0);
    float _1161 = precise::max(_1061, _1053);
    float _1163 = fma(_482, _1071, _1145);
    float _1165 = _1153 * 0.31830990314483642578125;
    float _1167 = fma(_1151, 0.039999999105930328369140625, _1159);
    float _1169 = _1155 * 0.31830990314483642578125;
    float _1171 = fma(_482, _1059, _1161);
    float _1173 = _519 * _1163;
    float _1175 = _1167 * _1165;
    float _1177 = _1169 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1179 = _521 * _1171;
    float _1181 = precise::max(_1091, _1055);
    float _1183 = _925 * _1175;
    float _1185 = _909 * _1175;
    float _1187 = _933 * _1175;
    float _1189 = _519 * _1177;
    float _1191 = _1169 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1193 = _1169 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1195 = _519 * _1103;
    float _1197 = precise::min(_1039, 1.0);
    float _1199 = _521 * _1191;
    float _1201 = _523 * _1193;
    float _1203 = fma(_478, _1189, _1183);
    float _1205 = fma(_482, _1089, _1181);
    float _1207 = fma(_478, _1199, _1185);
    float _1209 = fma(_478, _1201, _1187);
    float _1211 = _929 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1213 = fma(_1197, _1173, _1203);
    float _1215 = fma(_1197, _1179, _1207);
    float _1217 = _523 * _1125;
    float _1219 = fma(_502, _969, _1211);
    float _1221 = _523 * _1205;
    float _1223 = _1197 * _1195;
    float _1225 = _929 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1227 = precise::max(0.0, _1213);
    float _1229 = _1197 * _1135;
    float _1231 = precise::max(0.0, _1215);
    float _1233 = _1197 * _1217;
    float _1235 = fma(_1197, _1221, _1209);
    float _1237 = fma(_504, _969, _1225);
    float _1239 = precise::max(0.0, _1223);
    float _1241 = _929 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1243 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1245 = _280 + _1243;
    float _1247 = fma(_975, _1227, _1219);
    float _1249 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1251 = _280 + _1249;
    float _1253 = precise::max(0.0, _1229);
    float _1255 = fma(_975, _1231, _1237);
    float _1257 = precise::max(0.0, _1233);
    float _1259 = fma(_506, _969, _1241);
    float _1261 = precise::max(0.0, _1235);
    float _1263 = _1245 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1265 = precise::clamp(_1263, 0.0, 1.0);
    float _1267 = _975 * _1239;
    float _1269 = _1251 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1271 = precise::clamp(_1269, 0.0, 1.0);
    float _1273 = _975 * _1253;
    float _1275 = _975 * _1257;
    float _1277 = fma(_975, _1261, _1259);
    float _1279 = fma(_1265, _1267, _1247);
    float _1281 = fma(_1271, _1267, _1247);
    float _1283 = fma(_1265, _1273, _1255);
    float _1285 = fma(_1271, _1273, _1255);
    float _1287 = fma(_1265, _1275, _1277);
    float _1289 = fma(_1271, _1275, _1277);
    out.m_57.x = _1279;
    out.m_57.y = _1283;
    out.m_57.z = _1287;
    out.m_57.w = 1.0;
    out.m_59.x = _1281;
    out.m_59.y = _1285;
    out.m_59.z = _1289;
    out.m_59.w = 1.0;
    return out;
}

