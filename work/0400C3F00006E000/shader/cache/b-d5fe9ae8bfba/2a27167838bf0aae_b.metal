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
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_A [[id(9)]];
    sampler cp_t_tcb_ASmplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _3714, thread const int& _3715, constant _10& support_buffer)
{
    int _3718 = 1 + _3715;
    float _3720 = support_buffer._m5[_3718].x;
    bool _3722 = _3720 == 1.0;
    if (_3722)
    {
        return _3714;
    }
    float _3724 = float(_3714);
    float _3726 = _3724 * _3720;
    int _3728 = int(_3726);
    return _3728;
}

static inline __attribute__((always_inline))
void _56(thread const int& _3402, thread const int& _3403, thread const int& _3404, thread const int& _3405, thread int& _3406, thread int& _3407, thread int& _3408, thread int& _3409, thread int& _3410, thread int& _3411)
{
    float _3414 = as_type<float>(_3403) + 0.0;
    bool _3416 = _3414 != 0.0;
    bool _3418 = isnan(_3414);
    bool _3420 = _3416 || _3418;
    bool _3422 = isnan(0.0);
    bool _3424 = _3420 || _3422;
    int _3426 = as_type<int>(_3414);
    int _3428 = _3403;
    int _3430 = _3404;
    int _3432 = _3424 ? (-1) : 0;
    if (!_3424)
    {
        float _3434 = as_type<float>(_3403) * 1.0;
        _3426 = as_type<int>(_3434);
    }
    int _3436 = _3426;
    bool _3438 = !_3424;
    int _3440 = _3436;
    if (!_3438)
    {
        float _3442 = as_type<float>(_3403) + 0.0;
        bool _3444 = _3442 >= 0.0;
        bool _3446 = isnan(_3442);
        bool _3448 = _3444 || _3446;
        bool _3450 = isnan(0.0);
        bool _3452 = _3448 || _3450;
        int _3454 = as_type<int>(_3442);
        _3432 = _3452 ? (-1) : 0;
        if (!_3452)
        {
            _3454 = 2147483647;
        }
        int _3456 = _3454;
        bool _3458 = !_3452;
        _3440 = _3456;
        if (!_3458)
        {
            float _3460 = as_type<float>(_3403) + 0.0;
            bool _3462 = _3460 > as_type<float>(0x7f800000u /* inf */);
            bool _3464 = isnan(_3460);
            bool _3466 = _3462 || _3464;
            bool _3468 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3470 = _3466 || _3468;
            int _3472 = as_type<int>(_3460);
            _3432 = _3470 ? (-1) : 0;
            if (_3470)
            {
                float _3474 = as_type<float>(_3403) + 1.0;
                _3472 = as_type<int>(_3474);
            }
            int _3476 = _3472;
            _3440 = _3476;
            if (!_3470)
            {
                float _3478 = 0.0 + as_type<float>(_3403);
                bool _3480 = _3478 != as_type<float>(0x7f800000u /* inf */);
                bool _3482 = isnan(_3478);
                bool _3484 = _3480 || _3482;
                bool _3486 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3488 = _3484 || _3486;
                int _3490 = as_type<int>(_3478);
                _3432 = _3488 ? (-1) : 0;
                if (!_3488)
                {
                    _3490 = _3403;
                }
                int _3492 = _3490;
                bool _3494 = !_3488;
                _3440 = _3492;
                if (!_3494)
                {
                    float _3496 = as_type<float>(_3403) * 18446744073709551616.0;
                    float _3498 = rsqrt(_3496);
                    float _3500 = _3496 * _3498;
                    float _3502 = _3498 * 0.5;
                    float _3504 = -_3500;
                    float _3506 = 0.0 + _3504;
                    float _3508 = fma(_3502, _3506, 0.5);
                    float _3510 = fma(_3500, _3508, _3500);
                    float _3512 = -_3510;
                    float _3514 = 0.0 + _3512;
                    float _3516 = fma(_3510, _3514, _3496);
                    float _3518 = fma(_3502, _3516, _3510);
                    float _3520 = _3518 * 2.3283064365386962890625e-10;
                    _3440 = as_type<int>(_3520);
                    _3428 = as_type<int>(_3496);
                    _3430 = as_type<int>(_3510);
                }
            }
        }
    }
    int _3522 = _3440;
    int _3524 = _3428;
    int _3526 = _3430;
    int _3528 = _3432;
    _3406 = _3522;
    _3407 = _3405;
    _3408 = 0;
    _3409 = _3524;
    _3410 = _3526;
    _3411 = _3528;
}

