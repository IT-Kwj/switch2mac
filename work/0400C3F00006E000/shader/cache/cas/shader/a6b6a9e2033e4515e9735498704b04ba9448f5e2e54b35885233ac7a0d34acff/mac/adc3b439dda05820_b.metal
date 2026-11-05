#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

// Implementation of the unsigned GLSL findMSB() function
template<typename T>
inline T spvFindUMSB(T x)
{
    return select(clz(T(0)) - (clz(x) + T(1)), T(-1), x == T(0));
}

inline uint4 spvSubgroupBallot(bool value)
{
    simd_vote vote = simd_ballot(value);
    // simd_ballot() returns a 64-bit integer-like object, but
    // SPIR-V callers expect a uint4. We must convert.
    // FIXME: This won't include higher bits if Apple ever supports
    // 128 lanes in an SIMD-group.
    return uint4(as_type<uint2>((simd_vote::vote_t)vote), 0, 0);
}

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

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    texture2d<float> cp_i_tcb_48_ [[id(1)]];
    texture2d<float, access::write> cp_i_tcb_4A_ [[id(2)]];
    texture2d<float, access::write> cp_i_tcb_4C_ [[id(3)]];
};

static inline __attribute__((always_inline))
int _40(thread const int& _629, thread const int& _630, constant _10& support_buffer)
{
    int _633 = 1 + _630;
    float _635 = support_buffer._m5[_633].x;
    bool _637 = _635 == 1.0;
    if (_637)
    {
        return _629;
    }
    float _639 = float(_629);
    float _641 = _639 * _635;
    int _643 = int(_641);
    return _643;
}

static inline __attribute__((always_inline))
int _42(thread const int& _666, thread const int& _667, thread const int& _668, thread int& _669, thread uint& gl_SubgroupInvocationID)
{
    int _672 = _668 & 31;
    uint _674 = uint(int(uint(_668) >> uint(8)));
    int _676 = int(_674) & 31;
    float _678 = as_type<float>(gl_SubgroupInvocationID);
    int _680 = as_type<int>(_678) & _676;
    int _682 = ~_676;
    int _684 = _672 & _682;
    int _686 = _684 | _680;
    int _688 = as_type<int>(_678) ^ _667;
    bool _690 = uint(_688) <= uint(_686);
    _669 = _690 ? (-1) : 0;
    float _692 = spvSubgroupShuffle(as_type<float>(_666), uint(_688));
    uint _694 = uint(_690 ? as_type<int>(_692) : _666);
    return int(_694);
}

