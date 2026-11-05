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
int _53(thread const int& _613, thread const int& _614, thread const int& _615, thread int& _616, thread uint& gl_SubgroupInvocationID)
{
    int _619 = _615 & 31;
    uint _621 = uint(int(uint(_615) >> uint(8)));
    int _623 = int(_621) & 31;
    float _625 = as_type<float>(gl_SubgroupInvocationID);
    int _627 = as_type<int>(_625) & _623;
    int _629 = ~_623;
    int _631 = _619 & _629;
    int _633 = _631 | _627;
    int _635 = as_type<int>(_625) ^ _614;
    bool _637 = uint(_635) <= uint(_633);
    _616 = _637 ? (-1) : 0;
    float _639 = spvSubgroupShuffle(as_type<float>(_613), uint(_635));
    uint _641 = uint(_637 ? as_type<int>(_639) : _613);
    return int(_641);
}

static inline __attribute__((always_inline))
int _54(thread const int& _689, thread const int& _690, thread const int& _691, thread int& _692, thread uint& gl_SubgroupInvocationID)
{
    int _695 = _691 & 31;
    uint _697 = uint(int(uint(_691) >> uint(8)));
    int _699 = int(_697) & 31;
    float _701 = as_type<float>(gl_SubgroupInvocationID);
    int _703 = as_type<int>(_701) & _699;
    int _705 = ~_699;
    int _707 = _695 & _705;
    int _709 = _707 | _703;
    int _711 = ~_699;
    int _713 = _690 & _711;
    int _715 = _713 | _703;
    bool _717 = uint(_715) <= uint(_709);
    _692 = _717 ? (-1) : 0;
    float _719 = spvSubgroupShuffle(as_type<float>(_689), uint(_715));
    uint _721 = uint(_717 ? as_type<int>(_719) : _689);
    return int(_721);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _170 = false;
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
    float2 _325 = float2(_74, _76);
    float4 _79 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_325, float2(0.0), isnan(_325)), int2(0), component::x).xyzw;
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
    float _111 = -_87;
    float _113 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _115 = precise::max(_85, _87);
    uint _118 = spvSubgroupBallot(true).x;
    float _120 = 1.0 / _113;
    float _122 = precise::max(_109, _115);
    bool _126 = int(_118) != (-1);
    bool _128 = _87 != 1.0;
    bool _130 = isnan(_87);
    bool _132 = _128 || _130;
    bool _134 = isnan(1.0);
    bool _136 = _132 || _134;
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_122, _122, _122, _122), uint2(int2(_103, _107)));
    float _138 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _140 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[1].w, _138);
    int _142 = _136 ? as_type<int>(_140) : 1065353216;
    float _168;
    if (!_126)
    {
        int _144 = as_type<int>(_122);
        int _146 = 1;
        int _148 = 31;
        int _150;
        int _431 = _53(_144, _146, _148, _150, gl_SubgroupInvocationID);
        int _152 = _431;
        float _154 = precise::max(_122, as_type<float>(_152));
        int _156 = as_type<int>(_154);
        int _158 = 2;
        int _160 = 31;
        int _162;
        int _439 = _53(_156, _158, _160, _162, gl_SubgroupInvocationID);
        int _164 = _439;
        float _166 = precise::max(_154, as_type<float>(_164));
        _168 = _166;
        _170 = true;
    }
    else
    {
        float _172 = as_type<float>(gl_SubgroupInvocationID);
        uint _174 = spvSubgroupBallot(true).x;
        float _176 = as_type<float>(gl_SubgroupLtMask.x);
        int _178 = as_type<int>(_172) & (-4);
        uint _180 = min(uint(_178), 32u);
        bool _182 = _180 < 32u;
        int _184 = 15 << int(_180);
        int _186 = _182 ? _184 : 0;
        int _188 = int(_174) & as_type<int>(_176);
        int _190 = _186 & _188;
        int _192 = _186 & int(_174);
        int _194 = int(spvFindUMSB(uint(_190)));
        int _196 = int(spvFindUMSB(uint(_192)));
        uint _198 = min(uint(_194), as_type<uint>(_172));
        int _200 = as_type<int>(_122);
        int _202 = int(_198);
        int _204 = 31;
        int _206;
        int _499 = _54(_200, _202, _204, _206, gl_SubgroupInvocationID);
        int _208 = _499;
        int _210 = int(_198);
        int _212 = int(_198);
        int _214 = 30;
        int _216;
        int _505 = _54(_210, _212, _214, _216, gl_SubgroupInvocationID);
        int _218 = _505;
        float _220 = precise::max(_122, as_type<float>(_208));
        int _222 = as_type<int>(_220);
        int _224 = _218;
        int _226 = 31;
        int _228;
        int _513 = _54(_222, _224, _226, _228, gl_SubgroupInvocationID);
        int _230 = _513;
        float _232 = precise::max(_220, as_type<float>(_230));
        int _234 = as_type<int>(_232);
        int _236 = _196;
        int _238 = 31;
        int _240;
        int _521 = _54(_234, _236, _238, _240, gl_SubgroupInvocationID);
        int _242 = _521;
        _168 = as_type<float>(_242);
    }
    _170 = false;
    float _244 = _168;
    float _246 = as_type<float>(gl_SubgroupInvocationID);
    float _248 = -_122;
    float _250 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _252 = _122 >= 1.0;
    bool _254 = isnan(_122);
    bool _256 = _252 || _254;
    bool _258 = isnan(1.0);
    bool _260 = _256 || _258;
    float _262 = 1.0 / _250;
    float _264 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _266 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[1].w, _264);
    int _268 = as_type<int>(_246) & 3;
    bool _270 = _268 != 0;
    if (!_270)
    {
        int _272 = _103 >> 31;
        int _274 = _107 >> 31;
        int _276 = _272 & 1;
        int _278 = _274 & 1;
        int _280 = _103 + _276;
        int _282 = _107 + _278;
        int _284 = _280 >> 1;
        int _286 = _282 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_244, _244, _244, _244), uint2(int2(_284, _286)));
    }
    bool _288 = !_260;
    int _290 = _288 ? as_type<int>(_266) : 1065353216;
    out.m_45.x = as_type<float>(_142);
    out.m_45.y = as_type<float>(_142);
    out.m_45.z = as_type<float>(_142);
    out.m_45.w = as_type<float>(_142);
    out.m_47.x = as_type<float>(_290);
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
    bool _170 = false;
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
    float2 _325 = float2(_74, _76);
    float4 _79 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_325, float2(0.0), isnan(_325)), int2(0), component::x).xyzw;
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
    float _111 = -_87;
    float _113 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _115 = precise::max(_85, _87);
    uint _118 = spvSubgroupBallot(true).x;
    float _120 = 1.0 / _113;
    float _122 = precise::max(_109, _115);
    bool _126 = int(_118) != (-1);
    bool _128 = _87 != 1.0;
    bool _130 = isnan(_87);
    bool _132 = _128 || _130;
    bool _134 = isnan(1.0);
    bool _136 = _132 || _134;
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_122, _122, _122, _122), uint2(int2(_103, _107)));
    float _138 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _140 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[1].w, _138);
    int _142 = _136 ? as_type<int>(_140) : 1065353216;
    float _168;
    if (!_126)
    {
        int _144 = as_type<int>(_122);
        int _146 = 1;
        int _148 = 31;
        int _150;
        int _431 = _53(_144, _146, _148, _150, gl_SubgroupInvocationID);
        int _152 = _431;
        float _154 = precise::max(_122, as_type<float>(_152));
        int _156 = as_type<int>(_154);
        int _158 = 2;
        int _160 = 31;
        int _162;
        int _439 = _53(_156, _158, _160, _162, gl_SubgroupInvocationID);
        int _164 = _439;
        float _166 = precise::max(_154, as_type<float>(_164));
        _168 = _166;
        _170 = true;
    }
    else
    {
        float _172 = as_type<float>(gl_SubgroupInvocationID);
        uint _174 = spvSubgroupBallot(true).x;
        float _176 = as_type<float>(gl_SubgroupLtMask.x);
        int _178 = as_type<int>(_172) & (-4);
        uint _180 = min(uint(_178), 32u);
        bool _182 = _180 < 32u;
        int _184 = 15 << int(_180);
        int _186 = _182 ? _184 : 0;
        int _188 = int(_174) & as_type<int>(_176);
        int _190 = _186 & _188;
        int _192 = _186 & int(_174);
        int _194 = int(spvFindUMSB(uint(_190)));
        int _196 = int(spvFindUMSB(uint(_192)));
        uint _198 = min(uint(_194), as_type<uint>(_172));
        int _200 = as_type<int>(_122);
        int _202 = int(_198);
        int _204 = 31;
        int _206;
        int _499 = _54(_200, _202, _204, _206, gl_SubgroupInvocationID);
        int _208 = _499;
        int _210 = int(_198);
        int _212 = int(_198);
        int _214 = 30;
        int _216;
        int _505 = _54(_210, _212, _214, _216, gl_SubgroupInvocationID);
        int _218 = _505;
        float _220 = precise::max(_122, as_type<float>(_208));
        int _222 = as_type<int>(_220);
        int _224 = _218;
        int _226 = 31;
        int _228;
        int _513 = _54(_222, _224, _226, _228, gl_SubgroupInvocationID);
        int _230 = _513;
        float _232 = precise::max(_220, as_type<float>(_230));
        int _234 = as_type<int>(_232);
        int _236 = _196;
        int _238 = 31;
        int _240;
        int _521 = _54(_234, _236, _238, _240, gl_SubgroupInvocationID);
        int _242 = _521;
        _168 = as_type<float>(_242);
    }
    _170 = false;
    float _244 = _168;
    float _246 = as_type<float>(gl_SubgroupInvocationID);
    float _248 = -_122;
    float _250 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _252 = _122 >= 1.0;
    bool _254 = isnan(_122);
    bool _256 = _252 || _254;
    bool _258 = isnan(1.0);
    bool _260 = _256 || _258;
    float _262 = 1.0 / _250;
    float _264 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _266 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[1].w, _264);
    int _268 = as_type<int>(_246) & 3;
    bool _270 = _268 != 0;
    if (!_270)
    {
        int _272 = _103 >> 31;
        int _274 = _107 >> 31;
        int _276 = _272 & 1;
        int _278 = _274 & 1;
        int _280 = _103 + _276;
        int _282 = _107 + _278;
        int _284 = _280 >> 1;
        int _286 = _282 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_244, _244, _244, _244), uint2(int2(_284, _286)));
    }
    bool _288 = !_260;
    int _290 = _288 ? as_type<int>(_266) : 1065353216;
    out.m_45.x = as_type<float>(_142);
    out.m_45.y = as_type<float>(_142);
    out.m_45.z = as_type<float>(_142);
    out.m_45.w = as_type<float>(_142);
    out.m_47.x = as_type<float>(_290);
    return main0_out_u{as_type<uint4>(out.m_45), as_type<uint4>(out.m_47)};
}

