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
    texture2d<float, access::write> fp_i_tcb_48_ [[id(4)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _49(thread const int& _519, thread const int& _520, thread const int& _521, thread int& _522, thread uint& gl_SubgroupInvocationID)
{
    int _525 = _521 & 31;
    uint _527 = uint(int(uint(_521) >> uint(8)));
    int _529 = int(_527) & 31;
    float _531 = as_type<float>(gl_SubgroupInvocationID);
    int _533 = as_type<int>(_531) & _529;
    int _535 = ~_529;
    int _537 = _525 & _535;
    int _539 = _537 | _533;
    int _541 = as_type<int>(_531) ^ _520;
    bool _543 = uint(_541) <= uint(_539);
    _522 = _543 ? (-1) : 0;
    float _545 = spvSubgroupShuffle(as_type<float>(_519), uint(_541));
    uint _547 = uint(_543 ? as_type<int>(_545) : _519);
    return int(_547);
}

static inline __attribute__((always_inline))
int _50(thread const int& _595, thread const int& _596, thread const int& _597, thread int& _598, thread uint& gl_SubgroupInvocationID)
{
    int _601 = _597 & 31;
    uint _603 = uint(int(uint(_597) >> uint(8)));
    int _605 = int(_603) & 31;
    float _607 = as_type<float>(gl_SubgroupInvocationID);
    int _609 = as_type<int>(_607) & _605;
    int _611 = ~_605;
    int _613 = _601 & _611;
    int _615 = _613 | _609;
    int _617 = ~_605;
    int _619 = _596 & _617;
    int _621 = _619 | _609;
    bool _623 = uint(_621) <= uint(_615);
    _598 = _623 ? (-1) : 0;
    float _625 = spvSubgroupShuffle(as_type<float>(_595), uint(_621));
    uint _627 = uint(_623 ? as_type<int>(_625) : _595);
    return int(_627);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _131 = false;
    float _54 = gl_FragCoord.w;
    float _56 = in.m_33.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_33.y;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = 1.0 / _54;
    float _70 = _68 * _60;
    float _72 = _68 * _66;
    float2 _282 = float2(_70, _72);
    float _74 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_282, float2(0.0), isnan(_282)), int2(0), component::x).w;
    uint _77 = spvSubgroupBallot(true).x;
    bool _81 = int(_77) != (-1);
    float _83 = -_74;
    float _85 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _87 = _74 != 1.0;
    bool _89 = isnan(_74);
    bool _91 = _87 || _89;
    bool _93 = isnan(1.0);
    bool _95 = _91 || _93;
    float _97 = 1.0 / _85;
    float _99 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _101 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[1].w, _99);
    int _103 = _95 ? as_type<int>(_101) : 1065353216;
    float _129;
    if (!_81)
    {
        int _105 = as_type<int>(_74);
        int _107 = 1;
        int _109 = 31;
        int _111;
        int _338 = _49(_105, _107, _109, _111, gl_SubgroupInvocationID);
        int _113 = _338;
        float _115 = precise::max(_74, as_type<float>(_113));
        int _117 = as_type<int>(_115);
        int _119 = 2;
        int _121 = 31;
        int _123;
        int _346 = _49(_117, _119, _121, _123, gl_SubgroupInvocationID);
        int _125 = _346;
        float _127 = precise::max(_115, as_type<float>(_125));
        _129 = _127;
        _131 = true;
    }
    else
    {
        float _133 = as_type<float>(gl_SubgroupInvocationID);
        uint _135 = spvSubgroupBallot(true).x;
        float _137 = as_type<float>(gl_SubgroupLtMask.x);
        int _139 = as_type<int>(_133) & (-4);
        uint _141 = min(uint(_139), 32u);
        bool _143 = _141 < 32u;
        int _145 = 15 << int(_141);
        int _147 = _143 ? _145 : 0;
        int _149 = int(_135) & as_type<int>(_137);
        int _151 = _147 & _149;
        int _153 = int(spvFindUMSB(uint(_151)));
        uint _155 = min(uint(_153), as_type<uint>(_133));
        int _157 = _147 & int(_135);
        int _159 = as_type<int>(_74);
        int _161 = int(_155);
        int _163 = 31;
        int _165;
        int _402 = _50(_159, _161, _163, _165, gl_SubgroupInvocationID);
        int _167 = _402;
        int _169 = int(spvFindUMSB(uint(_157)));
        int _171 = int(_155);
        int _173 = int(_155);
        int _175 = 30;
        int _177;
        int _412 = _50(_171, _173, _175, _177, gl_SubgroupInvocationID);
        int _179 = _412;
        float _181 = precise::max(_74, as_type<float>(_167));
        int _183 = as_type<int>(_181);
        int _185 = _179;
        int _187 = 31;
        int _189;
        int _420 = _50(_183, _185, _187, _189, gl_SubgroupInvocationID);
        int _191 = _420;
        float _193 = precise::max(_181, as_type<float>(_191));
        int _195 = as_type<int>(_193);
        int _197 = _169;
        int _199 = 31;
        int _201;
        int _428 = _50(_195, _197, _199, _201, gl_SubgroupInvocationID);
        int _203 = _428;
        _129 = as_type<float>(_203);
    }
    _131 = false;
    float _205 = _129;
    float _207 = as_type<float>(gl_SubgroupInvocationID);
    int _209 = as_type<int>(_207) & 3;
    bool _211 = _209 != 0;
    if (_211)
    {
        out.m_43.x = as_type<float>(_103);
        out.m_43.y = as_type<float>(_103);
        out.m_43.z = as_type<float>(_103);
        out.m_43.w = as_type<float>(_103);
        return out;
    }
    float _213 = gl_FragCoord.x;
    float _215 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _217 = _213 / _215;
    float _219 = gl_FragCoord.y;
    float _221 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _223 = _219 / _221;
    float _225 = trunc(_217);
    int _227 = int(_225);
    float _229 = trunc(_223);
    int _231 = int(_229);
    int _233 = _227 >> 31;
    int _235 = _233 & 1;
    int _237 = _231 >> 31;
    int _239 = _227 + _235;
    int _241 = _237 & 1;
    int _243 = _239 >> 1;
    int _245 = _231 + _241;
    int _247 = _245 >> 1;
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_205, _205, _205, _205), uint2(int2(_243, _247)));
    out.m_43.x = as_type<float>(_103);
    out.m_43.y = as_type<float>(_103);
    out.m_43.z = as_type<float>(_103);
    out.m_43.w = as_type<float>(_103);
    return out;
}


