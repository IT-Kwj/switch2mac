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
};

static inline __attribute__((always_inline))
int _45(thread const int& _672, thread const int& _673, constant _10& support_buffer)
{
    int _676 = 1 + _673;
    float _678 = support_buffer._m5[_676].x;
    bool _680 = _678 == 1.0;
    if (_680)
    {
        return _672;
    }
    float _682 = float(_672);
    float _684 = _682 * _678;
    int _686 = int(_684);
    return _686;
}

static inline __attribute__((always_inline))
int _47(thread const int& _709, thread const int& _710, thread const int& _711, thread int& _712, thread uint& gl_SubgroupInvocationID)
{
    int _715 = _711 & 31;
    uint _717 = uint(int(uint(_711) >> uint(8)));
    int _719 = int(_717) & 31;
    float _721 = as_type<float>(gl_SubgroupInvocationID);
    int _723 = as_type<int>(_721) & _719;
    int _725 = ~_719;
    int _727 = _715 & _725;
    int _729 = _727 | _723;
    int _731 = as_type<int>(_721) ^ _710;
    bool _733 = uint(_731) <= uint(_729);
    _712 = _733 ? (-1) : 0;
    float _735 = spvSubgroupShuffle(as_type<float>(_709), uint(_731));
    uint _737 = uint(_733 ? as_type<int>(_735) : _709);
    return int(_737);
}

