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
    float4 m_45 [[color(0)]];
    float4 m_47 [[color(1)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _53(thread const int& _699, thread const int& _700, thread const int& _701, thread int& _702, thread uint& gl_SubgroupInvocationID)
{
    int _705 = _701 & 31;
    uint _707 = uint(int(uint(_701) >> uint(8)));
    int _709 = int(_707) & 31;
    float _711 = as_type<float>(gl_SubgroupInvocationID);
    int _713 = as_type<int>(_711) & _709;
    int _715 = ~_709;
    int _717 = _705 & _715;
    int _719 = _717 | _713;
    int _721 = as_type<int>(_711) ^ _700;
    bool _723 = uint(_721) <= uint(_719);
    _702 = _723 ? (-1) : 0;
    float _725 = spvSubgroupShuffle(as_type<float>(_699), uint(_721));
    uint _727 = uint(_723 ? as_type<int>(_725) : _699);
    return int(_727);
}

static inline __attribute__((always_inline))
int _54(thread const int& _775, thread const int& _776, thread const int& _777, thread int& _778, thread uint& gl_SubgroupInvocationID)
{
    int _781 = _777 & 31;
    uint _783 = uint(int(uint(_777) >> uint(8)));
    int _785 = int(_783) & 31;
    float _787 = as_type<float>(gl_SubgroupInvocationID);
    int _789 = as_type<int>(_787) & _785;
    int _791 = ~_785;
    int _793 = _781 & _791;
    int _795 = _793 | _789;
    int _797 = ~_785;
    int _799 = _776 & _797;
    int _801 = _799 | _789;
    bool _803 = uint(_801) <= uint(_795);
    _778 = _803 ? (-1) : 0;
    float _805 = spvSubgroupShuffle(as_type<float>(_775), uint(_801));
    uint _807 = uint(_803 ? as_type<int>(_805) : _775);
    return int(_807);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _140 = false;
    float _58 = gl_FragCoord.w;
    float _60 = in.m_35.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_35.y;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = 1.0 / _58;
    float _74 = _72 * _64;
    float _76 = _72 * _70;
    float2 _369 = float2(_74, _76);
    float _78 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_369, float2(0.0), isnan(_369)), int2(0), component::x).w;
    float2 _380 = float2(_74, _76);
    float4 _81 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_380, float2(0.0), isnan(_380)), int2(0), component::x).xyzw;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = _81.z;
    float _89 = _81.w;
    float _91 = in.m_35.z;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_35.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    uint _104 = spvSubgroupBallot(true).x;
    bool _108 = int(_104) != (-1);
    float _110 = _72 * _95;
    float _112 = _72 * _101;
    float _138;
    if (!_108)
    {
        int _114 = as_type<int>(_78);
        int _116 = 1;
        int _118 = 31;
        int _120;
        int _428 = _53(_114, _116, _118, _120, gl_SubgroupInvocationID);
        int _122 = _428;
        float _124 = precise::max(_78, as_type<float>(_122));
        int _126 = as_type<int>(_124);
        int _128 = 2;
        int _130 = 31;
        int _132;
        int _436 = _53(_126, _128, _130, _132, gl_SubgroupInvocationID);
        int _134 = _436;
        float _136 = precise::max(_124, as_type<float>(_134));
        _138 = _136;
        _140 = true;
    }
    else
    {
        float _142 = as_type<float>(gl_SubgroupInvocationID);
        uint _144 = spvSubgroupBallot(true).x;
        float _146 = as_type<float>(gl_SubgroupLtMask.x);
        int _148 = as_type<int>(_142) & (-4);
        uint _150 = min(uint(_148), 32u);
        bool _152 = _150 < 32u;
        int _154 = 15 << int(_150);
        int _156 = _152 ? _154 : 0;
        int _158 = int(_144) & as_type<int>(_146);
        int _160 = _156 & _158;
        int _162 = _156 & int(_144);
        int _164 = int(spvFindUMSB(uint(_160)));
        int _166 = int(spvFindUMSB(uint(_162)));
        uint _168 = min(uint(_164), as_type<uint>(_142));
        int _170 = as_type<int>(_78);
        int _172 = int(_168);
        int _174 = 31;
        int _176;
        int _496 = _54(_170, _172, _174, _176, gl_SubgroupInvocationID);
        int _178 = _496;
        int _180 = int(_168);
        int _182 = int(_168);
        int _184 = 30;
        int _186;
        int _502 = _54(_180, _182, _184, _186, gl_SubgroupInvocationID);
        int _188 = _502;
        float _190 = precise::max(_78, as_type<float>(_178));
        int _192 = as_type<int>(_190);
        int _194 = _188;
        int _196 = 31;
        int _198;
        int _510 = _54(_192, _194, _196, _198, gl_SubgroupInvocationID);
        int _200 = _510;
        float _202 = precise::max(_190, as_type<float>(_200));
        int _204 = as_type<int>(_202);
        int _206 = _166;
        int _208 = 31;
        int _210;
        int _518 = _54(_204, _206, _208, _210, gl_SubgroupInvocationID);
        int _212 = _518;
        _138 = as_type<float>(_212);
    }
    _140 = false;
    float _214 = _138;
    float _216 = as_type<float>(gl_SubgroupInvocationID);
    float _218 = floor(_110);
    float _220 = -_78;
    float _222 = _220 + _89;
    float _224 = -_78;
    float _226 = _224 + _83;
    float _228 = -_78;
    float _230 = _228 + _85;
    float _232 = -_78;
    float _234 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _236 = -_78;
    float _238 = _236 + _87;
    float _240 = abs(_230);
    float _242 = -_240;
    float _244 = abs(_222);
    float _246 = _242 + _244;
    float _248 = floor(_112);
    float _250 = abs(_226);
    float _252 = abs(_238);
    float _254 = -_252;
    float _256 = _250 + _254;
    float _258 = _246 + _256;
    float _260 = -_256;
    float _262 = _246 + _260;
    float _264 = 1.0 / _234;
    float _266 = -_218;
    float _268 = _110 + _266;
    int _270 = as_type<int>(_216) & 3;
    bool _272 = _270 != 0;
    float _274 = -_248;
    float _276 = _112 + _274;
    float _278 = _264 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _280 = fma(_278, _258, _268);
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = fma(_278, _262, _276);
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = -_268;
    float _290 = _288 + _282;
    float _292 = -_276;
    float _294 = _292 + _286;
    if (!_272)
    {
        float _296 = gl_FragCoord.y;
        float _298 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _300 = _296 / _298;
        float _302 = gl_FragCoord.x;
        float _304 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _306 = _302 / _304;
        float _308 = trunc(_300);
        int _310 = int(_308);
        float _312 = trunc(_306);
        int _314 = int(_312);
        int _316 = _310 >> 31;
        int _318 = _316 & 1;
        int _320 = _314 >> 31;
        int _322 = _310 + _318;
        int _324 = _320 & 1;
        int _326 = _314 + _324;
        int _328 = _326 >> 1;
        int _330 = _322 >> 1;
        spvDescriptorSet0.fp_i_tcb_48_.write(float4(_214, _214, _214, _214), uint2(int2(_328, _330)));
    }
    float _332 = fma(_290, 0.5, 0.5);
    float _334 = fma(_294, 0.5, 0.5);
    out.m_45.x = _78;
    out.m_45.y = _78;
    out.m_45.z = _78;
    out.m_45.w = _78;
    out.m_47.x = _332;
    out.m_47.y = _334;
    return out;
}

