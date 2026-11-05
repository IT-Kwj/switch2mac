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
    texture2d<float, access::read_write> cp_i_tcb_48_ [[id(1)]];
    texture2d<float, access::write> cp_i_tcb_4A_ [[id(2)]];
    texture2d<float, access::write> cp_i_tcb_4C_ [[id(3)]];
};

static inline __attribute__((always_inline))
int _40(thread const int& _663, thread const int& _664, constant _10& support_buffer)
{
    int _667 = 1 + _664;
    float _669 = support_buffer._m5[_667].x;
    bool _671 = _669 == 1.0;
    if (_671)
    {
        return _663;
    }
    float _673 = float(_663);
    float _675 = _673 * _669;
    int _677 = int(_675);
    return _677;
}

static inline __attribute__((always_inline))
int _42(thread const int& _700, thread const int& _701, thread const int& _702, thread int& _703, thread uint& gl_SubgroupInvocationID)
{
    int _706 = _702 & 31;
    uint _708 = uint(int(uint(_702) >> uint(8)));
    int _710 = int(_708) & 31;
    float _712 = as_type<float>(gl_SubgroupInvocationID);
    int _714 = as_type<int>(_712) & _710;
    int _716 = ~_710;
    int _718 = _706 & _716;
    int _720 = _718 | _714;
    int _722 = as_type<int>(_712) ^ _701;
    bool _724 = uint(_722) <= uint(_720);
    _703 = _724 ? (-1) : 0;
    float _726 = spvSubgroupShuffle(as_type<float>(_700), uint(_722));
    uint _728 = uint(_724 ? as_type<int>(_726) : _700);
    return int(_728);
}

static inline __attribute__((always_inline))
int _43(thread const int& _776, thread const int& _777, thread const int& _778, thread int& _779, thread uint& gl_SubgroupInvocationID)
{
    int _782 = _778 & 31;
    uint _784 = uint(int(uint(_778) >> uint(8)));
    int _786 = int(_784) & 31;
    float _788 = as_type<float>(gl_SubgroupInvocationID);
    int _790 = as_type<int>(_788) & _786;
    int _792 = ~_786;
    int _794 = _782 & _792;
    int _796 = _794 | _790;
    int _798 = ~_786;
    int _800 = _777 & _798;
    int _802 = _800 | _790;
    bool _804 = uint(_802) <= uint(_796);
    _779 = _804 ? (-1) : 0;
    float _806 = spvSubgroupShuffle(as_type<float>(_776), uint(_802));
    uint _808 = uint(_804 ? as_type<int>(_806) : _776);
    return int(_808);
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
    int _81 = _57;
    int _83 = _71;
    int _85 = as_type<int>(_55);
    if (!_61)
    {
        int _87 = _71 + (-2);
        _81 = _87;
    }
    int _89 = _81;
    int _91 = _89;
    if (!_67)
    {
        int _93 = _71 + 2;
        _83 = _93;
    }
    int _95 = _83;
    if (_61)
    {
        int _97 = _79 + (-1);
        _85 = _97;
    }
    int _99 = _85;
    int _101 = _99;
    if (_75)
    {
        _101 = _79;
    }
    int _103 = _101;
    int _105 = 0;
    if (!_61)
    {
        int _107 = _79 + 1;
        _105 = _107;
    }
    int _109 = _105;
    int _111 = _109;
    if (_61)
    {
        _91 = _95;
    }
    int _113 = _91;
    if (_61)
    {
        _111 = _103;
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
    spvImageFence(spvDescriptorSet0.cp_i_tcb_48_);
    float _137 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_129, _135))).x;
    int _139 = _121;
    int _141 = 0;
    int _143 = _40(_139, _141, (*spvDescriptorSet0.support_buffer));
    int _145 = _119;
    int _147 = 0;
    int _149 = _40(_145, _147, (*spvDescriptorSet0.support_buffer));
    spvImageFence(spvDescriptorSet0.cp_i_tcb_48_);
    float _151 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_143, _149))).x;
    int _153 = _117;
    int _155 = 0;
    int _157 = _40(_153, _155, (*spvDescriptorSet0.support_buffer));
    int _159 = _123;
    int _161 = 0;
    int _163 = _40(_159, _161, (*spvDescriptorSet0.support_buffer));
    spvImageFence(spvDescriptorSet0.cp_i_tcb_48_);
    float _165 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_157, _163))).x;
    int _167 = _121;
    int _169 = 0;
    int _171 = _40(_167, _169, (*spvDescriptorSet0.support_buffer));
    int _173 = _123;
    int _175 = 0;
    int _177 = _40(_173, _175, (*spvDescriptorSet0.support_buffer));
    spvImageFence(spvDescriptorSet0.cp_i_tcb_48_);
    float _179 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_171, _177))).x;
    float _181 = precise::max(_137, _151);
    float _183 = precise::max(_165, _179);
    float _185 = precise::max(_181, _183);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_137, _137, _137, _137), uint2(int2(_117, _119)));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_151, _151, _151, _151), uint2(int2(_117, _123)));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_165, _165, _165, _165), uint2(int2(_121, _119)));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_179, _179, _179, _179), uint2(int2(_121, _123)));
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
        int _535 = _42(_192, _194, _196, _198, gl_SubgroupInvocationID);
        int _200 = _535;
        float _202 = precise::max(_185, as_type<float>(_200));
        int _204 = as_type<int>(_202);
        int _206 = 2;
        int _208 = 31;
        int _210;
        int _542 = _42(_204, _206, _208, _210, gl_SubgroupInvocationID);
        int _212 = _542;
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
        int _600 = _43(_246, _248, _250, _252, gl_SubgroupInvocationID);
        int _254 = _600;
        int _256 = int(_244);
        int _258 = int(_244);
        int _260 = 30;
        int _262;
        int _606 = _43(_256, _258, _260, _262, gl_SubgroupInvocationID);
        int _264 = _606;
        float _266 = precise::max(_185, as_type<float>(_254));
        int _268 = as_type<int>(_266);
        int _270 = _264;
        int _272 = 31;
        int _274;
        int _614 = _43(_268, _270, _272, _274, gl_SubgroupInvocationID);
        int _276 = _614;
        float _278 = precise::max(_266, as_type<float>(_276));
        int _280 = as_type<int>(_278);
        int _282 = _242;
        int _284 = 31;
        int _286;
        int _622 = _43(_280, _282, _284, _286, gl_SubgroupInvocationID);
        int _288 = _622;
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

