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
    constant _16* cp_c4 [[id(1)]];
    constant _16* cp_c5 [[id(2)]];
    constant _16* cp_c6 [[id(3)]];
    constant _16* cp_c3 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
};

static inline __attribute__((always_inline))
int _52(thread const int& _2756, thread const int& _2757, constant _10& support_buffer)
{
    int _2760 = 1 + _2757;
    float _2762 = support_buffer._m5[_2760].x;
    bool _2764 = _2762 == 1.0;
    if (_2764)
    {
        return _2756;
    }
    float _2766 = float(_2756);
    float _2768 = _2766 * _2762;
    int _2770 = int(_2768);
    return _2770;
}

static inline __attribute__((always_inline))
int _54(thread const int& _2791, thread const int& _2792, thread const int& _2793, thread int& _2794, thread uint& gl_SubgroupInvocationID)
{
    int _2797 = _2793 & 31;
    uint _2799 = uint(int(uint(_2793) >> uint(8)));
    int _2801 = int(_2799) & 31;
    float _2803 = as_type<float>(gl_SubgroupInvocationID);
    int _2805 = as_type<int>(_2803) & _2801;
    int _2807 = ~_2801;
    int _2809 = _2797 & _2807;
    int _2811 = _2809 | _2805;
    int _2813 = ~_2801;
    int _2815 = _2792 & _2813;
    int _2817 = _2815 | _2805;
    bool _2819 = uint(_2817) <= uint(_2811);
    _2794 = _2819 ? (-1) : 0;
    float _2821 = spvSubgroupShuffle(as_type<float>(_2791), uint(_2817));
    uint _2823 = uint(_2819 ? as_type<int>(_2821) : _2791);
    return int(_2823);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _696 = false;
    float _58 = as_type<float>(gl_WorkGroupID.x);
    float _60 = as_type<float>(gl_LocalInvocationID.x);
    int _62 = as_type<int>(_58) << 6;
    int _64 = _62 + as_type<int>(_60);
    bool _68 = uint(_64) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_68)
    {
        return;
    }
    int _70 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _73 = uint(int(uint(_70) >> uint(2)));
    uint _75 = uint(int(uint(int(_73)) >> uint(2)));
    int _77 = int(_73) & 3;
    float _79 = (*spvDescriptorSet0.cp_c5)._m0[int(_75)][_77];
    int _81 = int(_73) + 1;
    uint _83 = uint(int(uint(_81) >> uint(2)));
    int _85 = _81 & 3;
    float _87 = (*spvDescriptorSet0.cp_c5)._m0[int(_83)][_85];
    int _89 = _64;
    int _91 = 0;
    int _93 = _52(_89, _91, (*spvDescriptorSet0.support_buffer));
    int _95 = as_type<int>(_79);
    int _97 = 0;
    int _99 = _52(_95, _97, (*spvDescriptorSet0.support_buffer));
    int3 _1218 = int3(_93, _99, 1);
    float4 _102 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1218.xy), uint(_1218.z), 0).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    int _112 = _64;
    int _114 = 0;
    int _116 = _52(_112, _114, (*spvDescriptorSet0.support_buffer));
    int _118 = as_type<int>(_87);
    int _120 = 0;
    int _122 = _52(_118, _120, (*spvDescriptorSet0.support_buffer));
    int3 _1238 = int3(_116, _122, 1);
    float4 _124 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1238.xy), uint(_1238.z), 0).xyzw;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _124.z;
    float _132 = _124.w;
    int _134 = _64;
    int _136 = 0;
    int _138 = _52(_134, _136, (*spvDescriptorSet0.support_buffer));
    int _140 = as_type<int>(_79);
    int _142 = 0;
    int _144 = _52(_140, _142, (*spvDescriptorSet0.support_buffer));
    int3 _1258 = int3(_138, _144, 0);
    float3 _148 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1258.xy), uint(_1258.z), 0).xyz;
    float _150 = _148.x;
    float _152 = _148.y;
    float _154 = _148.z;
    int _156 = _64;
    int _158 = 0;
    int _160 = _52(_156, _158, (*spvDescriptorSet0.support_buffer));
    int _162 = as_type<int>(_87);
    int _164 = 0;
    int _166 = _52(_162, _164, (*spvDescriptorSet0.support_buffer));
    int3 _1276 = int3(_160, _166, 0);
    float3 _168 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1276.xy), uint(_1276.z), 0).xyz;
    float _170 = _168.x;
    float _172 = _168.y;
    float _174 = _168.z;
    int _176 = _64;
    int _178 = 0;
    int _180 = _52(_176, _178, (*spvDescriptorSet0.support_buffer));
    int _182 = as_type<int>(_79);
    int _184 = 0;
    int _186 = _52(_182, _184, (*spvDescriptorSet0.support_buffer));
    int3 _1294 = int3(_180, _186, 2);
    float3 _188 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1294.xy), uint(_1294.z), 0).xyz;
    float _190 = _188.x;
    float _192 = _188.y;
    float _194 = _188.z;
    int _196 = _64;
    int _198 = 0;
    int _200 = _52(_196, _198, (*spvDescriptorSet0.support_buffer));
    int _202 = as_type<int>(_87);
    int _204 = 0;
    int _206 = _52(_202, _204, (*spvDescriptorSet0.support_buffer));
    int3 _1312 = int3(_200, _206, 2);
    float3 _208 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1312.xy), uint(_1312.z), 0).xyz;
    float _210 = _208.x;
    float _212 = _208.y;
    float _214 = _208.z;
    int _216 = _70 + 16;
    uint _218 = uint(int(uint(_216) >> uint(2)));
    uint _220 = uint(int(uint(int(_218)) >> uint(2)));
    int _222 = int(_218) & 3;
    float _224 = (*spvDescriptorSet0.cp_c5)._m0[int(_220)][_222];
    bool _226 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _228 = -_110;
    float _230 = _228 + _132;
    float _232 = -_108;
    float _234 = _232 + _130;
    float _236 = -_104;
    float _238 = _236 + _126;
    float _240 = fma(_230, _224, _110);
    float _242 = -_106;
    float _244 = _242 + _128;
    float _246 = fma(_234, _224, _108);
    float _248 = fma(_238, _224, _104);
    float _250 = _240 * 2.0;
    float _252 = fma(_244, _224, _106);
    float _254 = _248 * 2.0;
    float _256 = _246 * _250;
    float _258 = _252 * _250;
    float _260 = _252 * 2.0;
    float _262 = _248 * _250;
    float _264 = -_256;
    float _266 = fma(_252, _254, _264);
    float _268 = fma(_252, _254, _256);
    float _270 = fma(_246, _254, _258);
    float _272 = -_258;
    float _274 = fma(_246, _254, _272);
    float _276 = _248 * _248;
    float _278 = _252 * _252;
    float _280 = -_262;
    float _282 = fma(_246, _260, _280);
    float _284 = fma(_246, _260, _262);
    float _286 = -_150;
    float _288 = _286 + _170;
    float _290 = _246 * _246;
    float _292 = fma(_276, -2.0, 1.0);
    float _294 = fma(_278, -2.0, 1.0);
    float _296 = -_152;
    float _298 = _296 + _172;
    float _300 = fma(_288, _224, _150);
    float _302 = -_154;
    float _304 = _302 + _174;
    float _306 = fma(_290, -2.0, _294);
    float _308 = fma(_290, -2.0, _292);
    float _310 = fma(_298, _224, _152);
    float _312 = fma(_278, -2.0, _292);
    float _314 = -_190;
    float _316 = _314 + _210;
    float _318 = fma(_304, _224, _154);
    float _320 = _310 * _308;
    float _322 = _310 * _266;
    float _324 = _310 * _284;
    float _326 = -_192;
    float _328 = _326 + _212;
    float _330 = -_194;
    float _332 = _330 + _214;
    float _334 = fma(_316, _224, _190);
    float _336 = _300 * _306;
    float _338 = fma(_328, _224, _192);
    float _340 = fma(_332, _224, _194);
    float _342 = _300 * _268;
    float _344 = _300 * _274;
    float _346 = _318 * _270;
    float _348 = _318 * _282;
    float _350 = _318 * _312;
    int _352 = _64 * 112;
    bool _354 = !_226;
    float _356 = _336;
    float _358 = _334;
    float _676;
    float _678;
    float _680;
    float _682;
    float _684;
    float _686;
    float _688;
    float _690;
    float _692;
    float _694;
    if (!_354)
    {
        int _360 = 0;
        float _362 = _336;
        float _364 = _322;
        float _366 = _346;
        float _368 = _334;
        float _370 = _342;
        float _372 = _320;
        float _374 = _348;
        float _376 = _338;
        float _378 = _344;
        float _380 = _324;
        float _382 = _350;
        float _384 = _340;
        bool _386;
        int _434;
        int _444;
        int _454;
        int _464;
        int _474;
        int _484;
        int _494;
        int _504;
        int _514;
        int _524;
        int _534;
        int _544;
        int _652;
        int _656;
        int _658;
        int _662;
        int _664;
        int _666;
        int _670;
        int _672;
        int _674;
        do
        {
            int _388 = _360;
            int _390 = as_type<int>(_362);
            int _392 = as_type<int>(_364);
            int _394 = as_type<int>(_366);
            int _396 = as_type<int>(_368);
            int _398 = as_type<int>(_370);
            int _400 = as_type<int>(_372);
            int _402 = as_type<int>(_374);
            int _404 = as_type<int>(_376);
            int _406 = as_type<int>(_378);
            int _408 = as_type<int>(_380);
            int _410 = as_type<int>(_382);
            int _412 = as_type<int>(_384);
            uint _414 = uint(int(uint(_352) >> uint(2)));
            uint _416 = uint(int(uint(int(_414)) >> uint(2)));
            int _418 = int(_414) & 3;
            float _420 = (*spvDescriptorSet0.cp_c6)._m0[int(_416)][_418];
            bool _422 = _64 != 0;
            int _424 = _388 + 1;
            bool _426 = uint(_424) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _428 = _390;
            int _430 = as_type<int>(_420);
            int _432 = 31;
            int _1610 = _54(_428, _430, _432, _434, gl_SubgroupInvocationID);
            int _436 = _1610;
            int _438 = _392;
            int _440 = as_type<int>(_420);
            int _442 = 31;
            int _1614 = _54(_438, _440, _442, _444, gl_SubgroupInvocationID);
            int _446 = _1614;
            int _448 = _394;
            int _450 = as_type<int>(_420);
            int _452 = 31;
            int _1618 = _54(_448, _450, _452, _454, gl_SubgroupInvocationID);
            int _456 = _1618;
            int _458 = _396;
            int _460 = as_type<int>(_420);
            int _462 = 31;
            int _1622 = _54(_458, _460, _462, _464, gl_SubgroupInvocationID);
            int _466 = _1622;
            int _468 = _398;
            int _470 = as_type<int>(_420);
            int _472 = 31;
            int _1626 = _54(_468, _470, _472, _474, gl_SubgroupInvocationID);
            int _476 = _1626;
            int _478 = _400;
            int _480 = as_type<int>(_420);
            int _482 = 31;
            int _1630 = _54(_478, _480, _482, _484, gl_SubgroupInvocationID);
            int _486 = _1630;
            int _488 = _402;
            int _490 = as_type<int>(_420);
            int _492 = 31;
            int _1634 = _54(_488, _490, _492, _494, gl_SubgroupInvocationID);
            int _496 = _1634;
            int _498 = _404;
            int _500 = as_type<int>(_420);
            int _502 = 31;
            int _1638 = _54(_498, _500, _502, _504, gl_SubgroupInvocationID);
            int _506 = _1638;
            int _508 = _406;
            int _510 = as_type<int>(_420);
            int _512 = 31;
            int _1642 = _54(_508, _510, _512, _514, gl_SubgroupInvocationID);
            int _516 = _1642;
            int _518 = _408;
            int _520 = as_type<int>(_420);
            int _522 = 31;
            int _1646 = _54(_518, _520, _522, _524, gl_SubgroupInvocationID);
            int _526 = _1646;
            int _528 = _410;
            int _530 = as_type<int>(_420);
            int _532 = 31;
            int _1650 = _54(_528, _530, _532, _534, gl_SubgroupInvocationID);
            int _536 = _1650;
            int _538 = _412;
            int _540 = as_type<int>(_420);
            int _542 = 31;
            int _1654 = _54(_538, _540, _542, _544, gl_SubgroupInvocationID);
            int _546 = _1654;
            bool _548 = !_422;
            _360 = _424;
            int _550 = _390;
            int _552 = _392;
            int _554 = _394;
            int _556 = _396;
            int _558 = _398;
            int _560 = _400;
            int _562 = _402;
            int _564 = _404;
            int _566 = _406;
            int _568 = _408;
            int _570 = _410;
            int _572 = _412;
            if (!_548)
            {
                float _574 = _342 * as_type<float>(_446);
                float _576 = _320 * as_type<float>(_446);
                float _578 = _348 * as_type<float>(_446);
                float _580 = _320 * as_type<float>(_486);
                float _582 = fma(_336, as_type<float>(_436), _574);
                float _584 = _342 * as_type<float>(_486);
                float _586 = _348 * as_type<float>(_486);
                float _588 = _338 * as_type<float>(_486);
                float _590 = fma(_322, as_type<float>(_436), _576);
                float _592 = fma(_346, as_type<float>(_436), _578);
                float _594 = _338 * as_type<float>(_446);
                float _596 = fma(_322, as_type<float>(_476), _580);
                float _598 = fma(_336, as_type<float>(_476), _584);
                float _600 = fma(_346, as_type<float>(_476), _586);
                float _602 = fma(_334, as_type<float>(_476), _588);
                float _604 = _320 * as_type<float>(_526);
                float _606 = _338 * as_type<float>(_526);
                float _608 = _342 * as_type<float>(_526);
                float _610 = _348 * as_type<float>(_526);
                float _612 = fma(_334, as_type<float>(_436), _594);
                float _614 = fma(_322, as_type<float>(_516), _604);
                float _616 = fma(_334, as_type<float>(_516), _606);
                float _618 = fma(_336, as_type<float>(_516), _608);
                float _620 = fma(_346, as_type<float>(_516), _610);
                float _622 = fma(_340, as_type<float>(_456), _612);
                float _624 = fma(_344, as_type<float>(_496), _598);
                float _626 = fma(_324, as_type<float>(_496), _596);
                float _628 = fma(_350, as_type<float>(_496), _600);
                float _630 = fma(_340, as_type<float>(_496), _602);
                float _632 = fma(_340, as_type<float>(_536), _616);
                float _634 = fma(_350, as_type<float>(_456), _592);
                float _636 = fma(_324, as_type<float>(_536), _614);
                float _638 = fma(_344, as_type<float>(_456), _582);
                float _640 = fma(_324, as_type<float>(_456), _590);
                float _642 = fma(_344, as_type<float>(_536), _618);
                float _644 = fma(_350, as_type<float>(_536), _620);
                float _646 = as_type<float>(_466) + _622;
                float _648 = as_type<float>(_506) + _630;
                float _650 = as_type<float>(_546) + _632;
                _550 = as_type<int>(_638);
                _552 = as_type<int>(_640);
                _554 = as_type<int>(_634);
                _556 = as_type<int>(_646);
                _558 = as_type<int>(_624);
                _560 = as_type<int>(_626);
                _562 = as_type<int>(_628);
                _564 = as_type<int>(_648);
                _566 = as_type<int>(_642);
                _568 = as_type<int>(_636);
                _570 = as_type<int>(_644);
                _572 = as_type<int>(_650);
            }
            _652 = _550;
            int _654 = _552;
            _656 = _554;
            _658 = _556;
            int _660 = _558;
            _662 = _560;
            _664 = _562;
            _666 = _564;
            int _668 = _566;
            _670 = _568;
            _672 = _570;
            _674 = _572;
            _386 = !_426;
            _362 = as_type<float>(_652);
            _364 = as_type<float>(_654);
            _366 = as_type<float>(_656);
            _368 = as_type<float>(_658);
            _370 = as_type<float>(_660);
            _372 = as_type<float>(_662);
            _374 = as_type<float>(_664);
            _376 = as_type<float>(_666);
            _378 = as_type<float>(_668);
            _380 = as_type<float>(_670);
            _382 = as_type<float>(_672);
            _384 = as_type<float>(_674);
            _676 = as_type<float>(_654);
            _678 = as_type<float>(_660);
            _680 = as_type<float>(_668);
        } while (_386);
        _682 = as_type<float>(_662);
        _684 = as_type<float>(_670);
        _356 = as_type<float>(_652);
        _686 = as_type<float>(_672);
        _688 = as_type<float>(_656);
        _690 = as_type<float>(_664);
        _692 = as_type<float>(_666);
        _358 = as_type<float>(_658);
        _694 = as_type<float>(_674);
        _696 = true;
    }
    else
    {
        _676 = _322;
        _682 = _320;
        _684 = _324;
        _678 = _342;
        _680 = _344;
        _686 = _350;
        _688 = _346;
        _690 = _348;
        _692 = _338;
        _694 = _340;
    }
    _696 = false;
    float _698 = _676;
    float _700 = _682;
    float _702 = _684;
    float _704 = _356;
    float _706 = _678;
    float _708 = _680;
    float _710 = _686;
    float _712 = _688;
    float _714 = _690;
    float _716 = _692;
    float _718 = _358;
    float _720 = _694;
    int _722 = _352 + 80;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    uint _726 = uint(int(uint(int(_724)) >> uint(2)));
    int _728 = int(_724) & 3;
    float _730 = (*spvDescriptorSet0.cp_c6)._m0[int(_726)][_728];
    int _732 = int(_724) + 1;
    uint _734 = uint(int(uint(_732) >> uint(2)));
    int _736 = _732 & 3;
    float _738 = (*spvDescriptorSet0.cp_c6)._m0[int(_734)][_736];
    int _740 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _742 = _740 + _64;
    int _744 = _352 + 64;
    uint _746 = uint(int(uint(_744) >> uint(2)));
    uint _748 = uint(int(uint(int(_746)) >> uint(2)));
    int _750 = int(_746) & 3;
    float _752 = (*spvDescriptorSet0.cp_c6)._m0[int(_748)][_750];
    int _754 = int(_746) + 1;
    uint _756 = uint(int(uint(_754) >> uint(2)));
    int _758 = _754 & 3;
    float _760 = (*spvDescriptorSet0.cp_c6)._m0[int(_756)][_758];
    int _762 = _742 * 48;
    int _764 = _352 + 88;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    uint _768 = uint(int(uint(int(_766)) >> uint(2)));
    int _770 = int(_766) & 3;
    float _772 = (*spvDescriptorSet0.cp_c6)._m0[int(_768)][_770];
    int _774 = int(_766) + 1;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    int _778 = _774 & 3;
    float _780 = (*spvDescriptorSet0.cp_c6)._m0[int(_776)][_778];
    int _782 = _352 + 72;
    uint _784 = uint(int(uint(_782) >> uint(2)));
    uint _786 = uint(int(uint(int(_784)) >> uint(2)));
    int _788 = int(_784) & 3;
    float _790 = (*spvDescriptorSet0.cp_c6)._m0[int(_786)][_788];
    int _792 = int(_784) + 1;
    uint _794 = uint(int(uint(_792) >> uint(2)));
    int _796 = _792 & 3;
    float _798 = (*spvDescriptorSet0.cp_c6)._m0[int(_794)][_796];
    int _800 = _352 + 96;
    uint _802 = uint(int(uint(_800) >> uint(2)));
    uint _804 = uint(int(uint(int(_802)) >> uint(2)));
    int _806 = int(_802) & 3;
    float _808 = (*spvDescriptorSet0.cp_c6)._m0[int(_804)][_806];
    int _810 = int(_802) + 1;
    uint _812 = uint(int(uint(_810) >> uint(2)));
    int _814 = _810 & 3;
    float _816 = (*spvDescriptorSet0.cp_c6)._m0[int(_812)][_814];
    int _818 = _352 + 104;
    uint _820 = uint(int(uint(_818) >> uint(2)));
    uint _822 = uint(int(uint(int(_820)) >> uint(2)));
    int _824 = int(_820) & 3;
    float _826 = (*spvDescriptorSet0.cp_c6)._m0[int(_822)][_824];
    int _828 = int(_820) + 1;
    uint _830 = uint(int(uint(_828) >> uint(2)));
    int _832 = _828 & 3;
    float _834 = (*spvDescriptorSet0.cp_c6)._m0[int(_830)][_832];
    int _836 = _352 + 16;
    uint _838 = uint(int(uint(_836) >> uint(2)));
    uint _840 = uint(int(uint(int(_838)) >> uint(2)));
    int _842 = int(_838) & 3;
    float _844 = (*spvDescriptorSet0.cp_c6)._m0[int(_840)][_842];
    int _846 = int(_838) + 1;
    uint _848 = uint(int(uint(_846) >> uint(2)));
    int _850 = _846 & 3;
    float _852 = (*spvDescriptorSet0.cp_c6)._m0[int(_848)][_850];
    float _854 = _698 * _730;
    float _856 = _700 * _730;
    float _858 = _702 * _730;
    float _860 = _700 * _738;
    float _862 = _702 * _738;
    int _864 = _352 + 32;
    uint _866 = uint(int(uint(_864) >> uint(2)));
    uint _868 = uint(int(uint(int(_866)) >> uint(2)));
    int _870 = int(_866) & 3;
    float _872 = (*spvDescriptorSet0.cp_c6)._m0[int(_868)][_870];
    int _874 = int(_866) + 1;
    uint _876 = uint(int(uint(_874) >> uint(2)));
    int _878 = _874 & 3;
    float _880 = (*spvDescriptorSet0.cp_c6)._m0[int(_876)][_878];
    float _882 = fma(_704, _752, _854);
    float _884 = fma(_706, _752, _856);
    float _886 = fma(_708, _752, _858);
    float _888 = _698 * _738;
    float _890 = fma(_708, _760, _862);
    float _892 = fma(_706, _760, _860);
    int _894 = _352 + 48;
    uint _896 = uint(int(uint(_894) >> uint(2)));
    uint _898 = uint(int(uint(int(_896)) >> uint(2)));
    int _900 = int(_896) & 3;
    float _902 = (*spvDescriptorSet0.cp_c6)._m0[int(_898)][_900];
    int _904 = int(_896) + 1;
    uint _906 = uint(int(uint(_904) >> uint(2)));
    int _908 = _904 & 3;
    float _910 = (*spvDescriptorSet0.cp_c6)._m0[int(_906)][_908];
    float _912 = fma(_704, _760, _888);
    float _914 = _698 * _772;
    float _916 = _698 * _780;
    float _918 = _700 * _772;
    float _920 = _700 * _780;
    float _922 = _702 * _772;
    float _924 = _702 * _780;
    float _926 = fma(_704, _790, _914);
    int _928 = _352 + 24;
    uint _930 = uint(int(uint(_928) >> uint(2)));
    uint _932 = uint(int(uint(int(_930)) >> uint(2)));
    int _934 = int(_930) & 3;
    float _936 = (*spvDescriptorSet0.cp_c6)._m0[int(_932)][_934];
    int _938 = int(_930) + 1;
    uint _940 = uint(int(uint(_938) >> uint(2)));
    int _942 = _938 & 3;
    float _944 = (*spvDescriptorSet0.cp_c6)._m0[int(_940)][_942];
    float _946 = fma(_704, _798, _916);
    float _948 = fma(_706, _790, _918);
    float _950 = fma(_706, _798, _920);
    float _952 = fma(_708, _790, _922);
    float _954 = fma(_708, _798, _924);
    float _956 = fma(_710, _808, _886);
    int _958 = _352 + 40;
    uint _960 = uint(int(uint(_958) >> uint(2)));
    uint _962 = uint(int(uint(int(_960)) >> uint(2)));
    int _964 = int(_960) & 3;
    float _966 = (*spvDescriptorSet0.cp_c6)._m0[int(_962)][_964];
    int _968 = int(_960) + 1;
    uint _970 = uint(int(uint(_968) >> uint(2)));
    int _972 = _968 & 3;
    float _974 = (*spvDescriptorSet0.cp_c6)._m0[int(_970)][_972];
    float _976 = fma(_712, _808, _882);
    float _978 = fma(_712, _816, _912);
    float _980 = fma(_714, _808, _884);
    float _982 = fma(_714, _816, _892);
    float _984 = fma(_710, _816, _890);
    float _986 = fma(_714, _834, _950);
    int _988 = _352 + 56;
    uint _990 = uint(int(uint(_988) >> uint(2)));
    uint _992 = uint(int(uint(int(_990)) >> uint(2)));
    int _994 = int(_990) & 3;
    float _996 = (*spvDescriptorSet0.cp_c6)._m0[int(_992)][_994];
    int _998 = int(_990) + 1;
    uint _1000 = uint(int(uint(_998) >> uint(2)));
    int _1002 = _998 & 3;
    float _1004 = (*spvDescriptorSet0.cp_c6)._m0[int(_1000)][_1002];
    float _1006 = fma(_712, _826, _926);
    float _1008 = fma(_712, _834, _946);
    float _1010 = fma(_710, _834, _954);
    float _1012 = fma(_714, _826, _948);
    float _1014 = _986 + _716;
    float _1016 = fma(_710, _826, _952);
    float _1018 = _1008 + _718;
    float _1020 = _1010 + _720;
    float _1022 = _980 * _852;
    float _1024 = _982 * _852;
    float _1026 = _1012 * _852;
    float _1028 = _1014 * _852;
    float _1030 = fma(_976, _844, _1022);
    float _1032 = fma(_978, _844, _1024);
    float _1034 = fma(_1006, _844, _1026);
    float _1036 = fma(_1018, _844, _1028);
    float _1038 = _980 * _880;
    float _1040 = _982 * _880;
    float _1042 = _1012 * _880;
    float _1044 = _1014 * _880;
    float _1046 = fma(_976, _872, _1038);
    float _1048 = fma(_978, _872, _1040);
    float _1050 = fma(_1006, _872, _1042);
    float _1052 = fma(_1018, _872, _1044);
    float _1054 = _980 * _910;
    float _1056 = _982 * _910;
    float _1058 = _1012 * _910;
    float _1060 = _1014 * _910;
    float _1062 = fma(_976, _902, _1054);
    float _1064 = fma(_978, _902, _1056);
    float _1066 = fma(_1006, _902, _1058);
    float _1068 = fma(_1018, _902, _1060);
    float _1070 = fma(_1020, _936, _1036);
    float _1072 = fma(_956, _936, _1030);
    float _1074 = fma(_984, _936, _1032);
    float _1076 = fma(_1016, _936, _1034);
    float _1078 = _1070 + _944;
    float _1080 = fma(_1020, _966, _1052);
    float _1082 = fma(_956, _966, _1046);
    float _1084 = fma(_984, _966, _1048);
    int _1086 = _762 + 16;
    float _1088 = fma(_1016, _966, _1050);
    float _1090 = _1080 + _974;
    int _1092 = _762 + 32;
    float _1094 = fma(_1020, _996, _1068);
    float _1096 = fma(_1016, _996, _1066);
    float _1098 = fma(_956, _996, _1062);
    float _1100 = fma(_984, _996, _1064);
    float _1102 = _1094 + _1004;
    int _1104 = _762 + 48;
    uint _1106 = uint(int(uint(_1086) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1106)] = as_type<uint>(_1072);
    int _1108 = _1086 + 4;
    uint _1110 = uint(int(uint(_1108) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1110)] = as_type<uint>(_1074);
    int _1112 = _1086 + 8;
    uint _1114 = uint(int(uint(_1112) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1114)] = as_type<uint>(_1076);
    int _1116 = _1086 + 12;
    uint _1118 = uint(int(uint(_1116) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1118)] = as_type<uint>(_1078);
    uint _1120 = uint(int(uint(_1092) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1120)] = as_type<uint>(_1082);
    int _1122 = _1092 + 4;
    uint _1124 = uint(int(uint(_1122) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1124)] = as_type<uint>(_1084);
    int _1126 = _1092 + 8;
    uint _1128 = uint(int(uint(_1126) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1128)] = as_type<uint>(_1088);
    int _1130 = _1092 + 12;
    uint _1132 = uint(int(uint(_1130) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1132)] = as_type<uint>(_1090);
    uint _1134 = uint(int(uint(_1104) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1134)] = as_type<uint>(_1098);
    int _1136 = _1104 + 4;
    uint _1138 = uint(int(uint(_1136) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1138)] = as_type<uint>(_1100);
    int _1140 = _1104 + 8;
    uint _1142 = uint(int(uint(_1140) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1142)] = as_type<uint>(_1096);
    int _1144 = _1104 + 12;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1146)] = as_type<uint>(_1102);
}

