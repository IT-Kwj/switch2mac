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
int _53(thread const int& _747, thread const int& _748, thread const int& _749, thread int& _750, thread uint& gl_SubgroupInvocationID)
{
    int _753 = _749 & 31;
    uint _755 = uint(int(uint(_749) >> uint(8)));
    int _757 = int(_755) & 31;
    float _759 = as_type<float>(gl_SubgroupInvocationID);
    int _761 = as_type<int>(_759) & _757;
    int _763 = ~_757;
    int _765 = _753 & _763;
    int _767 = _765 | _761;
    int _769 = as_type<int>(_759) ^ _748;
    bool _771 = uint(_769) <= uint(_767);
    _750 = _771 ? (-1) : 0;
    float _773 = spvSubgroupShuffle(as_type<float>(_747), uint(_769));
    uint _775 = uint(_771 ? as_type<int>(_773) : _747);
    return int(_775);
}

static inline __attribute__((always_inline))
int _54(thread const int& _823, thread const int& _824, thread const int& _825, thread int& _826, thread uint& gl_SubgroupInvocationID)
{
    int _829 = _825 & 31;
    uint _831 = uint(int(uint(_825) >> uint(8)));
    int _833 = int(_831) & 31;
    float _835 = as_type<float>(gl_SubgroupInvocationID);
    int _837 = as_type<int>(_835) & _833;
    int _839 = ~_833;
    int _841 = _829 & _839;
    int _843 = _841 | _837;
    int _845 = ~_833;
    int _847 = _824 & _845;
    int _849 = _847 | _837;
    bool _851 = uint(_849) <= uint(_843);
    _826 = _851 ? (-1) : 0;
    float _853 = spvSubgroupShuffle(as_type<float>(_823), uint(_849));
    uint _855 = uint(_851 ? as_type<int>(_853) : _823);
    return int(_855);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _162 = false;
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
    float2 _385 = float2(_74, _76);
    float _78 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385)), int2(0), component::x).w;
    float2 _396 = float2(_74, _76);
    float4 _81 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_396, float2(0.0), isnan(_396)), int2(0), component::x).xyzw;
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
    float _114 = -_78;
    float _116 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _118 = _78 != 1.0;
    bool _120 = isnan(_78);
    bool _122 = _118 || _120;
    bool _124 = isnan(1.0);
    bool _126 = _122 || _124;
    float _128 = 1.0 / _116;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _132 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[1].w, _130);
    int _134 = _126 ? as_type<int>(_132) : 1065353216;
    float _160;
    if (!_108)
    {
        int _136 = as_type<int>(_78);
        int _138 = 1;
        int _140 = 31;
        int _142;
        int _478 = _53(_136, _138, _140, _142, gl_SubgroupInvocationID);
        int _144 = _478;
        float _146 = precise::max(_78, as_type<float>(_144));
        int _148 = as_type<int>(_146);
        int _150 = 2;
        int _152 = 31;
        int _154;
        int _485 = _53(_148, _150, _152, _154, gl_SubgroupInvocationID);
        int _156 = _485;
        float _158 = precise::max(_146, as_type<float>(_156));
        _160 = _158;
        _162 = true;
    }
    else
    {
        float _164 = as_type<float>(gl_SubgroupInvocationID);
        uint _166 = spvSubgroupBallot(true).x;
        float _168 = as_type<float>(gl_SubgroupLtMask.x);
        int _170 = as_type<int>(_164) & (-4);
        uint _172 = min(uint(_170), 32u);
        bool _174 = _172 < 32u;
        int _176 = 15 << int(_172);
        int _178 = _174 ? _176 : 0;
        int _180 = int(_166) & as_type<int>(_168);
        int _182 = _178 & _180;
        int _184 = _178 & int(_166);
        int _186 = int(spvFindUMSB(uint(_182)));
        int _188 = int(spvFindUMSB(uint(_184)));
        uint _190 = min(uint(_186), as_type<uint>(_164));
        int _192 = as_type<int>(_78);
        int _194 = int(_190);
        int _196 = 31;
        int _198;
        int _545 = _54(_192, _194, _196, _198, gl_SubgroupInvocationID);
        int _200 = _545;
        int _202 = int(_190);
        int _204 = int(_190);
        int _206 = 30;
        int _208;
        int _551 = _54(_202, _204, _206, _208, gl_SubgroupInvocationID);
        int _210 = _551;
        float _212 = precise::max(_78, as_type<float>(_200));
        int _214 = as_type<int>(_212);
        int _216 = _210;
        int _218 = 31;
        int _220;
        int _559 = _54(_214, _216, _218, _220, gl_SubgroupInvocationID);
        int _222 = _559;
        float _224 = precise::max(_212, as_type<float>(_222));
        int _226 = as_type<int>(_224);
        int _228 = _188;
        int _230 = 31;
        int _232;
        int _567 = _54(_226, _228, _230, _232, gl_SubgroupInvocationID);
        int _234 = _567;
        _160 = as_type<float>(_234);
    }
    _162 = false;
    float _236 = _160;
    float _238 = as_type<float>(gl_SubgroupInvocationID);
    float _240 = floor(_110);
    float _242 = -as_type<float>(_134);
    float _244 = _242 + _89;
    float _246 = -as_type<float>(_134);
    float _248 = _246 + _83;
    float _250 = -as_type<float>(_134);
    float _252 = _250 + _85;
    float _254 = -as_type<float>(_134);
    float _256 = _254 + _87;
    float _258 = _128 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _260 = abs(_252);
    float _262 = -_260;
    float _264 = abs(_244);
    float _266 = _262 + _264;
    float _268 = floor(_112);
    float _270 = abs(_248);
    float _272 = abs(_256);
    float _274 = -_272;
    float _276 = _270 + _274;
    float _278 = _266 + _276;
    float _280 = -_276;
    float _282 = _266 + _280;
    float _284 = -_240;
    float _286 = _110 + _284;
    float _288 = fma(_258, _278, _286);
    float _290 = precise::clamp(_288, 0.0, 1.0);
    int _292 = as_type<int>(_238) & 3;
    bool _294 = _292 != 0;
    float _296 = -_268;
    float _298 = _112 + _296;
    float _300 = -_286;
    float _302 = _300 + _290;
    float _304 = fma(_258, _282, _298);
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = -_298;
    float _310 = _308 + _306;
    if (!_294)
    {
        float _312 = gl_FragCoord.y;
        float _314 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _316 = _312 / _314;
        float _318 = gl_FragCoord.x;
        float _320 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _322 = _318 / _320;
        float _324 = trunc(_316);
        int _326 = int(_324);
        float _328 = trunc(_322);
        int _330 = int(_328);
        int _332 = _326 >> 31;
        int _334 = _332 & 1;
        int _336 = _330 >> 31;
        int _338 = _326 + _334;
        int _340 = _336 & 1;
        int _342 = _330 + _340;
        int _344 = _342 >> 1;
        int _346 = _338 >> 1;
        spvDescriptorSet0.fp_i_tcb_48_.write(float4(_236, _236, _236, _236), uint2(int2(_344, _346)));
    }
    float _348 = fma(_302, 0.5, 0.5);
    float _350 = fma(_310, 0.5, 0.5);
    out.m_45.x = as_type<float>(_134);
    out.m_45.y = as_type<float>(_134);
    out.m_45.z = as_type<float>(_134);
    out.m_45.w = as_type<float>(_134);
    out.m_47.x = _348;
    out.m_47.y = _350;
    return out;
}


