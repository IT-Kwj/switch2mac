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
int _56(thread const int& _559, thread const int& _560, thread const int& _561, thread int& _562, thread uint& gl_SubgroupInvocationID)
{
    int _565 = _561 & 31;
    uint _567 = uint(int(uint(_561) >> uint(8)));
    int _569 = int(_567) & 31;
    float _571 = as_type<float>(gl_SubgroupInvocationID);
    int _573 = as_type<int>(_571) & _569;
    int _575 = ~_569;
    int _577 = _565 & _575;
    int _579 = _577 | _573;
    int _581 = as_type<int>(_571) ^ _560;
    bool _583 = uint(_581) <= uint(_579);
    _562 = _583 ? (-1) : 0;
    float _585 = spvSubgroupShuffle(as_type<float>(_559), uint(_581));
    uint _587 = uint(_583 ? as_type<int>(_585) : _559);
    return int(_587);
}

static inline __attribute__((always_inline))
int _57(thread const int& _635, thread const int& _636, thread const int& _637, thread int& _638, thread uint& gl_SubgroupInvocationID)
{
    int _641 = _637 & 31;
    uint _643 = uint(int(uint(_637) >> uint(8)));
    int _645 = int(_643) & 31;
    float _647 = as_type<float>(gl_SubgroupInvocationID);
    int _649 = as_type<int>(_647) & _645;
    int _651 = ~_645;
    int _653 = _641 & _651;
    int _655 = _653 | _649;
    int _657 = ~_645;
    int _659 = _636 & _657;
    int _661 = _659 | _649;
    bool _663 = uint(_661) <= uint(_655);
    _638 = _663 ? (-1) : 0;
    float _665 = spvSubgroupShuffle(as_type<float>(_635), uint(_661));
    uint _667 = uint(_663 ? as_type<int>(_665) : _635);
    return int(_667);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _151 = false;
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _306 = float2(_79, _77);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_306, float2(0.0), isnan(_306)), int2(0), component::x).xyzw;
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
    uint _115 = spvSubgroupBallot(true).x;
    float _117 = precise::max(_88, _90);
    bool _121 = int(_115) != (-1);
    float _123 = precise::max(_112, _117);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_123, _123, _123, _123), uint2(int2(_106, _110)));
    float _149;
    if (!_121)
    {
        int _125 = as_type<int>(_123);
        int _127 = 1;
        int _129 = 31;
        int _131;
        int _380 = _56(_125, _127, _129, _131, gl_SubgroupInvocationID);
        int _133 = _380;
        float _135 = precise::max(_123, as_type<float>(_133));
        int _137 = as_type<int>(_135);
        int _139 = 2;
        int _141 = 31;
        int _143;
        int _388 = _56(_137, _139, _141, _143, gl_SubgroupInvocationID);
        int _145 = _388;
        float _147 = precise::max(_135, as_type<float>(_145));
        _149 = _147;
        _151 = true;
    }
    else
    {
        float _153 = as_type<float>(gl_SubgroupInvocationID);
        uint _155 = spvSubgroupBallot(true).x;
        float _157 = as_type<float>(gl_SubgroupLtMask.x);
        int _159 = as_type<int>(_153) & (-4);
        uint _161 = min(uint(_159), 32u);
        bool _163 = _161 < 32u;
        int _165 = 15 << int(_161);
        int _167 = _163 ? _165 : 0;
        int _169 = int(_155) & as_type<int>(_157);
        int _171 = _167 & _169;
        int _173 = _167 & int(_155);
        int _175 = int(spvFindUMSB(uint(_171)));
        int _177 = int(spvFindUMSB(uint(_173)));
        uint _179 = min(uint(_175), as_type<uint>(_153));
        int _181 = as_type<int>(_123);
        int _183 = int(_179);
        int _185 = 31;
        int _187;
        int _448 = _57(_181, _183, _185, _187, gl_SubgroupInvocationID);
        int _189 = _448;
        int _191 = int(_179);
        int _193 = int(_179);
        int _195 = 30;
        int _197;
        int _454 = _57(_191, _193, _195, _197, gl_SubgroupInvocationID);
        int _199 = _454;
        float _201 = precise::max(_123, as_type<float>(_189));
        int _203 = as_type<int>(_201);
        int _205 = _199;
        int _207 = 31;
        int _209;
        int _462 = _57(_203, _205, _207, _209, gl_SubgroupInvocationID);
        int _211 = _462;
        float _213 = precise::max(_201, as_type<float>(_211));
        int _215 = as_type<int>(_213);
        int _217 = _177;
        int _219 = 31;
        int _221;
        int _470 = _57(_215, _217, _219, _221, gl_SubgroupInvocationID);
        int _223 = _470;
        _149 = as_type<float>(_223);
    }
    _151 = false;
    float _225 = _149;
    float _227 = as_type<float>(gl_SubgroupInvocationID);
    bool _229 = _123 >= 1.0;
    bool _231 = isnan(_123);
    bool _233 = _229 || _231;
    bool _235 = isnan(1.0);
    bool _237 = _233 || _235;
    float _239 = -_123;
    float _241 = fma(_239, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _243 = 1.0 / _241;
    int _245 = as_type<int>(_227) & 3;
    bool _247 = _245 != 0;
    float _249 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _251 = fma(_243, (*spvDescriptorSet0.fp_c3)._m0[1].w, _249);
    if (!_247)
    {
        int _253 = _106 >> 31;
        int _255 = _110 >> 31;
        int _257 = _253 & 1;
        int _259 = _255 & 1;
        int _261 = _106 + _257;
        int _263 = _110 + _259;
        int _265 = _261 >> 1;
        int _267 = _263 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_225, _225, _225, _225), uint2(int2(_265, _267)));
    }
    bool _269 = !_237;
    int _271 = _269 ? as_type<int>(_251) : 1065353216;
    out.gl_FragDepth = _251;
    out.m_48.x = _90;
    out.m_48.y = _90;
    out.m_48.z = _90;
    out.m_48.w = _90;
    out.m_50.x = as_type<float>(_271);
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
    bool _151 = false;
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _306 = float2(_79, _77);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_306, float2(0.0), isnan(_306)), int2(0), component::x).xyzw;
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
    uint _115 = spvSubgroupBallot(true).x;
    float _117 = precise::max(_88, _90);
    bool _121 = int(_115) != (-1);
    float _123 = precise::max(_112, _117);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_123, _123, _123, _123), uint2(int2(_106, _110)));
    float _149;
    if (!_121)
    {
        int _125 = as_type<int>(_123);
        int _127 = 1;
        int _129 = 31;
        int _131;
        int _380 = _56(_125, _127, _129, _131, gl_SubgroupInvocationID);
        int _133 = _380;
        float _135 = precise::max(_123, as_type<float>(_133));
        int _137 = as_type<int>(_135);
        int _139 = 2;
        int _141 = 31;
        int _143;
        int _388 = _56(_137, _139, _141, _143, gl_SubgroupInvocationID);
        int _145 = _388;
        float _147 = precise::max(_135, as_type<float>(_145));
        _149 = _147;
        _151 = true;
    }
    else
    {
        float _153 = as_type<float>(gl_SubgroupInvocationID);
        uint _155 = spvSubgroupBallot(true).x;
        float _157 = as_type<float>(gl_SubgroupLtMask.x);
        int _159 = as_type<int>(_153) & (-4);
        uint _161 = min(uint(_159), 32u);
        bool _163 = _161 < 32u;
        int _165 = 15 << int(_161);
        int _167 = _163 ? _165 : 0;
        int _169 = int(_155) & as_type<int>(_157);
        int _171 = _167 & _169;
        int _173 = _167 & int(_155);
        int _175 = int(spvFindUMSB(uint(_171)));
        int _177 = int(spvFindUMSB(uint(_173)));
        uint _179 = min(uint(_175), as_type<uint>(_153));
        int _181 = as_type<int>(_123);
        int _183 = int(_179);
        int _185 = 31;
        int _187;
        int _448 = _57(_181, _183, _185, _187, gl_SubgroupInvocationID);
        int _189 = _448;
        int _191 = int(_179);
        int _193 = int(_179);
        int _195 = 30;
        int _197;
        int _454 = _57(_191, _193, _195, _197, gl_SubgroupInvocationID);
        int _199 = _454;
        float _201 = precise::max(_123, as_type<float>(_189));
        int _203 = as_type<int>(_201);
        int _205 = _199;
        int _207 = 31;
        int _209;
        int _462 = _57(_203, _205, _207, _209, gl_SubgroupInvocationID);
        int _211 = _462;
        float _213 = precise::max(_201, as_type<float>(_211));
        int _215 = as_type<int>(_213);
        int _217 = _177;
        int _219 = 31;
        int _221;
        int _470 = _57(_215, _217, _219, _221, gl_SubgroupInvocationID);
        int _223 = _470;
        _149 = as_type<float>(_223);
    }
    _151 = false;
    float _225 = _149;
    float _227 = as_type<float>(gl_SubgroupInvocationID);
    bool _229 = _123 >= 1.0;
    bool _231 = isnan(_123);
    bool _233 = _229 || _231;
    bool _235 = isnan(1.0);
    bool _237 = _233 || _235;
    float _239 = -_123;
    float _241 = fma(_239, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _243 = 1.0 / _241;
    int _245 = as_type<int>(_227) & 3;
    bool _247 = _245 != 0;
    float _249 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _251 = fma(_243, (*spvDescriptorSet0.fp_c3)._m0[1].w, _249);
    if (!_247)
    {
        int _253 = _106 >> 31;
        int _255 = _110 >> 31;
        int _257 = _253 & 1;
        int _259 = _255 & 1;
        int _261 = _106 + _257;
        int _263 = _110 + _259;
        int _265 = _261 >> 1;
        int _267 = _263 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_225, _225, _225, _225), uint2(int2(_265, _267)));
    }
    bool _269 = !_237;
    int _271 = _269 ? as_type<int>(_251) : 1065353216;
    out.gl_FragDepth = _251;
    out.m_48.x = _90;
    out.m_48.y = _90;
    out.m_48.z = _90;
    out.m_48.w = _90;
    out.m_50.x = as_type<float>(_271);
    return main0_out_u{as_type<uint4>(out.m_48), as_type<uint4>(out.m_50), out.gl_FragDepth};
}


