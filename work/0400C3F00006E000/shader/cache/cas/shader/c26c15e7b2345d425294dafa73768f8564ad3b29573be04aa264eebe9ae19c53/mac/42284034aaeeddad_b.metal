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
    texture2d<float, access::write> cp_i_tcb_4E_ [[id(4)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _730, thread const int& _731, constant _10& support_buffer)
{
    int _734 = 1 + _731;
    float _736 = support_buffer._m5[_734].x;
    bool _738 = _736 == 1.0;
    if (_738)
    {
        return _730;
    }
    float _740 = float(_730);
    float _742 = _740 * _736;
    int _744 = int(_742);
    return _744;
}

static inline __attribute__((always_inline))
int _44(thread const int& _767, thread const int& _768, thread const int& _769, thread int& _770, thread uint& gl_SubgroupInvocationID)
{
    int _773 = _769 & 31;
    uint _775 = uint(int(uint(_769) >> uint(8)));
    int _777 = int(_775) & 31;
    float _779 = as_type<float>(gl_SubgroupInvocationID);
    int _781 = as_type<int>(_779) & _777;
    int _783 = ~_777;
    int _785 = _773 & _783;
    int _787 = _785 | _781;
    int _789 = as_type<int>(_779) ^ _768;
    bool _791 = uint(_789) <= uint(_787);
    _770 = _791 ? (-1) : 0;
    float _793 = spvSubgroupShuffle(as_type<float>(_767), uint(_789));
    uint _795 = uint(_791 ? as_type<int>(_793) : _767);
    return int(_795);
}

static inline __attribute__((always_inline))
int _45(thread const int& _842, thread const int& _843, thread const int& _844, thread int& _845, thread uint& gl_SubgroupInvocationID)
{
    int _848 = _844 & 31;
    uint _850 = uint(int(uint(_844) >> uint(8)));
    int _852 = int(_850) & 31;
    float _854 = as_type<float>(gl_SubgroupInvocationID);
    int _856 = as_type<int>(_854) & _852;
    int _858 = ~_852;
    int _860 = _848 & _858;
    int _862 = _860 | _856;
    int _864 = ~_852;
    int _866 = _843 & _864;
    int _868 = _866 | _856;
    bool _870 = uint(_868) <= uint(_862);
    _845 = _870 ? (-1) : 0;
    float _872 = spvSubgroupShuffle(as_type<float>(_842), uint(_868));
    uint _874 = uint(_870 ? as_type<int>(_872) : _842);
    return int(_874);
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
    int _83 = as_type<int>(_57);
    int _85 = _59;
    int _87 = _73;
    int _89 = as_type<int>(_53);
    if (!_63)
    {
        int _91 = _73 + (-2);
        _83 = _91;
    }
    int _93 = _83;
    int _95 = _93;
    if (_63)
    {
        int _97 = _81 + (-1);
        _85 = _97;
    }
    int _99 = _85;
    int _101 = _99;
    if (!_69)
    {
        int _103 = _73 + 2;
        _87 = _103;
    }
    int _105 = _87;
    if (_77)
    {
        _101 = _81;
    }
    int _107 = _101;
    if (!_63)
    {
        int _109 = _81 + 1;
        _89 = _109;
    }
    int _111 = _89;
    int _113 = _111;
    if (_63)
    {
        _95 = _105;
    }
    int _115 = _95;
    if (_63)
    {
        _113 = _107;
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
    float _139 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_131, _137))).x;
    int _141 = _119;
    int _143 = 0;
    int _145 = _42(_141, _143, (*spvDescriptorSet0.support_buffer));
    int _147 = _125;
    int _149 = 0;
    int _151 = _42(_147, _149, (*spvDescriptorSet0.support_buffer));
    float _153 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_145, _151))).x;
    int _155 = _123;
    int _157 = 0;
    int _159 = _42(_155, _157, (*spvDescriptorSet0.support_buffer));
    int _161 = _121;
    int _163 = 0;
    int _165 = _42(_161, _163, (*spvDescriptorSet0.support_buffer));
    float _167 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_159, _165))).x;
    int _169 = _123;
    int _171 = 0;
    int _173 = _42(_169, _171, (*spvDescriptorSet0.support_buffer));
    int _175 = _125;
    int _177 = 0;
    int _179 = _42(_175, _177, (*spvDescriptorSet0.support_buffer));
    float _181 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_173, _179))).x;
    float _183 = precise::max(_139, _167);
    float _185 = precise::max(_153, _181);
    float _187 = precise::max(_183, _185);
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_187, _187, _187, _187), uint2(int2(_115, _117)));
    uint _190 = spvSubgroupBallot(true).x;
    bool _192 = int(_190) != (-1);
    int _218;
    if (!_192)
    {
        int _194 = as_type<int>(_187);
        int _196 = 1;
        int _198 = 31;
        int _200;
        int _547 = _44(_194, _196, _198, _200, gl_SubgroupInvocationID);
        int _202 = _547;
        float _204 = precise::max(_187, as_type<float>(_202));
        int _206 = as_type<int>(_204);
        int _208 = 2;
        int _210 = 31;
        int _212;
        int _554 = _44(_206, _208, _210, _212, gl_SubgroupInvocationID);
        int _214 = _554;
        float _216 = precise::max(_204, as_type<float>(_214));
        _218 = as_type<int>(_216);
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
        int _613 = _45(_248, _250, _252, _254, gl_SubgroupInvocationID);
        int _256 = _613;
        int _258 = int(_246);
        int _260 = int(_246);
        int _262 = 30;
        int _264;
        int _619 = _45(_258, _260, _262, _264, gl_SubgroupInvocationID);
        int _266 = _619;
        float _268 = precise::max(_187, as_type<float>(_256));
        int _270 = as_type<int>(_268);
        int _272 = _266;
        int _274 = 31;
        int _276;
        int _627 = _45(_270, _272, _274, _276, gl_SubgroupInvocationID);
        int _278 = _627;
        float _280 = precise::max(_268, as_type<float>(_278));
        int _282 = as_type<int>(_280);
        int _284 = _244;
        int _286 = 31;
        int _288;
        int _635 = _45(_282, _284, _286, _288, gl_SubgroupInvocationID);
        int _290 = _635;
        _218 = _290;
    }
    _220 = false;
    int _292 = _218;
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
        spvDescriptorSet0.cp_i_tcb_4C_.write(float4(as_type<float>(_292), as_type<float>(_292), as_type<float>(_292), as_type<float>(_292)), uint2(int2(_310, _312)));
    }
    int _314 = _292;
    int _316 = 4;
    int _318 = 31;
    int _320;
    int _681 = _44(_314, _316, _318, _320, gl_SubgroupInvocationID);
    int _322 = _681;
    int _324 = as_type<int>(_49) & 15;
    bool _326 = _324 != 0;
    float _328 = precise::max(as_type<float>(_322), as_type<float>(_292));
    int _330 = as_type<int>(_328);
    int _332 = 8;
    int _334 = 31;
    int _336;
    int _695 = _44(_330, _332, _334, _336, gl_SubgroupInvocationID);
    int _338 = _695;
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

