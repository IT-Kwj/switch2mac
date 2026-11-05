#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T>
inline T spvSubgroupShuffle(T value, ushort lane)
{
    return simd_shuffle(value, lane);
}

template<>
inline bool spvSubgroupShuffle(bool value, ushort lane)
{
    return !!simd_shuffle((ushort)value, lane);
}

template<uint N>
inline vec<bool, N> spvSubgroupShuffle(vec<bool, N> value, ushort lane)
{
    return (vec<bool, N>)simd_shuffle((vec<ushort, N>)value, lane);
}

template<>
inline ulong spvSubgroupShuffle(ulong value, ushort lane)
{
    return as_type<ulong>(spvSubgroupShuffle(as_type<uint2>(value), lane));
}

template<>
inline ulong2 spvSubgroupShuffle(ulong2 value, ushort lane)
{
    return ulong2(spvSubgroupShuffle(value.x, lane), spvSubgroupShuffle(value.y, lane));
}

inline ulong3 spvSubgroupShuffle(ulong3 value, ushort lane)
{
    return ulong3(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.z, lane));
}

inline ulong4 spvSubgroupShuffle(ulong4 value, ushort lane)
{
    return ulong4(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.zw, lane));
}

template<uint N>
inline vec<long, N> spvSubgroupShuffle(vec<long, N> value, ushort lane)
{
    return vec<long, N>(spvSubgroupShuffle(vec<ulong, N>(value), lane));
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

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* cp_c5 [[id(1)]];
    constant _16* cp_c6 [[id(2)]];
    constant _16* cp_c3 [[id(3)]];
    constant _16* cp_c4 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _3546, thread const int& _3547, constant _10& support_buffer)
{
    int _3550 = 1 + _3547;
    float _3552 = support_buffer._m5[_3550].x;
    bool _3554 = _3552 == 1.0;
    if (_3554)
    {
        return _3546;
    }
    float _3556 = float(_3546);
    float _3558 = _3556 * _3552;
    int _3560 = int(_3558);
    return _3560;
}

static inline __attribute__((always_inline))
void _54(thread const int& _3234, thread const int& _3235, thread const int& _3236, thread const int& _3237, thread int& _3238, thread int& _3239, thread int& _3240, thread int& _3241, thread int& _3242, thread int& _3243)
{
    float _3246 = as_type<float>(_3235) + 0.0;
    bool _3248 = _3246 != 0.0;
    bool _3250 = isnan(_3246);
    bool _3252 = _3248 || _3250;
    bool _3254 = isnan(0.0);
    bool _3256 = _3252 || _3254;
    int _3258 = as_type<int>(_3246);
    int _3260 = _3235;
    int _3262 = _3236;
    int _3264 = _3256 ? (-1) : 0;
    if (!_3256)
    {
        float _3266 = as_type<float>(_3235) * 1.0;
        _3258 = as_type<int>(_3266);
    }
    int _3268 = _3258;
    bool _3270 = !_3256;
    int _3272 = _3268;
    if (!_3270)
    {
        float _3274 = as_type<float>(_3235) + 0.0;
        bool _3276 = _3274 >= 0.0;
        bool _3278 = isnan(_3274);
        bool _3280 = _3276 || _3278;
        bool _3282 = isnan(0.0);
        bool _3284 = _3280 || _3282;
        int _3286 = as_type<int>(_3274);
        _3264 = _3284 ? (-1) : 0;
        if (!_3284)
        {
            _3286 = 2147483647;
        }
        int _3288 = _3286;
        bool _3290 = !_3284;
        _3272 = _3288;
        if (!_3290)
        {
            float _3292 = as_type<float>(_3235) + 0.0;
            bool _3294 = _3292 > as_type<float>(0x7f800000u /* inf */);
            bool _3296 = isnan(_3292);
            bool _3298 = _3294 || _3296;
            bool _3300 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3302 = _3298 || _3300;
            int _3304 = as_type<int>(_3292);
            _3264 = _3302 ? (-1) : 0;
            if (_3302)
            {
                float _3306 = as_type<float>(_3235) + 1.0;
                _3304 = as_type<int>(_3306);
            }
            int _3308 = _3304;
            _3272 = _3308;
            if (!_3302)
            {
                float _3310 = 0.0 + as_type<float>(_3235);
                bool _3312 = _3310 != as_type<float>(0x7f800000u /* inf */);
                bool _3314 = isnan(_3310);
                bool _3316 = _3312 || _3314;
                bool _3318 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3320 = _3316 || _3318;
                int _3322 = as_type<int>(_3310);
                _3264 = _3320 ? (-1) : 0;
                if (!_3320)
                {
                    _3322 = _3235;
                }
                int _3324 = _3322;
                bool _3326 = !_3320;
                _3272 = _3324;
                if (!_3326)
                {
                    float _3328 = as_type<float>(_3235) * 18446744073709551616.0;
                    float _3330 = rsqrt(_3328);
                    float _3332 = _3328 * _3330;
                    float _3334 = _3330 * 0.5;
                    float _3336 = -_3332;
                    float _3338 = 0.0 + _3336;
                    float _3340 = fma(_3334, _3338, 0.5);
                    float _3342 = fma(_3332, _3340, _3332);
                    float _3344 = -_3342;
                    float _3346 = 0.0 + _3344;
                    float _3348 = fma(_3342, _3346, _3328);
                    float _3350 = fma(_3334, _3348, _3342);
                    float _3352 = _3350 * 2.3283064365386962890625e-10;
                    _3272 = as_type<int>(_3352);
                    _3260 = as_type<int>(_3328);
                    _3262 = as_type<int>(_3342);
                }
            }
        }
    }
    int _3354 = _3272;
    int _3356 = _3260;
    int _3358 = _3262;
    int _3360 = _3264;
    _3238 = _3354;
    _3239 = _3237;
    _3240 = 0;
    _3241 = _3356;
    _3242 = _3358;
    _3243 = _3360;
}

