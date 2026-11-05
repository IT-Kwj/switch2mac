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
    texture2d<float, access::write> fp_i_tcb_4A_ [[id(5)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
    float4 m_47 [[color(2)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _53(thread const int& _556, thread const int& _557, thread const int& _558, thread int& _559, thread uint& gl_SubgroupInvocationID)
{
    int _562 = _558 & 31;
    uint _564 = uint(int(uint(_558) >> uint(8)));
    int _566 = int(_564) & 31;
    float _568 = as_type<float>(gl_SubgroupInvocationID);
    int _570 = as_type<int>(_568) & _566;
    int _572 = ~_566;
    int _574 = _562 & _572;
    int _576 = _574 | _570;
    int _578 = as_type<int>(_568) ^ _557;
    bool _580 = uint(_578) <= uint(_576);
    _559 = _580 ? (-1) : 0;
    float _582 = spvSubgroupShuffle(as_type<float>(_556), uint(_578));
    uint _584 = uint(_580 ? as_type<int>(_582) : _556);
    return int(_584);
}

static inline __attribute__((always_inline))
int _54(thread const int& _632, thread const int& _633, thread const int& _634, thread int& _635, thread uint& gl_SubgroupInvocationID)
{
    int _638 = _634 & 31;
    uint _640 = uint(int(uint(_634) >> uint(8)));
    int _642 = int(_640) & 31;
    float _644 = as_type<float>(gl_SubgroupInvocationID);
    int _646 = as_type<int>(_644) & _642;
    int _648 = ~_642;
    int _650 = _638 & _648;
    int _652 = _650 | _646;
    int _654 = ~_642;
    int _656 = _633 & _654;
    int _658 = _656 | _646;
    bool _660 = uint(_658) <= uint(_652);
    _635 = _660 ? (-1) : 0;
    float _662 = spvSubgroupShuffle(as_type<float>(_632), uint(_658));
    uint _664 = uint(_660 ? as_type<int>(_662) : _632);
    return int(_664);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _148 = false;
    float _58 = gl_FragCoord.w;
    float _60 = in.m_35.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_35.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = 1.0 / _58;
    float _74 = _72 * _64;
    float _76 = _72 * _70;
    float2 _303 = float2(_76, _74);
    float4 _79 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_303, float2(0.0), isnan(_303)), int2(0), component::x).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = gl_FragCoord.x;
    float _91 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _93 = _89 / _91;
    float _95 = gl_FragCoord.y;
    float _97 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _99 = _95 / _97;
    float _101 = trunc(_93);
    int _103 = int(_101);
    float _105 = trunc(_99);
    int _107 = int(_105);
    float _109 = precise::max(_81, _83);
    uint _112 = spvSubgroupBallot(true).x;
    float _114 = precise::max(_85, _87);
    bool _118 = int(_112) != (-1);
    float _120 = precise::max(_109, _114);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_120, _120, _120, _120), uint2(int2(_103, _107)));
    float _146;
    if (!_118)
    {
        int _122 = as_type<int>(_120);
        int _124 = 1;
        int _126 = 31;
        int _128;
        int _377 = _53(_122, _124, _126, _128, gl_SubgroupInvocationID);
        int _130 = _377;
        float _132 = precise::max(_120, as_type<float>(_130));
        int _134 = as_type<int>(_132);
        int _136 = 2;
        int _138 = 31;
        int _140;
        int _385 = _53(_134, _136, _138, _140, gl_SubgroupInvocationID);
        int _142 = _385;
        float _144 = precise::max(_132, as_type<float>(_142));
        _146 = _144;
        _148 = true;
    }
    else
    {
        float _150 = as_type<float>(gl_SubgroupInvocationID);
        uint _152 = spvSubgroupBallot(true).x;
        float _154 = as_type<float>(gl_SubgroupLtMask.x);
        int _156 = as_type<int>(_150) & (-4);
        uint _158 = min(uint(_156), 32u);
        bool _160 = _158 < 32u;
        int _162 = 15 << int(_158);
        int _164 = _160 ? _162 : 0;
        int _166 = int(_152) & as_type<int>(_154);
        int _168 = _164 & _166;
        int _170 = _164 & int(_152);
        int _172 = int(spvFindUMSB(uint(_168)));
        int _174 = int(spvFindUMSB(uint(_170)));
        uint _176 = min(uint(_172), as_type<uint>(_150));
        int _178 = as_type<int>(_120);
        int _180 = int(_176);
        int _182 = 31;
        int _184;
        int _445 = _54(_178, _180, _182, _184, gl_SubgroupInvocationID);
        int _186 = _445;
        int _188 = int(_176);
        int _190 = int(_176);
        int _192 = 30;
        int _194;
        int _451 = _54(_188, _190, _192, _194, gl_SubgroupInvocationID);
        int _196 = _451;
        float _198 = precise::max(_120, as_type<float>(_186));
        int _200 = as_type<int>(_198);
        int _202 = _196;
        int _204 = 31;
        int _206;
        int _459 = _54(_200, _202, _204, _206, gl_SubgroupInvocationID);
        int _208 = _459;
        float _210 = precise::max(_198, as_type<float>(_208));
        int _212 = as_type<int>(_210);
        int _214 = _174;
        int _216 = 31;
        int _218;
        int _467 = _54(_212, _214, _216, _218, gl_SubgroupInvocationID);
        int _220 = _467;
        _146 = as_type<float>(_220);
    }
    _148 = false;
    float _222 = _146;
    float _224 = as_type<float>(gl_SubgroupInvocationID);
    bool _226 = _120 >= 1.0;
    bool _228 = isnan(_120);
    bool _230 = _226 || _228;
    bool _232 = isnan(1.0);
    bool _234 = _230 || _232;
    float _236 = -_120;
    float _238 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _240 = 1.0 / _238;
    int _242 = as_type<int>(_224) & 3;
    bool _244 = _242 != 0;
    float _246 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _248 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[1].w, _246);
    if (!_244)
    {
        int _250 = _103 >> 31;
        int _252 = _107 >> 31;
        int _254 = _250 & 1;
        int _256 = _252 & 1;
        int _258 = _103 + _254;
        int _260 = _107 + _256;
        int _262 = _258 >> 1;
        int _264 = _260 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_222, _222, _222, _222), uint2(int2(_262, _264)));
    }
    bool _266 = !_234;
    int _268 = _266 ? as_type<int>(_248) : 1065353216;
    out.m_45.x = _87;
    out.m_45.y = _87;
    out.m_45.z = _87;
    out.m_45.w = _87;
    out.m_47.x = as_type<float>(_268);
    return out;
}


