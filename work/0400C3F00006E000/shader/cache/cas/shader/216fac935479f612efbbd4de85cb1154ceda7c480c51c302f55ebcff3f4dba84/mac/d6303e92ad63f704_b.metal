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
    texture2d_array<float> cp_t_tcb_8 [[id(1)]];
    sampler cp_t_tcb_8Smplr [[id(2)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(3)]];
    texture2d_array<float, access::write> cp_i_tcb_4C_ [[id(4)]];
    texture2d_array<float, access::write> cp_i_tcb_4E_ [[id(5)]];
};

static inline __attribute__((always_inline))
int _45(thread const int& _772, thread const int& _773, constant _10& support_buffer)
{
    int _776 = 1 + _773;
    float _778 = support_buffer._m5[_776].x;
    bool _780 = _778 == 1.0;
    if (_780)
    {
        return _772;
    }
    float _782 = float(_772);
    float _784 = _782 * _778;
    int _786 = int(_784);
    return _786;
}

static inline __attribute__((always_inline))
int _47(thread const int& _809, thread const int& _810, thread const int& _811, thread int& _812, thread uint& gl_SubgroupInvocationID)
{
    int _815 = _811 & 31;
    uint _817 = uint(int(uint(_811) >> uint(8)));
    int _819 = int(_817) & 31;
    float _821 = as_type<float>(gl_SubgroupInvocationID);
    int _823 = as_type<int>(_821) & _819;
    int _825 = ~_819;
    int _827 = _815 & _825;
    int _829 = _827 | _823;
    int _831 = as_type<int>(_821) ^ _810;
    bool _833 = uint(_831) <= uint(_829);
    _812 = _833 ? (-1) : 0;
    float _835 = spvSubgroupShuffle(as_type<float>(_809), uint(_831));
    uint _837 = uint(_833 ? as_type<int>(_835) : _809);
    return int(_837);
}

