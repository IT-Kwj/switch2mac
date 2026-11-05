#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

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

template<typename T, size_t Num>
struct spvUnsafeArray
{
    T elements[Num ? Num : 1];
    
    thread T& operator [] (size_t pos) thread
    {
        return elements[pos];
    }
    constexpr const thread T& operator [] (size_t pos) const thread
    {
        return elements[pos];
    }
    
    device T& operator [] (size_t pos) device
    {
        return elements[pos];
    }
    constexpr const device T& operator [] (size_t pos) const device
    {
        return elements[pos];
    }
    
    constexpr const constant T& operator [] (size_t pos) const constant
    {
        return elements[pos];
    }
    
    threadgroup T& operator [] (size_t pos) threadgroup
    {
        return elements[pos];
    }
    constexpr const threadgroup T& operator [] (size_t pos) const threadgroup
    {
        return elements[pos];
    }
};

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    const device _21* cp_s0 [[id(1)]];
    texture2d_array<float> cp_t_tcb_A [[id(2)]];
    sampler cp_t_tcb_ASmplr [[id(3)]];
    texture2d_array<float> cp_t_tcb_8 [[id(4)]];
    sampler cp_t_tcb_8Smplr [[id(5)]];
    sampler cp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

static inline __attribute__((always_inline))
void _52(thread const int& _6708, thread const int& _6709, threadgroup spvUnsafeArray<uint, 1013>& _29)
{
    uint _6712 = uint(int(uint(_6708) >> uint(2)));
    int _6714 = _6708 & 3;
    int _6716 = _6714 << 3;
    bool _6718;
    do
    {
        float _6720 = as_type<float>(_29[int(_6712)]);
        int _6722 = int(insert_bits(as_type<uint>(_6720), uint(_6709), uint(_6716), 8u));
        uint _6752 = as_type<uint>(_6720);
        uint _6757;
        do
        {
            _6757 = _6752;
        } while (!atomic_compare_exchange_weak_explicit((threadgroup atomic_uint*)&_29[int(_6712)], &_6757, uint(_6722), memory_order_relaxed, memory_order_relaxed) && _6757 == _6752);
        uint _6724 = _6757;
        _6718 = int(_6724) != as_type<int>(_6720);
    } while (_6718);
}

