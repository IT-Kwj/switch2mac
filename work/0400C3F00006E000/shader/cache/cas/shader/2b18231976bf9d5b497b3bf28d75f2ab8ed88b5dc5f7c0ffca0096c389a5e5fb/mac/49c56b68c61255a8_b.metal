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

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float, access::write> fp_i_tcb_48_ [[id(6)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
    float4 m_50 [[color(1)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _759, thread const int& _760, thread const int& _761, thread int& _762, thread uint& gl_SubgroupInvocationID)
{
    int _765 = _761 & 31;
    uint _767 = uint(int(uint(_761) >> uint(8)));
    int _769 = int(_767) & 31;
    float _771 = as_type<float>(gl_SubgroupInvocationID);
    int _773 = as_type<int>(_771) & _769;
    int _775 = ~_769;
    int _777 = _765 & _775;
    int _779 = _777 | _773;
    int _781 = as_type<int>(_771) ^ _760;
    bool _783 = uint(_781) <= uint(_779);
    _762 = _783 ? (-1) : 0;
    float _785 = spvSubgroupShuffle(as_type<float>(_759), uint(_781));
    uint _787 = uint(_783 ? as_type<int>(_785) : _759);
    return int(_787);
}

static inline __attribute__((always_inline))
int _57(thread const int& _835, thread const int& _836, thread const int& _837, thread int& _838, thread uint& gl_SubgroupInvocationID)
{
    int _841 = _837 & 31;
    uint _843 = uint(int(uint(_837) >> uint(8)));
    int _845 = int(_843) & 31;
    float _847 = as_type<float>(gl_SubgroupInvocationID);
    int _849 = as_type<int>(_847) & _845;
    int _851 = ~_845;
    int _853 = _841 & _851;
    int _855 = _853 | _849;
    int _857 = ~_845;
    int _859 = _836 & _857;
    int _861 = _859 | _849;
    bool _863 = uint(_861) <= uint(_855);
    _838 = _863 ? (-1) : 0;
    float _865 = spvSubgroupShuffle(as_type<float>(_835), uint(_861));
    uint _867 = uint(_863 ? as_type<int>(_865) : _835);
    return int(_867);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _165 = false;
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _392 = float2(_77, _79);
    float _81 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_392, float2(0.0), isnan(_392)), int2(0), component::x).w;
    float2 _403 = float2(_77, _79);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_403, float2(0.0), isnan(_403)), int2(0), component::x).xyzw;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float _92 = _84.w;
    float _94 = in.m_35.z;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_35.w;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    uint _107 = spvSubgroupBallot(true).x;
    bool _111 = int(_107) != (-1);
    float _113 = _75 * _98;
    float _115 = _75 * _104;
    float _117 = -_81;
    float _119 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _121 = _81 != 1.0;
    bool _123 = isnan(_81);
    bool _125 = _121 || _123;
    bool _127 = isnan(1.0);
    bool _129 = _125 || _127;
    float _131 = 1.0 / _119;
    float _133 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _135 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[1].w, _133);
    int _137 = _129 ? as_type<int>(_135) : 1065353216;
    float _163;
    if (!_111)
    {
        int _139 = as_type<int>(_81);
        int _141 = 1;
        int _143 = 31;
        int _145;
        int _485 = _56(_139, _141, _143, _145, gl_SubgroupInvocationID);
        int _147 = _485;
        float _149 = precise::max(_81, as_type<float>(_147));
        int _151 = as_type<int>(_149);
        int _153 = 2;
        int _155 = 31;
        int _157;
        int _492 = _56(_151, _153, _155, _157, gl_SubgroupInvocationID);
        int _159 = _492;
        float _161 = precise::max(_149, as_type<float>(_159));
        _163 = _161;
        _165 = true;
    }
    else
    {
        float _167 = as_type<float>(gl_SubgroupInvocationID);
        uint _169 = spvSubgroupBallot(true).x;
        float _171 = as_type<float>(gl_SubgroupLtMask.x);
        int _173 = as_type<int>(_167) & (-4);
        uint _175 = min(uint(_173), 32u);
        bool _177 = _175 < 32u;
        int _179 = 15 << int(_175);
        int _181 = _177 ? _179 : 0;
        int _183 = int(_169) & as_type<int>(_171);
        int _185 = _181 & _183;
        int _187 = _181 & int(_169);
        int _189 = int(spvFindUMSB(uint(_185)));
        int _191 = int(spvFindUMSB(uint(_187)));
        uint _193 = min(uint(_189), as_type<uint>(_167));
        int _195 = as_type<int>(_81);
        int _197 = int(_193);
        int _199 = 31;
        int _201;
        int _552 = _57(_195, _197, _199, _201, gl_SubgroupInvocationID);
        int _203 = _552;
        int _205 = int(_193);
        int _207 = int(_193);
        int _209 = 30;
        int _211;
        int _558 = _57(_205, _207, _209, _211, gl_SubgroupInvocationID);
        int _213 = _558;
        float _215 = precise::max(_81, as_type<float>(_203));
        int _217 = as_type<int>(_215);
        int _219 = _213;
        int _221 = 31;
        int _223;
        int _566 = _57(_217, _219, _221, _223, gl_SubgroupInvocationID);
        int _225 = _566;
        float _227 = precise::max(_215, as_type<float>(_225));
        int _229 = as_type<int>(_227);
        int _231 = _191;
        int _233 = 31;
        int _235;
        int _574 = _57(_229, _231, _233, _235, gl_SubgroupInvocationID);
        int _237 = _574;
        _163 = as_type<float>(_237);
    }
    _165 = false;
    float _239 = _163;
    float _241 = as_type<float>(gl_SubgroupInvocationID);
    float _243 = floor(_115);
    float _245 = -as_type<float>(_137);
    float _247 = _245 + _92;
    float _249 = -as_type<float>(_137);
    float _251 = _249 + _86;
    float _253 = -as_type<float>(_137);
    float _255 = _253 + _88;
    float _257 = -as_type<float>(_137);
    float _259 = _257 + _90;
    float _261 = _131 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _263 = abs(_255);
    float _265 = -_263;
    float _267 = abs(_247);
    float _269 = _265 + _267;
    float _271 = floor(_113);
    float _273 = abs(_251);
    float _275 = abs(_259);
    float _277 = -_275;
    float _279 = _273 + _277;
    float _281 = _269 + _279;
    float _283 = -_279;
    float _285 = _269 + _283;
    float _287 = -_243;
    float _289 = _115 + _287;
    float _291 = fma(_261, _285, _289);
    float _293 = precise::clamp(_291, 0.0, 1.0);
    int _295 = as_type<int>(_241) & 3;
    bool _297 = _295 != 0;
    float _299 = -_271;
    float _301 = _113 + _299;
    float _303 = -_289;
    float _305 = _303 + _293;
    float _307 = fma(_261, _281, _301);
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = -_301;
    float _313 = _311 + _309;
    int _315 = as_type<int>(_281);
    if (!_297)
    {
        float _317 = gl_FragCoord.y;
        float _319 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _321 = _317 / _319;
        float _323 = gl_FragCoord.x;
        float _325 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _327 = _323 / _325;
        float _329 = trunc(_321);
        int _331 = int(_329);
        float _333 = trunc(_327);
        int _335 = int(_333);
        int _337 = _331 >> 31;
        int _339 = _337 & 1;
        int _341 = _335 >> 31;
        int _343 = _331 + _339;
        int _345 = _341 & 1;
        int _347 = _343 >> 1;
        int _349 = _335 + _345;
        int _351 = _349 >> 1;
        spvDescriptorSet0.fp_i_tcb_48_.write(float4(_239, _239, _239, _239), uint2(int2(_351, _347)));
        _315 = _335;
    }
    int _353 = _315;
    float _355 = fma(_313, 0.5, 0.5);
    float _357 = fma(_305, 0.5, 0.5);
    out.gl_FragDepth = as_type<float>(_353);
    out.m_48.x = as_type<float>(_137);
    out.m_48.y = as_type<float>(_137);
    out.m_48.z = as_type<float>(_137);
    out.m_48.w = as_type<float>(_137);
    out.m_50.x = _355;
    out.m_50.y = _357;
    return out;
}