struct main0_out_u
{
    uint4 m_43 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _131 = false;
    float _54 = gl_FragCoord.w;
    float _56 = in.m_33.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_33.y;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = 1.0 / _54;
    float _70 = _68 * _60;
    float _72 = _68 * _66;
    float2 _282 = float2(_70, _72);
    float _74 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_282, float2(0.0), isnan(_282)), int2(0), component::x).w;
    uint _77 = spvSubgroupBallot(true).x;
    bool _81 = int(_77) != (-1);
    float _83 = -_74;
    float _85 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _87 = _74 != 1.0;
    bool _89 = isnan(_74);
    bool _91 = _87 || _89;
    bool _93 = isnan(1.0);
    bool _95 = _91 || _93;
    float _97 = 1.0 / _85;
    float _99 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _101 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[1].w, _99);
    int _103 = _95 ? as_type<int>(_101) : 1065353216;
    float _129;
    if (!_81)
    {
        int _105 = as_type<int>(_74);
        int _107 = 1;
        int _109 = 31;
        int _111;
        int _338 = _49(_105, _107, _109, _111, gl_SubgroupInvocationID);
        int _113 = _338;
        float _115 = precise::max(_74, as_type<float>(_113));
        int _117 = as_type<int>(_115);
        int _119 = 2;
        int _121 = 31;
        int _123;
        int _346 = _49(_117, _119, _121, _123, gl_SubgroupInvocationID);
        int _125 = _346;
        float _127 = precise::max(_115, as_type<float>(_125));
        _129 = _127;
        _131 = true;
    }
    else
    {
        float _133 = as_type<float>(gl_SubgroupInvocationID);
        uint _135 = spvSubgroupBallot(true).x;
        float _137 = as_type<float>(gl_SubgroupLtMask.x);
        int _139 = as_type<int>(_133) & (-4);
        uint _141 = min(uint(_139), 32u);
        bool _143 = _141 < 32u;
        int _145 = 15 << int(_141);
        int _147 = _143 ? _145 : 0;
        int _149 = int(_135) & as_type<int>(_137);
        int _151 = _147 & _149;
        int _153 = int(spvFindUMSB(uint(_151)));
        uint _155 = min(uint(_153), as_type<uint>(_133));
        int _157 = _147 & int(_135);
        int _159 = as_type<int>(_74);
        int _161 = int(_155);
        int _163 = 31;
        int _165;
        int _402 = _50(_159, _161, _163, _165, gl_SubgroupInvocationID);
        int _167 = _402;
        int _169 = int(spvFindUMSB(uint(_157)));
        int _171 = int(_155);
        int _173 = int(_155);
        int _175 = 30;
        int _177;
        int _412 = _50(_171, _173, _175, _177, gl_SubgroupInvocationID);
        int _179 = _412;
        float _181 = precise::max(_74, as_type<float>(_167));
        int _183 = as_type<int>(_181);
        int _185 = _179;
        int _187 = 31;
        int _189;
        int _420 = _50(_183, _185, _187, _189, gl_SubgroupInvocationID);
        int _191 = _420;
        float _193 = precise::max(_181, as_type<float>(_191));
        int _195 = as_type<int>(_193);
        int _197 = _169;
        int _199 = 31;
        int _201;
        int _428 = _50(_195, _197, _199, _201, gl_SubgroupInvocationID);
        int _203 = _428;
        _129 = as_type<float>(_203);
    }
    _131 = false;
    float _205 = _129;
    float _207 = as_type<float>(gl_SubgroupInvocationID);
    int _209 = as_type<int>(_207) & 3;
    bool _211 = _209 != 0;
    if (_211)
    {
        out.m_43.x = as_type<float>(_103);
        out.m_43.y = as_type<float>(_103);
        out.m_43.z = as_type<float>(_103);
        out.m_43.w = as_type<float>(_103);
        return main0_out_u{as_type<uint4>(out.m_43)};
    }
    float _213 = gl_FragCoord.x;
    float _215 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _217 = _213 / _215;
    float _219 = gl_FragCoord.y;
    float _221 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _223 = _219 / _221;
    float _225 = trunc(_217);
    int _227 = int(_225);
    float _229 = trunc(_223);
    int _231 = int(_229);
    int _233 = _227 >> 31;
    int _235 = _233 & 1;
    int _237 = _231 >> 31;
    int _239 = _227 + _235;
    int _241 = _237 & 1;
    int _243 = _239 >> 1;
    int _245 = _231 + _241;
    int _247 = _245 >> 1;
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_205, _205, _205, _205), uint2(int2(_243, _247)));
    out.m_43.x = as_type<float>(_103);
    out.m_43.y = as_type<float>(_103);
    out.m_43.z = as_type<float>(_103);
    out.m_43.w = as_type<float>(_103);
    return main0_out_u{as_type<uint4>(out.m_43)};
}

