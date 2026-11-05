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
int _58(thread const int& _3730, thread const int& _3731, constant _10& support_buffer)
{
    int _3734 = 1 + _3731;
    float _3736 = support_buffer._m5[_3734].x;
    bool _3738 = _3736 == 1.0;
    if (_3738)
    {
        return _3730;
    }
    float _3740 = float(_3730);
    float _3742 = _3740 * _3736;
    int _3744 = int(_3742);
    return _3744;
}

static inline __attribute__((always_inline))
void _56(thread const int& _3422, thread const int& _3423, thread const int& _3424, thread const int& _3425, thread int& _3426, thread int& _3427, thread int& _3428, thread int& _3429, thread int& _3430, thread int& _3431)
{
    float _3434 = as_type<float>(_3423) + 0.0;
    bool _3436 = _3434 != 0.0;
    bool _3438 = isnan(_3434);
    bool _3440 = _3436 || _3438;
    bool _3442 = isnan(0.0);
    bool _3444 = _3440 || _3442;
    int _3446 = _3422;
    int _3448 = _3423;
    int _3450 = _3424;
    int _3452 = _3444 ? (-1) : 0;
    if (!_3444)
    {
        float _3454 = as_type<float>(_3423) * 1.0;
        _3446 = as_type<int>(_3454);
    }
    int _3456 = _3446;
    bool _3458 = !_3444;
    int _3460 = _3456;
    int _3462 = _3456;
    if (!_3458)
    {
        float _3464 = as_type<float>(_3423) + 0.0;
        bool _3466 = _3464 >= 0.0;
        bool _3468 = isnan(_3464);
        bool _3470 = _3466 || _3468;
        bool _3472 = isnan(0.0);
        bool _3474 = _3470 || _3472;
        _3452 = _3474 ? (-1) : 0;
        if (!_3474)
        {
            _3460 = 2147483647;
        }
        int _3476 = _3460;
        bool _3478 = !_3474;
        int _3480 = _3476;
        _3462 = _3476;
        if (!_3478)
        {
            float _3482 = as_type<float>(_3423) + 0.0;
            bool _3484 = _3482 > as_type<float>(0x7f800000u /* inf */);
            bool _3486 = isnan(_3482);
            bool _3488 = _3484 || _3486;
            bool _3490 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3492 = _3488 || _3490;
            _3452 = _3492 ? (-1) : 0;
            if (_3492)
            {
                float _3494 = as_type<float>(_3423) + 1.0;
                _3480 = as_type<int>(_3494);
            }
            int _3496 = _3480;
            int _3498 = _3496;
            _3462 = _3496;
            if (!_3492)
            {
                float _3500 = 0.0 + as_type<float>(_3423);
                bool _3502 = _3500 != as_type<float>(0x7f800000u /* inf */);
                bool _3504 = isnan(_3500);
                bool _3506 = _3502 || _3504;
                bool _3508 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3510 = _3506 || _3508;
                _3452 = _3510 ? (-1) : 0;
                if (!_3510)
                {
                    _3498 = _3423;
                }
                int _3512 = _3498;
                bool _3514 = !_3510;
                _3462 = _3512;
                if (!_3514)
                {
                    float _3516 = as_type<float>(_3423) * 18446744073709551616.0;
                    float _3518 = rsqrt(_3516);
                    float _3520 = _3516 * _3518;
                    float _3522 = _3518 * 0.5;
                    float _3524 = -_3520;
                    float _3526 = 0.0 + _3524;
                    float _3528 = fma(_3522, _3526, 0.5);
                    float _3530 = fma(_3520, _3528, _3520);
                    float _3532 = -_3530;
                    float _3534 = 0.0 + _3532;
                    float _3536 = fma(_3530, _3534, _3516);
                    float _3538 = fma(_3522, _3536, _3530);
                    float _3540 = _3538 * 2.3283064365386962890625e-10;
                    _3462 = as_type<int>(_3540);
                    _3448 = as_type<int>(_3516);
                    _3450 = as_type<int>(_3530);
                }
            }
        }
    }
    int _3542 = _3462;
    int _3544 = _3448;
    int _3546 = _3450;
    int _3548 = _3452;
    _3426 = _3425;
    _3427 = 0;
    _3428 = _3542;
    _3429 = _3544;
    _3430 = _3546;
    _3431 = _3548;
}