static inline __attribute__((always_inline))
int _43(thread const int& _742, thread const int& _743, thread const int& _744, thread int& _745, thread uint& gl_SubgroupInvocationID)
{
    int _748 = _744 & 31;
    uint _750 = uint(int(uint(_744) >> uint(8)));
    int _752 = int(_750) & 31;
    float _754 = as_type<float>(gl_SubgroupInvocationID);
    int _756 = as_type<int>(_754) & _752;
    int _758 = ~_752;
    int _760 = _748 & _758;
    int _762 = _760 | _756;
    int _764 = ~_752;
    int _766 = _743 & _764;
    int _768 = _766 | _756;
    bool _770 = uint(_768) <= uint(_762);
    _745 = _770 ? (-1) : 0;
    float _772 = spvSubgroupShuffle(as_type<float>(_742), uint(_768));
    uint _774 = uint(_770 ? as_type<int>(_772) : _742);
    return int(_774);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _218 = false;
    float _47 = as_type<float>(gl_SubgroupInvocationID);
    float _49 = as_type<float>(gl_WorkGroupID.x);
    float _51 = as_type<float>(gl_LocalInvocationID.x);
    float _53 = as_type<float>(gl_WorkGroupID.y);
    float _55 = as_type<float>(gl_LocalInvocationID.y);
    int _57 = as_type<int>(_47) & 6;
    bool _61 = _57 != 2;
    bool _63 = _57 != 4;
    bool _65 = !_61;
    bool _67 = _63 || _65;
    int _69 = as_type<int>(_49) * 4;
    int _71 = _69 + as_type<int>(_51);
    bool _73 = _57 != 4;
    bool _75 = _73 && _61;
    int _77 = as_type<int>(_53) * 16;
    int _79 = _77 + as_type<int>(_55);
    int _81 = as_type<int>(_55);
    int _83 = _57;
    int _85 = _71;
    int _87 = as_type<int>(_51);
    if (!_61)
    {
        int _89 = _71 + (-2);
        _81 = _89;
    }
    int _91 = _81;
    int _93 = _91;
    if (_61)
    {
        int _95 = _79 + (-1);
        _83 = _95;
    }
    int _97 = _83;
    int _99 = _97;
    if (!_67)
    {
        int _101 = _71 + 2;
        _85 = _101;
    }
    int _103 = _85;
    if (_75)
    {
        _99 = _79;
    }
    int _105 = _99;
    if (!_61)
    {
        int _107 = _79 + 1;
        _87 = _107;
    }
    int _109 = _87;
    int _111 = _109;
    if (_61)
    {
        _93 = _103;
    }
    int _113 = _93;
    if (_61)
    {
        _111 = _105;
    }
    int _115 = _111;
    int _117 = _113 * 2;
    int _119 = _115 * 2;
    int _121 = _117 + 1;
    int _123 = _119 + 1;
    int _125 = _117;
    int _127 = 0;
    int _129 = _40(_125, _127, (*spvDescriptorSet0.support_buffer));
    int _131 = _119;
    int _133 = 0;
    int _135 = _40(_131, _133, (*spvDescriptorSet0.support_buffer));
    float _137 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_129, _135))).x;
    int _139 = _117;
    int _141 = 0;
    int _143 = _40(_139, _141, (*spvDescriptorSet0.support_buffer));
    int _145 = _123;
    int _147 = 0;
    int _149 = _40(_145, _147, (*spvDescriptorSet0.support_buffer));
    float _151 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_143, _149))).x;
    int _153 = _121;
    int _155 = 0;
    int _157 = _40(_153, _155, (*spvDescriptorSet0.support_buffer));
    int _159 = _119;
    int _161 = 0;
    int _163 = _40(_159, _161, (*spvDescriptorSet0.support_buffer));
    float _165 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_157, _163))).x;
    int _167 = _121;
    int _169 = 0;
    int _171 = _40(_167, _169, (*spvDescriptorSet0.support_buffer));
    int _173 = _123;
    int _175 = 0;
    int _177 = _40(_173, _175, (*spvDescriptorSet0.support_buffer));
    float _179 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_171, _177))).x;
    float _181 = precise::max(_137, _165);
    float _183 = precise::max(_151, _179);
    float _185 = precise::max(_181, _183);
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_185, _185, _185, _185), uint2(int2(_113, _115)));
    uint _188 = spvSubgroupBallot(true).x;
    bool _190 = int(_188) != (-1);
    float _216;
    if (!_190)
    {
        int _192 = as_type<int>(_185);
        int _194 = 1;
        int _196 = 31;
        int _198;
        int _501 = _42(_192, _194, _196, _198, gl_SubgroupInvocationID);
        int _200 = _501;
        float _202 = precise::max(_185, as_type<float>(_200));
        int _204 = as_type<int>(_202);
        int _206 = 2;
        int _208 = 31;
        int _210;
        int _508 = _42(_204, _206, _208, _210, gl_SubgroupInvocationID);
        int _212 = _508;
        float _214 = precise::max(_202, as_type<float>(_212));
        _216 = _214;
        _218 = true;
    }
    else
    {
        float _220 = as_type<float>(gl_SubgroupLtMask.x);
        int _222 = as_type<int>(_47) & (-4);
        uint _224 = spvSubgroupBallot(true).x;
        uint _226 = min(uint(_222), 32u);
        bool _228 = _226 < 32u;
        int _230 = 15 << int(_226);
        int _232 = _228 ? _230 : 0;
        int _234 = int(_224) & as_type<int>(_220);
        int _236 = _232 & _234;
        int _238 = _232 & int(_224);
        int _240 = int(spvFindUMSB(uint(_236)));
        int _242 = int(spvFindUMSB(uint(_238)));
        uint _244 = min(uint(_240), as_type<uint>(_47));
        int _246 = as_type<int>(_185);
        int _248 = int(_244);
        int _250 = 31;
        int _252;
        int _566 = _43(_246, _248, _250, _252, gl_SubgroupInvocationID);
        int _254 = _566;
        int _256 = int(_244);
        int _258 = int(_244);
        int _260 = 30;
        int _262;
        int _572 = _43(_256, _258, _260, _262, gl_SubgroupInvocationID);
        int _264 = _572;
        float _266 = precise::max(_185, as_type<float>(_254));
        int _268 = as_type<int>(_266);
        int _270 = _264;
        int _272 = 31;
        int _274;
        int _580 = _43(_268, _270, _272, _274, gl_SubgroupInvocationID);
        int _276 = _580;
        float _278 = precise::max(_266, as_type<float>(_276));
        int _280 = as_type<int>(_278);
        int _282 = _242;
        int _284 = 31;
        int _286;
        int _588 = _43(_280, _282, _284, _286, gl_SubgroupInvocationID);
        int _288 = _588;
        _216 = as_type<float>(_288);
    }
    _218 = false;
    float _290 = _216;
    int _292 = as_type<int>(_47) & 3;
    bool _294 = _292 != 0;
    if (_294)
    {
        return;
    }
    int _296 = _113 >> 31;
    int _298 = _115 >> 31;
    int _300 = _296 & 1;
    int _302 = _298 & 1;
    int _304 = _113 + _300;
    int _306 = _115 + _302;
    int _308 = _304 >> 1;
    int _310 = _306 >> 1;
    spvDescriptorSet0.cp_i_tcb_4C_.write(float4(_290, _290, _290, _290), uint2(int2(_308, _310)));
}

