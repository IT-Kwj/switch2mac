#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    constant _16* fp_c0 [[id(2)]];
    device _23* fp_s0 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float, access::write> fp_i_tcb_48_ [[id(6)]];
    texture2d<float, access::write> fp_i_tcb_4A_ [[id(7)]];
};

struct main0_out
{
    float4 m_55 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _61(thread const int& _745, thread const int& _746, thread const int& _747, thread int& _748, thread uint& gl_SubgroupInvocationID)
{
    int _751 = _747 & 31;
    uint _753 = uint(int(uint(_747) >> uint(8)));
    int _755 = int(_753) & 31;
    float _757 = as_type<float>(gl_SubgroupInvocationID);
    int _759 = as_type<int>(_757) & _755;
    int _761 = ~_755;
    int _763 = _751 & _761;
    int _765 = _763 | _759;
    int _767 = as_type<int>(_757) ^ _746;
    bool _769 = uint(_767) <= uint(_765);
    _748 = _769 ? (-1) : 0;
    float _771 = spvSubgroupShuffle(as_type<float>(_745), uint(_767));
    uint _773 = uint(_769 ? as_type<int>(_771) : _745);
    return int(_773);
}

static inline __attribute__((always_inline))
int _62(thread const int& _821, thread const int& _822, thread const int& _823, thread int& _824, thread uint& gl_SubgroupInvocationID)
{
    int _827 = _823 & 31;
    uint _829 = uint(int(uint(_823) >> uint(8)));
    int _831 = int(_829) & 31;
    float _833 = as_type<float>(gl_SubgroupInvocationID);
    int _835 = as_type<int>(_833) & _831;
    int _837 = ~_831;
    int _839 = _827 & _837;
    int _841 = _839 | _835;
    int _843 = ~_831;
    int _845 = _822 & _843;
    int _847 = _845 | _835;
    bool _849 = uint(_847) <= uint(_841);
    _824 = _849 ? (-1) : 0;
    float _851 = spvSubgroupShuffle(as_type<float>(_821), uint(_847));
    uint _853 = uint(_849 ? as_type<int>(_851) : _821);
    return int(_853);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _156 = false;
    float _66 = gl_FragCoord.w;
    float _68 = in.m_42.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_42.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _66;
    float _82 = _80 * _72;
    float _84 = _80 * _78;
    float2 _385 = float2(_82, _84);
    float4 _87 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385)), int2(0), component::x).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float _97 = gl_FragCoord.x;
    float _99 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _101 = _97 / _99;
    float _103 = gl_FragCoord.y;
    float _105 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _107 = _103 / _105;
    float _109 = trunc(_101);
    int _111 = int(_109);
    float _113 = trunc(_107);
    int _115 = int(_113);
    float _117 = precise::max(_89, _91);
    float _119 = precise::max(_93, _95);
    float _121 = precise::max(_117, _119);
    uint _124 = spvSubgroupBallot(true).x;
    bool _128 = int(_124) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_121, _121, _121, _121), uint2(int2(_111, _115)));
    float _154;
    if (!_128)
    {
        int _130 = as_type<int>(_121);
        int _132 = 1;
        int _134 = 31;
        int _136;
        int _459 = _61(_130, _132, _134, _136, gl_SubgroupInvocationID);
        int _138 = _459;
        float _140 = precise::max(_121, as_type<float>(_138));
        int _142 = as_type<int>(_140);
        int _144 = 2;
        int _146 = 31;
        int _148;
        int _467 = _61(_142, _144, _146, _148, gl_SubgroupInvocationID);
        int _150 = _467;
        float _152 = precise::max(_140, as_type<float>(_150));
        _154 = _152;
        _156 = true;
    }
    else
    {
        float _158 = as_type<float>(gl_SubgroupInvocationID);
        uint _160 = spvSubgroupBallot(true).x;
        float _162 = as_type<float>(gl_SubgroupLtMask.x);
        int _164 = as_type<int>(_158) & (-4);
        uint _166 = min(uint(_164), 32u);
        bool _168 = int(_166) == 0;
        bool _170 = _166 < 32u;
        int _172 = 32 - int(_166);
        int _174 = int(_166) - 32;
        int _176 = 15 << int(_166);
        uint _178 = uint(int(uint(0) >> uint(_172)));
        int _180 = _176 | int(_178);
        int _182 = _168 ? 15 : _180;
        bool _184 = uint(_174) < 32u;
        int _186 = 0 << _174;
        int _188 = _184 ? _186 : 0;
        int _190 = _170 ? _182 : _188;
        int _192 = int(_160) & as_type<int>(_162);
        int _194 = _190 & _192;
        int _196 = _190 & int(_160);
        int _198 = int(spvFindUMSB(uint(_194)));
        int _200 = int(spvFindUMSB(uint(_196)));
        uint _202 = min(uint(_198), as_type<uint>(_158));
        int _204 = as_type<int>(_121);
        int _206 = int(_202);
        int _208 = 31;
        int _210;
        int _556 = _62(_204, _206, _208, _210, gl_SubgroupInvocationID);
        int _212 = _556;
        int _214 = int(_202);
        int _216 = int(_202);
        int _218 = 30;
        int _220;
        int _562 = _62(_214, _216, _218, _220, gl_SubgroupInvocationID);
        int _222 = _562;
        float _224 = precise::max(_121, as_type<float>(_212));
        int _226 = as_type<int>(_224);
        int _228 = _222;
        int _230 = 31;
        int _232;
        int _570 = _62(_226, _228, _230, _232, gl_SubgroupInvocationID);
        int _234 = _570;
        float _236 = precise::max(_224, as_type<float>(_234));
        int _238 = as_type<int>(_236);
        int _240 = _200;
        int _242 = 31;
        int _244;
        int _578 = _62(_238, _240, _242, _244, gl_SubgroupInvocationID);
        int _246 = _578;
        _154 = as_type<float>(_246);
    }
    _156 = false;
    float _248 = _154;
    float _250 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _252 = as_type<float>(gl_SubgroupInvocationID);
    float _254 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    int _256 = _115 * 2;
    bool _258 = _121 >= 1.0;
    bool _260 = isnan(_121);
    bool _262 = _258 || _260;
    bool _264 = isnan(1.0);
    bool _266 = _262 || _264;
    float _268 = _82 * _250;
    float _270 = _84 * _254;
    int _272 = _111 & 1;
    float _274 = -_121;
    float _276 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _278 = trunc(_268);
    int _280 = int(_278);
    int _282 = 2 & _256;
    int _284 = (-3) & _272;
    int _286 = _282 | _284;
    float _288 = 1.0 / _276;
    int _290 = as_type<int>(_252) & 3;
    bool _292 = _290 != 0;
    float _294 = trunc(_270);
    int _296 = int(_294);
    float _298 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _300 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[1].w, _298);
    float _302 = _300 * 16777215.0;
    int _304 = _296 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _306 = _304 + _280;
    bool _308 = !_266;
    float _310 = _308 ? _302 : 16777215.0;
    int _312 = _306 * 4;
    int _314 = _312 + _286;
    float _316 = trunc(_310);
    float _318 = precise::max(_316, 0.0);
    uint _320 = uint(_318);
    int _322 = _314 << 2;
    int _324 = _322 + 9728;
    int _326 = _324 + as_type<int>((*spvDescriptorSet0.fp_c0)._m0[81].x);
    if (!_292)
    {
        int _328 = _111 >> 31;
        int _330 = _115 >> 31;
        int _332 = _328 & 1;
        int _334 = _330 & 1;
        int _336 = _111 + _332;
        int _338 = _115 + _334;
        int _340 = _336 >> 1;
        int _342 = _338 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_248, _248, _248, _248), uint2(int2(_340, _342)));
    }
    uint _344 = uint(int(uint(_324) >> uint(2)));
    uint _732 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_344)], _320, memory_order_relaxed);
    uint _346 = _732;
    bool _348 = !_266;
    int _350 = _348 ? as_type<int>(_300) : 1065353216;
    out.gl_FragDepth = as_type<float>(_326);
    out.m_55.x = as_type<float>(_350);
    return out;
}