struct main0_out_m
{
    float4 m_48 [[color(0)]];
    uint4 m_50 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_m main0_m(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _151 = false;
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _306 = float2(_79, _77);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_306, float2(0.0), isnan(_306)), int2(0), component::x).xyzw;
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
    uint _115 = spvSubgroupBallot(true).x;
    float _117 = precise::max(_88, _90);
    bool _121 = int(_115) != (-1);
    float _123 = precise::max(_112, _117);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(_123, _123, _123, _123), uint2(int2(_106, _110)));
    float _149;
    if (!_121)
    {
        int _125 = as_type<int>(_123);
        int _127 = 1;
        int _129 = 31;
        int _131;
        int _380 = _56(_125, _127, _129, _131, gl_SubgroupInvocationID);
        int _133 = _380;
        float _135 = precise::max(_123, as_type<float>(_133));
        int _137 = as_type<int>(_135);
        int _139 = 2;
        int _141 = 31;
        int _143;
        int _388 = _56(_137, _139, _141, _143, gl_SubgroupInvocationID);
        int _145 = _388;
        float _147 = precise::max(_135, as_type<float>(_145));
        _149 = _147;
        _151 = true;
    }
    else
    {
        float _153 = as_type<float>(gl_SubgroupInvocationID);
        uint _155 = spvSubgroupBallot(true).x;
        float _157 = as_type<float>(gl_SubgroupLtMask.x);
        int _159 = as_type<int>(_153) & (-4);
        uint _161 = min(uint(_159), 32u);
        bool _163 = _161 < 32u;
        int _165 = 15 << int(_161);
        int _167 = _163 ? _165 : 0;
        int _169 = int(_155) & as_type<int>(_157);
        int _171 = _167 & _169;
        int _173 = _167 & int(_155);
        int _175 = int(spvFindUMSB(uint(_171)));
        int _177 = int(spvFindUMSB(uint(_173)));
        uint _179 = min(uint(_175), as_type<uint>(_153));
        int _181 = as_type<int>(_123);
        int _183 = int(_179);
        int _185 = 31;
        int _187;
        int _448 = _57(_181, _183, _185, _187, gl_SubgroupInvocationID);
        int _189 = _448;
        int _191 = int(_179);
        int _193 = int(_179);
        int _195 = 30;
        int _197;
        int _454 = _57(_191, _193, _195, _197, gl_SubgroupInvocationID);
        int _199 = _454;
        float _201 = precise::max(_123, as_type<float>(_189));
        int _203 = as_type<int>(_201);
        int _205 = _199;
        int _207 = 31;
        int _209;
        int _462 = _57(_203, _205, _207, _209, gl_SubgroupInvocationID);
        int _211 = _462;
        float _213 = precise::max(_201, as_type<float>(_211));
        int _215 = as_type<int>(_213);
        int _217 = _177;
        int _219 = 31;
        int _221;
        int _470 = _57(_215, _217, _219, _221, gl_SubgroupInvocationID);
        int _223 = _470;
        _149 = as_type<float>(_223);
    }
    _151 = false;
    float _225 = _149;
    float _227 = as_type<float>(gl_SubgroupInvocationID);
    bool _229 = _123 >= 1.0;
    bool _231 = isnan(_123);
    bool _233 = _229 || _231;
    bool _235 = isnan(1.0);
    bool _237 = _233 || _235;
    float _239 = -_123;
    float _241 = fma(_239, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _243 = 1.0 / _241;
    int _245 = as_type<int>(_227) & 3;
    bool _247 = _245 != 0;
    float _249 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _251 = fma(_243, (*spvDescriptorSet0.fp_c3)._m0[1].w, _249);
    if (!_247)
    {
        int _253 = _106 >> 31;
        int _255 = _110 >> 31;
        int _257 = _253 & 1;
        int _259 = _255 & 1;
        int _261 = _106 + _257;
        int _263 = _110 + _259;
        int _265 = _261 >> 1;
        int _267 = _263 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(_225, _225, _225, _225), uint2(int2(_265, _267)));
    }
    bool _269 = !_237;
    int _271 = _269 ? as_type<int>(_251) : 1065353216;
    out.gl_FragDepth = _251;
    out.m_48.x = _90;
    out.m_48.y = _90;
    out.m_48.z = _90;
    out.m_48.w = _90;
    out.m_50.x = as_type<float>(_271);
    return main0_out_m{out.m_48, as_type<uint4>(out.m_50), out.gl_FragDepth};
}

