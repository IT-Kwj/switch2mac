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
};

static inline __attribute__((always_inline))
int _43(thread const int& _669, thread const int& _670, constant _10& support_buffer)
{
    int _673 = 1 + _670;
    float _675 = support_buffer._m5[_673].x;
    bool _677 = _675 == 1.0;
    if (_677)
    {
        return _669;
    }
    float _679 = float(_669);
    float _681 = _679 * _675;
    int _683 = int(_681);
    return _683;
}

static inline __attribute__((always_inline))
int _45(thread const int& _706, thread const int& _707, thread const int& _708, thread int& _709, thread uint& gl_SubgroupInvocationID)
{
    int _712 = _708 & 31;
    uint _714 = uint(int(uint(_708) >> uint(8)));
    int _716 = int(_714) & 31;
    float _718 = as_type<float>(gl_SubgroupInvocationID);
    int _720 = as_type<int>(_718) & _716;
    int _722 = ~_716;
    int _724 = _712 & _722;
    int _726 = _724 | _720;
    int _728 = as_type<int>(_718) ^ _707;
    bool _730 = uint(_728) <= uint(_726);
    _709 = _730 ? (-1) : 0;
    float _732 = spvSubgroupShuffle(as_type<float>(_706), uint(_728));
    uint _734 = uint(_730 ? as_type<int>(_732) : _706);
    return int(_734);
}

