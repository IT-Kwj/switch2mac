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
    texture2d<float> fp_t_tcb_1A [[id(10)]];
    sampler fp_t_tcb_1ASmplr [[id(11)]];
    texture3d<float> fp_t_tcb_1C [[id(12)]];
    sampler fp_t_tcb_1CSmplr [[id(13)]];
    texture2d<float> fp_t_tcb_E [[id(14)]];
    sampler fp_t_tcb_ESmplr [[id(15)]];
    texture2d<float> fp_t_tcb_14 [[id(16)]];
    sampler fp_t_tcb_14Smplr [[id(17)]];
    texture2d_array<float> fp_t_tcb_12 [[id(18)]];
    sampler fp_t_tcb_12Smplr [[id(19)]];
    sampler fp_t_tcb_8Smplr_w [[id(20)]];
    sampler fp_t_tcb_CSmplr_w [[id(21)]];
    sampler fp_t_tcb_1ASmplr_w [[id(22)]];
    sampler fp_t_tcb_1CSmplr_w [[id(23)]];
    sampler fp_t_tcb_ESmplr_w [[id(24)]];
    sampler fp_t_tcb_14Smplr_w [[id(25)]];
    sampler fp_t_tcb_12Smplr_w [[id(26)]];
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
    float2 _1571;
    _1571.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_210, _212));
    _1571.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_210, _212));
    float _216 = _1571.x;
    float _218 = _216 * 256.0;
    int _220 = int(_218);
    float _222 = _202 * _188;
    float _224 = _206 * _196;
    float2 _1588;
    _1588.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_208, _214));
    _1588.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_208, _214));
    float _226 = _1588.x;
    float _228 = _226 * 256.0;
    int _230 = int(_228);
    float2 _1598;
    _1598.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_222, _224));
    _1598.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_222, _224));
    float _232 = _1598.x;
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
    float _280 = _242;
    if (_270)
    {
        float _282 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _278 = _282;
    }
    float _284 = _278;
    float _286 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _288 = _266 + _286;
    float _290 = _288;
    if (_270)
    {
        float _292 = _288 * _284;
        _290 = _292;
    }
    float _294 = _290;
    float _296 = 0.0;
    if (_270)
    {
        float _298 = _294 * 0.15915493667125701904296875;
        _296 = _298;
    }
    float _300 = _296;
    float _302 = _284;
    if (_270)
    {
        float _304 = _300 * 6.283185482025146484375;
        float _306 = cos(_304);
        _302 = _306;
    }
    float _308 = _302;
    float _310 = _294;
    if (_270)
    {
        float _312 = _300 * 6.283185482025146484375;
        float _314 = sin(_312);
        _310 = _314;
    }
    float _316 = _310;
    float _318 = _156 * _276;
    float _320 = 0.0;
    if (_270)
    {
        float _322 = rsqrt(_264);
        _320 = _322;
    }
    float _324 = _320;
    float _326 = 0.0;
    if (_270)
    {
        float _328 = _318 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _326 = _328;
    }
    float _330 = _326;
    float _332 = _330;
    float _334 = _308;
    if (_270)
    {
        float _336 = _308 + (-1.0);
        _280 = _336;
    }
    float _338 = _280;
    float _340 = 0.0;
    float _342 = _316;
    float _344 = _338;
    if (_270)
    {
        float _346 = fma(_316, _330, (*spvDescriptorSet0.fp_c9)._m0[42].y);
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
        _342 = _318;
    }
    float _354 = _342;
    float _356 = _354;
    if (_270)
    {
        float _358 = fma(_318, _308, _352);
        _356 = _358;
    }
    float _360 = _356;
    float _362 = _324;
    if (_270)
    {
        float _364 = _324 * _348;
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
    float _420 = _318 + _418;
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
    float _464 = _440;
    float _466 = _462;
    float _468 = _412;
    float _470 = _408;
    if (!_442)
    {
        _464 = _414;
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
        _468 = _518;
        _474 = _520;
        _470 = _510;
        _480 = _514;
    }
    float _522 = _466;
    float _524 = _468;
    float _526 = _474;
    float _528 = _470;
    float _530 = _480;
    float _532 = fma(_522, _522, _524);
    float _534 = _252 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _536 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _538 = fma(_444, (*spvDescriptorSet0.fp_c9)._m0[63].x, _536);
    float _540 = precise::clamp(_538, 0.0, 1.0);
    float _542 = _532 + _526;
    float _544 = _250 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _546 = _318 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _548 = -_540;
    float _550 = _548 + 1.0;
    float _552 = _534 * (*spvDescriptorSet0.fp_c11)._m0[30].x;
    float _554 = _544 * (*spvDescriptorSet0.fp_c11)._m0[30].z;
    float _556 = rsqrt(_542);
    float _558 = _546 * (*spvDescriptorSet0.fp_c11)._m0[30].y;
    float _560 = fma(_552, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].x);
    float _562 = fma(_554, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].z);
    int _564 = _160 + 25936;
    uint _566 = uint(int(uint(_564) >> uint(2)));
    uint _568 = uint(int(uint(int(_566)) >> uint(2)));
    int _570 = int(_566) & 3;
    float _572 = (*spvDescriptorSet0.fp_c9)._m0[int(_568)][_570];
    float _574 = fma(_558, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].y);
    float _576 = float(uint(_220));
    float _578 = abs(_550);
    float _580 = log2(_578);
    float _582 = float(uint(_230));
    float _584 = float(uint(_236));
    int _586 = _160 + 25944;
    uint _588 = uint(int(uint(_586) >> uint(2)));
    uint _590 = uint(int(uint(int(_588)) >> uint(2)));
    int _592 = int(_588) & 3;
    float _594 = (*spvDescriptorSet0.fp_c9)._m0[int(_590)][_592];
    float _596 = _556 * _528;
    float _598 = _556 * _522;
    float _600 = _556 * _530;
    float _602 = _576 * 0.00390625;
    float _604 = _596 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    int _606 = _160 + 25952;
    uint _608 = uint(int(uint(_606) >> uint(2)));
    uint _610 = uint(int(uint(int(_608)) >> uint(2)));
    int _612 = int(_608) & 3;
    float _614 = (*spvDescriptorSet0.fp_c9)._m0[int(_610)][_612];
    float _616 = _598 + 1.0;
    float _618 = in.m_66.x;
    float _620 = gl_FragCoord.w;
    float _622 = _618 * _620;
    float _624 = _580 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _626 = -_604;
    float _628 = fma(_598, (*spvDescriptorSet0.fp_c9)._m0[69].y, _626);
    float _630 = fma(_250, 6.2500002968590706586837768554688e-05, 0.5);
    float _632 = precise::clamp(_630, 0.0, 1.0);
    float _634 = exp2(_624);
    float _636 = -_600;
    float _638 = fma(_636, (*spvDescriptorSet0.fp_c9)._m0[69].z, _628);
    float _640 = precise::max(_450, _572);
    float _642 = precise::max(_456, _572);
    float _644 = precise::max(_456, _594);
    float _646 = precise::max(_642, _602);
    float _648 = _582 * 0.00390625;
    float _650 = fma(_638, 0.5, 0.5);
    float _652 = -_598;
    float _654 = fma(_634, _616, _652);
    float _656 = rint(_614);
    float _658 = precise::max(_656, 0.0);
    uint _660 = uint(_658);
    uint _662 = clamp(_660, 0u, 65535u);
    float _664 = in.m_66.y;
    float _666 = gl_FragCoord.w;
    float _668 = _664 * _666;
    float _670 = precise::max(_640, _648);
    float _672 = fma(_654, 0.5, 0.5);
    float _674 = fma(_638, -0.5, 0.5);
    float _676 = fma(_252, 6.2500002968590706586837768554688e-05, 0.5);
    float _678 = precise::clamp(_676, 0.0, 1.0);
    float _680 = sqrt(_674);
    float _682 = fma(_650, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float2 _2288 = float2(_678, _632);
    float _684 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2288, float2(0.0), isnan(_2288))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2288, float2(0.0), isnan(_2288))).x;
    float3 _2299 = float3(_560, _574, _562);
    float _686 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2299, float3(0.0), isnan(_2299))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2299, float3(0.0), isnan(_2299))).x;
    float _688 = fma(_650, _682, -0.212114393711090087890625);
    float _690 = fma(_650, _688, 1.570728778839111328125);
    float _692 = _584 * 0.00390625;
    float _694 = precise::max(_644, _692);
    float _696 = _680 * 0.636619746685028076171875;
    float _698 = _156 * _622;
    float _700 = -_690;
    float _702 = fma(_696, _700, 1.0);
    float _704 = _156 * _668;
    float2 _2336 = float2(_698, _704);
    float3 _708 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2336, float2(0.0), isnan(_2336))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2336, float2(0.0), isnan(_2336))).xyz;
    float _710 = _708.x;
    float _712 = _708.y;
    float _714 = _708.z;
    float2 _2350 = float2(_702, _672);
    float3 _716 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2350, float2(0.0), isnan(_2350))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2350, float2(0.0), isnan(_2350))).xyz;
    float _718 = _716.x;
    float _720 = _716.y;
    float _722 = _716.z;
    float3 _2367 = float3(_210, _212, float(int(_662)));
    float3 _2369 = select(_2367, float3(0.0), isnan(_2367));
    float _724 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2369.xy, uint(rint(_2369.z)), level(_646)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2369.xy, uint(rint(_2369.z)), level(_646)).z;
    float3 _2379 = float3(_208, _214, float(int(_662)));
    float3 _2381 = select(_2379, float3(0.0), isnan(_2379));
    float _726 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2381.xy, uint(rint(_2381.z)), level(_670)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2381.xy, uint(rint(_2381.z)), level(_670)).x;
    float3 _2391 = float3(_222, _224, float(int(_662)));
    float3 _2393 = select(_2391, float3(0.0), isnan(_2391));
    float3 _728 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2393.xy, uint(rint(_2393.z)), level(_694)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2393.xy, uint(rint(_2393.z)), level(_694)).xyz;
    float _730 = _728.x;
    float _732 = _728.y;
    float _734 = _728.z;
    float _736 = in.m_68.x;
    float _738 = gl_FragCoord.w;
    float _740 = _736 * _738;
    float _742 = in.m_68.z;
    float _744 = gl_FragCoord.w;
    float _746 = _742 * _744;
    float _748 = _318 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _750 = spvFAdd(_444, 9.9999997473787516355514526367188e-06);
    float _752 = abs(_420);
    bool _754 = _752 > 0.00999999977648258209228515625;
    float _756 = _318 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _758 = fma(_252, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _748);
    float _760 = 1.0 / _750;
    float _762 = fma(_252, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _756);
    float _764 = fma(_250, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _758);
    float _766 = in.m_68.y;
    float _768 = gl_FragCoord.w;
    float _770 = _766 * _768;
    float _772 = fma(_250, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _762);
    float _774 = _764 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _776 = _772 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _778 = trunc(_774);
    int _780 = int(_778);
    float _782 = _426 * _760;
    float _784 = _432 * _760;
    float _786 = trunc(_776);
    int _788 = int(_786);
    float _790 = _156 * _740;
    float _792 = _156 * _746;
    int _794 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _796 = _780 + _794;
    int _798 = _796 + 1;
    bool _800 = _798 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    int _802 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _804 = _788 + _802;
    int _806 = _804 + 1;
    float _808 = _156 * _770;
    float _810 = _420 * _760;
    float _812 = _808 * _808;
    float _814 = _810 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _816 = fma(_790, _790, _812);
    float _818 = fma(_782, (*spvDescriptorSet0.fp_c9)._m0[69].x, _814);
    float _820 = fma(_792, _792, _816);
    float _822 = fma(_784, (*spvDescriptorSet0.fp_c9)._m0[69].z, _818);
    int _824 = _798 | _806;
    float _826 = fma(_822, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    float _828 = rsqrt(_820);
    bool _830 = _824 < 0;
    bool _832 = _830 || _800;
    float _834 = fma(_826, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    bool _836 = _806 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _838 = _836 || _832;
    float _840 = abs(_834);
    float _842 = log2(_840);
    float _844 = _790 * _828;
    float _846 = _754 ? _420 : 0.00999999977648258209228515625;
    float _848 = _792 * _828;
    float _850 = _844 * _782;
    float _852 = _808 * _828;
    float _854 = _846 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _856 = _808;
    if (_838)
    {
        _856 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _858 = _856;
    float _860 = -_810;
    float _862 = -_850;
    float _864 = fma(_852, _860, _862);
    float _866 = _858;
    if (!_838)
    {
        int _868 = _806 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _870 = _868 + _798;
        float _872 = floor(_776);
        int _874 = _870 << 2;
        int _876 = _870 >> 2;
        int _878 = 12 & _874;
        float _880 = floor(_774);
        int _882 = _876 << 4;
        int _884 = _882 + _878;
        int _886 = _884 + 16256;
        uint _888 = uint(int(uint(_886) >> uint(2)));
        uint _890 = uint(int(uint(int(_888)) >> uint(2)));
        int _892 = int(_888) & 3;
        float _894 = (*spvDescriptorSet0.fp_c9)._m0[int(_890)][_892];
        float _896 = -_872;
        float _898 = _776 + _896;
        float _900 = -_880;
        float _902 = _774 + _900;
        float _904 = rint(_894);
        float _906 = precise::max(_904, 0.0);
        uint _908 = uint(_906);
        uint _910 = clamp(_908, 0u, 65535u);
        float3 _2682 = float3(_902, _898, float(int(_910)));
        float3 _2684 = select(_2682, float3(0.0), isnan(_2682));
        float _912 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, _2684.xy, uint(rint(_2684.z))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, _2684.xy, uint(rint(_2684.z))).x;
        int _914 = _870 << 4;
        int _916 = _914 + 17904;
        int _918 = _884 + 24304;
        uint _920 = uint(int(uint(_918) >> uint(2)));
        uint _922 = uint(int(uint(int(_920)) >> uint(2)));
        int _924 = int(_920) & 3;
        float _926 = (*spvDescriptorSet0.fp_c9)._m0[int(_922)][_924];
        uint _928 = uint(int(uint(_916) >> uint(2)));
        uint _930 = uint(int(uint(int(_928)) >> uint(2)));
        int _932 = int(_928) & 3;
        float _934 = (*spvDescriptorSet0.fp_c9)._m0[int(_930)][_932];
        int _936 = int(_928) + 1;
        uint _938 = uint(int(uint(_936) >> uint(2)));
        int _940 = _936 & 3;
        float _942 = (*spvDescriptorSet0.fp_c9)._m0[int(_938)][_940];
        int _944 = _916 + 8;
        uint _946 = uint(int(uint(_944) >> uint(2)));
        uint _948 = uint(int(uint(int(_946)) >> uint(2)));
        int _950 = int(_946) & 3;
        float _952 = (*spvDescriptorSet0.fp_c9)._m0[int(_948)][_950];
        int _954 = int(_946) + 1;
        uint _956 = uint(int(uint(_954) >> uint(2)));
        int _958 = _954 & 3;
        float _960 = (*spvDescriptorSet0.fp_c9)._m0[int(_956)][_958];
        float _962 = _318 * _942;
        float _964 = fma(_252, _934, _962);
        float _966 = 1.0 / _926;
        float _968 = fma(_250, _952, _964);
        float _970 = _968 + _960;
        float _972 = precise::clamp(_970, 0.0, 1.0);
        float _974 = _926 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _976 = -_972;
        float _978 = _976 + _912;
        float _980 = fma(_966, (*spvDescriptorSet0.fp_c13)._m0[4].w, _978);
        float _982 = _974 * _980;
        float _984 = exp2(_982);
        float _986 = 0.0 + _984;
        float _988 = precise::clamp(_986, 0.0, 1.0);
        float _990 = precise::min(_988, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _866 = _990;
    }
    float _992 = _866;
    float _994 = in.m_70.w;
    float _996 = gl_FragCoord.w;
    float _998 = _994 * _996;
    float _1000 = in.m_70.y;
    float _1002 = gl_FragCoord.w;
    float _1004 = _1000 * _1002;
    float _1006 = precise::max(_854, -127.0);
    float _1008 = -_784;
    float _1010 = fma(_848, _1008, _864);
    float _1012 = precise::clamp(_1010, 0.0, 1.0);
    float _1014 = in.m_70.x;
    float _1016 = gl_FragCoord.w;
    float _1018 = _1014 * _1016;
    float _1020 = -_1006;
    float _1022 = exp2(_1020);
    float _1024 = in.m_70.z;
    float _1026 = gl_FragCoord.w;
    float _1028 = _1024 * _1026;
    float _1030 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1032 = _842 * 1.5;
    float _1034 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _1036 = _1034 + 1.0;
    float _1038 = precise::max(0.0, _852);
    float _1040 = 1.0 / _1006;
    float _1042 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].y, _1036);
    float _1044 = -(*spvDescriptorSet0.fp_c11)._m0[13].y;
    float _1046 = _1044 + (*spvDescriptorSet0.fp_c11)._m0[13].z;
    float _1048 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].z, _1036);
    float _1050 = _1042 * (*spvDescriptorSet0.fp_c11)._m0[39].w;
    float _1052 = precise::min(_1038, 0.100000001490116119384765625);
    float _1054 = -_1030;
    float _1056 = exp2(_1054);
    float _1058 = -_1022;
    float _1060 = _1058 + 1.0;
    float _1062 = _1012 * (-9.27999973297119140625);
    float _1064 = precise::min(_1050, (*spvDescriptorSet0.fp_c11)._m0[13].x);
    float _1066 = fma(_1052, 10.0, -1.0);
    float _1068 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1070 = fma(_1068, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1072 = 0.0 + _684;
    float _1074 = precise::clamp(_1072, 0.0, 1.0);
    float _1076 = _724 * 0.2820948064327239990234375;
    float _1078 = exp2(_1032);
    float _1080 = -_1064;
    float _1082 = _1080 + 1.0;
    float _1084 = _156 * _998;
    float _1086 = _730 * 0.4774648249149322509765625;
    float _1088 = _732 * 0.4774648249149322509765625;
    float _1090 = fma(_1082, _1046, (*spvDescriptorSet0.fp_c11)._m0[13].y);
    float _1092 = -_1084;
    float _1094 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _1096 = _1092 + _1094;
    float _1098 = _156 * _1018;
    float _1100 = _1056 * _1060;
    float _1102 = precise::max(_686, 0.25);
    float _1104 = _1096 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1106 = precise::clamp(_1104, 0.0, 1.0);
    float _1108 = -_992;
    float _1110 = _1108 + 1.0;
    float _1112 = _156 * _1028;
    float _1114 = _1048 + (-1.0);
    float _1116 = _1102 + _1066;
    float _1118 = fma(_1106, _1110, _992);
    float _1120 = _156 * _1004;
    float _1122 = _1078 * 12.56637096405029296875;
    float _1124 = _1100 * _1040;
    float _1126 = _444 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1128 = _1120 * 0.18672408163547515869140625;
    float _1130 = _726 * _1074;
    float _1132 = _1116 * 4.0;
    float _1134 = precise::clamp(_1132, 0.0, 1.0);
    float _1136 = _1076 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1138 = fma(_1098, 0.095146648585796356201171875, _1128);
    float _1140 = _1124 * _1126;
    float _1142 = _1130 * _1134;
    float _1144 = _1090 + (-1.0);
    float _1146 = fma(_1112, 0.0364394821226596832275390625, _1138);
    float _1148 = _1076 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1150 = exp2(_1062);
    float _1152 = fma(_1142, _1114, 1.0);
    float _1154 = precise::min(_1118, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1156 = fma(_1088, (*spvDescriptorSet0.fp_c9)._m0[68].y, _1148);
    float _1158 = precise::max(_1146, 0.00999999977648258209228515625);
    float _1160 = fma(_1086, (*spvDescriptorSet0.fp_c9)._m0[68].x, _1136);
    float _1162 = _734 * 0.4774648249149322509765625;
    float _1164 = _1142 * _1144;
    float _1166 = 1.0 / _1158;
    float _1168 = _580 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1170 = _1076 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1172 = _1164 * _1164;
    float _1174 = _1164 + 1.0;
    float _1176 = _1156 * 0.586610972881317138671875;
    float _1178 = fma(_1162, (*spvDescriptorSet0.fp_c9)._m0[68].z, _1170);
    float _1180 = _712 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1182 = _1180 * 4.0;
    float _1184 = 1.0 / _1122;
    float _1186 = fma(_1160, 0.298911988735198974609375, _1176);
    float _1188 = precise::min(_1172, _1150);
    float _1190 = _714 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1192 = _1190 * 4.0;
    float _1194 = fma(_1174, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1196 = -_1140;
    float _1198 = exp2(_1196);
    float _1200 = fma(_1178, 0.114477999508380889892578125, _1186);
    float _1202 = -_1164;
    float _1204 = fma(_1202, _1188, _1194);
    float _1206 = fma(_1174, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1208 = _1200 * _1166;
    float _1210 = fma(_1174, -0.572000026702880859375, 1.03999996185302734375);
    float _1212 = exp2(_1168);
    float _1214 = fma(_1204, 1.03999996185302734375, _1206);
    float _1216 = precise::clamp(_1214, 0.0, 1.0);
    float _1218 = fma(_1204, -1.03999996185302734375, _1210);
    float _1220 = precise::clamp(_1218, 0.0, 1.0);
    float _1222 = precise::min(_1208, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1224 = _1070 * _1184;
    float _1226 = _1152 * _1216;
    float _1228 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1230 = _444 + _1228;
    float _1232 = -_1198;
    float _1234 = _1232 + 1.0;
    float _1236 = fma(_1220, 0.039999999105930328369140625, _1226);
    float _1238 = _1222 * 0.31830990314483642578125;
    float _1240 = _1230 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1242 = precise::clamp(_1240, 0.0, 1.0);
    float _1244 = _1234 * _1224;
    float _1246 = _1236 * _1238;
    float _1248 = precise::max(0.0, _1192);
    float _1250 = -_1212;
    float _1252 = _1250 + 1.0;
    float _1254 = _1154 * _1244;
    float _1256 = _1098 * _1246;
    float _1258 = _1120 * _1246;
    float _1260 = _1252 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1262 = _1254 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1264 = _1112 * _1246;
    float _1266 = precise::max(0.0, _1256);
    float _1268 = -_1260;
    float _1270 = _1268 + 1.0;
    float _1272 = _1260 * _1198;
    float _1274 = precise::max(0.0, _1258);
    float _1276 = _1198 * _1270;
    float _1278 = fma(_718, _1272, _1262);
    float _1280 = _1254 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1282 = _1254 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1284 = precise::max(0.0, _1182);
    float _1286 = _1276 * _1248;
    float _1288 = fma(_720, _1272, _1280);
    float _1290 = fma(_1276, _1266, _1278);
    float _1292 = _710 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1294 = _1292 * 4.0;
    float _1296 = precise::max(0.0, _1264);
    float _1298 = fma(_1276, _1274, _1288);
    float _1300 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1302 = _444 + _1300;
    float _1304 = fma(_722, _1272, _1282);
    float _1306 = precise::max(0.0, _1294);
    float _1308 = _1276 * _1284;
    float _1310 = _1302 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1312 = precise::clamp(_1310, 0.0, 1.0);
    float _1314 = fma(_1276, _1296, _1304);
    float _1316 = _1276 * _1306;
    float _1318 = fma(_1312, _1316, _1290);
    float _1320 = fma(_1242, _1316, _1290);
    float _1322 = fma(_1312, _1308, _1298);
    float _1324 = fma(_1242, _1308, _1298);
    float _1326 = fma(_1312, _1286, _1314);
    float _1328 = fma(_1242, _1286, _1314);
    out.m_73.x = _1318;
    out.m_73.y = _1322;
    out.m_73.z = _1326;
    out.m_73.w = 1.0;
    out.m_75.x = _1320;
    out.m_75.y = _1324;
    out.m_75.z = _1328;
    out.m_75.w = 1.0;
    return out;
}

