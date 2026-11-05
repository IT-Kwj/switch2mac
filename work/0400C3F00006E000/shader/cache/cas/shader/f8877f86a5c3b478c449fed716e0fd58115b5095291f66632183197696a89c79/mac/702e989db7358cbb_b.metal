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
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_A [[id(9)]];
    sampler cp_t_tcb_ASmplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _4065, thread const int& _4066, constant _10& support_buffer)
{
    int _4069 = 1 + _4066;
    float _4071 = support_buffer._m5[_4069].x;
    bool _4073 = _4071 == 1.0;
    if (_4073)
    {
        return _4065;
    }
    float _4075 = float(_4065);
    float _4077 = _4075 * _4071;
    int _4079 = int(_4077);
    return _4079;
}

static inline __attribute__((always_inline))
int _58(thread const int& _4100, thread const int& _4101, thread const int& _4102, thread int& _4103, thread uint& gl_SubgroupInvocationID)
{
    int _4106 = _4102 & 31;
    uint _4108 = uint(int(uint(_4102) >> uint(8)));
    int _4110 = int(_4108) & 31;
    float _4112 = as_type<float>(gl_SubgroupInvocationID);
    int _4114 = as_type<int>(_4112) & _4110;
    int _4116 = ~_4110;
    int _4118 = _4106 & _4116;
    int _4120 = _4118 | _4114;
    int _4122 = ~_4110;
    int _4124 = _4101 & _4122;
    int _4126 = _4124 | _4114;
    bool _4128 = uint(_4126) <= uint(_4120);
    _4103 = _4128 ? (-1) : 0;
    float _4130 = spvSubgroupShuffle(as_type<float>(_4100), uint(_4126));
    uint _4132 = uint(_4128 ? as_type<int>(_4130) : _4100);
    return int(_4132);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1220 = false;
    bool _780 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    float _74 = _64;
    if (_72)
    {
        return;
    }
    int _76 = _68 & 31;
    bool _78 = _76 == 0;
    bool _80 = uint(_76) < 32u;
    int _82 = 32 - _76;
    int _84 = _76 - 32;
    int _86 = 1 << _76;
    uint _89 = uint(int(uint(0) >> uint(_82)));
    int _91 = _86 | int(_89);
    int _93 = _78 ? 1 : _91;
    bool _95 = uint(_84) < 32u;
    int _97 = 0 << _84;
    int _99 = _95 ? _97 : 0;
    int _101 = _80 ? _93 : _99;
    int _103 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _105 = _103 + 32;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.cp_c5)._m0[int(_109)][_111];
    int _115 = _101 & as_type<int>(_113);
    bool _117 = _115 != 0;
    if (!_117)
    {
        _74 = 0.0;
    }
    float _119 = _74;
    float _121 = 0.0;
    float _123 = 0.0;
    float _125 = _119;
    if (!_117)
    {
        _121 = 0.0;
        _123 = 0.0;
    }
    float _127 = _121;
    float _129 = _123;
    float _131 = 0.0;
    float _133 = 0.0;
    float _135 = _127;
    float _137 = _129;
    if (!_117)
    {
        _131 = 0.0;
        _133 = 0.0;
    }
    float _139 = _131;
    float _141 = _133;
    float _143 = 0.0;
    float _145 = _139;
    float _147 = _141;
    if (!_117)
    {
        _143 = 0.0;
    }
    float _149 = _143;
    float _151 = 0.0;
    float _153 = 0.0;
    float _155 = _149;
    if (!_117)
    {
        _151 = 0.0;
        _153 = 0.0;
    }
    float _157 = _151;
    float _159 = _153;
    float _161 = 0.0;
    float _163 = _157;
    float _165 = _159;
    if (!_117)
    {
        _161 = 0.0;
    }
    float _167 = _161;
    float _169 = 0.0;
    float _171 = _167;
    if (!_117)
    {
        _169 = 0.0;
    }
    float _173 = _169;
    bool _175 = !_117;
    float _177 = _173;
    if (!_175)
    {
        uint _179 = uint(int(uint(_103) >> uint(2)));
        uint _181 = uint(int(uint(int(_179)) >> uint(2)));
        int _183 = int(_179) & 3;
        float _185 = (*spvDescriptorSet0.cp_c5)._m0[int(_181)][_183];
        int _187 = int(_179) + 1;
        uint _189 = uint(int(uint(_187) >> uint(2)));
        int _191 = _187 & 3;
        float _193 = (*spvDescriptorSet0.cp_c5)._m0[int(_189)][_191];
        int _195 = _68;
        int _197 = 0;
        int _199 = _56(_195, _197, (*spvDescriptorSet0.support_buffer));
        int _201 = as_type<int>(_185);
        int _203 = 0;
        int _205 = _56(_201, _203, (*spvDescriptorSet0.support_buffer));
        int3 _1908 = int3(_199, _205, 1);
        float4 _208 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1908.xy), uint(_1908.z), 0).xyzw;
        float _210 = _208.x;
        float _212 = _208.y;
        float _214 = _208.z;
        float _216 = _208.w;
        int _218 = _68;
        int _220 = 0;
        int _222 = _56(_218, _220, (*spvDescriptorSet0.support_buffer));
        int _224 = as_type<int>(_193);
        int _226 = 0;
        int _228 = _56(_224, _226, (*spvDescriptorSet0.support_buffer));
        int3 _1928 = int3(_222, _228, 1);
        float4 _230 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1928.xy), uint(_1928.z), 0).xyzw;
        float _232 = _230.x;
        float _234 = _230.y;
        float _236 = _230.z;
        float _238 = _230.w;
        int _240 = _68;
        int _242 = 0;
        int _244 = _56(_240, _242, (*spvDescriptorSet0.support_buffer));
        int _246 = as_type<int>(_185);
        int _248 = 0;
        int _250 = _56(_246, _248, (*spvDescriptorSet0.support_buffer));
        int3 _1948 = int3(_244, _250, 0);
        float3 _254 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1948.xy), uint(_1948.z), 0).xyz;
        float _256 = _254.x;
        float _258 = _254.y;
        float _260 = _254.z;
        int _262 = _68;
        int _264 = 0;
        int _266 = _56(_262, _264, (*spvDescriptorSet0.support_buffer));
        int _268 = as_type<int>(_193);
        int _270 = 0;
        int _272 = _56(_268, _270, (*spvDescriptorSet0.support_buffer));
        int3 _1966 = int3(_266, _272, 0);
        float3 _274 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1966.xy), uint(_1966.z), 0).xyz;
        float _276 = _274.x;
        float _278 = _274.y;
        float _280 = _274.z;
        int _282 = _68;
        int _284 = 0;
        int _286 = _56(_282, _284, (*spvDescriptorSet0.support_buffer));
        int _288 = as_type<int>(_185);
        int _290 = 0;
        int _292 = _56(_288, _290, (*spvDescriptorSet0.support_buffer));
        int3 _1984 = int3(_286, _292, 2);
        float3 _294 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1984.xy), uint(_1984.z), 0).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        int _302 = _68;
        int _304 = 0;
        int _306 = _56(_302, _304, (*spvDescriptorSet0.support_buffer));
        int _308 = as_type<int>(_193);
        int _310 = 0;
        int _312 = _56(_308, _310, (*spvDescriptorSet0.support_buffer));
        int3 _2002 = int3(_306, _312, 2);
        float3 _314 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2002.xy), uint(_2002.z), 0).xyz;
        float _316 = _314.x;
        float _318 = _314.y;
        float _320 = _314.z;
        int _322 = _103 + 16;
        uint _324 = uint(int(uint(_322) >> uint(2)));
        uint _326 = uint(int(uint(int(_324)) >> uint(2)));
        int _328 = int(_324) & 3;
        float _330 = (*spvDescriptorSet0.cp_c5)._m0[int(_326)][_328];
        float _332 = -_212;
        float _334 = _332 + _234;
        float _336 = -_216;
        float _338 = _336 + _238;
        float _340 = -_210;
        float _342 = _340 + _232;
        float _344 = fma(_334, _330, _212);
        float _346 = -_214;
        float _348 = _346 + _236;
        float _350 = -_256;
        float _352 = _350 + _276;
        float _354 = fma(_342, _330, _210);
        float _356 = -_258;
        float _358 = _356 + _278;
        float _360 = fma(_348, _330, _214);
        float _362 = fma(_338, _330, _216);
        float _364 = fma(_352, _330, _256);
        float _366 = -_260;
        float _368 = _366 + _280;
        float _370 = -_296;
        float _372 = _370 + _316;
        float _374 = -_298;
        float _376 = _374 + _318;
        float _378 = -_300;
        float _380 = _378 + _320;
        float _382 = fma(_358, _330, _258);
        float _384 = fma(_368, _330, _260);
        float _386 = fma(_372, _330, _296);
        float _388 = fma(_376, _330, _298);
        float _390 = fma(_380, _330, _300);
        float _392 = _362 * 2.0;
        _163 = _354;
        _171 = _360;
        _165 = _344;
        _135 = _382;
        _137 = _384;
        _145 = _386;
        _147 = _388;
        _125 = _364;
        _155 = _390;
        _177 = _392;
    }
    float _394 = _163;
    float _396 = _171;
    float _398 = _165;
    float _400 = _135;
    float _402 = _137;
    float _404 = _145;
    float _406 = _147;
    float _408 = _125;
    float _410 = _155;
    float _412 = _177;
    int _414 = _103 + 36;
    uint _416 = uint(int(uint(_414) >> uint(2)));
    uint _418 = uint(int(uint(int(_416)) >> uint(2)));
    int _420 = int(_416) & 3;
    float _422 = (*spvDescriptorSet0.cp_c5)._m0[int(_418)][_420];
    int _424 = _101 & as_type<int>(_422);
    bool _426 = _424 != 0;
    bool _428 = !_426;
    float _430 = _408;
    float _752;
    float _754;
    float _756;
    float _758;
    float _760;
    float _762;
    float _764;
    float _766;
    float _768;
    float _770;
    float _772;
    float _774;
    float _776;
    float _778;
    if (!_428)
    {
        int _432 = _103 + 8;
        uint _434 = uint(int(uint(_432) >> uint(2)));
        uint _436 = uint(int(uint(int(_434)) >> uint(2)));
        int _438 = int(_434) & 3;
        float _440 = (*spvDescriptorSet0.cp_c5)._m0[int(_436)][_438];
        int _442 = int(_434) + 1;
        uint _444 = uint(int(uint(_442) >> uint(2)));
        int _446 = _442 & 3;
        float _448 = (*spvDescriptorSet0.cp_c5)._m0[int(_444)][_446];
        int _450 = _68;
        int _452 = 1;
        int _454 = _56(_450, _452, (*spvDescriptorSet0.support_buffer));
        int _456 = as_type<int>(_440);
        int _458 = 1;
        int _460 = _56(_456, _458, (*spvDescriptorSet0.support_buffer));
        int3 _2214 = int3(_454, _460, 1);
        float3 _462 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2214.xy), uint(_2214.z), 0).xyz;
        float _464 = _462.x;
        float _466 = _462.y;
        float _468 = _462.z;
        int _470 = _68;
        int _472 = 1;
        int _474 = _56(_470, _472, (*spvDescriptorSet0.support_buffer));
        int _476 = as_type<int>(_448);
        int _478 = 1;
        int _480 = _56(_476, _478, (*spvDescriptorSet0.support_buffer));
        int3 _2232 = int3(_474, _480, 1);
        float3 _482 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2232.xy), uint(_2232.z), 0).xyz;
        float _484 = _482.x;
        float _486 = _482.y;
        float _488 = _482.z;
        int _490 = _68;
        int _492 = 1;
        int _494 = _56(_490, _492, (*spvDescriptorSet0.support_buffer));
        int _496 = as_type<int>(_440);
        int _498 = 1;
        int _500 = _56(_496, _498, (*spvDescriptorSet0.support_buffer));
        int3 _2250 = int3(_494, _500, 0);
        float3 _502 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2250.xy), uint(_2250.z), 0).xyz;
        float _504 = _502.x;
        float _506 = _502.y;
        float _508 = _502.z;
        int _510 = _68;
        int _512 = 1;
        int _514 = _56(_510, _512, (*spvDescriptorSet0.support_buffer));
        int _516 = as_type<int>(_448);
        int _518 = 1;
        int _520 = _56(_516, _518, (*spvDescriptorSet0.support_buffer));
        int3 _2268 = int3(_514, _520, 0);
        float3 _522 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2268.xy), uint(_2268.z), 0).xyz;
        float _524 = _522.x;
        float _526 = _522.y;
        float _528 = _522.z;
        int _530 = _68;
        int _532 = 1;
        int _534 = _56(_530, _532, (*spvDescriptorSet0.support_buffer));
        int _536 = as_type<int>(_440);
        int _538 = 1;
        int _540 = _56(_536, _538, (*spvDescriptorSet0.support_buffer));
        int3 _2286 = int3(_534, _540, 2);
        float3 _542 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2286.xy), uint(_2286.z), 0).xyz;
        float _544 = _542.x;
        float _546 = _542.y;
        float _548 = _542.z;
        int _550 = _68;
        int _552 = 1;
        int _554 = _56(_550, _552, (*spvDescriptorSet0.support_buffer));
        int _556 = as_type<int>(_448);
        int _558 = 1;
        int _560 = _56(_556, _558, (*spvDescriptorSet0.support_buffer));
        int3 _2304 = int3(_554, _560, 2);
        float3 _562 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2304.xy), uint(_2304.z), 0).xyz;
        float _564 = _562.x;
        float _566 = _562.y;
        float _568 = _562.z;
        int _570 = _103 + 24;
        uint _572 = uint(int(uint(_570) >> uint(2)));
        uint _574 = uint(int(uint(int(_572)) >> uint(2)));
        int _576 = int(_572) & 3;
        float _578 = (*spvDescriptorSet0.cp_c5)._m0[int(_574)][_576];
        int _580 = int(_572) + 1;
        uint _582 = uint(int(uint(_580) >> uint(2)));
        int _584 = _580 & 3;
        float _586 = (*spvDescriptorSet0.cp_c5)._m0[int(_582)][_584];
        int _588 = _103 + 20;
        uint _590 = uint(int(uint(_588) >> uint(2)));
        uint _592 = uint(int(uint(int(_590)) >> uint(2)));
        int _594 = int(_590) & 3;
        float _596 = (*spvDescriptorSet0.cp_c5)._m0[int(_592)][_594];
        float _598 = -_464;
        float _600 = _598 + _484;
        float _602 = -_468;
        float _604 = _602 + _488;
        float _606 = fma(_600, _578, _464);
        float _608 = fma(_604, _578, _468);
        float _610 = _606 * _586;
        float _612 = fma(_394, _596, _610);
        float _614 = _608 * _586;
        float _616 = _612 * 0.15915493667125701904296875;
        float _618 = -_466;
        float _620 = _618 + _486;
        float _622 = fma(_396, _596, _614);
        float _624 = _616 * 6.283185482025146484375;
        float _626 = cos(_624);
        float _628 = fma(_620, _578, _466);
        float _630 = _622 * 0.15915493667125701904296875;
        float _632 = _628 * _586;
        float _634 = _630 * 6.283185482025146484375;
        float _636 = sin(_634);
        float _638 = fma(_398, _596, _632);
        float _640 = _638 * 0.15915493667125701904296875;
        float _642 = -_506;
        float _644 = _642 + _526;
        float _646 = -_508;
        float _648 = _646 + _528;
        float _650 = _630 * 6.283185482025146484375;
        float _652 = cos(_650);
        float _654 = -_548;
        float _656 = _654 + _568;
        float _658 = fma(_644, _578, _506);
        float _660 = -_544;
        float _662 = _660 + _564;
        float _664 = -_546;
        float _666 = _664 + _566;
        float _668 = fma(_648, _578, _508);
        float _670 = fma(_656, _578, _548);
        float _672 = fma(_662, _578, _544);
        float _674 = _640 * 6.283185482025146484375;
        float _676 = cos(_674);
        float _678 = _636 * _626;
        float _680 = fma(_666, _578, _546);
        float _682 = _658 * _586;
        float _684 = _668 * _586;
        float _686 = _672 * _586;
        float _688 = _680 * _586;
        float _690 = fma(_400, _596, _682);
        float _692 = _616 * 6.283185482025146484375;
        float _694 = sin(_692);
        float _696 = _626 * _652;
        float _698 = fma(_402, _596, _684);
        float _700 = fma(_404, _596, _686);
        float _702 = _640 * 6.283185482025146484375;
        float _704 = sin(_702);
        float _706 = -_504;
        float _708 = _706 + _524;
        float _710 = _626 * _676;
        float _712 = _636 * _676;
        float _714 = _676 * _652;
        float _716 = fma(_708, _578, _504);
        float _718 = _694 * _676;
        float _720 = _694 * _636;
        float _722 = _694 * _652;
        float _724 = _716 * _586;
        float _726 = fma(_406, _596, _688);
        float _728 = fma(_408, _596, _724);
        float _730 = _694 * _704;
        float _732 = fma(_704, _696, _720);
        float _734 = -_704;
        float _736 = _734 + (-0.0);
        float _738 = -_678;
        float _740 = fma(_652, _730, _738);
        float _742 = fma(_636, _730, _696);
        float _744 = _670 * _586;
        float _746 = -_722;
        float _748 = fma(_704, _678, _746);
        float _750 = fma(_410, _596, _744);
        _430 = _728;
        _752 = _714;
        _754 = _712;
        _756 = _736;
        _758 = _690;
        _760 = _718;
        _762 = _740;
        _764 = _742;
        _766 = _698;
        _768 = _732;
        _770 = _748;
        _772 = _710;
        _774 = _750;
        _776 = _726;
        _778 = _700;
        _780 = true;
    }
    else
    {
        float _782 = _394 * 2.0;
        float _784 = _398 * _412;
        float _786 = _396 * _412;
        float _788 = _394 * _412;
        float _790 = _398 * _398;
        float _792 = fma(_782, _396, _784);
        float _794 = -_784;
        float _796 = fma(_782, _396, _794);
        float _798 = _394 * _394;
        float _800 = -_786;
        float _802 = fma(_782, _398, _800);
        float _804 = fma(_782, _398, _786);
        float _806 = _398 * 2.0;
        float _808 = _396 * _396;
        float _810 = fma(_790, -2.0, 1.0);
        float _812 = fma(_798, -2.0, 1.0);
        float _814 = -_788;
        float _816 = fma(_806, _396, _814);
        float _818 = fma(_806, _396, _788);
        float _820 = fma(_808, -2.0, _810);
        float _822 = fma(_808, -2.0, _812);
        float _824 = fma(_790, -2.0, _812);
        _752 = _820;
        _754 = _804;
        _756 = _796;
        _758 = _400;
        _760 = _818;
        _762 = _802;
        _764 = _822;
        _766 = _402;
        _768 = _792;
        _770 = _816;
        _772 = _824;
        _774 = _410;
        _776 = _406;
        _778 = _404;
    }
    _780 = false;
    float _826 = _430;
    float _828 = _752;
    float _830 = _754;
    float _832 = _756;
    float _834 = _758;
    float _836 = _760;
    float _838 = _762;
    float _840 = _764;
    float _842 = _766;
    float _844 = _768;
    float _846 = _770;
    float _848 = _772;
    float _850 = _774;
    float _852 = _776;
    float _854 = _778;
    bool _856 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _858 = _826 * _828;
    float _860 = _826 * _830;
    float _862 = _826 * _832;
    float _864 = _834 * _836;
    float _866 = _834 * _838;
    float _868 = _834 * _840;
    float _870 = _842 * _844;
    float _872 = _842 * _846;
    float _874 = _842 * _848;
    int _876 = _68 * 112;
    bool _878 = !_856;
    float _880 = _858;
    float _882 = _866;
    float _884 = _870;
    float _886 = _854;
    float _888 = _868;
    float _890 = _872;
    float _892 = _852;
    float _894 = _862;
    float _896 = _864;
    float _898 = _850;
    float _1216;
    float _1218;
    if (!_878)
    {
        int _900 = 0;
        float _902 = _858;
        float _904 = _866;
        float _906 = _870;
        float _908 = _854;
        float _910 = _860;
        float _912 = _868;
        float _914 = _872;
        float _916 = _852;
        float _918 = _862;
        float _920 = _864;
        float _922 = _874;
        float _924 = _850;
        bool _926;
        int _974;
        int _984;
        int _994;
        int _1004;
        int _1014;
        int _1024;
        int _1034;
        int _1044;
        int _1054;
        int _1064;
        int _1074;
        int _1084;
        float _1192;
        float _1194;
        float _1196;
        int _1198;
        float _1200;
        int _1202;
        int _1204;
        int _1206;
        int _1208;
        float _1210;
        float _1212;
        float _1214;
        do
        {
            int _928 = _900;
            float _930 = _902;
            float _932 = _904;
            float _934 = _906;
            int _936 = as_type<int>(_908);
            float _938 = _910;
            int _940 = as_type<int>(_912);
            int _942 = as_type<int>(_914);
            int _944 = as_type<int>(_916);
            int _946 = as_type<int>(_918);
            float _948 = _920;
            float _950 = _922;
            float _952 = _924;
            uint _954 = uint(int(uint(_876) >> uint(2)));
            uint _956 = uint(int(uint(int(_954)) >> uint(2)));
            int _958 = int(_954) & 3;
            float _960 = (*spvDescriptorSet0.cp_c6)._m0[int(_956)][_958];
            bool _962 = _68 != 0;
            int _964 = _928 + 1;
            bool _966 = uint(_964) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _968 = as_type<int>(_930);
            int _970 = as_type<int>(_960);
            int _972 = 31;
            int _2815 = _58(_968, _970, _972, _974, gl_SubgroupInvocationID);
            int _976 = _2815;
            int _978 = as_type<int>(_932);
            int _980 = as_type<int>(_960);
            int _982 = 31;
            int _2820 = _58(_978, _980, _982, _984, gl_SubgroupInvocationID);
            int _986 = _2820;
            int _988 = as_type<int>(_934);
            int _990 = as_type<int>(_960);
            int _992 = 31;
            int _2825 = _58(_988, _990, _992, _994, gl_SubgroupInvocationID);
            int _996 = _2825;
            int _998 = _936;
            int _1000 = as_type<int>(_960);
            int _1002 = 31;
            int _2829 = _58(_998, _1000, _1002, _1004, gl_SubgroupInvocationID);
            int _1006 = _2829;
            int _1008 = as_type<int>(_938);
            int _1010 = as_type<int>(_960);
            int _1012 = 31;
            int _2834 = _58(_1008, _1010, _1012, _1014, gl_SubgroupInvocationID);
            int _1016 = _2834;
            int _1018 = _940;
            int _1020 = as_type<int>(_960);
            int _1022 = 31;
            int _2838 = _58(_1018, _1020, _1022, _1024, gl_SubgroupInvocationID);
            int _1026 = _2838;
            int _1028 = _942;
            int _1030 = as_type<int>(_960);
            int _1032 = 31;
            int _2842 = _58(_1028, _1030, _1032, _1034, gl_SubgroupInvocationID);
            int _1036 = _2842;
            int _1038 = _944;
            int _1040 = as_type<int>(_960);
            int _1042 = 31;
            int _2846 = _58(_1038, _1040, _1042, _1044, gl_SubgroupInvocationID);
            int _1046 = _2846;
            int _1048 = _946;
            int _1050 = as_type<int>(_960);
            int _1052 = 31;
            int _2850 = _58(_1048, _1050, _1052, _1054, gl_SubgroupInvocationID);
            int _1056 = _2850;
            int _1058 = as_type<int>(_948);
            int _1060 = as_type<int>(_960);
            int _1062 = 31;
            int _2855 = _58(_1058, _1060, _1062, _1064, gl_SubgroupInvocationID);
            int _1066 = _2855;
            int _1068 = as_type<int>(_950);
            int _1070 = as_type<int>(_960);
            int _1072 = 31;
            int _2860 = _58(_1068, _1070, _1072, _1074, gl_SubgroupInvocationID);
            int _1076 = _2860;
            int _1078 = as_type<int>(_952);
            int _1080 = as_type<int>(_960);
            int _1082 = 31;
            int _2865 = _58(_1078, _1080, _1082, _1084, gl_SubgroupInvocationID);
            int _1086 = _2865;
            bool _1088 = !_962;
            _900 = _964;
            float _1090 = _930;
            float _1092 = _932;
            float _1094 = _934;
            int _1096 = _936;
            float _1098 = _938;
            int _1100 = _940;
            int _1102 = _942;
            int _1104 = _944;
            int _1106 = _946;
            float _1108 = _948;
            float _1110 = _950;
            float _1112 = _952;
            if (!_1088)
            {
                float _1114 = as_type<float>(_986) * _852;
                float _1116 = _860 * as_type<float>(_986);
                float _1118 = _868 * as_type<float>(_986);
                float _1120 = _872 * as_type<float>(_986);
                float _1122 = fma(as_type<float>(_976), _854, _1114);
                float _1124 = _860 * as_type<float>(_1026);
                float _1126 = _868 * as_type<float>(_1026);
                float _1128 = _872 * as_type<float>(_1026);
                float _1130 = as_type<float>(_1026) * _852;
                float _1132 = fma(_858, as_type<float>(_976), _1116);
                float _1134 = fma(_866, as_type<float>(_976), _1118);
                float _1136 = fma(_870, as_type<float>(_976), _1120);
                float _1138 = fma(_858, as_type<float>(_1016), _1124);
                float _1140 = fma(_866, as_type<float>(_1016), _1126);
                float _1142 = fma(_870, as_type<float>(_1016), _1128);
                float _1144 = _860 * as_type<float>(_1066);
                float _1146 = as_type<float>(_1066) * _852;
                float _1148 = fma(as_type<float>(_1016), _854, _1130);
                float _1150 = _868 * as_type<float>(_1066);
                float _1152 = _872 * as_type<float>(_1066);
                float _1154 = fma(_858, as_type<float>(_1056), _1144);
                float _1156 = fma(as_type<float>(_1056), _854, _1146);
                float _1158 = fma(_874, as_type<float>(_996), _1136);
                float _1160 = fma(_866, as_type<float>(_1056), _1150);
                float _1162 = fma(_864, as_type<float>(_1036), _1140);
                float _1164 = fma(_870, as_type<float>(_1056), _1152);
                float _1166 = fma(as_type<float>(_996), _850, _1122);
                float _1168 = fma(_862, as_type<float>(_1036), _1138);
                float _1170 = fma(_874, as_type<float>(_1036), _1142);
                float _1172 = fma(as_type<float>(_1036), _850, _1148);
                float _1174 = fma(as_type<float>(_1076), _850, _1156);
                float _1176 = fma(_864, as_type<float>(_996), _1134);
                float _1178 = fma(_862, as_type<float>(_996), _1132);
                float _1180 = fma(_864, as_type<float>(_1076), _1160);
                float _1182 = as_type<float>(_1006) + _1166;
                float _1184 = fma(_862, as_type<float>(_1076), _1154);
                float _1186 = fma(_874, as_type<float>(_1076), _1164);
                float _1188 = as_type<float>(_1046) + _1172;
                float _1190 = as_type<float>(_1086) + _1174;
                _1090 = _1178;
                _1092 = _1176;
                _1094 = _1158;
                _1096 = as_type<int>(_1182);
                _1098 = _1168;
                _1100 = as_type<int>(_1162);
                _1102 = as_type<int>(_1170);
                _1104 = as_type<int>(_1188);
                _1106 = as_type<int>(_1184);
                _1108 = _1180;
                _1110 = _1186;
                _1112 = _1190;
            }
            _1192 = _1090;
            _1194 = _1092;
            _1196 = _1094;
            _1198 = _1096;
            _1200 = _1098;
            _1202 = _1100;
            _1204 = _1102;
            _1206 = _1104;
            _1208 = _1106;
            _1210 = _1108;
            _1212 = _1110;
            _1214 = _1112;
            _926 = !_966;
            _902 = _1192;
            _904 = _1194;
            _906 = _1196;
            _908 = as_type<float>(_1198);
            _910 = _1200;
            _912 = as_type<float>(_1202);
            _914 = as_type<float>(_1204);
            _916 = as_type<float>(_1206);
            _918 = as_type<float>(_1208);
            _920 = _1210;
            _922 = _1212;
            _924 = _1214;
        } while (_926);
        _880 = _1192;
        _882 = _1194;
        _884 = _1196;
        _886 = as_type<float>(_1198);
        _1216 = _1200;
        _888 = as_type<float>(_1202);
        _890 = as_type<float>(_1204);
        _892 = as_type<float>(_1206);
        _894 = as_type<float>(_1208);
        _896 = _1210;
        _1218 = _1212;
        _898 = _1214;
        _1220 = true;
    }
    else
    {
        _1216 = _860;
        _1218 = _874;
    }
    _1220 = false;
    float _1222 = _880;
    float _1224 = _882;
    float _1226 = _884;
    float _1228 = _886;
    float _1230 = _1216;
    float _1232 = _888;
    float _1234 = _890;
    float _1236 = _892;
    float _1238 = _894;
    float _1240 = _896;
    float _1242 = _1218;
    float _1244 = _898;
    int _1246 = _876 + 80;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    uint _1250 = uint(int(uint(int(_1248)) >> uint(2)));
    int _1252 = int(_1248) & 3;
    float _1254 = (*spvDescriptorSet0.cp_c6)._m0[int(_1250)][_1252];
    int _1256 = int(_1248) + 1;
    uint _1258 = uint(int(uint(_1256) >> uint(2)));
    int _1260 = _1256 & 3;
    float _1262 = (*spvDescriptorSet0.cp_c6)._m0[int(_1258)][_1260];
    bool _1264 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1266 = _876 + 64;
    uint _1268 = uint(int(uint(_1266) >> uint(2)));
    uint _1270 = uint(int(uint(int(_1268)) >> uint(2)));
    int _1272 = int(_1268) & 3;
    float _1274 = (*spvDescriptorSet0.cp_c6)._m0[int(_1270)][_1272];
    int _1276 = int(_1268) + 1;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    int _1280 = _1276 & 3;
    float _1282 = (*spvDescriptorSet0.cp_c6)._m0[int(_1278)][_1280];
    int _1284 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1286 = _1284 + _68;
    int _1288 = _876 + 88;
    uint _1290 = uint(int(uint(_1288) >> uint(2)));
    uint _1292 = uint(int(uint(int(_1290)) >> uint(2)));
    int _1294 = int(_1290) & 3;
    float _1296 = (*spvDescriptorSet0.cp_c6)._m0[int(_1292)][_1294];
    int _1298 = int(_1290) + 1;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    int _1302 = _1298 & 3;
    float _1304 = (*spvDescriptorSet0.cp_c6)._m0[int(_1300)][_1302];
    int _1306 = _876 + 72;
    uint _1308 = uint(int(uint(_1306) >> uint(2)));
    uint _1310 = uint(int(uint(int(_1308)) >> uint(2)));
    int _1312 = int(_1308) & 3;
    float _1314 = (*spvDescriptorSet0.cp_c6)._m0[int(_1310)][_1312];
    int _1316 = int(_1308) + 1;
    uint _1318 = uint(int(uint(_1316) >> uint(2)));
    int _1320 = _1316 & 3;
    float _1322 = (*spvDescriptorSet0.cp_c6)._m0[int(_1318)][_1320];
    int _1324 = _876 + 96;
    uint _1326 = uint(int(uint(_1324) >> uint(2)));
    uint _1328 = uint(int(uint(int(_1326)) >> uint(2)));
    int _1330 = int(_1326) & 3;
    float _1332 = (*spvDescriptorSet0.cp_c6)._m0[int(_1328)][_1330];
    int _1334 = int(_1326) + 1;
    uint _1336 = uint(int(uint(_1334) >> uint(2)));
    int _1338 = _1334 & 3;
    float _1340 = (*spvDescriptorSet0.cp_c6)._m0[int(_1336)][_1338];
    int _1342 = _876 + 104;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    uint _1346 = uint(int(uint(int(_1344)) >> uint(2)));
    int _1348 = int(_1344) & 3;
    float _1350 = (*spvDescriptorSet0.cp_c6)._m0[int(_1346)][_1348];
    int _1352 = int(_1344) + 1;
    uint _1354 = uint(int(uint(_1352) >> uint(2)));
    int _1356 = _1352 & 3;
    float _1358 = (*spvDescriptorSet0.cp_c6)._m0[int(_1354)][_1356];
    int _1360 = _876 + 16;
    uint _1362 = uint(int(uint(_1360) >> uint(2)));
    uint _1364 = uint(int(uint(int(_1362)) >> uint(2)));
    int _1366 = int(_1362) & 3;
    float _1368 = (*spvDescriptorSet0.cp_c6)._m0[int(_1364)][_1366];
    int _1370 = int(_1362) + 1;
    uint _1372 = uint(int(uint(_1370) >> uint(2)));
    int _1374 = _1370 & 3;
    float _1376 = (*spvDescriptorSet0.cp_c6)._m0[int(_1372)][_1374];
    if (!_1264)
    {
        int _1378 = _68 * 48;
        int _1380 = _1378 + 16;
        uint _1382 = uint(int(uint(_1378) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1382)] = as_type<uint>(_1222);
        int _1384 = _1378 + 4;
        uint _1386 = uint(int(uint(_1384) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1386)] = as_type<uint>(_1224);
        int _1388 = _1378 + 8;
        uint _1390 = uint(int(uint(_1388) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1390)] = as_type<uint>(_1226);
        int _1392 = _1378 + 12;
        uint _1394 = uint(int(uint(_1392) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1394)] = as_type<uint>(_1228);
        int _1396 = _1378 + 32;
        uint _1398 = uint(int(uint(_1380) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1398)] = as_type<uint>(_1230);
        int _1400 = _1380 + 4;
        uint _1402 = uint(int(uint(_1400) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1402)] = as_type<uint>(_1232);
        int _1404 = _1380 + 8;
        uint _1406 = uint(int(uint(_1404) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1406)] = as_type<uint>(_1234);
        int _1408 = _1380 + 12;
        uint _1410 = uint(int(uint(_1408) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1410)] = as_type<uint>(_1236);
        uint _1412 = uint(int(uint(_1396) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1412)] = as_type<uint>(_1238);
        int _1414 = _1396 + 4;
        uint _1416 = uint(int(uint(_1414) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1416)] = as_type<uint>(_1240);
        int _1418 = _1396 + 8;
        uint _1420 = uint(int(uint(_1418) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1420)] = as_type<uint>(_1242);
        int _1422 = _1396 + 12;
        uint _1424 = uint(int(uint(_1422) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1424)] = as_type<uint>(_1244);
    }
    float _1426 = _1240 * _1254;
    float _1428 = _1224 * _1254;
    float _1430 = _1232 * _1254;
    int _1432 = _876 + 32;
    uint _1434 = uint(int(uint(_1432) >> uint(2)));
    uint _1436 = uint(int(uint(int(_1434)) >> uint(2)));
    int _1438 = int(_1434) & 3;
    float _1440 = (*spvDescriptorSet0.cp_c6)._m0[int(_1436)][_1438];
    int _1442 = int(_1434) + 1;
    uint _1444 = uint(int(uint(_1442) >> uint(2)));
    int _1446 = _1442 & 3;
    float _1448 = (*spvDescriptorSet0.cp_c6)._m0[int(_1444)][_1446];
    float _1450 = fma(_1238, _1274, _1426);
    float _1452 = _1224 * _1262;
    float _1454 = fma(_1222, _1274, _1428);
    float _1456 = fma(_1230, _1274, _1430);
    float _1458 = _1232 * _1262;
    float _1460 = fma(_1222, _1282, _1452);
    float _1462 = _1224 * _1296;
    float _1464 = _1224 * _1304;
    float _1466 = _1240 * _1262;
    int _1468 = _876 + 48;
    uint _1470 = uint(int(uint(_1468) >> uint(2)));
    uint _1472 = uint(int(uint(int(_1470)) >> uint(2)));
    int _1474 = int(_1470) & 3;
    float _1476 = (*spvDescriptorSet0.cp_c6)._m0[int(_1472)][_1474];
    int _1478 = int(_1470) + 1;
    uint _1480 = uint(int(uint(_1478) >> uint(2)));
    int _1482 = _1478 & 3;
    float _1484 = (*spvDescriptorSet0.cp_c6)._m0[int(_1480)][_1482];
    float _1486 = _1232 * _1296;
    float _1488 = _1232 * _1304;
    float _1490 = fma(_1230, _1282, _1458);
    float _1492 = fma(_1238, _1282, _1466);
    float _1494 = _1240 * _1296;
    float _1496 = _1240 * _1304;
    float _1498 = fma(_1222, _1314, _1462);
    float _1500 = fma(_1222, _1322, _1464);
    float _1502 = fma(_1230, _1314, _1486);
    int _1504 = _876 + 24;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
    int _1510 = int(_1506) & 3;
    float _1512 = (*spvDescriptorSet0.cp_c6)._m0[int(_1508)][_1510];
    int _1514 = int(_1506) + 1;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    int _1518 = _1514 & 3;
    float _1520 = (*spvDescriptorSet0.cp_c6)._m0[int(_1516)][_1518];
    float _1522 = fma(_1230, _1322, _1488);
    float _1524 = fma(_1238, _1322, _1496);
    float _1526 = fma(_1238, _1314, _1494);
    float _1528 = fma(_1226, _1332, _1454);
    float _1530 = fma(_1234, _1358, _1522);
    float _1532 = fma(_1234, _1332, _1456);
    float _1534 = fma(_1242, _1332, _1450);
    int _1536 = _876 + 40;
    uint _1538 = uint(int(uint(_1536) >> uint(2)));
    uint _1540 = uint(int(uint(int(_1538)) >> uint(2)));
    int _1542 = int(_1538) & 3;
    float _1544 = (*spvDescriptorSet0.cp_c6)._m0[int(_1540)][_1542];
    int _1546 = int(_1538) + 1;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    int _1550 = _1546 & 3;
    float _1552 = (*spvDescriptorSet0.cp_c6)._m0[int(_1548)][_1550];
    float _1554 = fma(_1226, _1340, _1460);
    float _1556 = fma(_1226, _1350, _1498);
    float _1558 = fma(_1226, _1358, _1500);
    float _1560 = fma(_1234, _1340, _1490);
    float _1562 = fma(_1234, _1350, _1502);
    float _1564 = fma(_1242, _1358, _1524);
    float _1566 = _1530 + _1236;
    int _1568 = _876 + 56;
    uint _1570 = uint(int(uint(_1568) >> uint(2)));
    uint _1572 = uint(int(uint(int(_1570)) >> uint(2)));
    int _1574 = int(_1570) & 3;
    float _1576 = (*spvDescriptorSet0.cp_c6)._m0[int(_1572)][_1574];
    int _1578 = int(_1570) + 1;
    uint _1580 = uint(int(uint(_1578) >> uint(2)));
    int _1582 = _1578 & 3;
    float _1584 = (*spvDescriptorSet0.cp_c6)._m0[int(_1580)][_1582];
    float _1586 = fma(_1242, _1340, _1492);
    float _1588 = fma(_1242, _1350, _1526);
    float _1590 = _1564 + _1244;
    float _1592 = _1558 + _1228;
    float _1594 = _1532 * _1376;
    float _1596 = _1560 * _1376;
    float _1598 = _1562 * _1376;
    float _1600 = _1566 * _1376;
    float _1602 = fma(_1528, _1368, _1594);
    float _1604 = fma(_1554, _1368, _1596);
    float _1606 = fma(_1556, _1368, _1598);
    float _1608 = fma(_1592, _1368, _1600);
    float _1610 = _1566 * _1448;
    float _1612 = _1532 * _1448;
    float _1614 = _1560 * _1448;
    float _1616 = _1562 * _1448;
    float _1618 = fma(_1592, _1440, _1610);
    float _1620 = fma(_1528, _1440, _1612);
    float _1622 = fma(_1554, _1440, _1614);
    float _1624 = fma(_1556, _1440, _1616);
    int _1626 = _1286 * 48;
    float _1628 = _1566 * _1484;
    float _1630 = _1532 * _1484;
    float _1632 = _1560 * _1484;
    float _1634 = _1562 * _1484;
    float _1636 = fma(_1592, _1476, _1628);
    float _1638 = fma(_1528, _1476, _1630);
    float _1640 = fma(_1554, _1476, _1632);
    float _1642 = fma(_1556, _1476, _1634);
    float _1644 = fma(_1590, _1512, _1608);
    float _1646 = fma(_1586, _1512, _1604);
    float _1648 = fma(_1534, _1512, _1602);
    float _1650 = fma(_1588, _1512, _1606);
    float _1652 = _1644 + _1520;
    float _1654 = fma(_1590, _1544, _1618);
    float _1656 = fma(_1534, _1544, _1620);
    float _1658 = fma(_1586, _1544, _1622);
    float _1660 = fma(_1588, _1544, _1624);
    float _1662 = _1654 + _1552;
    int _1664 = _1626 + 16;
    int _1666 = _1626 + 32;
    float _1668 = fma(_1590, _1576, _1636);
    float _1670 = fma(_1534, _1576, _1638);
    float _1672 = fma(_1586, _1576, _1640);
    float _1674 = fma(_1588, _1576, _1642);
    float _1676 = _1668 + _1584;
    int _1678 = _1626 + 48;
    uint _1680 = uint(int(uint(_1664) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1680)] = as_type<uint>(_1648);
    int _1682 = _1664 + 4;
    uint _1684 = uint(int(uint(_1682) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1684)] = as_type<uint>(_1646);
    int _1686 = _1664 + 8;
    uint _1688 = uint(int(uint(_1686) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1688)] = as_type<uint>(_1650);
    int _1690 = _1664 + 12;
    uint _1692 = uint(int(uint(_1690) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1692)] = as_type<uint>(_1652);
    uint _1694 = uint(int(uint(_1666) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1694)] = as_type<uint>(_1656);
    int _1696 = _1666 + 4;
    uint _1698 = uint(int(uint(_1696) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1698)] = as_type<uint>(_1658);
    int _1700 = _1666 + 8;
    uint _1702 = uint(int(uint(_1700) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1702)] = as_type<uint>(_1660);
    int _1704 = _1666 + 12;
    uint _1706 = uint(int(uint(_1704) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1706)] = as_type<uint>(_1662);
    uint _1708 = uint(int(uint(_1678) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1708)] = as_type<uint>(_1670);
    int _1710 = _1678 + 4;
    uint _1712 = uint(int(uint(_1710) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1712)] = as_type<uint>(_1672);
    int _1714 = _1678 + 8;
    uint _1716 = uint(int(uint(_1714) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1716)] = as_type<uint>(_1674);
    int _1718 = _1678 + 12;
    uint _1720 = uint(int(uint(_1718) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1720)] = as_type<uint>(_1676);
}

