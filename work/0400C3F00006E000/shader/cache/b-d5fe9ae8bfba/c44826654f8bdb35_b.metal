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

template <typename ImageT>
void spvImageFence(ImageT img) { img.fence(); }

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
    texture2d_array<float, access::read_write> cp_i_tcb_48_ [[id(1)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(2)]];
    texture2d_array<float, access::write> cp_i_tcb_4C_ [[id(3)]];
};

static inline __attribute__((always_inline))
int _40(thread const int& _689, thread const int& _690, constant _10& support_buffer)
{
    int _693 = 1 + _690;
    float _695 = support_buffer._m5[_693].x;
    bool _697 = _695 == 1.0;
    if (_697)
    {
        return _689;
    }
    float _699 = float(_689);
    float _701 = _699 * _695;
    int _703 = int(_701);
    return _703;
}

static inline __attribute__((always_inline))
int _42(thread const int& _726, thread const int& _727, thread const int& _728, thread int& _729, thread uint& gl_SubgroupInvocationID)
{
    int _732 = _728 & 31;
    uint _734 = uint(int(uint(_728) >> uint(8)));
    int _736 = int(_734) & 31;
    float _738 = as_type<float>(gl_SubgroupInvocationID);
    int _740 = as_type<int>(_738) & _736;
    int _742 = ~_736;
    int _744 = _732 & _742;
    int _746 = _744 | _740;
    int _748 = as_type<int>(_738) ^ _727;
    bool _750 = uint(_748) <= uint(_746);
    _729 = _750 ? (-1) : 0;
    float _752 = spvSubgroupShuffle(as_type<float>(_726), uint(_748));
    uint _754 = uint(_750 ? as_type<int>(_752) : _726);
    return int(_754);
}