struct main0_out_u
{
    uint4 m_45 [[color(0)]];
    uint4 m_47 [[color(1)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _162 = false;
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
    float2 _385 = float2(_74, _76);
    float _78 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385)), int2(0), component::x).w;
    float2 _396 = float2(_74, _76);
    float4 _81 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_396, float2(0.0), isnan(_396)), int2(0), component::x).xyzw;
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
    float _114 = -_78;
    float _116 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _118 = _78 != 1.0;
    bool _120 = isnan(_78);
    bool _122 = _118 || _120;
    bool _124 = isnan(1.0);
    bool _126 = _122 || _124;
    float _128 = 1.0 / _116;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _132 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[1].w, _130);
    int _134 = _126 ? as_type<int>(_132) : 1065353216;
    float _160;
    if (!_108)
    {
        int _136 = as_type<int>(_78);
        int _138 = 1;
        int _140 = 31;
        int _142;
        int _478 = _53(_136, _138, _140, _142, gl_SubgroupInvocationID);
        int _144 = _478;
        float _146 = precise::max(_78, as_type<float>(_144));
        int _148 = as_type<int>(_146);
        int _150 = 2;
        int _152 = 31;
        int _154;
        int _485 = _53(_148, _150, _152, _154, gl_SubgroupInvocationID);
        int _156 = _485;
        float _158 = precise::max(_146, as_type<float>(_156));
        _160 = _158;
        _162 = true;
    }
    else
    {
        float _164 = as_type<float>(gl_SubgroupInvocationID);
        uint _166 = spvSubgroupBallot(true).x;
        float _168 = as_type<float>(gl_SubgroupLtMask.x);
        int _170 = as_type<int>(_164) & (-4);
        uint _172 = min(uint(_170), 32u);
        bool _174 = _172 < 32u;
        int _176 = 15 << int(_172);
        int _178 = _174 ? _176 : 0;
        int _180 = int(_166) & as_type<int>(_168);
        int _182 = _178 & _180;
        int _184 = _178 & int(_166);
        int _186 = int(spvFindUMSB(uint(_182)));
        int _188 = int(spvFindUMSB(uint(_184)));
        uint _190 = min(uint(_186), as_type<uint>(_164));
        int _192 = as_type<int>(_78);
        int _194 = int(_190);
        int _196 = 31;
        int _198;
        int _545 = _54(_192, _194, _196, _198, gl_SubgroupInvocationID);
        int _200 = _545;
        int _202 = int(_190);
        int _204 = int(_190);
        int _206 = 30;
        int _208;
        int _551 = _54(_202, _204, _206, _208, gl_SubgroupInvocationID);
        int _210 = _551;
        float _212 = precise::max(_78, as_type<float>(_200));
        int _214 = as_type<int>(_212);
        int _216 = _210;
        int _218 = 31;
        int _220;
        int _559 = _54(_214, _216, _218, _220, gl_SubgroupInvocationID);
        int _222 = _559;
        float _224 = precise::max(_212, as_type<float>(_222));
        int _226 = as_type<int>(_224);
        int _228 = _188;
        int _230 = 31;
        int _232;
        int _567 = _54(_226, _228, _230, _232, gl_SubgroupInvocationID);
        int _234 = _567;
        _160 = as_type<float>(_234);
    }
    _162 = false;
    float _236 = _160;
    float _238 = as_type<float>(gl_SubgroupInvocationID);
    float _240 = floor(_110);
    float _242 = -as_type<float>(_134);
    float _244 = _242 + _89;
    float _246 = -as_type<float>(_134);
    float _248 = _246 + _83;
    float _250 = -as_type<float>(_134);
    float _252 = _250 + _85;
    float _254 = -as_type<float>(_134);
    float _256 = _254 + _87;
    float _258 = _128 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _260 = abs(_252);
    float _262 = -_260;
    float _264 = abs(_244);
    float _266 = _262 + _264;
    float _268 = floor(_112);
    float _270 = abs(_248);
    float _272 = abs(_256);
    float _274 = -_272;
    float _276 = _270 + _274;
    float _278 = _266 + _276;
    float _280 = -_276;
    float _282 = _266 + _280;
    float _284 = -_240;
    float _286 = _110 + _284;
    float _288 = fma(_258, _278, _286);
    float _290 = precise::clamp(_288, 0.0, 1.0);
    int _292 = as_type<int>(_238) & 3;
    bool _294 = _292 != 0;
    float _296 = -_268;
    float _298 = _112 + _296;
    float _300 = -_286;
    float _302 = _300 + _290;
    float _304 = fma(_258, _282, _298);
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = -_298;
    float _310 = _308 + _306;
    if (!_294)
    {
        float _312 = gl_FragCoord.y;
        float _314 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _316 = _312 / _314;
        float _318 = gl_FragCoord.x;
        float _320 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _322 = _318 / _320;
        float _324 = trunc(_316);
        int _326 = int(_324);
        float _328 = trunc(_322);
        int _330 = int(_328);
        int _332 = _326 >> 31;
        int _334 = _332 & 1;
        int _336 = _330 >> 31;
        int _338 = _326 + _334;
        int _340 = _336 & 1;
        int _342 = _330 + _340;
        int _344 = _342 >> 1;
        int _346 = _338 >> 1;
        spvDescriptorSet0.fp_i_tcb_48_.write(float4(_236, _236, _236, _236), uint2(int2(_344, _346)));
    }
    float _348 = fma(_302, 0.5, 0.5);
    float _350 = fma(_310, 0.5, 0.5);
    out.m_45.x = as_type<float>(_134);
    out.m_45.y = as_type<float>(_134);
    out.m_45.z = as_type<float>(_134);
    out.m_45.w = as_type<float>(_134);
    out.m_47.x = _348;
    out.m_47.y = _350;
    return main0_out_u{as_type<uint4>(out.m_45), as_type<uint4>(out.m_47)};
}