static inline __attribute__((always_inline))
int _46(thread const int& _782, thread const int& _783, thread const int& _784, thread int& _785, thread uint& gl_SubgroupInvocationID)
{
    int _788 = _784 & 31;
    uint _790 = uint(int(uint(_784) >> uint(8)));
    int _792 = int(_790) & 31;
    float _794 = as_type<float>(gl_SubgroupInvocationID);
    int _796 = as_type<int>(_794) & _792;
    int _798 = ~_792;
    int _800 = _788 & _798;
    int _802 = _800 | _796;
    int _804 = ~_792;
    int _806 = _783 & _804;
    int _808 = _806 | _796;
    bool _810 = uint(_808) <= uint(_802);
    _785 = _810 ? (-1) : 0;
    float _812 = spvSubgroupShuffle(as_type<float>(_782), uint(_808));
    uint _814 = uint(_810 ? as_type<int>(_812) : _782);
    return int(_814);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _229 = false;
    float _50 = as_type<float>(gl_SubgroupInvocationID);
    float _52 = as_type<float>(gl_WorkGroupID.x);
    float _54 = as_type<float>(gl_LocalInvocationID.x);
    float _56 = as_type<float>(gl_WorkGroupID.y);
    float _58 = as_type<float>(gl_LocalInvocationID.y);
    float _60 = as_type<float>(gl_WorkGroupID.z);
    int _62 = as_type<int>(_50) & 6;
    bool _66 = _62 != 2;
    bool _68 = _62 != 4;
    bool _70 = !_66;
    bool _72 = _68 || _70;
    int _74 = as_type<int>(_52) * 4;
    int _76 = _74 + as_type<int>(_54);
    bool _78 = _62 != 4;
    bool _80 = _78 && _66;
    int _82 = as_type<int>(_56) * 16;
    int _84 = _82 + as_type<int>(_58);
    int _86 = as_type<int>(_54);
    int _88 = _76;
    int _90 = as_type<int>(_58);
    int _92 = _84;
    if (!_66)
    {
        int _94 = _76 + (-2);
        _86 = _94;
    }
    int _96 = _86;
    int _98 = _96;
    if (!_72)
    {
        int _100 = _76 + 2;
        _88 = _100;
    }
    int _102 = _88;
    if (_66)
    {
        int _104 = _84 + (-1);
        _90 = _104;
    }
    int _106 = _90;
    int _108 = _106;
    if (_80)
    {
        _108 = _84;
    }
    int _110 = _108;
    bool _112 = as_type<uint>(_60) > 65535u;
    if (_66)
    {
        _98 = _102;
    }
    int _114 = _98;
    if (!_66)
    {
        int _116 = _84 + 1;
        _92 = _116;
    }
    int _118 = _92;
    int _120 = _118;
    if (_66)
    {
        _120 = _110;
    }
    int _122 = _120;
    bool _124 = !_112;
    float _126 = _124 ? _60 : 9.1834094859526886742986618240905e-41;
    int _128 = _114 * 2;
    int _130 = _122 * 2;
    int _132 = _128 + 1;
    int _134 = _130 + 1;
    int _136 = _132;
    int _138 = 0;
    int _140 = _43(_136, _138, (*spvDescriptorSet0.support_buffer));
    int _142 = _130;
    int _144 = 0;
    int _146 = _43(_142, _144, (*spvDescriptorSet0.support_buffer));
    int3 _462 = int3(_140, _146, as_type<int>(_126));
    float _148 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_462.xy), uint(_462.z), 0).x;
    int _150 = _128;
    int _152 = 0;
    int _154 = _43(_150, _152, (*spvDescriptorSet0.support_buffer));
    int _156 = _130;
    int _158 = 0;
    int _160 = _43(_156, _158, (*spvDescriptorSet0.support_buffer));
    int3 _475 = int3(_154, _160, as_type<int>(_126));
    float _162 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_475.xy), uint(_475.z), 0).x;
    int _164 = _128;
    int _166 = 0;
    int _168 = _43(_164, _166, (*spvDescriptorSet0.support_buffer));
    int _170 = _134;
    int _172 = 0;
    int _174 = _43(_170, _172, (*spvDescriptorSet0.support_buffer));
    int3 _488 = int3(_168, _174, as_type<int>(_126));
    float _176 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_488.xy), uint(_488.z), 0).x;
    int _178 = _132;
    int _180 = 0;
    int _182 = _43(_178, _180, (*spvDescriptorSet0.support_buffer));
    int _184 = _134;
    int _186 = 0;
    int _188 = _43(_184, _186, (*spvDescriptorSet0.support_buffer));
    int3 _501 = int3(_182, _188, as_type<int>(_126));
    float _190 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_501.xy), uint(_501.z), 0).x;
    float _192 = precise::max(_162, _148);
    float _194 = precise::max(_176, _190);
    float _196 = precise::max(_192, _194);
    uint _199 = spvSubgroupBallot(true).x;
    bool _201 = int(_199) != (-1);
    int3 _527 = int3(_114, _122, as_type<int>(_60));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_196, _196, _196, _196), uint2(_527.xy), uint(_527.z));
    float _227;
    if (!_201)
    {
        int _203 = as_type<int>(_196);
        int _205 = 1;
        int _207 = 31;
        int _209;
        int _539 = _45(_203, _205, _207, _209, gl_SubgroupInvocationID);
        int _211 = _539;
        float _213 = precise::max(_196, as_type<float>(_211));
        int _215 = as_type<int>(_213);
        int _217 = 2;
        int _219 = 31;
        int _221;
        int _546 = _45(_215, _217, _219, _221, gl_SubgroupInvocationID);
        int _223 = _546;
        float _225 = precise::max(_213, as_type<float>(_223));
        _227 = _225;
        _229 = true;
    }
    else
    {
        float _231 = as_type<float>(gl_SubgroupLtMask.x);
        int _233 = as_type<int>(_50) & (-4);
        uint _235 = spvSubgroupBallot(true).x;
        uint _237 = min(uint(_233), 32u);
        bool _239 = _237 < 32u;
        int _241 = 15 << int(_237);
        int _243 = _239 ? _241 : 0;
        int _245 = int(_235) & as_type<int>(_231);
        int _247 = _243 & _245;
        int _249 = _243 & int(_235);
        int _251 = int(spvFindUMSB(uint(_247)));
        int _253 = int(spvFindUMSB(uint(_249)));
        uint _255 = min(uint(_251), as_type<uint>(_50));
        int _257 = as_type<int>(_196);
        int _259 = int(_255);
        int _261 = 31;
        int _263;
        int _604 = _46(_257, _259, _261, _263, gl_SubgroupInvocationID);
        int _265 = _604;
        int _267 = int(_255);
        int _269 = int(_255);
        int _271 = 30;
        int _273;
        int _610 = _46(_267, _269, _271, _273, gl_SubgroupInvocationID);
        int _275 = _610;
        float _277 = precise::max(_196, as_type<float>(_265));
        int _279 = as_type<int>(_277);
        int _281 = _275;
        int _283 = 31;
        int _285;
        int _618 = _46(_279, _281, _283, _285, gl_SubgroupInvocationID);
        int _287 = _618;
        float _289 = precise::max(_277, as_type<float>(_287));
        int _291 = as_type<int>(_289);
        int _293 = _253;
        int _295 = 31;
        int _297;
        int _626 = _46(_291, _293, _295, _297, gl_SubgroupInvocationID);
        int _299 = _626;
        _227 = as_type<float>(_299);
    }
    _229 = false;
    float _301 = _227;
    int _303 = as_type<int>(_50) & 3;
    bool _305 = _303 != 0;
    if (_305)
    {
        return;
    }
    int _307 = _114 >> 31;
    int _309 = _122 >> 31;
    int _311 = _307 & 1;
    int _313 = _309 & 1;
    int _315 = _114 + _311;
    int _317 = _122 + _313;
    int _319 = _315 >> 1;
    int _321 = _317 >> 1;
    int3 _663 = int3(_319, _321, as_type<int>(_60));
    spvDescriptorSet0.cp_i_tcb_4C_.write(float4(_301, _301, _301, _301), uint2(_663.xy), uint(_663.z));
}

