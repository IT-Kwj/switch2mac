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
    texture2d<float, access::write> cp_i_tcb_4E_ [[id(4)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _760, thread const int& _761, constant _10& support_buffer)
{
    int _764 = 1 + _761;
    float _766 = support_buffer._m5[_764].x;
    bool _768 = _766 == 1.0;
    if (_768)
    {
        return _760;
    }
    float _770 = float(_760);
    float _772 = _770 * _766;
    int _774 = int(_772);
    return _774;
}

static inline __attribute__((always_inline))
int _44(thread const int& _797, thread const int& _798, thread const int& _799, thread int& _800, thread uint& gl_SubgroupInvocationID)
{
    int _803 = _799 & 31;
    uint _805 = uint(int(uint(_799) >> uint(8)));
    int _807 = int(_805) & 31;
    float _809 = as_type<float>(gl_SubgroupInvocationID);
    int _811 = as_type<int>(_809) & _807;
    int _813 = ~_807;
    int _815 = _803 & _813;
    int _817 = _815 | _811;
    int _819 = as_type<int>(_809) ^ _798;
    bool _821 = uint(_819) <= uint(_817);
    _800 = _821 ? (-1) : 0;
    float _823 = spvSubgroupShuffle(as_type<float>(_797), uint(_819));
    uint _825 = uint(_821 ? as_type<int>(_823) : _797);
    return int(_825);
}

static inline __attribute__((always_inline))
int _45(thread const int& _872, thread const int& _873, thread const int& _874, thread int& _875, thread uint& gl_SubgroupInvocationID)
{
    int _878 = _874 & 31;
    uint _880 = uint(int(uint(_874) >> uint(8)));
    int _882 = int(_880) & 31;
    float _884 = as_type<float>(gl_SubgroupInvocationID);
    int _886 = as_type<int>(_884) & _882;
    int _888 = ~_882;
    int _890 = _878 & _888;
    int _892 = _890 | _886;
    int _894 = ~_882;
    int _896 = _873 & _894;
    int _898 = _896 | _886;
    bool _900 = uint(_898) <= uint(_892);
    _875 = _900 ? (-1) : 0;
    float _902 = spvSubgroupShuffle(as_type<float>(_872), uint(_898));
    uint _904 = uint(_900 ? as_type<int>(_902) : _872);
    return int(_904);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _220 = false;
    float _49 = as_type<float>(gl_SubgroupInvocationID);
    float _51 = as_type<float>(gl_WorkGroupID.x);
    float _53 = as_type<float>(gl_LocalInvocationID.x);
    float _55 = as_type<float>(gl_WorkGroupID.y);
    float _57 = as_type<float>(gl_LocalInvocationID.y);
    int _59 = as_type<int>(_49) & 6;
    bool _63 = _59 != 2;
    bool _65 = _59 != 4;
    bool _67 = !_63;
    bool _69 = _65 || _67;
    int _71 = as_type<int>(_51) * 4;
    int _73 = _71 + as_type<int>(_53);
    bool _75 = _59 != 4;
    bool _77 = _75 && _63;
    int _79 = as_type<int>(_55) * 16;
    int _81 = _79 + as_type<int>(_57);
    int _83 = _59;
    int _85 = as_type<int>(_57);
    int _87 = _73;
    if (!_63)
    {
        int _89 = _73 + (-2);
        _83 = _89;
    }
    int _91 = _83;
    int _93 = _91;
    if (_63)
    {
        int _95 = _81 + (-1);
        _85 = _95;
    }
    int _97 = _85;
    int _99 = _97;
    if (!_69)
    {
        int _101 = _73 + 2;
        _87 = _101;
    }
    int _103 = _87;
    if (_77)
    {
        _99 = _81;
    }
    int _105 = _99;
    int _107 = 0;
    if (!_63)
    {
        int _109 = _81 + 1;
        _107 = _109;
    }
    int _111 = _107;
    int _113 = _111;
    if (_63)
    {
        _93 = _103;
    }
    int _115 = _93;
    if (_63)
    {
        _113 = _105;
    }
    int _117 = _113;
    int _119 = _115 * 2;
    int _121 = _117 * 2;
    int _123 = _119 + 1;
    int _125 = _121 + 1;
    int _127 = _119;
    int _129 = 0;
    int _131 = _42(_127, _129, (*spvDescriptorSet0.support_buffer));
    int _133 = _121;
    int _135 = 0;
    int _137 = _42(_133, _135, (*spvDescriptorSet0.support_buffer));
    spvImageFence(spvDescriptorSet0.cp_i_tcb_48_);
    float _139 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_131, _137))).x;
    int _141 = _123;
    int _143 = 0;
    int _145 = _42(_141, _143, (*spvDescriptorSet0.support_buffer));
    int _147 = _121;
    int _149 = 0;
    int _151 = _42(_147, _149, (*spvDescriptorSet0.support_buffer));
    spvImageFence(spvDescriptorSet0.cp_i_tcb_48_);
    float _153 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_145, _151))).x;
    int _155 = _119;
    int _157 = 0;
    int _159 = _42(_155, _157, (*spvDescriptorSet0.support_buffer));
    int _161 = _125;
    int _163 = 0;
    int _165 = _42(_161, _163, (*spvDescriptorSet0.support_buffer));
    spvImageFence(spvDescriptorSet0.cp_i_tcb_48_);
    float _167 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_159, _165))).x;
    int _169 = _123;
    int _171 = 0;
    int _173 = _42(_169, _171, (*spvDescriptorSet0.support_buffer));
    int _175 = _125;
    int _177 = 0;
    int _179 = _42(_175, _177, (*spvDescriptorSet0.support_buffer));
    spvImageFence(spvDescriptorSet0.cp_i_tcb_48_);
    float _181 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_173, _179))).x;
    float _183 = precise::max(_139, _153);
    float _185 = precise::max(_167, _181);
    float _187 = precise::max(_183, _185);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_139, _139, _139, _139), uint2(int2(_119, _121)));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_153, _153, _153, _153), uint2(int2(_119, _125)));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_167, _167, _167, _167), uint2(int2(_123, _121)));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_181, _181, _181, _181), uint2(int2(_123, _125)));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_187, _187, _187, _187), uint2(int2(_115, _117)));
    uint _190 = spvSubgroupBallot(true).x;
    bool _192 = int(_190) != (-1);
    float _218;
    if (!_192)
    {
        int _194 = as_type<int>(_187);
        int _196 = 1;
        int _198 = 31;
        int _200;
        int _581 = _44(_194, _196, _198, _200, gl_SubgroupInvocationID);
        int _202 = _581;
        float _204 = precise::max(_187, as_type<float>(_202));
        int _206 = as_type<int>(_204);
        int _208 = 2;
        int _210 = 31;
        int _212;
        int _588 = _44(_206, _208, _210, _212, gl_SubgroupInvocationID);
        int _214 = _588;
        float _216 = precise::max(_204, as_type<float>(_214));
        _218 = _216;
        _220 = true;
    }
    else
    {
        float _222 = as_type<float>(gl_SubgroupLtMask.x);
        int _224 = as_type<int>(_49) & (-4);
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
        uint _246 = min(uint(_242), as_type<uint>(_49));
        int _248 = as_type<int>(_187);
        int _250 = int(_246);
        int _252 = 31;
        int _254;
        int _646 = _45(_248, _250, _252, _254, gl_SubgroupInvocationID);
        int _256 = _646;
        int _258 = int(_246);
        int _260 = int(_246);
        int _262 = 30;
        int _264;
        int _652 = _45(_258, _260, _262, _264, gl_SubgroupInvocationID);
        int _266 = _652;
        float _268 = precise::max(_187, as_type<float>(_256));
        int _270 = as_type<int>(_268);
        int _272 = _266;
        int _274 = 31;
        int _276;
        int _660 = _45(_270, _272, _274, _276, gl_SubgroupInvocationID);
        int _278 = _660;
        float _280 = precise::max(_268, as_type<float>(_278));
        int _282 = as_type<int>(_280);
        int _284 = _244;
        int _286 = 31;
        int _288;
        int _668 = _45(_282, _284, _286, _288, gl_SubgroupInvocationID);
        int _290 = _668;
        _218 = as_type<float>(_290);
    }
    _220 = false;
    float _292 = _218;
    int _294 = as_type<int>(_49) & 3;
    bool _296 = _294 != 0;
    if (!_296)
    {
        int _298 = _115 >> 31;
        int _300 = _117 >> 31;
        int _302 = _298 & 1;
        int _304 = _300 & 1;
        int _306 = _115 + _302;
        int _308 = _117 + _304;
        int _310 = _306 >> 1;
        int _312 = _308 >> 1;
        spvDescriptorSet0.cp_i_tcb_4C_.write(float4(_292, _292, _292, _292), uint2(int2(_310, _312)));
    }
    int _314 = as_type<int>(_292);
    int _316 = 4;
    int _318 = 31;
    int _320;
    int _712 = _44(_314, _316, _318, _320, gl_SubgroupInvocationID);
    int _322 = _712;
    int _324 = as_type<int>(_49) & 15;
    bool _326 = _324 != 0;
    float _328 = precise::max(as_type<float>(_322), _292);
    int _330 = as_type<int>(_328);
    int _332 = 8;
    int _334 = 31;
    int _336;
    int _725 = _44(_330, _332, _334, _336, gl_SubgroupInvocationID);
    int _338 = _725;
    if (_326)
    {
        return;
    }
    int _340 = _115 >> 31;
    int _342 = _117 >> 31;
    float _344 = precise::max(_328, as_type<float>(_338));
    int _346 = _340 & 3;
    int _348 = _342 & 3;
    int _350 = _115 + _346;
    int _352 = _117 + _348;
    int _354 = _350 >> 2;
    int _356 = _352 >> 2;
    spvDescriptorSet0.cp_i_tcb_4E_.write(float4(_344, _344, _344, _344), uint2(int2(_354, _356)));
}