static inline __attribute__((always_inline))
int _48(thread const int& _785, thread const int& _786, thread const int& _787, thread int& _788, thread uint& gl_SubgroupInvocationID)
{
    int _791 = _787 & 31;
    uint _793 = uint(int(uint(_787) >> uint(8)));
    int _795 = int(_793) & 31;
    float _797 = as_type<float>(gl_SubgroupInvocationID);
    int _799 = as_type<int>(_797) & _795;
    int _801 = ~_795;
    int _803 = _791 & _801;
    int _805 = _803 | _799;
    int _807 = ~_795;
    int _809 = _786 & _807;
    int _811 = _809 | _799;
    bool _813 = uint(_811) <= uint(_805);
    _788 = _813 ? (-1) : 0;
    float _815 = spvSubgroupShuffle(as_type<float>(_785), uint(_811));
    uint _817 = uint(_813 ? as_type<int>(_815) : _785);
    return int(_817);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _223 = false;
    float _52 = as_type<float>(gl_SubgroupInvocationID);
    float _54 = as_type<float>(gl_WorkGroupID.x);
    float _56 = as_type<float>(gl_LocalInvocationID.x);
    float _58 = as_type<float>(gl_WorkGroupID.y);
    float _60 = as_type<float>(gl_LocalInvocationID.y);
    int _62 = as_type<int>(_52) & 6;
    bool _66 = _62 != 2;
    bool _68 = _62 != 4;
    bool _70 = !_66;
    bool _72 = _68 || _70;
    int _74 = as_type<int>(_54) * 4;
    int _76 = _74 + as_type<int>(_56);
    bool _78 = _62 != 4;
    bool _80 = _78 && _66;
    int _82 = as_type<int>(_58) * 16;
    int _84 = _82 + as_type<int>(_60);
    int _86 = _62;
    int _88 = _76;
    int _90 = as_type<int>(_60);
    if (!_66)
    {
        int _92 = _76 + (-2);
        _86 = _92;
    }
    int _94 = _86;
    int _96 = _94;
    if (!_72)
    {
        int _98 = _76 + 2;
        _88 = _98;
    }
    int _100 = _88;
    if (_66)
    {
        int _102 = _84 + (-1);
        _90 = _102;
    }
    int _104 = _90;
    int _106 = _104;
    if (_80)
    {
        _106 = _84;
    }
    int _108 = _106;
    int _110 = 0;
    if (!_66)
    {
        int _112 = _84 + 1;
        _110 = _112;
    }
    int _114 = _110;
    int _116 = _114;
    if (_66)
    {
        _96 = _100;
    }
    int _118 = _96;
    if (_66)
    {
        _116 = _108;
    }
    int _120 = _116;
    int _122 = _118 * 2;
    int _124 = _120 * 2;
    int _126 = _122 + 1;
    int _128 = _124 + 1;
    int _130 = _122;
    int _132 = 0;
    int _134 = _45(_130, _132, (*spvDescriptorSet0.support_buffer));
    int _136 = _124;
    int _138 = 0;
    int _140 = _45(_136, _138, (*spvDescriptorSet0.support_buffer));
    float _142 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_134, _140)), 0).x;
    int _144 = _126;
    int _146 = 0;
    int _148 = _45(_144, _146, (*spvDescriptorSet0.support_buffer));
    int _150 = _124;
    int _152 = 0;
    int _154 = _45(_150, _152, (*spvDescriptorSet0.support_buffer));
    float _156 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_148, _154)), 0).x;
    int _158 = _122;
    int _160 = 0;
    int _162 = _45(_158, _160, (*spvDescriptorSet0.support_buffer));
    int _164 = _128;
    int _166 = 0;
    int _168 = _45(_164, _166, (*spvDescriptorSet0.support_buffer));
    float _170 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_162, _168)), 0).x;
    int _172 = _126;
    int _174 = 0;
    int _176 = _45(_172, _174, (*spvDescriptorSet0.support_buffer));
    int _178 = _128;
    int _180 = 0;
    int _182 = _45(_178, _180, (*spvDescriptorSet0.support_buffer));
    float _184 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_176, _182)), 0).x;
    float _186 = precise::max(_142, _156);
    float _188 = precise::max(_170, _184);
    float _190 = precise::max(_186, _188);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_142, _142, _142, _142), uint2(int2(_122, _124)));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_156, _156, _156, _156), uint2(int2(_122, _128)));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_170, _170, _170, _170), uint2(int2(_126, _124)));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_184, _184, _184, _184), uint2(int2(_126, _128)));
    uint _193 = spvSubgroupBallot(true).x;
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_190, _190, _190, _190), uint2(int2(_118, _120)));
    bool _195 = int(_193) != (-1);
    float _221;
    if (!_195)
    {
        int _197 = as_type<int>(_190);
        int _199 = 1;
        int _201 = 31;
        int _203;
        int _544 = _47(_197, _199, _201, _203, gl_SubgroupInvocationID);
        int _205 = _544;
        float _207 = precise::max(_190, as_type<float>(_205));
        int _209 = as_type<int>(_207);
        int _211 = 2;
        int _213 = 31;
        int _215;
        int _551 = _47(_209, _211, _213, _215, gl_SubgroupInvocationID);
        int _217 = _551;
        float _219 = precise::max(_207, as_type<float>(_217));
        _221 = _219;
        _223 = true;
    }
    else
    {
        float _225 = as_type<float>(gl_SubgroupLtMask.x);
        int _227 = as_type<int>(_52) & (-4);
        uint _229 = spvSubgroupBallot(true).x;
        uint _231 = min(uint(_227), 32u);
        bool _233 = _231 < 32u;
        int _235 = 15 << int(_231);
        int _237 = _233 ? _235 : 0;
        int _239 = int(_229) & as_type<int>(_225);
        int _241 = _237 & _239;
        int _243 = _237 & int(_229);
        int _245 = int(spvFindUMSB(uint(_241)));
        int _247 = int(spvFindUMSB(uint(_243)));
        uint _249 = min(uint(_245), as_type<uint>(_52));
        int _251 = as_type<int>(_190);
        int _253 = int(_249);
        int _255 = 31;
        int _257;
        int _609 = _48(_251, _253, _255, _257, gl_SubgroupInvocationID);
        int _259 = _609;
        int _261 = int(_249);
        int _263 = int(_249);
        int _265 = 30;
        int _267;
        int _615 = _48(_261, _263, _265, _267, gl_SubgroupInvocationID);
        int _269 = _615;
        float _271 = precise::max(_190, as_type<float>(_259));
        int _273 = as_type<int>(_271);
        int _275 = _269;
        int _277 = 31;
        int _279;
        int _623 = _48(_273, _275, _277, _279, gl_SubgroupInvocationID);
        int _281 = _623;
        float _283 = precise::max(_271, as_type<float>(_281));
        int _285 = as_type<int>(_283);
        int _287 = _247;
        int _289 = 31;
        int _291;
        int _631 = _48(_285, _287, _289, _291, gl_SubgroupInvocationID);
        int _293 = _631;
        _221 = as_type<float>(_293);
    }
    _223 = false;
    float _295 = _221;
    int _297 = as_type<int>(_52) & 3;
    bool _299 = _297 != 0;
    if (_299)
    {
        return;
    }
    int _301 = _118 >> 31;
    int _303 = _120 >> 31;
    int _305 = _301 & 1;
    int _307 = _303 & 1;
    int _309 = _118 + _305;
    int _311 = _120 + _307;
    int _313 = _309 >> 1;
    int _315 = _311 >> 1;
    spvDescriptorSet0.cp_i_tcb_4C_.write(float4(_295, _295, _295, _295), uint2(int2(_313, _315)));
}