struct main0_out_u
{
    uint4 m_48 [[color(0)]];
    uint4 m_50 [[color(1)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _165 = false;
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _392 = float2(_77, _79);
    float _81 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_392, float2(0.0), isnan(_392)), int2(0), component::x).w;
    float2 _403 = float2(_77, _79);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_403, float2(0.0), isnan(_403)), int2(0), component::x).xyzw;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float _92 = _84.w;
    float _94 = in.m_35.z;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_35.w;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    uint _107 = spvSubgroupBallot(true).x;
    bool _111 = int(_107) != (-1);
    float _113 = _75 * _98;
    float _115 = _75 * _104;
    float _117 = -_81;
    float _119 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _121 = _81 != 1.0;
    bool _123 = isnan(_81);
    bool _125 = _121 || _123;
    bool _127 = isnan(1.0);
    bool _129 = _125 || _127;
    float _131 = 1.0 / _119;
    float _133 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _135 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[1].w, _133);
    int _137 = _129 ? as_type<int>(_135) : 1065353216;
    float _163;
    if (!_111)
    {
        int _139 = as_type<int>(_81);
        int _141 = 1;
        int _143 = 31;
        int _145;
        int _485 = _56(_139, _141, _143, _145, gl_SubgroupInvocationID);
        int _147 = _485;
        float _149 = precise::max(_81, as_type<float>(_147));
        int _151 = as_type<int>(_149);
        int _153 = 2;
        int _155 = 31;
        int _157;
        int _492 = _56(_151, _153, _155, _157, gl_SubgroupInvocationID);
        int _159 = _492;
        float _161 = precise::max(_149, as_type<float>(_159));
        _163 = _161;
        _165 = true;
    }
    else
    {
        float _167 = as_type<float>(gl_SubgroupInvocationID);
        uint _169 = spvSubgroupBallot(true).x;
        float _171 = as_type<float>(gl_SubgroupLtMask.x);
        int _173 = as_type<int>(_167) & (-4);
        uint _175 = min(uint(_173), 32u);
        bool _177 = _175 < 32u;
        int _179 = 15 << int(_175);
        int _181 = _177 ? _179 : 0;
        int _183 = int(_169) & as_type<int>(_171);
        int _185 = _181 & _183;
        int _187 = _181 & int(_169);
        int _189 = int(spvFindUMSB(uint(_185)));
        int _191 = int(spvFindUMSB(uint(_187)));
        uint _193 = min(uint(_189), as_type<uint>(_167));
        int _195 = as_type<int>(_81);
        int _197 = int(_193);
        int _199 = 31;
        int _201;
        int _552 = _57(_195, _197, _199, _201, gl_SubgroupInvocationID);
        int _203 = _552;
        int _205 = int(_193);
        int _207 = int(_193);
        int _209 = 30;
        int _211;
        int _558 = _57(_205, _207, _209, _211, gl_SubgroupInvocationID);
        int _213 = _558;
        float _215 = precise::max(_81, as_type<float>(_203));
        int _217 = as_type<int>(_215);
        int _219 = _213;
        int _221 = 31;
        int _223;
        int _566 = _57(_217, _219, _221, _223, gl_SubgroupInvocationID);
        int _225 = _566;
        float _227 = precise::max(_215, as_type<float>(_225));
        int _229 = as_type<int>(_227);
        int _231 = _191;
        int _233 = 31;
        int _235;
        int _574 = _57(_229, _231, _233, _235, gl_SubgroupInvocationID);
        int _237 = _574;
        _163 = as_type<float>(_237);
    }
    _165 = false;
    float _239 = _163;
    float _241 = as_type<float>(gl_SubgroupInvocationID);
    float _243 = floor(_115);
    float _245 = -as_type<float>(_137);
    float _247 = _245 + _92;
    float _249 = -as_type<float>(_137);
    float _251 = _249 + _86;
    float _253 = -as_type<float>(_137);
    float _255 = _253 + _88;
    float _257 = -as_type<float>(_137);
    float _259 = _257 + _90;
    float _261 = _131 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _263 = abs(_255);
    float _265 = -_263;
    float _267 = abs(_247);
    float _269 = _265 + _267;
    float _271 = floor(_113);
    float _273 = abs(_251);
    float _275 = abs(_259);
    float _277 = -_275;
    float _279 = _273 + _277;
    float _281 = _269 + _279;
    float _283 = -_279;
    float _285 = _269 + _283;
    float _287 = -_243;
    float _289 = _115 + _287;
    float _291 = fma(_261, _285, _289);
    float _293 = precise::clamp(_291, 0.0, 1.0);
    int _295 = as_type<int>(_241) & 3;
    bool _297 = _295 != 0;
    float _299 = -_271;
    float _301 = _113 + _299;
    float _303 = -_289;
    float _305 = _303 + _293;
    float _307 = fma(_261, _281, _301);
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = -_301;
    float _313 = _311 + _309;
    int _315 = as_type<int>(_281);
    if (!_297)
    {
        float _317 = gl_FragCoord.y;
        float _319 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _321 = _317 / _319;
        float _323 = gl_FragCoord.x;
        float _325 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _327 = _323 / _325;
        float _329 = trunc(_321);
        int _331 = int(_329);
        float _333 = trunc(_327);
        int _335 = int(_333);
        int _337 = _331 >> 31;
        int _339 = _337 & 1;
        int _341 = _335 >> 31;
        int _343 = _331 + _339;
        int _345 = _341 & 1;
        int _347 = _343 >> 1;
        int _349 = _335 + _345;
        int _351 = _349 >> 1;
        spvDescriptorSet0.fp_i_tcb_48_.write(float4(_239, _239, _239, _239), uint2(int2(_351, _347)));
        _315 = _335;
    }
    int _353 = _315;
    float _355 = fma(_313, 0.5, 0.5);
    float _357 = fma(_305, 0.5, 0.5);
    out.gl_FragDepth = as_type<float>(_353);
    out.m_48.x = as_type<float>(_137);
    out.m_48.y = as_type<float>(_137);
    out.m_48.z = as_type<float>(_137);
    out.m_48.w = as_type<float>(_137);
    out.m_50.x = _355;
    out.m_50.y = _357;
    return main0_out_u{as_type<uint4>(out.m_48), as_type<uint4>(out.m_50), out.gl_FragDepth};
}