struct main0_out_u
{
    uint4 m_45 [[color(0)]];
    uint4 m_47 [[color(2)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _148 = false;
    float _58 = gl_FragCoord.w;
    float _60 = in.m_35.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_35.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = 1.0 / _58;
    float _74 = _72 * _64;
    float _76 = _72 * _70;
    float2 _303 = float2(_76, _74);
    float4 _79 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_303, float2(0.0), isnan(_303)), int2(0), component::x).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = gl_FragCoord.x;
    float _91 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _93 = _89 / _91;
    float _95 = gl_FragCoord.y;
    float _97 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _99 = _95 / _97;
    float _101 = trunc(_93);
    int _103 = int(_101);
    float _105 = trunc(_99);
    int _107 = int(_105);
    float _109 = precise::max(_81, _83);
    uint _112 = spvSubgroupBallot(true).x;
    float _114 = precise::max(_85, _87);
    bool _118 = int(_112) != (-1);
    float _120 = precise::max(_109, _114);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_120, _120, _120, _120), uint2(int2(_103, _107)));
    float _146;
    if (!_118)
    {
        int _122 = as_type<int>(_120);
        int _124 = 1;
        int _126 = 31;
        int _128;
        int _377 = _53(_122, _124, _126, _128, gl_SubgroupInvocationID);
        int _130 = _377;
        float _132 = precise::max(_120, as_type<float>(_130));
        int _134 = as_type<int>(_132);
        int _136 = 2;
        int _138 = 31;
        int _140;
        int _385 = _53(_134, _136, _138, _140, gl_SubgroupInvocationID);
        int _142 = _385;
        float _144 = precise::max(_132, as_type<float>(_142));
        _146 = _144;
        _148 = true;
    }
    else
    {
        float _150 = as_type<float>(gl_SubgroupInvocationID);
        uint _152 = spvSubgroupBallot(true).x;
        float _154 = as_type<float>(gl_SubgroupLtMask.x);
        int _156 = as_type<int>(_150) & (-4);
        uint _158 = min(uint(_156), 32u);
        bool _160 = _158 < 32u;
        int _162 = 15 << int(_158);
        int _164 = _160 ? _162 : 0;
        int _166 = int(_152) & as_type<int>(_154);
        int _168 = _164 & _166;
        int _170 = _164 & int(_152);
        int _172 = int(spvFindUMSB(uint(_168)));
        int _174 = int(spvFindUMSB(uint(_170)));
        uint _176 = min(uint(_172), as_type<uint>(_150));
        int _178 = as_type<int>(_120);
        int _180 = int(_176);
        int _182 = 31;
        int _184;
        int _445 = _54(_178, _180, _182, _184, gl_SubgroupInvocationID);
        int _186 = _445;
        int _188 = int(_176);
        int _190 = int(_176);
        int _192 = 30;
        int _194;
        int _451 = _54(_188, _190, _192, _194, gl_SubgroupInvocationID);
        int _196 = _451;
        float _198 = precise::max(_120, as_type<float>(_186));
        int _200 = as_type<int>(_198);
        int _202 = _196;
        int _204 = 31;
        int _206;
        int _459 = _54(_200, _202, _204, _206, gl_SubgroupInvocationID);
        int _208 = _459;
        float _210 = precise::max(_198, as_type<float>(_208));
        int _212 = as_type<int>(_210);
        int _214 = _174;
        int _216 = 31;
        int _218;
        int _467 = _54(_212, _214, _216, _218, gl_SubgroupInvocationID);
        int _220 = _467;
        _146 = as_type<float>(_220);
    }
    _148 = false;
    float _222 = _146;
    float _224 = as_type<float>(gl_SubgroupInvocationID);
    bool _226 = _120 >= 1.0;
    bool _228 = isnan(_120);
    bool _230 = _226 || _228;
    bool _232 = isnan(1.0);
    bool _234 = _230 || _232;
    float _236 = -_120;
    float _238 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _240 = 1.0 / _238;
    int _242 = as_type<int>(_224) & 3;
    bool _244 = _242 != 0;
    float _246 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _248 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[1].w, _246);
    if (!_244)
    {
        int _250 = _103 >> 31;
        int _252 = _107 >> 31;
        int _254 = _250 & 1;
        int _256 = _252 & 1;
        int _258 = _103 + _254;
        int _260 = _107 + _256;
        int _262 = _258 >> 1;
        int _264 = _260 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_222, _222, _222, _222), uint2(int2(_262, _264)));
    }
    bool _266 = !_234;
    int _268 = _266 ? as_type<int>(_248) : 1065353216;
    out.m_45.x = _87;
    out.m_45.y = _87;
    out.m_45.z = _87;
    out.m_45.w = _87;
    out.m_47.x = as_type<float>(_268);
    return main0_out_u{as_type<uint4>(out.m_45), as_type<uint4>(out.m_47)};
}