static inline __attribute__((always_inline)) void dm_stage_body(constant spvDescriptorSetBuffer0& spvDescriptorSet0, uint gl_SubgroupInvocationID, threadgroup spvUnsafeArray<uint, 1013>& _29)
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _56 = as_type<float>(_29[4]);
    int _58 = as_type<int>(_56) << 2;
    float _60 = as_type<float>(gl_SubgroupInvocationID);
    int _62 = _58 + 32;
    uint _65 = uint(int(uint(_62) >> uint(2)));
    float _67 = as_type<float>(_29[int(_65)]);
    int _69 = as_type<int>(_60) & 7;
    int _71 = as_type<int>(_67) & (-4);
    int _73 = as_type<int>(_67) << 3;
    uint _75 = uint(int(uint(as_type<int>(_60)) >> uint(3)));
    int _77 = int(_75) + _71;
    int _79 = 24 & _73;
    int _81 = (-25) & _69;
    int _83 = _79 | _81;
    int _85 = _77 << 5;
    int _87 = _85 + _77;
    int _89 = _77 * 33;
    int _91 = _89 + _83;
    int _93 = _83 + 33;
    int _95 = _93 + _87;
    int _97 = _83 + 1;
    int _99 = _97 + _87;
    int _101 = _91 << 3;
    int _103 = _83 + 34;
    int _105 = _103 + _87;
    int _107 = _99 << 3;
    int _109 = _95 << 3;
    uint _111 = uint(int(uint(_101) >> uint(2)));
    float _113 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_111)]);
    int _115 = _105 << 3;
    uint _117 = uint(int(uint(_107) >> uint(2)));
    float _119 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_117)]);
    uint _121 = uint(int(uint(_109) >> uint(2)));
    float _123 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_121)]);
    uint _125 = uint(int(uint(_115) >> uint(2)));
    float _127 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_125)]);
    uint _129 = min(as_type<uint>(_113), as_type<uint>(_123));
    uint _131 = min(as_type<uint>(_119), as_type<uint>(_127));
    uint _133 = max(as_type<uint>(_113), as_type<uint>(_123));
    uint _135 = max(as_type<uint>(_119), as_type<uint>(_127));
    uint _137 = min(_129, _131);
    uint _139 = max(_133, _135);
    bool _143 = int(_137) != 0;
    int _145 = int(_137) + 30000;
    bool _147 = _139 < uint(_145);
    bool _149 = _147 && _143;
    uint _151 = spvSubgroupBallot(_149).x;
    float _153 = as_type<float>(_83);
    if (!_149)
    {
        return;
    }
    float _155 = float(as_type<int>((*spvDescriptorSet0.cp_c3)._m0[3].z));
    float _157 = as_type<float>(gl_SubgroupLtMask.x);
    float _159 = float(uint(_77));
    float _161 = float(as_type<uint>(_113));
    float _163 = fma(_159, 2.0, _155);
    float _165 = float(as_type<int>((*spvDescriptorSet0.cp_c3)._m0[3].w));
    float _167 = float(uint(_83));
    float _169 = fma(_161, 9.9999997473787516355514526367188e-05, 1.10000002384185791015625);
    float _171 = _163 * (*spvDescriptorSet0.cp_c3)._m0[14].x;
    float _173 = _163 * (*spvDescriptorSet0.cp_c3)._m0[117].x;
    float _175 = fma(_167, 2.0, _165);
    float _177 = fma(_169, (*spvDescriptorSet0.cp_c3)._m0[14].y, _171);
    float _179 = float(as_type<uint>(_119));
    float _181 = _163 * (*spvDescriptorSet0.cp_c3)._m0[118].x;
    float _183 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[14].z, _177);
    float _185 = float(as_type<uint>(_123));
    float _187 = fma(_179, 9.9999997473787516355514526367188e-05, 1.10000002384185791015625);
    float _189 = _183 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _191 = fma(_187, (*spvDescriptorSet0.cp_c3)._m0[14].y, _171);
    float _193 = _175 + 2.0;
    float _195 = -_189;
    bool _197 = _195 > (*spvDescriptorSet0.cp_c3)._m0[631].y;
    float _199 = fma(_193, (*spvDescriptorSet0.cp_c3)._m0[14].z, _191);
    float _201 = -_189;
    bool _203 = _201 > (*spvDescriptorSet0.cp_c3)._m0[631].x;
    bool _205 = !_197;
    int _207 = _205 ? 0 : 1;
    float _209 = _199 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _211 = -_209;
    bool _213 = _211 > (*spvDescriptorSet0.cp_c3)._m0[631].y;
    int _215 = 2;
    int _217 = 2;
    uint _219 = as_type<uint>(_179);
    float _221 = _159;
    float _223 = _175;
    if (!_197)
    {
        _215 = 1;
    }
    int _225 = _215;
    float _227 = -_209;
    bool _229 = _227 > (*spvDescriptorSet0.cp_c3)._m0[631].x;
    float _231 = fma(_161, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    int _233 = _225;
    if (!_203)
    {
        _233 = _207;
    }
    int _235 = _233;
    int _237 = int(_151) & as_type<int>(_157);
    float _239 = fma(_231, (*spvDescriptorSet0.cp_c3)._m0[118].y, _181);
    int _241 = _235 << 6;
    bool _243 = !_213;
    int _245 = _243 ? 0 : 1;
    float _247 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[118].z, _239);
    float _249 = as_type<float>(_235);
    if (!_213)
    {
        _217 = 1;
    }
    int _251 = _217;
    int _253 = _241 + 9904;
    uint _255 = uint(int(uint(_253) >> uint(2)));
    uint _257 = uint(int(uint(int(_255)) >> uint(2)));
    int _259 = int(_255) & 3;
    float _261 = (*spvDescriptorSet0.cp_c3)._m0[int(_257)][_259];
    int _263 = int(_255) + 1;
    uint _265 = uint(int(uint(_263) >> uint(2)));
    int _267 = _263 & 3;
    float _269 = (*spvDescriptorSet0.cp_c3)._m0[int(_265)][_267];
    int _271 = popcount(_237);
    int _273 = _251;
    if (!_229)
    {
        _273 = _245;
    }
    int _275 = _273;
    float _277 = fma(_231, (*spvDescriptorSet0.cp_c3)._m0[117].y, _173);
    float _279 = _247 + (*spvDescriptorSet0.cp_c3)._m0[118].w;
    int _281 = _275 << 6;
    float _283 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[117].z, _277);
    int _285 = _241 + 9936;
    uint _287 = uint(int(uint(_285) >> uint(2)));
    uint _289 = uint(int(uint(int(_287)) >> uint(2)));
    int _291 = int(_287) & 3;
    float _293 = (*spvDescriptorSet0.cp_c3)._m0[int(_289)][_291];
    int _295 = int(_287) + 1;
    uint _297 = uint(int(uint(_295) >> uint(2)));
    int _299 = _295 & 3;
    float _301 = (*spvDescriptorSet0.cp_c3)._m0[int(_297)][_299];
    float _303 = trunc(_279);
    int _305 = int(_303);
    float _307 = _283 + (*spvDescriptorSet0.cp_c3)._m0[117].w;
    int _309 = _241 + 9952;
    uint _311 = uint(int(uint(_309) >> uint(2)));
    uint _313 = uint(int(uint(int(_311)) >> uint(2)));
    int _315 = int(_311) & 3;
    float _317 = (*spvDescriptorSet0.cp_c3)._m0[int(_313)][_315];
    int _319 = int(_311) + 1;
    uint _321 = uint(int(uint(_319) >> uint(2)));
    int _323 = _319 & 3;
    float _325 = (*spvDescriptorSet0.cp_c3)._m0[int(_321)][_323];
    float _327 = trunc(_307);
    int _329 = int(_327);
    int _331 = _271 << 2;
    int _333 = _331 + 1;
    int _335 = _281 + 9904;
    uint _337 = uint(int(uint(_335) >> uint(2)));
    uint _339 = uint(int(uint(int(_337)) >> uint(2)));
    int _341 = int(_337) & 3;
    float _343 = (*spvDescriptorSet0.cp_c3)._m0[int(_339)][_341];
    int _345 = int(_337) + 1;
    uint _347 = uint(int(uint(_345) >> uint(2)));
    int _349 = _345 & 3;
    float _351 = (*spvDescriptorSet0.cp_c3)._m0[int(_347)][_349];
    int _353 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].z);
    int _355 = _305 + _353;
    int _357 = _355 + 1;
    int _359 = _333 << 2;
    uint _361 = uint(int(uint(_333) >> uint(5)));
    int _363 = 124 & _359;
    int _365 = _281 + 9936;
    uint _367 = uint(int(uint(_365) >> uint(2)));
    uint _369 = uint(int(uint(int(_367)) >> uint(2)));
    int _371 = int(_367) & 3;
    float _373 = (*spvDescriptorSet0.cp_c3)._m0[int(_369)][_371];
    int _375 = int(_367) + 1;
    uint _377 = uint(int(uint(_375) >> uint(2)));
    int _379 = _375 & 3;
    float _381 = (*spvDescriptorSet0.cp_c3)._m0[int(_377)][_379];
    int _383 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].y);
    int _385 = _329 + _383;
    int _387 = _385 + 1;
    int _389 = int(_361) * 896;
    int _391 = _389 + _363;
    bool _393 = _387 >= 0;
    int _395 = _241 + 9920;
    uint _397 = uint(int(uint(_395) >> uint(2)));
    uint _399 = uint(int(uint(int(_397)) >> uint(2)));
    int _401 = int(_397) & 3;
    float _403 = (*spvDescriptorSet0.cp_c3)._m0[int(_399)][_401];
    int _405 = int(_397) + 1;
    uint _407 = uint(int(uint(_405) >> uint(2)));
    int _409 = _405 & 3;
    float _411 = (*spvDescriptorSet0.cp_c3)._m0[int(_407)][_409];
    bool _413 = _387 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _415 = !_393;
    bool _417 = _413 || _415;
    bool _419 = _357 < 0;
    bool _421 = _419 || _417;
    int _423 = _281 + 9920;
    uint _425 = uint(int(uint(_423) >> uint(2)));
    uint _427 = uint(int(uint(int(_425)) >> uint(2)));
    int _429 = int(_425) & 3;
    float _431 = (*spvDescriptorSet0.cp_c3)._m0[int(_427)][_429];
    int _433 = int(_425) + 1;
    uint _435 = uint(int(uint(_433) >> uint(2)));
    int _437 = _433 & 3;
    float _439 = (*spvDescriptorSet0.cp_c3)._m0[int(_435)][_437];
    float _441 = _231 * _269;
    bool _443 = _357 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _445 = _443 || _421;
    float _447 = fma(_163, _261, _441);
    float _449 = fma(_179, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    float _451 = _231 * _301;
    int _453 = _281 + 9944;
    uint _455 = uint(int(uint(_453) >> uint(2)));
    uint _457 = uint(int(uint(int(_455)) >> uint(2)));
    int _459 = int(_455) & 3;
    float _461 = (*spvDescriptorSet0.cp_c3)._m0[int(_457)][_459];
    float _463 = fma(_449, (*spvDescriptorSet0.cp_c3)._m0[117].y, _173);
    float _465 = fma(_163, _293, _451);
    if (!_445)
    {
        int _467 = _357 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
        int _469 = _467 + _387;
        _219 = uint(_469);
    }
    uint _471 = _219;
    float _473 = _231 * _325;
    int _475 = _241 + 9912;
    uint _477 = uint(int(uint(_475) >> uint(2)));
    uint _479 = uint(int(uint(int(_477)) >> uint(2)));
    int _481 = int(_477) & 3;
    float _483 = (*spvDescriptorSet0.cp_c3)._m0[int(_479)][_481];
    int _485 = int(_477) + 1;
    uint _487 = uint(int(uint(_485) >> uint(2)));
    int _489 = _485 & 3;
    float _491 = (*spvDescriptorSet0.cp_c3)._m0[int(_487)][_489];
    float _493 = fma(_193, (*spvDescriptorSet0.cp_c3)._m0[117].z, _463);
    float _495 = fma(_163, _317, _473);
    float _497 = _493 + (*spvDescriptorSet0.cp_c3)._m0[117].w;
    float _499 = _449 * _351;
    float _501 = trunc(_497);
    int _503 = int(_501);
    float _505 = fma(_163, _343, _499);
    float _507 = fma(_449, (*spvDescriptorSet0.cp_c3)._m0[118].y, _181);
    float _509 = _449 * _381;
    float _511 = fma(_193, (*spvDescriptorSet0.cp_c3)._m0[118].z, _507);
    int _513 = _241 + 9928;
    uint _515 = uint(int(uint(_513) >> uint(2)));
    uint _517 = uint(int(uint(int(_515)) >> uint(2)));
    int _519 = int(_515) & 3;
    float _521 = (*spvDescriptorSet0.cp_c3)._m0[int(_517)][_519];
    int _523 = int(_515) + 1;
    uint _525 = uint(int(uint(_523) >> uint(2)));
    int _527 = _523 & 3;
    float _529 = (*spvDescriptorSet0.cp_c3)._m0[int(_525)][_527];
    float _531 = fma(_163, _373, _509);
    float _533 = _511 + (*spvDescriptorSet0.cp_c3)._m0[118].w;
    float _535 = _231 * _411;
    float _537 = trunc(_533);
    int _539 = int(_537);
    int _541 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].y);
    int _543 = _503 + _541;
    int _545 = _543 + 1;
    float _547 = fma(_163, _403, _535);
    int _549 = _281 + 9952;
    uint _551 = uint(int(uint(_549) >> uint(2)));
    uint _553 = uint(int(uint(int(_551)) >> uint(2)));
    int _555 = int(_551) & 3;
    float _557 = (*spvDescriptorSet0.cp_c3)._m0[int(_553)][_555];
    int _559 = int(_551) + 1;
    uint _561 = uint(int(uint(_559) >> uint(2)));
    int _563 = _559 & 3;
    float _565 = (*spvDescriptorSet0.cp_c3)._m0[int(_561)][_563];
    bool _567 = _545 >= 0;
    float _569 = _449 * _439;
    bool _571 = _545 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _573 = !_567;
    bool _575 = _571 || _573;
    float _577 = fma(_163, _431, _569);
    int _579 = _241 + 9960;
    uint _581 = uint(int(uint(_579) >> uint(2)));
    uint _583 = uint(int(uint(int(_581)) >> uint(2)));
    int _585 = int(_581) & 3;
    float _587 = (*spvDescriptorSet0.cp_c3)._m0[int(_583)][_585];
    int _589 = int(_581) + 1;
    uint _591 = uint(int(uint(_589) >> uint(2)));
    int _593 = _589 & 3;
    float _595 = (*spvDescriptorSet0.cp_c3)._m0[int(_591)][_593];
    int _597 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].z);
    int _599 = _539 + _597;
    int _601 = _599 + 1;
    float _603 = fma(_193, _461, _531);
    bool _605 = _601 < 0;
    bool _607 = _605 || _575;
    int _609 = _281 + 9912;
    uint _611 = uint(int(uint(_609) >> uint(2)));
    uint _613 = uint(int(uint(int(_611)) >> uint(2)));
    int _615 = int(_611) & 3;
    float _617 = (*spvDescriptorSet0.cp_c3)._m0[int(_613)][_615];
    int _619 = int(_611) + 1;
    uint _621 = uint(int(uint(_619) >> uint(2)));
    int _623 = _619 & 3;
    float _625 = (*spvDescriptorSet0.cp_c3)._m0[int(_621)][_623];
    float _627 = fma(_175, _483, _447);
    bool _629 = _601 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _631 = _629 || _607;
    float _633 = _627 + _491;
    float _635 = _163 + 2.0;
    float _637 = fma(_185, 9.9999997473787516355514526367188e-05, 1.10000002384185791015625);
    float _639 = _635 * (*spvDescriptorSet0.cp_c3)._m0[14].x;
    float _641 = fma(_637, (*spvDescriptorSet0.cp_c3)._m0[14].y, _639);
    int _643 = _545;
    float _645 = _603;
    if (!_631)
    {
        int _647 = _601 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
        int _649 = _647 + _545;
        _643 = _649;
    }
    int _651 = _643;
    float _653 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[14].z, _641);
    float _655 = fma(_175, _521, _547);
    float _657 = _653 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _659 = -_657;
    bool _661 = _659 > (*spvDescriptorSet0.cp_c3)._m0[631].y;
    float _663 = -_657;
    bool _665 = _663 > (*spvDescriptorSet0.cp_c3)._m0[631].x;
    float _667 = _449 * _565;
    bool _669 = !_661;
    int _671 = _669 ? 0 : 1;
    float _673 = fma(_163, _557, _667);
    int _675 = _281 + 9928;
    uint _677 = uint(int(uint(_675) >> uint(2)));
    uint _679 = uint(int(uint(int(_677)) >> uint(2)));
    int _681 = int(_677) & 3;
    float _683 = (*spvDescriptorSet0.cp_c3)._m0[int(_679)][_681];
    int _685 = int(_677) + 1;
    uint _687 = uint(int(uint(_685) >> uint(2)));
    int _689 = _685 & 3;
    float _691 = (*spvDescriptorSet0.cp_c3)._m0[int(_687)][_689];
    float _693 = fma(_175, _587, _495);
    float _695 = _655 + _529;
    float _697 = _693 + _595;
    int _699 = _281 + 9960;
    uint _701 = uint(int(uint(_699) >> uint(2)));
    uint _703 = uint(int(uint(int(_701)) >> uint(2)));
    int _705 = int(_701) & 3;
    float _707 = (*spvDescriptorSet0.cp_c3)._m0[int(_703)][_705];
    int _709 = int(_701) + 1;
    uint _711 = uint(int(uint(_709) >> uint(2)));
    int _713 = _709 & 3;
    float _715 = (*spvDescriptorSet0.cp_c3)._m0[int(_711)][_713];
    float _717 = fma(_193, _617, _505);
    int _719 = 2;
    if (!_661)
    {
        _719 = 1;
    }
    int _721 = _719;
    float _723 = _717 + _625;
    int _725 = _721;
    if (!_665)
    {
        _725 = _671;
    }
    int _727 = _725;
    float _729 = fma(_185, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    int _731 = _727 << 6;
    int _733 = _731 + 9904;
    uint _735 = uint(int(uint(_733) >> uint(2)));
    uint _737 = uint(int(uint(int(_735)) >> uint(2)));
    int _739 = int(_735) & 3;
    float _741 = (*spvDescriptorSet0.cp_c3)._m0[int(_737)][_739];
    int _743 = int(_735) + 1;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    int _747 = _743 & 3;
    float _749 = (*spvDescriptorSet0.cp_c3)._m0[int(_745)][_747];
    float _751 = fma(_193, _683, _577);
    float _753 = _751 + _691;
    float _755 = fma(_193, _707, _673);
    float _757 = _755 + _715;
    int _759 = _241 + 9944;
    uint _761 = uint(int(uint(_759) >> uint(2)));
    uint _763 = uint(int(uint(int(_761)) >> uint(2)));
    int _765 = int(_761) & 3;
    float _767 = (*spvDescriptorSet0.cp_c3)._m0[int(_763)][_765];
    float _769 = 1.0 / _757;
    float _771 = _729 * _749;
    float _773 = fma(_635, _741, _771);
    int _775 = _731 + 9912;
    uint _777 = uint(int(uint(_775) >> uint(2)));
    uint _779 = uint(int(uint(int(_777)) >> uint(2)));
    int _781 = int(_777) & 3;
    float _783 = (*spvDescriptorSet0.cp_c3)._m0[int(_779)][_781];
    int _785 = int(_777) + 1;
    uint _787 = uint(int(uint(_785) >> uint(2)));
    int _789 = _785 & 3;
    float _791 = (*spvDescriptorSet0.cp_c3)._m0[int(_787)][_789];
    float _793 = _723 * _769;
    bool _795 = _793 >= 0.0;
    bool _797 = _793 <= 1.0;
    bool _799 = _797 && _795;
    float _801 = fma(_175, _767, _465);
    float _803 = fma(_175, _783, _773);
    int _805 = _731 + 9920;
    uint _807 = uint(int(uint(_805) >> uint(2)));
    uint _809 = uint(int(uint(int(_807)) >> uint(2)));
    int _811 = int(_807) & 3;
    float _813 = (*spvDescriptorSet0.cp_c3)._m0[int(_809)][_811];
    int _815 = int(_807) + 1;
    uint _817 = uint(int(uint(_815) >> uint(2)));
    int _819 = _815 & 3;
    float _821 = (*spvDescriptorSet0.cp_c3)._m0[int(_817)][_819];
    float _823 = _729 * _821;
    float _825 = _803 + _791;
    int _827 = _731 + 9928;
    uint _829 = uint(int(uint(_827) >> uint(2)));
    uint _831 = uint(int(uint(int(_829)) >> uint(2)));
    int _833 = int(_829) & 3;
    float _835 = (*spvDescriptorSet0.cp_c3)._m0[int(_831)][_833];
    int _837 = int(_829) + 1;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    int _841 = _837 & 3;
    float _843 = (*spvDescriptorSet0.cp_c3)._m0[int(_839)][_841];
    float _845 = fma(_635, _813, _823);
    float _847 = 1.0 / _697;
    int _849 = _241 + 9936;
    int _851 = _281 + 9936;
    float _853 = _633 * _847;
    bool _855 = _853 >= 0.0;
    bool _857 = _853 <= 1.0;
    bool _859 = _857 && _855;
    float _861 = fma(_175, _835, _845);
    float _863 = _695 * _847;
    float _865 = _861 + _843;
    int _867 = _731 + 9936;
    uint _869 = uint(int(uint(_867) >> uint(2)));
    uint _871 = uint(int(uint(int(_869)) >> uint(2)));
    int _873 = int(_869) & 3;
    float _875 = (*spvDescriptorSet0.cp_c3)._m0[int(_871)][_873];
    int _877 = int(_869) + 1;
    uint _879 = uint(int(uint(_877) >> uint(2)));
    int _881 = _877 & 3;
    float _883 = (*spvDescriptorSet0.cp_c3)._m0[int(_879)][_881];
    bool _885 = _863 >= 0.0;
    bool _887 = _885 && _859;
    bool _889 = _863 <= 1.0;
    bool _891 = _889 && _887;
    float _893 = as_type<float>(_281);
    int _895 = _731;
    int _897 = as_type<int>(_825);
    float _899 = _853;
    if (_891)
    {
        int _901 = _849 + 12;
        uint _903 = uint(int(uint(_901) >> uint(2)));
        uint _905 = uint(int(uint(int(_903)) >> uint(2)));
        int _907 = int(_903) & 3;
        float _909 = (*spvDescriptorSet0.cp_c3)._m0[int(_905)][_907];
        _893 = _909;
    }
    float _911 = _893;
    float _913 = _729 * _883;
    float _915 = fma(_635, _875, _913);
    int _917 = _731 + 9944;
    uint _919 = uint(int(uint(_917) >> uint(2)));
    uint _921 = uint(int(uint(int(_919)) >> uint(2)));
    int _923 = int(_919) & 3;
    float _925 = (*spvDescriptorSet0.cp_c3)._m0[int(_921)][_923];
    int _927 = int(_919) + 1;
    uint _929 = uint(int(uint(_927) >> uint(2)));
    int _931 = _927 & 3;
    float _933 = (*spvDescriptorSet0.cp_c3)._m0[int(_929)][_931];
    float _935 = fma(_175, _925, _915);
    int _937 = _731 + 9952;
    uint _939 = uint(int(uint(_937) >> uint(2)));
    uint _941 = uint(int(uint(int(_939)) >> uint(2)));
    int _943 = int(_939) & 3;
    float _945 = (*spvDescriptorSet0.cp_c3)._m0[int(_941)][_943];
    int _947 = int(_939) + 1;
    uint _949 = uint(int(uint(_947) >> uint(2)));
    int _951 = _947 & 3;
    float _953 = (*spvDescriptorSet0.cp_c3)._m0[int(_949)][_951];
    float _955 = _729 * _953;
    float _957 = fma(_635, _945, _955);
    float _959 = _753 * _769;
    int _961 = _731 + 9960;
    uint _963 = uint(int(uint(_961) >> uint(2)));
    uint _965 = uint(int(uint(int(_963)) >> uint(2)));
    int _967 = int(_963) & 3;
    float _969 = (*spvDescriptorSet0.cp_c3)._m0[int(_965)][_967];
    int _971 = int(_963) + 1;
    uint _973 = uint(int(uint(_971) >> uint(2)));
    int _975 = _971 & 3;
    float _977 = (*spvDescriptorSet0.cp_c3)._m0[int(_973)][_975];
    float _979 = _753;
    float _981 = _933;
    float _983 = _935;
    int _985 = 2;
    if (!_631)
    {
        float _987 = floor(_533);
        _979 = _987;
    }
    float _989 = _979;
    bool _991 = _959 >= 0.0;
    bool _993 = _991 && _799;
    bool _995 = _959 <= 1.0;
    bool _997 = _995 && _993;
    if (!_631)
    {
        int _999 = _651 << 2;
        _895 = _999;
    }
    int _1001 = _895;
    int _1003 = _1001;
    if (!_631)
    {
        int _1005 = 12 & _1001;
        _1003 = _1005;
    }
    int _1007 = _1003;
    float _1009 = _989;
    if (!_631)
    {
        float _1011 = -_989;
        float _1013 = _533 + _1011;
        _1009 = _1013;
    }
    float _1015 = _1009;
    float _1017 = as_type<float>(_851);
    if (_997)
    {
        int _1019 = _851 + 12;
        uint _1021 = uint(int(uint(_1019) >> uint(2)));
        uint _1023 = uint(int(uint(int(_1021)) >> uint(2)));
        int _1025 = int(_1021) & 3;
        float _1027 = (*spvDescriptorSet0.cp_c3)._m0[int(_1023)][_1025];
        _1017 = _1027;
    }
    float _1029 = _1017;
    float _1031 = fma(_175, _969, _957);
    float _1033 = _1031 + _977;
    float _1035 = _935 + _933;
    if (_891)
    {
        float _1037 = _801 + _911;
        _981 = _1037;
    }
    float _1039 = _981;
    float _1041 = _1039;
    if (_891)
    {
        float _1043 = float(_235);
        _983 = _1043;
    }
    float _1045 = _983;
    float _1047 = 1.0 / _1033;
    float _1049 = _911;
    if (!_631)
    {
        float _1051 = floor(_497);
        _1049 = _1051;
    }
    float _1053 = _1049;
    float _1055 = _635 * (*spvDescriptorSet0.cp_c3)._m0[117].x;
    float _1057 = _1055;
    if (_997)
    {
        float _1059 = _603 + _1029;
        _645 = _1059;
    }
    float _1061 = _645;
    float _1063 = _635 * (*spvDescriptorSet0.cp_c3)._m0[118].x;
    float _1065 = _825 * _1047;
    int _1067 = as_type<int>(_1061);
    int _1069 = as_type<int>(_1047);
    int _1071 = as_type<int>(_1063);
    if (_891)
    {
        float _1073 = _1039 * _847;
        _897 = as_type<int>(_1073);
    }
    int _1075 = _897;
    int _1077 = _1075;
    if (_997)
    {
        float _1079 = _1061 * _769;
        _1041 = _1079;
    }
    float _1081 = _1041;
    if (!_631)
    {
        uint _1083 = uint(int(uint(_651) >> uint(2)));
        _1067 = int(_1083);
    }
    int _1085 = _1067;
    float _1087 = _865 * _1047;
    float _1089 = _1035 * _1047;
    int _1091 = _1085;
    if (_891)
    {
        float _1093 = rint(_1045);
        float _1095 = precise::max(_1093, 0.0);
        uint _1097 = uint(_1095);
        uint _1099 = clamp(_1097, 0u, 65535u);
        _249 = as_type<float>(_1099);
    }
    float _1101 = _249;
    if (!_631)
    {
        int _1103 = _1085 << 4;
        int _1105 = _1103 + _1007;
        _1091 = _1105;
    }
    int _1107 = _1091;
    float _1109 = fma(_729, (*spvDescriptorSet0.cp_c3)._m0[117].y, _1055);
    float _1111 = _1053;
    if (!_631)
    {
        float _1113 = -_1053;
        float _1115 = _497 + _1113;
        _1111 = _1115;
    }
    float _1117 = _1111;
    float _1119 = fma(_729, (*spvDescriptorSet0.cp_c3)._m0[118].y, _1063);
    float _1121 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[117].z, _1109);
    float _1123 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[118].z, _1119);
    float _1125 = _1121 + (*spvDescriptorSet0.cp_c3)._m0[117].w;
    float _1127 = _1123 + (*spvDescriptorSet0.cp_c3)._m0[118].w;
    float _1129 = trunc(_1125);
    int _1131 = int(_1129);
    float _1133 = trunc(_1127);
    int _1135 = int(_1133);
    int _1137 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].y);
    int _1139 = _1131 + _1137;
    int _1141 = _1139 + 1;
    bool _1143 = _1141 >= 0;
    int _1145 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].z);
    int _1147 = _1135 + _1145;
    int _1149 = _1147 + 1;
    bool _1151 = _1141 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _1153 = !_1143;
    bool _1155 = _1151 || _1153;
    bool _1157 = _1149 < 0;
    bool _1159 = _1157 || _1155;
    bool _1161 = _1149 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _1163 = _1161 || _1159;
    int _1165 = _1149;
    int _1167 = _1141;
    if (!_1163)
    {
        int _1169 = _1149 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
        int _1171 = _1169 + _1141;
        _1165 = _1171;
    }
    int _1173 = _1165;
    float _1175 = _865;
    if (!_1163)
    {
        float _1177 = floor(_1127);
        _1175 = _1177;
    }
    float _1179 = _1175;
    if (!_1163)
    {
        int _1181 = _1173 << 2;
        _1167 = _1181;
    }
    int _1183 = _1167;
    int _1185 = _1183;
    if (!_1163)
    {
        uint _1187 = uint(int(uint(_1173) >> uint(2)));
        _1069 = int(_1187);
    }
    int _1189 = _1069;
    int _1191 = _1189;
    if (!_1163)
    {
        int _1193 = 12 & _1183;
        _1185 = _1193;
    }
    int _1195 = _1185;
    if (!_1163)
    {
        int _1197 = _1189 << 4;
        int _1199 = _1197 + _1195;
        _1191 = _1199;
    }
    int _1201 = _1191;
    float _1203 = float(as_type<uint>(_127));
    float _1205 = _1179;
    if (!_1163)
    {
        float _1207 = -_1179;
        float _1209 = _1127 + _1207;
        _1205 = _1209;
    }
    float _1211 = _1205;
    float _1213 = fma(_1203, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    float _1215 = fma(_1203, 9.9999997473787516355514526367188e-05, 1.10000002384185791015625);
    float _1217 = _1203;
    if (!_1163)
    {
        float _1219 = floor(_1125);
        _1217 = _1219;
    }
    float _1221 = _1217;
    float _1223 = fma(_1213, (*spvDescriptorSet0.cp_c3)._m0[118].y, _1063);
    float _1225 = fma(_1215, (*spvDescriptorSet0.cp_c3)._m0[14].y, _639);
    float _1227 = fma(_193, (*spvDescriptorSet0.cp_c3)._m0[118].z, _1223);
    float _1229 = fma(_193, (*spvDescriptorSet0.cp_c3)._m0[14].z, _1225);
    float _1231 = _1229 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _1233 = -_1231;
    bool _1235 = _1233 > (*spvDescriptorSet0.cp_c3)._m0[631].x;
    float _1237 = -_1231;
    bool _1239 = _1237 > (*spvDescriptorSet0.cp_c3)._m0[631].y;
    float _1241 = fma(_1213, (*spvDescriptorSet0.cp_c3)._m0[117].y, _1055);
    if (!_1163)
    {
        float _1243 = -_1221;
        float _1245 = _1125 + _1243;
        _1057 = _1245;
    }
    float _1247 = _1057;
    float _1249 = _1227 + (*spvDescriptorSet0.cp_c3)._m0[118].w;
    bool _1251 = !_1239;
    int _1253 = _1251 ? 0 : 1;
    float _1255 = fma(_193, (*spvDescriptorSet0.cp_c3)._m0[117].z, _1241);
    float _1257 = trunc(_1249);
    int _1259 = int(_1257);
    float _1261 = _1255 + (*spvDescriptorSet0.cp_c3)._m0[117].w;
    float _1263 = _1261;
    if (!_1239)
    {
        _985 = 1;
    }
    int _1265 = _985;
    float _1267 = trunc(_1261);
    int _1269 = int(_1267);
    int _1271 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].z);
    int _1273 = _1259 + _1271;
    int _1275 = _1273 + 1;
    float _1277 = as_type<float>(_1259);
    int _1279 = _1275;
    int _1281 = _1265;
    if (!_1163)
    {
        int _1283 = _1201 + 256;
        uint _1285 = uint(int(uint(_1283) >> uint(2)));
        uint _1287 = uint(int(uint(int(_1285)) >> uint(2)));
        int _1289 = int(_1285) & 3;
        float _1291 = (*spvDescriptorSet0.cp_c3)._m0[int(_1287)][_1289];
        _1277 = _1291;
    }
    float _1293 = _1277;
    int _1295 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].y);
    int _1297 = _1269 + _1295;
    int _1299 = _1297 + 1;
    bool _1301 = _1299 >= 0;
    bool _1303 = _1299 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _1305 = !_1301;
    bool _1307 = _1303 || _1305;
    bool _1309 = _1275 < 0;
    bool _1311 = _1309 || _1307;
    bool _1313 = _1275 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _1315 = _1313 || _1311;
    int _1317 = _1299;
    if (!_1315)
    {
        int _1319 = _1275 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
        int _1321 = _1319 + _1299;
        _1279 = _1321;
    }
    int _1323 = _1279;
    if (!_1315)
    {
        int _1325 = _1323 << 2;
        _1071 = _1325;
    }
    int _1327 = _1071;
    int _1329 = _1327;
    if (!_1315)
    {
        uint _1331 = uint(int(uint(_1323) >> uint(2)));
        _1317 = int(_1331);
    }
    int _1333 = _1317;
    if (!_1315)
    {
        int _1335 = 12 & _1327;
        _1329 = _1335;
    }
    int _1337 = _1329;
    float _1339 = 0.0;
    if (!_1315)
    {
        int _1341 = _1333 << 4;
        int _1343 = _1341 + _1337;
        _1339 = as_type<float>(_1343);
    }
    float _1345 = _1339;
    float _1347 = _1293;
    if (!_1163)
    {
        float _1349 = rint(_1293);
        float _1351 = precise::max(_1349, 0.0);
        uint _1353 = uint(_1351);
        uint _1355 = clamp(_1353, 0u, 65535u);
        _1347 = as_type<float>(_1355);
    }
    float _1357 = _1347;
    float _1359 = _1345;
    if (!_1315)
    {
        int _1361 = as_type<int>(_1345) + 256;
        uint _1363 = uint(int(uint(_1361) >> uint(2)));
        uint _1365 = uint(int(uint(int(_1363)) >> uint(2)));
        int _1367 = int(_1363) & 3;
        float _1369 = (*spvDescriptorSet0.cp_c3)._m0[int(_1365)][_1367];
        _1359 = _1369;
    }
    float _1371 = _1359;
    float _1373 = as_type<float>(_1333);
    if (!_1315)
    {
        float _1375 = floor(_1249);
        _1373 = _1375;
    }
    float _1377 = _1373;
    float _1379 = as_type<float>(_1337);
    if (!_1315)
    {
        float _1381 = floor(_1261);
        _1379 = _1381;
    }
    float _1383 = _1379;
    float _1385 = 0.0;
    if (!_1315)
    {
        float _1387 = -_1377;
        float _1389 = _1249 + _1387;
        _1385 = _1389;
    }
    float _1391 = _1385;
    float _1393 = _1377;
    if (!_631)
    {
        int _1395 = _1107 + 256;
        uint _1397 = uint(int(uint(_1395) >> uint(2)));
        uint _1399 = uint(int(uint(int(_1397)) >> uint(2)));
        int _1401 = int(_1397) & 3;
        float _1403 = (*spvDescriptorSet0.cp_c3)._m0[int(_1399)][_1401];
        _1393 = _1403;
    }
    float _1405 = _1393;
    float _1407 = _1383;
    if (!_1315)
    {
        float _1409 = -_1383;
        float _1411 = _1261 + _1409;
        _1407 = _1411;
    }
    float _1413 = _1407;
    int _1415 = as_type<int>(_1101);
    float _1417 = _1413;
    if (_891)
    {
        float3 _4770 = float3(_853, _863, float(as_type<int>(_1101)));
        float3 _4774 = select(_4770, float3(0.0), isnan(_4770));
        float _1419 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _4774.xy, uint(rint(_4774.z)), as_type<float>(_1075), level(0.0));
        _1415 = as_type<int>(_1419);
    }
    int _1421 = _1415;
    if (!_1315)
    {
        float _1423 = rint(_1371);
        float _1425 = precise::max(_1423, 0.0);
        uint _1427 = uint(_1425);
        uint _1429 = clamp(_1427, 0u, 65535u);
        _1263 = as_type<float>(_1429);
    }
    float _1431 = _1263;
    float _1433 = _1405;
    if (!_631)
    {
        float _1435 = rint(_1405);
        float _1437 = precise::max(_1435, 0.0);
        uint _1439 = uint(_1437);
        uint _1441 = clamp(_1439, 0u, 65535u);
        _1433 = as_type<float>(_1441);
    }
    float _1443 = _1433;
    float _1445 = _1015;
    if (!_631)
    {
        float3 _4823 = float3(_1117, _1015, float(as_type<int>(_1443)));
        float3 _4825 = select(_4823, float3(0.0), isnan(_4823));
        float _1447 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _4825.xy, uint(rint(_4825.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _4825.xy, uint(rint(_4825.z)), level(0.0)).x;
        _1445 = _1447;
    }
    float _1449 = _1445;
    float _1451 = _1211;
    if (!_1163)
    {
        float3 _4841 = float3(_1247, _1211, float(as_type<int>(_1357)));
        float3 _4843 = select(_4841, float3(0.0), isnan(_4841));
        float _1453 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _4843.xy, uint(rint(_4843.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _4843.xy, uint(rint(_4843.z)), level(0.0)).x;
        _1451 = _1453;
    }
    float _1455 = _1451;
    float _1457 = _1431;
    if (!_1315)
    {
        float3 _4859 = float3(_1413, _1391, float(as_type<int>(_1431)));
        float3 _4861 = select(_4859, float3(0.0), isnan(_4859));
        float _1459 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _4861.xy, uint(rint(_4861.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _4861.xy, uint(rint(_4861.z)), level(0.0)).x;
        _1457 = _1459;
    }
    float _1461 = _1457;
    if (!_1235)
    {
        _1281 = _1253;
    }
    int _1463 = _1281;
    int _1465 = _1463 << 6;
    int _1467 = _1465 + 9904;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    uint _1471 = uint(int(uint(int(_1469)) >> uint(2)));
    int _1473 = int(_1469) & 3;
    float _1475 = (*spvDescriptorSet0.cp_c3)._m0[int(_1471)][_1473];
    int _1477 = int(_1469) + 1;
    uint _1479 = uint(int(uint(_1477) >> uint(2)));
    int _1481 = _1477 & 3;
    float _1483 = (*spvDescriptorSet0.cp_c3)._m0[int(_1479)][_1481];
    int _1485 = _1465 + 9920;
    uint _1487 = uint(int(uint(_1485) >> uint(2)));
    uint _1489 = uint(int(uint(int(_1487)) >> uint(2)));
    int _1491 = int(_1487) & 3;
    float _1493 = (*spvDescriptorSet0.cp_c3)._m0[int(_1489)][_1491];
    int _1495 = int(_1487) + 1;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    int _1499 = _1495 & 3;
    float _1501 = (*spvDescriptorSet0.cp_c3)._m0[int(_1497)][_1499];
    if (!_891)
    {
        _899 = 1.0;
    }
    float _1503 = _899;
    float _1505 = _1213 * _1483;
    float _1507 = fma(_635, _1475, _1505);
    int _1509 = _1465 + 9912;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    uint _1513 = uint(int(uint(int(_1511)) >> uint(2)));
    int _1515 = int(_1511) & 3;
    float _1517 = (*spvDescriptorSet0.cp_c3)._m0[int(_1513)][_1515];
    int _1519 = int(_1511) + 1;
    uint _1521 = uint(int(uint(_1519) >> uint(2)));
    int _1523 = _1519 & 3;
    float _1525 = (*spvDescriptorSet0.cp_c3)._m0[int(_1521)][_1523];
    float _1527 = _1213 * _1501;
    float _1529 = fma(_635, _1493, _1527);
    int _1531 = _1465 + 9928;
    uint _1533 = uint(int(uint(_1531) >> uint(2)));
    uint _1535 = uint(int(uint(int(_1533)) >> uint(2)));
    int _1537 = int(_1533) & 3;
    float _1539 = (*spvDescriptorSet0.cp_c3)._m0[int(_1535)][_1537];
    int _1541 = int(_1533) + 1;
    uint _1543 = uint(int(uint(_1541) >> uint(2)));
    int _1545 = _1541 & 3;
    float _1547 = (*spvDescriptorSet0.cp_c3)._m0[int(_1543)][_1545];
    float _1549 = fma(_193, _1517, _1507);
    float _1551 = _1549 + _1525;
    float _1553 = fma(_193, _1539, _1529);
    float _1555 = _1553 + _1547;
    int _1557 = _1465 + 9936;
    uint _1559 = uint(int(uint(_1557) >> uint(2)));
    uint _1561 = uint(int(uint(int(_1559)) >> uint(2)));
    int _1563 = int(_1559) & 3;
    float _1565 = (*spvDescriptorSet0.cp_c3)._m0[int(_1561)][_1563];
    int _1567 = int(_1559) + 1;
    uint _1569 = uint(int(uint(_1567) >> uint(2)));
    int _1571 = _1567 & 3;
    float _1573 = (*spvDescriptorSet0.cp_c3)._m0[int(_1569)][_1571];
    float _1575 = _1213 * _1573;
    float _1577 = fma(_635, _1565, _1575);
    int _1579 = _1465 + 9944;
    uint _1581 = uint(int(uint(_1579) >> uint(2)));
    uint _1583 = uint(int(uint(int(_1581)) >> uint(2)));
    int _1585 = int(_1581) & 3;
    float _1587 = (*spvDescriptorSet0.cp_c3)._m0[int(_1583)][_1585];
    int _1589 = int(_1581) + 1;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    int _1593 = _1589 & 3;
    float _1595 = (*spvDescriptorSet0.cp_c3)._m0[int(_1591)][_1593];
    float _1597 = fma(_193, _1587, _1577);
    float _1599 = _1597 + _1595;
    int _1601 = _1465 + 9952;
    uint _1603 = uint(int(uint(_1601) >> uint(2)));
    uint _1605 = uint(int(uint(int(_1603)) >> uint(2)));
    int _1607 = int(_1603) & 3;
    float _1609 = (*spvDescriptorSet0.cp_c3)._m0[int(_1605)][_1607];
    int _1611 = int(_1603) + 1;
    uint _1613 = uint(int(uint(_1611) >> uint(2)));
    int _1615 = _1611 & 3;
    float _1617 = (*spvDescriptorSet0.cp_c3)._m0[int(_1613)][_1615];
    float _1619 = _1503;
    int _1621 = _1421;
    float _1623 = _1551;
    float _1625 = _1555;
    if (_891)
    {
        bool _1627 = as_type<float>(_1421) >= as_type<float>(_1075);
        bool _1629 = isnan(as_type<float>(_1421));
        bool _1631 = _1627 || _1629;
        bool _1633 = isnan(as_type<float>(_1075));
        bool _1635 = _1631 || _1633;
        float _1637 = float(_1635);
        _1619 = _1637;
    }
    float _1639 = _1619;
    if (!_445)
    {
        uint _1641 = uint(int(uint(int(_471)) >> uint(2)));
        _1077 = int(_1641);
    }
    int _1643 = _1077;
    bool _1645 = _1065 >= 0.0;
    bool _1647 = _1065 <= 1.0;
    bool _1649 = _1647 && _1645;
    bool _1651 = _1087 >= 0.0;
    bool _1653 = _1651 && _1649;
    bool _1655 = _1087 <= 1.0;
    bool _1657 = _1655 && _1653;
    float _1659 = _1213 * _1617;
    float _1661 = fma(_635, _1609, _1659);
    int _1663 = _1465 + 9960;
    uint _1665 = uint(int(uint(_1663) >> uint(2)));
    uint _1667 = uint(int(uint(int(_1665)) >> uint(2)));
    int _1669 = int(_1665) & 3;
    float _1671 = (*spvDescriptorSet0.cp_c3)._m0[int(_1667)][_1669];
    int _1673 = int(_1665) + 1;
    uint _1675 = uint(int(uint(_1673) >> uint(2)));
    int _1677 = _1673 & 3;
    float _1679 = (*spvDescriptorSet0.cp_c3)._m0[int(_1675)][_1677];
    float _1681 = fma(_193, _1671, _1661);
    float _1683 = _1681 + _1679;
    int _1685 = as_type<int>(_1681);
    float _1687 = _1661;
    if (!_445)
    {
        int _1689 = int(_471) << 2;
        _1685 = _1689;
    }
    int _1691 = _1685;
    int _1693 = _1691;
    if (!_445)
    {
        int _1695 = 12 & _1691;
        _1693 = _1695;
    }
    int _1697 = _1693;
    float _1699 = 1.0 / _1683;
    if (!_445)
    {
        int _1701 = _1643 << 4;
        int _1703 = _1701 + _1697;
        _1621 = _1703;
    }
    int _1705 = _1621;
    float _1707 = as_type<float>(_1107);
    if (!_445)
    {
        int _1709 = _1705 + 256;
        uint _1711 = uint(int(uint(_1709) >> uint(2)));
        uint _1713 = uint(int(uint(int(_1711)) >> uint(2)));
        int _1715 = int(_1711) & 3;
        float _1717 = (*spvDescriptorSet0.cp_c3)._m0[int(_1713)][_1715];
        _1707 = _1717;
    }
    float _1719 = _1707;
    float _1721 = _1551 * _1699;
    float _1723 = _1555 * _1699;
    float _1725 = _1599 * _1699;
    if (_997)
    {
        float _1727 = float(_275);
        _1417 = _1727;
    }
    float _1729 = _1417;
    float _1731 = _1699;
    if (!_445)
    {
        float _1733 = floor(_279);
        _1731 = _1733;
    }
    float _1735 = _1731;
    bool _1737 = _1721 >= 0.0;
    if (_1657)
    {
        float _1739 = float(_727);
        _1623 = _1739;
    }
    float _1741 = _1623;
    bool _1743 = _1721 <= 1.0;
    bool _1745 = _1743 && _1737;
    float _1747 = _1599;
    if (!_445)
    {
        float _1749 = floor(_307);
        _1747 = _1749;
    }
    float _1751 = _1747;
    bool _1753 = _1723 >= 0.0;
    bool _1755 = _1753 && _1745;
    bool _1757 = _1723 <= 1.0;
    bool _1759 = _1757 && _1755;
    float _1761 = as_type<float>(_275);
    if (_997)
    {
        float _1763 = rint(_1729);
        float _1765 = precise::max(_1763, 0.0);
        uint _1767 = uint(_1765);
        uint _1769 = clamp(_1767, 0u, 65535u);
        _1761 = as_type<float>(_1769);
    }
    float _1771 = _1761;
    float _1773 = _1735;
    if (!_445)
    {
        float _1775 = -_1735;
        float _1777 = _279 + _1775;
        _1687 = _1777;
    }
    float _1779 = _1687;
    float _1781 = as_type<float>(_727);
    if (_1657)
    {
        float _1783 = rint(_1741);
        float _1785 = precise::max(_1783, 0.0);
        uint _1787 = uint(_1785);
        uint _1789 = clamp(_1787, 0u, 65535u);
        _1781 = as_type<float>(_1789);
    }
    float _1791 = _1781;
    if (!_445)
    {
        float _1793 = -_1751;
        float _1795 = _307 + _1793;
        _1773 = _1795;
    }
    float _1797 = _1773;
    if (_1759)
    {
        float _1799 = float(_1463);
        _1625 = _1799;
    }
    float _1801 = _1625;
    float _1803 = _1801;
    if (_1759)
    {
        float _1805 = rint(_1801);
        float _1807 = precise::max(_1805, 0.0);
        uint _1809 = uint(_1807);
        uint _1811 = clamp(_1809, 0u, 65535u);
        _1803 = as_type<float>(_1811);
    }
    float _1813 = _1803;
    float _1815 = _1751;
    if (!_445)
    {
        float _1817 = rint(_1719);
        float _1819 = precise::max(_1817, 0.0);
        uint _1821 = uint(_1819);
        uint _1823 = clamp(_1821, 0u, 65535u);
        _1815 = as_type<float>(_1823);
    }
    float _1825 = _1815;
    float _1827 = _1771;
    if (_997)
    {
        float3 _5451 = float3(_793, _959, float(as_type<int>(_1771)));
        float3 _5453 = select(_5451, float3(0.0), isnan(_5451));
        float _1829 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _5453.xy, uint(rint(_5453.z)), _1081, level(0.0));
        _1827 = _1829;
    }
    float _1831 = _1827;
    float _1833 = _1791;
    if (_1657)
    {
        float3 _5468 = float3(_1065, _1087, float(as_type<int>(_1791)));
        float3 _5470 = select(_5468, float3(0.0), isnan(_5468));
        float _1835 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _5470.xy, uint(rint(_5470.z)), _1089, level(0.0));
        _1833 = _1835;
    }
    float _1837 = _1833;
    float _1839 = _1723;
    if (_1759)
    {
        float3 _5485 = float3(_1721, _1723, float(as_type<int>(_1813)));
        float3 _5487 = select(_5485, float3(0.0), isnan(_5485));
        float _1841 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _5487.xy, uint(rint(_5487.z)), _1725, level(0.0));
        _1839 = _1841;
    }
    float _1843 = _1839;
    float _1845 = _1779;
    if (!_445)
    {
        float3 _5503 = float3(_1797, _1779, float(as_type<int>(_1825)));
        float3 _5505 = select(_5503, float3(0.0), isnan(_5503));
        float _1847 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _5505.xy, uint(rint(_5505.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _5505.xy, uint(rint(_5505.z)), level(0.0)).x;
        _1845 = _1847;
    }
    float _1849 = _1845;
    float _1851 = _163 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
    int _1853 = _331 + 2;
    float _1855 = _635 * (*spvDescriptorSet0.cp_c3)._m0[6].x;
    int _1857 = _331 << 2;
    float _1859 = fma(_231, (*spvDescriptorSet0.cp_c3)._m0[5].y, _1851);
    int _1861 = _1853 << 2;
    float _1863 = _163 * (*spvDescriptorSet0.cp_c3)._m0[6].x;
    uint _1865 = uint(int(uint(_331) >> uint(5)));
    float _1867 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[5].z, _1859);
    int _1869 = 124 & _1861;
    float _1871 = fma(_231, (*spvDescriptorSet0.cp_c3)._m0[6].y, _1863);
    int _1873 = 124 & _1857;
    float _1875 = _1867 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    uint _1877 = uint(int(uint(_1853) >> uint(5)));
    float _1879 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[6].z, _1871);
    int _1881 = _331 + 3;
    int _1883 = int(_1865) * 896;
    int _1885 = _1883 + _1873;
    float _1887 = _163 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    int _1889 = int(_1877) * 896;
    int _1891 = _1889 + _1869;
    int _1893 = _1881 << 2;
    float _1895 = fma(_449, (*spvDescriptorSet0.cp_c3)._m0[5].y, _1851);
    uint _1897 = uint(int(uint(_1881) >> uint(5)));
    int _1899 = _1885 + 272;
    uint _1901 = uint(int(uint(_1899) >> uint(2)));
    _29[int(_1901)] = as_type<uint>(_1875);
    int _1903 = 124 & _1893;
    float _1905 = fma(_231, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1887);
    float _1907 = fma(_449, (*spvDescriptorSet0.cp_c3)._m0[6].y, _1863);
    float _1909 = fma(_449, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1887);
    float _1911 = fma(_193, (*spvDescriptorSet0.cp_c3)._m0[5].z, _1895);
    float _1913 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1905);
    float _1915 = fma(_193, (*spvDescriptorSet0.cp_c3)._m0[6].z, _1907);
    float _1917 = fma(_193, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1909);
    float _1919 = _1911 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    float _1921 = _1879 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    int _1923 = int(_1897) * 896;
    int _1925 = _1923 + _1903;
    float _1927 = _163 * (*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _1929 = _1913 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    float _1931 = _635 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _1933 = _1915 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    float _1935 = fma(_231, (*spvDescriptorSet0.cp_c3)._m0[8].y, _1927);
    float _1937 = fma(_449, (*spvDescriptorSet0.cp_c3)._m0[8].y, _1927);
    int _1939 = _1885 + 400;
    uint _1941 = uint(int(uint(_1939) >> uint(2)));
    _29[int(_1941)] = as_type<uint>(_1921);
    float _1943 = _1917 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    float _1945 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[8].z, _1935);
    float _1947 = fma(_193, (*spvDescriptorSet0.cp_c3)._m0[8].z, _1937);
    float _1949 = _635 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    int _1951 = _1885 + 528;
    uint _1953 = uint(int(uint(_1951) >> uint(2)));
    _29[int(_1953)] = as_type<uint>(_1929);
    float _1955 = _1945 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _1957 = _1947 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _1959 = fma(_1213, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1949);
    float _1961 = fma(_729, (*spvDescriptorSet0.cp_c3)._m0[5].y, _1931);
    int _1963 = _1885 + 656;
    uint _1965 = uint(int(uint(_1963) >> uint(2)));
    _29[int(_1965)] = as_type<uint>(_1955);
    float _1967 = fma(_193, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1959);
    float _1969 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[5].z, _1961);
    int _1971 = _391 + 272;
    uint _1973 = uint(int(uint(_1971) >> uint(2)));
    _29[int(_1973)] = as_type<uint>(_1919);
    float _1975 = fma(_729, (*spvDescriptorSet0.cp_c3)._m0[6].y, _1855);
    int _1977 = _391 + 400;
    uint _1979 = uint(int(uint(_1977) >> uint(2)));
    _29[int(_1979)] = as_type<uint>(_1933);
    float _1981 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[6].z, _1975);
    float _1983 = fma(_729, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1949);
    int _1985 = _391 + 528;
    uint _1987 = uint(int(uint(_1985) >> uint(2)));
    _29[int(_1987)] = as_type<uint>(_1943);
    float _1989 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1983);
    float _1991 = _1969 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    int _1993 = _391 + 656;
    uint _1995 = uint(int(uint(_1993) >> uint(2)));
    _29[int(_1995)] = as_type<uint>(_1957);
    float _1997 = _1981 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    float _1999 = fma(_1213, (*spvDescriptorSet0.cp_c3)._m0[5].y, _1931);
    int _2001 = _1891 + 272;
    uint _2003 = uint(int(uint(_2001) >> uint(2)));
    _29[int(_2003)] = as_type<uint>(_1991);
    float _2005 = _1967 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    float _2007 = _1989 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    float _2009 = fma(_1213, (*spvDescriptorSet0.cp_c3)._m0[6].y, _1855);
    float _2011 = fma(_193, (*spvDescriptorSet0.cp_c3)._m0[5].z, _1999);
    int _2013 = _1891 + 400;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    _29[int(_2015)] = as_type<uint>(_1997);
    float _2017 = _635 * (*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _2019 = fma(_193, (*spvDescriptorSet0.cp_c3)._m0[6].z, _2009);
    int _2021 = _1891 + 528;
    uint _2023 = uint(int(uint(_2021) >> uint(2)));
    _29[int(_2023)] = as_type<uint>(_2007);
    float _2025 = fma(_729, (*spvDescriptorSet0.cp_c3)._m0[8].y, _2017);
    float _2027 = fma(_1213, (*spvDescriptorSet0.cp_c3)._m0[8].y, _2017);
    float _2029 = _2019 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    float _2031 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[8].z, _2025);
    float _2033 = fma(_193, (*spvDescriptorSet0.cp_c3)._m0[8].z, _2027);
    float _2035 = _2011 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    float _2037 = _2031 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _2039 = _2033 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _2041 = _2007;
    float _2043 = _2031;
    if (!_997)
    {
        _2041 = 1.0;
    }
    float _2045 = _2041;
    float _2047 = _2045;
    if (_445)
    {
        _2043 = 1.0;
    }
    float _2049 = _2043;
    int _2051 = _1891 + 656;
    uint _2053 = uint(int(uint(_2051) >> uint(2)));
    _29[int(_2053)] = as_type<uint>(_2037);
    int _2055 = _1925 + 272;
    uint _2057 = uint(int(uint(_2055) >> uint(2)));
    _29[int(_2057)] = as_type<uint>(_2035);
    int _2059 = _1925 + 400;
    uint _2061 = uint(int(uint(_2059) >> uint(2)));
    _29[int(_2061)] = as_type<uint>(_2029);
    int _2063 = _1925 + 528;
    uint _2065 = uint(int(uint(_2063) >> uint(2)));
    _29[int(_2065)] = as_type<uint>(_2005);
    int _2067 = _1925 + 656;
    uint _2069 = uint(int(uint(_2067) >> uint(2)));
    _29[int(_2069)] = as_type<uint>(_2039);
    float _2071 = _2049;
    if (!_445)
    {
        int _2073 = int(_471) << 4;
        int _2075 = _2073 + 1904;
        uint _2077 = uint(int(uint(_2075) >> uint(2)));
        uint _2079 = uint(int(uint(int(_2077)) >> uint(2)));
        int _2081 = int(_2077) & 3;
        float _2083 = (*spvDescriptorSet0.cp_c3)._m0[int(_2079)][_2081];
        int _2085 = int(_2077) + 1;
        uint _2087 = uint(int(uint(_2085) >> uint(2)));
        int _2089 = _2085 & 3;
        float _2091 = (*spvDescriptorSet0.cp_c3)._m0[int(_2087)][_2089];
        int _2093 = _2075 + 8;
        uint _2095 = uint(int(uint(_2093) >> uint(2)));
        uint _2097 = uint(int(uint(int(_2095)) >> uint(2)));
        int _2099 = int(_2095) & 3;
        float _2101 = (*spvDescriptorSet0.cp_c3)._m0[int(_2097)][_2099];
        int _2103 = int(_2095) + 1;
        uint _2105 = uint(int(uint(_2103) >> uint(2)));
        int _2107 = _2103 & 3;
        float _2109 = (*spvDescriptorSet0.cp_c3)._m0[int(_2105)][_2107];
        float _2111 = _231 * _2091;
        float _2113 = fma(_163, _2083, _2111);
        float _2115 = fma(_175, _2101, _2113);
        float _2117 = _2115 + _2109;
        float _2119 = precise::clamp(_2117, 0.0, 1.0);
        float _2121 = -_2119;
        float _2123 = _2121 + _1849;
        float _2125 = fma(_2123, 500.0, 1.5);
        float _2127 = exp2(_2125);
        float _2129 = 0.0 + _2127;
        float _2131 = precise::clamp(_2129, 0.0, 1.0);
        _2071 = _2131;
    }
    float _2133 = _2071;
    int _2135 = _83 + 1;
    float _2137 = _1639 * _2133;
    float _2139 = as_type<float>(_2135);
    if (_997)
    {
        bool _2141 = _1831 >= _1081;
        bool _2143 = isnan(_1831);
        bool _2145 = _2141 || _2143;
        bool _2147 = isnan(_1081);
        bool _2149 = _2145 || _2147;
        float _2151 = float(_2149);
        _2047 = _2151;
    }
    float _2153 = _2047;
    int _2155 = _77 + 1;
    if (_631)
    {
        _153 = 1.0;
    }
    float _2157 = _153;
    float _2159 = _2157;
    if (!_631)
    {
        int _2161 = _651 << 4;
        int _2163 = _2161 + 1904;
        uint _2165 = uint(int(uint(_2163) >> uint(2)));
        uint _2167 = uint(int(uint(int(_2165)) >> uint(2)));
        int _2169 = int(_2165) & 3;
        float _2171 = (*spvDescriptorSet0.cp_c3)._m0[int(_2167)][_2169];
        int _2173 = int(_2165) + 1;
        uint _2175 = uint(int(uint(_2173) >> uint(2)));
        int _2177 = _2173 & 3;
        float _2179 = (*spvDescriptorSet0.cp_c3)._m0[int(_2175)][_2177];
        int _2181 = _2163 + 8;
        uint _2183 = uint(int(uint(_2181) >> uint(2)));
        uint _2185 = uint(int(uint(int(_2183)) >> uint(2)));
        int _2187 = int(_2183) & 3;
        float _2189 = (*spvDescriptorSet0.cp_c3)._m0[int(_2185)][_2187];
        int _2191 = int(_2183) + 1;
        uint _2193 = uint(int(uint(_2191) >> uint(2)));
        int _2195 = _2191 & 3;
        float _2197 = (*spvDescriptorSet0.cp_c3)._m0[int(_2193)][_2195];
        float _2199 = _449 * _2179;
        float _2201 = fma(_163, _2171, _2199);
        float _2203 = fma(_193, _2189, _2201);
        float _2205 = _2203 + _2197;
        float _2207 = precise::clamp(_2205, 0.0, 1.0);
        float _2209 = -_2207;
        float _2211 = _2209 + _1449;
        float _2213 = fma(_2211, 500.0, 1.5);
        float _2215 = exp2(_2213);
        float _2217 = 0.0 + _2215;
        float _2219 = precise::clamp(_2217, 0.0, 1.0);
        _2159 = _2219;
    }
    float _2221 = _2159;
    float _2223 = float(uint(_2135));
    float _2225 = _159 * 0.03125;
    float _2227 = float(uint(_2155));
    float _2229 = _167 * 0.03125;
    float _2231 = _2153 * _2221;
    float _2233 = _2223 * 0.03125;
    int _2235 = _1885 + 784;
    uint _2237 = uint(int(uint(_2235) >> uint(2)));
    _29[int(_2237)] = as_type<uint>(_2225);
    float _2239 = _2227 * 0.03125;
    float _2241 = _2221;
    if (!_1657)
    {
        _2139 = 1.0;
    }
    float _2243 = _2139;
    int _2245 = _1885 + 912;
    uint _2247 = uint(int(uint(_2245) >> uint(2)));
    _29[int(_2247)] = as_type<uint>(_2229);
    float _2249 = _2243;
    if (_1657)
    {
        bool _2251 = _1837 >= _1089;
        bool _2253 = isnan(_1837);
        bool _2255 = _2251 || _2253;
        bool _2257 = isnan(_1089);
        bool _2259 = _2255 || _2257;
        float _2261 = float(_2259);
        _2249 = _2261;
    }
    float _2263 = _2249;
    if (_1163)
    {
        _221 = 1.0;
    }
    float _2265 = _221;
    int _2267 = _1885 + 1040;
    uint _2269 = uint(int(uint(_2267) >> uint(2)));
    _29[int(_2269)] = as_type<uint>(_2137);
    int _2271 = _391 + 784;
    uint _2273 = uint(int(uint(_2271) >> uint(2)));
    _29[int(_2273)] = as_type<uint>(_2225);
    int _2275 = _391 + 912;
    uint _2277 = uint(int(uint(_2275) >> uint(2)));
    _29[int(_2277)] = as_type<uint>(_2233);
    int _2279 = _391 + 1040;
    uint _2281 = uint(int(uint(_2279) >> uint(2)));
    _29[int(_2281)] = as_type<uint>(_2231);
    int _2283 = _1891 + 784;
    uint _2285 = uint(int(uint(_2283) >> uint(2)));
    _29[int(_2285)] = as_type<uint>(_2239);
    int _2287 = _1891 + 912;
    uint _2289 = uint(int(uint(_2287) >> uint(2)));
    _29[int(_2289)] = as_type<uint>(_2229);
    float _2291 = _2265;
    if (!_1163)
    {
        int _2293 = _1173 << 4;
        int _2295 = _2293 + 1904;
        uint _2297 = uint(int(uint(_2295) >> uint(2)));
        uint _2299 = uint(int(uint(int(_2297)) >> uint(2)));
        int _2301 = int(_2297) & 3;
        float _2303 = (*spvDescriptorSet0.cp_c3)._m0[int(_2299)][_2301];
        int _2305 = int(_2297) + 1;
        uint _2307 = uint(int(uint(_2305) >> uint(2)));
        int _2309 = _2305 & 3;
        float _2311 = (*spvDescriptorSet0.cp_c3)._m0[int(_2307)][_2309];
        int _2313 = _2295 + 8;
        uint _2315 = uint(int(uint(_2313) >> uint(2)));
        uint _2317 = uint(int(uint(int(_2315)) >> uint(2)));
        int _2319 = int(_2315) & 3;
        float _2321 = (*spvDescriptorSet0.cp_c3)._m0[int(_2317)][_2319];
        int _2323 = int(_2315) + 1;
        uint _2325 = uint(int(uint(_2323) >> uint(2)));
        int _2327 = _2323 & 3;
        float _2329 = (*spvDescriptorSet0.cp_c3)._m0[int(_2325)][_2327];
        float _2331 = _729 * _2311;
        float _2333 = fma(_635, _2303, _2331);
        float _2335 = fma(_175, _2321, _2333);
        float _2337 = _2335 + _2329;
        float _2339 = precise::clamp(_2337, 0.0, 1.0);
        float _2341 = -_2339;
        float _2343 = _2341 + _1455;
        float _2345 = fma(_2343, 500.0, 1.5);
        float _2347 = exp2(_2345);
        float _2349 = 0.0 + _2347;
        float _2351 = precise::clamp(_2349, 0.0, 1.0);
        _2291 = _2351;
        _223 = 500.0;
    }
    float _2353 = _2291;
    float _2355 = _223;
    float _2357 = _2355;
    if (!_1759)
    {
        _2357 = 1.0;
    }
    float _2359 = _2357;
    float _2361 = _2359;
    if (_1315)
    {
        _2241 = 1.0;
    }
    float _2363 = _2241;
    float _2365 = _2363;
    if (!_1315)
    {
        int _2367 = _1323 << 4;
        int _2369 = _2367 + 1904;
        uint _2371 = uint(int(uint(_2369) >> uint(2)));
        uint _2373 = uint(int(uint(int(_2371)) >> uint(2)));
        int _2375 = int(_2371) & 3;
        float _2377 = (*spvDescriptorSet0.cp_c3)._m0[int(_2373)][_2375];
        int _2379 = int(_2371) + 1;
        uint _2381 = uint(int(uint(_2379) >> uint(2)));
        int _2383 = _2379 & 3;
        float _2385 = (*spvDescriptorSet0.cp_c3)._m0[int(_2381)][_2383];
        int _2387 = _2369 + 8;
        uint _2389 = uint(int(uint(_2387) >> uint(2)));
        uint _2391 = uint(int(uint(int(_2389)) >> uint(2)));
        int _2393 = int(_2389) & 3;
        float _2395 = (*spvDescriptorSet0.cp_c3)._m0[int(_2391)][_2393];
        int _2397 = int(_2389) + 1;
        uint _2399 = uint(int(uint(_2397) >> uint(2)));
        int _2401 = _2397 & 3;
        float _2403 = (*spvDescriptorSet0.cp_c3)._m0[int(_2399)][_2401];
        float _2405 = _1213 * _2385;
        float _2407 = fma(_635, _2377, _2405);
        float _2409 = fma(_193, _2395, _2407);
        float _2411 = _2409 + _2403;
        float _2413 = precise::clamp(_2411, 0.0, 1.0);
        float _2415 = -_2413;
        float _2417 = _2415 + _1461;
        float _2419 = fma(_2417, 500.0, 1.5);
        float _2421 = exp2(_2419);
        float _2423 = 0.0 + _2421;
        float _2425 = precise::clamp(_2423, 0.0, 1.0);
        _2365 = _2425;
    }
    float _2427 = _2365;
    uint _2429 = spvSubgroupBallot(true).x;
    if (_1759)
    {
        bool _2431 = _1843 >= _1725;
        bool _2433 = isnan(_1843);
        bool _2435 = _2431 || _2433;
        bool _2437 = isnan(_1725);
        bool _2439 = _2435 || _2437;
        float _2441 = float(_2439);
        _2361 = _2441;
    }
    float _2443 = _2361;
    int _2445 = reverse_bits(int(_2429));
    float _2447 = _2263 * _2353;
    int _2449 = _331 & 255;
    int _2451 = _271 * 6;
    int _2453 = int(spvFindUMSB(uint(_2445)));
    bool _2455 = _2453 != (-1);
    int _2457 = _2453 ^ 31;
    int _2459 = _2455 ? _2457 : _2453;
    float _2461 = _2443 * _2427;
    int _2463 = _1891 + 1040;
    uint _2465 = uint(int(uint(_2463) >> uint(2)));
    _29[int(_2465)] = as_type<uint>(_2447);
    int _2467 = _2449 + 1;
    int _2469 = _2449 + 2;
    int _2471 = _1925 + 784;
    uint _2473 = uint(int(uint(_2471) >> uint(2)));
    _29[int(_2473)] = as_type<uint>(_2239);
    bool _2475 = as_type<int>(_60) != _2459;
    int _2477 = popcount(int(_151));
    int _2479 = _1925 + 912;
    uint _2481 = uint(int(uint(_2479) >> uint(2)));
    _29[int(_2481)] = as_type<uint>(_2233);
    int _2483 = _2449 + 3;
    int _2485 = _1925 + 1040;
    uint _2487 = uint(int(uint(_2485) >> uint(2)));
    _29[int(_2487)] = as_type<uint>(_2461);
    int _2489 = _2451 + 3860;
    int _2491 = _2489;
    int _2493 = _2449;
    _52(_2491, _2493, _29);
    int _2495 = _2451 + 3861;
    int _2497 = _2495;
    int _2499 = _2467;
    _52(_2497, _2499, _29);
    int _2501 = _2451 + 3862;
    int _2503 = _2501;
    int _2505 = _2469;
    _52(_2503, _2505, _29);
    int _2507 = _2451 + 3863;
    int _2509 = _2507;
    int _2511 = _2467;
    _52(_2509, _2511, _29);
    int _2513 = _2451 + 3864;
    int _2515 = _2513;
    int _2517 = _2483;
    _52(_2515, _2517, _29);
    int _2519 = _2451 + 3865;
    int _2521 = _2519;
    int _2523 = _2469;
    _52(_2521, _2523, _29);
    if (_2475)
    {
        return;
    }
    int _2525 = _2477 << 1;
    int _2527 = 3859;
    int _2529 = _2525;
    _52(_2527, _2529, _29);
}


