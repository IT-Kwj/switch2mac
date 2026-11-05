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
    texture2d<float, access::write> cp_i_tcb_4A_ [[id(3)]];
    texture2d<float, access::write> cp_i_tcb_4C_ [[id(4)]];
};

static inline __attribute__((always_inline))
int _43(thread const int& _636, thread const int& _637, constant _10& support_buffer)
{
    int _640 = 1 + _637;
    float _642 = support_buffer._m5[_640].x;
    bool _644 = _642 == 1.0;
    if (_644)
    {
        return _636;
    }
    float _646 = float(_636);
    float _648 = _646 * _642;
    int _650 = int(_648);
    return _650;
}

static inline __attribute__((always_inline))
int _45(thread const int& _673, thread const int& _674, thread const int& _675, thread int& _676, thread uint& gl_SubgroupInvocationID)
{
    int _679 = _675 & 31;
    uint _681 = uint(int(uint(_675) >> uint(8)));
    int _683 = int(_681) & 31;
    float _685 = as_type<float>(gl_SubgroupInvocationID);
    int _687 = as_type<int>(_685) & _683;
    int _689 = ~_683;
    int _691 = _679 & _689;
    int _693 = _691 | _687;
    int _695 = as_type<int>(_685) ^ _674;
    bool _697 = uint(_695) <= uint(_693);
    _676 = _697 ? (-1) : 0;
    float _699 = spvSubgroupShuffle(as_type<float>(_673), uint(_695));
    uint _701 = uint(_697 ? as_type<int>(_699) : _673);
    return int(_701);
}

