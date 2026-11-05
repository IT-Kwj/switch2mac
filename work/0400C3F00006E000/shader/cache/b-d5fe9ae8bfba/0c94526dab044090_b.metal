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
    texture2d<float> cp_t_tcb_8 [[id(1)]];
    sampler cp_t_tcb_8Smplr [[id(2)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(3)]];
    texture2d<float, access::write> cp_i_tcb_4A_ [[id(4)]];
    texture2d<float, access::write> cp_i_tcb_4C_ [[id(5)]];
    texture2d<float, access::write> cp_i_tcb_4E_ [[id(6)]];
};

static inline __attribute__((always_inline))
int _47(thread const int& _773, thread const int& _774, constant _10& support_buffer)
{
    int _777 = 1 + _774;
    float _779 = support_buffer._m5[_777].x;
    bool _781 = _779 == 1.0;
    if (_781)
    {
        return _773;
    }
    float _783 = float(_773);
    float _785 = _783 * _779;
    int _787 = int(_785);
    return _787;
}

static inline __attribute__((always_inline))
int _49(thread const int& _810, thread const int& _811, thread const int& _812, thread int& _813, thread uint& gl_SubgroupInvocationID)
{
    int _816 = _812 & 31;
    uint _818 = uint(int(uint(_812) >> uint(8)));
    int _820 = int(_818) & 31;
    float _822 = as_type<float>(gl_SubgroupInvocationID);
    int _824 = as_type<int>(_822) & _820;
    int _826 = ~_820;
    int _828 = _816 & _826;
    int _830 = _828 | _824;
    int _832 = as_type<int>(_822) ^ _811;
    bool _834 = uint(_832) <= uint(_830);
    _813 = _834 ? (-1) : 0;
    float _836 = spvSubgroupShuffle(as_type<float>(_810), uint(_832));
    uint _838 = uint(_834 ? as_type<int>(_836) : _810);
    return int(_838);
}

