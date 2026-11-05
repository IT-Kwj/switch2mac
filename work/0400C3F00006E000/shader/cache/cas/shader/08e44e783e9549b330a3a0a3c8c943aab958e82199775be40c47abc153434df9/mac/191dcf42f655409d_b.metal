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
    texture2d_array<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _54(thread const int& _3903, thread const int& _3904, constant _10& support_buffer)
{
    int _3907 = 1 + _3904;
    float _3909 = support_buffer._m5[_3907].x;
    bool _3911 = _3909 == 1.0;
    if (_3911)
    {
        return _3903;
    }
    float _3913 = float(_3903);
    float _3915 = _3913 * _3909;
    int _3917 = int(_3915);
    return _3917;
}

static inline __attribute__((always_inline))
int _56(thread const int& _3938, thread const int& _3939, thread const int& _3940, thread int& _3941, thread uint& gl_SubgroupInvocationID)
{
    int _3944 = _3940 & 31;
    uint _3946 = uint(int(uint(_3940) >> uint(8)));
    int _3948 = int(_3946) & 31;
    float _3950 = as_type<float>(gl_SubgroupInvocationID);
    int _3952 = as_type<int>(_3950) & _3948;
    int _3954 = ~_3948;
    int _3956 = _3944 & _3954;
    int _3958 = _3956 | _3952;
    int _3960 = ~_3948;
    int _3962 = _3939 & _3960;
    int _3964 = _3962 | _3952;
    bool _3966 = uint(_3964) <= uint(_3958);
    _3941 = _3966 ? (-1) : 0;
    float _3968 = spvSubgroupShuffle(as_type<float>(_3938), uint(_3964));
    uint _3970 = uint(_3966 ? as_type<int>(_3968) : _3938);
    return int(_3970);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1218 = false;
    bool _778 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    float _72 = _62;
    if (_70)
    {
        return;
    }
    int _74 = _66 & 31;
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
    int _99 = _78 ? _91 : _97;
    int _101 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _103 = _101 + 32;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = _99 & as_type<int>(_111);
    bool _115 = _113 != 0;
    if (!_115)
    {
        _72 = 0.0;
    }
    float _117 = _72;
    float _119 = 0.0;
    float _121 = 0.0;
    float _123 = _117;
    if (!_115)
    {
        _119 = 0.0;
        _121 = 0.0;
    }
    float _125 = _119;
    float _127 = _121;
    float _129 = 0.0;
    float _131 = 0.0;
    float _133 = _125;
    float _135 = _127;
    if (!_115)
    {
        _129 = 0.0;
        _131 = 0.0;
    }
    float _137 = _129;
    float _139 = _131;
    float _141 = 0.0;
    float _143 = _137;
    float _145 = _139;
    if (!_115)
    {
        _141 = 0.0;
    }
    float _147 = _141;
    float _149 = 0.0;
    float _151 = 0.0;
    float _153 = _147;
    if (!_115)
    {
        _149 = 0.0;
        _151 = 0.0;
    }
    float _155 = _149;
    float _157 = _151;
    float _159 = 0.0;
    float _161 = _155;
    float _163 = _157;
    if (!_115)
    {
        _159 = 0.0;
    }
    float _165 = _159;
    float _167 = 0.0;
    float _169 = _165;
    if (!_115)
    {
        _167 = 0.0;
    }
    float _171 = _167;
    bool _173 = !_115;
    float _175 = _171;
    if (!_173)
    {
        uint _177 = uint(int(uint(_101) >> uint(2)));
        uint _179 = uint(int(uint(int(_177)) >> uint(2)));
        int _181 = int(_177) & 3;
        float _183 = (*spvDescriptorSet0.cp_c5)._m0[int(_179)][_181];
        int _185 = int(_177) + 1;
        uint _187 = uint(int(uint(_185) >> uint(2)));
        int _189 = _185 & 3;
        float _191 = (*spvDescriptorSet0.cp_c5)._m0[int(_187)][_189];
        int _193 = _66;
        int _195 = 0;
        int _197 = _54(_193, _195, (*spvDescriptorSet0.support_buffer));
        int _199 = as_type<int>(_183);
        int _201 = 0;
        int _203 = _54(_199, _201, (*spvDescriptorSet0.support_buffer));
        int3 _1856 = int3(_197, _203, 1);
        float4 _206 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1856.xy), uint(_1856.z), 0).xyzw;
        float _208 = _206.x;
        float _210 = _206.y;
        float _212 = _206.z;
        float _214 = _206.w;
        int _216 = _66;
        int _218 = 0;
        int _220 = _54(_216, _218, (*spvDescriptorSet0.support_buffer));
        int _222 = as_type<int>(_191);
        int _224 = 0;
        int _226 = _54(_222, _224, (*spvDescriptorSet0.support_buffer));
        int3 _1876 = int3(_220, _226, 1);
        float4 _228 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1876.xy), uint(_1876.z), 0).xyzw;
        float _230 = _228.x;
        float _232 = _228.y;
        float _234 = _228.z;
        float _236 = _228.w;
        int _238 = _66;
        int _240 = 0;
        int _242 = _54(_238, _240, (*spvDescriptorSet0.support_buffer));
        int _244 = as_type<int>(_183);
        int _246 = 0;
        int _248 = _54(_244, _246, (*spvDescriptorSet0.support_buffer));
        int3 _1896 = int3(_242, _248, 0);
        float3 _252 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1896.xy), uint(_1896.z), 0).xyz;
        float _254 = _252.x;
        float _256 = _252.y;
        float _258 = _252.z;
        int _260 = _66;
        int _262 = 0;
        int _264 = _54(_260, _262, (*spvDescriptorSet0.support_buffer));
        int _266 = as_type<int>(_191);
        int _268 = 0;
        int _270 = _54(_266, _268, (*spvDescriptorSet0.support_buffer));
        int3 _1914 = int3(_264, _270, 0);
        float3 _272 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1914.xy), uint(_1914.z), 0).xyz;
        float _274 = _272.x;
        float _276 = _272.y;
        float _278 = _272.z;
        int _280 = _66;
        int _282 = 0;
        int _284 = _54(_280, _282, (*spvDescriptorSet0.support_buffer));
        int _286 = as_type<int>(_183);
        int _288 = 0;
        int _290 = _54(_286, _288, (*spvDescriptorSet0.support_buffer));
        int3 _1932 = int3(_284, _290, 2);
        float3 _292 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1932.xy), uint(_1932.z), 0).xyz;
        float _294 = _292.x;
        float _296 = _292.y;
        float _298 = _292.z;
        int _300 = _66;
        int _302 = 0;
        int _304 = _54(_300, _302, (*spvDescriptorSet0.support_buffer));
        int _306 = as_type<int>(_191);
        int _308 = 0;
        int _310 = _54(_306, _308, (*spvDescriptorSet0.support_buffer));
        int3 _1950 = int3(_304, _310, 2);
        float3 _312 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1950.xy), uint(_1950.z), 0).xyz;
        float _314 = _312.x;
        float _316 = _312.y;
        float _318 = _312.z;
        int _320 = _101 + 16;
        uint _322 = uint(int(uint(_320) >> uint(2)));
        uint _324 = uint(int(uint(int(_322)) >> uint(2)));
        int _326 = int(_322) & 3;
        float _328 = (*spvDescriptorSet0.cp_c5)._m0[int(_324)][_326];
        float _330 = -_210;
        float _332 = _330 + _232;
        float _334 = -_214;
        float _336 = _334 + _236;
        float _338 = -_208;
        float _340 = _338 + _230;
        float _342 = fma(_332, _328, _210);
        float _344 = -_212;
        float _346 = _344 + _234;
        float _348 = -_254;
        float _350 = _348 + _274;
        float _352 = fma(_340, _328, _208);
        float _354 = -_256;
        float _356 = _354 + _276;
        float _358 = fma(_346, _328, _212);
        float _360 = fma(_336, _328, _214);
        float _362 = fma(_350, _328, _254);
        float _364 = -_258;
        float _366 = _364 + _278;
        float _368 = -_294;
        float _370 = _368 + _314;
        float _372 = -_296;
        float _374 = _372 + _316;
        float _376 = -_298;
        float _378 = _376 + _318;
        float _380 = fma(_356, _328, _256);
        float _382 = fma(_366, _328, _258);
        float _384 = fma(_370, _328, _294);
        float _386 = fma(_374, _328, _296);
        float _388 = fma(_378, _328, _298);
        float _390 = _360 * 2.0;
        _161 = _352;
        _169 = _358;
        _163 = _342;
        _133 = _382;
        _123 = _362;
        _135 = _380;
        _143 = _384;
        _145 = _386;
        _153 = _388;
        _175 = _390;
    }
    float _392 = _161;
    float _394 = _169;
    float _396 = _163;
    float _398 = _133;
    float _400 = _123;
    float _402 = _135;
    float _404 = _143;
    float _406 = _145;
    float _408 = _153;
    float _410 = _175;
    int _412 = _101 + 36;
    uint _414 = uint(int(uint(_412) >> uint(2)));
    uint _416 = uint(int(uint(int(_414)) >> uint(2)));
    int _418 = int(_414) & 3;
    float _420 = (*spvDescriptorSet0.cp_c5)._m0[int(_416)][_418];
    int _422 = _99 & as_type<int>(_420);
    bool _424 = _422 != 0;
    bool _426 = !_424;
    float _428 = _402;
    float _430 = _400;
    float _432 = _398;
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
    if (!_426)
    {
        int _434 = _101 + 8;
        uint _436 = uint(int(uint(_434) >> uint(2)));
        uint _438 = uint(int(uint(int(_436)) >> uint(2)));
        int _440 = int(_436) & 3;
        float _442 = (*spvDescriptorSet0.cp_c5)._m0[int(_438)][_440];
        int _444 = int(_436) + 1;
        uint _446 = uint(int(uint(_444) >> uint(2)));
        int _448 = _444 & 3;
        float _450 = (*spvDescriptorSet0.cp_c5)._m0[int(_446)][_448];
        int _452 = _66;
        int _454 = 1;
        int _456 = _54(_452, _454, (*spvDescriptorSet0.support_buffer));
        int _458 = as_type<int>(_442);
        int _460 = 1;
        int _462 = _54(_458, _460, (*spvDescriptorSet0.support_buffer));
        int3 _2164 = int3(_456, _462, 1);
        float3 _464 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2164.xy), uint(_2164.z), 0).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        int _472 = _66;
        int _474 = 1;
        int _476 = _54(_472, _474, (*spvDescriptorSet0.support_buffer));
        int _478 = as_type<int>(_450);
        int _480 = 1;
        int _482 = _54(_478, _480, (*spvDescriptorSet0.support_buffer));
        int3 _2182 = int3(_476, _482, 1);
        float3 _484 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2182.xy), uint(_2182.z), 0).xyz;
        float _486 = _484.x;
        float _488 = _484.y;
        float _490 = _484.z;
        int _492 = _66;
        int _494 = 1;
        int _496 = _54(_492, _494, (*spvDescriptorSet0.support_buffer));
        int _498 = as_type<int>(_442);
        int _500 = 1;
        int _502 = _54(_498, _500, (*spvDescriptorSet0.support_buffer));
        int3 _2200 = int3(_496, _502, 0);
        float3 _504 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2200.xy), uint(_2200.z), 0).xyz;
        float _506 = _504.x;
        float _508 = _504.y;
        float _510 = _504.z;
        int _512 = _66;
        int _514 = 1;
        int _516 = _54(_512, _514, (*spvDescriptorSet0.support_buffer));
        int _518 = as_type<int>(_450);
        int _520 = 1;
        int _522 = _54(_518, _520, (*spvDescriptorSet0.support_buffer));
        int3 _2218 = int3(_516, _522, 0);
        float3 _524 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2218.xy), uint(_2218.z), 0).xyz;
        float _526 = _524.x;
        float _528 = _524.y;
        float _530 = _524.z;
        int _532 = _66;
        int _534 = 1;
        int _536 = _54(_532, _534, (*spvDescriptorSet0.support_buffer));
        int _538 = as_type<int>(_442);
        int _540 = 1;
        int _542 = _54(_538, _540, (*spvDescriptorSet0.support_buffer));
        int3 _2236 = int3(_536, _542, 2);
        float3 _544 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2236.xy), uint(_2236.z), 0).xyz;
        float _546 = _544.x;
        float _548 = _544.y;
        float _550 = _544.z;
        int _552 = _66;
        int _554 = 1;
        int _556 = _54(_552, _554, (*spvDescriptorSet0.support_buffer));
        int _558 = as_type<int>(_450);
        int _560 = 1;
        int _562 = _54(_558, _560, (*spvDescriptorSet0.support_buffer));
        int3 _2254 = int3(_556, _562, 2);
        float3 _564 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2254.xy), uint(_2254.z), 0).xyz;
        float _566 = _564.x;
        float _568 = _564.y;
        float _570 = _564.z;
        int _572 = _101 + 24;
        uint _574 = uint(int(uint(_572) >> uint(2)));
        uint _576 = uint(int(uint(int(_574)) >> uint(2)));
        int _578 = int(_574) & 3;
        float _580 = (*spvDescriptorSet0.cp_c5)._m0[int(_576)][_578];
        int _582 = int(_574) + 1;
        uint _584 = uint(int(uint(_582) >> uint(2)));
        int _586 = _582 & 3;
        float _588 = (*spvDescriptorSet0.cp_c5)._m0[int(_584)][_586];
        int _590 = _101 + 20;
        uint _592 = uint(int(uint(_590) >> uint(2)));
        uint _594 = uint(int(uint(int(_592)) >> uint(2)));
        int _596 = int(_592) & 3;
        float _598 = (*spvDescriptorSet0.cp_c5)._m0[int(_594)][_596];
        float _600 = -_466;
        float _602 = _600 + _486;
        float _604 = -_470;
        float _606 = _604 + _490;
        float _608 = fma(_602, _580, _466);
        float _610 = fma(_606, _580, _470);
        float _612 = _608 * _588;
        float _614 = fma(_392, _598, _612);
        float _616 = _610 * _588;
        float _618 = _614 * 0.15915493667125701904296875;
        float _620 = -_468;
        float _622 = _620 + _488;
        float _624 = fma(_394, _598, _616);
        float _626 = _618 * 6.283185482025146484375;
        float _628 = cos(_626);
        float _630 = fma(_622, _580, _468);
        float _632 = _624 * 0.15915493667125701904296875;
        float _634 = _630 * _588;
        float _636 = _632 * 6.283185482025146484375;
        float _638 = sin(_636);
        float _640 = fma(_396, _598, _634);
        float _642 = _640 * 0.15915493667125701904296875;
        float _644 = -_550;
        float _646 = _644 + _570;
        float _648 = -_510;
        float _650 = _648 + _530;
        float _652 = _632 * 6.283185482025146484375;
        float _654 = cos(_652);
        float _656 = fma(_646, _580, _550);
        float _658 = fma(_650, _580, _510);
        float _660 = _658 * _588;
        float _662 = _642 * 6.283185482025146484375;
        float _664 = cos(_662);
        float _666 = _638 * _628;
        float _668 = fma(_398, _598, _660);
        float _670 = _618 * 6.283185482025146484375;
        float _672 = sin(_670);
        float _674 = _628 * _654;
        float _676 = _642 * 6.283185482025146484375;
        float _678 = sin(_676);
        float _680 = -_506;
        float _682 = _680 + _526;
        float _684 = _628 * _664;
        float _686 = _664 * _654;
        float _688 = _638 * _664;
        float _690 = fma(_682, _580, _506);
        float _692 = _672 * _664;
        float _694 = _672 * _638;
        float _696 = _690 * _588;
        float _698 = fma(_400, _598, _696);
        float _700 = _672 * _678;
        float _702 = _672 * _654;
        float _704 = fma(_678, _674, _694);
        float _706 = -_666;
        float _708 = fma(_654, _700, _706);
        float _710 = fma(_638, _700, _674);
        float _712 = -_508;
        float _714 = _712 + _528;
        float _716 = -_546;
        float _718 = _716 + _566;
        float _720 = -_548;
        float _722 = _720 + _568;
        float _724 = _656 * _588;
        float _726 = fma(_714, _580, _508);
        float _728 = fma(_718, _580, _546);
        float _730 = fma(_722, _580, _548);
        float _732 = -_702;
        float _734 = fma(_678, _666, _732);
        float _736 = _726 * _588;
        float _738 = _728 * _588;
        float _740 = _730 * _588;
        float _742 = fma(_402, _598, _736);
        float _744 = fma(_404, _598, _738);
        float _746 = fma(_406, _598, _740);
        float _748 = fma(_408, _598, _724);
        float _750 = -_678;
        float _752 = _750 + (-0.0);
        _428 = _742;
        _754 = _692;
        _430 = _698;
        _756 = _686;
        _758 = _688;
        _760 = _752;
        _432 = _668;
        _762 = _704;
        _764 = _708;
        _766 = _710;
        _768 = _734;
        _770 = _684;
        _772 = _748;
        _774 = _746;
        _776 = _744;
        _778 = true;
    }
    else
    {
        float _780 = _392 * 2.0;
        float _782 = _394 * _410;
        float _784 = _396 * _410;
        float _786 = _392 * _410;
        float _788 = _396 * _396;
        float _790 = -_782;
        float _792 = fma(_780, _396, _790);
        float _794 = fma(_780, _396, _782);
        float _796 = fma(_780, _394, _784);
        float _798 = -_784;
        float _800 = fma(_780, _394, _798);
        float _802 = _392 * _392;
        float _804 = _396 * 2.0;
        float _806 = _394 * _394;
        float _808 = fma(_788, -2.0, 1.0);
        float _810 = fma(_802, -2.0, 1.0);
        float _812 = -_786;
        float _814 = fma(_804, _394, _812);
        float _816 = fma(_804, _394, _786);
        float _818 = fma(_806, -2.0, _808);
        float _820 = fma(_806, -2.0, _810);
        float _822 = fma(_788, -2.0, _810);
        _754 = _816;
        _756 = _818;
        _758 = _794;
        _760 = _800;
        _762 = _796;
        _764 = _792;
        _766 = _820;
        _768 = _814;
        _770 = _822;
        _772 = _408;
        _774 = _406;
        _776 = _404;
    }
    _778 = false;
    float _824 = _428;
    float _826 = _754;
    float _828 = _430;
    float _830 = _756;
    float _832 = _758;
    float _834 = _760;
    float _836 = _432;
    float _838 = _762;
    float _840 = _764;
    float _842 = _766;
    float _844 = _768;
    float _846 = _770;
    float _848 = _772;
    float _850 = _774;
    float _852 = _776;
    bool _854 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _856 = _824 * _826;
    float _858 = _828 * _830;
    float _860 = _828 * _832;
    float _862 = _828 * _834;
    float _864 = _836 * _838;
    float _866 = _824 * _840;
    float _868 = _824 * _842;
    float _870 = _836 * _844;
    float _872 = _836 * _846;
    int _874 = _66 * 112;
    bool _876 = !_854;
    float _878 = _864;
    float _1196;
    float _1198;
    float _1200;
    float _1202;
    float _1204;
    float _1206;
    float _1208;
    float _1210;
    float _1212;
    float _1214;
    float _1216;
    if (!_876)
    {
        int _880 = 0;
        float _882 = _858;
        float _884 = _866;
        float _886 = _864;
        float _888 = _852;
        float _890 = _860;
        float _892 = _868;
        float _894 = _870;
        float _896 = _850;
        float _898 = _862;
        float _900 = _856;
        float _902 = _872;
        float _904 = _848;
        bool _906;
        int _954;
        int _964;
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
        int _1172;
        int _1176;
        int _1178;
        int _1182;
        int _1184;
        int _1186;
        int _1190;
        int _1192;
        int _1194;
        do
        {
            int _908 = _880;
            int _910 = as_type<int>(_882);
            int _912 = as_type<int>(_884);
            int _914 = as_type<int>(_886);
            int _916 = as_type<int>(_888);
            int _918 = as_type<int>(_890);
            int _920 = as_type<int>(_892);
            int _922 = as_type<int>(_894);
            int _924 = as_type<int>(_896);
            int _926 = as_type<int>(_898);
            int _928 = as_type<int>(_900);
            int _930 = as_type<int>(_902);
            int _932 = as_type<int>(_904);
            uint _934 = uint(int(uint(_874) >> uint(2)));
            uint _936 = uint(int(uint(int(_934)) >> uint(2)));
            int _938 = int(_934) & 3;
            float _940 = (*spvDescriptorSet0.cp_c6)._m0[int(_936)][_938];
            bool _942 = _66 != 0;
            int _944 = _908 + 1;
            bool _946 = uint(_944) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _948 = _910;
            int _950 = as_type<int>(_940);
            int _952 = 31;
            int _2760 = _56(_948, _950, _952, _954, gl_SubgroupInvocationID);
            int _956 = _2760;
            int _958 = _912;
            int _960 = as_type<int>(_940);
            int _962 = 31;
            int _2764 = _56(_958, _960, _962, _964, gl_SubgroupInvocationID);
            int _966 = _2764;
            int _968 = _914;
            int _970 = as_type<int>(_940);
            int _972 = 31;
            int _2768 = _56(_968, _970, _972, _974, gl_SubgroupInvocationID);
            int _976 = _2768;
            int _978 = _916;
            int _980 = as_type<int>(_940);
            int _982 = 31;
            int _2772 = _56(_978, _980, _982, _984, gl_SubgroupInvocationID);
            int _986 = _2772;
            int _988 = _918;
            int _990 = as_type<int>(_940);
            int _992 = 31;
            int _2776 = _56(_988, _990, _992, _994, gl_SubgroupInvocationID);
            int _996 = _2776;
            int _998 = _920;
            int _1000 = as_type<int>(_940);
            int _1002 = 31;
            int _2780 = _56(_998, _1000, _1002, _1004, gl_SubgroupInvocationID);
            int _1006 = _2780;
            int _1008 = _922;
            int _1010 = as_type<int>(_940);
            int _1012 = 31;
            int _2784 = _56(_1008, _1010, _1012, _1014, gl_SubgroupInvocationID);
            int _1016 = _2784;
            int _1018 = _924;
            int _1020 = as_type<int>(_940);
            int _1022 = 31;
            int _2788 = _56(_1018, _1020, _1022, _1024, gl_SubgroupInvocationID);
            int _1026 = _2788;
            int _1028 = _926;
            int _1030 = as_type<int>(_940);
            int _1032 = 31;
            int _2792 = _56(_1028, _1030, _1032, _1034, gl_SubgroupInvocationID);
            int _1036 = _2792;
            int _1038 = _928;
            int _1040 = as_type<int>(_940);
            int _1042 = 31;
            int _2796 = _56(_1038, _1040, _1042, _1044, gl_SubgroupInvocationID);
            int _1046 = _2796;
            int _1048 = _930;
            int _1050 = as_type<int>(_940);
            int _1052 = 31;
            int _2800 = _56(_1048, _1050, _1052, _1054, gl_SubgroupInvocationID);
            int _1056 = _2800;
            int _1058 = _932;
            int _1060 = as_type<int>(_940);
            int _1062 = 31;
            int _2804 = _56(_1058, _1060, _1062, _1064, gl_SubgroupInvocationID);
            int _1066 = _2804;
            bool _1068 = !_942;
            _880 = _944;
            int _1070 = _910;
            int _1072 = _912;
            int _1074 = _914;
            int _1076 = _916;
            int _1078 = _918;
            int _1080 = _920;
            int _1082 = _922;
            int _1084 = _924;
            int _1086 = _926;
            int _1088 = _928;
            int _1090 = _930;
            int _1092 = _932;
            if (!_1068)
            {
                float _1094 = _860 * as_type<float>(_1006);
                float _1096 = _868 * as_type<float>(_1006);
                float _1098 = as_type<float>(_1006) * _850;
                float _1100 = _870 * as_type<float>(_1006);
                float _1102 = _860 * as_type<float>(_966);
                float _1104 = _868 * as_type<float>(_966);
                float _1106 = _870 * as_type<float>(_966);
                float _1108 = as_type<float>(_966) * _850;
                float _1110 = fma(_858, as_type<float>(_996), _1094);
                float _1112 = fma(_866, as_type<float>(_996), _1096);
                float _1114 = fma(as_type<float>(_996), _852, _1098);
                float _1116 = fma(_864, as_type<float>(_996), _1100);
                float _1118 = _860 * as_type<float>(_1046);
                float _1120 = _868 * as_type<float>(_1046);
                float _1122 = _870 * as_type<float>(_1046);
                float _1124 = fma(_858, as_type<float>(_956), _1102);
                float _1126 = fma(_866, as_type<float>(_956), _1104);
                float _1128 = fma(_864, as_type<float>(_956), _1106);
                float _1130 = as_type<float>(_1046) * _850;
                float _1132 = fma(as_type<float>(_956), _852, _1108);
                float _1134 = fma(_858, as_type<float>(_1036), _1118);
                float _1136 = fma(_866, as_type<float>(_1036), _1120);
                float _1138 = fma(_864, as_type<float>(_1036), _1122);
                float _1140 = fma(as_type<float>(_1036), _852, _1130);
                float _1142 = fma(_862, as_type<float>(_976), _1124);
                float _1144 = fma(_856, as_type<float>(_976), _1126);
                float _1146 = fma(_872, as_type<float>(_976), _1128);
                float _1148 = fma(as_type<float>(_976), _848, _1132);
                float _1150 = fma(_862, as_type<float>(_1016), _1110);
                float _1152 = fma(_856, as_type<float>(_1016), _1112);
                float _1154 = fma(_872, as_type<float>(_1016), _1116);
                float _1156 = fma(as_type<float>(_1016), _848, _1114);
                float _1158 = fma(as_type<float>(_1056), _848, _1140);
                float _1160 = fma(_872, as_type<float>(_1056), _1138);
                float _1162 = fma(_862, as_type<float>(_1056), _1134);
                float _1164 = fma(_856, as_type<float>(_1056), _1136);
                float _1166 = as_type<float>(_986) + _1148;
                float _1168 = as_type<float>(_1026) + _1156;
                float _1170 = as_type<float>(_1066) + _1158;
                _1070 = as_type<int>(_1142);
                _1072 = as_type<int>(_1144);
                _1074 = as_type<int>(_1146);
                _1076 = as_type<int>(_1166);
                _1078 = as_type<int>(_1150);
                _1080 = as_type<int>(_1152);
                _1082 = as_type<int>(_1154);
                _1084 = as_type<int>(_1168);
                _1086 = as_type<int>(_1162);
                _1088 = as_type<int>(_1164);
                _1090 = as_type<int>(_1160);
                _1092 = as_type<int>(_1170);
            }
            _1172 = _1070;
            int _1174 = _1072;
            _1176 = _1074;
            _1178 = _1076;
            int _1180 = _1078;
            _1182 = _1080;
            _1184 = _1082;
            _1186 = _1084;
            int _1188 = _1086;
            _1190 = _1088;
            _1192 = _1090;
            _1194 = _1092;
            _906 = !_946;
            _882 = as_type<float>(_1172);
            _884 = as_type<float>(_1174);
            _886 = as_type<float>(_1176);
            _888 = as_type<float>(_1178);
            _890 = as_type<float>(_1180);
            _892 = as_type<float>(_1182);
            _894 = as_type<float>(_1184);
            _896 = as_type<float>(_1186);
            _898 = as_type<float>(_1188);
            _900 = as_type<float>(_1190);
            _902 = as_type<float>(_1192);
            _904 = as_type<float>(_1194);
            _1196 = as_type<float>(_1174);
            _1198 = as_type<float>(_1180);
            _1200 = as_type<float>(_1188);
        } while (_906);
        _1202 = as_type<float>(_1182);
        _1204 = as_type<float>(_1190);
        _1206 = as_type<float>(_1172);
        _878 = as_type<float>(_1176);
        _1208 = as_type<float>(_1184);
        _1210 = as_type<float>(_1192);
        _1212 = as_type<float>(_1186);
        _1214 = as_type<float>(_1194);
        _1216 = as_type<float>(_1178);
        _1218 = true;
    }
    else
    {
        _1196 = _866;
        _1202 = _868;
        _1204 = _856;
        _1206 = _858;
        _1198 = _860;
        _1200 = _862;
        _1208 = _870;
        _1210 = _872;
        _1212 = _850;
        _1214 = _848;
        _1216 = _852;
    }
    _1218 = false;
    float _1220 = _1196;
    float _1222 = _1202;
    float _1224 = _1204;
    float _1226 = _1206;
    float _1228 = _1198;
    float _1230 = _1200;
    float _1232 = _878;
    float _1234 = _1208;
    float _1236 = _1210;
    float _1238 = _1212;
    float _1240 = _1214;
    float _1242 = _1216;
    int _1244 = _874 + 80;
    uint _1246 = uint(int(uint(_1244) >> uint(2)));
    uint _1248 = uint(int(uint(int(_1246)) >> uint(2)));
    int _1250 = int(_1246) & 3;
    float _1252 = (*spvDescriptorSet0.cp_c6)._m0[int(_1248)][_1250];
    int _1254 = int(_1246) + 1;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    int _1258 = _1254 & 3;
    float _1260 = (*spvDescriptorSet0.cp_c6)._m0[int(_1256)][_1258];
    int _1262 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1264 = _1262 + _66;
    int _1266 = _874 + 64;
    uint _1268 = uint(int(uint(_1266) >> uint(2)));
    uint _1270 = uint(int(uint(int(_1268)) >> uint(2)));
    int _1272 = int(_1268) & 3;
    float _1274 = (*spvDescriptorSet0.cp_c6)._m0[int(_1270)][_1272];
    int _1276 = int(_1268) + 1;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    int _1280 = _1276 & 3;
    float _1282 = (*spvDescriptorSet0.cp_c6)._m0[int(_1278)][_1280];
    int _1284 = _1264 * 48;
    int _1286 = _874 + 88;
    uint _1288 = uint(int(uint(_1286) >> uint(2)));
    uint _1290 = uint(int(uint(int(_1288)) >> uint(2)));
    int _1292 = int(_1288) & 3;
    float _1294 = (*spvDescriptorSet0.cp_c6)._m0[int(_1290)][_1292];
    int _1296 = int(_1288) + 1;
    uint _1298 = uint(int(uint(_1296) >> uint(2)));
    int _1300 = _1296 & 3;
    float _1302 = (*spvDescriptorSet0.cp_c6)._m0[int(_1298)][_1300];
    int _1304 = _874 + 72;
    uint _1306 = uint(int(uint(_1304) >> uint(2)));
    uint _1308 = uint(int(uint(int(_1306)) >> uint(2)));
    int _1310 = int(_1306) & 3;
    float _1312 = (*spvDescriptorSet0.cp_c6)._m0[int(_1308)][_1310];
    int _1314 = int(_1306) + 1;
    uint _1316 = uint(int(uint(_1314) >> uint(2)));
    int _1318 = _1314 & 3;
    float _1320 = (*spvDescriptorSet0.cp_c6)._m0[int(_1316)][_1318];
    int _1322 = _874 + 96;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    uint _1326 = uint(int(uint(int(_1324)) >> uint(2)));
    int _1328 = int(_1324) & 3;
    float _1330 = (*spvDescriptorSet0.cp_c6)._m0[int(_1326)][_1328];
    int _1332 = int(_1324) + 1;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    int _1336 = _1332 & 3;
    float _1338 = (*spvDescriptorSet0.cp_c6)._m0[int(_1334)][_1336];
    int _1340 = _874 + 104;
    uint _1342 = uint(int(uint(_1340) >> uint(2)));
    uint _1344 = uint(int(uint(int(_1342)) >> uint(2)));
    int _1346 = int(_1342) & 3;
    float _1348 = (*spvDescriptorSet0.cp_c6)._m0[int(_1344)][_1346];
    int _1350 = int(_1342) + 1;
    uint _1352 = uint(int(uint(_1350) >> uint(2)));
    int _1354 = _1350 & 3;
    float _1356 = (*spvDescriptorSet0.cp_c6)._m0[int(_1352)][_1354];
    float _1358 = _1220 * _1252;
    float _1360 = _1222 * _1252;
    float _1362 = _1224 * _1252;
    float _1364 = _1220 * _1260;
    float _1366 = _1224 * _1260;
    int _1368 = _874 + 16;
    uint _1370 = uint(int(uint(_1368) >> uint(2)));
    uint _1372 = uint(int(uint(int(_1370)) >> uint(2)));
    int _1374 = int(_1370) & 3;
    float _1376 = (*spvDescriptorSet0.cp_c6)._m0[int(_1372)][_1374];
    int _1378 = int(_1370) + 1;
    uint _1380 = uint(int(uint(_1378) >> uint(2)));
    int _1382 = _1378 & 3;
    float _1384 = (*spvDescriptorSet0.cp_c6)._m0[int(_1380)][_1382];
    float _1386 = fma(_1226, _1274, _1358);
    float _1388 = fma(_1228, _1274, _1360);
    float _1390 = fma(_1230, _1274, _1362);
    float _1392 = _1222 * _1260;
    float _1394 = fma(_1226, _1282, _1364);
    int _1396 = _874 + 32;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    uint _1400 = uint(int(uint(int(_1398)) >> uint(2)));
    int _1402 = int(_1398) & 3;
    float _1404 = (*spvDescriptorSet0.cp_c6)._m0[int(_1400)][_1402];
    int _1406 = int(_1398) + 1;
    uint _1408 = uint(int(uint(_1406) >> uint(2)));
    int _1410 = _1406 & 3;
    float _1412 = (*spvDescriptorSet0.cp_c6)._m0[int(_1408)][_1410];
    float _1414 = fma(_1230, _1282, _1366);
    float _1416 = fma(_1228, _1282, _1392);
    float _1418 = _1220 * _1294;
    float _1420 = _1222 * _1294;
    float _1422 = _1220 * _1302;
    float _1424 = _1222 * _1302;
    float _1426 = _1224 * _1294;
    int _1428 = _874 + 48;
    uint _1430 = uint(int(uint(_1428) >> uint(2)));
    uint _1432 = uint(int(uint(int(_1430)) >> uint(2)));
    int _1434 = int(_1430) & 3;
    float _1436 = (*spvDescriptorSet0.cp_c6)._m0[int(_1432)][_1434];
    int _1438 = int(_1430) + 1;
    uint _1440 = uint(int(uint(_1438) >> uint(2)));
    int _1442 = _1438 & 3;
    float _1444 = (*spvDescriptorSet0.cp_c6)._m0[int(_1440)][_1442];
    float _1446 = _1224 * _1302;
    float _1448 = fma(_1226, _1312, _1418);
    float _1450 = fma(_1228, _1312, _1420);
    float _1452 = fma(_1226, _1320, _1422);
    float _1454 = fma(_1228, _1320, _1424);
    float _1456 = fma(_1230, _1312, _1426);
    int _1458 = _874 + 24;
    uint _1460 = uint(int(uint(_1458) >> uint(2)));
    uint _1462 = uint(int(uint(int(_1460)) >> uint(2)));
    int _1464 = int(_1460) & 3;
    float _1466 = (*spvDescriptorSet0.cp_c6)._m0[int(_1462)][_1464];
    int _1468 = int(_1460) + 1;
    uint _1470 = uint(int(uint(_1468) >> uint(2)));
    int _1472 = _1468 & 3;
    float _1474 = (*spvDescriptorSet0.cp_c6)._m0[int(_1470)][_1472];
    float _1476 = fma(_1230, _1320, _1446);
    float _1478 = fma(_1232, _1330, _1386);
    float _1480 = fma(_1232, _1338, _1394);
    float _1482 = fma(_1234, _1330, _1388);
    float _1484 = fma(_1234, _1338, _1416);
    float _1486 = fma(_1236, _1330, _1390);
    int _1488 = _874 + 40;
    uint _1490 = uint(int(uint(_1488) >> uint(2)));
    uint _1492 = uint(int(uint(int(_1490)) >> uint(2)));
    int _1494 = int(_1490) & 3;
    float _1496 = (*spvDescriptorSet0.cp_c6)._m0[int(_1492)][_1494];
    int _1498 = int(_1490) + 1;
    uint _1500 = uint(int(uint(_1498) >> uint(2)));
    int _1502 = _1498 & 3;
    float _1504 = (*spvDescriptorSet0.cp_c6)._m0[int(_1500)][_1502];
    float _1506 = fma(_1236, _1338, _1414);
    float _1508 = fma(_1232, _1348, _1448);
    float _1510 = fma(_1234, _1356, _1454);
    float _1512 = fma(_1232, _1356, _1452);
    float _1514 = fma(_1236, _1356, _1476);
    float _1516 = fma(_1234, _1348, _1450);
    int _1518 = _874 + 56;
    uint _1520 = uint(int(uint(_1518) >> uint(2)));
    uint _1522 = uint(int(uint(int(_1520)) >> uint(2)));
    int _1524 = int(_1520) & 3;
    float _1526 = (*spvDescriptorSet0.cp_c6)._m0[int(_1522)][_1524];
    int _1528 = int(_1520) + 1;
    uint _1530 = uint(int(uint(_1528) >> uint(2)));
    int _1532 = _1528 & 3;
    float _1534 = (*spvDescriptorSet0.cp_c6)._m0[int(_1530)][_1532];
    float _1536 = _1510 + _1238;
    float _1538 = fma(_1236, _1348, _1456);
    float _1540 = _1514 + _1240;
    float _1542 = _1512 + _1242;
    float _1544 = _1482 * _1384;
    float _1546 = _1484 * _1384;
    float _1548 = _1516 * _1384;
    float _1550 = _1536 * _1384;
    float _1552 = fma(_1478, _1376, _1544);
    float _1554 = fma(_1480, _1376, _1546);
    float _1556 = fma(_1508, _1376, _1548);
    float _1558 = fma(_1542, _1376, _1550);
    float _1560 = _1536 * _1412;
    float _1562 = _1482 * _1412;
    float _1564 = _1484 * _1412;
    float _1566 = _1516 * _1412;
    float _1568 = fma(_1542, _1404, _1560);
    float _1570 = fma(_1478, _1404, _1562);
    float _1572 = fma(_1480, _1404, _1564);
    float _1574 = fma(_1508, _1404, _1566);
    float _1576 = _1536 * _1444;
    float _1578 = _1482 * _1444;
    float _1580 = _1484 * _1444;
    float _1582 = _1516 * _1444;
    float _1584 = fma(_1542, _1436, _1576);
    float _1586 = fma(_1478, _1436, _1578);
    float _1588 = fma(_1480, _1436, _1580);
    float _1590 = fma(_1508, _1436, _1582);
    float _1592 = fma(_1540, _1466, _1558);
    float _1594 = fma(_1486, _1466, _1552);
    float _1596 = fma(_1506, _1466, _1554);
    float _1598 = fma(_1538, _1466, _1556);
    float _1600 = _1592 + _1474;
    float _1602 = fma(_1540, _1496, _1568);
    float _1604 = fma(_1486, _1496, _1570);
    float _1606 = fma(_1506, _1496, _1572);
    int _1608 = _1284 + 16;
    float _1610 = fma(_1538, _1496, _1574);
    float _1612 = _1602 + _1504;
    int _1614 = _1284 + 32;
    float _1616 = fma(_1540, _1526, _1584);
    float _1618 = fma(_1486, _1526, _1586);
    float _1620 = fma(_1506, _1526, _1588);
    float _1622 = fma(_1538, _1526, _1590);
    float _1624 = _1616 + _1534;
    int _1626 = _1284 + 48;
    uint _1628 = uint(int(uint(_1608) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1628)] = as_type<uint>(_1594);
    int _1630 = _1608 + 4;
    uint _1632 = uint(int(uint(_1630) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1632)] = as_type<uint>(_1596);
    int _1634 = _1608 + 8;
    uint _1636 = uint(int(uint(_1634) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1636)] = as_type<uint>(_1598);
    int _1638 = _1608 + 12;
    uint _1640 = uint(int(uint(_1638) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1640)] = as_type<uint>(_1600);
    uint _1642 = uint(int(uint(_1614) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1642)] = as_type<uint>(_1604);
    int _1644 = _1614 + 4;
    uint _1646 = uint(int(uint(_1644) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1646)] = as_type<uint>(_1606);
    int _1648 = _1614 + 8;
    uint _1650 = uint(int(uint(_1648) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1650)] = as_type<uint>(_1610);
    int _1652 = _1614 + 12;
    uint _1654 = uint(int(uint(_1652) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1654)] = as_type<uint>(_1612);
    uint _1656 = uint(int(uint(_1626) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1656)] = as_type<uint>(_1618);
    int _1658 = _1626 + 4;
    uint _1660 = uint(int(uint(_1658) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1660)] = as_type<uint>(_1620);
    int _1662 = _1626 + 8;
    uint _1664 = uint(int(uint(_1662) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1664)] = as_type<uint>(_1622);
    int _1666 = _1626 + 12;
    uint _1668 = uint(int(uint(_1666) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1668)] = as_type<uint>(_1624);
}

