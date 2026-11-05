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

struct _31
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c7 [[id(1)]];
    constant _16* fp_c11 [[id(2)]];
    constant _16* fp_c4 [[id(3)]];
    constant _16* fp_c13 [[id(4)]];
    const device _31* fp_s0 [[id(5)]];
    texture2d_array<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture2d<float> fp_t_tcb_18 [[id(10)]];
    sampler fp_t_tcb_18Smplr [[id(11)]];
    texture3d<float> fp_t_tcb_1A [[id(12)]];
    sampler fp_t_tcb_1ASmplr [[id(13)]];
    texture2d<float> fp_t_tcb_E [[id(14)]];
    sampler fp_t_tcb_ESmplr [[id(15)]];
    texture2d<float> fp_t_tcb_12 [[id(16)]];
    sampler fp_t_tcb_12Smplr [[id(17)]];
    texture2d_array<float> fp_t_tcb_10 [[id(18)]];
    sampler fp_t_tcb_10Smplr [[id(19)]];
    sampler fp_t_tcb_8Smplr_w [[id(20)]];
    sampler fp_t_tcb_CSmplr_w [[id(21)]];
    sampler fp_t_tcb_18Smplr_w [[id(22)]];
    sampler fp_t_tcb_1ASmplr_w [[id(23)]];
    sampler fp_t_tcb_ESmplr_w [[id(24)]];
    sampler fp_t_tcb_12Smplr_w [[id(25)]];
    sampler fp_t_tcb_10Smplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_73 [[color(0)]];
    float4 m_75 [[color(1)]];
};

