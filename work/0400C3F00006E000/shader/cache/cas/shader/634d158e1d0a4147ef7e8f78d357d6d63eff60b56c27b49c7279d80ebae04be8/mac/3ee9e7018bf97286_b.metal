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
    float2 _1581;
    _1581.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_210, _212));
    _1581.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_210, _212));
    float _216 = _1581.x;
    float _218 = _216 * 256.0;
    int _220 = int(_218);
    float _222 = _202 * _188;
    float _224 = _206 * _196;
    float2 _1598;
    _1598.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_208, _214));
    _1598.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_208, _214));
    float _226 = _1598.x;
    float _228 = _226 * 256.0;
    int _230 = int(_228);
    float2 _1608;
    _1608.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_222, _224));
    _1608.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_222, _224));
    float _232 = _1608.x;
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
    float2 _2327 = float2(_690, _694);
    float _702 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2327, float2(0.0), isnan(_2327))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2327, float2(0.0), isnan(_2327))).x;
    float3 _2338 = float3(_570, _576, _572);
    float _704 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2338, float3(0.0), isnan(_2338))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2338, float3(0.0), isnan(_2338))).x;
    float2 _2348 = float2(_684, _700);
    float3 _708 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2348, float2(0.0), isnan(_2348))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2348, float2(0.0), isnan(_2348))).xyz;
    float _710 = _708.x;
    float _712 = _708.y;
    float _714 = _708.z;
    float2 _2362 = float2(_698, _656);
    float3 _716 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2362, float2(0.0), isnan(_2362))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2362, float2(0.0), isnan(_2362))).xyz;
    float _718 = _716.x;
    float _720 = _716.y;
    float _722 = _716.z;
    float3 _2379 = float3(_210, _212, float(int(_680)));
    float3 _2381 = select(_2379, float3(0.0), isnan(_2379));
    float _724 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2381.xy, uint(rint(_2381.z)), level(_642)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2381.xy, uint(rint(_2381.z)), level(_642)).z;
    float3 _2391 = float3(_208, _214, float(int(_680)));
    float3 _2393 = select(_2391, float3(0.0), isnan(_2391));
    float _726 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2393.xy, uint(rint(_2393.z)), level(_682)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2393.xy, uint(rint(_2393.z)), level(_682)).x;
    float3 _2403 = float3(_222, _224, float(int(_680)));
    float3 _2405 = select(_2403, float3(0.0), isnan(_2403));
    float3 _728 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2405.xy, uint(rint(_2405.z)), level(_668)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2405.xy, uint(rint(_2405.z)), level(_668)).xyz;
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
    float _776 = trunc(_768);
    int _778 = int(_776);
    float _780 = _156 * _740;
    float _782 = 1.0 / _774;
    int _784 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _786 = _772 + _784;
    int _788 = _786 + 1;
    bool _790 = _788 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    float _792 = _156 * _754;
    int _794 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _796 = _778 + _794;
    int _798 = _796 + 1;
    float _800 = _792 * _792;
    float _802 = _156 * _764;
    int _804 = _788 | _798;
    float _806 = fma(_780, _780, _800);
    bool _808 = _804 < 0;
    bool _810 = _808 || _790;
    float _812 = _420 * _782;
    float _814 = fma(_802, _802, _806);
    float _816 = _426 * _782;
    bool _818 = _798 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _820 = _818 || _810;
    float _822 = _812 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _824 = _432 * _782;
    float _826 = rsqrt(_814);
    float _828 = fma(_816, (*spvDescriptorSet0.fp_c9)._m0[69].x, _822);
    float _830 = _780 * _826;
    float _832 = _792 * _826;
    float _834 = _802 * _826;
    float _836 = _802;
    if (_820)
    {
        _836 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _838 = _836;
    float _840 = _830 * _816;
    float _842 = -_812;
    float _844 = -_840;
    float _846 = fma(_832, _842, _844);
    float _848 = fma(_824, (*spvDescriptorSet0.fp_c9)._m0[69].z, _828);
    float _850 = -_824;
    float _852 = fma(_834, _850, _846);
    float _854 = precise::clamp(_852, 0.0, 1.0);
    float _856 = fma(_848, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _858 = _838;
    if (!_820)
    {
        int _860 = _798 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _862 = _860 + _788;
        float _864 = floor(_768);
        int _866 = _862 << 2;
        int _868 = _862 >> 2;
        int _870 = 12 & _866;
        int _872 = _868 << 4;
        int _874 = _872 + _870;
        float _876 = floor(_766);
        int _878 = _874 + 16256;
        uint _880 = uint(int(uint(_878) >> uint(2)));
        uint _882 = uint(int(uint(int(_880)) >> uint(2)));
        int _884 = int(_880) & 3;
        float _886 = (*spvDescriptorSet0.fp_c9)._m0[int(_882)][_884];
        float _888 = -_864;
        float _890 = _768 + _888;
        float _892 = -_876;
        float _894 = _766 + _892;
        float _896 = rint(_886);
        float _898 = precise::max(_896, 0.0);
        uint _900 = uint(_898);
        uint _902 = clamp(_900, 0u, 65535u);
        float3 _2682 = float3(_894, _890, float(int(_902)));
        float3 _2684 = select(_2682, float3(0.0), isnan(_2682));
        float _904 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _2684.xy, uint(rint(_2684.z))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _2684.xy, uint(rint(_2684.z))).x;
        int _906 = _862 << 4;
        int _908 = _906 + 17904;
        int _910 = _874 + 24304;
        uint _912 = uint(int(uint(_910) >> uint(2)));
        uint _914 = uint(int(uint(int(_912)) >> uint(2)));
        int _916 = int(_912) & 3;
        float _918 = (*spvDescriptorSet0.fp_c9)._m0[int(_914)][_916];
        uint _920 = uint(int(uint(_908) >> uint(2)));
        uint _922 = uint(int(uint(int(_920)) >> uint(2)));
        int _924 = int(_920) & 3;
        float _926 = (*spvDescriptorSet0.fp_c9)._m0[int(_922)][_924];
        int _928 = int(_920) + 1;
        uint _930 = uint(int(uint(_928) >> uint(2)));
        int _932 = _928 & 3;
        float _934 = (*spvDescriptorSet0.fp_c9)._m0[int(_930)][_932];
        int _936 = _908 + 8;
        uint _938 = uint(int(uint(_936) >> uint(2)));
        uint _940 = uint(int(uint(int(_938)) >> uint(2)));
        int _942 = int(_938) & 3;
        float _944 = (*spvDescriptorSet0.fp_c9)._m0[int(_940)][_942];
        int _946 = int(_938) + 1;
        uint _948 = uint(int(uint(_946) >> uint(2)));
        int _950 = _946 & 3;
        float _952 = (*spvDescriptorSet0.fp_c9)._m0[int(_948)][_950];
        float _954 = _320 * _934;
        float _956 = fma(_252, _926, _954);
        float _958 = 1.0 / _918;
        float _960 = fma(_250, _944, _956);
        float _962 = _960 + _952;
        float _964 = precise::clamp(_962, 0.0, 1.0);
        float _966 = -_964;
        float _968 = _966 + _904;
        float _970 = _918 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _972 = fma(_958, (*spvDescriptorSet0.fp_c13)._m0[4].w, _968);
        float _974 = _970 * _972;
        float _976 = exp2(_974);
        float _978 = 0.0 + _976;
        float _980 = precise::clamp(_978, 0.0, 1.0);
        float _982 = precise::min(_980, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _858 = _982;
    }
    float _984 = _858;
    float _986 = fma(_856, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _988 = in.m_70.z;
    float _990 = gl_FragCoord.w;
    float _992 = _988 * _990;
    float _994 = in.m_70.x;
    float _996 = gl_FragCoord.w;
    float _998 = _994 * _996;
    float _1000 = in.m_70.y;
    float _1002 = gl_FragCoord.w;
    float _1004 = _1000 * _1002;
    float _1006 = in.m_70.w;
    float _1008 = gl_FragCoord.w;
    float _1010 = _1006 * _1008;
    float _1012 = abs(_420);
    bool _1014 = _1012 > 0.00999999977648258209228515625;
    float _1016 = abs(_986);
    float _1018 = log2(_1016);
    float _1020 = _1014 ? _420 : 0.00999999977648258209228515625;
    float _1022 = _724 * 0.2820948064327239990234375;
    float _1024 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1026 = _1024 + 1.0;
    float _1028 = _1020 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _1030 = _732 * 0.4774648249149322509765625;
    float _1032 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1034 = _854 * (-9.27999973297119140625);
    float _1036 = _734 * 0.4774648249149322509765625;
    float _1038 = precise::max(_1028, -127.0);
    float _1040 = _730 * 0.4774648249149322509765625;
    float _1042 = _1018 * 1.5;
    float _1044 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].y, _1026);
    float _1046 = -_1038;
    float _1048 = exp2(_1046);
    float _1050 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].z, _1026);
    float _1052 = _1044 * (*spvDescriptorSet0.fp_c11)._m0[39].w;
    float _1054 = exp2(_1042);
    float _1056 = precise::min(_1052, (*spvDescriptorSet0.fp_c11)._m0[13].x);
    float _1058 = _156 * _992;
    float _1060 = -(*spvDescriptorSet0.fp_c11)._m0[13].y;
    float _1062 = _1060 + (*spvDescriptorSet0.fp_c11)._m0[13].z;
    float _1064 = _156 * _998;
    float _1066 = _156 * _1004;
    float _1068 = -_1056;
    float _1070 = _1068 + 1.0;
    float _1072 = precise::max(0.0, _832);
    float _1074 = -_1032;
    float _1076 = exp2(_1074);
    float _1078 = _156 * _1010;
    float _1080 = fma(_1070, _1062, (*spvDescriptorSet0.fp_c11)._m0[13].y);
    float _1082 = -_1048;
    float _1084 = _1082 + 1.0;
    float _1086 = precise::min(_1072, 0.100000001490116119384765625);
    float _1088 = -_1078;
    float _1090 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _1092 = _1088 + _1090;
    float _1094 = _1066 * 0.18672408163547515869140625;
    float _1096 = _1054 * 12.56637096405029296875;
    float _1098 = 1.0 / _1038;
    float _1100 = fma(_1086, 10.0, -1.0);
    float _1102 = precise::max(_704, 0.25);
    float _1104 = fma(_1064, 0.095146648585796356201171875, _1094);
    float _1106 = _1076 * _1084;
    float _1108 = 1.0 / _1096;
    float _1110 = _1092 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1112 = precise::clamp(_1110, 0.0, 1.0);
    float _1114 = -_984;
    float _1116 = _1114 + 1.0;
    float _1118 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1120 = fma(_1118, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1122 = _1102 + _1100;
    float _1124 = 0.0 + _702;
    float _1126 = precise::clamp(_1124, 0.0, 1.0);
    float _1128 = fma(_1112, _1116, _984);
    float _1130 = _1022 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1132 = _1106 * _1098;
    float _1134 = _726 * _1126;
    float _1136 = _444 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1138 = fma(_1030, (*spvDescriptorSet0.fp_c9)._m0[68].y, _1130);
    float _1140 = fma(_1058, 0.0364394821226596832275390625, _1104);
    float _1142 = _1132 * _1136;
    float _1144 = _1138 * 0.586610972881317138671875;
    float _1146 = _1120 * _1108;
    float _1148 = _1122 * 4.0;
    float _1150 = precise::clamp(_1148, 0.0, 1.0);
    float _1152 = exp2(_1034);
    float _1154 = precise::max(_1140, 0.00999999977648258209228515625);
    float _1156 = _1134 * _1150;
    float _1158 = _1080 + (-1.0);
    float _1160 = _1022 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1162 = _1022 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1164 = _1156 * _1158;
    float _1166 = fma(_1036, (*spvDescriptorSet0.fp_c9)._m0[68].z, _1160);
    float _1168 = _580 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1170 = _712 * 0.715200006961822509765625;
    float _1172 = fma(_1040, (*spvDescriptorSet0.fp_c9)._m0[68].x, _1162);
    float _1174 = 1.0 / _1154;
    float _1176 = _1164 * _1164;
    float _1178 = fma(_710, 0.2125999927520751953125, _1170);
    float _1180 = fma(_1172, 0.298911988735198974609375, _1144);
    float _1182 = _1164 + 1.0;
    float _1184 = fma(_714, 0.072200000286102294921875, _1178);
    float _1186 = precise::min(_1176, _1152);
    float _1188 = -_1142;
    float _1190 = exp2(_1188);
    float _1192 = fma(_1182, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1194 = fma(_1166, 0.114477999508380889892578125, _1180);
    float _1196 = -_1164;
    float _1198 = fma(_1196, _1186, _1192);
    float _1200 = _1050 + (-1.0);
    float _1202 = fma(_1182, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1204 = exp2(_1168);
    float _1206 = fma(_1156, _1200, 1.0);
    float _1208 = _1194 * _1174;
    float _1210 = fma(_1198, 1.03999996185302734375, _1202);
    float _1212 = precise::clamp(_1210, 0.0, 1.0);
    float _1214 = fma(_1182, -0.572000026702880859375, 1.03999996185302734375);
    float _1216 = 1.0 / _1184;
    float _1218 = -_1190;
    float _1220 = _1218 + 1.0;
    float _1222 = precise::min(_1208, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1224 = fma(_1198, -1.03999996185302734375, _1214);
    float _1226 = precise::clamp(_1224, 0.0, 1.0);
    float _1228 = _1206 * _1212;
    float _1230 = _1220 * _1146;
    float _1232 = precise::min(_1128, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1234 = _1222 * 0.31830990314483642578125;
    float _1236 = -_1204;
    float _1238 = _1236 + 1.0;
    float _1240 = fma(_1226, 0.039999999105930328369140625, _1228);
    float _1242 = _1232 * _1230;
    float _1244 = _1238 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1246 = _1240 * _1234;
    float _1248 = _1216 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1250 = precise::clamp(_1248, 0.0, 1.0);
    float _1252 = -_1244;
    float _1254 = _1252 + 1.0;
    float _1256 = _1244 * _1190;
    float _1258 = _1064 * _1246;
    float _1260 = fma(_1250, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _1262 = _1190 * _1254;
    float _1264 = _1242 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1266 = _1066 * _1246;
    float _1268 = _1260 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1270 = _1058 * _1246;
    float _1272 = fma(_718, _1256, _1264);
    float _1274 = _710 * _1268;
    float _1276 = _1242 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1278 = _712 * _1268;
    float _1280 = _1242 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1282 = precise::max(0.0, _1258);
    float _1284 = fma(_720, _1256, _1276);
    float _1286 = _714 * _1268;
    float _1288 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1290 = _444 + _1288;
    float _1292 = precise::max(0.0, _1274);
    float _1294 = fma(_722, _1256, _1280);
    float _1296 = precise::max(0.0, _1266);
    float _1298 = fma(_1262, _1282, _1272);
    float _1300 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1302 = _444 + _1300;
    float _1304 = precise::max(0.0, _1278);
    float _1306 = _1290 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1308 = precise::clamp(_1306, 0.0, 1.0);
    float _1310 = precise::max(0.0, _1286);
    float _1312 = _1262 * _1292;
    float _1314 = precise::max(0.0, _1270);
    float _1316 = _1302 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1318 = precise::clamp(_1316, 0.0, 1.0);
    float _1320 = fma(_1262, _1296, _1284);
    float _1322 = _1262 * _1304;
    float _1324 = _1262 * _1310;
    float _1326 = fma(_1262, _1314, _1294);
    float _1328 = fma(_1308, _1312, _1298);
    float _1330 = fma(_1318, _1312, _1298);
    float _1332 = fma(_1308, _1322, _1320);
    float _1334 = fma(_1318, _1322, _1320);
    float _1336 = fma(_1308, _1324, _1326);
    float _1338 = fma(_1318, _1324, _1326);
    out.m_73.x = _1328;
    out.m_73.y = _1332;
    out.m_73.z = _1336;
    out.m_73.w = 1.0;
    out.m_75.x = _1330;
    out.m_75.y = _1334;
    out.m_75.z = _1338;
    out.m_75.w = 1.0;
    return out;
}