struct main0_out_m
{
    float4 m_45 [[color(0)]];
    uint4 m_47 [[color(2)]];
};

fragment main0_out_m main0_m(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _148 = false;
    float _58 = gl_FragCoord.w;
    float _60 = in.m_35.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_35.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = 1.0 / _58;
    float _74 = _72 * _64;
    float _76 = _72 * _70;
    float2 _303 = float2(_76, _74);
    float4 _79 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_303, float2(0.0), isnan(_303)), int2(0), component::x).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = gl_FragCoord.x;
    float _91 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _93 = _89 / _91;
    float _95 = gl_FragCoord.y;
    float _97 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _99 = _95 / _97;
    float _101 = trunc(_93);
    int _103 = int(_101);
    float _105 = trunc(_99);
    int _107 = int(_105);
    float _109 = precise::max(_81, _83);
    uint _112 = spvSubgroupBallot(true).x;
    float _114 = precise::max(_85, _87);
    bool _118 = int(_112) != (-1);
    float _120 = precise::max(_109, _114);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_120, _120, _120, _120), uint2(int2(_103, _107)));
    float _146;
    if (!_118)
    {
        int _122 = as_type<int>(_120);
        int _124 = 1;
        int _126 = 31;
        int _128;
        int _377 = _53(_122, _124, _126, _128, gl_SubgroupInvocationID);
        int _130 = _377;
        float _132 = precise::max(_120, as_type<float>(_130));
        int _134 = as_type<int>(_132);
        int _136 = 2;
        int _138 = 31;
        int _140;
        int _385 = _53(_134, _136, _138, _140, gl_SubgroupInvocationID);
        int _142 = _385;
        float _144 = precise::max(_132, as_type<float>(_142));
        _146 = _144;
        _148 = true;
    }
    else
    {
        float _150 = as_type<float>(gl_SubgroupInvocationID);
        uint _152 = spvSubgroupBallot(true).x;
        float _154 = as_type<float>(gl_SubgroupLtMask.x);
        int _156 = as_type<int>(_150) & (-4);
        uint _158 = min(uint(_156), 32u);
        bool _160 = _158 < 32u;
        int _162 = 15 << int(_158);
        int _164 = _160 ? _162 : 0;
        int _166 = int(_152) & as_type<int>(_154);
        int _168 = _164 & _166;
        int _170 = _164 & int(_152);
        int _172 = int(spvFindUMSB(uint(_168)));
        int _174 = int(spvFindUMSB(uint(_170)));
        uint _176 = min(uint(_172), as_type<uint>(_150));
        int _178 = as_type<int>(_120);
        int _180 = int(_176);
        int _182 = 31;
        int _184;
        int _445 = _54(_178, _180, _182, _184, gl_SubgroupInvocationID);
        int _186 = _445;
        int _188 = int(_176);
        int _190 = int(_176);
        int _192 = 30;
        int _194;
        int _451 = _54(_188, _190, _192, _194, gl_SubgroupInvocationID);
        int _196 = _451;
        float _198 = precise::max(_120, as_type<float>(_186));
        int _200 = as_type<int>(_198);
        int _202 = _196;
        int _204 = 31;
        int _206;
        int _459 = _54(_200, _202, _204, _206, gl_SubgroupInvocationID);
        int _208 = _459;
        float _210 = precise::max(_198, as_type<float>(_208));
        int _212 = as_type<int>(_210);
        int _214 = _174;
        int _216 = 31;
        int _218;
        int _467 = _54(_212, _214, _216, _218, gl_SubgroupInvocationID);
        int _220 = _467;
        _146 = as_type<float>(_220);
    }
    _148 = false;
    float _222 = _146;
    float _224 = as_type<float>(gl_SubgroupInvocationID);
    bool _226 = _120 >= 1.0;
    bool _228 = isnan(_120);
    bool _230 = _226 || _228;
    bool _232 = isnan(1.0);
    bool _234 = _230 || _232;
    float _236 = -_120;
    float _238 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _240 = 1.0 / _238;
    int _242 = as_type<int>(_224) & 3;
    bool _244 = _242 != 0;
    float _246 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _248 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[1].w, _246);
    if (!_244)
    {
        int _250 = _103 >> 31;
        int _252 = _107 >> 31;
        int _254 = _250 & 1;
        int _256 = _252 & 1;
        int _258 = _103 + _254;
        int _260 = _107 + _256;
        int _262 = _258 >> 1;
        int _264 = _260 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_222, _222, _222, _222), uint2(int2(_262, _264)));
    }
    bool _266 = !_234;
    int _268 = _266 ? as_type<int>(_248) : 1065353216;
    out.m_45.x = _87;
    out.m_45.y = _87;
    out.m_45.z = _87;
    out.m_45.w = _87;
    out.m_47.x = as_type<float>(_268);
    return main0_out_m{out.m_45, as_type<uint4>(out.m_47)};
}

