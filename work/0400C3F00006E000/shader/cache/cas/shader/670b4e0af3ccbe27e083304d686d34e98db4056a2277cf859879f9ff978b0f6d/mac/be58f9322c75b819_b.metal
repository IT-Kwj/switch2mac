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
int _61(thread const int& _677, thread const int& _678, thread const int& _679, thread int& _680, thread uint& gl_SubgroupInvocationID)
{
    int _683 = _679 & 31;
    uint _685 = uint(int(uint(_679) >> uint(8)));
    int _687 = int(_685) & 31;
    float _689 = as_type<float>(gl_SubgroupInvocationID);
    int _691 = as_type<int>(_689) & _687;
    int _693 = ~_687;
    int _695 = _683 & _693;
    int _697 = _695 | _691;
    int _699 = as_type<int>(_689) ^ _678;
    bool _701 = uint(_699) <= uint(_697);
    _680 = _701 ? (-1) : 0;
    float _703 = spvSubgroupShuffle(as_type<float>(_677), uint(_699));
    uint _705 = uint(_701 ? as_type<int>(_703) : _677);
    return int(_705);
}

static inline __attribute__((always_inline))
int _62(thread const int& _753, thread const int& _754, thread const int& _755, thread int& _756, thread uint& gl_SubgroupInvocationID)
{
    int _759 = _755 & 31;
    uint _761 = uint(int(uint(_755) >> uint(8)));
    int _763 = int(_761) & 31;
    float _765 = as_type<float>(gl_SubgroupInvocationID);
    int _767 = as_type<int>(_765) & _763;
    int _769 = ~_763;
    int _771 = _759 & _769;
    int _773 = _771 | _767;
    int _775 = ~_763;
    int _777 = _754 & _775;
    int _779 = _777 | _767;
    bool _781 = uint(_779) <= uint(_773);
    _756 = _781 ? (-1) : 0;
    float _783 = spvSubgroupShuffle(as_type<float>(_753), uint(_779));
    uint _785 = uint(_781 ? as_type<int>(_783) : _753);
    return int(_785);
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
    float2 _357 = float2(_82, _84);
    float4 _87 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_357, float2(0.0), isnan(_357)), int2(0), component::x).xyzw;
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
    uint _122 = spvSubgroupBallot(true).x;
    float _124 = precise::max(_117, _119);
    bool _128 = int(_122) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_124, _124, _124, _124), uint2(int2(_111, _115)));
    float _154;
    if (!_128)
    {
        int _130 = as_type<int>(_124);
        int _132 = 1;
        int _134 = 31;
        int _136;
        int _431 = _61(_130, _132, _134, _136, gl_SubgroupInvocationID);
        int _138 = _431;
        float _140 = precise::max(_124, as_type<float>(_138));
        int _142 = as_type<int>(_140);
        int _144 = 2;
        int _146 = 31;
        int _148;
        int _439 = _61(_142, _144, _146, _148, gl_SubgroupInvocationID);
        int _150 = _439;
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
        int _204 = as_type<int>(_124);
        int _206 = int(_202);
        int _208 = 31;
        int _210;
        int _528 = _62(_204, _206, _208, _210, gl_SubgroupInvocationID);
        int _212 = _528;
        int _214 = int(_202);
        int _216 = int(_202);
        int _218 = 30;
        int _220;
        int _534 = _62(_214, _216, _218, _220, gl_SubgroupInvocationID);
        int _222 = _534;
        float _224 = precise::max(_124, as_type<float>(_212));
        int _226 = as_type<int>(_224);
        int _228 = _222;
        int _230 = 31;
        int _232;
        int _542 = _62(_226, _228, _230, _232, gl_SubgroupInvocationID);
        int _234 = _542;
        float _236 = precise::max(_224, as_type<float>(_234));
        int _238 = as_type<int>(_236);
        int _240 = _200;
        int _242 = 31;
        int _244;
        int _550 = _62(_238, _240, _242, _244, gl_SubgroupInvocationID);
        int _246 = _550;
        _154 = as_type<float>(_246);
    }
    _156 = false;
    float _248 = _154;
    float _250 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    int _252 = _115 * 2;
    float _254 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    int _256 = _111 & 1;
    float _258 = _82 * _250;
    float _260 = _84 * _254;
    float _262 = as_type<float>(gl_SubgroupInvocationID);
    int _264 = 2 & _252;
    int _266 = (-3) & _256;
    int _268 = _264 | _266;
    float _270 = trunc(_258);
    int _272 = int(_270);
    float _274 = trunc(_260);
    int _276 = int(_274);
    int _278 = as_type<int>(_262) & 3;
    bool _280 = _278 != 0;
    int _282 = _276 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _284 = _282 + _272;
    float _286 = _124 * 16777215.0;
    int _288 = _284 * 4;
    int _290 = _288 + _268;
    float _292 = trunc(_286);
    float _294 = precise::max(_292, 0.0);
    uint _296 = uint(_294);
    int _298 = _290 << 2;
    int _300 = _298 + 9728;
    int _302 = _300 + as_type<int>((*spvDescriptorSet0.fp_c0)._m0[81].x);
    if (!_280)
    {
        int _304 = _111 >> 31;
        int _306 = _115 >> 31;
        int _308 = _304 & 1;
        int _310 = _306 & 1;
        int _312 = _111 + _308;
        int _314 = _115 + _310;
        int _316 = _312 >> 1;
        int _318 = _314 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_248, _248, _248, _248), uint2(int2(_316, _318)));
    }
    uint _320 = uint(int(uint(_300) >> uint(2)));
    uint _672 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_320)], _296, memory_order_relaxed);
    uint _322 = _672;
    out.gl_FragDepth = as_type<float>(_302);
    out.m_55.x = _124;
    return out;
}