struct dm_payload_t { uint w[64]; };
struct dm_vertex_t {
    float4 position [[position]];
    float4 a0 [[user(locn0)]];
};
using dm_mesh_t = metal::mesh<dm_vertex_t, void, 128, 64, metal::topology::triangle>;
[[mesh]] void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint dm_lid [[thread_position_in_threadgroup]], uint dm_tg [[threadgroup_position_in_grid]], dm_mesh_t dm_out, const object_data dm_payload_t& dm_payload [[payload]])
{
    threadgroup spvUnsafeArray<uint, 1013> _29;
    for (uint i = dm_lid; i < 1013u; i += 32u) _29[i] = 0u;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    for (uint i = dm_lid; i < 64u; i += 32u) _29[4u + i] = dm_payload.w[i];
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (dm_lid == 0u) { _29[0] = dm_tg; _29[4] = dm_tg; }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    dm_stage_body(spvDescriptorSet0, gl_SubgroupInvocationID, _29);
    threadgroup_barrier(mem_flags::mem_threadgroup);
    uint np = min(_29[964] >> 24, 64u);
    if (dm_lid == 0u) dm_out.set_primitive_count(np);
    for (uint n = dm_lid; n < 128u; n += 32u)
    {
        uint b = 68u + (n / 32u) * 224u + n % 32u;
        dm_vertex_t v;
        v.position = float4(as_type<float>(_29[b + 0u]), as_type<float>(_29[b + 32u]), as_type<float>(_29[b + 64u]), as_type<float>(_29[b + 96u]));
        v.a0 = float4(as_type<float>(_29[b + 128u]), as_type<float>(_29[b + 160u]), 0.0, as_type<float>(_29[b + 192u]));
        v.position.z = fma(v.position.z, 0.5, v.position.w * 0.5);
        dm_out.set_vertex(n, v);
    }
    for (uint n = dm_lid; n < np * 3u; n += 32u)
    {
        uint at = 3860u + n;
        dm_out.set_index(n, (_29[at >> 2] >> ((at & 3u) * 8u)) & 0xffu);
    }
}

