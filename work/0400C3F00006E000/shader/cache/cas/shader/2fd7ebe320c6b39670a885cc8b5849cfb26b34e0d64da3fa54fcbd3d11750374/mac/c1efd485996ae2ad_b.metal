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
    float4 m_48 [[color(0)]];
    float4 m_50 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _616, thread const int& _617, thread const int& _618, thread int& _619, thread uint& gl_SubgroupInvocationID)
{
    int _622 = _618 & 31;
    uint _624 = uint(int(uint(_618) >> uint(8)));
    int _626 = int(_624) & 31;
    float _628 = as_type<float>(gl_SubgroupInvocationID);
    int _630 = as_type<int>(_628) & _626;
    int _632 = ~_626;
    int _634 = _622 & _632;
    int _636 = _634 | _630;
    int _638 = as_type<int>(_628) ^ _617;
    bool _640 = uint(_638) <= uint(_636);
    _619 = _640 ? (-1) : 0;
    float _642 = spvSubgroupShuffle(as_type<float>(_616), uint(_638));
    uint _644 = uint(_640 ? as_type<int>(_642) : _616);
    return int(_644);
}

static inline __attribute__((always_inline))
int _57(thread const int& _692, thread const int& _693, thread const int& _694, thread int& _695, thread uint& gl_SubgroupInvocationID)
{
    int _698 = _694 & 31;
    uint _700 = uint(int(uint(_694) >> uint(8)));
    int _702 = int(_700) & 31;
    float _704 = as_type<float>(gl_SubgroupInvocationID);
    int _706 = as_type<int>(_704) & _702;
    int _708 = ~_702;
    int _710 = _698 & _708;
    int _712 = _710 | _706;
    int _714 = ~_702;
    int _716 = _693 & _714;
    int _718 = _716 | _706;
    bool _720 = uint(_718) <= uint(_712);
    _695 = _720 ? (-1) : 0;
    float _722 = spvSubgroupShuffle(as_type<float>(_692), uint(_718));
    uint _724 = uint(_720 ? as_type<int>(_722) : _692);
    return int(_724);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _173 = false;
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _328 = float2(_77, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_328, float2(0.0), isnan(_328)), int2(0), component::x).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = gl_FragCoord.x;
    float _94 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _96 = _92 / _94;
    float _98 = gl_FragCoord.y;
    float _100 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _102 = _98 / _100;
    float _104 = trunc(_96);
    int _106 = int(_104);
    float _108 = trunc(_102);
    int _110 = int(_108);
    float _112 = precise::max(_84, _86);
    float _114 = -_90;
    float _116 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _118 = precise::max(_88, _90);
    bool _122 = _90 != 1.0;
    bool _124 = isnan(_90);
    bool _126 = _122 || _124;
    bool _128 = isnan(1.0);
    bool _130 = _126 || _128;
    float _132 = precise::max(_112, _118);
    float _134 = 1.0 / _116;
    uint _137 = spvSubgroupBallot(true).x;
    bool _139 = int(_137) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_132, _132, _132, _132), uint2(int2(_106, _110)));
    float _141 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _143 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[1].w, _141);
    int _145 = _130 ? as_type<int>(_143) : 1065353216;
    float _171;
    if (!_139)
    {
        int _147 = as_type<int>(_132);
        int _149 = 1;
        int _151 = 31;
        int _153;
        int _434 = _56(_147, _149, _151, _153, gl_SubgroupInvocationID);
        int _155 = _434;
        float _157 = precise::max(_132, as_type<float>(_155));
        int _159 = as_type<int>(_157);
        int _161 = 2;
        int _163 = 31;
        int _165;
        int _442 = _56(_159, _161, _163, _165, gl_SubgroupInvocationID);
        int _167 = _442;
        float _169 = precise::max(_157, as_type<float>(_167));
        _171 = _169;
        _173 = true;
    }
    else
    {
        float _175 = as_type<float>(gl_SubgroupInvocationID);
        uint _177 = spvSubgroupBallot(true).x;
        float _179 = as_type<float>(gl_SubgroupLtMask.x);
        int _181 = as_type<int>(_175) & (-4);
        uint _183 = min(uint(_181), 32u);
        bool _185 = _183 < 32u;
        int _187 = 15 << int(_183);
        int _189 = _185 ? _187 : 0;
        int _191 = int(_177) & as_type<int>(_179);
        int _193 = _189 & _191;
        int _195 = _189 & int(_177);
        int _197 = int(spvFindUMSB(uint(_193)));
        int _199 = int(spvFindUMSB(uint(_195)));
        uint _201 = min(uint(_197), as_type<uint>(_175));
        int _203 = as_type<int>(_132);
        int _205 = int(_201);
        int _207 = 31;
        int _209;
        int _502 = _57(_203, _205, _207, _209, gl_SubgroupInvocationID);
        int _211 = _502;
        int _213 = int(_201);
        int _215 = int(_201);
        int _217 = 30;
        int _219;
        int _508 = _57(_213, _215, _217, _219, gl_SubgroupInvocationID);
        int _221 = _508;
        float _223 = precise::max(_132, as_type<float>(_211));
        int _225 = as_type<int>(_223);
        int _227 = _221;
        int _229 = 31;
        int _231;
        int _516 = _57(_225, _227, _229, _231, gl_SubgroupInvocationID);
        int _233 = _516;
        float _235 = precise::max(_223, as_type<float>(_233));
        int _237 = as_type<int>(_235);
        int _239 = _199;
        int _241 = 31;
        int _243;
        int _524 = _57(_237, _239, _241, _243, gl_SubgroupInvocationID);
        int _245 = _524;
        _171 = as_type<float>(_245);
    }
    _173 = false;
    float _247 = _171;
    float _249 = as_type<float>(gl_SubgroupInvocationID);
    float _251 = -_132;
    float _253 = fma(_251, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _255 = _132 >= 1.0;
    bool _257 = isnan(_132);
    bool _259 = _255 || _257;
    bool _261 = isnan(1.0);
    bool _263 = _259 || _261;
    float _265 = 1.0 / _253;
    float _267 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _269 = fma(_265, (*spvDescriptorSet0.fp_c3)._m0[1].w, _267);
    int _271 = as_type<int>(_249) & 3;
    bool _273 = _271 != 0;
    if (!_273)
    {
        int _275 = _106 >> 31;
        int _277 = _110 >> 31;
        int _279 = _275 & 1;
        int _281 = _277 & 1;
        int _283 = _106 + _279;
        int _285 = _110 + _281;
        int _287 = _283 >> 1;
        int _289 = _285 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_247, _247, _247, _247), uint2(int2(_287, _289)));
    }
    bool _291 = !_263;
    int _293 = _291 ? as_type<int>(_269) : 1065353216;
    out.gl_FragDepth = _269;
    out.m_48.x = as_type<float>(_145);
    out.m_48.y = as_type<float>(_145);
    out.m_48.z = as_type<float>(_145);
    out.m_48.w = as_type<float>(_145);
    out.m_50.x = as_type<float>(_293);
    return out;
}


