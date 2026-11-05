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
    texture2d<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
    sampler cp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

static inline __attribute__((always_inline))
int _60(thread const int& _1244, thread const int& _1245, thread const int& _1246, thread int& _1247, thread uint& gl_SubgroupInvocationID)
{
    int _1250 = _1246 & 31;
    uint _1252 = uint(int(uint(_1246) >> uint(8)));
    int _1254 = int(_1252) & 31;
    float _1256 = as_type<float>(gl_SubgroupInvocationID);
    int _1258 = as_type<int>(_1256) & _1254;
    int _1260 = ~_1254;
    int _1262 = _1250 & _1260;
    int _1264 = _1262 | _1258;
    int _1266 = ~_1254;
    int _1268 = _1245 & _1266;
    int _1270 = _1268 | _1258;
    bool _1272 = uint(_1270) <= uint(_1264);
    _1247 = _1272 ? (-1) : 0;
    float _1274 = spvSubgroupShuffle(as_type<float>(_1244), uint(_1270));
    uint _1276 = uint(_1272 ? as_type<int>(_1274) : _1244);
    return int(_1276);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _64 = as_type<float>(gl_WorkGroupID.x);
    float _66 = as_type<float>(gl_LocalInvocationID.x);
    int _68 = as_type<int>(_64) * 32;
    int _70 = _68 + as_type<int>(_66);
    bool _74 = _70 != 0;
    bool _76 = uint(_70) >= as_type<uint>((*spvDescriptorSet0.cp_c6)._m0[4].x);
    if (!_74)
    {
        uint _79 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_79)] = 0u;
    }
    if (_76)
    {
        return;
    }
    bool _81 = uint(_70) >= as_type<uint>((*spvDescriptorSet0.cp_c6)._m0[1].z);
    bool _83 = uint(_70) >= as_type<uint>((*spvDescriptorSet0.cp_c6)._m0[0].z);
    bool _85 = !_81;
    int _87 = _85 ? 0 : 1;
    bool _89 = uint(_70) >= as_type<uint>((*spvDescriptorSet0.cp_c6)._m0[1].y);
    bool _91 = uint(_70) >= as_type<uint>((*spvDescriptorSet0.cp_c6)._m0[0].y);
    bool _93 = uint(_70) >= as_type<uint>((*spvDescriptorSet0.cp_c6)._m0[1].x);
    bool _95 = uint(_70) >= as_type<uint>((*spvDescriptorSet0.cp_c6)._m0[1].w);
    int _97 = 2;
    int _99 = 2;
    int _101 = 2;
    int _103 = 2;
    if (!_81)
    {
        _97 = 1;
    }
    int _105 = _97;
    bool _107 = !_81;
    int _109 = _107 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c6)._m0[3].y);
    int _111 = _105;
    if (!_83)
    {
        _111 = _87;
    }
    int _113 = _111;
    bool _115 = !_83;
    int _117 = _115 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c6)._m0[2].y);
    bool _119 = uint(_70) >= as_type<uint>((*spvDescriptorSet0.cp_c6)._m0[0].x);
    if (!_89)
    {
        _99 = 1;
    }
    int _121 = _99;
    bool _123 = uint(_70) >= as_type<uint>((*spvDescriptorSet0.cp_c6)._m0[0].w);
    bool _125 = !_89;
    int _127 = _125 ? 0 : 1;
    int _129 = _121;
    if (!_93)
    {
        _101 = 1;
    }
    int _131 = _101;
    bool _133 = !_93;
    int _135 = _133 ? 0 : 1;
    int _137 = _131;
    if (!_95)
    {
        _103 = 1;
    }
    int _139 = _103;
    int _141 = _139;
    if (!_91)
    {
        _129 = _127;
    }
    int _143 = _129;
    bool _145 = !_95;
    int _147 = _145 ? 0 : 1;
    if (!_119)
    {
        _137 = _135;
    }
    int _149 = _137;
    if (!_123)
    {
        _141 = _147;
    }
    int _151 = _141;
    int _153 = _117 + _109;
    int _155 = _113 + _149;
    int _157 = _155 + _143;
    bool _159 = !_89;
    int _161 = _159 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c6)._m0[3].x);
    bool _163 = !_91;
    int _165 = _163 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c6)._m0[2].x);
    int _167 = _157 + (-1);
    int _169 = _167 + _151;
    int _171 = _153 + _165;
    int _173 = _171 + _161;
    bool _175 = !_123;
    int _177 = _175 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c6)._m0[2].z);
    int _179 = _169 * 16;
    bool _181 = !_95;
    int _183 = _181 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c6)._m0[3].z);
    bool _185 = !_93;
    int _187 = _185 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c6)._m0[2].w);
    int _189 = _173 + _177;
    int _191 = _189 + _183;
    int _193 = _179 + 4;
    uint _195 = uint(int(uint(_193) >> uint(2)));
    uint _197 = uint(int(uint(int(_195)) >> uint(2)));
    int _199 = int(_195) & 3;
    float _201 = (*spvDescriptorSet0.cp_c3)._m0[int(_197)][_199];
    int _203 = ~_191;
    int _205 = ~_187;
    int _207 = _70 + _203;
    int _209 = _207 + _205;
    int _211 = _209 + 2;
    uint _213 = uint(int(uint(_211) >> uint(1)));
    int _215 = _211 & 1431655765;
    int _217 = int(_213) & 1431655765;
    uint _219 = uint(int(uint(_215) >> uint(1)));
    int _221 = int(_219) + _215;
    uint _223 = uint(int(uint(_217) >> uint(1)));
    int _225 = int(_223) + _217;
    int _227 = _221 & 858993459;
    int _229 = _225 & 858993459;
    uint _231 = uint(int(uint(_227) >> uint(2)));
    int _233 = int(_231) + _227;
    uint _235 = uint(int(uint(_229) >> uint(2)));
    int _237 = int(_235) + _229;
    int _239 = _233 & 252645135;
    int _241 = _237 & 252645135;
    uint _243 = uint(int(uint(_239) >> uint(4)));
    int _245 = int(_243) + _239;
    uint _247 = uint(int(uint(_241) >> uint(4)));
    int _249 = int(_247) + _241;
    int _251 = _245 & 16711680;
    int _253 = _245 & 255;
    int _255 = _249 & 16711680;
    int _257 = _249 & 255;
    uint _259 = uint(int(uint(_251) >> uint(8)));
    int _261 = int(_259) + _253;
    uint _263 = uint(int(uint(_255) >> uint(8)));
    int _265 = int(_263) + _257;
    float _267 = float(uint(_261));
    float _269 = float(uint(_265));
    float _271 = fma(_267, _201, (*spvDescriptorSet0.cp_c4)._m0[0].z);
    float _273 = fma(_269, _201, (*spvDescriptorSet0.cp_c4)._m0[0].w);
    float _275 = fma(_201, 0.5, _271);
    float _277 = fma(_201, 0.5, _273);
    float _279 = fma(_275, 6.2500002968590706586837768554688e-05, 0.5);
    float _281 = fma(_277, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _872 = float2(_279, _281);
    float _283 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_872, float2(0.0), isnan(_872)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_872, float2(0.0), isnan(_872)), level(0.0)).x;
    float _285 = _201 * 0.707106769084930419921875;
    float _287 = _283 * 2000.0;
    float _289 = _287 * (*spvDescriptorSet0.cp_c5)._m0[1].y;
    float _291 = _287 * (*spvDescriptorSet0.cp_c5)._m0[0].y;
    float _293 = _287 * (*spvDescriptorSet0.cp_c5)._m0[2].y;
    float _295 = _287 * (*spvDescriptorSet0.cp_c5)._m0[3].y;
    float _297 = fma(_275, (*spvDescriptorSet0.cp_c5)._m0[1].x, _289);
    float _299 = fma(_275, (*spvDescriptorSet0.cp_c5)._m0[0].x, _291);
    float _301 = fma(_275, (*spvDescriptorSet0.cp_c5)._m0[2].x, _293);
    float _303 = fma(_275, (*spvDescriptorSet0.cp_c5)._m0[3].x, _295);
    float _305 = fma(_277, (*spvDescriptorSet0.cp_c5)._m0[1].z, _297);
    float _307 = fma(_277, (*spvDescriptorSet0.cp_c5)._m0[0].z, _299);
    float _309 = fma(_277, (*spvDescriptorSet0.cp_c5)._m0[2].z, _301);
    float _311 = fma(_277, (*spvDescriptorSet0.cp_c5)._m0[3].z, _303);
    float _313 = _305 + (*spvDescriptorSet0.cp_c5)._m0[1].w;
    float _315 = _307 + (*spvDescriptorSet0.cp_c5)._m0[0].w;
    float _317 = _309 + (*spvDescriptorSet0.cp_c5)._m0[2].w;
    float _319 = _311 + (*spvDescriptorSet0.cp_c5)._m0[3].w;
    bool _321 = _313 >= _285;
    bool _323 = isnan(_313);
    bool _325 = _321 || _323;
    bool _327 = isnan(_285);
    bool _329 = _325 || _327;
    bool _331 = _315 < _285;
    bool _333 = !_329;
    bool _335 = _331 && _333;
    bool _337 = _317 < _285;
    bool _339 = _337 && _335;
    bool _341 = _319 < _285;
    bool _343 = _341 && _339;
    if (!_343)
    {
        return;
    }
    uint _345 = uint(int(uint(_179) >> uint(2)));
    uint _347 = uint(int(uint(int(_345)) >> uint(2)));
    int _349 = int(_345) & 3;
    float _351 = (*spvDescriptorSet0.cp_c3)._m0[int(_347)][_349];
    float _353 = -(*spvDescriptorSet0.cp_c5)._m0[4].y;
    float _355 = _287 + _353;
    float _357 = -(*spvDescriptorSet0.cp_c5)._m0[4].x;
    float _359 = _275 + _357;
    float _361 = _355 * _355;
    float _363 = -(*spvDescriptorSet0.cp_c5)._m0[4].z;
    float _365 = _277 + _363;
    float _367 = fma(_359, _359, _361);
    float _369 = fma(_365, _365, _367);
    float _371 = sqrt(_369);
    float _373 = -_285;
    float _375 = _373 + _371;
    bool _377 = _375 >= _351;
    bool _379 = isnan(_375);
    bool _381 = _377 || _379;
    bool _383 = isnan(_351);
    bool _385 = _381 || _383;
    int _387 = as_type<int>(_365);
    if (_385)
    {
        return;
    }
    float _389 = as_type<float>(gl_SubgroupInvocationID);
    uint _391 = spvSubgroupBallot(true).x;
    int _393 = reverse_bits(int(_391));
    int _395 = int(spvFindUMSB(uint(_393)));
    bool _397 = _395 != (-1);
    int _399 = _395 ^ 31;
    int _401 = _397 ? _399 : _395;
    bool _403 = as_type<int>(_389) != _401;
    if (_403)
    {
        _387 = 0;
    }
    int _405 = _387;
    int _407 = _405;
    if (!_403)
    {
        int _409 = popcount(int(_391));
        uint _411 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
        uint _1113 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[int(_411)], uint(_409), memory_order_relaxed);
        uint _413 = _1113;
        _407 = int(_413);
    }
    int _415 = _407;
    uint _417 = spvSubgroupBallot(true).x;
    float _419 = as_type<float>(gl_SubgroupLtMask.x);
    int _421 = reverse_bits(int(_417));
    int _423 = _179 + 4;
    uint _425 = uint(int(uint(_423) >> uint(2)));
    uint _427 = uint(int(uint(int(_425)) >> uint(2)));
    int _429 = int(_425) & 3;
    float _431 = (*spvDescriptorSet0.cp_c3)._m0[int(_427)][_429];
    int _433 = int(spvFindUMSB(uint(_421)));
    bool _435 = _433 != (-1);
    int _437 = _433 ^ 31;
    int _439 = _435 ? _437 : _433;
    uint _441 = uint(int(uint(_179) >> uint(2)));
    uint _443 = uint(int(uint(int(_441)) >> uint(2)));
    int _445 = int(_441) & 3;
    float _447 = (*spvDescriptorSet0.cp_c3)._m0[int(_443)][_445];
    int _449 = as_type<int>(_419) & int(_391);
    int _451 = _415;
    int _453 = _439;
    int _455 = 31;
    int _457;
    int _1177 = _60(_451, _453, _455, _457, gl_SubgroupInvocationID);
    int _459 = _1177;
    int _461 = popcount(_449);
    int _463 = _459 + _461;
    int _465 = _463 * 24;
    int _467 = _465 + 8;
    uint _469 = uint(int(uint(_465) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_469)] = as_type<uint>(_271);
    int _471 = _465 + 4;
    uint _473 = uint(int(uint(_471) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_473)] = as_type<uint>(_273);
    int _475 = _465 + 16;
    uint _477 = uint(int(uint(_467) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_477)] = as_type<uint>(_201);
    int _479 = _467 + 4;
    uint _481 = uint(int(uint(_479) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_481)] = as_type<uint>(_431);
    uint _483 = uint(int(uint(_475) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_483)] = as_type<uint>(_351);
    int _485 = _475 + 4;
    uint _487 = uint(int(uint(_485) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_487)] = as_type<uint>(_447);
}