struct main0_out_u
{
    uint4 m_55 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _156 = false;
    float _66 = gl_FragCoord.w;
    float _68 = in.m_42.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_42.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _66;
    float _82 = _80 * _72;
    float _84 = _80 * _78;
    float2 _385 = float2(_82, _84);
    float4 _87 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385)), int2(0), component::x).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float _97 = gl_FragCoord.x;
    float _99 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _101 = _97 / _99;
    float _103 = gl_FragCoord.y;
    float _105 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _107 = _103 / _105;
    float _109 = trunc(_101);
    int _111 = int(_109);
    float _113 = trunc(_107);
    int _115 = int(_113);
    float _117 = precise::max(_89, _91);
    float _119 = precise::max(_93, _95);
    float _121 = precise::max(_117, _119);
    uint _124 = spvSubgroupBallot(true).x;
    bool _128 = int(_124) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_121, _121, _121, _121), uint2(int2(_111, _115)));
    float _154;
    if (!_128)
    {
        int _130 = as_type<int>(_121);
        int _132 = 1;
        int _134 = 31;
        int _136;
        int _459 = _61(_130, _132, _134, _136, gl_SubgroupInvocationID);
        int _138 = _459;
        float _140 = precise::max(_121, as_type<float>(_138));
        int _142 = as_type<int>(_140);
        int _144 = 2;
        int _146 = 31;
        int _148;
        int _467 = _61(_142, _144, _146, _148, gl_SubgroupInvocationID);
        int _150 = _467;
        float _152 = precise::max(_140, as_type<float>(_150));
        _154 = _152;
        _156 = true;
    }
    else
    {
        float _158 = as_type<float>(gl_SubgroupInvocationID);
        uint _160 = spvSubgroupBallot(true).x;
        float _162 = as_type<float>(gl_SubgroupLtMask.x);
        int _164 = as_type<int>(_158) & (-4);
        uint _166 = min(uint(_164), 32u);
        bool _168 = int(_166) == 0;
        bool _170 = _166 < 32u;
        int _172 = 32 - int(_166);
        int _174 = int(_166) - 32;
        int _176 = 15 << int(_166);
        uint _178 = uint(int(uint(0) >> uint(_172)));
        int _180 = _176 | int(_178);
        int _182 = _168 ? 15 : _180;
        bool _184 = uint(_174) < 32u;
        int _186 = 0 << _174;
        int _188 = _184 ? _186 : 0;
        int _190 = _170 ? _182 : _188;
        int _192 = int(_160) & as_type<int>(_162);
        int _194 = _190 & _192;
        int _196 = _190 & int(_160);
        int _198 = int(spvFindUMSB(uint(_194)));
        int _200 = int(spvFindUMSB(uint(_196)));
        uint _202 = min(uint(_198), as_type<uint>(_158));
        int _204 = as_type<int>(_121);
        int _206 = int(_202);
        int _208 = 31;
        int _210;
        int _556 = _62(_204, _206, _208, _210, gl_SubgroupInvocationID);
        int _212 = _556;
        int _214 = int(_202);
        int _216 = int(_202);
        int _218 = 30;
        int _220;
        int _562 = _62(_214, _216, _218, _220, gl_SubgroupInvocationID);
        int _222 = _562;
        float _224 = precise::max(_121, as_type<float>(_212));
        int _226 = as_type<int>(_224);
        int _228 = _222;
        int _230 = 31;
        int _232;
        int _570 = _62(_226, _228, _230, _232, gl_SubgroupInvocationID);
        int _234 = _570;
        float _236 = precise::max(_224, as_type<float>(_234));
        int _238 = as_type<int>(_236);
        int _240 = _200;
        int _242 = 31;
        int _244;
        int _578 = _62(_238, _240, _242, _244, gl_SubgroupInvocationID);
        int _246 = _578;
        _154 = as_type<float>(_246);
    }
    _156 = false;
    float _248 = _154;
    float _250 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _252 = as_type<float>(gl_SubgroupInvocationID);
    float _254 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    int _256 = _115 * 2;
    bool _258 = _121 >= 1.0;
    bool _260 = isnan(_121);
    bool _262 = _258 || _260;
    bool _264 = isnan(1.0);
    bool _266 = _262 || _264;
    float _268 = _82 * _250;
    float _270 = _84 * _254;
    int _272 = _111 & 1;
    float _274 = -_121;
    float _276 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _278 = trunc(_268);
    int _280 = int(_278);
    int _282 = 2 & _256;
    int _284 = (-3) & _272;
    int _286 = _282 | _284;
    float _288 = 1.0 / _276;
    int _290 = as_type<int>(_252) & 3;
    bool _292 = _290 != 0;
    float _294 = trunc(_270);
    int _296 = int(_294);
    float _298 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _300 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[1].w, _298);
    float _302 = _300 * 16777215.0;
    int _304 = _296 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _306 = _304 + _280;
    bool _308 = !_266;
    float _310 = _308 ? _302 : 16777215.0;
    int _312 = _306 * 4;
    int _314 = _312 + _286;
    float _316 = trunc(_310);
    float _318 = precise::max(_316, 0.0);
    uint _320 = uint(_318);
    int _322 = _314 << 2;
    int _324 = _322 + 9728;
    int _326 = _324 + as_type<int>((*spvDescriptorSet0.fp_c0)._m0[81].x);
    if (!_292)
    {
        int _328 = _111 >> 31;
        int _330 = _115 >> 31;
        int _332 = _328 & 1;
        int _334 = _330 & 1;
        int _336 = _111 + _332;
        int _338 = _115 + _334;
        int _340 = _336 >> 1;
        int _342 = _338 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_248, _248, _248, _248), uint2(int2(_340, _342)));
    }
    uint _344 = uint(int(uint(_324) >> uint(2)));
    uint _732 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_344)], _320, memory_order_relaxed);
    uint _346 = _732;
    bool _348 = !_266;
    int _350 = _348 ? as_type<int>(_300) : 1065353216;
    out.gl_FragDepth = as_type<float>(_326);
    out.m_55.x = as_type<float>(_350);
    return main0_out_u{as_type<uint4>(out.m_55), out.gl_FragDepth};
}

