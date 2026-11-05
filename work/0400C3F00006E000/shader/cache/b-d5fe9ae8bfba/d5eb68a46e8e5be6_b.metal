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
    texture2d_array<float, access::write> cp_i_tcb_48_ [[id(3)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(4)]];
    texture2d_array<float, access::write> cp_i_tcb_4C_ [[id(5)]];
    texture2d_array<float, access::write> cp_i_tcb_4E_ [[id(6)]];
};

static inline __attribute__((always_inline))
int _47(thread const int& _814, thread const int& _815, constant _10& support_buffer)
{
    int _818 = 1 + _815;
    float _820 = support_buffer._m5[_818].x;
    bool _822 = _820 == 1.0;
    if (_822)
    {
        return _814;
    }
    float _824 = float(_814);
    float _826 = _824 * _820;
    int _828 = int(_826);
    return _828;
}

static inline __attribute__((always_inline))
int _49(thread const int& _851, thread const int& _852, thread const int& _853, thread int& _854, thread uint& gl_SubgroupInvocationID)
{
    int _857 = _853 & 31;
    uint _859 = uint(int(uint(_853) >> uint(8)));
    int _861 = int(_859) & 31;
    float _863 = as_type<float>(gl_SubgroupInvocationID);
    int _865 = as_type<int>(_863) & _861;
    int _867 = ~_861;
    int _869 = _857 & _867;
    int _871 = _869 | _865;
    int _873 = as_type<int>(_863) ^ _852;
    bool _875 = uint(_873) <= uint(_871);
    _854 = _875 ? (-1) : 0;
    float _877 = spvSubgroupShuffle(as_type<float>(_851), uint(_873));
    uint _879 = uint(_875 ? as_type<int>(_877) : _851);
    return int(_879);
}