struct main0_in
{
    float4 m_66 [[user(locn0)]];
    float4 m_62 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_64 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _82 = as_type<int>((*spvDescriptorSet0.fp_c7)._m0[11].z) * as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].z);
    int _84 = _82 + as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].w);
    int _86 = _84 * 96;
    int _88 = _86 + 80;
    uint _91 = uint(int(uint(_86) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_91)];
    float _94 = as_type<float>(_dmw0.x);
    int _96 = _86 + 4;
    uint _98 = uint(int(uint(_96) >> uint(2)));
    float _100 = as_type<float>(_dmw0.y);
    uint _102 = uint(int(uint(_88) >> uint(2)));
    float _104 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_102)]);
    int _106 = _86 + 8;
    int _108 = _86 + 16;
    int _110 = _86 + 24;
    uint _112 = uint(int(uint(_106) >> uint(2)));
    float _114 = as_type<float>(_dmw0.z);
    int _116 = _106 + 4;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    float _120 = as_type<float>(_dmw0.w);
    uint _122 = uint(int(uint(_108) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_122)];
    float _124 = as_type<float>(_dmw1.x);
    int _126 = _108 + 4;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    float _130 = as_type<float>(_dmw1.y);
    uint _132 = uint(int(uint(_110) >> uint(2)));
    float _134 = as_type<float>(_dmw1.z);
    int _136 = _110 + 4;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    float _140 = as_type<float>(_dmw1.w);
    float _142 = gl_FragCoord.w;
    float _144 = in.m_62.z;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_62.w;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = 1.0 / _142;
    float _158 = _156 * _148;
    int _160 = as_type<int>(_104) << 6;
    int _162 = _160 + 25904;
    uint _164 = uint(int(uint(_162) >> uint(2)));
    uint _166 = uint(int(uint(int(_164)) >> uint(2)));
    int _168 = int(_164) & 3;
    float _170 = (*spvDescriptorSet0.fp_c9)._m0[int(_166)][_168];
    int _172 = int(_164) + 1;
    uint _174 = uint(int(uint(_172) >> uint(2)));
    int _176 = _172 & 3;
    float _178 = (*spvDescriptorSet0.fp_c9)._m0[int(_174)][_176];
    int _180 = _160 + 25920;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    uint _184 = uint(int(uint(int(_182)) >> uint(2)));
    int _186 = int(_182) & 3;
    float _188 = (*spvDescriptorSet0.fp_c9)._m0[int(_184)][_186];
    int _190 = int(_182) + 1;
    uint _192 = uint(int(uint(_190) >> uint(2)));
    int _194 = _190 & 3;
    float _196 = (*spvDescriptorSet0.fp_c9)._m0[int(_192)][_194];
    float _198 = _156 * _154;
    float _200 = fma(_158, _94, _114);
    float _202 = fma(_158, _124, _134);
    float _204 = fma(_198, _100, _120);
    float _206 = fma(_198, _130, _140);
    float _208 = _200 * _170;
    float _210 = _202 * _170;
    float _212 = _206 * _178;
    float _214 = _204 * _178;
    float2 _1589;
    _1589.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_210, _212));
    _1589.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_210, _212));
    float _216 = _1589.x;
    float _218 = _216 * 256.0;
    int _220 = int(_218);
    float _222 = _202 * _188;
    float _224 = _206 * _196;
    float2 _1606;
    _1606.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_208, _214));
    _1606.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_208, _214));
    float _226 = _1606.x;
    float _228 = _226 * 256.0;
    int _230 = int(_228);
    float2 _1616;
    _1616.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_222, _224));
    _1616.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_222, _224));
    float _232 = _1616.x;
    float _234 = _232 * 256.0;
    int _236 = int(_234);
    float _238 = in.m_64.z;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_64.x;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = _156 * _242;
    float _252 = _156 * _248;
    float _254 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _256 = _250 + _254;
    float _258 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _260 = _252 + _258;
    float _262 = _256 * _256;
    float _264 = fma(_260, _260, _262);
    float _266 = sqrt(_264);
    bool _270 = _266 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _272 = in.m_64.y;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = _120;
    float _280 = _178;
    float _282 = _242;
    if (_270)
    {
        float _284 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _278 = _284;
    }
    float _286 = _278;
    float _288 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _290 = _266 + _288;
    float _292 = _290;
    if (_270)
    {
        float _294 = _290 * _286;
        _292 = _294;
    }
    float _296 = _292;
    float _298 = 0.0;
    if (_270)
    {
        float _300 = _296 * 0.15915493667125701904296875;
        _298 = _300;
    }
    float _302 = _298;
    float _304 = _286;
    if (_270)
    {
        float _306 = _302 * 6.283185482025146484375;
        float _308 = cos(_306);
        _304 = _308;
    }
    float _310 = _304;
    float _312 = _296;
    if (_270)
    {
        float _314 = _302 * 6.283185482025146484375;
        float _316 = sin(_314);
        _312 = _316;
    }
    float _318 = _312;
    float _320 = _156 * _276;
    float _322 = 0.0;
    if (_270)
    {
        float _324 = rsqrt(_264);
        _322 = _324;
    }
    float _326 = _322;
    if (_270)
    {
        float _328 = _320 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _280 = _328;
    }
    float _330 = _280;
    float _332 = _330;
    float _334 = _310;
    if (_270)
    {
        float _336 = _310 + (-1.0);
        _282 = _336;
    }
    float _338 = _282;
    float _340 = 0.0;
    float _342 = _318;
    float _344 = _338;
    if (_270)
    {
        float _346 = fma(_318, _330, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _340 = _346;
    }
    float _348 = _340;
    if (_270)
    {
        float _350 = _338 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _332 = _350;
    }
    float _352 = _332;
    if (!_270)
    {
        _342 = _320;
    }
    float _354 = _342;
    float _356 = _354;
    if (_270)
    {
        float _358 = fma(_320, _310, _352);
        _356 = _358;
    }
    float _360 = _356;
    float _362 = _326;
    if (_270)
    {
        float _364 = _326 * _348;
        _362 = _364;
    }
    float _366 = _362;
    if (!_270)
    {
        _344 = _252;
    }
    float _368 = _344;
    float _370 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _372 = _360 + _370;
    float _374 = _368;
    float _376 = _372;
    if (_270)
    {
        float _378 = fma(_260, _366, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _374 = _378;
    }
    float _380 = _374;
    if (!_270)
    {
        _334 = _250;
    }
    float _382 = _334;
    float _384 = _382;
    if (_270)
    {
        float _386 = fma(_256, _366, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _384 = _386;
    }
    float _388 = _384;
    float _390 = _372 * _372;
    float _392 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _394 = _380 + _392;
    float _396 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _398 = _388 + _396;
    float _400 = fma(_394, _394, _390);
    float _402 = fma(_398, _398, _400);
    float _404 = rsqrt(_402);
    float _406 = _404 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _408 = _394 * _406;
    float _410 = _398 * _406;
    float _412 = _408 * _408;
    float _414 = _410 * _410;
    float _416 = _412 + _414;
    float _418 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _420 = _320 + _418;
    float _422 = sqrt(_416);
    float _424 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _426 = _252 + _424;
    float _428 = _420 * _420;
    float _430 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _432 = _250 + _430;
    float _434 = fma(_426, _426, _428);
    float _436 = fma(_432, _432, _434);
    int _438 = _86 + 64;
    float _440 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    bool _442 = _422 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _444 = sqrt(_436);
    int _446 = _86 + 68;
    uint _448 = uint(int(uint(_438) >> uint(2)));
    packed_uint2 _dmw2 = *(const device packed_uint2*)&(*spvDescriptorSet0.fp_s0)._m0[int(_448)];
    float _450 = as_type<float>(_dmw2.x);
    float _452 = precise::max(0.0, _440);
    uint _454 = uint(int(uint(_446) >> uint(2)));
    float _456 = as_type<float>(_dmw2.y);
    float _458 = -_406;
    float _460 = -_452;
    float _462 = fma(_372, _458, _460);
    float _464 = (*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _466 = _462;
    float _468 = _414;
    float _470 = _408;
    if (!_442)
    {
        _464 = _412;
    }
    float _472 = _464;
    float _474 = _472;
    if (!_442)
    {
        _376 = _410;
    }
    float _476 = _376;
    bool _478 = !_442;
    float _480 = _476;
    if (!_478)
    {
        float _482 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _484 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _486 = _422 + _484;
        float _488 = rsqrt(_416);
        float _490 = _486 * _482;
        float _492 = _462 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _494 = _490 * 0.15915493667125701904296875;
        float _496 = _494 * 6.283185482025146484375;
        float _498 = sin(_496);
        float _500 = _494 * 6.283185482025146484375;
        float _502 = cos(_500);
        float _504 = fma(_498, _492, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _506 = _488 * _504;
        float _508 = _502 + (-1.0);
        float _510 = _408 * _506;
        float _512 = _508 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _514 = _410 * _506;
        float _516 = fma(_462, _502, _512);
        float _518 = _510 * _510;
        float _520 = _514 * _514;
        _466 = _516;
        _474 = _518;
        _468 = _520;
        _470 = _510;
        _480 = _514;
    }
    float _522 = _466;
    float _524 = _474;
    float _526 = _468;
    float _528 = _470;
    float _530 = _480;
    float _532 = fma(_522, _522, _524);
    float _534 = _252 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _536 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _538 = fma(_444, (*spvDescriptorSet0.fp_c9)._m0[63].x, _536);
    float _540 = precise::clamp(_538, 0.0, 1.0);
    float _542 = _532 + _526;
    float _544 = _250 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _546 = _320 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _548 = -_540;
    float _550 = _548 + 1.0;
    float _552 = _534 * (*spvDescriptorSet0.fp_c11)._m0[30].x;
    float _554 = _544 * (*spvDescriptorSet0.fp_c11)._m0[30].z;
    float _556 = rsqrt(_542);
    int _558 = _160 + 25936;
    uint _560 = uint(int(uint(_558) >> uint(2)));
    uint _562 = uint(int(uint(int(_560)) >> uint(2)));
    int _564 = int(_560) & 3;
    float _566 = (*spvDescriptorSet0.fp_c9)._m0[int(_562)][_564];
    float _568 = _546 * (*spvDescriptorSet0.fp_c11)._m0[30].y;
    float _570 = fma(_552, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].x);
    float _572 = fma(_554, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].z);
    float _574 = float(uint(_220));
    float _576 = fma(_568, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].y);
    float _578 = abs(_550);
    float _580 = log2(_578);
    int _582 = _160 + 25944;
    uint _584 = uint(int(uint(_582) >> uint(2)));
    uint _586 = uint(int(uint(int(_584)) >> uint(2)));
    int _588 = int(_584) & 3;
    float _590 = (*spvDescriptorSet0.fp_c9)._m0[int(_586)][_588];
    float _592 = float(uint(_230));
    float _594 = float(uint(_236));
    float _596 = _556 * _528;
    float _598 = _556 * _522;
    float _600 = _556 * _530;
    float _602 = _574 * 0.00390625;
    float _604 = _596 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _606 = _598 + 1.0;
    float _608 = in.m_66.y;
    float _610 = gl_FragCoord.w;
    float _612 = _608 * _610;
    int _614 = _160 + 25952;
    uint _616 = uint(int(uint(_614) >> uint(2)));
    uint _618 = uint(int(uint(int(_616)) >> uint(2)));
    int _620 = int(_616) & 3;
    float _622 = (*spvDescriptorSet0.fp_c9)._m0[int(_618)][_620];
    float _624 = _580 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _626 = -_604;
    float _628 = fma(_598, (*spvDescriptorSet0.fp_c9)._m0[69].y, _626);
    float _630 = precise::max(_450, _566);
    float _632 = exp2(_624);
    float _634 = precise::max(_456, _566);
    float _636 = -_600;
    float _638 = fma(_636, (*spvDescriptorSet0.fp_c9)._m0[69].z, _628);
    float _640 = precise::max(_456, _590);
    float _642 = precise::max(_634, _602);
    float _644 = in.m_66.x;
    float _646 = gl_FragCoord.w;
    float _648 = _644 * _646;
    float _650 = -_598;
    float _652 = fma(_632, _606, _650);
    float _654 = fma(_638, 0.5, 0.5);
    float _656 = fma(_652, 0.5, 0.5);
    float _658 = fma(_638, -0.5, 0.5);
    float _660 = fma(_654, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _662 = _594 * 0.00390625;
    float _664 = fma(_654, _660, -0.212114393711090087890625);
    float _666 = sqrt(_658);
    float _668 = precise::max(_640, _662);
    float _670 = fma(_654, _664, 1.570728778839111328125);
    float _672 = _592 * 0.00390625;
    float _674 = rint(_622);
    float _676 = precise::max(_674, 0.0);
    uint _678 = uint(_676);
    uint _680 = clamp(_678, 0u, 65535u);
    float _682 = precise::max(_630, _672);
    float _684 = _156 * _648;
    float _686 = _666 * 0.636619746685028076171875;
    float _688 = fma(_252, 6.2500002968590706586837768554688e-05, 0.5);
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = fma(_250, 6.2500002968590706586837768554688e-05, 0.5);
    float _694 = precise::clamp(_692, 0.0, 1.0);
    float _696 = -_670;
    float _698 = fma(_686, _696, 1.0);
    float _700 = _156 * _612;
    float2 _2335 = float2(_690, _694);
    float _702 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2335, float2(0.0), isnan(_2335))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2335, float2(0.0), isnan(_2335))).x;
    float3 _2346 = float3(_570, _576, _572);
    float _704 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2346, float3(0.0), isnan(_2346))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2346, float3(0.0), isnan(_2346))).x;
    float2 _2356 = float2(_684, _700);
    float3 _708 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2356, float2(0.0), isnan(_2356))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2356, float2(0.0), isnan(_2356))).xyz;
    float _710 = _708.x;
    float _712 = _708.y;
    float _714 = _708.z;
    float2 _2370 = float2(_698, _656);
    float3 _716 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2370, float2(0.0), isnan(_2370))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2370, float2(0.0), isnan(_2370))).xyz;
    float _718 = _716.x;
    float _720 = _716.y;
    float _722 = _716.z;
    float3 _2387 = float3(_210, _212, float(int(_680)));
    float3 _2389 = select(_2387, float3(0.0), isnan(_2387));
    float _724 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2389.xy, uint(rint(_2389.z)), level(_642)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2389.xy, uint(rint(_2389.z)), level(_642)).z;
    float3 _2399 = float3(_208, _214, float(int(_680)));
    float3 _2401 = select(_2399, float3(0.0), isnan(_2399));
    float _726 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2401.xy, uint(rint(_2401.z)), level(_682)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2401.xy, uint(rint(_2401.z)), level(_682)).x;
    float3 _2411 = float3(_222, _224, float(int(_680)));
    float3 _2413 = select(_2411, float3(0.0), isnan(_2411));
    float3 _728 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2413.xy, uint(rint(_2413.z)), level(_668)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2413.xy, uint(rint(_2413.z)), level(_668)).xyz;
    float _730 = _728.x;
    float _732 = _728.y;
    float _734 = _728.z;
    float _736 = in.m_68.x;
    float _738 = gl_FragCoord.w;
    float _740 = _736 * _738;
    float _742 = _320 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _744 = _320 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _746 = fma(_252, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _742);
    float _748 = fma(_252, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _744);
    float _750 = in.m_68.y;
    float _752 = gl_FragCoord.w;
    float _754 = _750 * _752;
    float _756 = fma(_250, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _746);
    float _758 = fma(_250, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _748);
    float _760 = in.m_68.z;
    float _762 = gl_FragCoord.w;
    float _764 = _760 * _762;
    float _766 = _756 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _768 = _758 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _770 = trunc(_766);
    int _772 = int(_770);
    float _774 = spvFAdd(_444, 9.9999997473787516355514526367188e-06);
    float _776 = 1.0 / _774;
    float _778 = _156 * _740;
    float _780 = _156 * _754;
    float _782 = _426 * _776;
    float _784 = _420 * _776;
    float _786 = _780 * _780;
    float _788 = _156 * _764;
    float _790 = _432 * _776;
    float _792 = fma(_778, _778, _786);
    float _794 = trunc(_768);
    int _796 = int(_794);
    float _798 = fma(_788, _788, _792);
    int _800 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _802 = _772 + _800;
    int _804 = _802 + 1;
    bool _806 = _804 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    float _808 = rsqrt(_798);
    int _810 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _812 = _796 + _810;
    int _814 = _812 + 1;
    int _816 = _804 | _814;
    bool _818 = _816 < 0;
    bool _820 = _818 || _806;
    float _822 = _778 * _808;
    float _824 = _780 * _808;
    float _826 = _788 * _808;
    bool _828 = _814 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _830 = _828 || _820;
    float _832 = _822 * _782;
    float _834 = _784 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _836 = -_784;
    float _838 = -_832;
    float _840 = fma(_824, _836, _838);
    float _842 = fma(_782, (*spvDescriptorSet0.fp_c9)._m0[69].x, _834);
    float _844 = -_790;
    float _846 = fma(_826, _844, _840);
    float _848 = precise::clamp(_846, 0.0, 1.0);
    float _850 = fma(_790, (*spvDescriptorSet0.fp_c9)._m0[69].z, _842);
    float _852 = _826;
    if (_830)
    {
        _852 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _854 = _852;
    float _856 = _854;
    if (!_830)
    {
        int _858 = _814 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _860 = _858 + _804;
        float _862 = floor(_768);
        int _864 = _860 << 2;
        int _866 = _860 >> 2;
        int _868 = 12 & _864;
        int _870 = _866 << 4;
        int _872 = _870 + _868;
        float _874 = floor(_766);
        int _876 = _872 + 16256;
        uint _878 = uint(int(uint(_876) >> uint(2)));
        uint _880 = uint(int(uint(int(_878)) >> uint(2)));
        int _882 = int(_878) & 3;
        float _884 = (*spvDescriptorSet0.fp_c9)._m0[int(_880)][_882];
        float _886 = -_862;
        float _888 = _768 + _886;
        float _890 = -_874;
        float _892 = _766 + _890;
        float _894 = rint(_884);
        float _896 = precise::max(_894, 0.0);
        uint _898 = uint(_896);
        uint _900 = clamp(_898, 0u, 65535u);
        float3 _2684 = float3(_892, _888, float(int(_900)));
        float3 _2686 = select(_2684, float3(0.0), isnan(_2684));
        float _902 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _2686.xy, uint(rint(_2686.z))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _2686.xy, uint(rint(_2686.z))).x;
        int _904 = _860 << 4;
        int _906 = _904 + 17904;
        int _908 = _872 + 24304;
        uint _910 = uint(int(uint(_908) >> uint(2)));
        uint _912 = uint(int(uint(int(_910)) >> uint(2)));
        int _914 = int(_910) & 3;
        float _916 = (*spvDescriptorSet0.fp_c9)._m0[int(_912)][_914];
        uint _918 = uint(int(uint(_906) >> uint(2)));
        uint _920 = uint(int(uint(int(_918)) >> uint(2)));
        int _922 = int(_918) & 3;
        float _924 = (*spvDescriptorSet0.fp_c9)._m0[int(_920)][_922];
        int _926 = int(_918) + 1;
        uint _928 = uint(int(uint(_926) >> uint(2)));
        int _930 = _926 & 3;
        float _932 = (*spvDescriptorSet0.fp_c9)._m0[int(_928)][_930];
        int _934 = _906 + 8;
        uint _936 = uint(int(uint(_934) >> uint(2)));
        uint _938 = uint(int(uint(int(_936)) >> uint(2)));
        int _940 = int(_936) & 3;
        float _942 = (*spvDescriptorSet0.fp_c9)._m0[int(_938)][_940];
        int _944 = int(_936) + 1;
        uint _946 = uint(int(uint(_944) >> uint(2)));
        int _948 = _944 & 3;
        float _950 = (*spvDescriptorSet0.fp_c9)._m0[int(_946)][_948];
        float _952 = _320 * _932;
        float _954 = fma(_252, _924, _952);
        float _956 = 1.0 / _916;
        float _958 = fma(_250, _942, _954);
        float _960 = _958 + _950;
        float _962 = precise::clamp(_960, 0.0, 1.0);
        float _964 = -_962;
        float _966 = _964 + _902;
        float _968 = _916 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _970 = fma(_956, (*spvDescriptorSet0.fp_c13)._m0[4].w, _966);
        float _972 = _968 * _970;
        float _974 = exp2(_972);
        float _976 = 0.0 + _974;
        float _978 = precise::clamp(_976, 0.0, 1.0);
        float _980 = precise::min(_978, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _856 = _980;
    }
    float _982 = _856;
    float _984 = fma(_850, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _986 = in.m_70.z;
    float _988 = gl_FragCoord.w;
    float _990 = _986 * _988;
    float _992 = abs(_420);
    bool _994 = _992 > 0.00999999977648258209228515625;
    float _996 = in.m_70.x;
    float _998 = gl_FragCoord.w;
    float _1000 = _996 * _998;
    float _1002 = fma(_984, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1004 = in.m_70.y;
    float _1006 = gl_FragCoord.w;
    float _1008 = _1004 * _1006;
    float _1010 = in.m_70.w;
    float _1012 = gl_FragCoord.w;
    float _1014 = _1010 * _1012;
    float _1016 = _994 ? _420 : 0.00999999977648258209228515625;
    float _1018 = abs(_1002);
    float _1020 = log2(_1018);
    float _1022 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1024 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1026 = _1024 + 1.0;
    float _1028 = _1016 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _1030 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].y, _1026);
    float _1032 = precise::max(0.0, _824);
    float _1034 = -_1022;
    float _1036 = exp2(_1034);
    float _1038 = precise::max(_1028, -127.0);
    float _1040 = _1030 * (*spvDescriptorSet0.fp_c11)._m0[39].w;
    float _1042 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].z, _1026);
    float _1044 = precise::min(_1032, 0.100000001490116119384765625);
    float _1046 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1048 = fma(_1046, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1050 = precise::min(_1040, (*spvDescriptorSet0.fp_c11)._m0[13].x);
    float _1052 = _1020 * 1.5;
    float _1054 = -_1038;
    float _1056 = exp2(_1054);
    float _1058 = fma((*spvDescriptorSet0.fp_c11)._m0[45].w, 2.0, -0.5);
    float _1060 = precise::clamp(_1058, 0.0, 1.0);
    float _1062 = -(*spvDescriptorSet0.fp_c11)._m0[13].y;
    float _1064 = _1062 + (*spvDescriptorSet0.fp_c11)._m0[13].z;
    float _1066 = -_1050;
    float _1068 = _1066 + 1.0;
    float _1070 = precise::max(_704, 0.25);
    float _1072 = _848 * (-9.27999973297119140625);
    float _1074 = _1060 * _1068;
    float _1076 = exp2(_1052);
    float _1078 = _156 * _990;
    float _1080 = _156 * _1000;
    float _1082 = _156 * _1008;
    float _1084 = _156 * _1014;
    float _1086 = fma(_1074, _1064, (*spvDescriptorSet0.fp_c11)._m0[13].y);
    float _1088 = fma(_1044, 10.0, -1.0);
    float _1090 = 1.0 / _1038;
    float _1092 = -_1056;
    float _1094 = _1092 + 1.0;
    float _1096 = -(*spvDescriptorSet0.fp_c11)._m0[45].w;
    float _1098 = fma(_1086, (*spvDescriptorSet0.fp_c11)._m0[45].w, _1096);
    float _1100 = _1070 + _1088;
    float _1102 = -_1084;
    float _1104 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _1106 = _1102 + _1104;
    float _1108 = _1036 * _1094;
    float _1110 = 0.0 + _702;
    float _1112 = precise::clamp(_1110, 0.0, 1.0);
    float _1114 = _1082 * 0.18672408163547515869140625;
    float _1116 = _1076 * 12.56637096405029296875;
    float _1118 = _1106 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1120 = precise::clamp(_1118, 0.0, 1.0);
    float _1122 = _726 * _1112;
    float _1124 = fma(_1080, 0.095146648585796356201171875, _1114);
    float _1126 = _1100 * 4.0;
    float _1128 = precise::clamp(_1126, 0.0, 1.0);
    float _1130 = _724 * 0.2820948064327239990234375;
    float _1132 = 1.0 / _1116;
    float _1134 = -_982;
    float _1136 = _1134 + 1.0;
    float _1138 = _1108 * _1090;
    float _1140 = _444 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1142 = fma(_1078, 0.0364394821226596832275390625, _1124);
    float _1144 = _1122 * _1128;
    float _1146 = _732 * 0.4774648249149322509765625;
    float _1148 = _734 * 0.4774648249149322509765625;
    float _1150 = exp2(_1072);
    float _1152 = fma(_1120, _1136, _982);
    float _1154 = fma(_1144, _1098, (*spvDescriptorSet0.fp_c11)._m0[45].w);
    float _1156 = precise::max(_1142, 0.00999999977648258209228515625);
    float _1158 = _730 * 0.4774648249149322509765625;
    float _1160 = _1130 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1162 = -_1154;
    float _1164 = _1162 + 1.0;
    float _1166 = _1048 * _1132;
    float _1168 = _1138 * _1140;
    float _1170 = _1130 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1172 = _1130 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1174 = 1.0 / _1156;
    float _1176 = _1164 * _1164;
    float _1178 = fma(_1146, (*spvDescriptorSet0.fp_c9)._m0[68].y, _1170);
    float _1180 = fma(_1148, (*spvDescriptorSet0.fp_c9)._m0[68].z, _1172);
    float _1182 = _580 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1184 = _712 * 0.715200006961822509765625;
    float _1186 = fma(_1158, (*spvDescriptorSet0.fp_c9)._m0[68].x, _1160);
    float _1188 = _1178 * 0.586610972881317138671875;
    float _1190 = -_1168;
    float _1192 = exp2(_1190);
    float _1194 = fma(_710, 0.2125999927520751953125, _1184);
    float _1196 = precise::min(_1176, _1150);
    float _1198 = fma(_1154, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1200 = fma(_1186, 0.298911988735198974609375, _1188);
    float _1202 = fma(_714, 0.072200000286102294921875, _1194);
    float _1204 = fma(_1164, _1196, _1198);
    float _1206 = exp2(_1182);
    float _1208 = _1042 + (-1.0);
    float _1210 = fma(_1180, 0.114477999508380889892578125, _1200);
    float _1212 = fma(_1154, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1214 = precise::min(_1152, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1216 = fma(_1154, -0.572000026702880859375, 1.03999996185302734375);
    float _1218 = _1210 * _1174;
    float _1220 = 1.0 / _1202;
    float _1222 = fma(_1144, _1208, 1.0);
    float _1224 = fma(_1204, 1.03999996185302734375, _1212);
    float _1226 = precise::clamp(_1224, 0.0, 1.0);
    float _1228 = fma(_1204, -1.03999996185302734375, _1216);
    float _1230 = precise::clamp(_1228, 0.0, 1.0);
    float _1232 = precise::min(_1218, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1234 = -_1192;
    float _1236 = _1234 + 1.0;
    float _1238 = _1222 * _1226;
    float _1240 = -_1206;
    float _1242 = _1240 + 1.0;
    float _1244 = _1236 * _1166;
    float _1246 = fma(_1230, 0.039999999105930328369140625, _1238);
    float _1248 = _1232 * 0.31830990314483642578125;
    float _1250 = _1242 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1252 = _1214 * _1244;
    float _1254 = _1246 * _1248;
    float _1256 = _1220 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1258 = precise::clamp(_1256, 0.0, 1.0);
    float _1260 = -_1250;
    float _1262 = _1260 + 1.0;
    float _1264 = _1250 * _1192;
    float _1266 = _1080 * _1254;
    float _1268 = fma(_1258, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _1270 = _1192 * _1262;
    float _1272 = _1252 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1274 = _1082 * _1254;
    float _1276 = _1268 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1278 = _1078 * _1254;
    float _1280 = fma(_718, _1264, _1272);
    float _1282 = _1252 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1284 = _712 * _1276;
    float _1286 = _710 * _1276;
    float _1288 = precise::max(0.0, _1266);
    float _1290 = _1252 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1292 = _714 * _1276;
    float _1294 = precise::max(0.0, _1274);
    float _1296 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1298 = _444 + _1296;
    float _1300 = fma(_720, _1264, _1290);
    float _1302 = fma(_1270, _1288, _1280);
    float _1304 = fma(_722, _1264, _1282);
    float _1306 = precise::max(0.0, _1286);
    float _1308 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1310 = _444 + _1308;
    float _1312 = precise::max(0.0, _1284);
    float _1314 = _1298 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1316 = precise::clamp(_1314, 0.0, 1.0);
    float _1318 = precise::max(0.0, _1292);
    float _1320 = _1310 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1322 = precise::clamp(_1320, 0.0, 1.0);
    float _1324 = precise::max(0.0, _1278);
    float _1326 = _1270 * _1306;
    float _1328 = fma(_1270, _1294, _1300);
    float _1330 = _1270 * _1312;
    float _1332 = _1270 * _1318;
    float _1334 = fma(_1270, _1324, _1304);
    float _1336 = fma(_1322, _1326, _1302);
    float _1338 = fma(_1316, _1326, _1302);
    float _1340 = fma(_1322, _1330, _1328);
    float _1342 = fma(_1316, _1330, _1328);
    float _1344 = fma(_1322, _1332, _1334);
    float _1346 = fma(_1316, _1332, _1334);
    out.m_73.x = _1336;
    out.m_73.y = _1340;
    out.m_73.z = _1344;
    out.m_73.w = 1.0;
    out.m_75.x = _1338;
    out.m_75.y = _1342;
    out.m_75.z = _1346;
    out.m_75.w = 1.0;
    return out;
}