static inline __attribute__((always_inline))
int _48(thread const int& _884, thread const int& _885, thread const int& _886, thread int& _887, thread uint& gl_SubgroupInvocationID)
{
    int _890 = _886 & 31;
    uint _892 = uint(int(uint(_886) >> uint(8)));
    int _894 = int(_892) & 31;
    float _896 = as_type<float>(gl_SubgroupInvocationID);
    int _898 = as_type<int>(_896) & _894;
    int _900 = ~_894;
    int _902 = _890 & _900;
    int _904 = _902 | _898;
    int _906 = ~_894;
    int _908 = _885 & _906;
    int _910 = _908 | _898;
    bool _912 = uint(_910) <= uint(_904);
    _887 = _912 ? (-1) : 0;
    float _914 = spvSubgroupShuffle(as_type<float>(_884), uint(_910));
    uint _916 = uint(_912 ? as_type<int>(_914) : _884);
    return int(_916);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _231 = false;
    float _52 = as_type<float>(gl_SubgroupInvocationID);
    float _54 = as_type<float>(gl_WorkGroupID.x);
    float _56 = as_type<float>(gl_LocalInvocationID.x);
    float _58 = as_type<float>(gl_WorkGroupID.y);
    float _60 = as_type<float>(gl_LocalInvocationID.y);
    float _62 = as_type<float>(gl_WorkGroupID.z);
    int _64 = as_type<int>(_52) & 6;
    bool _68 = _64 != 2;
    bool _70 = _64 != 4;
    bool _72 = !_68;
    bool _74 = _70 || _72;
    int _76 = as_type<int>(_54) * 4;
    int _78 = _76 + as_type<int>(_56);
    bool _80 = _64 != 4;
    bool _82 = _80 && _68;
    int _84 = as_type<int>(_58) * 16;
    int _86 = _84 + as_type<int>(_60);
    int _88 = as_type<int>(_60);
    int _90 = _78;
    int _92 = as_type<int>(_56);
    int _94 = _86;
    if (!_68)
    {
        int _96 = _78 + (-2);
        _88 = _96;
    }
    int _98 = _88;
    int _100 = _98;
    if (!_74)
    {
        int _102 = _78 + 2;
        _90 = _102;
    }
    int _104 = _90;
    if (_68)
    {
        int _106 = _86 + (-1);
        _92 = _106;
    }
    int _108 = _92;
    int _110 = _108;
    if (_82)
    {
        _110 = _86;
    }
    int _112 = _110;
    bool _114 = as_type<uint>(_62) > 65535u;
    if (_68)
    {
        _100 = _104;
    }
    int _116 = _100;
    if (!_68)
    {
        int _118 = _86 + 1;
        _94 = _118;
    }
    int _120 = _94;
    int _122 = _120;
    if (_68)
    {
        _122 = _112;
    }
    int _124 = _122;
    bool _126 = !_114;
    float _128 = _126 ? _62 : 9.1834094859526886742986618240905e-41;
    int _130 = _116 * 2;
    int _132 = _124 * 2;
    int _134 = _130 + 1;
    int _136 = _132 + 1;
    int _138 = _134;
    int _140 = 0;
    int _142 = _45(_138, _140, (*spvDescriptorSet0.support_buffer));
    int _144 = _132;
    int _146 = 0;
    int _148 = _45(_144, _146, (*spvDescriptorSet0.support_buffer));
    int3 _508 = int3(_142, _148, as_type<int>(_128));
    float _150 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_508.xy), uint(_508.z), 0).x;
    int _152 = _130;
    int _154 = 0;
    int _156 = _45(_152, _154, (*spvDescriptorSet0.support_buffer));
    int _158 = _132;
    int _160 = 0;
    int _162 = _45(_158, _160, (*spvDescriptorSet0.support_buffer));
    int3 _521 = int3(_156, _162, as_type<int>(_128));
    float _164 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_521.xy), uint(_521.z), 0).x;
    int _166 = _130;
    int _168 = 0;
    int _170 = _45(_166, _168, (*spvDescriptorSet0.support_buffer));
    int _172 = _136;
    int _174 = 0;
    int _176 = _45(_172, _174, (*spvDescriptorSet0.support_buffer));
    int3 _534 = int3(_170, _176, as_type<int>(_128));
    float _178 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_534.xy), uint(_534.z), 0).x;
    int _180 = _134;
    int _182 = 0;
    int _184 = _45(_180, _182, (*spvDescriptorSet0.support_buffer));
    int _186 = _136;
    int _188 = 0;
    int _190 = _45(_186, _188, (*spvDescriptorSet0.support_buffer));
    int3 _547 = int3(_184, _190, as_type<int>(_128));
    float _192 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_547.xy), uint(_547.z), 0).x;
    float _194 = precise::max(_164, _150);
    float _196 = precise::max(_178, _192);
    float _198 = precise::max(_194, _196);
    uint _201 = spvSubgroupBallot(true).x;
    bool _203 = int(_201) != (-1);
    int3 _573 = int3(_116, _124, as_type<int>(_62));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_198, _198, _198, _198), uint2(_573.xy), uint(_573.z));
    int _229;
    if (!_203)
    {
        int _205 = as_type<int>(_198);
        int _207 = 1;
        int _209 = 31;
        int _211;
        int _585 = _47(_205, _207, _209, _211, gl_SubgroupInvocationID);
        int _213 = _585;
        float _215 = precise::max(_198, as_type<float>(_213));
        int _217 = as_type<int>(_215);
        int _219 = 2;
        int _221 = 31;
        int _223;
        int _592 = _47(_217, _219, _221, _223, gl_SubgroupInvocationID);
        int _225 = _592;
        float _227 = precise::max(_215, as_type<float>(_225));
        _229 = as_type<int>(_227);
        _231 = true;
    }
    else
    {
        float _233 = as_type<float>(gl_SubgroupLtMask.x);
        int _235 = as_type<int>(_52) & (-4);
        uint _237 = spvSubgroupBallot(true).x;
        uint _239 = min(uint(_235), 32u);
        bool _241 = _239 < 32u;
        int _243 = 15 << int(_239);
        int _245 = _241 ? _243 : 0;
        int _247 = _245 & int(_237);
        int _249 = int(spvFindUMSB(uint(_247)));
        int _251 = int(_237) & as_type<int>(_233);
        int _253 = _245 & _251;
        int _255 = int(spvFindUMSB(uint(_253)));
        uint _257 = min(uint(_255), as_type<uint>(_52));
        int _259 = as_type<int>(_198);
        int _261 = int(_257);
        int _263 = 31;
        int _265;
        int _651 = _48(_259, _261, _263, _265, gl_SubgroupInvocationID);
        int _267 = _651;
        int _269 = int(_257);
        int _271 = int(_257);
        int _273 = 30;
        int _275;
        int _657 = _48(_269, _271, _273, _275, gl_SubgroupInvocationID);
        int _277 = _657;
        float _279 = precise::max(_198, as_type<float>(_267));
        int _281 = as_type<int>(_279);
        int _283 = _277;
        int _285 = 31;
        int _287;
        int _665 = _48(_281, _283, _285, _287, gl_SubgroupInvocationID);
        int _289 = _665;
        float _291 = precise::max(_279, as_type<float>(_289));
        int _293 = as_type<int>(_291);
        int _295 = _249;
        int _297 = 31;
        int _299;
        int _673 = _48(_293, _295, _297, _299, gl_SubgroupInvocationID);
        int _301 = _673;
        _229 = _301;
    }
    _231 = false;
    int _303 = _229;
    int _305 = as_type<int>(_52) & 3;
    bool _307 = _305 != 0;
    if (!_307)
    {
        int _309 = _116 >> 31;
        int _311 = _124 >> 31;
        int _313 = _309 & 1;
        int _315 = _311 & 1;
        int _317 = _116 + _313;
        int _319 = _124 + _315;
        int _321 = _317 >> 1;
        int _323 = _319 >> 1;
        int3 _709 = int3(_321, _323, as_type<int>(_62));
        spvDescriptorSet0.cp_i_tcb_4C_.write(float4(as_type<float>(_303), as_type<float>(_303), as_type<float>(_303), as_type<float>(_303)), uint2(_709.xy), uint(_709.z));
    }
    int _325 = _303;
    int _327 = 4;
    int _329 = 31;
    int _331;
    int _721 = _47(_325, _327, _329, _331, gl_SubgroupInvocationID);
    int _333 = _721;
    int _335 = as_type<int>(_52) & 15;
    bool _337 = _335 != 0;
    float _339 = precise::max(as_type<float>(_333), as_type<float>(_303));
    int _341 = as_type<int>(_339);
    int _343 = 8;
    int _345 = 31;
    int _347;
    int _735 = _47(_341, _343, _345, _347, gl_SubgroupInvocationID);
    int _349 = _735;
    if (_337)
    {
        return;
    }
    int _351 = _116 >> 31;
    int _353 = _124 >> 31;
    int _355 = _351 & 3;
    int _357 = _353 & 3;
    float _359 = precise::max(_339, as_type<float>(_349));
    int _361 = _116 + _355;
    int _363 = _124 + _357;
    int _365 = _361 >> 2;
    int _367 = _363 >> 2;
    int3 _766 = int3(_365, _367, as_type<int>(_62));
    spvDescriptorSet0.cp_i_tcb_4E_.write(float4(_359, _359, _359, _359), uint2(_766.xy), uint(_766.z));
}

