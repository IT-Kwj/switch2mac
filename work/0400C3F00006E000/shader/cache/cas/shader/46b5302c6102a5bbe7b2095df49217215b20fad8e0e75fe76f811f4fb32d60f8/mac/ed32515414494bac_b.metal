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
    texture2d_array<float, access::write> cp_i_tcb_4E_ [[id(4)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _789, thread const int& _790, constant _10& support_buffer)
{
    int _793 = 1 + _790;
    float _795 = support_buffer._m5[_793].x;
    bool _797 = _795 == 1.0;
    if (_797)
    {
        return _789;
    }
    float _799 = float(_789);
    float _801 = _799 * _795;
    int _803 = int(_801);
    return _803;
}

static inline __attribute__((always_inline))
int _44(thread const int& _826, thread const int& _827, thread const int& _828, thread int& _829, thread uint& gl_SubgroupInvocationID)
{
    int _832 = _828 & 31;
    uint _834 = uint(int(uint(_828) >> uint(8)));
    int _836 = int(_834) & 31;
    float _838 = as_type<float>(gl_SubgroupInvocationID);
    int _840 = as_type<int>(_838) & _836;
    int _842 = ~_836;
    int _844 = _832 & _842;
    int _846 = _844 | _840;
    int _848 = as_type<int>(_838) ^ _827;
    bool _850 = uint(_848) <= uint(_846);
    _829 = _850 ? (-1) : 0;
    float _852 = spvSubgroupShuffle(as_type<float>(_826), uint(_848));
    uint _854 = uint(_850 ? as_type<int>(_852) : _826);
    return int(_854);
}

static inline __attribute__((always_inline))
int _45(thread const int& _901, thread const int& _902, thread const int& _903, thread int& _904, thread uint& gl_SubgroupInvocationID)
{
    int _907 = _903 & 31;
    uint _909 = uint(int(uint(_903) >> uint(8)));
    int _911 = int(_909) & 31;
    float _913 = as_type<float>(gl_SubgroupInvocationID);
    int _915 = as_type<int>(_913) & _911;
    int _917 = ~_911;
    int _919 = _907 & _917;
    int _921 = _919 | _915;
    int _923 = ~_911;
    int _925 = _902 & _923;
    int _927 = _925 | _915;
    bool _929 = uint(_927) <= uint(_921);
    _904 = _929 ? (-1) : 0;
    float _931 = spvSubgroupShuffle(as_type<float>(_901), uint(_927));
    uint _933 = uint(_929 ? as_type<int>(_931) : _901);
    return int(_933);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _222 = false;
    float _49 = as_type<float>(gl_SubgroupInvocationID);
    float _51 = as_type<float>(gl_WorkGroupID.x);
    float _53 = as_type<float>(gl_LocalInvocationID.x);
    float _55 = as_type<float>(gl_WorkGroupID.y);
    float _57 = as_type<float>(gl_LocalInvocationID.y);
    float _59 = as_type<float>(gl_WorkGroupID.z);
    int _61 = as_type<int>(_49) & 6;
    bool _65 = _61 != 2;
    bool _67 = _61 != 4;
    bool _69 = !_65;
    bool _71 = _67 || _69;
    int _73 = as_type<int>(_51) * 4;
    int _75 = _73 + as_type<int>(_53);
    bool _77 = _61 != 4;
    bool _79 = _77 && _65;
    int _81 = as_type<int>(_55) * 16;
    int _83 = _81 + as_type<int>(_57);
    int _85 = as_type<int>(_57);
    int _87 = _75;
    int _89 = as_type<int>(_53);
    int _91 = _83;
    if (!_65)
    {
        int _93 = _75 + (-2);
        _85 = _93;
    }
    int _95 = _85;
    int _97 = _95;
    if (!_71)
    {
        int _99 = _75 + 2;
        _87 = _99;
    }
    int _101 = _87;
    if (_65)
    {
        int _103 = _83 + (-1);
        _89 = _103;
    }
    int _105 = _89;
    int _107 = _105;
    if (_79)
    {
        _107 = _83;
    }
    int _109 = _107;
    if (!_65)
    {
        int _111 = _83 + 1;
        _91 = _111;
    }
    int _113 = _91;
    int _115 = _113;
    if (_65)
    {
        _97 = _101;
    }
    int _117 = _97;
    if (_65)
    {
        _115 = _109;
    }
    int _119 = _115;
    int _121 = _117 * 2;
    int _123 = _119 * 2;
    int _125 = _121 + 1;
    int _127 = _123 + 1;
    int _129 = _121;
    int _131 = 0;
    int _133 = _42(_129, _131, (*spvDescriptorSet0.support_buffer));
    int _135 = _123;
    int _137 = 0;
    int _139 = _42(_135, _137, (*spvDescriptorSet0.support_buffer));
    int3 _489 = int3(_133, _139, as_type<int>(_59));
    spvImageFence(spvDescriptorSet0.cp_i_tcb_48_);
    float _141 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_489.xy), uint(_489.z)).x;
    int _143 = _125;
    int _145 = 0;
    int _147 = _42(_143, _145, (*spvDescriptorSet0.support_buffer));
    int _149 = _123;
    int _151 = 0;
    int _153 = _42(_149, _151, (*spvDescriptorSet0.support_buffer));
    int3 _501 = int3(_147, _153, as_type<int>(_59));
    spvImageFence(spvDescriptorSet0.cp_i_tcb_48_);
    float _155 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_501.xy), uint(_501.z)).x;
    int _157 = _121;
    int _159 = 0;
    int _161 = _42(_157, _159, (*spvDescriptorSet0.support_buffer));
    int _163 = _127;
    int _165 = 0;
    int _167 = _42(_163, _165, (*spvDescriptorSet0.support_buffer));
    int3 _513 = int3(_161, _167, as_type<int>(_59));
    spvImageFence(spvDescriptorSet0.cp_i_tcb_48_);
    float _169 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_513.xy), uint(_513.z)).x;
    int _171 = _125;
    int _173 = 0;
    int _175 = _42(_171, _173, (*spvDescriptorSet0.support_buffer));
    int _177 = _127;
    int _179 = 0;
    int _181 = _42(_177, _179, (*spvDescriptorSet0.support_buffer));
    int3 _525 = int3(_175, _181, as_type<int>(_59));
    spvImageFence(spvDescriptorSet0.cp_i_tcb_48_);
    float _183 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_525.xy), uint(_525.z)).x;
    float _185 = precise::max(_141, _155);
    float _187 = precise::max(_169, _183);
    float _189 = precise::max(_185, _187);
    int3 _543 = int3(_121, _123, as_type<int>(_59));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_141, _141, _141, _141), uint2(_543.xy), uint(_543.z));
    int3 _554 = int3(_121, _127, as_type<int>(_59));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_155, _155, _155, _155), uint2(_554.xy), uint(_554.z));
    int3 _565 = int3(_125, _123, as_type<int>(_59));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_169, _169, _169, _169), uint2(_565.xy), uint(_565.z));
    int3 _576 = int3(_125, _127, as_type<int>(_59));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_183, _183, _183, _183), uint2(_576.xy), uint(_576.z));
    int3 _587 = int3(_117, _119, as_type<int>(_59));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_189, _189, _189, _189), uint2(_587.xy), uint(_587.z));
    uint _192 = spvSubgroupBallot(true).x;
    bool _194 = int(_192) != (-1);
    float _220;
    if (!_194)
    {
        int _196 = as_type<int>(_189);
        int _198 = 1;
        int _200 = 31;
        int _202;
        int _606 = _44(_196, _198, _200, _202, gl_SubgroupInvocationID);
        int _204 = _606;
        float _206 = precise::max(_189, as_type<float>(_204));
        int _208 = as_type<int>(_206);
        int _210 = 2;
        int _212 = 31;
        int _214;
        int _613 = _44(_208, _210, _212, _214, gl_SubgroupInvocationID);
        int _216 = _613;
        float _218 = precise::max(_206, as_type<float>(_216));
        _220 = _218;
        _222 = true;
    }
    else
    {
        float _224 = as_type<float>(gl_SubgroupLtMask.x);
        int _226 = as_type<int>(_49) & (-4);
        uint _228 = spvSubgroupBallot(true).x;
        uint _230 = min(uint(_226), 32u);
        bool _232 = _230 < 32u;
        int _234 = 15 << int(_230);
        int _236 = _232 ? _234 : 0;
        int _238 = int(_228) & as_type<int>(_224);
        int _240 = _236 & _238;
        int _242 = _236 & int(_228);
        int _244 = int(spvFindUMSB(uint(_240)));
        int _246 = int(spvFindUMSB(uint(_242)));
        uint _248 = min(uint(_244), as_type<uint>(_49));
        int _250 = as_type<int>(_189);
        int _252 = int(_248);
        int _254 = 31;
        int _256;
        int _671 = _45(_250, _252, _254, _256, gl_SubgroupInvocationID);
        int _258 = _671;
        int _260 = int(_248);
        int _262 = int(_248);
        int _264 = 30;
        int _266;
        int _677 = _45(_260, _262, _264, _266, gl_SubgroupInvocationID);
        int _268 = _677;
        float _270 = precise::max(_189, as_type<float>(_258));
        int _272 = as_type<int>(_270);
        int _274 = _268;
        int _276 = 31;
        int _278;
        int _685 = _45(_272, _274, _276, _278, gl_SubgroupInvocationID);
        int _280 = _685;
        float _282 = precise::max(_270, as_type<float>(_280));
        int _284 = as_type<int>(_282);
        int _286 = _246;
        int _288 = 31;
        int _290;
        int _693 = _45(_284, _286, _288, _290, gl_SubgroupInvocationID);
        int _292 = _693;
        _220 = as_type<float>(_292);
    }
    _222 = false;
    float _294 = _220;
    int _296 = as_type<int>(_49) & 3;
    bool _298 = _296 != 0;
    if (!_298)
    {
        int _300 = _117 >> 31;
        int _302 = _119 >> 31;
        int _304 = _300 & 1;
        int _306 = _302 & 1;
        int _308 = _117 + _304;
        int _310 = _119 + _306;
        int _312 = _308 >> 1;
        int _314 = _310 >> 1;
        int3 _730 = int3(_312, _314, as_type<int>(_59));
        spvDescriptorSet0.cp_i_tcb_4C_.write(float4(_294, _294, _294, _294), uint2(_730.xy), uint(_730.z));
    }
    int _316 = as_type<int>(_294);
    int _318 = 4;
    int _320 = 31;
    int _322;
    int _739 = _44(_316, _318, _320, _322, gl_SubgroupInvocationID);
    int _324 = _739;
    int _326 = as_type<int>(_49) & 15;
    bool _328 = _326 != 0;
    float _330 = precise::max(as_type<float>(_324), _294);
    int _332 = as_type<int>(_330);
    int _334 = 8;
    int _336 = 31;
    int _338;
    int _752 = _44(_332, _334, _336, _338, gl_SubgroupInvocationID);
    int _340 = _752;
    if (_328)
    {
        return;
    }
    int _342 = _117 >> 31;
    int _344 = _119 >> 31;
    int _346 = _342 & 3;
    int _348 = _344 & 3;
    float _350 = precise::max(_330, as_type<float>(_340));
    int _352 = _117 + _346;
    int _354 = _119 + _348;
    int _356 = _352 >> 2;
    int _358 = _354 >> 2;
    int3 _783 = int3(_356, _358, as_type<int>(_59));
    spvDescriptorSet0.cp_i_tcb_4E_.write(float4(_350, _350, _350, _350), uint2(_783.xy), uint(_783.z));
}