static inline __attribute__((always_inline))
int _46(thread const int& _749, thread const int& _750, thread const int& _751, thread int& _752, thread uint& gl_SubgroupInvocationID)
{
    int _755 = _751 & 31;
    uint _757 = uint(int(uint(_751) >> uint(8)));
    int _759 = int(_757) & 31;
    float _761 = as_type<float>(gl_SubgroupInvocationID);
    int _763 = as_type<int>(_761) & _759;
    int _765 = ~_759;
    int _767 = _755 & _765;
    int _769 = _767 | _763;
    int _771 = ~_759;
    int _773 = _750 & _771;
    int _775 = _773 | _763;
    bool _777 = uint(_775) <= uint(_769);
    _752 = _777 ? (-1) : 0;
    float _779 = spvSubgroupShuffle(as_type<float>(_749), uint(_775));
    uint _781 = uint(_777 ? as_type<int>(_779) : _749);
    return int(_781);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _221 = false;
    float _50 = as_type<float>(gl_SubgroupInvocationID);
    float _52 = as_type<float>(gl_WorkGroupID.x);
    float _54 = as_type<float>(gl_LocalInvocationID.x);
    float _56 = as_type<float>(gl_WorkGroupID.y);
    float _58 = as_type<float>(gl_LocalInvocationID.y);
    int _60 = as_type<int>(_50) & 6;
    bool _64 = _60 != 2;
    bool _66 = _60 != 4;
    bool _68 = !_64;
    bool _70 = _66 || _68;
    int _72 = as_type<int>(_52) * 4;
    int _74 = _72 + as_type<int>(_54);
    bool _76 = _60 != 4;
    bool _78 = _76 && _64;
    int _80 = as_type<int>(_56) * 16;
    int _82 = _80 + as_type<int>(_58);
    int _84 = as_type<int>(_58);
    int _86 = _74;
    int _88 = _60;
    int _90 = as_type<int>(_54);
    if (!_64)
    {
        int _92 = _74 + (-2);
        _84 = _92;
    }
    int _94 = _84;
    int _96 = _94;
    if (!_70)
    {
        int _98 = _74 + 2;
        _86 = _98;
    }
    int _100 = _86;
    if (_64)
    {
        int _102 = _82 + (-1);
        _88 = _102;
    }
    int _104 = _88;
    int _106 = _104;
    if (_78)
    {
        _106 = _82;
    }
    int _108 = _106;
    if (!_64)
    {
        int _110 = _82 + 1;
        _90 = _110;
    }
    int _112 = _90;
    int _114 = _112;
    if (_64)
    {
        _96 = _100;
    }
    int _116 = _96;
    if (_64)
    {
        _114 = _108;
    }
    int _118 = _114;
    int _120 = _116 * 2;
    int _122 = _118 * 2;
    int _124 = _120 + 1;
    int _126 = _122 + 1;
    int _128 = _120;
    int _130 = 0;
    int _132 = _43(_128, _130, (*spvDescriptorSet0.support_buffer));
    int _134 = _122;
    int _136 = 0;
    int _138 = _43(_134, _136, (*spvDescriptorSet0.support_buffer));
    float _140 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_132, _138)), 0).x;
    int _142 = _124;
    int _144 = 0;
    int _146 = _43(_142, _144, (*spvDescriptorSet0.support_buffer));
    int _148 = _122;
    int _150 = 0;
    int _152 = _43(_148, _150, (*spvDescriptorSet0.support_buffer));
    float _154 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_146, _152)), 0).x;
    int _156 = _120;
    int _158 = 0;
    int _160 = _43(_156, _158, (*spvDescriptorSet0.support_buffer));
    int _162 = _126;
    int _164 = 0;
    int _166 = _43(_162, _164, (*spvDescriptorSet0.support_buffer));
    float _168 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_160, _166)), 0).x;
    int _170 = _124;
    int _172 = 0;
    int _174 = _43(_170, _172, (*spvDescriptorSet0.support_buffer));
    int _176 = _126;
    int _178 = 0;
    int _180 = _43(_176, _178, (*spvDescriptorSet0.support_buffer));
    float _182 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_174, _180)), 0).x;
    float _184 = precise::max(_140, _154);
    float _186 = precise::max(_168, _182);
    float _188 = precise::max(_184, _186);
    uint _191 = spvSubgroupBallot(true).x;
    bool _193 = int(_191) != (-1);
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_188, _188, _188, _188), uint2(int2(_116, _118)));
    float _219;
    if (!_193)
    {
        int _195 = as_type<int>(_188);
        int _197 = 1;
        int _199 = 31;
        int _201;
        int _508 = _45(_195, _197, _199, _201, gl_SubgroupInvocationID);
        int _203 = _508;
        float _205 = precise::max(_188, as_type<float>(_203));
        int _207 = as_type<int>(_205);
        int _209 = 2;
        int _211 = 31;
        int _213;
        int _515 = _45(_207, _209, _211, _213, gl_SubgroupInvocationID);
        int _215 = _515;
        float _217 = precise::max(_205, as_type<float>(_215));
        _219 = _217;
        _221 = true;
    }
    else
    {
        float _223 = as_type<float>(gl_SubgroupLtMask.x);
        int _225 = as_type<int>(_50) & (-4);
        uint _227 = spvSubgroupBallot(true).x;
        uint _229 = min(uint(_225), 32u);
        bool _231 = _229 < 32u;
        int _233 = 15 << int(_229);
        int _235 = _231 ? _233 : 0;
        int _237 = int(_227) & as_type<int>(_223);
        int _239 = _235 & _237;
        int _241 = _235 & int(_227);
        int _243 = int(spvFindUMSB(uint(_239)));
        int _245 = int(spvFindUMSB(uint(_241)));
        uint _247 = min(uint(_243), as_type<uint>(_50));
        int _249 = as_type<int>(_188);
        int _251 = int(_247);
        int _253 = 31;
        int _255;
        int _573 = _46(_249, _251, _253, _255, gl_SubgroupInvocationID);
        int _257 = _573;
        int _259 = int(_247);
        int _261 = int(_247);
        int _263 = 30;
        int _265;
        int _579 = _46(_259, _261, _263, _265, gl_SubgroupInvocationID);
        int _267 = _579;
        float _269 = precise::max(_188, as_type<float>(_257));
        int _271 = as_type<int>(_269);
        int _273 = _267;
        int _275 = 31;
        int _277;
        int _587 = _46(_271, _273, _275, _277, gl_SubgroupInvocationID);
        int _279 = _587;
        float _281 = precise::max(_269, as_type<float>(_279));
        int _283 = as_type<int>(_281);
        int _285 = _245;
        int _287 = 31;
        int _289;
        int _595 = _46(_283, _285, _287, _289, gl_SubgroupInvocationID);
        int _291 = _595;
        _219 = as_type<float>(_291);
    }
    _221 = false;
    float _293 = _219;
    int _295 = as_type<int>(_50) & 3;
    bool _297 = _295 != 0;
    if (_297)
    {
        return;
    }
    int _299 = _116 >> 31;
    int _301 = _118 >> 31;
    int _303 = _299 & 1;
    int _305 = _301 & 1;
    int _307 = _116 + _303;
    int _309 = _118 + _305;
    int _311 = _307 >> 1;
    int _313 = _309 >> 1;
    spvDescriptorSet0.cp_i_tcb_4C_.write(float4(_293, _293, _293, _293), uint2(int2(_311, _313)));
}