static inline __attribute__((always_inline))
int _43(thread const int& _802, thread const int& _803, thread const int& _804, thread int& _805, thread uint& gl_SubgroupInvocationID)
{
    int _808 = _804 & 31;
    uint _810 = uint(int(uint(_804) >> uint(8)));
    int _812 = int(_810) & 31;
    float _814 = as_type<float>(gl_SubgroupInvocationID);
    int _816 = as_type<int>(_814) & _812;
    int _818 = ~_812;
    int _820 = _808 & _818;
    int _822 = _820 | _816;
    int _824 = ~_812;
    int _826 = _803 & _824;
    int _828 = _826 | _816;
    bool _830 = uint(_828) <= uint(_822);
    _805 = _830 ? (-1) : 0;
    float _832 = spvSubgroupShuffle(as_type<float>(_802), uint(_828));
    uint _834 = uint(_830 ? as_type<int>(_832) : _802);
    return int(_834);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _220 = false;
    float _47 = as_type<float>(gl_SubgroupInvocationID);
    float _49 = as_type<float>(gl_WorkGroupID.x);
    float _51 = as_type<float>(gl_LocalInvocationID.x);
    float _53 = as_type<float>(gl_WorkGroupID.y);
    float _55 = as_type<float>(gl_LocalInvocationID.y);
    float _57 = as_type<float>(gl_WorkGroupID.z);
    int _59 = as_type<int>(_47) & 6;
    bool _63 = _59 != 2;
    bool _65 = _59 != 4;
    bool _67 = !_63;
    bool _69 = _65 || _67;
    int _71 = as_type<int>(_49) * 4;
    int _73 = _71 + as_type<int>(_51);
    bool _75 = _59 != 4;
    bool _77 = _75 && _63;
    int _79 = as_type<int>(_53) * 16;
    int _81 = _79 + as_type<int>(_55);
    int _83 = as_type<int>(_55);
    int _85 = _73;
    int _87 = _59;
    int _89 = _81;
    if (!_63)
    {
        int _91 = _73 + (-2);
        _83 = _91;
    }
    int _93 = _83;
    int _95 = _93;
    if (!_69)
    {
        int _97 = _73 + 2;
        _85 = _97;
    }
    int _99 = _85;
    if (_63)
    {
        int _101 = _81 + (-1);
        _87 = _101;
    }
    int _103 = _87;
    int _105 = _103;
    if (_77)
    {
        _105 = _81;
    }
    int _107 = _105;
    if (!_63)
    {
        int _109 = _81 + 1;
        _89 = _109;
    }
    int _111 = _89;
    int _113 = _111;
    if (_63)
    {
        _95 = _99;
    }
    int _115 = _95;
    if (_63)
    {
        _113 = _107;
    }
    int _117 = _113;
    int _119 = _115 << 1;
    int _121 = _117 * 2;
    int _123 = _119 + 1;
    int _125 = _121 + 1;
    int _127 = _119;
    int _129 = 0;
    int _131 = _40(_127, _129, (*spvDescriptorSet0.support_buffer));
    int _133 = _121;
    int _135 = 0;
    int _137 = _40(_133, _135, (*spvDescriptorSet0.support_buffer));
    int3 _442 = int3(_131, _137, as_type<int>(_57));
    spvImageFence(spvDescriptorSet0.cp_i_tcb_48_);
    float _139 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_442.xy), uint(_442.z)).x;
    int _141 = _123;
    int _143 = 0;
    int _145 = _40(_141, _143, (*spvDescriptorSet0.support_buffer));
    int _147 = _121;
    int _149 = 0;
    int _151 = _40(_147, _149, (*spvDescriptorSet0.support_buffer));
    int3 _454 = int3(_145, _151, as_type<int>(_57));
    spvImageFence(spvDescriptorSet0.cp_i_tcb_48_);
    float _153 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_454.xy), uint(_454.z)).x;
    int _155 = _119;
    int _157 = 0;
    int _159 = _40(_155, _157, (*spvDescriptorSet0.support_buffer));
    int _161 = _125;
    int _163 = 0;
    int _165 = _40(_161, _163, (*spvDescriptorSet0.support_buffer));
    int3 _466 = int3(_159, _165, as_type<int>(_57));
    spvImageFence(spvDescriptorSet0.cp_i_tcb_48_);
    float _167 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_466.xy), uint(_466.z)).x;
    int _169 = _123;
    int _171 = 0;
    int _173 = _40(_169, _171, (*spvDescriptorSet0.support_buffer));
    int _175 = _125;
    int _177 = 0;
    int _179 = _40(_175, _177, (*spvDescriptorSet0.support_buffer));
    int3 _478 = int3(_173, _179, as_type<int>(_57));
    spvImageFence(spvDescriptorSet0.cp_i_tcb_48_);
    float _181 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_478.xy), uint(_478.z)).x;
    float _183 = precise::max(_139, _153);
    float _185 = precise::max(_167, _181);
    float _187 = precise::max(_183, _185);
    int3 _496 = int3(_119, _121, as_type<int>(_57));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_139, _139, _139, _139), uint2(_496.xy), uint(_496.z));
    int3 _507 = int3(_119, _125, as_type<int>(_57));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_153, _153, _153, _153), uint2(_507.xy), uint(_507.z));
    int3 _518 = int3(_123, _121, as_type<int>(_57));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_167, _167, _167, _167), uint2(_518.xy), uint(_518.z));
    int3 _529 = int3(_123, _125, as_type<int>(_57));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_181, _181, _181, _181), uint2(_529.xy), uint(_529.z));
    int3 _540 = int3(_115, _117, as_type<int>(_57));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_187, _187, _187, _187), uint2(_540.xy), uint(_540.z));
    uint _190 = spvSubgroupBallot(true).x;
    bool _192 = int(_190) != (-1);
    float _218;
    if (!_192)
    {
        int _194 = as_type<int>(_187);
        int _196 = 1;
        int _198 = 31;
        int _200;
        int _559 = _42(_194, _196, _198, _200, gl_SubgroupInvocationID);
        int _202 = _559;
        float _204 = precise::max(_187, as_type<float>(_202));
        int _206 = as_type<int>(_204);
        int _208 = 2;
        int _210 = 31;
        int _212;
        int _566 = _42(_206, _208, _210, _212, gl_SubgroupInvocationID);
        int _214 = _566;
        float _216 = precise::max(_204, as_type<float>(_214));
        _218 = _216;
        _220 = true;
    }
    else
    {
        float _222 = as_type<float>(gl_SubgroupLtMask.x);
        int _224 = as_type<int>(_47) & (-4);
        uint _226 = spvSubgroupBallot(true).x;
        uint _228 = min(uint(_224), 32u);
        bool _230 = _228 < 32u;
        int _232 = 15 << int(_228);
        int _234 = _230 ? _232 : 0;
        int _236 = int(_226) & as_type<int>(_222);
        int _238 = _234 & _236;
        int _240 = _234 & int(_226);
        int _242 = int(spvFindUMSB(uint(_238)));
        int _244 = int(spvFindUMSB(uint(_240)));
        uint _246 = min(uint(_242), as_type<uint>(_47));
        int _248 = as_type<int>(_187);
        int _250 = int(_246);
        int _252 = 31;
        int _254;
        int _624 = _43(_248, _250, _252, _254, gl_SubgroupInvocationID);
        int _256 = _624;
        int _258 = int(_246);
        int _260 = int(_246);
        int _262 = 30;
        int _264;
        int _630 = _43(_258, _260, _262, _264, gl_SubgroupInvocationID);
        int _266 = _630;
        float _268 = precise::max(_187, as_type<float>(_256));
        int _270 = as_type<int>(_268);
        int _272 = _266;
        int _274 = 31;
        int _276;
        int _638 = _43(_270, _272, _274, _276, gl_SubgroupInvocationID);
        int _278 = _638;
        float _280 = precise::max(_268, as_type<float>(_278));
        int _282 = as_type<int>(_280);
        int _284 = _244;
        int _286 = 31;
        int _288;
        int _646 = _43(_282, _284, _286, _288, gl_SubgroupInvocationID);
        int _290 = _646;
        _218 = as_type<float>(_290);
    }
    _220 = false;
    float _292 = _218;
    int _294 = as_type<int>(_47) & 3;
    bool _296 = _294 != 0;
    if (_296)
    {
        return;
    }
    int _298 = _115 >> 31;
    int _300 = _117 >> 31;
    int _302 = _298 & 1;
    int _304 = _300 & 1;
    int _306 = _115 + _302;
    int _308 = _117 + _304;
    int _310 = _306 >> 1;
    int _312 = _308 >> 1;
    int3 _683 = int3(_310, _312, as_type<int>(_57));
    spvDescriptorSet0.cp_i_tcb_4C_.write(float4(_292, _292, _292, _292), uint2(_683.xy), uint(_683.z));
}