struct main0_out_m
{
    uint4 m_48 [[color(0)]];
    float4 m_50 [[color(1)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_m main0_m(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _165 = false;
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _392 = float2(_77, _79);
    float _81 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_392, float2(0.0), isnan(_392)), int2(0), component::x).w;
    float2 _403 = float2(_77, _79);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_403, float2(0.0), isnan(_403)), int2(0), component::x).xyzw;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float _92 = _84.w;
    float _94 = in.m_35.z;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_35.w;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    uint _107 = spvSubgroupBallot(true).x;
    bool _111 = int(_107) != (-1);
    float _113 = _75 * _98;
    float _115 = _75 * _104;
    float _117 = -_81;
    float _119 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _121 = _81 != 1.0;
    bool _123 = isnan(_81);
    bool _125 = _121 || _123;
    bool _127 = isnan(1.0);
    bool _129 = _125 || _127;
    float _131 = 1.0 / _119;
    float _133 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _135 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[1].w, _133);
    int _137 = _129 ? as_type<int>(_135) : 1065353216;
    float _163;
    if (!_111)
    {
        int _139 = as_type<int>(_81);
        int _141 = 1;
        int _143 = 31;
        int _145;
        int _485 = _56(_139, _141, _143, _145, gl_SubgroupInvocationID);
        int _147 = _485;
        float _149 = precise::max(_81, as_type<float>(_147));
        int _151 = as_type<int>(_149);
        int _153 = 2;
        int _155 = 31;
        int _157;
        int _492 = _56(_151, _153, _155, _157, gl_SubgroupInvocationID);
        int _159 = _492;
        float _161 = precise::max(_149, as_type<float>(_159));
        _163 = _161;
        _165 = true;
    }
    else
    {
        float _167 = as_type<float>(gl_SubgroupInvocationID);
        uint _169 = spvSubgroupBallot(true).x;
        float _171 = as_type<float>(gl_SubgroupLtMask.x);
        int _173 = as_type<int>(_167) & (-4);
        uint _175 = min(uint(_173), 32u);
        bool _177 = _175 < 32u;
        int _179 = 15 << int(_175);
        int _181 = _177 ? _179 : 0;
        int _183 = int(_169) & as_type<int>(_171);
        int _185 = _181 & _183;
        int _187 = _181 & int(_169);
        int _189 = int(spvFindUMSB(uint(_185)));
        int _191 = int(spvFindUMSB(uint(_187)));
        uint _193 = min(uint(_189), as_type<uint>(_167));
        int _195 = as_type<int>(_81);
        int _197 = int(_193);
        int _199 = 31;
        int _201;
        int _552 = _57(_195, _197, _199, _201, gl_SubgroupInvocationID);
        int _203 = _552;
        int _205 = int(_193);
        int _207 = int(_193);
        int _209 = 30;
        int _211;
        int _558 = _57(_205, _207, _209, _211, gl_SubgroupInvocationID);
        int _213 = _558;
        float _215 = precise::max(_81, as_type<float>(_203));
        int _217 = as_type<int>(_215);
        int _219 = _213;
        int _221 = 31;
        int _223;
        int _566 = _57(_217, _219, _221, _223, gl_SubgroupInvocationID);
        int _225 = _566;
        float _227 = precise::max(_215, as_type<float>(_225));
        int _229 = as_type<int>(_227);
        int _231 = _191;
        int _233 = 31;
        int _235;
        int _574 = _57(_229, _231, _233, _235, gl_SubgroupInvocationID);
        int _237 = _574;
        _163 = as_type<float>(_237);
    }
    _165 = false;
    float _239 = _163;
    float _241 = as_type<float>(gl_SubgroupInvocationID);
    float _243 = floor(_115);
    float _245 = -as_type<float>(_137);
    float _247 = _245 + _92;
    float _249 = -as_type<float>(_137);
    float _251 = _249 + _86;
    float _253 = -as_type<float>(_137);
    float _255 = _253 + _88;
    float _257 = -as_type<float>(_137);
    float _259 = _257 + _90;
    float _261 = _131 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _263 = abs(_255);
    float _265 = -_263;
    float _267 = abs(_247);
    float _269 = _265 + _267;
    float _271 = floor(_113);
    float _273 = abs(_251);
    float _275 = abs(_259);
    float _277 = -_275;
    float _279 = _273 + _277;
    float _281 = _269 + _279;
    float _283 = -_279;
    float _285 = _269 + _283;
    float _287 = -_243;
    float _289 = _115 + _287;
    float _291 = fma(_261, _285, _289);
    float _293 = precise::clamp(_291, 0.0, 1.0);
    int _295 = as_type<int>(_241) & 3;
    bool _297 = _295 != 0;
    float _299 = -_271;
    float _301 = _113 + _299;
    float _303 = -_289;
    float _305 = _303 + _293;
    float _307 = fma(_261, _281, _301);
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = -_301;
    float _313 = _311 + _309;
    int _315 = as_type<int>(_281);
    if (!_297)
    {
        float _317 = gl_FragCoord.y;
        float _319 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _321 = _317 / _319;
        float _323 = gl_FragCoord.x;
        float _325 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _327 = _323 / _325;
        float _329 = trunc(_321);
        int _331 = int(_329);
        float _333 = trunc(_327);
        int _335 = int(_333);
        int _337 = _331 >> 31;
        int _339 = _337 & 1;
        int _341 = _335 >> 31;
        int _343 = _331 + _339;
        int _345 = _341 & 1;
        int _347 = _343 >> 1;
        int _349 = _335 + _345;
        int _351 = _349 >> 1;
        spvDescriptorSet0.fp_i_tcb_48_.write(float4(_239, _239, _239, _239), uint2(int2(_351, _347)));
        _315 = _335;
    }
    int _353 = _315;
    float _355 = fma(_313, 0.5, 0.5);
    float _357 = fma(_305, 0.5, 0.5);
    out.gl_FragDepth = as_type<float>(_353);
    out.m_48.x = as_type<float>(_137);
    out.m_48.y = as_type<float>(_137);
    out.m_48.z = as_type<float>(_137);
    out.m_48.w = as_type<float>(_137);
    out.m_50.x = _355;
    out.m_50.y = _357;
    return main0_out_m{as_type<uint4>(out.m_48), out.m_50, out.gl_FragDepth};
}