static inline __attribute__((always_inline))
int _60(thread const int& _3749, thread const int& _3750, thread const int& _3751, thread int& _3752, thread uint& gl_SubgroupInvocationID)
{
    int _3755 = _3751 & 31;
    uint _3757 = uint(int(uint(_3751) >> uint(8)));
    int _3759 = int(_3757) & 31;
    float _3761 = as_type<float>(gl_SubgroupInvocationID);
    int _3763 = as_type<int>(_3761) & _3759;
    int _3765 = ~_3759;
    int _3767 = _3755 & _3765;
    int _3769 = _3767 | _3763;
    int _3771 = ~_3759;
    int _3773 = _3750 & _3771;
    int _3775 = _3773 | _3763;
    bool _3777 = uint(_3775) <= uint(_3769);
    _3752 = _3777 ? (-1) : 0;
    float _3779 = spvSubgroupShuffle(as_type<float>(_3749), uint(_3775));
    uint _3781 = uint(_3777 ? as_type<int>(_3779) : _3749);
    return int(_3781);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _906 = false;
    bool _262 = false;
    float _64 = as_type<float>(gl_WorkGroupID.x);
    float _66 = as_type<float>(gl_LocalInvocationID.x);
    int _68 = as_type<int>(_64) << 6;
    int _70 = _68 + as_type<int>(_66);
    bool _74 = uint(_70) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_74)
    {
        return;
    }
    int _76 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _79 = uint(int(uint(_76) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.cp_c5)._m0[int(_81)][_83];
    int _87 = _76 + 8;
    uint _89 = uint(int(uint(_87) >> uint(2)));
    uint _91 = uint(int(uint(int(_89)) >> uint(2)));
    int _93 = int(_89) & 3;
    float _95 = (*spvDescriptorSet0.cp_c5)._m0[int(_91)][_93];
    int _97 = _70;
    int _99 = 0;
    int _101 = _58(_97, _99, (*spvDescriptorSet0.support_buffer));
    int _103 = as_type<int>(_85);
    int _105 = 0;
    int _107 = _58(_103, _105, (*spvDescriptorSet0.support_buffer));
    int3 _1483 = int3(_101, _107, 1);
    float4 _110 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1483.xy), uint(_1483.z), 0).xyzw;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float _118 = _110.w;
    int _120 = _70;
    int _122 = 1;
    int _124 = _58(_120, _122, (*spvDescriptorSet0.support_buffer));
    int _126 = as_type<int>(_95);
    int _128 = 1;
    int _130 = _58(_126, _128, (*spvDescriptorSet0.support_buffer));
    int3 _1503 = int3(_124, _130, 1);
    float4 _132 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1503.xy), uint(_1503.z), 0).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    int _142 = _70;
    int _144 = 0;
    int _146 = _58(_142, _144, (*spvDescriptorSet0.support_buffer));
    int _148 = as_type<int>(_85);
    int _150 = 0;
    int _152 = _58(_148, _150, (*spvDescriptorSet0.support_buffer));
    int3 _1523 = int3(_146, _152, 0);
    float3 _156 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1523.xy), uint(_1523.z), 0).xyz;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    int _164 = _70;
    int _166 = 0;
    int _168 = _58(_164, _166, (*spvDescriptorSet0.support_buffer));
    int _170 = as_type<int>(_85);
    int _172 = 0;
    int _174 = _58(_170, _172, (*spvDescriptorSet0.support_buffer));
    int3 _1541 = int3(_168, _174, 2);
    float3 _176 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1541.xy), uint(_1541.z), 0).xyz;
    float _178 = _176.x;
    float _180 = _176.y;
    float _182 = _176.z;
    float _184 = _114 * _136;
    float _186 = fma(_112, _134, _184);
    float _188 = fma(_116, _138, _186);
    float _190 = fma(_118, _140, _188);
    float _192 = precise::max(_190, -1.0);
    float _194 = precise::min(_192, 1.0);
    bool _196 = _194 >= 0.0;
    bool _198 = isnan(_194);
    bool _200 = _196 || _198;
    bool _202 = isnan(0.0);
    bool _204 = _200 || _202;
    bool _206 = !_204;
    float _208 = -_194;
    float _210 = _206 ? _208 : _194;
    bool _212 = _210 < 0.0;
    float _214 = float(_212);
    float _216 = abs(_210);
    float _218 = -_216;
    float _220 = _218 + 1.0;
    float _222 = abs(_210);
    float _224 = fma(_222, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _226 = as_type<int>(_220) + (-218103808);
    float _228 = abs(_210);
    float _230 = fma(_228, _224, -0.212114393711090087890625);
    bool _232 = uint(_226) >= 1920991232u;
    float _234 = abs(_210);
    float _236 = fma(_234, _230, 1.570728778839111328125);
    bool _238 = !_232;
    float _260;
    if (!_238)
    {
        int _240 = as_type<int>(_210);
        int _242 = as_type<int>(_220);
        int _244 = as_type<int>(_85);
        int _246 = 640;
        int _248;
        int _250;
        int _252;
        int _254;
        int _256;
        int _258;
        _56(_240, _242, _244, _246, _248, _250, _252, _254, _256, _258);
        _260 = as_type<float>(_248);
        _262 = true;
    }
    else
    {
        float _264 = rsqrt(_220);
        float _266 = _220 * _264;
        float _268 = _264 * 0.5;
        float _270 = -_266;
        float _272 = 0.0 + _270;
        float _274 = fma(_268, _272, 0.5);
        float _276 = fma(_266, _274, _266);
        float _278 = -_276;
        float _280 = 0.0 + _278;
        float _282 = fma(_276, _280, _220);
        float _284 = fma(_268, _282, _276);
        _260 = _284;
    }
    _262 = false;
    float _286 = _260;
    int _288 = _76 + 8;
    uint _290 = uint(int(uint(_288) >> uint(2)));
    uint _292 = uint(int(uint(int(_290)) >> uint(2)));
    int _294 = int(_290) & 3;
    float _296 = (*spvDescriptorSet0.cp_c5)._m0[int(_292)][_294];
    int _298 = _70;
    int _300 = 1;
    int _302 = _58(_298, _300, (*spvDescriptorSet0.support_buffer));
    int _304 = as_type<int>(_296);
    int _306 = 1;
    int _308 = _58(_304, _306, (*spvDescriptorSet0.support_buffer));
    int3 _1705 = int3(_302, _308, 0);
    float3 _310 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1705.xy), uint(_1705.z), 0).xyz;
    float _312 = _310.x;
    float _314 = _310.y;
    float _316 = _310.z;
    int _318 = _70;
    int _320 = 1;
    int _322 = _58(_318, _320, (*spvDescriptorSet0.support_buffer));
    int _324 = as_type<int>(_296);
    int _326 = 1;
    int _328 = _58(_324, _326, (*spvDescriptorSet0.support_buffer));
    int3 _1723 = int3(_322, _328, 2);
    float3 _330 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1723.xy), uint(_1723.z), 0).xyz;
    float _332 = _330.x;
    float _334 = _330.y;
    float _336 = _330.z;
    float _338 = _236 * _286;
    float _340 = _214 * 2.0;
    float _342 = -_340;
    float _344 = fma(_338, _342, _338);
    float _346 = fma(_214, 3.1415927410125732421875, _344);
    float _348 = _346 * 0.15915493667125701904296875;
    float _350 = _348 * 6.283185482025146484375;
    float _352 = sin(_350);
    float _354 = abs(_352);
    bool _356 = _354 >= 0.001000000047497451305389404296875;
    bool _358 = isnan(_354);
    bool _360 = _356 || _358;
    bool _362 = isnan(0.001000000047497451305389404296875);
    bool _364 = _360 || _362;
    float _366 = _214;
    float _368 = _344;
    float _370 = _338;
    if (!_364)
    {
        int _372 = _76 + 28;
        uint _374 = uint(int(uint(_372) >> uint(2)));
        uint _376 = uint(int(uint(int(_374)) >> uint(2)));
        int _378 = int(_374) & 3;
        float _380 = (*spvDescriptorSet0.cp_c5)._m0[int(_376)][_378];
        _366 = _380;
    }
    float _382 = _366;
    float _384 = _382;
    if (!_364)
    {
        float _386 = -_382;
        float _388 = _386 + 1.0;
        _368 = _388;
    }
    float _390 = _368;
    float _392 = _390;
    if (!_364)
    {
        _370 = _382;
    }
    float _394 = _370;
    bool _396 = !_364;
    float _398 = _394;
    if (!_396)
    {
        int _400 = _76 + 28;
        uint _402 = uint(int(uint(_400) >> uint(2)));
        uint _404 = uint(int(uint(int(_402)) >> uint(2)));
        int _406 = int(_402) & 3;
        float _408 = (*spvDescriptorSet0.cp_c5)._m0[int(_404)][_406];
        float _410 = 1.0 / _352;
        float _412 = _346 * _408;
        float _414 = _412 * 0.15915493667125701904296875;
        float _416 = -_412;
        float _418 = _346 + _416;
        float _420 = _418 * 0.15915493667125701904296875;
        float _422 = _414 * 6.283185482025146484375;
        float _424 = sin(_422);
        float _426 = _420 * 6.283185482025146484375;
        float _428 = sin(_426);
        float _430 = _424 * _410;
        float _432 = _428 * _410;
        _398 = _430;
        _384 = _408;
        _392 = _432;
    }
    float _434 = _398;
    float _436 = _384;
    float _438 = _392;
    bool _440 = !_204;
    float _442 = -_434;
    float _444 = _440 ? _442 : _434;
    int _446 = _76 + 20;
    uint _448 = uint(int(uint(_446) >> uint(2)));
    uint _450 = uint(int(uint(int(_448)) >> uint(2)));
    int _452 = int(_448) & 3;
    float _454 = (*spvDescriptorSet0.cp_c5)._m0[int(_450)][_452];
    bool _456 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _458 = _316 * _436;
    float _460 = _140 * _444;
    float _462 = _134 * _444;
    float _464 = _136 * _444;
    float _466 = _138 * _444;
    float _468 = fma(_118, _438, _460);
    float _470 = fma(_112, _438, _462);
    float _472 = fma(_114, _438, _464);
    float _474 = fma(_116, _438, _466);
    float _476 = _468 * 2.0;
    float _478 = _470 * 2.0;
    float _480 = _472 * 2.0;
    float _482 = _472 * _476;
    float _484 = _470 * _476;
    float _486 = _474 * _476;
    float _488 = fma(_474, _478, _482);
    float _490 = -_482;
    float _492 = fma(_474, _478, _490);
    float _494 = -_484;
    float _496 = fma(_474, _480, _494);
    float _498 = fma(_474, _480, _484);
    float _500 = -_486;
    float _502 = fma(_472, _478, _500);
    float _504 = _312 * _436;
    float _506 = fma(_472, _478, _486);
    float _508 = _472 * _472;
    float _510 = _470 * _470;
    float _512 = fma(_158, _454, _504);
    float _514 = _314 * _436;
    float _516 = _474 * _474;
    float _518 = fma(_508, -2.0, 1.0);
    float _520 = fma(_510, -2.0, 1.0);
    float _522 = fma(_160, _454, _514);
    float _524 = fma(_162, _454, _458);
    float _526 = fma(_516, -2.0, _518);
    float _528 = fma(_516, -2.0, _520);
    float _530 = fma(_508, -2.0, _520);
    float _532 = _506 * _512;
    float _534 = _332 * _436;
    float _536 = _502 * _522;
    float _538 = _334 * _436;
    float _540 = _498 * _522;
    float _542 = _336 * _436;
    float _544 = _488 * _524;
    float _546 = _496 * _524;
    float _548 = _530 * _524;
    float _550 = fma(_178, _454, _534);
    float _552 = fma(_180, _454, _538);
    float _554 = _526 * _512;
    float _556 = _492 * _512;
    float _558 = _528 * _522;
    float _560 = fma(_182, _454, _542);
    int _562 = _70 * 112;
    bool _564 = !_456;
    float _566 = _554;
    float _568 = _536;
    float _570 = _544;
    float _572 = _550;
    float _574 = _532;
    float _576 = _558;
    float _578 = _546;
    float _580 = _552;
    float _582 = _556;
    float _584 = _540;
    float _902;
    float _904;
    if (!_564)
    {
        int _586 = 0;
        float _588 = _554;
        float _590 = _536;
        float _592 = _544;
        float _594 = _550;
        float _596 = _532;
        float _598 = _558;
        float _600 = _546;
        float _602 = _552;
        float _604 = _556;
        float _606 = _540;
        float _608 = _548;
        float _610 = _560;
        bool _612;
        int _660;
        int _670;
        int _680;
        int _690;
        int _700;
        int _710;
        int _720;
        int _730;
        int _740;
        int _750;
        int _760;
        int _770;
        float _878;
        float _880;
        float _882;
        int _884;
        float _886;
        int _888;
        int _890;
        int _892;
        int _894;
        float _896;
        float _898;
        float _900;
        do
        {
            int _614 = _586;
            float _616 = _588;
            float _618 = _590;
            float _620 = _592;
            int _622 = as_type<int>(_594);
            float _624 = _596;
            int _626 = as_type<int>(_598);
            int _628 = as_type<int>(_600);
            int _630 = as_type<int>(_602);
            int _632 = as_type<int>(_604);
            float _634 = _606;
            float _636 = _608;
            float _638 = _610;
            uint _640 = uint(int(uint(_562) >> uint(2)));
            uint _642 = uint(int(uint(int(_640)) >> uint(2)));
            int _644 = int(_640) & 3;
            float _646 = (*spvDescriptorSet0.cp_c6)._m0[int(_642)][_644];
            bool _648 = _70 != 0;
            int _650 = _614 + 1;
            bool _652 = uint(_650) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _654 = as_type<int>(_616);
            int _656 = as_type<int>(_646);
            int _658 = 31;
            int _2149 = _60(_654, _656, _658, _660, gl_SubgroupInvocationID);
            int _662 = _2149;
            int _664 = as_type<int>(_618);
            int _666 = as_type<int>(_646);
            int _668 = 31;
            int _2154 = _60(_664, _666, _668, _670, gl_SubgroupInvocationID);
            int _672 = _2154;
            int _674 = as_type<int>(_620);
            int _676 = as_type<int>(_646);
            int _678 = 31;
            int _2159 = _60(_674, _676, _678, _680, gl_SubgroupInvocationID);
            int _682 = _2159;
            int _684 = _622;
            int _686 = as_type<int>(_646);
            int _688 = 31;
            int _2163 = _60(_684, _686, _688, _690, gl_SubgroupInvocationID);
            int _692 = _2163;
            int _694 = as_type<int>(_624);
            int _696 = as_type<int>(_646);
            int _698 = 31;
            int _2168 = _60(_694, _696, _698, _700, gl_SubgroupInvocationID);
            int _702 = _2168;
            int _704 = _626;
            int _706 = as_type<int>(_646);
            int _708 = 31;
            int _2172 = _60(_704, _706, _708, _710, gl_SubgroupInvocationID);
            int _712 = _2172;
            int _714 = _628;
            int _716 = as_type<int>(_646);
            int _718 = 31;
            int _2176 = _60(_714, _716, _718, _720, gl_SubgroupInvocationID);
            int _722 = _2176;
            int _724 = _630;
            int _726 = as_type<int>(_646);
            int _728 = 31;
            int _2180 = _60(_724, _726, _728, _730, gl_SubgroupInvocationID);
            int _732 = _2180;
            int _734 = _632;
            int _736 = as_type<int>(_646);
            int _738 = 31;
            int _2184 = _60(_734, _736, _738, _740, gl_SubgroupInvocationID);
            int _742 = _2184;
            int _744 = as_type<int>(_634);
            int _746 = as_type<int>(_646);
            int _748 = 31;
            int _2189 = _60(_744, _746, _748, _750, gl_SubgroupInvocationID);
            int _752 = _2189;
            int _754 = as_type<int>(_636);
            int _756 = as_type<int>(_646);
            int _758 = 31;
            int _2194 = _60(_754, _756, _758, _760, gl_SubgroupInvocationID);
            int _762 = _2194;
            int _764 = as_type<int>(_638);
            int _766 = as_type<int>(_646);
            int _768 = 31;
            int _2199 = _60(_764, _766, _768, _770, gl_SubgroupInvocationID);
            int _772 = _2199;
            bool _774 = !_648;
            _586 = _650;
            float _776 = _616;
            float _778 = _618;
            float _780 = _620;
            int _782 = _622;
            float _784 = _624;
            int _786 = _626;
            int _788 = _628;
            int _790 = _630;
            int _792 = _632;
            float _794 = _634;
            float _796 = _636;
            float _798 = _638;
            if (!_774)
            {
                float _800 = _546 * as_type<float>(_672);
                float _802 = _552 * as_type<float>(_672);
                float _804 = _532 * as_type<float>(_712);
                float _806 = _546 * as_type<float>(_712);
                float _808 = fma(_544, as_type<float>(_662), _800);
                float _810 = fma(_550, as_type<float>(_662), _802);
                float _812 = _558 * as_type<float>(_712);
                float _814 = _552 * as_type<float>(_712);
                float _816 = _532 * as_type<float>(_672);
                float _818 = _558 * as_type<float>(_672);
                float _820 = fma(_554, as_type<float>(_702), _804);
                float _822 = fma(_536, as_type<float>(_702), _812);
                float _824 = fma(_544, as_type<float>(_702), _806);
                float _826 = fma(_550, as_type<float>(_702), _814);
                float _828 = _532 * as_type<float>(_752);
                float _830 = _558 * as_type<float>(_752);
                float _832 = _546 * as_type<float>(_752);
                float _834 = _552 * as_type<float>(_752);
                float _836 = fma(_554, as_type<float>(_662), _816);
                float _838 = fma(_536, as_type<float>(_662), _818);
                float _840 = fma(_554, as_type<float>(_742), _828);
                float _842 = fma(_536, as_type<float>(_742), _830);
                float _844 = fma(_544, as_type<float>(_742), _832);
                float _846 = fma(_550, as_type<float>(_742), _834);
                float _848 = fma(_556, as_type<float>(_682), _836);
                float _850 = fma(_540, as_type<float>(_682), _838);
                float _852 = fma(_548, as_type<float>(_682), _808);
                float _854 = fma(_560, as_type<float>(_682), _810);
                float _856 = fma(_556, as_type<float>(_722), _820);
                float _858 = fma(_540, as_type<float>(_722), _822);
                float _860 = fma(_548, as_type<float>(_722), _824);
                float _862 = fma(_540, as_type<float>(_762), _842);
                float _864 = fma(_560, as_type<float>(_722), _826);
                float _866 = fma(_560, as_type<float>(_762), _846);
                float _868 = fma(_556, as_type<float>(_762), _840);
                float _870 = fma(_548, as_type<float>(_762), _844);
                float _872 = as_type<float>(_692) + _854;
                float _874 = as_type<float>(_732) + _864;
                float _876 = as_type<float>(_772) + _866;
                _776 = _848;
                _778 = _850;
                _780 = _852;
                _782 = as_type<int>(_872);
                _784 = _856;
                _786 = as_type<int>(_858);
                _788 = as_type<int>(_860);
                _790 = as_type<int>(_874);
                _792 = as_type<int>(_868);
                _794 = _862;
                _796 = _870;
                _798 = _876;
            }
            _878 = _776;
            _880 = _778;
            _882 = _780;
            _884 = _782;
            _886 = _784;
            _888 = _786;
            _890 = _788;
            _892 = _790;
            _894 = _792;
            _896 = _794;
            _898 = _796;
            _900 = _798;
            _612 = !_652;
            _588 = _878;
            _590 = _880;
            _592 = _882;
            _594 = as_type<float>(_884);
            _596 = _886;
            _598 = as_type<float>(_888);
            _600 = as_type<float>(_890);
            _602 = as_type<float>(_892);
            _604 = as_type<float>(_894);
            _606 = _896;
            _608 = _898;
            _610 = _900;
        } while (_612);
        _566 = _878;
        _568 = _880;
        _570 = _882;
        _572 = as_type<float>(_884);
        _574 = _886;
        _576 = as_type<float>(_888);
        _578 = as_type<float>(_890);
        _580 = as_type<float>(_892);
        _582 = as_type<float>(_894);
        _584 = _896;
        _902 = _898;
        _904 = _900;
        _906 = true;
    }
    else
    {
        _902 = _548;
        _904 = _560;
    }
    _906 = false;
    float _908 = _566;
    float _910 = _568;
    float _912 = _570;
    float _914 = _572;
    float _916 = _574;
    float _918 = _576;
    float _920 = _578;
    float _922 = _580;
    float _924 = _582;
    float _926 = _584;
    float _928 = _902;
    float _930 = _904;
    int _932 = _562 + 80;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    uint _936 = uint(int(uint(int(_934)) >> uint(2)));
    int _938 = int(_934) & 3;
    float _940 = (*spvDescriptorSet0.cp_c6)._m0[int(_936)][_938];
    int _942 = int(_934) + 1;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    int _946 = _942 & 3;
    float _948 = (*spvDescriptorSet0.cp_c6)._m0[int(_944)][_946];
    bool _950 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _952 = _562 + 64;
    uint _954 = uint(int(uint(_952) >> uint(2)));
    uint _956 = uint(int(uint(int(_954)) >> uint(2)));
    int _958 = int(_954) & 3;
    float _960 = (*spvDescriptorSet0.cp_c6)._m0[int(_956)][_958];
    int _962 = int(_954) + 1;
    uint _964 = uint(int(uint(_962) >> uint(2)));
    int _966 = _962 & 3;
    float _968 = (*spvDescriptorSet0.cp_c6)._m0[int(_964)][_966];
    int _970 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _972 = _970 + _70;
    int _974 = _562 + 88;
    uint _976 = uint(int(uint(_974) >> uint(2)));
    uint _978 = uint(int(uint(int(_976)) >> uint(2)));
    int _980 = int(_976) & 3;
    float _982 = (*spvDescriptorSet0.cp_c6)._m0[int(_978)][_980];
    int _984 = int(_976) + 1;
    uint _986 = uint(int(uint(_984) >> uint(2)));
    int _988 = _984 & 3;
    float _990 = (*spvDescriptorSet0.cp_c6)._m0[int(_986)][_988];
    int _992 = _562 + 72;
    uint _994 = uint(int(uint(_992) >> uint(2)));
    uint _996 = uint(int(uint(int(_994)) >> uint(2)));
    int _998 = int(_994) & 3;
    float _1000 = (*spvDescriptorSet0.cp_c6)._m0[int(_996)][_998];
    int _1002 = int(_994) + 1;
    uint _1004 = uint(int(uint(_1002) >> uint(2)));
    int _1006 = _1002 & 3;
    float _1008 = (*spvDescriptorSet0.cp_c6)._m0[int(_1004)][_1006];
    int _1010 = _562 + 96;
    uint _1012 = uint(int(uint(_1010) >> uint(2)));
    uint _1014 = uint(int(uint(int(_1012)) >> uint(2)));
    int _1016 = int(_1012) & 3;
    float _1018 = (*spvDescriptorSet0.cp_c6)._m0[int(_1014)][_1016];
    int _1020 = int(_1012) + 1;
    uint _1022 = uint(int(uint(_1020) >> uint(2)));
    int _1024 = _1020 & 3;
    float _1026 = (*spvDescriptorSet0.cp_c6)._m0[int(_1022)][_1024];
    int _1028 = _562 + 104;
    uint _1030 = uint(int(uint(_1028) >> uint(2)));
    uint _1032 = uint(int(uint(int(_1030)) >> uint(2)));
    int _1034 = int(_1030) & 3;
    float _1036 = (*spvDescriptorSet0.cp_c6)._m0[int(_1032)][_1034];
    int _1038 = int(_1030) + 1;
    uint _1040 = uint(int(uint(_1038) >> uint(2)));
    int _1042 = _1038 & 3;
    float _1044 = (*spvDescriptorSet0.cp_c6)._m0[int(_1040)][_1042];
    int _1046 = _562 + 16;
    uint _1048 = uint(int(uint(_1046) >> uint(2)));
    uint _1050 = uint(int(uint(int(_1048)) >> uint(2)));
    int _1052 = int(_1048) & 3;
    float _1054 = (*spvDescriptorSet0.cp_c6)._m0[int(_1050)][_1052];
    int _1056 = int(_1048) + 1;
    uint _1058 = uint(int(uint(_1056) >> uint(2)));
    int _1060 = _1056 & 3;
    float _1062 = (*spvDescriptorSet0.cp_c6)._m0[int(_1058)][_1060];
    if (!_950)
    {
        int _1064 = _70 * 48;
        int _1066 = _1064 + 16;
        uint _1068 = uint(int(uint(_1064) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1068)] = as_type<uint>(_908);
        int _1070 = _1064 + 4;
        uint _1072 = uint(int(uint(_1070) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1072)] = as_type<uint>(_910);
        int _1074 = _1064 + 8;
        uint _1076 = uint(int(uint(_1074) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1076)] = as_type<uint>(_912);
        int _1078 = _1064 + 12;
        uint _1080 = uint(int(uint(_1078) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1080)] = as_type<uint>(_914);
        int _1082 = _1064 + 32;
        uint _1084 = uint(int(uint(_1066) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1084)] = as_type<uint>(_916);
        int _1086 = _1066 + 4;
        uint _1088 = uint(int(uint(_1086) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1088)] = as_type<uint>(_918);
        int _1090 = _1066 + 8;
        uint _1092 = uint(int(uint(_1090) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1092)] = as_type<uint>(_920);
        int _1094 = _1066 + 12;
        uint _1096 = uint(int(uint(_1094) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1096)] = as_type<uint>(_922);
        uint _1098 = uint(int(uint(_1082) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1098)] = as_type<uint>(_924);
        int _1100 = _1082 + 4;
        uint _1102 = uint(int(uint(_1100) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1102)] = as_type<uint>(_926);
        int _1104 = _1082 + 8;
        uint _1106 = uint(int(uint(_1104) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1106)] = as_type<uint>(_928);
        int _1108 = _1082 + 12;
        uint _1110 = uint(int(uint(_1108) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1110)] = as_type<uint>(_930);
    }
    float _1112 = _926 * _940;
    float _1114 = _910 * _940;
    float _1116 = _918 * _940;
    int _1118 = _562 + 32;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    uint _1122 = uint(int(uint(int(_1120)) >> uint(2)));
    int _1124 = int(_1120) & 3;
    float _1126 = (*spvDescriptorSet0.cp_c6)._m0[int(_1122)][_1124];
    int _1128 = int(_1120) + 1;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    int _1132 = _1128 & 3;
    float _1134 = (*spvDescriptorSet0.cp_c6)._m0[int(_1130)][_1132];
    float _1136 = fma(_924, _960, _1112);
    float _1138 = _910 * _948;
    float _1140 = fma(_908, _960, _1114);
    float _1142 = fma(_916, _960, _1116);
    float _1144 = _918 * _948;
    float _1146 = fma(_908, _968, _1138);
    float _1148 = _910 * _982;
    float _1150 = _910 * _990;
    float _1152 = _926 * _948;
    int _1154 = _562 + 48;
    uint _1156 = uint(int(uint(_1154) >> uint(2)));
    uint _1158 = uint(int(uint(int(_1156)) >> uint(2)));
    int _1160 = int(_1156) & 3;
    float _1162 = (*spvDescriptorSet0.cp_c6)._m0[int(_1158)][_1160];
    int _1164 = int(_1156) + 1;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    int _1168 = _1164 & 3;
    float _1170 = (*spvDescriptorSet0.cp_c6)._m0[int(_1166)][_1168];
    float _1172 = _918 * _982;
    float _1174 = _918 * _990;
    float _1176 = fma(_916, _968, _1144);
    float _1178 = fma(_924, _968, _1152);
    float _1180 = _926 * _982;
    float _1182 = _926 * _990;
    float _1184 = fma(_908, _1000, _1148);
    float _1186 = fma(_908, _1008, _1150);
    float _1188 = fma(_916, _1000, _1172);
    int _1190 = _562 + 24;
    uint _1192 = uint(int(uint(_1190) >> uint(2)));
    uint _1194 = uint(int(uint(int(_1192)) >> uint(2)));
    int _1196 = int(_1192) & 3;
    float _1198 = (*spvDescriptorSet0.cp_c6)._m0[int(_1194)][_1196];
    int _1200 = int(_1192) + 1;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    int _1204 = _1200 & 3;
    float _1206 = (*spvDescriptorSet0.cp_c6)._m0[int(_1202)][_1204];
    float _1208 = fma(_916, _1008, _1174);
    float _1210 = fma(_924, _1008, _1182);
    float _1212 = fma(_924, _1000, _1180);
    float _1214 = fma(_912, _1018, _1140);
    float _1216 = fma(_920, _1044, _1208);
    float _1218 = fma(_920, _1018, _1142);
    float _1220 = fma(_928, _1018, _1136);
    int _1222 = _562 + 40;
    uint _1224 = uint(int(uint(_1222) >> uint(2)));
    uint _1226 = uint(int(uint(int(_1224)) >> uint(2)));
    int _1228 = int(_1224) & 3;
    float _1230 = (*spvDescriptorSet0.cp_c6)._m0[int(_1226)][_1228];
    int _1232 = int(_1224) + 1;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    int _1236 = _1232 & 3;
    float _1238 = (*spvDescriptorSet0.cp_c6)._m0[int(_1234)][_1236];
    float _1240 = fma(_912, _1026, _1146);
    float _1242 = fma(_912, _1036, _1184);
    float _1244 = fma(_912, _1044, _1186);
    float _1246 = fma(_920, _1026, _1176);
    float _1248 = fma(_920, _1036, _1188);
    float _1250 = fma(_928, _1044, _1210);
    float _1252 = _1216 + _922;
    int _1254 = _562 + 56;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    uint _1258 = uint(int(uint(int(_1256)) >> uint(2)));
    int _1260 = int(_1256) & 3;
    float _1262 = (*spvDescriptorSet0.cp_c6)._m0[int(_1258)][_1260];
    int _1264 = int(_1256) + 1;
    uint _1266 = uint(int(uint(_1264) >> uint(2)));
    int _1268 = _1264 & 3;
    float _1270 = (*spvDescriptorSet0.cp_c6)._m0[int(_1266)][_1268];
    float _1272 = fma(_928, _1026, _1178);
    float _1274 = fma(_928, _1036, _1212);
    float _1276 = _1250 + _930;
    float _1278 = _1244 + _914;
    float _1280 = _1218 * _1062;
    float _1282 = _1246 * _1062;
    float _1284 = _1248 * _1062;
    float _1286 = _1252 * _1062;
    float _1288 = fma(_1214, _1054, _1280);
    float _1290 = fma(_1240, _1054, _1282);
    float _1292 = fma(_1242, _1054, _1284);
    float _1294 = fma(_1278, _1054, _1286);
    float _1296 = _1252 * _1134;
    float _1298 = _1218 * _1134;
    float _1300 = _1246 * _1134;
    float _1302 = _1248 * _1134;
    float _1304 = fma(_1278, _1126, _1296);
    float _1306 = fma(_1214, _1126, _1298);
    float _1308 = fma(_1240, _1126, _1300);
    float _1310 = fma(_1242, _1126, _1302);
    int _1312 = _972 * 48;
    float _1314 = _1252 * _1170;
    float _1316 = _1218 * _1170;
    float _1318 = _1246 * _1170;
    float _1320 = _1248 * _1170;
    float _1322 = fma(_1278, _1162, _1314);
    float _1324 = fma(_1214, _1162, _1316);
    float _1326 = fma(_1240, _1162, _1318);
    float _1328 = fma(_1242, _1162, _1320);
    float _1330 = fma(_1276, _1198, _1294);
    float _1332 = fma(_1272, _1198, _1290);
    float _1334 = fma(_1220, _1198, _1288);
    float _1336 = fma(_1274, _1198, _1292);
    float _1338 = _1330 + _1206;
    float _1340 = fma(_1276, _1230, _1304);
    float _1342 = fma(_1220, _1230, _1306);
    float _1344 = fma(_1272, _1230, _1308);
    float _1346 = fma(_1274, _1230, _1310);
    float _1348 = _1340 + _1238;
    int _1350 = _1312 + 16;
    int _1352 = _1312 + 32;
    float _1354 = fma(_1276, _1262, _1322);
    float _1356 = fma(_1220, _1262, _1324);
    float _1358 = fma(_1272, _1262, _1326);
    float _1360 = fma(_1274, _1262, _1328);
    float _1362 = _1354 + _1270;
    int _1364 = _1312 + 48;
    uint _1366 = uint(int(uint(_1350) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1366)] = as_type<uint>(_1334);
    int _1368 = _1350 + 4;
    uint _1370 = uint(int(uint(_1368) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1370)] = as_type<uint>(_1332);
    int _1372 = _1350 + 8;
    uint _1374 = uint(int(uint(_1372) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1374)] = as_type<uint>(_1336);
    int _1376 = _1350 + 12;
    uint _1378 = uint(int(uint(_1376) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1378)] = as_type<uint>(_1338);
    uint _1380 = uint(int(uint(_1352) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1380)] = as_type<uint>(_1342);
    int _1382 = _1352 + 4;
    uint _1384 = uint(int(uint(_1382) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1384)] = as_type<uint>(_1344);
    int _1386 = _1352 + 8;
    uint _1388 = uint(int(uint(_1386) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1388)] = as_type<uint>(_1346);
    int _1390 = _1352 + 12;
    uint _1392 = uint(int(uint(_1390) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1392)] = as_type<uint>(_1348);
    uint _1394 = uint(int(uint(_1364) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1394)] = as_type<uint>(_1356);
    int _1396 = _1364 + 4;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1398)] = as_type<uint>(_1358);
    int _1400 = _1364 + 8;
    uint _1402 = uint(int(uint(_1400) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1402)] = as_type<uint>(_1360);
    int _1404 = _1364 + 12;
    uint _1406 = uint(int(uint(_1404) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1406)] = as_type<uint>(_1362);
}

