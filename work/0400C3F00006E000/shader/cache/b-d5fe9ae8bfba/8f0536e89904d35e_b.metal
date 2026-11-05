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
    texture2d_array<float> cp_i_tcb_48_ [[id(1)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(2)]];
    texture2d_array<float, access::write> cp_i_tcb_4C_ [[id(3)]];
    texture2d_array<float, access::write> cp_i_tcb_4E_ [[id(4)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _749, thread const int& _750, constant _10& support_buffer)
{
    int _753 = 1 + _750;
    float _755 = support_buffer._m5[_753].x;
    bool _757 = _755 == 1.0;
    if (_757)
    {
        return _749;
    }
    float _759 = float(_749);
    float _761 = _759 * _755;
    int _763 = int(_761);
    return _763;
}

static inline __attribute__((always_inline))
int _44(thread const int& _786, thread const int& _787, thread const int& _788, thread int& _789, thread uint& gl_SubgroupInvocationID)
{
    int _792 = _788 & 31;
    uint _794 = uint(int(uint(_788) >> uint(8)));
    int _796 = int(_794) & 31;
    float _798 = as_type<float>(gl_SubgroupInvocationID);
    int _800 = as_type<int>(_798) & _796;
    int _802 = ~_796;
    int _804 = _792 & _802;
    int _806 = _804 | _800;
    int _808 = as_type<int>(_798) ^ _787;
    bool _810 = uint(_808) <= uint(_806);
    _789 = _810 ? (-1) : 0;
    float _812 = spvSubgroupShuffle(as_type<float>(_786), uint(_808));
    uint _814 = uint(_810 ? as_type<int>(_812) : _786);
    return int(_814);
}

static inline __attribute__((always_inline))
int _45(thread const int& _861, thread const int& _862, thread const int& _863, thread int& _864, thread uint& gl_SubgroupInvocationID)
{
    int _867 = _863 & 31;
    uint _869 = uint(int(uint(_863) >> uint(8)));
    int _871 = int(_869) & 31;
    float _873 = as_type<float>(gl_SubgroupInvocationID);
    int _875 = as_type<int>(_873) & _871;
    int _877 = ~_871;
    int _879 = _867 & _877;
    int _881 = _879 | _875;
    int _883 = ~_871;
    int _885 = _862 & _883;
    int _887 = _885 | _875;
    bool _889 = uint(_887) <= uint(_881);
    _864 = _889 ? (-1) : 0;
    float _891 = spvSubgroupShuffle(as_type<float>(_861), uint(_887));
    uint _893 = uint(_889 ? as_type<int>(_891) : _861);
    return int(_893);
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
    int _87 = as_type<int>(_53);
    int _89 = _75;
    int _91 = _83;
    if (!_65)
    {
        int _93 = _75 + (-2);
        _85 = _93;
    }
    int _95 = _85;
    int _97 = _95;
    if (_65)
    {
        int _99 = _83 + (-1);
        _87 = _99;
    }
    int _101 = _87;
    int _103 = _101;
    if (!_71)
    {
        int _105 = _75 + 2;
        _89 = _105;
    }
    int _107 = _89;
    if (_79)
    {
        _103 = _83;
    }
    int _109 = _103;
    if (!_65)
    {
        int _111 = _83 + 1;
        _91 = _111;
    }
    int _113 = _91;
    int _115 = _113;
    if (_65)
    {
        _97 = _107;
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
    float _141 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_489.xy), uint(_489.z)).x;
    int _143 = _121;
    int _145 = 0;
    int _147 = _42(_143, _145, (*spvDescriptorSet0.support_buffer));
    int _149 = _127;
    int _151 = 0;
    int _153 = _42(_149, _151, (*spvDescriptorSet0.support_buffer));
    int3 _501 = int3(_147, _153, as_type<int>(_59));
    float _155 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_501.xy), uint(_501.z)).x;
    int _157 = _125;
    int _159 = 0;
    int _161 = _42(_157, _159, (*spvDescriptorSet0.support_buffer));
    int _163 = _123;
    int _165 = 0;
    int _167 = _42(_163, _165, (*spvDescriptorSet0.support_buffer));
    int3 _513 = int3(_161, _167, as_type<int>(_59));
    float _169 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_513.xy), uint(_513.z)).x;
    int _171 = _125;
    int _173 = 0;
    int _175 = _42(_171, _173, (*spvDescriptorSet0.support_buffer));
    int _177 = _127;
    int _179 = 0;
    int _181 = _42(_177, _179, (*spvDescriptorSet0.support_buffer));
    int3 _525 = int3(_175, _181, as_type<int>(_59));
    float _183 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_525.xy), uint(_525.z)).x;
    float _185 = precise::max(_141, _169);
    float _187 = precise::max(_155, _183);
    float _189 = precise::max(_185, _187);
    int3 _543 = int3(_117, _119, as_type<int>(_59));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_189, _189, _189, _189), uint2(_543.xy), uint(_543.z));
    uint _192 = spvSubgroupBallot(true).x;
    bool _194 = int(_192) != (-1);
    int _220;
    if (!_194)
    {
        int _196 = as_type<int>(_189);
        int _198 = 1;
        int _200 = 31;
        int _202;
        int _562 = _44(_196, _198, _200, _202, gl_SubgroupInvocationID);
        int _204 = _562;
        float _206 = precise::max(_189, as_type<float>(_204));
        int _208 = as_type<int>(_206);
        int _210 = 2;
        int _212 = 31;
        int _214;
        int _569 = _44(_208, _210, _212, _214, gl_SubgroupInvocationID);
        int _216 = _569;
        float _218 = precise::max(_206, as_type<float>(_216));
        _220 = as_type<int>(_218);
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
        int _628 = _45(_250, _252, _254, _256, gl_SubgroupInvocationID);
        int _258 = _628;
        int _260 = int(_248);
        int _262 = int(_248);
        int _264 = 30;
        int _266;
        int _634 = _45(_260, _262, _264, _266, gl_SubgroupInvocationID);
        int _268 = _634;
        float _270 = precise::max(_189, as_type<float>(_258));
        int _272 = as_type<int>(_270);
        int _274 = _268;
        int _276 = 31;
        int _278;
        int _642 = _45(_272, _274, _276, _278, gl_SubgroupInvocationID);
        int _280 = _642;
        float _282 = precise::max(_270, as_type<float>(_280));
        int _284 = as_type<int>(_282);
        int _286 = _246;
        int _288 = 31;
        int _290;
        int _650 = _45(_284, _286, _288, _290, gl_SubgroupInvocationID);
        int _292 = _650;
        _220 = _292;
    }
    _222 = false;
    int _294 = _220;
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
        int3 _686 = int3(_312, _314, as_type<int>(_59));
        spvDescriptorSet0.cp_i_tcb_4C_.write(float4(as_type<float>(_294), as_type<float>(_294), as_type<float>(_294), as_type<float>(_294)), uint2(_686.xy), uint(_686.z));
    }
    int _316 = _294;
    int _318 = 4;
    int _320 = 31;
    int _322;
    int _698 = _44(_316, _318, _320, _322, gl_SubgroupInvocationID);
    int _324 = _698;
    int _326 = as_type<int>(_49) & 15;
    bool _328 = _326 != 0;
    float _330 = precise::max(as_type<float>(_324), as_type<float>(_294));
    int _332 = as_type<int>(_330);
    int _334 = 8;
    int _336 = 31;
    int _338;
    int _712 = _44(_332, _334, _336, _338, gl_SubgroupInvocationID);
    int _340 = _712;
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
    int3 _743 = int3(_356, _358, as_type<int>(_59));
    spvDescriptorSet0.cp_i_tcb_4E_.write(float4(_350, _350, _350, _350), uint2(_743.xy), uint(_743.z));
}