static inline __attribute__((always_inline))
int _60(thread const int& _3765, thread const int& _3766, thread const int& _3767, thread int& _3768, thread uint& gl_SubgroupInvocationID)
{
    int _3771 = _3767 & 31;
    uint _3773 = uint(int(uint(_3767) >> uint(8)));
    int _3775 = int(_3773) & 31;
    float _3777 = as_type<float>(gl_SubgroupInvocationID);
    int _3779 = as_type<int>(_3777) & _3775;
    int _3781 = ~_3775;
    int _3783 = _3771 & _3781;
    int _3785 = _3783 | _3779;
    int _3787 = ~_3775;
    int _3789 = _3766 & _3787;
    int _3791 = _3789 | _3779;
    bool _3793 = uint(_3791) <= uint(_3785);
    _3768 = _3793 ? (-1) : 0;
    float _3795 = spvSubgroupShuffle(as_type<float>(_3765), uint(_3791));
    uint _3797 = uint(_3793 ? as_type<int>(_3795) : _3765);
    return int(_3797);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _956 = false;
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
        int _240 = _226;
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
        _260 = as_type<float>(_252);
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
    int3 _1704 = int3(_302, _308, 0);
    float3 _310 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1704.xy), uint(_1704.z), 0).xyz;
    float _312 = _310.x;
    float _314 = _310.y;
    float _316 = _310.z;
    int _318 = _70;
    int _320 = 1;
    int _322 = _58(_318, _320, (*spvDescriptorSet0.support_buffer));
    int _324 = as_type<int>(_296);
    int _326 = 1;
    int _328 = _58(_324, _326, (*spvDescriptorSet0.support_buffer));
    int3 _1722 = int3(_322, _328, 2);
    float3 _330 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1722.xy), uint(_1722.z), 0).xyz;
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
        _392 = _432;
        _384 = _408;
    }
    float _434 = _398;
    float _436 = _392;
    float _438 = _384;
    bool _440 = !_204;
    float _442 = -_434;
    float _444 = _440 ? _442 : _434;
    int _446 = _76 + 20;
    uint _448 = uint(int(uint(_446) >> uint(2)));
    uint _450 = uint(int(uint(int(_448)) >> uint(2)));
    int _452 = int(_448) & 3;
    float _454 = (*spvDescriptorSet0.cp_c5)._m0[int(_450)][_452];
    bool _456 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _458 = _140 * _444;
    float _460 = _134 * _444;
    float _462 = _136 * _444;
    float _464 = _138 * _444;
    float _466 = fma(_118, _436, _458);
    float _468 = fma(_112, _436, _460);
    float _470 = fma(_114, _436, _462);
    float _472 = fma(_116, _436, _464);
    float _474 = _466 * 2.0;
    float _476 = _468 * 2.0;
    float _478 = _468 * _468;
    float _480 = _472 * _474;
    float _482 = _470 * _470;
    float _484 = _468 * _474;
    float _486 = _470 * _474;
    float _488 = -_480;
    float _490 = fma(_470, _476, _488);
    float _492 = fma(_470, _476, _480);
    float _494 = _470 * 2.0;
    float _496 = fma(_478, -2.0, 1.0);
    float _498 = _472 * _472;
    float _500 = fma(_482, -2.0, 1.0);
    float _502 = fma(_472, _476, _486);
    float _504 = -_486;
    float _506 = fma(_472, _476, _504);
    float _508 = -_484;
    float _510 = fma(_472, _494, _508);
    float _512 = fma(_472, _494, _484);
    float _514 = fma(_498, -2.0, _500);
    float _516 = fma(_498, -2.0, _496);
    float _518 = fma(_482, -2.0, _496);
    float _520 = _312 * _438;
    float _522 = _314 * _438;
    float _524 = _316 * _438;
    float _526 = fma(_158, _454, _520);
    bool _528 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _530 = fma(_160, _454, _522);
    float _532 = fma(_162, _454, _524);
    float _534 = _492 * _526;
    float _536 = _514 * _526;
    float _538 = _506 * _526;
    float _540 = _490 * _530;
    float _542 = _516 * _530;
    float _544 = _512 * _530;
    float _546 = _332 * _438;
    float _548 = _334 * _438;
    float _550 = _336 * _438;
    float _552 = _502 * _532;
    float _554 = _510 * _532;
    float _556 = _518 * _532;
    float _558 = fma(_178, _454, _546);
    float _560 = fma(_180, _454, _548);
    float _562 = fma(_182, _454, _550);
    if (!_528)
    {
        int _564 = _70 * 48;
        int _566 = _564 + 16;
        uint _568 = uint(int(uint(_564) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_568)] = as_type<uint>(_536);
        int _570 = _564 + 4;
        uint _572 = uint(int(uint(_570) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_572)] = as_type<uint>(_540);
        int _574 = _564 + 8;
        uint _576 = uint(int(uint(_574) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_576)] = as_type<uint>(_552);
        int _578 = _564 + 12;
        uint _580 = uint(int(uint(_578) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_580)] = as_type<uint>(_558);
        int _582 = _564 + 32;
        uint _584 = uint(int(uint(_566) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_584)] = as_type<uint>(_534);
        int _586 = _566 + 4;
        uint _588 = uint(int(uint(_586) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_588)] = as_type<uint>(_542);
        int _590 = _566 + 8;
        uint _592 = uint(int(uint(_590) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_592)] = as_type<uint>(_554);
        int _594 = _566 + 12;
        uint _596 = uint(int(uint(_594) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_596)] = as_type<uint>(_560);
        uint _598 = uint(int(uint(_582) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_598)] = as_type<uint>(_538);
        int _600 = _582 + 4;
        uint _602 = uint(int(uint(_600) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_602)] = as_type<uint>(_544);
        int _604 = _582 + 8;
        uint _606 = uint(int(uint(_604) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_606)] = as_type<uint>(_556);
        int _608 = _582 + 12;
        uint _610 = uint(int(uint(_608) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_610)] = as_type<uint>(_562);
    }
    int _612 = _70 * 112;
    bool _614 = !_456;
    float _932;
    float _934;
    float _936;
    float _938;
    float _940;
    float _942;
    float _944;
    float _946;
    float _948;
    float _950;
    float _952;
    float _954;
    if (!_614)
    {
        int _616 = 0;
        float _618 = _536;
        float _620 = _540;
        float _622 = _552;
        float _624 = _558;
        float _626 = _534;
        float _628 = _542;
        float _630 = _554;
        float _632 = _560;
        float _634 = _538;
        float _636 = _544;
        float _638 = _556;
        float _640 = _562;
        bool _642;
        int _690;
        int _700;
        int _710;
        int _720;
        int _730;
        int _740;
        int _750;
        int _760;
        int _770;
        int _780;
        int _790;
        int _800;
        int _908;
        int _912;
        int _914;
        int _918;
        int _920;
        int _922;
        int _926;
        int _928;
        int _930;
        do
        {
            int _644 = _616;
            int _646 = as_type<int>(_618);
            int _648 = as_type<int>(_620);
            int _650 = as_type<int>(_622);
            int _652 = as_type<int>(_624);
            int _654 = as_type<int>(_626);
            int _656 = as_type<int>(_628);
            int _658 = as_type<int>(_630);
            int _660 = as_type<int>(_632);
            int _662 = as_type<int>(_634);
            int _664 = as_type<int>(_636);
            int _666 = as_type<int>(_638);
            int _668 = as_type<int>(_640);
            uint _670 = uint(int(uint(_612) >> uint(2)));
            uint _672 = uint(int(uint(int(_670)) >> uint(2)));
            int _674 = int(_670) & 3;
            float _676 = (*spvDescriptorSet0.cp_c6)._m0[int(_672)][_674];
            bool _678 = _70 != 0;
            int _680 = _644 + 1;
            bool _682 = uint(_680) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _684 = _646;
            int _686 = as_type<int>(_676);
            int _688 = 31;
            int _2280 = _60(_684, _686, _688, _690, gl_SubgroupInvocationID);
            int _692 = _2280;
            int _694 = _648;
            int _696 = as_type<int>(_676);
            int _698 = 31;
            int _2284 = _60(_694, _696, _698, _700, gl_SubgroupInvocationID);
            int _702 = _2284;
            int _704 = _650;
            int _706 = as_type<int>(_676);
            int _708 = 31;
            int _2288 = _60(_704, _706, _708, _710, gl_SubgroupInvocationID);
            int _712 = _2288;
            int _714 = _652;
            int _716 = as_type<int>(_676);
            int _718 = 31;
            int _2292 = _60(_714, _716, _718, _720, gl_SubgroupInvocationID);
            int _722 = _2292;
            int _724 = _654;
            int _726 = as_type<int>(_676);
            int _728 = 31;
            int _2296 = _60(_724, _726, _728, _730, gl_SubgroupInvocationID);
            int _732 = _2296;
            int _734 = _656;
            int _736 = as_type<int>(_676);
            int _738 = 31;
            int _2300 = _60(_734, _736, _738, _740, gl_SubgroupInvocationID);
            int _742 = _2300;
            int _744 = _658;
            int _746 = as_type<int>(_676);
            int _748 = 31;
            int _2304 = _60(_744, _746, _748, _750, gl_SubgroupInvocationID);
            int _752 = _2304;
            int _754 = _660;
            int _756 = as_type<int>(_676);
            int _758 = 31;
            int _2308 = _60(_754, _756, _758, _760, gl_SubgroupInvocationID);
            int _762 = _2308;
            int _764 = _662;
            int _766 = as_type<int>(_676);
            int _768 = 31;
            int _2312 = _60(_764, _766, _768, _770, gl_SubgroupInvocationID);
            int _772 = _2312;
            int _774 = _664;
            int _776 = as_type<int>(_676);
            int _778 = 31;
            int _2316 = _60(_774, _776, _778, _780, gl_SubgroupInvocationID);
            int _782 = _2316;
            int _784 = _666;
            int _786 = as_type<int>(_676);
            int _788 = 31;
            int _2320 = _60(_784, _786, _788, _790, gl_SubgroupInvocationID);
            int _792 = _2320;
            int _794 = _668;
            int _796 = as_type<int>(_676);
            int _798 = 31;
            int _2324 = _60(_794, _796, _798, _800, gl_SubgroupInvocationID);
            int _802 = _2324;
            bool _804 = !_678;
            _616 = _680;
            int _806 = _646;
            int _808 = _648;
            int _810 = _650;
            int _812 = _652;
            int _814 = _654;
            int _816 = _656;
            int _818 = _658;
            int _820 = _660;
            int _822 = _662;
            int _824 = _664;
            int _826 = _666;
            int _828 = _668;
            if (!_804)
            {
                float _830 = _560 * as_type<float>(_742);
                float _832 = _542 * as_type<float>(_742);
                float _834 = _554 * as_type<float>(_742);
                float _836 = _542 * as_type<float>(_702);
                float _838 = _534 * as_type<float>(_702);
                float _840 = _554 * as_type<float>(_702);
                float _842 = _560 * as_type<float>(_702);
                float _844 = fma(_558, as_type<float>(_732), _830);
                float _846 = fma(_540, as_type<float>(_732), _832);
                float _848 = _560 * as_type<float>(_782);
                float _850 = fma(_552, as_type<float>(_732), _834);
                float _852 = _542 * as_type<float>(_782);
                float _854 = fma(_540, as_type<float>(_692), _836);
                float _856 = _534 * as_type<float>(_742);
                float _858 = _534 * as_type<float>(_782);
                float _860 = fma(_536, as_type<float>(_692), _838);
                float _862 = fma(_552, as_type<float>(_692), _840);
                float _864 = fma(_558, as_type<float>(_692), _842);
                float _866 = _554 * as_type<float>(_782);
                float _868 = fma(_558, as_type<float>(_772), _848);
                float _870 = fma(_540, as_type<float>(_772), _852);
                float _872 = fma(_536, as_type<float>(_732), _856);
                float _874 = fma(_536, as_type<float>(_772), _858);
                float _876 = fma(_544, as_type<float>(_712), _854);
                float _878 = fma(_538, as_type<float>(_712), _860);
                float _880 = fma(_556, as_type<float>(_712), _862);
                float _882 = fma(_556, as_type<float>(_752), _850);
                float _884 = fma(_552, as_type<float>(_772), _866);
                float _886 = fma(_562, as_type<float>(_712), _864);
                float _888 = fma(_562, as_type<float>(_752), _844);
                float _890 = fma(_562, as_type<float>(_792), _868);
                float _892 = fma(_538, as_type<float>(_752), _872);
                float _894 = fma(_544, as_type<float>(_752), _846);
                float _896 = fma(_538, as_type<float>(_792), _874);
                float _898 = fma(_544, as_type<float>(_792), _870);
                float _900 = fma(_556, as_type<float>(_792), _884);
                float _902 = as_type<float>(_722) + _886;
                float _904 = as_type<float>(_762) + _888;
                float _906 = as_type<float>(_802) + _890;
                _806 = as_type<int>(_878);
                _808 = as_type<int>(_876);
                _810 = as_type<int>(_880);
                _812 = as_type<int>(_902);
                _814 = as_type<int>(_892);
                _816 = as_type<int>(_894);
                _818 = as_type<int>(_882);
                _820 = as_type<int>(_904);
                _822 = as_type<int>(_896);
                _824 = as_type<int>(_898);
                _826 = as_type<int>(_900);
                _828 = as_type<int>(_906);
            }
            _908 = _806;
            int _910 = _808;
            _912 = _810;
            _914 = _812;
            int _916 = _814;
            _918 = _816;
            _920 = _818;
            _922 = _820;
            int _924 = _822;
            _926 = _824;
            _928 = _826;
            _930 = _828;
            _642 = !_682;
            _618 = as_type<float>(_908);
            _620 = as_type<float>(_910);
            _622 = as_type<float>(_912);
            _624 = as_type<float>(_914);
            _626 = as_type<float>(_916);
            _628 = as_type<float>(_918);
            _630 = as_type<float>(_920);
            _632 = as_type<float>(_922);
            _634 = as_type<float>(_924);
            _636 = as_type<float>(_926);
            _638 = as_type<float>(_928);
            _640 = as_type<float>(_930);
            _932 = as_type<float>(_910);
            _934 = as_type<float>(_916);
            _936 = as_type<float>(_924);
        } while (_642);
        _938 = as_type<float>(_918);
        _940 = as_type<float>(_926);
        _942 = as_type<float>(_908);
        _944 = as_type<float>(_912);
        _946 = as_type<float>(_920);
        _948 = as_type<float>(_928);
        _950 = as_type<float>(_922);
        _952 = as_type<float>(_930);
        _954 = as_type<float>(_914);
        _956 = true;
    }
    else
    {
        _932 = _540;
        _938 = _542;
        _940 = _544;
        _942 = _536;
        _934 = _534;
        _936 = _538;
        _944 = _552;
        _946 = _554;
        _948 = _556;
        _950 = _560;
        _952 = _562;
        _954 = _558;
    }
    _956 = false;
    float _958 = _932;
    float _960 = _938;
    float _962 = _940;
    float _964 = _942;
    float _966 = _934;
    float _968 = _936;
    float _970 = _944;
    float _972 = _946;
    float _974 = _948;
    float _976 = _950;
    float _978 = _952;
    float _980 = _954;
    int _982 = _612 + 80;
    uint _984 = uint(int(uint(_982) >> uint(2)));
    uint _986 = uint(int(uint(int(_984)) >> uint(2)));
    int _988 = int(_984) & 3;
    float _990 = (*spvDescriptorSet0.cp_c6)._m0[int(_986)][_988];
    int _992 = int(_984) + 1;
    uint _994 = uint(int(uint(_992) >> uint(2)));
    int _996 = _992 & 3;
    float _998 = (*spvDescriptorSet0.cp_c6)._m0[int(_994)][_996];
    int _1000 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1002 = _1000 + _70;
    int _1004 = _612 + 64;
    uint _1006 = uint(int(uint(_1004) >> uint(2)));
    uint _1008 = uint(int(uint(int(_1006)) >> uint(2)));
    int _1010 = int(_1006) & 3;
    float _1012 = (*spvDescriptorSet0.cp_c6)._m0[int(_1008)][_1010];
    int _1014 = int(_1006) + 1;
    uint _1016 = uint(int(uint(_1014) >> uint(2)));
    int _1018 = _1014 & 3;
    float _1020 = (*spvDescriptorSet0.cp_c6)._m0[int(_1016)][_1018];
    int _1022 = _1002 * 48;
    int _1024 = _612 + 88;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    uint _1028 = uint(int(uint(int(_1026)) >> uint(2)));
    int _1030 = int(_1026) & 3;
    float _1032 = (*spvDescriptorSet0.cp_c6)._m0[int(_1028)][_1030];
    int _1034 = int(_1026) + 1;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    int _1038 = _1034 & 3;
    float _1040 = (*spvDescriptorSet0.cp_c6)._m0[int(_1036)][_1038];
    int _1042 = _612 + 72;
    uint _1044 = uint(int(uint(_1042) >> uint(2)));
    uint _1046 = uint(int(uint(int(_1044)) >> uint(2)));
    int _1048 = int(_1044) & 3;
    float _1050 = (*spvDescriptorSet0.cp_c6)._m0[int(_1046)][_1048];
    int _1052 = int(_1044) + 1;
    uint _1054 = uint(int(uint(_1052) >> uint(2)));
    int _1056 = _1052 & 3;
    float _1058 = (*spvDescriptorSet0.cp_c6)._m0[int(_1054)][_1056];
    int _1060 = _612 + 96;
    uint _1062 = uint(int(uint(_1060) >> uint(2)));
    uint _1064 = uint(int(uint(int(_1062)) >> uint(2)));
    int _1066 = int(_1062) & 3;
    float _1068 = (*spvDescriptorSet0.cp_c6)._m0[int(_1064)][_1066];
    int _1070 = int(_1062) + 1;
    uint _1072 = uint(int(uint(_1070) >> uint(2)));
    int _1074 = _1070 & 3;
    float _1076 = (*spvDescriptorSet0.cp_c6)._m0[int(_1072)][_1074];
    int _1078 = _612 + 104;
    uint _1080 = uint(int(uint(_1078) >> uint(2)));
    uint _1082 = uint(int(uint(int(_1080)) >> uint(2)));
    int _1084 = int(_1080) & 3;
    float _1086 = (*spvDescriptorSet0.cp_c6)._m0[int(_1082)][_1084];
    int _1088 = int(_1080) + 1;
    uint _1090 = uint(int(uint(_1088) >> uint(2)));
    int _1092 = _1088 & 3;
    float _1094 = (*spvDescriptorSet0.cp_c6)._m0[int(_1090)][_1092];
    float _1096 = _958 * _990;
    float _1098 = _960 * _990;
    float _1100 = _962 * _990;
    int _1102 = _612 + 16;
    uint _1104 = uint(int(uint(_1102) >> uint(2)));
    uint _1106 = uint(int(uint(int(_1104)) >> uint(2)));
    int _1108 = int(_1104) & 3;
    float _1110 = (*spvDescriptorSet0.cp_c6)._m0[int(_1106)][_1108];
    int _1112 = int(_1104) + 1;
    uint _1114 = uint(int(uint(_1112) >> uint(2)));
    int _1116 = _1112 & 3;
    float _1118 = (*spvDescriptorSet0.cp_c6)._m0[int(_1114)][_1116];
    float _1120 = _958 * _998;
    float _1122 = _962 * _998;
    float _1124 = fma(_964, _1012, _1096);
    float _1126 = fma(_966, _1012, _1098);
    float _1128 = fma(_968, _1012, _1100);
    float _1130 = _960 * _998;
    int _1132 = _612 + 32;
    uint _1134 = uint(int(uint(_1132) >> uint(2)));
    uint _1136 = uint(int(uint(int(_1134)) >> uint(2)));
    int _1138 = int(_1134) & 3;
    float _1140 = (*spvDescriptorSet0.cp_c6)._m0[int(_1136)][_1138];
    int _1142 = int(_1134) + 1;
    uint _1144 = uint(int(uint(_1142) >> uint(2)));
    int _1146 = _1142 & 3;
    float _1148 = (*spvDescriptorSet0.cp_c6)._m0[int(_1144)][_1146];
    float _1150 = fma(_964, _1020, _1120);
    float _1152 = fma(_968, _1020, _1122);
    float _1154 = fma(_966, _1020, _1130);
    float _1156 = _958 * _1032;
    float _1158 = _960 * _1032;
    float _1160 = _958 * _1040;
    float _1162 = _960 * _1040;
    int _1164 = _612 + 48;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    uint _1168 = uint(int(uint(int(_1166)) >> uint(2)));
    int _1170 = int(_1166) & 3;
    float _1172 = (*spvDescriptorSet0.cp_c6)._m0[int(_1168)][_1170];
    int _1174 = int(_1166) + 1;
    uint _1176 = uint(int(uint(_1174) >> uint(2)));
    int _1178 = _1174 & 3;
    float _1180 = (*spvDescriptorSet0.cp_c6)._m0[int(_1176)][_1178];
    float _1182 = _962 * _1032;
    float _1184 = _962 * _1040;
    float _1186 = fma(_964, _1050, _1156);
    float _1188 = fma(_966, _1050, _1158);
    float _1190 = fma(_964, _1058, _1160);
    float _1192 = fma(_966, _1058, _1162);
    int _1194 = _612 + 24;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    uint _1198 = uint(int(uint(int(_1196)) >> uint(2)));
    int _1200 = int(_1196) & 3;
    float _1202 = (*spvDescriptorSet0.cp_c6)._m0[int(_1198)][_1200];
    int _1204 = int(_1196) + 1;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    int _1208 = _1204 & 3;
    float _1210 = (*spvDescriptorSet0.cp_c6)._m0[int(_1206)][_1208];
    float _1212 = fma(_968, _1050, _1182);
    float _1214 = fma(_968, _1058, _1184);
    float _1216 = fma(_970, _1068, _1124);
    float _1218 = fma(_972, _1068, _1126);
    float _1220 = fma(_974, _1068, _1128);
    float _1222 = fma(_972, _1076, _1154);
    int _1224 = _612 + 40;
    uint _1226 = uint(int(uint(_1224) >> uint(2)));
    uint _1228 = uint(int(uint(int(_1226)) >> uint(2)));
    int _1230 = int(_1226) & 3;
    float _1232 = (*spvDescriptorSet0.cp_c6)._m0[int(_1228)][_1230];
    int _1234 = int(_1226) + 1;
    uint _1236 = uint(int(uint(_1234) >> uint(2)));
    int _1238 = _1234 & 3;
    float _1240 = (*spvDescriptorSet0.cp_c6)._m0[int(_1236)][_1238];
    float _1242 = fma(_970, _1076, _1150);
    float _1244 = fma(_974, _1076, _1152);
    float _1246 = fma(_970, _1086, _1186);
    float _1248 = fma(_972, _1094, _1192);
    float _1250 = fma(_974, _1094, _1214);
    float _1252 = fma(_970, _1094, _1190);
    int _1254 = _612 + 56;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    uint _1258 = uint(int(uint(int(_1256)) >> uint(2)));
    int _1260 = int(_1256) & 3;
    float _1262 = (*spvDescriptorSet0.cp_c6)._m0[int(_1258)][_1260];
    int _1264 = int(_1256) + 1;
    uint _1266 = uint(int(uint(_1264) >> uint(2)));
    int _1268 = _1264 & 3;
    float _1270 = (*spvDescriptorSet0.cp_c6)._m0[int(_1266)][_1268];
    float _1272 = fma(_972, _1086, _1188);
    float _1274 = _1248 + _976;
    float _1276 = fma(_974, _1086, _1212);
    float _1278 = _1250 + _978;
    float _1280 = _1252 + _980;
    float _1282 = _1218 * _1118;
    float _1284 = _1222 * _1118;
    float _1286 = _1272 * _1118;
    float _1288 = _1274 * _1118;
    float _1290 = fma(_1216, _1110, _1282);
    float _1292 = fma(_1242, _1110, _1284);
    float _1294 = fma(_1246, _1110, _1286);
    float _1296 = fma(_1280, _1110, _1288);
    float _1298 = _1274 * _1148;
    float _1300 = _1218 * _1148;
    float _1302 = _1222 * _1148;
    float _1304 = _1272 * _1148;
    float _1306 = fma(_1280, _1140, _1298);
    float _1308 = fma(_1216, _1140, _1300);
    float _1310 = fma(_1242, _1140, _1302);
    float _1312 = fma(_1246, _1140, _1304);
    float _1314 = _1274 * _1180;
    float _1316 = _1218 * _1180;
    float _1318 = _1222 * _1180;
    float _1320 = _1272 * _1180;
    float _1322 = fma(_1280, _1172, _1314);
    float _1324 = fma(_1216, _1172, _1316);
    float _1326 = fma(_1242, _1172, _1318);
    float _1328 = fma(_1246, _1172, _1320);
    float _1330 = fma(_1278, _1202, _1296);
    float _1332 = fma(_1220, _1202, _1290);
    float _1334 = fma(_1244, _1202, _1292);
    float _1336 = fma(_1276, _1202, _1294);
    float _1338 = _1330 + _1210;
    int _1340 = _1022 + 32;
    float _1342 = fma(_1278, _1232, _1306);
    float _1344 = fma(_1220, _1232, _1308);
    float _1346 = fma(_1244, _1232, _1310);
    int _1348 = _1022 + 16;
    float _1350 = fma(_1276, _1232, _1312);
    float _1352 = _1342 + _1240;
    int _1354 = _1022 + 48;
    float _1356 = fma(_1278, _1262, _1322);
    float _1358 = fma(_1220, _1262, _1324);
    float _1360 = fma(_1244, _1262, _1326);
    float _1362 = fma(_1276, _1262, _1328);
    float _1364 = _1356 + _1270;
    uint _1366 = uint(int(uint(_1348) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1366)] = as_type<uint>(_1332);
    int _1368 = _1348 + 4;
    uint _1370 = uint(int(uint(_1368) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1370)] = as_type<uint>(_1334);
    int _1372 = _1348 + 8;
    uint _1374 = uint(int(uint(_1372) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1374)] = as_type<uint>(_1336);
    int _1376 = _1348 + 12;
    uint _1378 = uint(int(uint(_1376) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1378)] = as_type<uint>(_1338);
    uint _1380 = uint(int(uint(_1340) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1380)] = as_type<uint>(_1344);
    int _1382 = _1340 + 4;
    uint _1384 = uint(int(uint(_1382) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1384)] = as_type<uint>(_1346);
    int _1386 = _1340 + 8;
    uint _1388 = uint(int(uint(_1386) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1388)] = as_type<uint>(_1350);
    int _1390 = _1340 + 12;
    uint _1392 = uint(int(uint(_1390) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1392)] = as_type<uint>(_1352);
    uint _1394 = uint(int(uint(_1354) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1394)] = as_type<uint>(_1358);
    int _1396 = _1354 + 4;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1398)] = as_type<uint>(_1360);
    int _1400 = _1354 + 8;
    uint _1402 = uint(int(uint(_1400) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1402)] = as_type<uint>(_1362);
    int _1404 = _1354 + 12;
    uint _1406 = uint(int(uint(_1404) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1406)] = as_type<uint>(_1364);
}

