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
int _52(thread const int& _3016, thread const int& _3017, constant _10& support_buffer)
{
    int _3020 = 1 + _3017;
    float _3022 = support_buffer._m5[_3020].x;
    bool _3024 = _3022 == 1.0;
    if (_3024)
    {
        return _3016;
    }
    float _3026 = float(_3016);
    float _3028 = _3026 * _3022;
    int _3030 = int(_3028);
    return _3030;
}

static inline __attribute__((always_inline))
int _54(thread const int& _3051, thread const int& _3052, thread const int& _3053, thread int& _3054, thread uint& gl_SubgroupInvocationID)
{
    int _3057 = _3053 & 31;
    uint _3059 = uint(int(uint(_3053) >> uint(8)));
    int _3061 = int(_3059) & 31;
    float _3063 = as_type<float>(gl_SubgroupInvocationID);
    int _3065 = as_type<int>(_3063) & _3061;
    int _3067 = ~_3061;
    int _3069 = _3057 & _3067;
    int _3071 = _3069 | _3065;
    int _3073 = ~_3061;
    int _3075 = _3052 & _3073;
    int _3077 = _3075 | _3065;
    bool _3079 = uint(_3077) <= uint(_3071);
    _3054 = _3079 ? (-1) : 0;
    float _3081 = spvSubgroupShuffle(as_type<float>(_3051), uint(_3077));
    uint _3083 = uint(_3079 ? as_type<int>(_3081) : _3051);
    return int(_3083);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _818 = false;
    float _58 = as_type<float>(gl_WorkGroupID.x);
    float _60 = as_type<float>(gl_LocalInvocationID.x);
    int _62 = as_type<int>(_58) << 6;
    int _64 = _62 + as_type<int>(_60);
    bool _68 = uint(_64) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_68)
    {
        return;
    }
    int _70 = _64 & 31;
    bool _72 = _70 == 0;
    bool _74 = uint(_70) < 32u;
    int _76 = 32 - _70;
    int _78 = _70 - 32;
    int _80 = 1 << _70;
    uint _83 = uint(int(uint(0) >> uint(_76)));
    int _85 = _80 | int(_83);
    int _87 = _72 ? 1 : _85;
    bool _89 = uint(_78) < 32u;
    int _91 = 0 << _78;
    int _93 = _89 ? _91 : 0;
    float _95 = _74 ? as_type<float>(_87) : as_type<float>(_93);
    int _97 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _99 = _97 + 32;
    uint _101 = uint(int(uint(_99) >> uint(2)));
    uint _103 = uint(int(uint(int(_101)) >> uint(2)));
    int _105 = int(_101) & 3;
    float _107 = (*spvDescriptorSet0.cp_c5)._m0[int(_103)][_105];
    int _109 = as_type<int>(_95) & as_type<int>(_107);
    bool _111 = _109 != 0;
    float _113 = 0.0;
    float _115 = 0.0;
    float _117 = _95;
    if (!_111)
    {
        _113 = 0.0;
        _115 = 0.0;
    }
    float _119 = _113;
    float _121 = _115;
    float _123 = 0.0;
    float _125 = _119;
    float _127 = _121;
    if (!_111)
    {
        _123 = 0.0;
    }
    float _129 = _123;
    float _131 = 0.0;
    float _133 = 0.0;
    float _135 = _129;
    if (!_111)
    {
        _131 = 0.0;
        _133 = 0.0;
    }
    float _137 = _131;
    float _139 = _133;
    float _141 = 0.0;
    float _143 = _137;
    float _145 = _139;
    if (!_111)
    {
        _141 = 0.0;
    }
    float _147 = _141;
    float _149 = 0.0;
    float _151 = 0.0;
    float _153 = _147;
    if (!_111)
    {
        _149 = 0.0;
        _151 = 0.0;
    }
    float _155 = _149;
    float _157 = _151;
    float _159 = 0.0;
    float _161 = _155;
    float _163 = _157;
    if (!_111)
    {
        _159 = 0.0;
    }
    float _165 = _159;
    float _167 = _165;
    if (!_111)
    {
        _117 = 0.0;
    }
    float _169 = _117;
    bool _171 = !_111;
    float _173 = _169;
    if (!_171)
    {
        uint _175 = uint(int(uint(_97) >> uint(2)));
        uint _177 = uint(int(uint(int(_175)) >> uint(2)));
        int _179 = int(_175) & 3;
        float _181 = (*spvDescriptorSet0.cp_c5)._m0[int(_177)][_179];
        int _183 = int(_175) + 1;
        uint _185 = uint(int(uint(_183) >> uint(2)));
        int _187 = _183 & 3;
        float _189 = (*spvDescriptorSet0.cp_c5)._m0[int(_185)][_187];
        int _191 = _64;
        int _193 = 0;
        int _195 = _52(_191, _193, (*spvDescriptorSet0.support_buffer));
        int _197 = as_type<int>(_181);
        int _199 = 0;
        int _201 = _52(_197, _199, (*spvDescriptorSet0.support_buffer));
        int3 _1459 = int3(_195, _201, 1);
        float4 _204 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1459.xy), uint(_1459.z), 0).xyzw;
        float _206 = _204.x;
        float _208 = _204.y;
        float _210 = _204.z;
        float _212 = _204.w;
        int _214 = _64;
        int _216 = 0;
        int _218 = _52(_214, _216, (*spvDescriptorSet0.support_buffer));
        int _220 = as_type<int>(_189);
        int _222 = 0;
        int _224 = _52(_220, _222, (*spvDescriptorSet0.support_buffer));
        int3 _1479 = int3(_218, _224, 1);
        float4 _226 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1479.xy), uint(_1479.z), 0).xyzw;
        float _228 = _226.x;
        float _230 = _226.y;
        float _232 = _226.z;
        float _234 = _226.w;
        int _236 = _64;
        int _238 = 0;
        int _240 = _52(_236, _238, (*spvDescriptorSet0.support_buffer));
        int _242 = as_type<int>(_181);
        int _244 = 0;
        int _246 = _52(_242, _244, (*spvDescriptorSet0.support_buffer));
        int3 _1499 = int3(_240, _246, 0);
        float3 _250 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1499.xy), uint(_1499.z), 0).xyz;
        float _252 = _250.x;
        float _254 = _250.y;
        float _256 = _250.z;
        int _258 = _64;
        int _260 = 0;
        int _262 = _52(_258, _260, (*spvDescriptorSet0.support_buffer));
        int _264 = as_type<int>(_189);
        int _266 = 0;
        int _268 = _52(_264, _266, (*spvDescriptorSet0.support_buffer));
        int3 _1517 = int3(_262, _268, 0);
        float3 _270 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1517.xy), uint(_1517.z), 0).xyz;
        float _272 = _270.x;
        float _274 = _270.y;
        float _276 = _270.z;
        int _278 = _64;
        int _280 = 0;
        int _282 = _52(_278, _280, (*spvDescriptorSet0.support_buffer));
        int _284 = as_type<int>(_181);
        int _286 = 0;
        int _288 = _52(_284, _286, (*spvDescriptorSet0.support_buffer));
        int3 _1535 = int3(_282, _288, 2);
        float3 _290 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1535.xy), uint(_1535.z), 0).xyz;
        float _292 = _290.x;
        float _294 = _290.y;
        float _296 = _290.z;
        int _298 = _64;
        int _300 = 0;
        int _302 = _52(_298, _300, (*spvDescriptorSet0.support_buffer));
        int _304 = as_type<int>(_189);
        int _306 = 0;
        int _308 = _52(_304, _306, (*spvDescriptorSet0.support_buffer));
        int3 _1553 = int3(_302, _308, 2);
        float3 _310 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1553.xy), uint(_1553.z), 0).xyz;
        float _312 = _310.x;
        float _314 = _310.y;
        float _316 = _310.z;
        int _318 = _97 + 16;
        uint _320 = uint(int(uint(_318) >> uint(2)));
        uint _322 = uint(int(uint(int(_320)) >> uint(2)));
        int _324 = int(_320) & 3;
        float _326 = (*spvDescriptorSet0.cp_c5)._m0[int(_322)][_324];
        float _328 = -_208;
        float _330 = _328 + _230;
        float _332 = -_212;
        float _334 = _332 + _234;
        float _336 = -_210;
        float _338 = _336 + _232;
        float _340 = -_206;
        float _342 = _340 + _228;
        float _344 = fma(_330, _326, _208);
        float _346 = -_254;
        float _348 = _346 + _274;
        float _350 = fma(_334, _326, _212);
        float _352 = -_292;
        float _354 = _352 + _312;
        float _356 = -_252;
        float _358 = _356 + _272;
        float _360 = -_256;
        float _362 = _360 + _276;
        float _364 = -_294;
        float _366 = _364 + _314;
        float _368 = -_296;
        float _370 = _368 + _316;
        float _372 = fma(_338, _326, _210);
        float _374 = fma(_348, _326, _254);
        float _376 = fma(_342, _326, _206);
        float _378 = fma(_354, _326, _292);
        float _380 = fma(_358, _326, _252);
        float _382 = fma(_362, _326, _256);
        float _384 = fma(_366, _326, _294);
        float _386 = fma(_370, _326, _296);
        float _388 = _350 * 2.0;
        _125 = _376;
        _167 = _372;
        _173 = _388;
        _143 = _344;
        _127 = _380;
        _135 = _374;
        _145 = _382;
        _161 = _386;
        _163 = _384;
        _153 = _378;
    }
    float _390 = _125;
    float _392 = _167;
    float _394 = _173;
    float _396 = _143;
    float _398 = _127;
    float _400 = _135;
    float _402 = _145;
    float _404 = _161;
    float _406 = _163;
    float _408 = _153;
    float _410 = _390 * _390;
    float _412 = _390 * 2.0;
    float _414 = _392 * _394;
    float _416 = _390 * _394;
    float _418 = _396 * _394;
    float _420 = _396 * _396;
    bool _422 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _424 = -_414;
    float _426 = fma(_412, _396, _424);
    float _428 = fma(_412, _396, _414);
    float _430 = _396 * 2.0;
    float _432 = fma(_410, -2.0, 1.0);
    float _434 = _392 * _392;
    float _436 = fma(_420, -2.0, 1.0);
    float _438 = fma(_412, _392, _418);
    float _440 = -_418;
    float _442 = fma(_412, _392, _440);
    float _444 = -_416;
    float _446 = fma(_430, _392, _444);
    float _448 = fma(_430, _392, _416);
    float _450 = fma(_434, -2.0, _436);
    float _452 = fma(_434, -2.0, _432);
    float _454 = fma(_420, -2.0, _432);
    float _456 = _428 * _398;
    float _458 = _442 * _398;
    float _460 = _450 * _398;
    float _462 = _426 * _400;
    float _464 = _448 * _400;
    float _466 = _452 * _400;
    float _468 = _438 * _402;
    float _470 = _446 * _402;
    float _472 = _454 * _402;
    int _474 = _64 * 112;
    bool _476 = !_422;
    float _794;
    float _796;
    float _798;
    float _800;
    float _802;
    float _804;
    float _806;
    float _808;
    float _810;
    float _812;
    float _814;
    float _816;
    if (!_476)
    {
        int _478 = 0;
        float _480 = _460;
        float _482 = _462;
        float _484 = _468;
        float _486 = _408;
        float _488 = _456;
        float _490 = _466;
        float _492 = _470;
        float _494 = _406;
        float _496 = _458;
        float _498 = _464;
        float _500 = _472;
        float _502 = _404;
        bool _504;
        int _552;
        int _562;
        int _572;
        int _582;
        int _592;
        int _602;
        int _612;
        int _622;
        int _632;
        int _642;
        int _652;
        int _662;
        int _770;
        int _774;
        int _776;
        int _780;
        int _782;
        int _784;
        int _788;
        int _790;
        int _792;
        do
        {
            int _506 = _478;
            int _508 = as_type<int>(_480);
            int _510 = as_type<int>(_482);
            int _512 = as_type<int>(_484);
            int _514 = as_type<int>(_486);
            int _516 = as_type<int>(_488);
            int _518 = as_type<int>(_490);
            int _520 = as_type<int>(_492);
            int _522 = as_type<int>(_494);
            int _524 = as_type<int>(_496);
            int _526 = as_type<int>(_498);
            int _528 = as_type<int>(_500);
            int _530 = as_type<int>(_502);
            uint _532 = uint(int(uint(_474) >> uint(2)));
            uint _534 = uint(int(uint(int(_532)) >> uint(2)));
            int _536 = int(_532) & 3;
            float _538 = (*spvDescriptorSet0.cp_c6)._m0[int(_534)][_536];
            bool _540 = _64 != 0;
            int _542 = _506 + 1;
            bool _544 = uint(_542) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _546 = _508;
            int _548 = as_type<int>(_538);
            int _550 = 31;
            int _1869 = _54(_546, _548, _550, _552, gl_SubgroupInvocationID);
            int _554 = _1869;
            int _556 = _510;
            int _558 = as_type<int>(_538);
            int _560 = 31;
            int _1873 = _54(_556, _558, _560, _562, gl_SubgroupInvocationID);
            int _564 = _1873;
            int _566 = _512;
            int _568 = as_type<int>(_538);
            int _570 = 31;
            int _1877 = _54(_566, _568, _570, _572, gl_SubgroupInvocationID);
            int _574 = _1877;
            int _576 = _514;
            int _578 = as_type<int>(_538);
            int _580 = 31;
            int _1881 = _54(_576, _578, _580, _582, gl_SubgroupInvocationID);
            int _584 = _1881;
            int _586 = _516;
            int _588 = as_type<int>(_538);
            int _590 = 31;
            int _1885 = _54(_586, _588, _590, _592, gl_SubgroupInvocationID);
            int _594 = _1885;
            int _596 = _518;
            int _598 = as_type<int>(_538);
            int _600 = 31;
            int _1889 = _54(_596, _598, _600, _602, gl_SubgroupInvocationID);
            int _604 = _1889;
            int _606 = _520;
            int _608 = as_type<int>(_538);
            int _610 = 31;
            int _1893 = _54(_606, _608, _610, _612, gl_SubgroupInvocationID);
            int _614 = _1893;
            int _616 = _522;
            int _618 = as_type<int>(_538);
            int _620 = 31;
            int _1897 = _54(_616, _618, _620, _622, gl_SubgroupInvocationID);
            int _624 = _1897;
            int _626 = _524;
            int _628 = as_type<int>(_538);
            int _630 = 31;
            int _1901 = _54(_626, _628, _630, _632, gl_SubgroupInvocationID);
            int _634 = _1901;
            int _636 = _526;
            int _638 = as_type<int>(_538);
            int _640 = 31;
            int _1905 = _54(_636, _638, _640, _642, gl_SubgroupInvocationID);
            int _644 = _1905;
            int _646 = _528;
            int _648 = as_type<int>(_538);
            int _650 = 31;
            int _1909 = _54(_646, _648, _650, _652, gl_SubgroupInvocationID);
            int _654 = _1909;
            int _656 = _530;
            int _658 = as_type<int>(_538);
            int _660 = 31;
            int _1913 = _54(_656, _658, _660, _662, gl_SubgroupInvocationID);
            int _664 = _1913;
            bool _666 = !_540;
            _478 = _542;
            int _668 = _508;
            int _670 = _510;
            int _672 = _512;
            int _674 = _514;
            int _676 = _516;
            int _678 = _518;
            int _680 = _520;
            int _682 = _522;
            int _684 = _524;
            int _686 = _526;
            int _688 = _528;
            int _690 = _530;
            if (!_666)
            {
                float _692 = _456 * as_type<float>(_564);
                float _694 = _470 * as_type<float>(_564);
                float _696 = _456 * as_type<float>(_604);
                float _698 = _470 * as_type<float>(_604);
                float _700 = fma(_460, as_type<float>(_554), _692);
                float _702 = fma(_468, as_type<float>(_554), _694);
                float _704 = _466 * as_type<float>(_604);
                float _706 = as_type<float>(_604) * _406;
                float _708 = _466 * as_type<float>(_564);
                float _710 = as_type<float>(_564) * _406;
                float _712 = fma(_460, as_type<float>(_594), _696);
                float _714 = fma(_462, as_type<float>(_594), _704);
                float _716 = fma(_468, as_type<float>(_594), _698);
                float _718 = fma(as_type<float>(_594), _408, _706);
                float _720 = _456 * as_type<float>(_644);
                float _722 = _466 * as_type<float>(_644);
                float _724 = _470 * as_type<float>(_644);
                float _726 = fma(_462, as_type<float>(_554), _708);
                float _728 = as_type<float>(_644) * _406;
                float _730 = fma(as_type<float>(_554), _408, _710);
                float _732 = fma(_460, as_type<float>(_634), _720);
                float _734 = fma(_462, as_type<float>(_634), _722);
                float _736 = fma(_468, as_type<float>(_634), _724);
                float _738 = fma(as_type<float>(_634), _408, _728);
                float _740 = fma(_458, as_type<float>(_574), _700);
                float _742 = fma(_464, as_type<float>(_574), _726);
                float _744 = fma(_472, as_type<float>(_574), _702);
                float _746 = fma(as_type<float>(_574), _404, _730);
                float _748 = fma(_458, as_type<float>(_614), _712);
                float _750 = fma(_464, as_type<float>(_614), _714);
                float _752 = fma(_472, as_type<float>(_614), _716);
                float _754 = fma(as_type<float>(_614), _404, _718);
                float _756 = fma(as_type<float>(_654), _404, _738);
                float _758 = fma(_472, as_type<float>(_654), _736);
                float _760 = fma(_458, as_type<float>(_654), _732);
                float _762 = fma(_464, as_type<float>(_654), _734);
                float _764 = as_type<float>(_584) + _746;
                float _766 = as_type<float>(_624) + _754;
                float _768 = as_type<float>(_664) + _756;
                _668 = as_type<int>(_740);
                _670 = as_type<int>(_742);
                _672 = as_type<int>(_744);
                _674 = as_type<int>(_764);
                _676 = as_type<int>(_748);
                _678 = as_type<int>(_750);
                _680 = as_type<int>(_752);
                _682 = as_type<int>(_766);
                _684 = as_type<int>(_760);
                _686 = as_type<int>(_762);
                _688 = as_type<int>(_758);
                _690 = as_type<int>(_768);
            }
            _770 = _668;
            int _772 = _670;
            _774 = _672;
            _776 = _674;
            int _778 = _676;
            _780 = _678;
            _782 = _680;
            _784 = _682;
            int _786 = _684;
            _788 = _686;
            _790 = _688;
            _792 = _690;
            _504 = !_544;
            _480 = as_type<float>(_770);
            _482 = as_type<float>(_772);
            _484 = as_type<float>(_774);
            _486 = as_type<float>(_776);
            _488 = as_type<float>(_778);
            _490 = as_type<float>(_780);
            _492 = as_type<float>(_782);
            _494 = as_type<float>(_784);
            _496 = as_type<float>(_786);
            _498 = as_type<float>(_788);
            _500 = as_type<float>(_790);
            _502 = as_type<float>(_792);
            _794 = as_type<float>(_772);
            _796 = as_type<float>(_778);
            _798 = as_type<float>(_786);
        } while (_504);
        _800 = as_type<float>(_780);
        _802 = as_type<float>(_788);
        _804 = as_type<float>(_770);
        _806 = as_type<float>(_774);
        _808 = as_type<float>(_782);
        _810 = as_type<float>(_790);
        _812 = as_type<float>(_784);
        _814 = as_type<float>(_792);
        _816 = as_type<float>(_776);
        _818 = true;
    }
    else
    {
        _794 = _462;
        _800 = _466;
        _802 = _464;
        _804 = _460;
        _796 = _456;
        _798 = _458;
        _806 = _468;
        _808 = _470;
        _810 = _472;
        _812 = _406;
        _814 = _404;
        _816 = _408;
    }
    _818 = false;
    float _820 = _794;
    float _822 = _800;
    float _824 = _802;
    float _826 = _804;
    float _828 = _796;
    float _830 = _798;
    float _832 = _806;
    float _834 = _808;
    float _836 = _810;
    float _838 = _812;
    float _840 = _814;
    float _842 = _816;
    int _844 = _474 + 80;
    uint _846 = uint(int(uint(_844) >> uint(2)));
    uint _848 = uint(int(uint(int(_846)) >> uint(2)));
    int _850 = int(_846) & 3;
    float _852 = (*spvDescriptorSet0.cp_c6)._m0[int(_848)][_850];
    int _854 = int(_846) + 1;
    uint _856 = uint(int(uint(_854) >> uint(2)));
    int _858 = _854 & 3;
    float _860 = (*spvDescriptorSet0.cp_c6)._m0[int(_856)][_858];
    int _862 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _864 = _862 + _64;
    int _866 = _474 + 64;
    uint _868 = uint(int(uint(_866) >> uint(2)));
    uint _870 = uint(int(uint(int(_868)) >> uint(2)));
    int _872 = int(_868) & 3;
    float _874 = (*spvDescriptorSet0.cp_c6)._m0[int(_870)][_872];
    int _876 = int(_868) + 1;
    uint _878 = uint(int(uint(_876) >> uint(2)));
    int _880 = _876 & 3;
    float _882 = (*spvDescriptorSet0.cp_c6)._m0[int(_878)][_880];
    int _884 = _864 * 48;
    int _886 = _474 + 88;
    uint _888 = uint(int(uint(_886) >> uint(2)));
    uint _890 = uint(int(uint(int(_888)) >> uint(2)));
    int _892 = int(_888) & 3;
    float _894 = (*spvDescriptorSet0.cp_c6)._m0[int(_890)][_892];
    int _896 = int(_888) + 1;
    uint _898 = uint(int(uint(_896) >> uint(2)));
    int _900 = _896 & 3;
    float _902 = (*spvDescriptorSet0.cp_c6)._m0[int(_898)][_900];
    int _904 = _474 + 72;
    uint _906 = uint(int(uint(_904) >> uint(2)));
    uint _908 = uint(int(uint(int(_906)) >> uint(2)));
    int _910 = int(_906) & 3;
    float _912 = (*spvDescriptorSet0.cp_c6)._m0[int(_908)][_910];
    int _914 = int(_906) + 1;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    int _918 = _914 & 3;
    float _920 = (*spvDescriptorSet0.cp_c6)._m0[int(_916)][_918];
    int _922 = _474 + 96;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    uint _926 = uint(int(uint(int(_924)) >> uint(2)));
    int _928 = int(_924) & 3;
    float _930 = (*spvDescriptorSet0.cp_c6)._m0[int(_926)][_928];
    int _932 = int(_924) + 1;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    int _936 = _932 & 3;
    float _938 = (*spvDescriptorSet0.cp_c6)._m0[int(_934)][_936];
    int _940 = _474 + 104;
    uint _942 = uint(int(uint(_940) >> uint(2)));
    uint _944 = uint(int(uint(int(_942)) >> uint(2)));
    int _946 = int(_942) & 3;
    float _948 = (*spvDescriptorSet0.cp_c6)._m0[int(_944)][_946];
    int _950 = int(_942) + 1;
    uint _952 = uint(int(uint(_950) >> uint(2)));
    int _954 = _950 & 3;
    float _956 = (*spvDescriptorSet0.cp_c6)._m0[int(_952)][_954];
    float _958 = _820 * _852;
    float _960 = _822 * _852;
    float _962 = _824 * _852;
    float _964 = _820 * _860;
    float _966 = _824 * _860;
    int _968 = _474 + 16;
    uint _970 = uint(int(uint(_968) >> uint(2)));
    uint _972 = uint(int(uint(int(_970)) >> uint(2)));
    int _974 = int(_970) & 3;
    float _976 = (*spvDescriptorSet0.cp_c6)._m0[int(_972)][_974];
    int _978 = int(_970) + 1;
    uint _980 = uint(int(uint(_978) >> uint(2)));
    int _982 = _978 & 3;
    float _984 = (*spvDescriptorSet0.cp_c6)._m0[int(_980)][_982];
    float _986 = fma(_826, _874, _958);
    float _988 = fma(_828, _874, _960);
    float _990 = fma(_830, _874, _962);
    float _992 = _822 * _860;
    float _994 = fma(_826, _882, _964);
    int _996 = _474 + 32;
    uint _998 = uint(int(uint(_996) >> uint(2)));
    uint _1000 = uint(int(uint(int(_998)) >> uint(2)));
    int _1002 = int(_998) & 3;
    float _1004 = (*spvDescriptorSet0.cp_c6)._m0[int(_1000)][_1002];
    int _1006 = int(_998) + 1;
    uint _1008 = uint(int(uint(_1006) >> uint(2)));
    int _1010 = _1006 & 3;
    float _1012 = (*spvDescriptorSet0.cp_c6)._m0[int(_1008)][_1010];
    float _1014 = fma(_830, _882, _966);
    float _1016 = fma(_828, _882, _992);
    float _1018 = _820 * _894;
    float _1020 = _822 * _894;
    float _1022 = _820 * _902;
    float _1024 = _822 * _902;
    float _1026 = _824 * _894;
    int _1028 = _474 + 48;
    uint _1030 = uint(int(uint(_1028) >> uint(2)));
    uint _1032 = uint(int(uint(int(_1030)) >> uint(2)));
    int _1034 = int(_1030) & 3;
    float _1036 = (*spvDescriptorSet0.cp_c6)._m0[int(_1032)][_1034];
    int _1038 = int(_1030) + 1;
    uint _1040 = uint(int(uint(_1038) >> uint(2)));
    int _1042 = _1038 & 3;
    float _1044 = (*spvDescriptorSet0.cp_c6)._m0[int(_1040)][_1042];
    float _1046 = _824 * _902;
    float _1048 = fma(_826, _912, _1018);
    float _1050 = fma(_828, _912, _1020);
    float _1052 = fma(_826, _920, _1022);
    float _1054 = fma(_828, _920, _1024);
    float _1056 = fma(_830, _912, _1026);
    int _1058 = _474 + 24;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    uint _1062 = uint(int(uint(int(_1060)) >> uint(2)));
    int _1064 = int(_1060) & 3;
    float _1066 = (*spvDescriptorSet0.cp_c6)._m0[int(_1062)][_1064];
    int _1068 = int(_1060) + 1;
    uint _1070 = uint(int(uint(_1068) >> uint(2)));
    int _1072 = _1068 & 3;
    float _1074 = (*spvDescriptorSet0.cp_c6)._m0[int(_1070)][_1072];
    float _1076 = fma(_830, _920, _1046);
    float _1078 = fma(_832, _930, _986);
    float _1080 = fma(_832, _938, _994);
    float _1082 = fma(_834, _930, _988);
    float _1084 = fma(_834, _938, _1016);
    float _1086 = fma(_836, _930, _990);
    int _1088 = _474 + 40;
    uint _1090 = uint(int(uint(_1088) >> uint(2)));
    uint _1092 = uint(int(uint(int(_1090)) >> uint(2)));
    int _1094 = int(_1090) & 3;
    float _1096 = (*spvDescriptorSet0.cp_c6)._m0[int(_1092)][_1094];
    int _1098 = int(_1090) + 1;
    uint _1100 = uint(int(uint(_1098) >> uint(2)));
    int _1102 = _1098 & 3;
    float _1104 = (*spvDescriptorSet0.cp_c6)._m0[int(_1100)][_1102];
    float _1106 = fma(_836, _938, _1014);
    float _1108 = fma(_832, _948, _1048);
    float _1110 = fma(_834, _956, _1054);
    float _1112 = fma(_832, _956, _1052);
    float _1114 = fma(_836, _956, _1076);
    float _1116 = fma(_834, _948, _1050);
    int _1118 = _474 + 56;
    uint _1120 = uint(int(uint(_1118) >> uint(2)));
    uint _1122 = uint(int(uint(int(_1120)) >> uint(2)));
    int _1124 = int(_1120) & 3;
    float _1126 = (*spvDescriptorSet0.cp_c6)._m0[int(_1122)][_1124];
    int _1128 = int(_1120) + 1;
    uint _1130 = uint(int(uint(_1128) >> uint(2)));
    int _1132 = _1128 & 3;
    float _1134 = (*spvDescriptorSet0.cp_c6)._m0[int(_1130)][_1132];
    float _1136 = _1110 + _838;
    float _1138 = fma(_836, _948, _1056);
    float _1140 = _1114 + _840;
    float _1142 = _1112 + _842;
    float _1144 = _1082 * _984;
    float _1146 = _1084 * _984;
    float _1148 = _1116 * _984;
    float _1150 = _1136 * _984;
    float _1152 = fma(_1078, _976, _1144);
    float _1154 = fma(_1080, _976, _1146);
    float _1156 = fma(_1108, _976, _1148);
    float _1158 = fma(_1142, _976, _1150);
    float _1160 = _1136 * _1012;
    float _1162 = _1082 * _1012;
    float _1164 = _1084 * _1012;
    float _1166 = _1116 * _1012;
    float _1168 = fma(_1142, _1004, _1160);
    float _1170 = fma(_1078, _1004, _1162);
    float _1172 = fma(_1080, _1004, _1164);
    float _1174 = fma(_1108, _1004, _1166);
    float _1176 = _1136 * _1044;
    float _1178 = _1082 * _1044;
    float _1180 = _1084 * _1044;
    float _1182 = _1116 * _1044;
    float _1184 = fma(_1142, _1036, _1176);
    float _1186 = fma(_1078, _1036, _1178);
    float _1188 = fma(_1080, _1036, _1180);
    float _1190 = fma(_1108, _1036, _1182);
    float _1192 = fma(_1140, _1066, _1158);
    float _1194 = fma(_1086, _1066, _1152);
    float _1196 = fma(_1106, _1066, _1154);
    float _1198 = fma(_1138, _1066, _1156);
    float _1200 = _1192 + _1074;
    float _1202 = fma(_1140, _1096, _1168);
    float _1204 = fma(_1086, _1096, _1170);
    float _1206 = fma(_1106, _1096, _1172);
    int _1208 = _884 + 16;
    float _1210 = fma(_1138, _1096, _1174);
    float _1212 = _1202 + _1104;
    int _1214 = _884 + 32;
    float _1216 = fma(_1140, _1126, _1184);
    float _1218 = fma(_1086, _1126, _1186);
    float _1220 = fma(_1106, _1126, _1188);
    float _1222 = fma(_1138, _1126, _1190);
    float _1224 = _1216 + _1134;
    int _1226 = _884 + 48;
    uint _1228 = uint(int(uint(_1208) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1228)] = as_type<uint>(_1194);
    int _1230 = _1208 + 4;
    uint _1232 = uint(int(uint(_1230) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1232)] = as_type<uint>(_1196);
    int _1234 = _1208 + 8;
    uint _1236 = uint(int(uint(_1234) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1236)] = as_type<uint>(_1198);
    int _1238 = _1208 + 12;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1240)] = as_type<uint>(_1200);
    uint _1242 = uint(int(uint(_1214) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1242)] = as_type<uint>(_1204);
    int _1244 = _1214 + 4;
    uint _1246 = uint(int(uint(_1244) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1246)] = as_type<uint>(_1206);
    int _1248 = _1214 + 8;
    uint _1250 = uint(int(uint(_1248) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1250)] = as_type<uint>(_1210);
    int _1252 = _1214 + 12;
    uint _1254 = uint(int(uint(_1252) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1254)] = as_type<uint>(_1212);
    uint _1256 = uint(int(uint(_1226) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1256)] = as_type<uint>(_1218);
    int _1258 = _1226 + 4;
    uint _1260 = uint(int(uint(_1258) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1260)] = as_type<uint>(_1220);
    int _1262 = _1226 + 8;
    uint _1264 = uint(int(uint(_1262) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1264)] = as_type<uint>(_1222);
    int _1266 = _1226 + 12;
    uint _1268 = uint(int(uint(_1266) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1268)] = as_type<uint>(_1224);
}

