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
    texture2d_array<float> cp_t_tcb_A [[id(7)]];
    sampler cp_t_tcb_ASmplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_8 [[id(9)]];
    sampler cp_t_tcb_8Smplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _3625, thread const int& _3626, constant _10& support_buffer)
{
    int _3629 = 1 + _3626;
    float _3631 = support_buffer._m5[_3629].x;
    bool _3633 = _3631 == 1.0;
    if (_3633)
    {
        return _3625;
    }
    float _3635 = float(_3625);
    float _3637 = _3635 * _3631;
    int _3639 = int(_3637);
    return _3639;
}

static inline __attribute__((always_inline))
int _58(thread const int& _3660, thread const int& _3661, thread const int& _3662, thread int& _3663, thread uint& gl_SubgroupInvocationID)
{
    int _3666 = _3662 & 31;
    uint _3668 = uint(int(uint(_3662) >> uint(8)));
    int _3670 = int(_3668) & 31;
    float _3672 = as_type<float>(gl_SubgroupInvocationID);
    int _3674 = as_type<int>(_3672) & _3670;
    int _3676 = ~_3670;
    int _3678 = _3666 & _3676;
    int _3680 = _3678 | _3674;
    int _3682 = ~_3670;
    int _3684 = _3661 & _3682;
    int _3686 = _3684 | _3674;
    bool _3688 = uint(_3686) <= uint(_3680);
    _3663 = _3688 ? (-1) : 0;
    float _3690 = spvSubgroupShuffle(as_type<float>(_3660), uint(_3686));
    uint _3692 = uint(_3688 ? as_type<int>(_3690) : _3660);
    return int(_3692);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _594 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_72)
    {
        return;
    }
    int _74 = _68 & 31;
    bool _76 = _74 == 0;
    bool _78 = uint(_74) < 32u;
    int _80 = 32 - _74;
    int _82 = _74 - 32;
    int _84 = 1 << _74;
    uint _87 = uint(int(uint(0) >> uint(_80)));
    int _89 = _84 | int(_87);
    int _91 = _76 ? 1 : _89;
    bool _93 = uint(_82) < 32u;
    int _95 = 0 << _82;
    int _97 = _93 ? _95 : 0;
    float _99 = _78 ? as_type<float>(_91) : as_type<float>(_97);
    int _101 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _103 = _101 + 36;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = _101 + 32;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    uint _117 = uint(int(uint(int(_115)) >> uint(2)));
    int _119 = int(_115) & 3;
    float _121 = (*spvDescriptorSet0.cp_c5)._m0[int(_117)][_119];
    int _123 = as_type<int>(_99) & as_type<int>(_111);
    bool _125 = _123 != 0;
    int _127 = as_type<int>(_99) & as_type<int>(_121);
    bool _129 = _127 != 0;
    int _131 = 0;
    float _133 = _99;
    if (_125)
    {
        int _135 = _101 + 8;
        uint _137 = uint(int(uint(_135) >> uint(2)));
        uint _139 = uint(int(uint(int(_137)) >> uint(2)));
        int _141 = int(_137) & 3;
        float _143 = (*spvDescriptorSet0.cp_c5)._m0[int(_139)][_141];
        _131 = as_type<int>(_143);
    }
    int _145 = _131;
    float _147 = 0.0;
    if (_125)
    {
        _147 = 1.4012984643248170709237295832899e-45;
    }
    float _149 = _147;
    if (_125)
    {
        _133 = 2.8025969286496341418474591665798e-45;
    }
    float _151 = _133;
    int _153 = 0;
    if (_129)
    {
        uint _155 = uint(int(uint(_101) >> uint(2)));
        uint _157 = uint(int(uint(int(_155)) >> uint(2)));
        int _159 = int(_155) & 3;
        float _161 = (*spvDescriptorSet0.cp_c5)._m0[int(_157)][_159];
        _153 = as_type<int>(_161);
    }
    int _163 = _153;
    float _165 = 0.0;
    if (_129)
    {
        _165 = 1.4012984643248170709237295832899e-45;
    }
    float _167 = _165;
    float _169 = _149;
    float _171 = as_type<float>(_68);
    float _173 = 0.0;
    float _175 = as_type<float>(_145);
    if (_125)
    {
        int _177 = _68;
        int _179 = 0;
        int _181 = _56(_177, _179, (*spvDescriptorSet0.support_buffer));
        int _183 = _145;
        int _185 = 0;
        int _187 = _56(_183, _185, (*spvDescriptorSet0.support_buffer));
        int3 _1734 = int3(_181, _187, as_type<int>(_149));
        float3 _191 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1734.xy), uint(_1734.z), 0).xyz;
        float _193 = _191.x;
        float _195 = _191.y;
        float _197 = _191.z;
        _169 = _193;
        _171 = _195;
        _173 = _197;
    }
    float _199 = _169;
    float _201 = _171;
    float _203 = _173;
    float _205 = 0.0;
    float _207 = as_type<float>(_68);
    float _209 = 0.0;
    if (_125)
    {
        int _211 = _68;
        int _213 = 0;
        int _215 = _56(_211, _213, (*spvDescriptorSet0.support_buffer));
        int _217 = _145;
        int _219 = 0;
        int _221 = _56(_217, _219, (*spvDescriptorSet0.support_buffer));
        int3 _1762 = int3(_215, _221, 0);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1762.xy), uint(_1762.z), 0).xyz;
        float _225 = _223.x;
        float _227 = _223.y;
        float _229 = _223.z;
        _205 = _225;
        _207 = _227;
        _209 = _229;
    }
    float _231 = _205;
    float _233 = _207;
    float _235 = _209;
    float _237 = _151;
    float _239 = as_type<float>(_68);
    float _241 = 0.0;
    if (_125)
    {
        int _243 = _68;
        int _245 = 0;
        int _247 = _56(_243, _245, (*spvDescriptorSet0.support_buffer));
        int _249 = _145;
        int _251 = 0;
        int _253 = _56(_249, _251, (*spvDescriptorSet0.support_buffer));
        int3 _1793 = int3(_247, _253, as_type<int>(_151));
        float3 _255 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1793.xy), uint(_1793.z), 0).xyz;
        float _257 = _255.x;
        float _259 = _255.y;
        float _261 = _255.z;
        _237 = _257;
        _239 = _259;
        _241 = _261;
    }
    float _263 = _237;
    float _265 = _239;
    float _267 = _241;
    float _269 = 0.0;
    float _271 = as_type<float>(_68);
    float _273 = 0.0;
    if (_129)
    {
        int _275 = _68;
        int _277 = 1;
        int _279 = _56(_275, _277, (*spvDescriptorSet0.support_buffer));
        int _281 = _163;
        int _283 = 1;
        int _285 = _56(_281, _283, (*spvDescriptorSet0.support_buffer));
        int3 _1821 = int3(_279, _285, 0);
        float3 _287 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1821.xy), uint(_1821.z), 0).xyz;
        float _289 = _287.x;
        float _291 = _287.y;
        float _293 = _287.z;
        _269 = _289;
        _271 = _291;
        _273 = _293;
    }
    float _295 = _269;
    float _297 = _271;
    float _299 = _273;
    float _301 = 0.0;
    float _303 = 0.0;
    float _305 = 0.0;
    float _307 = 0.0;
    if (_129)
    {
        int _309 = _68;
        int _311 = 1;
        int _313 = _56(_309, _311, (*spvDescriptorSet0.support_buffer));
        int _315 = _163;
        int _317 = 1;
        int _319 = _56(_315, _317, (*spvDescriptorSet0.support_buffer));
        int3 _1849 = int3(_313, _319, as_type<int>(_167));
        float4 _322 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1849.xy), uint(_1849.z), 0).xyzw;
        float _324 = _322.x;
        float _326 = _322.y;
        float _328 = _322.z;
        float _330 = _322.w;
        _301 = _324;
        _303 = _326;
        _305 = _328;
        _307 = _330;
    }
    float _332 = _301;
    float _334 = _303;
    float _336 = _305;
    float _338 = _307;
    float _340 = 0.0;
    float _342 = 0.0;
    if (!_129)
    {
        _340 = 0.0;
        _342 = 0.0;
    }
    float _344 = _340;
    float _346 = _342;
    float _348 = 0.0;
    float _350 = 0.0;
    float _352 = _344;
    float _354 = _346;
    if (!_129)
    {
        _348 = 0.0;
        _350 = 0.0;
    }
    float _356 = _348;
    float _358 = _350;
    float _360 = 0.0;
    float _362 = 0.0;
    float _364 = _356;
    float _366 = _358;
    if (!_129)
    {
        _360 = 0.0;
        _362 = 0.0;
    }
    float _368 = _360;
    float _370 = _362;
    float _372 = 0.0;
    float _374 = _370;
    float _376 = _368;
    if (!_129)
    {
        _372 = 0.0;
    }
    float _378 = _372;
    float _380 = 0.0;
    float _382 = _378;
    if (!_129)
    {
        _175 = 0.0;
        _380 = 0.0;
    }
    float _384 = _175;
    float _386 = _380;
    float _388 = 0.0;
    float _390 = _384;
    float _392 = _386;
    if (!_129)
    {
        _388 = 0.0;
    }
    float _394 = _388;
    bool _396 = !_129;
    float _398 = _394;
    if (!_396)
    {
        int _400 = _68;
        int _402 = 1;
        int _404 = _56(_400, _402, (*spvDescriptorSet0.support_buffer));
        int _406 = _163;
        int _408 = 1;
        int _410 = _56(_406, _408, (*spvDescriptorSet0.support_buffer));
        int3 _1926 = int3(_404, _410, 2);
        float3 _412 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1926.xy), uint(_1926.z), 0).xyz;
        float _414 = _412.x;
        float _416 = _412.y;
        float _418 = _412.z;
        float _420 = _338 * 2.0;
        _382 = _332;
        _374 = _336;
        _398 = _334;
        _352 = _295;
        _364 = _297;
        _366 = _299;
        _390 = _414;
        _392 = _416;
        _376 = _418;
        _354 = _420;
    }
    float _422 = _382;
    float _424 = _374;
    float _426 = _398;
    float _428 = _352;
    float _430 = _364;
    float _432 = _366;
    float _434 = _390;
    float _436 = _392;
    float _438 = _376;
    float _440 = _354;
    bool _442 = !_125;
    float _444 = _432;
    float _446 = _430;
    float _448 = _438;
    float _450 = _436;
    float _572;
    float _574;
    float _576;
    float _578;
    float _580;
    float _582;
    float _584;
    float _586;
    float _588;
    float _590;
    float _592;
    if (!_442)
    {
        int _452 = _101 + 28;
        uint _454 = uint(int(uint(_452) >> uint(2)));
        uint _456 = uint(int(uint(int(_454)) >> uint(2)));
        int _458 = int(_454) & 3;
        float _460 = (*spvDescriptorSet0.cp_c5)._m0[int(_456)][_458];
        int _462 = _101 + 20;
        uint _464 = uint(int(uint(_462) >> uint(2)));
        uint _466 = uint(int(uint(int(_464)) >> uint(2)));
        int _468 = int(_464) & 3;
        float _470 = (*spvDescriptorSet0.cp_c5)._m0[int(_466)][_468];
        float _472 = _199 * _460;
        float _474 = _203 * _460;
        float _476 = _201 * _460;
        float _478 = _231 * _460;
        float _480 = _233 * _460;
        float _482 = _263 * _460;
        float _484 = _265 * _460;
        float _486 = _235 * _460;
        float _488 = fma(_422, _470, _472);
        float _490 = fma(_424, _470, _474);
        float _492 = fma(_426, _470, _476);
        float _494 = fma(_428, _470, _478);
        float _496 = _488 * 0.15915493667125701904296875;
        float _498 = _490 * 0.15915493667125701904296875;
        float _500 = _492 * 0.15915493667125701904296875;
        float _502 = fma(_430, _470, _480);
        float _504 = _496 * 6.283185482025146484375;
        float _506 = sin(_504);
        float _508 = fma(_432, _470, _486);
        float _510 = fma(_434, _470, _482);
        float _512 = fma(_436, _470, _484);
        float _514 = _496 * 6.283185482025146484375;
        float _516 = cos(_514);
        float _518 = _498 * 6.283185482025146484375;
        float _520 = cos(_518);
        float _522 = _267 * _460;
        float _524 = fma(_438, _470, _522);
        float _526 = _500 * 6.283185482025146484375;
        float _528 = sin(_526);
        float _530 = _498 * 6.283185482025146484375;
        float _532 = sin(_530);
        float _534 = _516 * _520;
        float _536 = _506 * _520;
        float _538 = _500 * 6.283185482025146484375;
        float _540 = cos(_538);
        float _542 = _506 * _528;
        float _544 = _506 * _532;
        float _546 = _532 * _516;
        float _548 = -_546;
        float _550 = fma(_520, _542, _548);
        float _552 = _532 * _540;
        float _554 = _516 * _540;
        float _556 = _540 * _520;
        float _558 = fma(_532, _542, _534);
        float _560 = _506 * _540;
        float _562 = fma(_528, _534, _544);
        float _564 = -_536;
        float _566 = fma(_528, _546, _564);
        float _568 = -_528;
        float _570 = _568 + (-0.0);
        _572 = _494;
        _574 = _552;
        _444 = _508;
        _576 = _566;
        _578 = _556;
        _580 = _570;
        _446 = _502;
        _582 = _550;
        _584 = _558;
        _586 = _560;
        _588 = _562;
        _590 = _554;
        _448 = _524;
        _450 = _512;
        _592 = _510;
        _594 = true;
    }
    else
    {
        float _596 = _422 * 2.0;
        float _598 = _424 * _440;
        float _600 = _426 * _440;
        float _602 = -_598;
        float _604 = fma(_596, _426, _602);
        float _606 = fma(_596, _426, _598);
        float _608 = fma(_596, _424, _600);
        float _610 = -_600;
        float _612 = fma(_596, _424, _610);
        float _614 = _422 * _440;
        float _616 = _426 * _426;
        float _618 = _422 * _422;
        float _620 = _426 * 2.0;
        float _622 = _424 * _424;
        float _624 = fma(_616, -2.0, 1.0);
        float _626 = fma(_618, -2.0, 1.0);
        float _628 = -_614;
        float _630 = fma(_620, _424, _628);
        float _632 = fma(_620, _424, _614);
        float _634 = fma(_622, -2.0, _624);
        float _636 = fma(_616, -2.0, _626);
        float _638 = fma(_622, -2.0, _626);
        _572 = _428;
        _574 = _606;
        _576 = _630;
        _578 = _634;
        _580 = _612;
        _582 = _604;
        _584 = _638;
        _586 = _632;
        _588 = _608;
        _590 = _636;
        _592 = _434;
    }
    _594 = false;
    float _640 = _572;
    float _642 = _574;
    float _644 = _444;
    float _646 = _576;
    float _648 = _578;
    float _650 = _580;
    float _652 = _446;
    float _654 = _582;
    float _656 = _584;
    float _658 = _586;
    float _660 = _588;
    float _662 = _590;
    float _664 = _448;
    float _666 = _450;
    float _668 = _592;
    bool _670 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _672 = _640 * _642;
    float _674 = _644 * _646;
    float _676 = _640 * _648;
    float _678 = _640 * _650;
    float _680 = _652 * _654;
    float _682 = _652 * _656;
    float _684 = _652 * _658;
    float _686 = _644 * _660;
    float _688 = _644 * _662;
    int _690 = _68 * 112;
    bool _692 = !_670;
    float _694 = _676;
    float _696 = _680;
    float _698 = _686;
    float _700 = _668;
    float _702 = _672;
    float _704 = _682;
    float _706 = _674;
    float _708 = _666;
    float _710 = _678;
    float _712 = _684;
    float _714 = _688;
    float _716 = _664;
    if (!_692)
    {
        int _718 = 0;
        float _720 = _676;
        float _722 = _680;
        float _724 = _686;
        float _726 = _668;
        float _728 = _672;
        float _730 = _682;
        float _732 = _674;
        float _734 = _666;
        float _736 = _678;
        float _738 = _684;
        float _740 = _688;
        float _742 = _664;
        bool _744;
        int _792;
        int _802;
        int _812;
        int _822;
        int _832;
        int _842;
        int _852;
        int _862;
        int _872;
        int _882;
        int _892;
        int _902;
        float _1010;
        float _1012;
        float _1014;
        int _1016;
        float _1018;
        int _1020;
        int _1022;
        int _1024;
        int _1026;
        float _1028;
        float _1030;
        float _1032;
        do
        {
            int _746 = _718;
            float _748 = _720;
            float _750 = _722;
            float _752 = _724;
            int _754 = as_type<int>(_726);
            float _756 = _728;
            int _758 = as_type<int>(_730);
            int _760 = as_type<int>(_732);
            int _762 = as_type<int>(_734);
            int _764 = as_type<int>(_736);
            float _766 = _738;
            float _768 = _740;
            float _770 = _742;
            uint _772 = uint(int(uint(_690) >> uint(2)));
            uint _774 = uint(int(uint(int(_772)) >> uint(2)));
            int _776 = int(_772) & 3;
            float _778 = (*spvDescriptorSet0.cp_c6)._m0[int(_774)][_776];
            bool _780 = _68 != 0;
            int _782 = _746 + 1;
            bool _784 = uint(_782) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _786 = as_type<int>(_748);
            int _788 = as_type<int>(_778);
            int _790 = 31;
            int _2376 = _58(_786, _788, _790, _792, gl_SubgroupInvocationID);
            int _794 = _2376;
            int _796 = as_type<int>(_750);
            int _798 = as_type<int>(_778);
            int _800 = 31;
            int _2381 = _58(_796, _798, _800, _802, gl_SubgroupInvocationID);
            int _804 = _2381;
            int _806 = as_type<int>(_752);
            int _808 = as_type<int>(_778);
            int _810 = 31;
            int _2386 = _58(_806, _808, _810, _812, gl_SubgroupInvocationID);
            int _814 = _2386;
            int _816 = _754;
            int _818 = as_type<int>(_778);
            int _820 = 31;
            int _2390 = _58(_816, _818, _820, _822, gl_SubgroupInvocationID);
            int _824 = _2390;
            int _826 = as_type<int>(_756);
            int _828 = as_type<int>(_778);
            int _830 = 31;
            int _2395 = _58(_826, _828, _830, _832, gl_SubgroupInvocationID);
            int _834 = _2395;
            int _836 = _758;
            int _838 = as_type<int>(_778);
            int _840 = 31;
            int _2399 = _58(_836, _838, _840, _842, gl_SubgroupInvocationID);
            int _844 = _2399;
            int _846 = _760;
            int _848 = as_type<int>(_778);
            int _850 = 31;
            int _2403 = _58(_846, _848, _850, _852, gl_SubgroupInvocationID);
            int _854 = _2403;
            int _856 = _762;
            int _858 = as_type<int>(_778);
            int _860 = 31;
            int _2407 = _58(_856, _858, _860, _862, gl_SubgroupInvocationID);
            int _864 = _2407;
            int _866 = _764;
            int _868 = as_type<int>(_778);
            int _870 = 31;
            int _2411 = _58(_866, _868, _870, _872, gl_SubgroupInvocationID);
            int _874 = _2411;
            int _876 = as_type<int>(_766);
            int _878 = as_type<int>(_778);
            int _880 = 31;
            int _2416 = _58(_876, _878, _880, _882, gl_SubgroupInvocationID);
            int _884 = _2416;
            int _886 = as_type<int>(_768);
            int _888 = as_type<int>(_778);
            int _890 = 31;
            int _2421 = _58(_886, _888, _890, _892, gl_SubgroupInvocationID);
            int _894 = _2421;
            int _896 = as_type<int>(_770);
            int _898 = as_type<int>(_778);
            int _900 = 31;
            int _2426 = _58(_896, _898, _900, _902, gl_SubgroupInvocationID);
            int _904 = _2426;
            bool _906 = !_780;
            _718 = _782;
            float _908 = _748;
            float _910 = _750;
            float _912 = _752;
            int _914 = _754;
            float _916 = _756;
            int _918 = _758;
            int _920 = _760;
            int _922 = _762;
            int _924 = _764;
            float _926 = _766;
            float _928 = _768;
            float _930 = _770;
            if (!_906)
            {
                float _932 = as_type<float>(_804) * _666;
                float _934 = _672 * as_type<float>(_804);
                float _936 = _682 * as_type<float>(_804);
                float _938 = _674 * as_type<float>(_804);
                float _940 = fma(as_type<float>(_794), _668, _932);
                float _942 = _672 * as_type<float>(_844);
                float _944 = _682 * as_type<float>(_844);
                float _946 = _674 * as_type<float>(_844);
                float _948 = as_type<float>(_844) * _666;
                float _950 = fma(_676, as_type<float>(_794), _934);
                float _952 = fma(_680, as_type<float>(_794), _936);
                float _954 = fma(_686, as_type<float>(_794), _938);
                float _956 = fma(_676, as_type<float>(_834), _942);
                float _958 = fma(_680, as_type<float>(_834), _944);
                float _960 = fma(_686, as_type<float>(_834), _946);
                float _962 = _672 * as_type<float>(_884);
                float _964 = as_type<float>(_884) * _666;
                float _966 = fma(as_type<float>(_834), _668, _948);
                float _968 = _674 * as_type<float>(_884);
                float _970 = _682 * as_type<float>(_884);
                float _972 = fma(_676, as_type<float>(_874), _962);
                float _974 = fma(as_type<float>(_874), _668, _964);
                float _976 = fma(_686, as_type<float>(_874), _968);
                float _978 = fma(_688, as_type<float>(_814), _954);
                float _980 = fma(_680, as_type<float>(_874), _970);
                float _982 = fma(_678, as_type<float>(_814), _950);
                float _984 = fma(_684, as_type<float>(_814), _952);
                float _986 = fma(_684, as_type<float>(_854), _958);
                float _988 = fma(as_type<float>(_814), _664, _940);
                float _990 = fma(_678, as_type<float>(_854), _956);
                float _992 = fma(_688, as_type<float>(_854), _960);
                float _994 = fma(as_type<float>(_854), _664, _966);
                float _996 = fma(as_type<float>(_894), _664, _974);
                float _998 = fma(_684, as_type<float>(_894), _980);
                float _1000 = fma(_678, as_type<float>(_894), _972);
                float _1002 = fma(_688, as_type<float>(_894), _976);
                float _1004 = as_type<float>(_824) + _988;
                float _1006 = as_type<float>(_864) + _994;
                float _1008 = as_type<float>(_904) + _996;
                _908 = _982;
                _910 = _984;
                _912 = _978;
                _914 = as_type<int>(_1004);
                _916 = _990;
                _918 = as_type<int>(_986);
                _920 = as_type<int>(_992);
                _922 = as_type<int>(_1006);
                _924 = as_type<int>(_1000);
                _926 = _998;
                _928 = _1002;
                _930 = _1008;
            }
            _1010 = _908;
            _1012 = _910;
            _1014 = _912;
            _1016 = _914;
            _1018 = _916;
            _1020 = _918;
            _1022 = _920;
            _1024 = _922;
            _1026 = _924;
            _1028 = _926;
            _1030 = _928;
            _1032 = _930;
            _744 = !_784;
            _720 = _1010;
            _722 = _1012;
            _724 = _1014;
            _726 = as_type<float>(_1016);
            _728 = _1018;
            _730 = as_type<float>(_1020);
            _732 = as_type<float>(_1022);
            _734 = as_type<float>(_1024);
            _736 = as_type<float>(_1026);
            _738 = _1028;
            _740 = _1030;
            _742 = _1032;
        } while (_744);
        _694 = _1010;
        _696 = _1012;
        _698 = _1014;
        _700 = as_type<float>(_1016);
        _702 = _1018;
        _704 = as_type<float>(_1020);
        _706 = as_type<float>(_1022);
        _708 = as_type<float>(_1024);
        _710 = as_type<float>(_1026);
        _712 = _1028;
        _714 = _1030;
        _716 = _1032;
    }
    float _1034 = _694;
    float _1036 = _696;
    float _1038 = _698;
    float _1040 = _700;
    float _1042 = _702;
    float _1044 = _704;
    float _1046 = _706;
    float _1048 = _708;
    float _1050 = _710;
    float _1052 = _712;
    float _1054 = _714;
    float _1056 = _716;
    int _1058 = _690 + 80;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    uint _1062 = uint(int(uint(int(_1060)) >> uint(2)));
    int _1064 = int(_1060) & 3;
    float _1066 = (*spvDescriptorSet0.cp_c6)._m0[int(_1062)][_1064];
    int _1068 = int(_1060) + 1;
    uint _1070 = uint(int(uint(_1068) >> uint(2)));
    int _1072 = _1068 & 3;
    float _1074 = (*spvDescriptorSet0.cp_c6)._m0[int(_1070)][_1072];
    bool _1076 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1078 = _690 + 64;
    uint _1080 = uint(int(uint(_1078) >> uint(2)));
    uint _1082 = uint(int(uint(int(_1080)) >> uint(2)));
    int _1084 = int(_1080) & 3;
    float _1086 = (*spvDescriptorSet0.cp_c6)._m0[int(_1082)][_1084];
    int _1088 = int(_1080) + 1;
    uint _1090 = uint(int(uint(_1088) >> uint(2)));
    int _1092 = _1088 & 3;
    float _1094 = (*spvDescriptorSet0.cp_c6)._m0[int(_1090)][_1092];
    int _1096 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1098 = _1096 + _68;
    int _1100 = _690 + 88;
    uint _1102 = uint(int(uint(_1100) >> uint(2)));
    uint _1104 = uint(int(uint(int(_1102)) >> uint(2)));
    int _1106 = int(_1102) & 3;
    float _1108 = (*spvDescriptorSet0.cp_c6)._m0[int(_1104)][_1106];
    int _1110 = int(_1102) + 1;
    uint _1112 = uint(int(uint(_1110) >> uint(2)));
    int _1114 = _1110 & 3;
    float _1116 = (*spvDescriptorSet0.cp_c6)._m0[int(_1112)][_1114];
    int _1118 = _690 + 72;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    uint _1122 = uint(int(uint(int(_1120)) >> uint(2)));
    int _1124 = int(_1120) & 3;
    float _1126 = (*spvDescriptorSet0.cp_c6)._m0[int(_1122)][_1124];
    int _1128 = int(_1120) + 1;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    int _1132 = _1128 & 3;
    float _1134 = (*spvDescriptorSet0.cp_c6)._m0[int(_1130)][_1132];
    int _1136 = _690 + 96;
    uint _1138 = uint(int(uint(_1136) >> uint(2)));
    uint _1140 = uint(int(uint(int(_1138)) >> uint(2)));
    int _1142 = int(_1138) & 3;
    float _1144 = (*spvDescriptorSet0.cp_c6)._m0[int(_1140)][_1142];
    int _1146 = int(_1138) + 1;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    int _1150 = _1146 & 3;
    float _1152 = (*spvDescriptorSet0.cp_c6)._m0[int(_1148)][_1150];
    int _1154 = _690 + 104;
    uint _1156 = uint(int(uint(_1154) >> uint(2)));
    uint _1158 = uint(int(uint(int(_1156)) >> uint(2)));
    int _1160 = int(_1156) & 3;
    float _1162 = (*spvDescriptorSet0.cp_c6)._m0[int(_1158)][_1160];
    int _1164 = int(_1156) + 1;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    int _1168 = _1164 & 3;
    float _1170 = (*spvDescriptorSet0.cp_c6)._m0[int(_1166)][_1168];
    int _1172 = _690 + 16;
    uint _1174 = uint(int(uint(_1172) >> uint(2)));
    uint _1176 = uint(int(uint(int(_1174)) >> uint(2)));
    int _1178 = int(_1174) & 3;
    float _1180 = (*spvDescriptorSet0.cp_c6)._m0[int(_1176)][_1178];
    int _1182 = int(_1174) + 1;
    uint _1184 = uint(int(uint(_1182) >> uint(2)));
    int _1186 = _1182 & 3;
    float _1188 = (*spvDescriptorSet0.cp_c6)._m0[int(_1184)][_1186];
    if (!_1076)
    {
        int _1190 = _68 * 48;
        int _1192 = _1190 + 16;
        uint _1194 = uint(int(uint(_1190) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1194)] = as_type<uint>(_1034);
        int _1196 = _1190 + 4;
        uint _1198 = uint(int(uint(_1196) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1198)] = as_type<uint>(_1036);
        int _1200 = _1190 + 8;
        uint _1202 = uint(int(uint(_1200) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1202)] = as_type<uint>(_1038);
        int _1204 = _1190 + 12;
        uint _1206 = uint(int(uint(_1204) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1206)] = as_type<uint>(_1040);
        int _1208 = _1190 + 32;
        uint _1210 = uint(int(uint(_1192) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1210)] = as_type<uint>(_1042);
        int _1212 = _1192 + 4;
        uint _1214 = uint(int(uint(_1212) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1214)] = as_type<uint>(_1044);
        int _1216 = _1192 + 8;
        uint _1218 = uint(int(uint(_1216) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1218)] = as_type<uint>(_1046);
        int _1220 = _1192 + 12;
        uint _1222 = uint(int(uint(_1220) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1222)] = as_type<uint>(_1048);
        uint _1224 = uint(int(uint(_1208) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1224)] = as_type<uint>(_1050);
        int _1226 = _1208 + 4;
        uint _1228 = uint(int(uint(_1226) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1228)] = as_type<uint>(_1052);
        int _1230 = _1208 + 8;
        uint _1232 = uint(int(uint(_1230) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1232)] = as_type<uint>(_1054);
        int _1234 = _1208 + 12;
        uint _1236 = uint(int(uint(_1234) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1236)] = as_type<uint>(_1056);
    }
    float _1238 = _1052 * _1066;
    float _1240 = _1036 * _1066;
    float _1242 = _1044 * _1066;
    int _1244 = _690 + 32;
    uint _1246 = uint(int(uint(_1244) >> uint(2)));
    uint _1248 = uint(int(uint(int(_1246)) >> uint(2)));
    int _1250 = int(_1246) & 3;
    float _1252 = (*spvDescriptorSet0.cp_c6)._m0[int(_1248)][_1250];
    int _1254 = int(_1246) + 1;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    int _1258 = _1254 & 3;
    float _1260 = (*spvDescriptorSet0.cp_c6)._m0[int(_1256)][_1258];
    float _1262 = fma(_1050, _1086, _1238);
    float _1264 = _1036 * _1074;
    float _1266 = fma(_1034, _1086, _1240);
    float _1268 = fma(_1042, _1086, _1242);
    float _1270 = _1044 * _1074;
    float _1272 = fma(_1034, _1094, _1264);
    float _1274 = _1036 * _1108;
    int _1276 = _690 + 48;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    uint _1280 = uint(int(uint(int(_1278)) >> uint(2)));
    int _1282 = int(_1278) & 3;
    float _1284 = (*spvDescriptorSet0.cp_c6)._m0[int(_1280)][_1282];
    int _1286 = int(_1278) + 1;
    uint _1288 = uint(int(uint(_1286) >> uint(2)));
    int _1290 = _1286 & 3;
    float _1292 = (*spvDescriptorSet0.cp_c6)._m0[int(_1288)][_1290];
    float _1294 = _1036 * _1116;
    float _1296 = _1052 * _1074;
    float _1298 = _1044 * _1108;
    float _1300 = _1044 * _1116;
    float _1302 = _1052 * _1108;
    float _1304 = fma(_1042, _1094, _1270);
    float _1306 = fma(_1050, _1094, _1296);
    float _1308 = _1052 * _1116;
    float _1310 = fma(_1034, _1126, _1274);
    int _1312 = _690 + 24;
    uint _1314 = uint(int(uint(_1312) >> uint(2)));
    uint _1316 = uint(int(uint(int(_1314)) >> uint(2)));
    int _1318 = int(_1314) & 3;
    float _1320 = (*spvDescriptorSet0.cp_c6)._m0[int(_1316)][_1318];
    int _1322 = int(_1314) + 1;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    int _1326 = _1322 & 3;
    float _1328 = (*spvDescriptorSet0.cp_c6)._m0[int(_1324)][_1326];
    float _1330 = fma(_1034, _1134, _1294);
    float _1332 = fma(_1042, _1126, _1298);
    float _1334 = fma(_1042, _1134, _1300);
    float _1336 = fma(_1050, _1134, _1308);
    float _1338 = fma(_1050, _1126, _1302);
    float _1340 = fma(_1038, _1144, _1266);
    float _1342 = fma(_1046, _1170, _1334);
    int _1344 = _690 + 40;
    uint _1346 = uint(int(uint(_1344) >> uint(2)));
    uint _1348 = uint(int(uint(int(_1346)) >> uint(2)));
    int _1350 = int(_1346) & 3;
    float _1352 = (*spvDescriptorSet0.cp_c6)._m0[int(_1348)][_1350];
    int _1354 = int(_1346) + 1;
    uint _1356 = uint(int(uint(_1354) >> uint(2)));
    int _1358 = _1354 & 3;
    float _1360 = (*spvDescriptorSet0.cp_c6)._m0[int(_1356)][_1358];
    float _1362 = fma(_1046, _1144, _1268);
    float _1364 = fma(_1054, _1144, _1262);
    float _1366 = fma(_1038, _1152, _1272);
    float _1368 = fma(_1038, _1162, _1310);
    float _1370 = fma(_1038, _1170, _1330);
    float _1372 = fma(_1046, _1152, _1304);
    float _1374 = fma(_1046, _1162, _1332);
    int _1376 = _690 + 56;
    uint _1378 = uint(int(uint(_1376) >> uint(2)));
    uint _1380 = uint(int(uint(int(_1378)) >> uint(2)));
    int _1382 = int(_1378) & 3;
    float _1384 = (*spvDescriptorSet0.cp_c6)._m0[int(_1380)][_1382];
    int _1386 = int(_1378) + 1;
    uint _1388 = uint(int(uint(_1386) >> uint(2)));
    int _1390 = _1386 & 3;
    float _1392 = (*spvDescriptorSet0.cp_c6)._m0[int(_1388)][_1390];
    float _1394 = fma(_1054, _1170, _1336);
    float _1396 = _1342 + _1048;
    float _1398 = fma(_1054, _1152, _1306);
    float _1400 = fma(_1054, _1162, _1338);
    float _1402 = _1394 + _1056;
    float _1404 = _1370 + _1040;
    float _1406 = _1362 * _1188;
    float _1408 = _1372 * _1188;
    float _1410 = _1374 * _1188;
    float _1412 = _1396 * _1188;
    float _1414 = fma(_1340, _1180, _1406);
    float _1416 = fma(_1366, _1180, _1408);
    float _1418 = fma(_1368, _1180, _1410);
    float _1420 = fma(_1404, _1180, _1412);
    float _1422 = _1362 * _1260;
    float _1424 = _1372 * _1260;
    float _1426 = _1374 * _1260;
    float _1428 = _1396 * _1260;
    float _1430 = fma(_1340, _1252, _1422);
    float _1432 = fma(_1366, _1252, _1424);
    float _1434 = fma(_1368, _1252, _1426);
    float _1436 = _1396 * _1292;
    float _1438 = _1362 * _1292;
    float _1440 = fma(_1404, _1252, _1428);
    float _1442 = _1372 * _1292;
    float _1444 = _1374 * _1292;
    float _1446 = fma(_1404, _1284, _1436);
    int _1448 = _1098 * 48;
    float _1450 = fma(_1340, _1284, _1438);
    float _1452 = fma(_1366, _1284, _1442);
    float _1454 = fma(_1368, _1284, _1444);
    float _1456 = fma(_1402, _1320, _1420);
    float _1458 = fma(_1398, _1320, _1416);
    float _1460 = fma(_1364, _1320, _1414);
    float _1462 = fma(_1400, _1320, _1418);
    float _1464 = _1456 + _1328;
    float _1466 = fma(_1402, _1352, _1440);
    float _1468 = fma(_1364, _1352, _1430);
    float _1470 = fma(_1398, _1352, _1432);
    float _1472 = fma(_1400, _1352, _1434);
    int _1474 = _1448 + 16;
    float _1476 = _1466 + _1360;
    float _1478 = fma(_1402, _1384, _1446);
    float _1480 = fma(_1364, _1384, _1450);
    int _1482 = _1448 + 32;
    float _1484 = fma(_1398, _1384, _1452);
    float _1486 = fma(_1400, _1384, _1454);
    float _1488 = _1478 + _1392;
    int _1490 = _1448 + 48;
    uint _1492 = uint(int(uint(_1474) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1492)] = as_type<uint>(_1460);
    int _1494 = _1474 + 4;
    uint _1496 = uint(int(uint(_1494) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1496)] = as_type<uint>(_1458);
    int _1498 = _1474 + 8;
    uint _1500 = uint(int(uint(_1498) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1500)] = as_type<uint>(_1462);
    int _1502 = _1474 + 12;
    uint _1504 = uint(int(uint(_1502) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1504)] = as_type<uint>(_1464);
    uint _1506 = uint(int(uint(_1482) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1506)] = as_type<uint>(_1468);
    int _1508 = _1482 + 4;
    uint _1510 = uint(int(uint(_1508) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1510)] = as_type<uint>(_1470);
    int _1512 = _1482 + 8;
    uint _1514 = uint(int(uint(_1512) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1514)] = as_type<uint>(_1472);
    int _1516 = _1482 + 12;
    uint _1518 = uint(int(uint(_1516) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1518)] = as_type<uint>(_1476);
    uint _1520 = uint(int(uint(_1490) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1520)] = as_type<uint>(_1480);
    int _1522 = _1490 + 4;
    uint _1524 = uint(int(uint(_1522) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1524)] = as_type<uint>(_1484);
    int _1526 = _1490 + 8;
    uint _1528 = uint(int(uint(_1526) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1528)] = as_type<uint>(_1486);
    int _1530 = _1490 + 12;
    uint _1532 = uint(int(uint(_1530) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1532)] = as_type<uint>(_1488);
}