static inline __attribute__((always_inline))
int _58(thread const int& _3581, thread const int& _3582, thread const int& _3583, thread int& _3584, thread uint& gl_SubgroupInvocationID)
{
    int _3587 = _3583 & 31;
    uint _3589 = uint(int(uint(_3583) >> uint(8)));
    int _3591 = int(_3589) & 31;
    float _3593 = as_type<float>(gl_SubgroupInvocationID);
    int _3595 = as_type<int>(_3593) & _3591;
    int _3597 = ~_3591;
    int _3599 = _3587 & _3597;
    int _3601 = _3599 | _3595;
    int _3603 = ~_3591;
    int _3605 = _3582 & _3603;
    int _3607 = _3605 | _3595;
    bool _3609 = uint(_3607) <= uint(_3601);
    _3584 = _3609 ? (-1) : 0;
    float _3611 = spvSubgroupShuffle(as_type<float>(_3581), uint(_3607));
    uint _3613 = uint(_3609 ? as_type<int>(_3611) : _3581);
    return int(_3613);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _904 = false;
    bool _260 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_72)
    {
        return;
    }
    int _74 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _77 = uint(int(uint(_74) >> uint(2)));
    uint _79 = uint(int(uint(int(_77)) >> uint(2)));
    int _81 = int(_77) & 3;
    float _83 = (*spvDescriptorSet0.cp_c5)._m0[int(_79)][_81];
    int _85 = _74 + 8;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    uint _89 = uint(int(uint(int(_87)) >> uint(2)));
    int _91 = int(_87) & 3;
    float _93 = (*spvDescriptorSet0.cp_c5)._m0[int(_89)][_91];
    int _95 = _68;
    int _97 = 0;
    int _99 = _56(_95, _97, (*spvDescriptorSet0.support_buffer));
    int _101 = as_type<int>(_83);
    int _103 = 0;
    int _105 = _56(_101, _103, (*spvDescriptorSet0.support_buffer));
    int3 _1431 = int3(_99, _105, 1);
    float4 _108 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1431.xy), uint(_1431.z), 0).xyzw;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = _108.w;
    int _118 = _68;
    int _120 = 1;
    int _122 = _56(_118, _120, (*spvDescriptorSet0.support_buffer));
    int _124 = as_type<int>(_93);
    int _126 = 1;
    int _128 = _56(_124, _126, (*spvDescriptorSet0.support_buffer));
    int3 _1451 = int3(_122, _128, 1);
    float4 _130 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1451.xy), uint(_1451.z), 0).xyzw;
    float _132 = _130.x;
    float _134 = _130.y;
    float _136 = _130.z;
    float _138 = _130.w;
    int _140 = _68;
    int _142 = 0;
    int _144 = _56(_140, _142, (*spvDescriptorSet0.support_buffer));
    int _146 = as_type<int>(_83);
    int _148 = 0;
    int _150 = _56(_146, _148, (*spvDescriptorSet0.support_buffer));
    int3 _1471 = int3(_144, _150, 0);
    float3 _154 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1471.xy), uint(_1471.z), 0).xyz;
    float _156 = _154.x;
    float _158 = _154.y;
    float _160 = _154.z;
    int _162 = _68;
    int _164 = 0;
    int _166 = _56(_162, _164, (*spvDescriptorSet0.support_buffer));
    int _168 = as_type<int>(_83);
    int _170 = 0;
    int _172 = _56(_168, _170, (*spvDescriptorSet0.support_buffer));
    int3 _1489 = int3(_166, _172, 2);
    float3 _174 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1489.xy), uint(_1489.z), 0).xyz;
    float _176 = _174.x;
    float _178 = _174.y;
    float _180 = _174.z;
    float _182 = _112 * _134;
    float _184 = fma(_110, _132, _182);
    float _186 = fma(_114, _136, _184);
    float _188 = fma(_116, _138, _186);
    float _190 = precise::max(_188, -1.0);
    float _192 = precise::min(_190, 1.0);
    bool _194 = _192 >= 0.0;
    bool _196 = isnan(_192);
    bool _198 = _194 || _196;
    bool _200 = isnan(0.0);
    bool _202 = _198 || _200;
    bool _204 = !_202;
    float _206 = -_192;
    float _208 = _204 ? _206 : _192;
    bool _210 = _208 < 0.0;
    float _212 = float(_210);
    float _214 = abs(_208);
    float _216 = -_214;
    float _218 = _216 + 1.0;
    float _220 = abs(_208);
    float _222 = fma(_220, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _224 = as_type<int>(_218) + (-218103808);
    float _226 = abs(_208);
    float _228 = fma(_226, _222, -0.212114393711090087890625);
    bool _230 = uint(_224) >= 1920991232u;
    float _232 = abs(_208);
    float _234 = fma(_232, _228, 1.570728778839111328125);
    bool _236 = !_230;
    float _258;
    if (!_236)
    {
        int _238 = as_type<int>(_208);
        int _240 = as_type<int>(_218);
        int _242 = as_type<int>(_83);
        int _244 = 640;
        int _246;
        int _248;
        int _250;
        int _252;
        int _254;
        int _256;
        _54(_238, _240, _242, _244, _246, _248, _250, _252, _254, _256);
        _258 = as_type<float>(_246);
        _260 = true;
    }
    else
    {
        float _262 = rsqrt(_218);
        float _264 = _218 * _262;
        float _266 = _262 * 0.5;
        float _268 = -_264;
        float _270 = 0.0 + _268;
        float _272 = fma(_266, _270, 0.5);
        float _274 = fma(_264, _272, _264);
        float _276 = -_274;
        float _278 = 0.0 + _276;
        float _280 = fma(_274, _278, _218);
        float _282 = fma(_266, _280, _274);
        _258 = _282;
    }
    _260 = false;
    float _284 = _258;
    int _286 = _74 + 8;
    uint _288 = uint(int(uint(_286) >> uint(2)));
    uint _290 = uint(int(uint(int(_288)) >> uint(2)));
    int _292 = int(_288) & 3;
    float _294 = (*spvDescriptorSet0.cp_c5)._m0[int(_290)][_292];
    int _296 = _68;
    int _298 = 1;
    int _300 = _56(_296, _298, (*spvDescriptorSet0.support_buffer));
    int _302 = as_type<int>(_294);
    int _304 = 1;
    int _306 = _56(_302, _304, (*spvDescriptorSet0.support_buffer));
    int3 _1653 = int3(_300, _306, 0);
    float3 _308 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1653.xy), uint(_1653.z), 0).xyz;
    float _310 = _308.x;
    float _312 = _308.y;
    float _314 = _308.z;
    int _316 = _68;
    int _318 = 1;
    int _320 = _56(_316, _318, (*spvDescriptorSet0.support_buffer));
    int _322 = as_type<int>(_294);
    int _324 = 1;
    int _326 = _56(_322, _324, (*spvDescriptorSet0.support_buffer));
    int3 _1671 = int3(_320, _326, 2);
    float3 _328 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1671.xy), uint(_1671.z), 0).xyz;
    float _330 = _328.x;
    float _332 = _328.y;
    float _334 = _328.z;
    float _336 = _234 * _284;
    float _338 = _212 * 2.0;
    float _340 = -_338;
    float _342 = fma(_336, _340, _336);
    float _344 = fma(_212, 3.1415927410125732421875, _342);
    float _346 = _344 * 0.15915493667125701904296875;
    float _348 = _346 * 6.283185482025146484375;
    float _350 = sin(_348);
    float _352 = abs(_350);
    bool _354 = _352 >= 0.001000000047497451305389404296875;
    bool _356 = isnan(_352);
    bool _358 = _354 || _356;
    bool _360 = isnan(0.001000000047497451305389404296875);
    bool _362 = _358 || _360;
    float _364 = _212;
    float _366 = _342;
    float _368 = _336;
    if (!_362)
    {
        int _370 = _74 + 28;
        uint _372 = uint(int(uint(_370) >> uint(2)));
        uint _374 = uint(int(uint(int(_372)) >> uint(2)));
        int _376 = int(_372) & 3;
        float _378 = (*spvDescriptorSet0.cp_c5)._m0[int(_374)][_376];
        _364 = _378;
    }
    float _380 = _364;
    float _382 = _380;
    if (!_362)
    {
        float _384 = -_380;
        float _386 = _384 + 1.0;
        _366 = _386;
    }
    float _388 = _366;
    float _390 = _388;
    if (!_362)
    {
        _368 = _380;
    }
    float _392 = _368;
    bool _394 = !_362;
    float _396 = _392;
    if (!_394)
    {
        int _398 = _74 + 28;
        uint _400 = uint(int(uint(_398) >> uint(2)));
        uint _402 = uint(int(uint(int(_400)) >> uint(2)));
        int _404 = int(_400) & 3;
        float _406 = (*spvDescriptorSet0.cp_c5)._m0[int(_402)][_404];
        float _408 = 1.0 / _350;
        float _410 = _344 * _406;
        float _412 = _410 * 0.15915493667125701904296875;
        float _414 = -_410;
        float _416 = _344 + _414;
        float _418 = _416 * 0.15915493667125701904296875;
        float _420 = _412 * 6.283185482025146484375;
        float _422 = sin(_420);
        float _424 = _418 * 6.283185482025146484375;
        float _426 = sin(_424);
        float _428 = _422 * _408;
        float _430 = _426 * _408;
        _396 = _428;
        _382 = _406;
        _390 = _430;
    }
    float _432 = _396;
    float _434 = _382;
    float _436 = _390;
    bool _438 = !_202;
    float _440 = -_432;
    float _442 = _438 ? _440 : _432;
    int _444 = _74 + 20;
    uint _446 = uint(int(uint(_444) >> uint(2)));
    uint _448 = uint(int(uint(int(_446)) >> uint(2)));
    int _450 = int(_446) & 3;
    float _452 = (*spvDescriptorSet0.cp_c5)._m0[int(_448)][_450];
    bool _454 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _456 = _314 * _434;
    float _458 = _138 * _442;
    float _460 = _132 * _442;
    float _462 = _134 * _442;
    float _464 = _136 * _442;
    float _466 = fma(_116, _436, _458);
    float _468 = fma(_110, _436, _460);
    float _470 = fma(_112, _436, _462);
    float _472 = fma(_114, _436, _464);
    float _474 = _466 * 2.0;
    float _476 = _468 * 2.0;
    float _478 = _470 * 2.0;
    float _480 = _468 * _474;
    float _482 = _472 * _474;
    float _484 = _470 * _474;
    float _486 = _468 * _468;
    float _488 = -_480;
    float _490 = fma(_472, _478, _488);
    float _492 = fma(_472, _478, _480);
    float _494 = -_482;
    float _496 = fma(_470, _476, _494);
    float _498 = fma(_470, _476, _482);
    float _500 = _470 * _470;
    float _502 = fma(_472, _476, _484);
    float _504 = -_484;
    float _506 = fma(_472, _476, _504);
    float _508 = _310 * _434;
    float _510 = _472 * _472;
    float _512 = fma(_486, -2.0, 1.0);
    float _514 = fma(_500, -2.0, 1.0);
    float _516 = _312 * _434;
    float _518 = fma(_156, _452, _508);
    float _520 = fma(_510, -2.0, _512);
    float _522 = fma(_500, -2.0, _512);
    float _524 = fma(_158, _452, _516);
    float _526 = fma(_510, -2.0, _514);
    float _528 = fma(_160, _452, _456);
    float _530 = _498 * _518;
    float _532 = _496 * _524;
    float _534 = _330 * _434;
    float _536 = _332 * _434;
    float _538 = _334 * _434;
    float _540 = _526 * _518;
    float _542 = _506 * _518;
    float _544 = _520 * _524;
    float _546 = _492 * _524;
    float _548 = _502 * _528;
    float _550 = _490 * _528;
    float _552 = _522 * _528;
    float _554 = fma(_176, _452, _534);
    float _556 = fma(_178, _452, _536);
    float _558 = fma(_180, _452, _538);
    int _560 = _68 * 112;
    bool _562 = !_454;
    float _564 = _548;
    float _566 = _552;
    float _568 = _558;
    float _886;
    float _888;
    float _890;
    float _892;
    float _894;
    float _896;
    float _898;
    float _900;
    float _902;
    if (!_562)
    {
        int _570 = 0;
        float _572 = _540;
        float _574 = _532;
        float _576 = _548;
        float _578 = _554;
        float _580 = _530;
        float _582 = _544;
        float _584 = _550;
        float _586 = _556;
        float _588 = _542;
        float _590 = _546;
        float _592 = _552;
        float _594 = _558;
        bool _596;
        int _644;
        int _654;
        int _664;
        int _674;
        int _684;
        int _694;
        int _704;
        int _714;
        int _724;
        int _734;
        int _744;
        int _754;
        int _862;
        int _866;
        int _868;
        int _872;
        float _874;
        int _876;
        float _880;
        int _882;
        int _884;
        do
        {
            int _598 = _570;
            int _600 = as_type<int>(_572);
            int _602 = as_type<int>(_574);
            int _604 = as_type<int>(_576);
            int _606 = as_type<int>(_578);
            int _608 = as_type<int>(_580);
            int _610 = as_type<int>(_582);
            float _612 = _584;
            int _614 = as_type<int>(_586);
            int _616 = as_type<int>(_588);
            float _618 = _590;
            int _620 = as_type<int>(_592);
            int _622 = as_type<int>(_594);
            uint _624 = uint(int(uint(_560) >> uint(2)));
            uint _626 = uint(int(uint(int(_624)) >> uint(2)));
            int _628 = int(_624) & 3;
            float _630 = (*spvDescriptorSet0.cp_c6)._m0[int(_626)][_628];
            bool _632 = _68 != 0;
            int _634 = _598 + 1;
            bool _636 = uint(_634) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _638 = _600;
            int _640 = as_type<int>(_630);
            int _642 = 31;
            int _2094 = _58(_638, _640, _642, _644, gl_SubgroupInvocationID);
            int _646 = _2094;
            int _648 = _602;
            int _650 = as_type<int>(_630);
            int _652 = 31;
            int _2098 = _58(_648, _650, _652, _654, gl_SubgroupInvocationID);
            int _656 = _2098;
            int _658 = _604;
            int _660 = as_type<int>(_630);
            int _662 = 31;
            int _2102 = _58(_658, _660, _662, _664, gl_SubgroupInvocationID);
            int _666 = _2102;
            int _668 = _606;
            int _670 = as_type<int>(_630);
            int _672 = 31;
            int _2106 = _58(_668, _670, _672, _674, gl_SubgroupInvocationID);
            int _676 = _2106;
            int _678 = _608;
            int _680 = as_type<int>(_630);
            int _682 = 31;
            int _2110 = _58(_678, _680, _682, _684, gl_SubgroupInvocationID);
            int _686 = _2110;
            int _688 = _610;
            int _690 = as_type<int>(_630);
            int _692 = 31;
            int _2114 = _58(_688, _690, _692, _694, gl_SubgroupInvocationID);
            int _696 = _2114;
            int _698 = as_type<int>(_612);
            int _700 = as_type<int>(_630);
            int _702 = 31;
            int _2119 = _58(_698, _700, _702, _704, gl_SubgroupInvocationID);
            int _706 = _2119;
            int _708 = _614;
            int _710 = as_type<int>(_630);
            int _712 = 31;
            int _2123 = _58(_708, _710, _712, _714, gl_SubgroupInvocationID);
            int _716 = _2123;
            int _718 = _616;
            int _720 = as_type<int>(_630);
            int _722 = 31;
            int _2127 = _58(_718, _720, _722, _724, gl_SubgroupInvocationID);
            int _726 = _2127;
            int _728 = as_type<int>(_618);
            int _730 = as_type<int>(_630);
            int _732 = 31;
            int _2132 = _58(_728, _730, _732, _734, gl_SubgroupInvocationID);
            int _736 = _2132;
            int _738 = _620;
            int _740 = as_type<int>(_630);
            int _742 = 31;
            int _2136 = _58(_738, _740, _742, _744, gl_SubgroupInvocationID);
            int _746 = _2136;
            int _748 = _622;
            int _750 = as_type<int>(_630);
            int _752 = 31;
            int _2140 = _58(_748, _750, _752, _754, gl_SubgroupInvocationID);
            int _756 = _2140;
            bool _758 = !_632;
            _570 = _634;
            int _760 = _600;
            int _762 = _602;
            int _764 = _604;
            int _766 = _606;
            int _768 = _608;
            int _770 = _610;
            float _772 = _612;
            int _774 = _614;
            int _776 = _616;
            float _778 = _618;
            int _780 = _620;
            int _782 = _622;
            if (!_758)
            {
                float _784 = _550 * as_type<float>(_656);
                float _786 = _530 * as_type<float>(_656);
                float _788 = _544 * as_type<float>(_656);
                float _790 = _544 * as_type<float>(_696);
                float _792 = fma(_548, as_type<float>(_646), _784);
                float _794 = _530 * as_type<float>(_696);
                float _796 = _550 * as_type<float>(_696);
                float _798 = _556 * as_type<float>(_696);
                float _800 = fma(_540, as_type<float>(_646), _786);
                float _802 = fma(_532, as_type<float>(_646), _788);
                float _804 = fma(_540, as_type<float>(_686), _794);
                float _806 = fma(_532, as_type<float>(_686), _790);
                float _808 = fma(_548, as_type<float>(_686), _796);
                float _810 = fma(_554, as_type<float>(_686), _798);
                float _812 = _556 * as_type<float>(_656);
                float _814 = _556 * as_type<float>(_736);
                float _816 = _530 * as_type<float>(_736);
                float _818 = _544 * as_type<float>(_736);
                float _820 = _550 * as_type<float>(_736);
                float _822 = fma(_554, as_type<float>(_646), _812);
                float _824 = fma(_554, as_type<float>(_726), _814);
                float _826 = fma(_540, as_type<float>(_726), _816);
                float _828 = fma(_532, as_type<float>(_726), _818);
                float _830 = fma(_548, as_type<float>(_726), _820);
                float _832 = fma(_546, as_type<float>(_666), _802);
                float _834 = fma(_542, as_type<float>(_706), _804);
                float _836 = fma(_542, as_type<float>(_666), _800);
                float _838 = fma(_552, as_type<float>(_666), _792);
                float _840 = fma(_546, as_type<float>(_706), _806);
                float _842 = fma(_552, as_type<float>(_706), _808);
                float _844 = fma(_558, as_type<float>(_666), _822);
                float _846 = fma(_558, as_type<float>(_706), _810);
                float _848 = fma(_558, as_type<float>(_746), _824);
                float _850 = fma(_542, as_type<float>(_746), _826);
                float _852 = fma(_546, as_type<float>(_746), _828);
                float _854 = fma(_552, as_type<float>(_746), _830);
                float _856 = as_type<float>(_676) + _844;
                float _858 = as_type<float>(_716) + _846;
                float _860 = as_type<float>(_756) + _848;
                _760 = as_type<int>(_836);
                _762 = as_type<int>(_832);
                _764 = as_type<int>(_838);
                _766 = as_type<int>(_856);
                _768 = as_type<int>(_834);
                _770 = as_type<int>(_840);
                _772 = _842;
                _774 = as_type<int>(_858);
                _776 = as_type<int>(_850);
                _778 = _852;
                _780 = as_type<int>(_854);
                _782 = as_type<int>(_860);
            }
            _862 = _760;
            int _864 = _762;
            _866 = _764;
            _868 = _766;
            int _870 = _768;
            _872 = _770;
            _874 = _772;
            _876 = _774;
            int _878 = _776;
            _880 = _778;
            _882 = _780;
            _884 = _782;
            _596 = !_636;
            _572 = as_type<float>(_862);
            _574 = as_type<float>(_864);
            _576 = as_type<float>(_866);
            _578 = as_type<float>(_868);
            _580 = as_type<float>(_870);
            _582 = as_type<float>(_872);
            _584 = _874;
            _586 = as_type<float>(_876);
            _588 = as_type<float>(_878);
            _590 = _880;
            _592 = as_type<float>(_882);
            _594 = as_type<float>(_884);
            _886 = as_type<float>(_864);
            _888 = as_type<float>(_870);
            _890 = as_type<float>(_878);
        } while (_596);
        _892 = as_type<float>(_872);
        _894 = _880;
        _896 = as_type<float>(_862);
        _898 = _874;
        _564 = as_type<float>(_866);
        _566 = as_type<float>(_882);
        _900 = as_type<float>(_876);
        _568 = as_type<float>(_884);
        _902 = as_type<float>(_868);
        _904 = true;
    }
    else
    {
        _886 = _532;
        _892 = _544;
        _894 = _546;
        _896 = _540;
        _888 = _530;
        _890 = _542;
        _898 = _550;
        _900 = _556;
        _902 = _554;
    }
    _904 = false;
    float _906 = _886;
    float _908 = _892;
    float _910 = _894;
    float _912 = _896;
    float _914 = _888;
    float _916 = _890;
    float _918 = _898;
    float _920 = _564;
    float _922 = _566;
    float _924 = _900;
    float _926 = _568;
    float _928 = _902;
    int _930 = _560 + 80;
    uint _932 = uint(int(uint(_930) >> uint(2)));
    uint _934 = uint(int(uint(int(_932)) >> uint(2)));
    int _936 = int(_932) & 3;
    float _938 = (*spvDescriptorSet0.cp_c6)._m0[int(_934)][_936];
    int _940 = int(_932) + 1;
    uint _942 = uint(int(uint(_940) >> uint(2)));
    int _944 = _940 & 3;
    float _946 = (*spvDescriptorSet0.cp_c6)._m0[int(_942)][_944];
    int _948 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _950 = _948 + _68;
    int _952 = _560 + 64;
    uint _954 = uint(int(uint(_952) >> uint(2)));
    uint _956 = uint(int(uint(int(_954)) >> uint(2)));
    int _958 = int(_954) & 3;
    float _960 = (*spvDescriptorSet0.cp_c6)._m0[int(_956)][_958];
    int _962 = int(_954) + 1;
    uint _964 = uint(int(uint(_962) >> uint(2)));
    int _966 = _962 & 3;
    float _968 = (*spvDescriptorSet0.cp_c6)._m0[int(_964)][_966];
    int _970 = _950 * 48;
    int _972 = _560 + 88;
    uint _974 = uint(int(uint(_972) >> uint(2)));
    uint _976 = uint(int(uint(int(_974)) >> uint(2)));
    int _978 = int(_974) & 3;
    float _980 = (*spvDescriptorSet0.cp_c6)._m0[int(_976)][_978];
    int _982 = int(_974) + 1;
    uint _984 = uint(int(uint(_982) >> uint(2)));
    int _986 = _982 & 3;
    float _988 = (*spvDescriptorSet0.cp_c6)._m0[int(_984)][_986];
    int _990 = _560 + 72;
    uint _992 = uint(int(uint(_990) >> uint(2)));
    uint _994 = uint(int(uint(int(_992)) >> uint(2)));
    int _996 = int(_992) & 3;
    float _998 = (*spvDescriptorSet0.cp_c6)._m0[int(_994)][_996];
    int _1000 = int(_992) + 1;
    uint _1002 = uint(int(uint(_1000) >> uint(2)));
    int _1004 = _1000 & 3;
    float _1006 = (*spvDescriptorSet0.cp_c6)._m0[int(_1002)][_1004];
    int _1008 = _560 + 96;
    uint _1010 = uint(int(uint(_1008) >> uint(2)));
    uint _1012 = uint(int(uint(int(_1010)) >> uint(2)));
    int _1014 = int(_1010) & 3;
    float _1016 = (*spvDescriptorSet0.cp_c6)._m0[int(_1012)][_1014];
    int _1018 = int(_1010) + 1;
    uint _1020 = uint(int(uint(_1018) >> uint(2)));
    int _1022 = _1018 & 3;
    float _1024 = (*spvDescriptorSet0.cp_c6)._m0[int(_1020)][_1022];
    int _1026 = _560 + 104;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    uint _1030 = uint(int(uint(int(_1028)) >> uint(2)));
    int _1032 = int(_1028) & 3;
    float _1034 = (*spvDescriptorSet0.cp_c6)._m0[int(_1030)][_1032];
    int _1036 = int(_1028) + 1;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    int _1040 = _1036 & 3;
    float _1042 = (*spvDescriptorSet0.cp_c6)._m0[int(_1038)][_1040];
    int _1044 = _560 + 16;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    uint _1048 = uint(int(uint(int(_1046)) >> uint(2)));
    int _1050 = int(_1046) & 3;
    float _1052 = (*spvDescriptorSet0.cp_c6)._m0[int(_1048)][_1050];
    int _1054 = int(_1046) + 1;
    uint _1056 = uint(int(uint(_1054) >> uint(2)));
    int _1058 = _1054 & 3;
    float _1060 = (*spvDescriptorSet0.cp_c6)._m0[int(_1056)][_1058];
    float _1062 = _906 * _938;
    float _1064 = _908 * _938;
    float _1066 = _910 * _938;
    float _1068 = _906 * _946;
    float _1070 = _910 * _946;
    int _1072 = _560 + 32;
    uint _1074 = uint(int(uint(_1072) >> uint(2)));
    uint _1076 = uint(int(uint(int(_1074)) >> uint(2)));
    int _1078 = int(_1074) & 3;
    float _1080 = (*spvDescriptorSet0.cp_c6)._m0[int(_1076)][_1078];
    int _1082 = int(_1074) + 1;
    uint _1084 = uint(int(uint(_1082) >> uint(2)));
    int _1086 = _1082 & 3;
    float _1088 = (*spvDescriptorSet0.cp_c6)._m0[int(_1084)][_1086];
    float _1090 = fma(_912, _960, _1062);
    float _1092 = fma(_914, _960, _1064);
    float _1094 = fma(_916, _960, _1066);
    float _1096 = _908 * _946;
    float _1098 = fma(_912, _968, _1068);
    float _1100 = fma(_916, _968, _1070);
    int _1102 = _560 + 48;
    uint _1104 = uint(int(uint(_1102) >> uint(2)));
    uint _1106 = uint(int(uint(int(_1104)) >> uint(2)));
    int _1108 = int(_1104) & 3;
    float _1110 = (*spvDescriptorSet0.cp_c6)._m0[int(_1106)][_1108];
    int _1112 = int(_1104) + 1;
    uint _1114 = uint(int(uint(_1112) >> uint(2)));
    int _1116 = _1112 & 3;
    float _1118 = (*spvDescriptorSet0.cp_c6)._m0[int(_1114)][_1116];
    float _1120 = fma(_914, _968, _1096);
    float _1122 = _906 * _980;
    float _1124 = _908 * _980;
    float _1126 = _906 * _988;
    float _1128 = _908 * _988;
    float _1130 = _910 * _980;
    float _1132 = _910 * _988;
    float _1134 = fma(_912, _998, _1122);
    int _1136 = _560 + 24;
    uint _1138 = uint(int(uint(_1136) >> uint(2)));
    uint _1140 = uint(int(uint(int(_1138)) >> uint(2)));
    int _1142 = int(_1138) & 3;
    float _1144 = (*spvDescriptorSet0.cp_c6)._m0[int(_1140)][_1142];
    int _1146 = int(_1138) + 1;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    int _1150 = _1146 & 3;
    float _1152 = (*spvDescriptorSet0.cp_c6)._m0[int(_1148)][_1150];
    float _1154 = fma(_914, _998, _1124);
    float _1156 = fma(_912, _1006, _1126);
    float _1158 = fma(_914, _1006, _1128);
    float _1160 = fma(_916, _998, _1130);
    float _1162 = fma(_916, _1006, _1132);
    float _1164 = fma(_918, _1016, _1092);
    int _1166 = _560 + 40;
    uint _1168 = uint(int(uint(_1166) >> uint(2)));
    uint _1170 = uint(int(uint(int(_1168)) >> uint(2)));
    int _1172 = int(_1168) & 3;
    float _1174 = (*spvDescriptorSet0.cp_c6)._m0[int(_1170)][_1172];
    int _1176 = int(_1168) + 1;
    uint _1178 = uint(int(uint(_1176) >> uint(2)));
    int _1180 = _1176 & 3;
    float _1182 = (*spvDescriptorSet0.cp_c6)._m0[int(_1178)][_1180];
    float _1184 = fma(_918, _1024, _1120);
    float _1186 = fma(_920, _1016, _1090);
    float _1188 = fma(_920, _1024, _1098);
    float _1190 = fma(_922, _1016, _1094);
    float _1192 = fma(_922, _1024, _1100);
    float _1194 = fma(_918, _1034, _1154);
    int _1196 = _560 + 56;
    uint _1198 = uint(int(uint(_1196) >> uint(2)));
    uint _1200 = uint(int(uint(int(_1198)) >> uint(2)));
    int _1202 = int(_1198) & 3;
    float _1204 = (*spvDescriptorSet0.cp_c6)._m0[int(_1200)][_1202];
    int _1206 = int(_1198) + 1;
    uint _1208 = uint(int(uint(_1206) >> uint(2)));
    int _1210 = _1206 & 3;
    float _1212 = (*spvDescriptorSet0.cp_c6)._m0[int(_1208)][_1210];
    float _1214 = fma(_918, _1042, _1158);
    float _1216 = fma(_920, _1042, _1156);
    float _1218 = fma(_922, _1042, _1162);
    float _1220 = fma(_920, _1034, _1134);
    float _1222 = _1214 + _924;
    float _1224 = fma(_922, _1034, _1160);
    float _1226 = _1218 + _926;
    float _1228 = _1216 + _928;
    float _1230 = _1164 * _1060;
    float _1232 = _1184 * _1060;
    float _1234 = _1194 * _1060;
    float _1236 = _1222 * _1060;
    float _1238 = fma(_1186, _1052, _1230);
    float _1240 = fma(_1188, _1052, _1232);
    float _1242 = fma(_1220, _1052, _1234);
    float _1244 = fma(_1228, _1052, _1236);
    float _1246 = _1164 * _1088;
    float _1248 = _1184 * _1088;
    float _1250 = _1194 * _1088;
    float _1252 = _1222 * _1088;
    float _1254 = fma(_1186, _1080, _1246);
    float _1256 = fma(_1188, _1080, _1248);
    float _1258 = fma(_1220, _1080, _1250);
    float _1260 = fma(_1228, _1080, _1252);
    float _1262 = _1164 * _1118;
    float _1264 = _1184 * _1118;
    float _1266 = _1194 * _1118;
    float _1268 = _1222 * _1118;
    float _1270 = fma(_1186, _1110, _1262);
    float _1272 = fma(_1188, _1110, _1264);
    float _1274 = fma(_1220, _1110, _1266);
    float _1276 = fma(_1228, _1110, _1268);
    float _1278 = fma(_1226, _1144, _1244);
    float _1280 = fma(_1190, _1144, _1238);
    float _1282 = fma(_1192, _1144, _1240);
    float _1284 = fma(_1224, _1144, _1242);
    float _1286 = _1278 + _1152;
    float _1288 = fma(_1226, _1174, _1260);
    float _1290 = fma(_1190, _1174, _1254);
    float _1292 = fma(_1192, _1174, _1256);
    int _1294 = _970 + 16;
    float _1296 = fma(_1224, _1174, _1258);
    float _1298 = _1288 + _1182;
    int _1300 = _970 + 32;
    float _1302 = fma(_1226, _1204, _1276);
    float _1304 = fma(_1190, _1204, _1270);
    float _1306 = fma(_1192, _1204, _1272);
    float _1308 = fma(_1224, _1204, _1274);
    float _1310 = _1302 + _1212;
    int _1312 = _970 + 48;
    uint _1314 = uint(int(uint(_1294) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1314)] = as_type<uint>(_1280);
    int _1316 = _1294 + 4;
    uint _1318 = uint(int(uint(_1316) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1318)] = as_type<uint>(_1282);
    int _1320 = _1294 + 8;
    uint _1322 = uint(int(uint(_1320) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1322)] = as_type<uint>(_1284);
    int _1324 = _1294 + 12;
    uint _1326 = uint(int(uint(_1324) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1326)] = as_type<uint>(_1286);
    uint _1328 = uint(int(uint(_1300) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1328)] = as_type<uint>(_1290);
    int _1330 = _1300 + 4;
    uint _1332 = uint(int(uint(_1330) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1332)] = as_type<uint>(_1292);
    int _1334 = _1300 + 8;
    uint _1336 = uint(int(uint(_1334) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1336)] = as_type<uint>(_1296);
    int _1338 = _1300 + 12;
    uint _1340 = uint(int(uint(_1338) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1340)] = as_type<uint>(_1298);
    uint _1342 = uint(int(uint(_1312) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1342)] = as_type<uint>(_1304);
    int _1344 = _1312 + 4;
    uint _1346 = uint(int(uint(_1344) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1346)] = as_type<uint>(_1306);
    int _1348 = _1312 + 8;
    uint _1350 = uint(int(uint(_1348) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1350)] = as_type<uint>(_1308);
    int _1352 = _1312 + 12;
    uint _1354 = uint(int(uint(_1352) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1354)] = as_type<uint>(_1310);
}

