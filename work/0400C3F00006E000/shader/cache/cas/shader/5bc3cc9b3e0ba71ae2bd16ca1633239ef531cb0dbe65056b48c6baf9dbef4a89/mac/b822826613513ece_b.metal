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
    float4 m_46 [[color(0)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _52(thread const int& _523, thread const int& _524, thread const int& _525, thread int& _526, thread uint& gl_SubgroupInvocationID)
{
    int _529 = _525 & 31;
    uint _531 = uint(int(uint(_525) >> uint(8)));
    int _533 = int(_531) & 31;
    float _535 = as_type<float>(gl_SubgroupInvocationID);
    int _537 = as_type<int>(_535) & _533;
    int _539 = ~_533;
    int _541 = _529 & _539;
    int _543 = _541 | _537;
    int _545 = as_type<int>(_535) ^ _524;
    bool _547 = uint(_545) <= uint(_543);
    _526 = _547 ? (-1) : 0;
    float _549 = spvSubgroupShuffle(as_type<float>(_523), uint(_545));
    uint _551 = uint(_547 ? as_type<int>(_549) : _523);
    return int(_551);
}

static inline __attribute__((always_inline))
int _53(thread const int& _599, thread const int& _600, thread const int& _601, thread int& _602, thread uint& gl_SubgroupInvocationID)
{
    int _605 = _601 & 31;
    uint _607 = uint(int(uint(_601) >> uint(8)));
    int _609 = int(_607) & 31;
    float _611 = as_type<float>(gl_SubgroupInvocationID);
    int _613 = as_type<int>(_611) & _609;
    int _615 = ~_609;
    int _617 = _605 & _615;
    int _619 = _617 | _613;
    int _621 = ~_609;
    int _623 = _600 & _621;
    int _625 = _623 | _613;
    bool _627 = uint(_625) <= uint(_619);
    _602 = _627 ? (-1) : 0;
    float _629 = spvSubgroupShuffle(as_type<float>(_599), uint(_625));
    uint _631 = uint(_627 ? as_type<int>(_629) : _599);
    return int(_631);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _134 = false;
    float _57 = gl_FragCoord.w;
    float _59 = in.m_33.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _57;
    float _73 = _71 * _63;
    float _75 = _71 * _69;
    float2 _285 = float2(_73, _75);
    float _77 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_285, float2(0.0), isnan(_285)), int2(0), component::x).w;
    uint _80 = spvSubgroupBallot(true).x;
    bool _84 = int(_80) != (-1);
    float _86 = -_77;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _90 = _77 != 1.0;
    bool _92 = isnan(_77);
    bool _94 = _90 || _92;
    bool _96 = isnan(1.0);
    bool _98 = _94 || _96;
    float _100 = 1.0 / _88;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[1].w, _102);
    int _106 = _98 ? as_type<int>(_104) : 1065353216;
    float _132;
    if (!_84)
    {
        int _108 = as_type<int>(_77);
        int _110 = 1;
        int _112 = 31;
        int _114;
        int _341 = _52(_108, _110, _112, _114, gl_SubgroupInvocationID);
        int _116 = _341;
        float _118 = precise::max(_77, as_type<float>(_116));
        int _120 = as_type<int>(_118);
        int _122 = 2;
        int _124 = 31;
        int _126;
        int _349 = _52(_120, _122, _124, _126, gl_SubgroupInvocationID);
        int _128 = _349;
        float _130 = precise::max(_118, as_type<float>(_128));
        _132 = _130;
        _134 = true;
    }
    else
    {
        float _136 = as_type<float>(gl_SubgroupInvocationID);
        uint _138 = spvSubgroupBallot(true).x;
        float _140 = as_type<float>(gl_SubgroupLtMask.x);
        int _142 = as_type<int>(_136) & (-4);
        uint _144 = min(uint(_142), 32u);
        bool _146 = _144 < 32u;
        int _148 = 15 << int(_144);
        int _150 = _146 ? _148 : 0;
        int _152 = int(_138) & as_type<int>(_140);
        int _154 = _150 & _152;
        int _156 = _150 & int(_138);
        int _158 = int(spvFindUMSB(uint(_154)));
        uint _160 = min(uint(_158), as_type<uint>(_136));
        int _162 = int(spvFindUMSB(uint(_156)));
        int _164 = as_type<int>(_77);
        int _166 = int(_160);
        int _168 = 31;
        int _170;
        int _409 = _53(_164, _166, _168, _170, gl_SubgroupInvocationID);
        int _172 = _409;
        int _174 = int(_160);
        int _176 = int(_160);
        int _178 = 30;
        int _180;
        int _415 = _53(_174, _176, _178, _180, gl_SubgroupInvocationID);
        int _182 = _415;
        float _184 = precise::max(_77, as_type<float>(_172));
        int _186 = as_type<int>(_184);
        int _188 = _182;
        int _190 = 31;
        int _192;
        int _423 = _53(_186, _188, _190, _192, gl_SubgroupInvocationID);
        int _194 = _423;
        float _196 = precise::max(_184, as_type<float>(_194));
        int _198 = as_type<int>(_196);
        int _200 = _162;
        int _202 = 31;
        int _204;
        int _431 = _53(_198, _200, _202, _204, gl_SubgroupInvocationID);
        int _206 = _431;
        _132 = as_type<float>(_206);
    }
    _134 = false;
    float _208 = _132;
    float _210 = as_type<float>(gl_SubgroupInvocationID);
    int _212 = as_type<int>(_210) & 3;
    bool _214 = _212 != 0;
    if (_214)
    {
        out.gl_FragDepth = _77;
        out.m_46.x = as_type<float>(_106);
        out.m_46.y = as_type<float>(_106);
        out.m_46.z = as_type<float>(_106);
        out.m_46.w = as_type<float>(_106);
        return out;
    }
    float _216 = gl_FragCoord.x;
    float _218 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _220 = _216 / _218;
    float _222 = gl_FragCoord.y;
    float _224 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _226 = _222 / _224;
    float _228 = trunc(_220);
    int _230 = int(_228);
    float _232 = trunc(_226);
    int _234 = int(_232);
    int _236 = _230 >> 31;
    int _238 = _236 & 1;
    int _240 = _234 >> 31;
    int _242 = _230 + _238;
    int _244 = _240 & 1;
    int _246 = _242 >> 1;
    int _248 = _234 + _244;
    int _250 = _248 >> 1;
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_208, _208, _208, _208), uint2(int2(_246, _250)));
    out.gl_FragDepth = _77;
    out.m_46.x = as_type<float>(_106);
    out.m_46.y = as_type<float>(_106);
    out.m_46.z = as_type<float>(_106);
    out.m_46.w = as_type<float>(_106);
    return out;
}