struct main0_out_u
{
    uint4 m_48 [[color(0)]];
    uint4 m_50 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _173 = false;
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _328 = float2(_77, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_328, float2(0.0), isnan(_328)), int2(0), component::x).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = gl_FragCoord.x;
    float _94 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _96 = _92 / _94;
    float _98 = gl_FragCoord.y;
    float _100 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _102 = _98 / _100;
    float _104 = trunc(_96);
    int _106 = int(_104);
    float _108 = trunc(_102);
    int _110 = int(_108);
    float _112 = precise::max(_84, _86);
    float _114 = -_90;
    float _116 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _118 = precise::max(_88, _90);
    bool _122 = _90 != 1.0;
    bool _124 = isnan(_90);
    bool _126 = _122 || _124;
    bool _128 = isnan(1.0);
    bool _130 = _126 || _128;
    float _132 = precise::max(_112, _118);
    float _134 = 1.0 / _116;
    uint _137 = spvSubgroupBallot(true).x;
    bool _139 = int(_137) != (-1);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_132, _132, _132, _132), uint2(int2(_106, _110)));
    float _141 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _143 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[1].w, _141);
    int _145 = _130 ? as_type<int>(_143) : 1065353216;
    float _171;
    if (!_139)
    {
        int _147 = as_type<int>(_132);
        int _149 = 1;
        int _151 = 31;
        int _153;
        int _434 = _56(_147, _149, _151, _153, gl_SubgroupInvocationID);
        int _155 = _434;
        float _157 = precise::max(_132, as_type<float>(_155));
        int _159 = as_type<int>(_157);
        int _161 = 2;
        int _163 = 31;
        int _165;
        int _442 = _56(_159, _161, _163, _165, gl_SubgroupInvocationID);
        int _167 = _442;
        float _169 = precise::max(_157, as_type<float>(_167));
        _171 = _169;
        _173 = true;
    }
    else
    {
        float _175 = as_type<float>(gl_SubgroupInvocationID);
        uint _177 = spvSubgroupBallot(true).x;
        float _179 = as_type<float>(gl_SubgroupLtMask.x);
        int _181 = as_type<int>(_175) & (-4);
        uint _183 = min(uint(_181), 32u);
        bool _185 = _183 < 32u;
        int _187 = 15 << int(_183);
        int _189 = _185 ? _187 : 0;
        int _191 = int(_177) & as_type<int>(_179);
        int _193 = _189 & _191;
        int _195 = _189 & int(_177);
        int _197 = int(spvFindUMSB(uint(_193)));
        int _199 = int(spvFindUMSB(uint(_195)));
        uint _201 = min(uint(_197), as_type<uint>(_175));
        int _203 = as_type<int>(_132);
        int _205 = int(_201);
        int _207 = 31;
        int _209;
        int _502 = _57(_203, _205, _207, _209, gl_SubgroupInvocationID);
        int _211 = _502;
        int _213 = int(_201);
        int _215 = int(_201);
        int _217 = 30;
        int _219;
        int _508 = _57(_213, _215, _217, _219, gl_SubgroupInvocationID);
        int _221 = _508;
        float _223 = precise::max(_132, as_type<float>(_211));
        int _225 = as_type<int>(_223);
        int _227 = _221;
        int _229 = 31;
        int _231;
        int _516 = _57(_225, _227, _229, _231, gl_SubgroupInvocationID);
        int _233 = _516;
        float _235 = precise::max(_223, as_type<float>(_233));
        int _237 = as_type<int>(_235);
        int _239 = _199;
        int _241 = 31;
        int _243;
        int _524 = _57(_237, _239, _241, _243, gl_SubgroupInvocationID);
        int _245 = _524;
        _171 = as_type<float>(_245);
    }
    _173 = false;
    float _247 = _171;
    float _249 = as_type<float>(gl_SubgroupInvocationID);
    float _251 = -_132;
    float _253 = fma(_251, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _255 = _132 >= 1.0;
    bool _257 = isnan(_132);
    bool _259 = _255 || _257;
    bool _261 = isnan(1.0);
    bool _263 = _259 || _261;
    float _265 = 1.0 / _253;
    float _267 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _269 = fma(_265, (*spvDescriptorSet0.fp_c3)._m0[1].w, _267);
    int _271 = as_type<int>(_249) & 3;
    bool _273 = _271 != 0;
    if (!_273)
    {
        int _275 = _106 >> 31;
        int _277 = _110 >> 31;
        int _279 = _275 & 1;
        int _281 = _277 & 1;
        int _283 = _106 + _279;
        int _285 = _110 + _281;
        int _287 = _283 >> 1;
        int _289 = _285 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_247, _247, _247, _247), uint2(int2(_287, _289)));
    }
    bool _291 = !_263;
    int _293 = _291 ? as_type<int>(_269) : 1065353216;
    out.gl_FragDepth = _269;
    out.m_48.x = as_type<float>(_145);
    out.m_48.y = as_type<float>(_145);
    out.m_48.z = as_type<float>(_145);
    out.m_48.w = as_type<float>(_145);
    out.m_50.x = as_type<float>(_293);
    return main0_out_u{as_type<uint4>(out.m_48), as_type<uint4>(out.m_50), out.gl_FragDepth};
}

