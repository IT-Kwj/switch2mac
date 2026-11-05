#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
};

struct main0_out
{
    float4 m_29 [[color(0)]];
};

struct main0_in
{
    float4 m_24 [[user(locn0)]];
    float4 m_26 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _38(thread const int& _632, thread const int& _633, thread const int& _634, thread int& _635, thread uint& gl_SubgroupInvocationID)
{
    int _638 = _634 & 31;
    uint _641 = uint(int(uint(_634) >> uint(8)));
    int _643 = int(_641) & 31;
    float _645 = as_type<float>(gl_SubgroupInvocationID);
    int _647 = as_type<int>(_645) & _643;
    int _649 = ~_643;
    int _651 = _638 & _649;
    int _653 = _651 | _647;
    int _655 = as_type<int>(_645) ^ _633;
    bool _659 = uint(_655) <= uint(_653);
    _635 = _659 ? (-1) : 0;
    float _661 = spvSubgroupShuffle(as_type<float>(_632), uint(_655));
    uint _663 = uint(_659 ? as_type<int>(_661) : _632);
    return int(_663);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _42 = gl_FragCoord.w;
    float _44 = in.m_24.y;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = in.m_24.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_24.z;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_26.y;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_26.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_26.z;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _42;
    float _82 = _80 * _48;
    float _84 = _80 * _54;
    float _86 = _80 * _60;
    float _88 = _80 * _66;
    float _90 = _80 * _72;
    int _92 = as_type<int>(_82);
    int _94 = 1;
    int _96 = 7171;
    int _98;
    int _351 = _38(_92, _94, _96, _98, gl_SubgroupInvocationID);
    int _100 = _351;
    float _102 = _80 * _78;
    int _104 = as_type<int>(_82);
    int _106 = 2;
    int _108 = 7171;
    int _110;
    int _357 = _38(_104, _106, _108, _110, gl_SubgroupInvocationID);
    int _112 = _357;
    int _114 = as_type<int>(_84);
    int _116 = 1;
    int _118 = 7171;
    int _120;
    int _360 = _38(_114, _116, _118, _120, gl_SubgroupInvocationID);
    int _122 = _360;
    int _124 = as_type<int>(_84);
    int _126 = 2;
    int _128 = 7171;
    int _130;
    int _363 = _38(_124, _126, _128, _130, gl_SubgroupInvocationID);
    int _132 = _363;
    int _134 = as_type<int>(_86);
    int _136 = 2;
    int _138 = 7171;
    int _140;
    int _366 = _38(_134, _136, _138, _140, gl_SubgroupInvocationID);
    int _142 = _366;
    int _144 = as_type<int>(_86);
    int _146 = 1;
    int _148 = 7171;
    int _150;
    int _369 = _38(_144, _146, _148, _150, gl_SubgroupInvocationID);
    int _152 = _369;
    int _154 = as_type<int>(_88);
    int _156 = 1;
    int _158 = 7171;
    int _160;
    int _372 = _38(_154, _156, _158, _160, gl_SubgroupInvocationID);
    int _162 = _372;
    uint _387 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _164 = (as_type<float>(_100) * float4(1.0, -1.0, 1.0, 0.0)[_387]) + (_82 * float4(1.0, 1.0, -1.0, 1.0)[_387]);
    int _166 = as_type<int>(_88);
    int _168 = 2;
    int _170 = 7171;
    int _172;
    int _395 = _38(_166, _168, _170, _172, gl_SubgroupInvocationID);
    int _174 = _395;
    uint _404 = (90u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _176 = (as_type<float>(_112) * float4(1.0, -1.0, 1.0, 0.0)[_404]) + (_82 * float4(1.0, 1.0, -1.0, 1.0)[_404]);
    float _178 = _164 * _164;
    int _180 = as_type<int>(_90);
    int _182 = 1;
    int _184 = 7171;
    int _186;
    int _415 = _38(_180, _182, _184, _186, gl_SubgroupInvocationID);
    int _188 = _415;
    uint _423 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _190 = (as_type<float>(_122) * float4(1.0, -1.0, 1.0, 0.0)[_423]) + (_84 * float4(1.0, 1.0, -1.0, 1.0)[_423]);
    float _192 = _176 * _176;
    int _194 = as_type<int>(_90);
    int _196 = 2;
    int _198 = 7171;
    int _200;
    int _434 = _38(_194, _196, _198, _200, gl_SubgroupInvocationID);
    int _202 = _434;
    uint _442 = (90u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _204 = (as_type<float>(_132) * float4(1.0, -1.0, 1.0, 0.0)[_442]) + (_84 * float4(1.0, 1.0, -1.0, 1.0)[_442]);
    float _206 = fma(_190, _190, _178);
    int _208 = as_type<int>(_102);
    int _210 = 1;
    int _212 = 7171;
    int _214;
    int _455 = _38(_208, _210, _212, _214, gl_SubgroupInvocationID);
    int _216 = _455;
    uint _463 = (90u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _218 = (as_type<float>(_142) * float4(1.0, -1.0, 1.0, 0.0)[_463]) + (_86 * float4(1.0, 1.0, -1.0, 1.0)[_463]);
    float _220 = fma(_204, _204, _192);
    int _222 = as_type<int>(_102);
    int _224 = 2;
    int _226 = 7171;
    int _228;
    int _475 = _38(_222, _224, _226, _228, gl_SubgroupInvocationID);
    int _230 = _475;
    uint _483 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _232 = (as_type<float>(_152) * float4(1.0, -1.0, 1.0, 0.0)[_483]) + (_86 * float4(1.0, 1.0, -1.0, 1.0)[_483]);
    float _234 = fma(_218, _218, _220);
    float _236 = fma(_232, _232, _206);
    uint _504 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _238 = (as_type<float>(_162) * float4(1.0, -1.0, 1.0, 0.0)[_504]) + (_88 * float4(1.0, 1.0, -1.0, 1.0)[_504]);
    uint _517 = (90u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _240 = (as_type<float>(_174) * float4(1.0, -1.0, 1.0, 0.0)[_517]) + (_88 * float4(1.0, 1.0, -1.0, 1.0)[_517]);
    float _242 = sqrt(_236);
    float _244 = _238 * _238;
    uint _535 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _246 = (as_type<float>(_188) * float4(1.0, -1.0, 1.0, 0.0)[_535]) + (_90 * float4(1.0, 1.0, -1.0, 1.0)[_535]);
    float _248 = _240 * _240;
    uint _551 = (90u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _250 = (as_type<float>(_202) * float4(1.0, -1.0, 1.0, 0.0)[_551]) + (_90 * float4(1.0, 1.0, -1.0, 1.0)[_551]);
    float _252 = sqrt(_234);
    float _254 = fma(_246, _246, _244);
    uint _570 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _256 = (as_type<float>(_216) * float4(1.0, -1.0, 1.0, 0.0)[_570]) + (_102 * float4(1.0, 1.0, -1.0, 1.0)[_570]);
    float _258 = fma(_250, _250, _248);
    uint _587 = (90u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _260 = (as_type<float>(_230) * float4(1.0, -1.0, 1.0, 0.0)[_587]) + (_102 * float4(1.0, 1.0, -1.0, 1.0)[_587]);
    float _262 = fma(_256, _256, _254);
    float _264 = fma(_260, _260, _258);
    float _266 = sqrt(_262);
    float _268 = _242 * _252;
    float _270 = sqrt(_264);
    float _272 = 1.0 / _268;
    float _274 = _266 * _270;
    float _276 = _274 * _272;
    float _278 = precise::max(0.0, _276);
    float _280 = precise::min(_278, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    out.m_29.x = _280;
    out.m_29.y = _280;
    out.m_29.z = _280;
    out.m_29.w = _280;
    return out;
}