struct main0_out_u
{
    uint4 m_46 [[color(0)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _134 = false;
    float _57 = gl_FragCoord.w;
    float _59 = in.m_33.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _57;
    float _73 = _71 * _63;
    float _75 = _71 * _69;
    float2 _285 = float2(_73, _75);
    float _77 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_285, float2(0.0), isnan(_285)), int2(0), component::x).w;
    uint _80 = spvSubgroupBallot(true).x;
    bool _84 = int(_80) != (-1);
    float _86 = -_77;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _90 = _77 != 1.0;
    bool _92 = isnan(_77);
    bool _94 = _90 || _92;
    bool _96 = isnan(1.0);
    bool _98 = _94 || _96;
    float _100 = 1.0 / _88;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[1].w, _102);
    int _106 = _98 ? as_type<int>(_104) : 1065353216;
    float _132;
    if (!_84)
    {
        int _108 = as_type<int>(_77);
        int _110 = 1;
        int _112 = 31;
        int _114;
        int _341 = _52(_108, _110, _112, _114, gl_SubgroupInvocationID);
        int _116 = _341;
        float _118 = precise::max(_77, as_type<float>(_116));
        int _120 = as_type<int>(_118);
        int _122 = 2;
        int _124 = 31;
        int _126;
        int _349 = _52(_120, _122, _124, _126, gl_SubgroupInvocationID);
        int _128 = _349;
        float _130 = precise::max(_118, as_type<float>(_128));
        _132 = _130;
        _134 = true;
    }
    else
    {
        float _136 = as_type<float>(gl_SubgroupInvocationID);
        uint _138 = spvSubgroupBallot(true).x;
        float _140 = as_type<float>(gl_SubgroupLtMask.x);
        int _142 = as_type<int>(_136) & (-4);
        uint _144 = min(uint(_142), 32u);
        bool _146 = _144 < 32u;
        int _148 = 15 << int(_144);
        int _150 = _146 ? _148 : 0;
        int _152 = int(_138) & as_type<int>(_140);
        int _154 = _150 & _152;
        int _156 = _150 & int(_138);
        int _158 = int(spvFindUMSB(uint(_154)));
        uint _160 = min(uint(_158), as_type<uint>(_136));
        int _162 = int(spvFindUMSB(uint(_156)));
        int _164 = as_type<int>(_77);
        int _166 = int(_160);
        int _168 = 31;
        int _170;
        int _409 = _53(_164, _166, _168, _170, gl_SubgroupInvocationID);
        int _172 = _409;
        int _174 = int(_160);
        int _176 = int(_160);
        int _178 = 30;
        int _180;
        int _415 = _53(_174, _176, _178, _180, gl_SubgroupInvocationID);
        int _182 = _415;
        float _184 = precise::max(_77, as_type<float>(_172));
        int _186 = as_type<int>(_184);
        int _188 = _182;
        int _190 = 31;
        int _192;
        int _423 = _53(_186, _188, _190, _192, gl_SubgroupInvocationID);
        int _194 = _423;
        float _196 = precise::max(_184, as_type<float>(_194));
        int _198 = as_type<int>(_196);
        int _200 = _162;
        int _202 = 31;
        int _204;
        int _431 = _53(_198, _200, _202, _204, gl_SubgroupInvocationID);
        int _206 = _431;
        _132 = as_type<float>(_206);
    }
    _134 = false;
    float _208 = _132;
    float _210 = as_type<float>(gl_SubgroupInvocationID);
    int _212 = as_type<int>(_210) & 3;
    bool _214 = _212 != 0;
    if (_214)
    {
        out.gl_FragDepth = _77;
        out.m_46.x = as_type<float>(_106);
        out.m_46.y = as_type<float>(_106);
        out.m_46.z = as_type<float>(_106);
        out.m_46.w = as_type<float>(_106);
        return main0_out_u{as_type<uint4>(out.m_46), out.gl_FragDepth};
    }
    float _216 = gl_FragCoord.x;
    float _218 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _220 = _216 / _218;
    float _222 = gl_FragCoord.y;
    float _224 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _226 = _222 / _224;
    float _228 = trunc(_220);
    int _230 = int(_228);
    float _232 = trunc(_226);
    int _234 = int(_232);
    int _236 = _230 >> 31;
    int _238 = _236 & 1;
    int _240 = _234 >> 31;
    int _242 = _230 + _238;
    int _244 = _240 & 1;
    int _246 = _242 >> 1;
    int _248 = _234 + _244;
    int _250 = _248 >> 1;
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_208, _208, _208, _208), uint2(int2(_246, _250)));
    out.gl_FragDepth = _77;
    out.m_46.x = as_type<float>(_106);
    out.m_46.y = as_type<float>(_106);
    out.m_46.z = as_type<float>(_106);
    out.m_46.w = as_type<float>(_106);
    return main0_out_u{as_type<uint4>(out.m_46), out.gl_FragDepth};
}

