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
int _41(thread const int& _823, thread const int& _824, thread const int& _825, thread int& _826, thread uint& gl_SubgroupInvocationID)
{
    int _829 = _825 & 31;
    uint _832 = uint(int(uint(_825) >> uint(8)));
    int _834 = int(_832) & 31;
    float _836 = as_type<float>(gl_SubgroupInvocationID);
    int _838 = as_type<int>(_836) & _834;
    int _840 = ~_834;
    int _842 = _829 & _840;
    int _844 = _842 | _838;
    int _846 = as_type<int>(_836) ^ _824;
    bool _848 = uint(_846) <= uint(_844);
    _826 = _848 ? (-1) : 0;
    float _850 = spvSubgroupShuffle(as_type<float>(_823), uint(_846));
    uint _852 = uint(_848 ? as_type<int>(_850) : _823);
    return int(_852);
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
    float2 _441 = float2(_91, _95);
    float4 _98 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_441, float2(0.0), isnan(_441)), int2(0), component::x).xyzw;
    float _100 = _98.x;
    float _102 = _98.y;
    float _104 = _98.z;
    float _106 = _98.w;
    float2 _460 = float2(_91, _95);
    float4 _108 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_460, float2(0.0), isnan(_460)), int2(0), component::y).xyzw;
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
    int _156 = as_type<int>(_150);
    int _158 = 1;
    int _160 = 7171;
    int _162;
    int _524 = _41(_156, _158, _160, _162, gl_SubgroupInvocationID);
    int _164 = _524;
    float _166 = fma(_116, _116, _152);
    float _168 = _104 + _154;
    float _170 = _102 * _112;
    int _172 = as_type<int>(_166);
    int _174 = 1;
    int _176 = 7171;
    int _178;
    int _537 = _41(_172, _174, _176, _178, gl_SubgroupInvocationID);
    int _180 = _537;
    float _182 = _106 + _168;
    float _184 = fma(_100, _110, _170);
    float _186 = _182 * 0.0625;
    float _188 = fma(_104, _114, _184);
    int _190 = as_type<int>(_186);
    int _192 = 1;
    int _194 = 7171;
    int _196;
    int _553 = _41(_190, _192, _194, _196, gl_SubgroupInvocationID);
    int _198 = _553;
    float _200 = fma(_106, _116, _188);
    bool _202 = !_138;
    float _204 = _202 ? _114 : _116;
    float _206 = _204;
    if (!_128)
    {
        bool _208 = !_138;
        float _210 = _208 ? _112 : _110;
        _206 = _210;
    }
    float _212 = _206;
    int _214 = as_type<int>(_200);
    int _216 = 1;
    int _218 = 7171;
    int _220;
    int _579 = _41(_214, _216, _218, _220, gl_SubgroupInvocationID);
    int _222 = _579;
    uint _592 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _224 = (as_type<float>(_164) * float4(1.0, -1.0, 1.0, 0.0)[_592]) + (_150 * float4(1.0, 1.0, -1.0, 1.0)[_592]);
    float _226 = -_224;
    float _228 = fma(_85, _226, _150);
    uint _611 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _230 = (as_type<float>(_180) * float4(1.0, -1.0, 1.0, 0.0)[_611]) + (_166 * float4(1.0, 1.0, -1.0, 1.0)[_611]);
    int _232 = as_type<int>(_228);
    int _234 = 2;
    int _236 = 7171;
    int _238;
    int _619 = _41(_232, _234, _236, _238, gl_SubgroupInvocationID);
    int _240 = _619;
    float _242 = -_230;
    float _244 = fma(_85, _242, _166);
    int _246 = as_type<int>(_244);
    int _248 = 2;
    int _250 = 7171;
    int _252;
    int _628 = _41(_246, _248, _250, _252, gl_SubgroupInvocationID);
    int _254 = _628;
    uint _636 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _256 = (as_type<float>(_198) * float4(1.0, -1.0, 1.0, 0.0)[_636]) + (_186 * float4(1.0, 1.0, -1.0, 1.0)[_636]);
    float _258 = -_256;
    float _260 = fma(_85, _258, _186);
    uint _655 = (102u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _262 = (as_type<float>(_222) * float4(1.0, -1.0, 1.0, 0.0)[_655]) + (_200 * float4(1.0, 1.0, -1.0, 1.0)[_655]);
    int _264 = as_type<int>(_260);
    int _266 = 2;
    int _268 = 7171;
    int _270;
    int _663 = _41(_264, _266, _268, _270, gl_SubgroupInvocationID);
    int _272 = _663;
    float _274 = -_262;
    float _276 = fma(_85, _274, _200);
    int _278 = as_type<int>(_276);
    int _280 = 2;
    int _282 = 7171;
    int _284;
    int _672 = _41(_278, _280, _282, _284, gl_SubgroupInvocationID);
    int _286 = _672;
    uint _681 = (90u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _288 = (as_type<float>(_240) * float4(1.0, -1.0, 1.0, 0.0)[_681]) + (_228 * float4(1.0, 1.0, -1.0, 1.0)[_681]);
    float _290 = -_288;
    float _292 = fma(_93, _290, _228);
    uint _700 = (90u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _294 = (as_type<float>(_254) * float4(1.0, -1.0, 1.0, 0.0)[_700]) + (_244 * float4(1.0, 1.0, -1.0, 1.0)[_700]);
    float _296 = _292 * 4.0;
    float _298 = -_294;
    float _300 = fma(_93, _298, _244);
    float _302 = _296 * _296;
    float _304 = -_302;
    float _306 = fma(_300, 0.25, _304);
    float _308 = precise::max(_306, 4.9999999800209860012500939774327e-12);
    uint _734 = (90u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _310 = (as_type<float>(_272) * float4(1.0, -1.0, 1.0, 0.0)[_734]) + (_260 * float4(1.0, 1.0, -1.0, 1.0)[_734]);
    uint _747 = (90u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _312 = (as_type<float>(_286) * float4(1.0, -1.0, 1.0, 0.0)[_747]) + (_276 * float4(1.0, 1.0, -1.0, 1.0)[_747]);
    float _314 = -_310;
    float _316 = fma(_93, _314, _260);
    float _318 = 1.0 / _308;
    float _320 = -_312;
    float _322 = fma(_93, _320, _276);
    bool _324 = !_138;
    float _326 = _324 ? _104 : _106;
    float _328 = _316 * 4.0;
    float _330 = _326;
    if (!_128)
    {
        bool _332 = !_138;
        float _334 = _332 ? _102 : _100;
        _330 = _334;
    }
    float _336 = _330;
    float _338 = _296 * _328;
    float _340 = -_296;
    float _342 = _212 + _340;
    float _344 = -_338;
    float _346 = fma(_322, 0.25, _344);
    float _348 = _342 * _318;
    float _350 = fma(_346, _348, _328);
    float _352 = -_336;
    float _354 = _352 + _350;
    float _356 = fma(_354, 0.5, _336);
    float _358 = precise::clamp(_356, 0.0, 1.0);
    out.m_32.x = _358;
    out.m_32.y = _212;
    return out;
}

