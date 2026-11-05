#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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

struct _31
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c1 [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    constant _16* cp_c6 [[id(2)]];
    constant _16* cp_c4 [[id(3)]];
    constant _16* cp_c5 [[id(4)]];
    device _31* cp_s0 [[id(5)]];
    device _31* cp_s1 [[id(6)]];
    texture2d<float> cp_t_tcb_A [[id(7)]];
    sampler cp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> cp_t_tcb_8 [[id(9)]];
    sampler cp_t_tcb_8Smplr [[id(10)]];
    sampler cp_t_tcb_ASmplr_w [[id(11)]];
    sampler cp_t_tcb_8Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

static inline __attribute__((always_inline))
int _62(thread const int& _1257, thread const int& _1258, thread const int& _1259, thread int& _1260, thread uint& gl_SubgroupInvocationID)
{
    int _1263 = _1259 & 31;
    uint _1265 = uint(int(uint(_1259) >> uint(8)));
    int _1267 = int(_1265) & 31;
    float _1269 = as_type<float>(gl_SubgroupInvocationID);
    int _1271 = as_type<int>(_1269) & _1267;
    int _1273 = ~_1267;
    int _1275 = _1263 & _1273;
    int _1277 = _1275 | _1271;
    int _1279 = ~_1267;
    int _1281 = _1258 & _1279;
    int _1283 = _1281 | _1271;
    bool _1285 = uint(_1283) <= uint(_1277);
    _1260 = _1285 ? (-1) : 0;
    float _1287 = spvSubgroupShuffle(as_type<float>(_1257), uint(_1283));
    uint _1289 = uint(_1285 ? as_type<int>(_1287) : _1257);
    return int(_1289);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _66 = as_type<float>(gl_WorkGroupID.x);
    float _68 = as_type<float>(gl_LocalInvocationID.x);
    int _70 = as_type<int>(_66) * 32;
    int _72 = _70 + as_type<int>(_68);
    bool _76 = _72 != 0;
    bool _78 = uint(_72) >= as_type<uint>((*spvDescriptorSet0.cp_c6)._m0[4].x);
    if (!_76)
    {
        uint _81 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_81)] = 0u;
    }
    if (_78)
    {
        return;
    }
    bool _83 = uint(_72) >= as_type<uint>((*spvDescriptorSet0.cp_c6)._m0[1].z);
    bool _85 = uint(_72) >= as_type<uint>((*spvDescriptorSet0.cp_c6)._m0[0].z);
    bool _87 = !_83;
    int _89 = _87 ? 0 : 1;
    bool _91 = uint(_72) >= as_type<uint>((*spvDescriptorSet0.cp_c6)._m0[1].y);
    bool _93 = uint(_72) >= as_type<uint>((*spvDescriptorSet0.cp_c6)._m0[0].y);
    bool _95 = uint(_72) >= as_type<uint>((*spvDescriptorSet0.cp_c6)._m0[1].x);
    bool _97 = uint(_72) >= as_type<uint>((*spvDescriptorSet0.cp_c6)._m0[1].w);
    int _99 = 2;
    int _101 = 2;
    int _103 = 2;
    int _105 = 2;
    if (!_83)
    {
        _99 = 1;
    }
    int _107 = _99;
    bool _109 = !_83;
    int _111 = _109 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c6)._m0[3].y);
    int _113 = _107;
    if (!_85)
    {
        _113 = _89;
    }
    int _115 = _113;
    bool _117 = !_85;
    int _119 = _117 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c6)._m0[2].y);
    bool _121 = uint(_72) >= as_type<uint>((*spvDescriptorSet0.cp_c6)._m0[0].x);
    if (!_91)
    {
        _101 = 1;
    }
    int _123 = _101;
    bool _125 = uint(_72) >= as_type<uint>((*spvDescriptorSet0.cp_c6)._m0[0].w);
    bool _127 = !_91;
    int _129 = _127 ? 0 : 1;
    int _131 = _123;
    if (!_95)
    {
        _103 = 1;
    }
    int _133 = _103;
    bool _135 = !_95;
    int _137 = _135 ? 0 : 1;
    int _139 = _133;
    if (!_97)
    {
        _105 = 1;
    }
    int _141 = _105;
    int _143 = _141;
    if (!_93)
    {
        _131 = _129;
    }
    int _145 = _131;
    bool _147 = !_97;
    int _149 = _147 ? 0 : 1;
    if (!_121)
    {
        _139 = _137;
    }
    int _151 = _139;
    if (!_125)
    {
        _143 = _149;
    }
    int _153 = _143;
    int _155 = _119 + _111;
    int _157 = _115 + _151;
    int _159 = _157 + _145;
    bool _161 = !_91;
    int _163 = _161 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c6)._m0[3].x);
    bool _165 = !_93;
    int _167 = _165 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c6)._m0[2].x);
    int _169 = _159 + (-1);
    int _171 = _169 + _153;
    int _173 = _155 + _167;
    int _175 = _173 + _163;
    bool _177 = !_125;
    int _179 = _177 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c6)._m0[2].z);
    int _181 = _171 * 16;
    bool _183 = !_97;
    int _185 = _183 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c6)._m0[3].z);
    bool _187 = !_95;
    int _189 = _187 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c6)._m0[2].w);
    int _191 = _175 + _179;
    int _193 = _191 + _185;
    int _195 = _181 + 4;
    uint _197 = uint(int(uint(_195) >> uint(2)));
    uint _199 = uint(int(uint(int(_197)) >> uint(2)));
    int _201 = int(_197) & 3;
    float _203 = (*spvDescriptorSet0.cp_c3)._m0[int(_199)][_201];
    int _205 = ~_193;
    int _207 = ~_189;
    int _209 = _72 + _205;
    int _211 = _209 + _207;
    int _213 = _211 + 2;
    uint _215 = uint(int(uint(_213) >> uint(1)));
    int _217 = _213 & 1431655765;
    int _219 = int(_215) & 1431655765;
    uint _221 = uint(int(uint(_217) >> uint(1)));
    int _223 = int(_221) + _217;
    uint _225 = uint(int(uint(_219) >> uint(1)));
    int _227 = int(_225) + _219;
    int _229 = _223 & 858993459;
    int _231 = _227 & 858993459;
    uint _233 = uint(int(uint(_229) >> uint(2)));
    int _235 = int(_233) + _229;
    uint _237 = uint(int(uint(_231) >> uint(2)));
    int _239 = int(_237) + _231;
    int _241 = _235 & 252645135;
    int _243 = _239 & 252645135;
    uint _245 = uint(int(uint(_241) >> uint(4)));
    int _247 = int(_245) + _241;
    uint _249 = uint(int(uint(_243) >> uint(4)));
    int _251 = int(_249) + _243;
    int _253 = _247 & 16711680;
    int _255 = _247 & 255;
    int _257 = _251 & 16711680;
    int _259 = _251 & 255;
    uint _261 = uint(int(uint(_253) >> uint(8)));
    int _263 = int(_261) + _255;
    uint _265 = uint(int(uint(_257) >> uint(8)));
    int _267 = int(_265) + _259;
    float _269 = float(uint(_263));
    float _271 = float(uint(_267));
    float _273 = fma(_269, _203, (*spvDescriptorSet0.cp_c4)._m0[0].z);
    float _275 = fma(_271, _203, (*spvDescriptorSet0.cp_c4)._m0[0].w);
    float _277 = fma(_203, 0.5, _273);
    float _279 = fma(_203, 0.5, _275);
    float _281 = fma(_277, 6.2500002968590706586837768554688e-05, 0.5);
    float _283 = fma(_279, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _876 = float2(_281, _283);
    float _285 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_876, float2(0.0), isnan(_876)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_876, float2(0.0), isnan(_876)), level(0.0)).x;
    float2 _887 = float2(_281, _283);
    float _287 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_887, float2(0.0), isnan(_887)), level(_285)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_887, float2(0.0), isnan(_887)), level(_285)).x;
    float _289 = _203 * 0.707106769084930419921875;
    float _291 = _287 * 2000.0;
    float _293 = _291 * (*spvDescriptorSet0.cp_c5)._m0[1].y;
    float _295 = _291 * (*spvDescriptorSet0.cp_c5)._m0[0].y;
    float _297 = _291 * (*spvDescriptorSet0.cp_c5)._m0[2].y;
    float _299 = _291 * (*spvDescriptorSet0.cp_c5)._m0[3].y;
    float _301 = fma(_277, (*spvDescriptorSet0.cp_c5)._m0[1].x, _293);
    float _303 = fma(_277, (*spvDescriptorSet0.cp_c5)._m0[0].x, _295);
    float _305 = fma(_277, (*spvDescriptorSet0.cp_c5)._m0[2].x, _297);
    float _307 = fma(_277, (*spvDescriptorSet0.cp_c5)._m0[3].x, _299);
    float _309 = fma(_279, (*spvDescriptorSet0.cp_c5)._m0[1].z, _301);
    float _311 = fma(_279, (*spvDescriptorSet0.cp_c5)._m0[0].z, _303);
    float _313 = fma(_279, (*spvDescriptorSet0.cp_c5)._m0[2].z, _305);
    float _315 = fma(_279, (*spvDescriptorSet0.cp_c5)._m0[3].z, _307);
    float _317 = _309 + (*spvDescriptorSet0.cp_c5)._m0[1].w;
    float _319 = _311 + (*spvDescriptorSet0.cp_c5)._m0[0].w;
    float _321 = _313 + (*spvDescriptorSet0.cp_c5)._m0[2].w;
    float _323 = _315 + (*spvDescriptorSet0.cp_c5)._m0[3].w;
    bool _325 = _317 >= _289;
    bool _327 = isnan(_317);
    bool _329 = _325 || _327;
    bool _331 = isnan(_289);
    bool _333 = _329 || _331;
    bool _335 = _319 < _289;
    bool _337 = !_333;
    bool _339 = _335 && _337;
    bool _341 = _321 < _289;
    bool _343 = _341 && _339;
    bool _345 = _323 < _289;
    bool _347 = _345 && _343;
    if (!_347)
    {
        return;
    }
    uint _349 = uint(int(uint(_181) >> uint(2)));
    uint _351 = uint(int(uint(int(_349)) >> uint(2)));
    int _353 = int(_349) & 3;
    float _355 = (*spvDescriptorSet0.cp_c3)._m0[int(_351)][_353];
    float _357 = -(*spvDescriptorSet0.cp_c5)._m0[4].y;
    float _359 = _291 + _357;
    float _361 = -(*spvDescriptorSet0.cp_c5)._m0[4].x;
    float _363 = _277 + _361;
    float _365 = _359 * _359;
    float _367 = -(*spvDescriptorSet0.cp_c5)._m0[4].z;
    float _369 = _279 + _367;
    float _371 = fma(_363, _363, _365);
    float _373 = fma(_369, _369, _371);
    float _375 = sqrt(_373);
    float _377 = -_289;
    float _379 = _377 + _375;
    bool _381 = _379 >= _355;
    bool _383 = isnan(_379);
    bool _385 = _381 || _383;
    bool _387 = isnan(_355);
    bool _389 = _385 || _387;
    int _391 = as_type<int>(_369);
    if (_389)
    {
        return;
    }
    float _393 = as_type<float>(gl_SubgroupInvocationID);
    uint _395 = spvSubgroupBallot(true).x;
    int _397 = reverse_bits(int(_395));
    int _399 = int(spvFindUMSB(uint(_397)));
    bool _401 = _399 != (-1);
    int _403 = _399 ^ 31;
    int _405 = _401 ? _403 : _399;
    bool _407 = as_type<int>(_393) != _405;
    if (_407)
    {
        _391 = 0;
    }
    int _409 = _391;
    int _411 = _409;
    if (!_407)
    {
        int _413 = popcount(int(_395));
        uint _415 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
        uint _1126 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[int(_415)], uint(_413), memory_order_relaxed);
        uint _417 = _1126;
        _411 = int(_417);
    }
    int _419 = _411;
    uint _421 = spvSubgroupBallot(true).x;
    float _423 = as_type<float>(gl_SubgroupLtMask.x);
    int _425 = reverse_bits(int(_421));
    int _427 = _181 + 4;
    uint _429 = uint(int(uint(_427) >> uint(2)));
    uint _431 = uint(int(uint(int(_429)) >> uint(2)));
    int _433 = int(_429) & 3;
    float _435 = (*spvDescriptorSet0.cp_c3)._m0[int(_431)][_433];
    int _437 = int(spvFindUMSB(uint(_425)));
    bool _439 = _437 != (-1);
    int _441 = _437 ^ 31;
    int _443 = _439 ? _441 : _437;
    uint _445 = uint(int(uint(_181) >> uint(2)));
    uint _447 = uint(int(uint(int(_445)) >> uint(2)));
    int _449 = int(_445) & 3;
    float _451 = (*spvDescriptorSet0.cp_c3)._m0[int(_447)][_449];
    int _453 = as_type<int>(_423) & int(_395);
    int _455 = _419;
    int _457 = _443;
    int _459 = 31;
    int _461;
    int _1190 = _62(_455, _457, _459, _461, gl_SubgroupInvocationID);
    int _463 = _1190;
    int _465 = popcount(_453);
    int _467 = _463 + _465;
    int _469 = _467 * 24;
    int _471 = _469 + 8;
    uint _473 = uint(int(uint(_469) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_473)] = as_type<uint>(_273);
    int _475 = _469 + 4;
    uint _477 = uint(int(uint(_475) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_477)] = as_type<uint>(_275);
    int _479 = _469 + 16;
    uint _481 = uint(int(uint(_471) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_481)] = as_type<uint>(_203);
    int _483 = _471 + 4;
    uint _485 = uint(int(uint(_483) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_485)] = as_type<uint>(_435);
    uint _487 = uint(int(uint(_479) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_487)] = as_type<uint>(_355);
    int _489 = _479 + 4;
    uint _491 = uint(int(uint(_489) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_491)] = as_type<uint>(_451);
}

