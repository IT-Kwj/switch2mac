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
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _41(thread const int& _778, thread const int& _779, thread const int& _780, thread int& _781, thread uint& gl_SubgroupInvocationID)
{
    int _784 = _780 & 31;
    uint _787 = uint(int(uint(_780) >> uint(8)));
    int _789 = int(_787) & 31;
    float _791 = as_type<float>(gl_SubgroupInvocationID);
    int _793 = as_type<int>(_791) & _789;
    int _795 = ~_789;
    int _797 = _784 & _795;
    int _799 = _797 | _793;
    int _801 = as_type<int>(_791) ^ _779;
    bool _803 = uint(_801) <= uint(_799);
    _781 = _803 ? (-1) : 0;
    float _805 = spvSubgroupShuffle(as_type<float>(_778), uint(_801));
    uint _807 = uint(_803 ? as_type<int>(_805) : _778);
    return int(_807);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.y;
    float _47 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _49 = _45 / _47;
    float _51 = gl_FragCoord.x;
    float _53 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _55 = _51 / _53;
    float _57 = gl_FragCoord.w;
    float _59 = in.m_29.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_29.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = _49 * 0.5;
    float _73 = _55 * 0.5;
    float _75 = 1.0 / _57;
    float _77 = floor(_73);
    float _79 = floor(_71);
    float _81 = fma(_77, -2.0, _55);
    float _83 = _75 * _63;
    float _85 = _81 + (-1.0);
    float _87 = fma(_79, -2.0, _49);
    float _89 = _75 * _69;
    float _91 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[0].z, _83);
    float _93 = _87 + (-1.0);
    float _95 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[0].w, _89);
    float2 _423 = float2(_91, _95);
    float4 _98 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_423, float2(0.0), isnan(_423)), int2(0), component::x).xyzw;
    float _100 = _98.x;
    float _102 = _98.y;
    float _104 = _98.z;
    float _106 = _98.w;
    float2 _442 = float2(_91, _95);
    float4 _108 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_442, float2(0.0), isnan(_442)), int2(0), component::y).xyzw;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = _108.w;
    bool _120 = _87 >= 1.0;
    bool _122 = isnan(_87);
    bool _124 = _120 || _122;
    bool _126 = isnan(1.0);
    bool _128 = _124 || _126;
    bool _130 = _81 >= 1.0;
    bool _132 = isnan(_81);
    bool _134 = _130 || _132;
    bool _136 = isnan(1.0);
    bool _138 = _134 || _136;
    float _140 = _110 + _112;
    float _142 = _114 + _140;
    float _144 = _112 * _112;
    float _146 = _116 + _142;
    float _148 = fma(_110, _110, _144);
    float _150 = _146 * 0.0625;
    float _152 = fma(_114, _114, _148);
    float _154 = _100 + _102;
    float _156 = _102 * _112;
    int _158 = as_type<int>(_150);
    int _160 = 1;
    int _162 = 7171;
    int _164;
    int _509 = _41(_158, _160, _162, _164, gl_SubgroupInvocationID);
    int _166 = _509;
    float _168 = fma(_116, _116, _152);
    float _170 = _104 + _154;
    float _172 = fma(_100, _110, _156);
    int _174 = as_type<int>(_168);
    int _176 = 1;
    int _178 = 7171;
    int _180;
    int _523 = _41(_174, _176, _178, _180, gl_SubgroupInvocationID);
    int _182 = _523;
    float _184 = _106 + _170;
    float _186 = fma(_104, _114, _172);
    float _188 = _184 * 0.0625;
    float _190 = fma(_106, _116, _186);
    int _192 = as_type<int>(_188);
    int _194 = 1;
    int _196 = 7171;
    int _198;
    int _539 = _41(_192, _194, _196, _198, gl_SubgroupInvocationID);
    int _200 = _539;
    uint _552 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _202 = (as_type<float>(_166) * float4(1.0, -1.0, 1.0, 0.0)[_552]) + (_150 * float4(1.0, 1.0, -1.0, 1.0)[_552]);
    int _204 = as_type<int>(_190);
    int _206 = 1;
    int _208 = 7171;
    int _210;
    int _560 = _41(_204, _206, _208, _210, gl_SubgroupInvocationID);
    int _212 = _560;
    float _214 = -_202;
    float _216 = fma(_85, _214, _150);
    uint _574 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _218 = (as_type<float>(_182) * float4(1.0, -1.0, 1.0, 0.0)[_574]) + (_168 * float4(1.0, 1.0, -1.0, 1.0)[_574]);
    int _220 = as_type<int>(_216);
    int _222 = 2;
    int _224 = 7171;
    int _226;
    int _582 = _41(_220, _222, _224, _226, gl_SubgroupInvocationID);
    int _228 = _582;
    float _230 = -_218;
    float _232 = fma(_85, _230, _168);
    int _234 = as_type<int>(_232);
    int _236 = 2;
    int _238 = 7171;
    int _240;
    int _591 = _41(_234, _236, _238, _240, gl_SubgroupInvocationID);
    int _242 = _591;
    uint _599 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _244 = (as_type<float>(_200) * float4(1.0, -1.0, 1.0, 0.0)[_599]) + (_188 * float4(1.0, 1.0, -1.0, 1.0)[_599]);
    float _246 = -_244;
    float _248 = fma(_85, _246, _188);
    int _250 = as_type<int>(_248);
    int _252 = 2;
    int _254 = 7171;
    int _256;
    int _613 = _41(_250, _252, _254, _256, gl_SubgroupInvocationID);
    int _258 = _613;
    uint _621 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _260 = (as_type<float>(_212) * float4(1.0, -1.0, 1.0, 0.0)[_621]) + (_190 * float4(1.0, 1.0, -1.0, 1.0)[_621]);
    float _262 = -_260;
    float _264 = fma(_85, _262, _190);
    uint _641 = (90u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _266 = (as_type<float>(_228) * float4(1.0, -1.0, 1.0, 0.0)[_641]) + (_216 * float4(1.0, 1.0, -1.0, 1.0)[_641]);
    int _268 = as_type<int>(_264);
    int _270 = 2;
    int _272 = 7171;
    int _274;
    int _649 = _41(_268, _270, _272, _274, gl_SubgroupInvocationID);
    int _276 = _649;
    float _278 = -_266;
    float _280 = fma(_93, _278, _216);
    uint _663 = (90u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _282 = (as_type<float>(_242) * float4(1.0, -1.0, 1.0, 0.0)[_663]) + (_232 * float4(1.0, 1.0, -1.0, 1.0)[_663]);
    float _284 = _280 * 4.0;
    float _286 = -_282;
    float _288 = fma(_93, _286, _232);
    float _290 = _284 * _284;
    float _292 = -_290;
    float _294 = fma(_288, 0.25, _292);
    bool _296 = !_138;
    float _298 = _296 ? _114 : _116;
    float _300 = _298;
    if (!_128)
    {
        bool _302 = !_138;
        float _304 = _302 ? _112 : _110;
        _300 = _304;
    }
    float _306 = _300;
    float _308 = precise::max(_294, 4.9999999800209860012500939774327e-12);
    uint _716 = (90u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _310 = (as_type<float>(_258) * float4(1.0, -1.0, 1.0, 0.0)[_716]) + (_248 * float4(1.0, 1.0, -1.0, 1.0)[_716]);
    float _312 = -_284;
    float _314 = _306 + _312;
    float _316 = 1.0 / _308;
    float _318 = -_310;
    float _320 = fma(_93, _318, _248);
    uint _742 = (90u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _322 = (as_type<float>(_276) * float4(1.0, -1.0, 1.0, 0.0)[_742]) + (_264 * float4(1.0, 1.0, -1.0, 1.0)[_742]);
    float _324 = _320 * 4.0;
    float _326 = -_322;
    float _328 = fma(_93, _326, _264);
    float _330 = _284 * _324;
    float _332 = -_330;
    float _334 = fma(_328, 0.25, _332);
    float _336 = _314 * _316;
    float _338 = fma(_334, _336, _324);
    float _340 = precise::clamp(_338, 0.0, 1.0);
    out.m_32.x = _340;
    out.m_32.y = _306;
    return out;
}