[[mesh]] void main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint dm_lid [[thread_position_in_threadgroup]], uint dm_tg [[threadgroup_position_in_grid]], dm_mesh_t dm_out, const object_data dm_payload_t& dm_payload [[payload]])
{
    threadgroup spvUnsafeArray<uint, 1013> _29;
    for (uint i = dm_lid; i < 1013u; i += 32u) _29[i] = 0u;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    for (uint i = dm_lid; i < 64u; i += 32u) _29[4u + i] = dm_payload.w[i];
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (dm_lid == 0u) { _29[0] = dm_tg; _29[4] = dm_tg; }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    dm_stage_body(spvDescriptorSet0, gl_SubgroupInvocationID, _29);
    threadgroup_barrier(mem_flags::mem_threadgroup);
    uint np = min(_29[964] >> 24, 64u);
    if (dm_lid == 0u) dm_out.set_primitive_count(np);
    for (uint n = dm_lid; n < 128u; n += 32u)
    {
        uint b = 68u + (n / 32u) * 224u + n % 32u;
        dm_vertex_t v;
        v.position = float4(as_type<float>(_29[b + 0u]), as_type<float>(_29[b + 32u]), as_type<float>(_29[b + 64u]), as_type<float>(_29[b + 96u]));
        v.a0 = float4(as_type<float>(_29[b + 128u]), as_type<float>(_29[b + 160u]), 0.0, as_type<float>(_29[b + 192u]));
        dm_out.set_vertex(n, v);
    }
    for (uint n = dm_lid; n < np * 3u; n += 32u)
    {
        uint at = 3860u + n;
        dm_out.set_index(n, (_29[at >> 2] >> ((at & 3u) * 8u)) & 0xffu);
    }
}