struct main0_out_m
{
    uint4 m_45 [[color(0)]];
    float4 m_47 [[color(1)]];
};

fragment main0_out_m main0_m(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _162 = false;
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
    float2 _385 = float2(_74, _76);
    float _78 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385)), int2(0), component::x).w;
    float2 _396 = float2(_74, _76);
    float4 _81 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_396, float2(0.0), isnan(_396)), int2(0), component::x).xyzw;
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
    float _114 = -_78;
    float _116 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _118 = _78 != 1.0;
    bool _120 = isnan(_78);
    bool _122 = _118 || _120;
    bool _124 = isnan(1.0);
    bool _126 = _122 || _124;
    float _128 = 1.0 / _116;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _132 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[1].w, _130);
    int _134 = _126 ? as_type<int>(_132) : 1065353216;
    float _160;
    if (!_108)
    {
        int _136 = as_type<int>(_78);
        int _138 = 1;
        int _140 = 31;
        int _142;
        int _478 = _53(_136, _138, _140, _142, gl_SubgroupInvocationID);
        int _144 = _478;
        float _146 = precise::max(_78, as_type<float>(_144));
        int _148 = as_type<int>(_146);
        int _150 = 2;
        int _152 = 31;
        int _154;
        int _485 = _53(_148, _150, _152, _154, gl_SubgroupInvocationID);
        int _156 = _485;
        float _158 = precise::max(_146, as_type<float>(_156));
        _160 = _158;
        _162 = true;
    }
    else
    {
        float _164 = as_type<float>(gl_SubgroupInvocationID);
        uint _166 = spvSubgroupBallot(true).x;
        float _168 = as_type<float>(gl_SubgroupLtMask.x);
        int _170 = as_type<int>(_164) & (-4);
        uint _172 = min(uint(_170), 32u);
        bool _174 = _172 < 32u;
        int _176 = 15 << int(_172);
        int _178 = _174 ? _176 : 0;
        int _180 = int(_166) & as_type<int>(_168);
        int _182 = _178 & _180;
        int _184 = _178 & int(_166);
        int _186 = int(spvFindUMSB(uint(_182)));
        int _188 = int(spvFindUMSB(uint(_184)));
        uint _190 = min(uint(_186), as_type<uint>(_164));
        int _192 = as_type<int>(_78);
        int _194 = int(_190);
        int _196 = 31;
        int _198;
        int _545 = _54(_192, _194, _196, _198, gl_SubgroupInvocationID);
        int _200 = _545;
        int _202 = int(_190);
        int _204 = int(_190);
        int _206 = 30;
        int _208;
        int _551 = _54(_202, _204, _206, _208, gl_SubgroupInvocationID);
        int _210 = _551;
        float _212 = precise::max(_78, as_type<float>(_200));
        int _214 = as_type<int>(_212);
        int _216 = _210;
        int _218 = 31;
        int _220;
        int _559 = _54(_214, _216, _218, _220, gl_SubgroupInvocationID);
        int _222 = _559;
        float _224 = precise::max(_212, as_type<float>(_222));
        int _226 = as_type<int>(_224);
        int _228 = _188;
        int _230 = 31;
        int _232;
        int _567 = _54(_226, _228, _230, _232, gl_SubgroupInvocationID);
        int _234 = _567;
        _160 = as_type<float>(_234);
    }
    _162 = false;
    float _236 = _160;
    float _238 = as_type<float>(gl_SubgroupInvocationID);
    float _240 = floor(_110);
    float _242 = -as_type<float>(_134);
    float _244 = _242 + _89;
    float _246 = -as_type<float>(_134);
    float _248 = _246 + _83;
    float _250 = -as_type<float>(_134);
    float _252 = _250 + _85;
    float _254 = -as_type<float>(_134);
    float _256 = _254 + _87;
    float _258 = _128 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _260 = abs(_252);
    float _262 = -_260;
    float _264 = abs(_244);
    float _266 = _262 + _264;
    float _268 = floor(_112);
    float _270 = abs(_248);
    float _272 = abs(_256);
    float _274 = -_272;
    float _276 = _270 + _274;
    float _278 = _266 + _276;
    float _280 = -_276;
    float _282 = _266 + _280;
    float _284 = -_240;
    float _286 = _110 + _284;
    float _288 = fma(_258, _278, _286);
    float _290 = precise::clamp(_288, 0.0, 1.0);
    int _292 = as_type<int>(_238) & 3;
    bool _294 = _292 != 0;
    float _296 = -_268;
    float _298 = _112 + _296;
    float _300 = -_286;
    float _302 = _300 + _290;
    float _304 = fma(_258, _282, _298);
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = -_298;
    float _310 = _308 + _306;
    if (!_294)
    {
        float _312 = gl_FragCoord.y;
        float _314 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _316 = _312 / _314;
        float _318 = gl_FragCoord.x;
        float _320 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _322 = _318 / _320;
        float _324 = trunc(_316);
        int _326 = int(_324);
        float _328 = trunc(_322);
        int _330 = int(_328);
        int _332 = _326 >> 31;
        int _334 = _332 & 1;
        int _336 = _330 >> 31;
        int _338 = _326 + _334;
        int _340 = _336 & 1;
        int _342 = _330 + _340;
        int _344 = _342 >> 1;
        int _346 = _338 >> 1;
        spvDescriptorSet0.fp_i_tcb_48_.write(float4(_236, _236, _236, _236), uint2(int2(_344, _346)));
    }
    float _348 = fma(_302, 0.5, 0.5);
    float _350 = fma(_310, 0.5, 0.5);
    out.m_45.x = as_type<float>(_134);
    out.m_45.y = as_type<float>(_134);
    out.m_45.z = as_type<float>(_134);
    out.m_45.w = as_type<float>(_134);
    out.m_47.x = _348;
    out.m_47.y = _350;
    return main0_out_m{as_type<uint4>(out.m_45), out.m_47};
}