static inline __attribute__((always_inline))
int _50(thread const int& _926, thread const int& _927, thread const int& _928, thread int& _929, thread uint& gl_SubgroupInvocationID)
{
    int _932 = _928 & 31;
    uint _934 = uint(int(uint(_928) >> uint(8)));
    int _936 = int(_934) & 31;
    float _938 = as_type<float>(gl_SubgroupInvocationID);
    int _940 = as_type<int>(_938) & _936;
    int _942 = ~_936;
    int _944 = _932 & _942;
    int _946 = _944 | _940;
    int _948 = ~_936;
    int _950 = _927 & _948;
    int _952 = _950 | _940;
    bool _954 = uint(_952) <= uint(_946);
    _929 = _954 ? (-1) : 0;
    float _956 = spvSubgroupShuffle(as_type<float>(_926), uint(_952));
    uint _958 = uint(_954 ? as_type<int>(_956) : _926);
    return int(_958);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _233 = false;
    float _54 = as_type<float>(gl_SubgroupInvocationID);
    float _56 = as_type<float>(gl_WorkGroupID.x);
    float _58 = as_type<float>(gl_LocalInvocationID.x);
    float _60 = as_type<float>(gl_WorkGroupID.y);
    float _62 = as_type<float>(gl_LocalInvocationID.y);
    float _64 = as_type<float>(gl_WorkGroupID.z);
    int _66 = as_type<int>(_54) & 6;
    bool _70 = _66 != 2;
    bool _72 = _66 != 4;
    bool _74 = !_70;
    bool _76 = _72 || _74;
    int _78 = as_type<int>(_56) * 4;
    int _80 = _78 + as_type<int>(_58);
    bool _82 = _66 != 4;
    bool _84 = _82 && _70;
    int _86 = as_type<int>(_60) * 16;
    int _88 = _86 + as_type<int>(_62);
    int _90 = as_type<int>(_62);
    int _92 = _80;
    int _94 = as_type<int>(_58);
    int _96 = _88;
    if (!_70)
    {
        int _98 = _80 + (-2);
        _90 = _98;
    }
    int _100 = _90;
    int _102 = _100;
    if (!_76)
    {
        int _104 = _80 + 2;
        _92 = _104;
    }
    int _106 = _92;
    if (_70)
    {
        int _108 = _88 + (-1);
        _94 = _108;
    }
    int _110 = _94;
    int _112 = _110;
    if (_84)
    {
        _112 = _88;
    }
    int _114 = _112;
    if (!_70)
    {
        int _116 = _88 + 1;
        _96 = _116;
    }
    int _118 = _96;
    int _120 = _118;
    if (_70)
    {
        _102 = _106;
    }
    int _122 = _102;
    bool _124 = as_type<uint>(_64) > 65535u;
    if (_70)
    {
        _120 = _114;
    }
    int _126 = _120;
    int _128 = _122 * 2;
    bool _130 = !_124;
    float _132 = _130 ? _64 : 9.1834094859526886742986618240905e-41;
    int _134 = _126 * 2;
    int _136 = _128 + 1;
    int _138 = _134 + 1;
    int _140 = _128;
    int _142 = 0;
    int _144 = _47(_140, _142, (*spvDescriptorSet0.support_buffer));
    int _146 = _134;
    int _148 = 0;
    int _150 = _47(_146, _148, (*spvDescriptorSet0.support_buffer));
    int3 _510 = int3(_144, _150, as_type<int>(_132));
    float _152 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_510.xy), uint(_510.z), 0).x;
    int _154 = _136;
    int _156 = 0;
    int _158 = _47(_154, _156, (*spvDescriptorSet0.support_buffer));
    int _160 = _134;
    int _162 = 0;
    int _164 = _47(_160, _162, (*spvDescriptorSet0.support_buffer));
    int3 _523 = int3(_158, _164, as_type<int>(_132));
    float _166 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_523.xy), uint(_523.z), 0).x;
    int _168 = _136;
    int _170 = 0;
    int _172 = _47(_168, _170, (*spvDescriptorSet0.support_buffer));
    int _174 = _138;
    int _176 = 0;
    int _178 = _47(_174, _176, (*spvDescriptorSet0.support_buffer));
    int3 _536 = int3(_172, _178, as_type<int>(_132));
    float _180 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_536.xy), uint(_536.z), 0).x;
    int _182 = _128;
    int _184 = 0;
    int _186 = _47(_182, _184, (*spvDescriptorSet0.support_buffer));
    int _188 = _138;
    int _190 = 0;
    int _192 = _47(_188, _190, (*spvDescriptorSet0.support_buffer));
    int3 _549 = int3(_186, _192, as_type<int>(_132));
    float _194 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_549.xy), uint(_549.z), 0).x;
    float _196 = precise::max(_152, _166);
    float _198 = precise::max(_194, _180);
    float _200 = precise::max(_196, _198);
    int3 _568 = int3(_128, _134, as_type<int>(_64));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_152, _152, _152, _152), uint2(_568.xy), uint(_568.z));
    int3 _579 = int3(_128, _138, as_type<int>(_64));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_166, _166, _166, _166), uint2(_579.xy), uint(_579.z));
    int3 _590 = int3(_136, _134, as_type<int>(_64));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_194, _194, _194, _194), uint2(_590.xy), uint(_590.z));
    int3 _601 = int3(_136, _138, as_type<int>(_64));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_180, _180, _180, _180), uint2(_601.xy), uint(_601.z));
    int3 _612 = int3(_122, _126, as_type<int>(_64));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_200, _200, _200, _200), uint2(_612.xy), uint(_612.z));
    uint _203 = spvSubgroupBallot(true).x;
    bool _205 = int(_203) != (-1);
    float _231;
    if (!_205)
    {
        int _207 = as_type<int>(_200);
        int _209 = 1;
        int _211 = 31;
        int _213;
        int _631 = _49(_207, _209, _211, _213, gl_SubgroupInvocationID);
        int _215 = _631;
        float _217 = precise::max(_200, as_type<float>(_215));
        int _219 = as_type<int>(_217);
        int _221 = 2;
        int _223 = 31;
        int _225;
        int _638 = _49(_219, _221, _223, _225, gl_SubgroupInvocationID);
        int _227 = _638;
        float _229 = precise::max(_217, as_type<float>(_227));
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = as_type<float>(gl_SubgroupLtMask.x);
        int _237 = as_type<int>(_54) & (-4);
        uint _239 = spvSubgroupBallot(true).x;
        uint _241 = min(uint(_237), 32u);
        bool _243 = _241 < 32u;
        int _245 = 15 << int(_241);
        int _247 = _243 ? _245 : 0;
        int _249 = int(_239) & as_type<int>(_235);
        int _251 = _247 & _249;
        int _253 = _247 & int(_239);
        int _255 = int(spvFindUMSB(uint(_251)));
        int _257 = int(spvFindUMSB(uint(_253)));
        uint _259 = min(uint(_255), as_type<uint>(_54));
        int _261 = as_type<int>(_200);
        int _263 = int(_259);
        int _265 = 31;
        int _267;
        int _696 = _50(_261, _263, _265, _267, gl_SubgroupInvocationID);
        int _269 = _696;
        int _271 = int(_259);
        int _273 = int(_259);
        int _275 = 30;
        int _277;
        int _702 = _50(_271, _273, _275, _277, gl_SubgroupInvocationID);
        int _279 = _702;
        float _281 = precise::max(_200, as_type<float>(_269));
        int _283 = as_type<int>(_281);
        int _285 = _279;
        int _287 = 31;
        int _289;
        int _710 = _50(_283, _285, _287, _289, gl_SubgroupInvocationID);
        int _291 = _710;
        float _293 = precise::max(_281, as_type<float>(_291));
        int _295 = as_type<int>(_293);
        int _297 = _257;
        int _299 = 31;
        int _301;
        int _718 = _50(_295, _297, _299, _301, gl_SubgroupInvocationID);
        int _303 = _718;
        _231 = as_type<float>(_303);
    }
    _233 = false;
    float _305 = _231;
    int _307 = as_type<int>(_54) & 3;
    bool _309 = _307 != 0;
    if (!_309)
    {
        int _311 = _122 >> 31;
        int _313 = _126 >> 31;
        int _315 = _311 & 1;
        int _317 = _313 & 1;
        int _319 = _122 + _315;
        int _321 = _126 + _317;
        int _323 = _319 >> 1;
        int _325 = _321 >> 1;
        int3 _755 = int3(_323, _325, as_type<int>(_64));
        spvDescriptorSet0.cp_i_tcb_4C_.write(float4(_305, _305, _305, _305), uint2(_755.xy), uint(_755.z));
    }
    int _327 = as_type<int>(_305);
    int _329 = 4;
    int _331 = 31;
    int _333;
    int _764 = _49(_327, _329, _331, _333, gl_SubgroupInvocationID);
    int _335 = _764;
    int _337 = as_type<int>(_54) & 15;
    bool _339 = _337 != 0;
    float _341 = precise::max(as_type<float>(_335), _305);
    int _343 = as_type<int>(_341);
    int _345 = 8;
    int _347 = 31;
    int _349;
    int _777 = _49(_343, _345, _347, _349, gl_SubgroupInvocationID);
    int _351 = _777;
    if (_339)
    {
        return;
    }
    int _353 = _122 >> 31;
    int _355 = _126 >> 31;
    int _357 = _353 & 3;
    int _359 = _355 & 3;
    float _361 = precise::max(_341, as_type<float>(_351));
    int _363 = _122 + _357;
    int _365 = _126 + _359;
    int _367 = _363 >> 2;
    int _369 = _365 >> 2;
    int3 _808 = int3(_367, _369, as_type<int>(_64));
    spvDescriptorSet0.cp_i_tcb_4E_.write(float4(_361, _361, _361, _361), uint2(_808.xy), uint(_808.z));
}