static inline __attribute__((always_inline))
int _50(thread const int& _885, thread const int& _886, thread const int& _887, thread int& _888, thread uint& gl_SubgroupInvocationID)
{
    int _891 = _887 & 31;
    uint _893 = uint(int(uint(_887) >> uint(8)));
    int _895 = int(_893) & 31;
    float _897 = as_type<float>(gl_SubgroupInvocationID);
    int _899 = as_type<int>(_897) & _895;
    int _901 = ~_895;
    int _903 = _891 & _901;
    int _905 = _903 | _899;
    int _907 = ~_895;
    int _909 = _886 & _907;
    int _911 = _909 | _899;
    bool _913 = uint(_911) <= uint(_905);
    _888 = _913 ? (-1) : 0;
    float _915 = spvSubgroupShuffle(as_type<float>(_885), uint(_911));
    uint _917 = uint(_913 ? as_type<int>(_915) : _885);
    return int(_917);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _225 = false;
    float _54 = as_type<float>(gl_SubgroupInvocationID);
    float _56 = as_type<float>(gl_WorkGroupID.x);
    float _58 = as_type<float>(gl_LocalInvocationID.x);
    float _60 = as_type<float>(gl_WorkGroupID.y);
    float _62 = as_type<float>(gl_LocalInvocationID.y);
    int _64 = as_type<int>(_54) & 6;
    bool _68 = _64 != 2;
    bool _70 = _64 != 4;
    bool _72 = !_68;
    bool _74 = _70 || _72;
    int _76 = as_type<int>(_56) * 4;
    int _78 = _76 + as_type<int>(_58);
    bool _80 = _64 != 4;
    bool _82 = _80 && _68;
    int _84 = as_type<int>(_60) * 16;
    int _86 = _84 + as_type<int>(_62);
    int _88 = _64;
    int _90 = _78;
    int _92 = as_type<int>(_62);
    if (!_68)
    {
        int _94 = _78 + (-2);
        _88 = _94;
    }
    int _96 = _88;
    int _98 = _96;
    if (!_74)
    {
        int _100 = _78 + 2;
        _90 = _100;
    }
    int _102 = _90;
    if (_68)
    {
        int _104 = _86 + (-1);
        _92 = _104;
    }
    int _106 = _92;
    int _108 = _106;
    if (_82)
    {
        _108 = _86;
    }
    int _110 = _108;
    int _112 = 0;
    if (!_68)
    {
        int _114 = _86 + 1;
        _112 = _114;
    }
    int _116 = _112;
    int _118 = _116;
    if (_68)
    {
        _98 = _102;
    }
    int _120 = _98;
    if (_68)
    {
        _118 = _110;
    }
    int _122 = _118;
    int _124 = _120 * 2;
    int _126 = _122 * 2;
    int _128 = _124 + 1;
    int _130 = _126 + 1;
    int _132 = _124;
    int _134 = 0;
    int _136 = _47(_132, _134, (*spvDescriptorSet0.support_buffer));
    int _138 = _126;
    int _140 = 0;
    int _142 = _47(_138, _140, (*spvDescriptorSet0.support_buffer));
    float _144 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_136, _142)), 0).x;
    int _146 = _128;
    int _148 = 0;
    int _150 = _47(_146, _148, (*spvDescriptorSet0.support_buffer));
    int _152 = _126;
    int _154 = 0;
    int _156 = _47(_152, _154, (*spvDescriptorSet0.support_buffer));
    float _158 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_150, _156)), 0).x;
    int _160 = _124;
    int _162 = 0;
    int _164 = _47(_160, _162, (*spvDescriptorSet0.support_buffer));
    int _166 = _130;
    int _168 = 0;
    int _170 = _47(_166, _168, (*spvDescriptorSet0.support_buffer));
    float _172 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_164, _170)), 0).x;
    int _174 = _128;
    int _176 = 0;
    int _178 = _47(_174, _176, (*spvDescriptorSet0.support_buffer));
    int _180 = _130;
    int _182 = 0;
    int _184 = _47(_180, _182, (*spvDescriptorSet0.support_buffer));
    float _186 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_178, _184)), 0).x;
    uint _189 = spvSubgroupBallot(true).x;
    bool _191 = int(_189) != (-1);
    float _193 = precise::max(_144, _158);
    float _195 = precise::max(_172, _186);
    float _197 = precise::max(_193, _195);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_144, _144, _144, _144), uint2(int2(_124, _126)));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_158, _158, _158, _158), uint2(int2(_124, _130)));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_172, _172, _172, _172), uint2(int2(_128, _126)));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_186, _186, _186, _186), uint2(int2(_128, _130)));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_197, _197, _197, _197), uint2(int2(_120, _122)));
    int _223;
    if (!_191)
    {
        int _199 = as_type<int>(_197);
        int _201 = 1;
        int _203 = 31;
        int _205;
        int _590 = _49(_199, _201, _203, _205, gl_SubgroupInvocationID);
        int _207 = _590;
        float _209 = precise::max(_197, as_type<float>(_207));
        int _211 = as_type<int>(_209);
        int _213 = 2;
        int _215 = 31;
        int _217;
        int _597 = _49(_211, _213, _215, _217, gl_SubgroupInvocationID);
        int _219 = _597;
        float _221 = precise::max(_209, as_type<float>(_219));
        _223 = as_type<int>(_221);
        _225 = true;
    }
    else
    {
        float _227 = as_type<float>(gl_SubgroupLtMask.x);
        int _229 = as_type<int>(_54) & (-4);
        uint _231 = spvSubgroupBallot(true).x;
        uint _233 = min(uint(_229), 32u);
        bool _235 = _233 < 32u;
        int _237 = 15 << int(_233);
        int _239 = _235 ? _237 : 0;
        int _241 = int(_231) & as_type<int>(_227);
        int _243 = _239 & _241;
        int _245 = _239 & int(_231);
        int _247 = int(spvFindUMSB(uint(_243)));
        int _249 = int(spvFindUMSB(uint(_245)));
        uint _251 = min(uint(_247), as_type<uint>(_54));
        int _253 = as_type<int>(_197);
        int _255 = int(_251);
        int _257 = 31;
        int _259;
        int _656 = _50(_253, _255, _257, _259, gl_SubgroupInvocationID);
        int _261 = _656;
        int _263 = int(_251);
        int _265 = int(_251);
        int _267 = 30;
        int _269;
        int _662 = _50(_263, _265, _267, _269, gl_SubgroupInvocationID);
        int _271 = _662;
        float _273 = precise::max(_197, as_type<float>(_261));
        int _275 = as_type<int>(_273);
        int _277 = _271;
        int _279 = 31;
        int _281;
        int _670 = _50(_275, _277, _279, _281, gl_SubgroupInvocationID);
        int _283 = _670;
        float _285 = precise::max(_273, as_type<float>(_283));
        int _287 = as_type<int>(_285);
        int _289 = _249;
        int _291 = 31;
        int _293;
        int _678 = _50(_287, _289, _291, _293, gl_SubgroupInvocationID);
        int _295 = _678;
        _223 = _295;
    }
    _225 = false;
    int _297 = _223;
    int _299 = as_type<int>(_54) & 3;
    bool _301 = _299 != 0;
    if (!_301)
    {
        int _303 = _120 >> 31;
        int _305 = _122 >> 31;
        int _307 = _303 & 1;
        int _309 = _305 & 1;
        int _311 = _120 + _307;
        int _313 = _122 + _309;
        int _315 = _311 >> 1;
        int _317 = _313 >> 1;
        spvDescriptorSet0.cp_i_tcb_4C_.write(float4(as_type<float>(_297), as_type<float>(_297), as_type<float>(_297), as_type<float>(_297)), uint2(int2(_315, _317)));
    }
    int _319 = _297;
    int _321 = 4;
    int _323 = 31;
    int _325;
    int _724 = _49(_319, _321, _323, _325, gl_SubgroupInvocationID);
    int _327 = _724;
    int _329 = as_type<int>(_54) & 15;
    bool _331 = _329 != 0;
    float _333 = precise::max(as_type<float>(_327), as_type<float>(_297));
    int _335 = as_type<int>(_333);
    int _337 = 8;
    int _339 = 31;
    int _341;
    int _738 = _49(_335, _337, _339, _341, gl_SubgroupInvocationID);
    int _343 = _738;
    if (_331)
    {
        return;
    }
    int _345 = _120 >> 31;
    int _347 = _122 >> 31;
    float _349 = precise::max(_333, as_type<float>(_343));
    int _351 = _345 & 3;
    int _353 = _347 & 3;
    int _355 = _120 + _351;
    int _357 = _122 + _353;
    int _359 = _355 >> 2;
    int _361 = _357 >> 2;
    spvDescriptorSet0.cp_i_tcb_4E_.write(float4(_349, _349, _349, _349), uint2(int2(_359, _361)));
}

