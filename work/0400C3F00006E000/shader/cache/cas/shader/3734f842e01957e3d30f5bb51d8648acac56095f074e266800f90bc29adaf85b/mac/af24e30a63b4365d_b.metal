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
void _52(thread const int& _6648, thread const int& _6649, threadgroup spvUnsafeArray<uint, 1013>& _29)
{
    uint _6652 = uint(int(uint(_6648) >> uint(2)));
    int _6654 = _6648 & 3;
    int _6656 = _6654 << 3;
    bool _6658;
    do
    {
        float _6660 = as_type<float>(_29[int(_6652)]);
        int _6662 = int(insert_bits(as_type<uint>(_6660), uint(_6649), uint(_6656), 8u));
        uint _6692 = as_type<uint>(_6660);
        uint _6697;
        do
        {
            _6697 = _6692;
        } while (!atomic_compare_exchange_weak_explicit((threadgroup atomic_uint*)&_29[int(_6652)], &_6697, uint(_6662), memory_order_relaxed, memory_order_relaxed) && _6697 == _6692);
        uint _6664 = _6697;
        _6658 = int(_6664) != as_type<int>(_6660);
    } while (_6658);
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
    int _107 = _95 << 3;
    int _109 = _99 << 3;
    uint _111 = uint(int(uint(_101) >> uint(2)));
    float _113 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_111)]);
    int _115 = _105 << 3;
    uint _117 = uint(int(uint(_107) >> uint(2)));
    float _119 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_117)]);
    uint _121 = uint(int(uint(_109) >> uint(2)));
    float _123 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_121)]);
    uint _125 = uint(int(uint(_115) >> uint(2)));
    float _127 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_125)]);
    uint _129 = min(as_type<uint>(_113), as_type<uint>(_119));
    uint _131 = max(as_type<uint>(_113), as_type<uint>(_119));
    uint _133 = min(as_type<uint>(_123), as_type<uint>(_127));
    uint _135 = max(as_type<uint>(_123), as_type<uint>(_127));
    uint _137 = min(_129, _133);
    uint _139 = max(_131, _135);
    bool _143 = int(_137) != 0;
    int _145 = int(_137) + 30000;
    bool _147 = _139 < uint(_145);
    bool _149 = _147 && _143;
    uint _151 = spvSubgroupBallot(_149).x;
    float _153 = as_type<float>(_77);
    if (!_149)
    {
        return;
    }
    float _155 = float(as_type<int>((*spvDescriptorSet0.cp_c3)._m0[3].z));
    float _157 = float(uint(_77));
    float _159 = float(as_type<uint>(_113));
    float _161 = fma(_157, 2.0, _155);
    float _163 = float(as_type<int>((*spvDescriptorSet0.cp_c3)._m0[3].w));
    float _165 = float(uint(_83));
    float _167 = fma(_159, 9.9999997473787516355514526367188e-05, 1.10000002384185791015625);
    float _169 = _161 * (*spvDescriptorSet0.cp_c3)._m0[14].x;
    float _171 = float(as_type<uint>(_123));
    float _173 = _161 * (*spvDescriptorSet0.cp_c3)._m0[117].x;
    float _175 = fma(_165, 2.0, _163);
    float _177 = fma(_167, (*spvDescriptorSet0.cp_c3)._m0[14].y, _169);
    float _179 = fma(_171, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    float _181 = float(as_type<uint>(_119));
    float _183 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[14].z, _177);
    float _185 = _175 + 2.0;
    float _187 = _161 * (*spvDescriptorSet0.cp_c3)._m0[118].x;
    float _189 = float(as_type<uint>(_127));
    float _191 = _183 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _193 = fma(_179, (*spvDescriptorSet0.cp_c3)._m0[118].y, _187);
    float _195 = -_191;
    bool _197 = _195 > (*spvDescriptorSet0.cp_c3)._m0[631].y;
    float _199 = fma(_185, (*spvDescriptorSet0.cp_c3)._m0[118].z, _193);
    float _201 = -_191;
    bool _203 = _201 > (*spvDescriptorSet0.cp_c3)._m0[631].x;
    float _205 = fma(_179, (*spvDescriptorSet0.cp_c3)._m0[117].y, _173);
    bool _207 = !_197;
    int _209 = _207 ? 0 : 1;
    float _211 = _199 + (*spvDescriptorSet0.cp_c3)._m0[118].w;
    float _213 = fma(_185, (*spvDescriptorSet0.cp_c3)._m0[117].z, _205);
    float _215 = fma(_181, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    float _217 = trunc(_211);
    int _219 = int(_217);
    float _221 = _213 + (*spvDescriptorSet0.cp_c3)._m0[117].w;
    int _223 = 2;
    uint _225 = as_type<uint>(_159);
    float _227 = _211;
    float _229 = _165;
    if (!_197)
    {
        _223 = 1;
    }
    int _231 = _223;
    int _233 = _231;
    if (!_203)
    {
        _233 = _209;
    }
    int _235 = _233;
    float _237 = _161 + 2.0;
    float _239 = trunc(_221);
    int _241 = int(_239);
    int _243 = _235 << 6;
    float _245 = _237 * (*spvDescriptorSet0.cp_c3)._m0[117].x;
    float _247 = _237 * (*spvDescriptorSet0.cp_c3)._m0[118].x;
    int _249 = _243 + 9904;
    uint _251 = uint(int(uint(_249) >> uint(2)));
    uint _253 = uint(int(uint(int(_251)) >> uint(2)));
    int _255 = int(_251) & 3;
    float _257 = (*spvDescriptorSet0.cp_c3)._m0[int(_253)][_255];
    int _259 = int(_251) + 1;
    uint _261 = uint(int(uint(_259) >> uint(2)));
    int _263 = _259 & 3;
    float _265 = (*spvDescriptorSet0.cp_c3)._m0[int(_261)][_263];
    float _267 = fma(_215, (*spvDescriptorSet0.cp_c3)._m0[117].y, _245);
    float _269 = fma(_215, (*spvDescriptorSet0.cp_c3)._m0[118].y, _247);
    int _271 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].z);
    int _273 = _219 + _271;
    int _275 = _273 + 1;
    float _277 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[117].z, _267);
    float _279 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[118].z, _269);
    int _281 = _243 + 9920;
    uint _283 = uint(int(uint(_281) >> uint(2)));
    uint _285 = uint(int(uint(int(_283)) >> uint(2)));
    int _287 = int(_283) & 3;
    float _289 = (*spvDescriptorSet0.cp_c3)._m0[int(_285)][_287];
    int _291 = int(_283) + 1;
    uint _293 = uint(int(uint(_291) >> uint(2)));
    int _295 = _291 & 3;
    float _297 = (*spvDescriptorSet0.cp_c3)._m0[int(_293)][_295];
    float _299 = _277 + (*spvDescriptorSet0.cp_c3)._m0[117].w;
    float _301 = _279 + (*spvDescriptorSet0.cp_c3)._m0[118].w;
    int _303 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].y);
    int _305 = _241 + _303;
    int _307 = _305 + 1;
    float _309 = fma(_159, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    float _311 = trunc(_299);
    int _313 = int(_311);
    bool _315 = _307 >= 0;
    int _317 = _243 + 9952;
    uint _319 = uint(int(uint(_317) >> uint(2)));
    uint _321 = uint(int(uint(int(_319)) >> uint(2)));
    int _323 = int(_319) & 3;
    float _325 = (*spvDescriptorSet0.cp_c3)._m0[int(_321)][_323];
    int _327 = int(_319) + 1;
    uint _329 = uint(int(uint(_327) >> uint(2)));
    int _331 = _327 & 3;
    float _333 = (*spvDescriptorSet0.cp_c3)._m0[int(_329)][_331];
    bool _335 = _307 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _337 = !_315;
    bool _339 = _335 || _337;
    float _341 = trunc(_301);
    int _343 = int(_341);
    bool _345 = _275 < 0;
    bool _347 = _345 || _339;
    int _349 = _243 + 9960;
    uint _351 = uint(int(uint(_349) >> uint(2)));
    uint _353 = uint(int(uint(int(_351)) >> uint(2)));
    int _355 = int(_351) & 3;
    float _357 = (*spvDescriptorSet0.cp_c3)._m0[int(_353)][_355];
    int _359 = int(_351) + 1;
    uint _361 = uint(int(uint(_359) >> uint(2)));
    int _363 = _359 & 3;
    float _365 = (*spvDescriptorSet0.cp_c3)._m0[int(_361)][_363];
    bool _367 = _275 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _369 = _367 || _347;
    int _371 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].y);
    int _373 = _313 + _371;
    int _375 = _373 + 1;
    bool _377 = _375 >= 0;
    int _379 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].z);
    int _381 = _343 + _379;
    int _383 = _381 + 1;
    bool _385 = _375 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _387 = !_377;
    bool _389 = _385 || _387;
    int _391 = _275;
    int _393 = as_type<int>(_247);
    int _395 = as_type<int>(_245);
    float _397 = as_type<float>(_383);
    float _399 = as_type<float>(_235);
    float _401 = as_type<float>(_243);
    if (!_369)
    {
        int _403 = _275 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
        int _405 = _403 + _307;
        _225 = uint(_405);
    }
    uint _407 = _225;
    bool _409 = _383 < 0;
    bool _411 = _409 || _389;
    float _413 = as_type<float>(_407);
    if (!_369)
    {
        uint _415 = uint(int(uint(int(_407)) >> uint(2)));
        _391 = int(_415);
    }
    int _417 = _391;
    bool _419 = _383 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _421 = _419 || _411;
    float _423 = _309 * _265;
    float _425 = fma(_161, _257, _423);
    float _427 = fma(_189, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    float _429 = _309 * _297;
    float _431 = fma(_161, _289, _429);
    float _433 = fma(_427, (*spvDescriptorSet0.cp_c3)._m0[117].y, _245);
    int _435 = as_type<int>(_429);
    int _437 = as_type<int>(_265);
    float _439 = as_type<float>(_417);
    if (!_369)
    {
        int _441 = int(_407) << 2;
        _435 = _441;
    }
    int _443 = _435;
    if (!_421)
    {
        int _445 = _383 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
        int _447 = _445 + _375;
        _437 = _447;
    }
    int _449 = _437;
    float _451 = fma(_427, (*spvDescriptorSet0.cp_c3)._m0[118].y, _247);
    float _453 = fma(_185, (*spvDescriptorSet0.cp_c3)._m0[117].z, _433);
    float _455 = _309 * _333;
    if (!_369)
    {
        int _457 = 12 & _443;
        _393 = _457;
    }
    int _459 = _393;
    float _461 = fma(_185, (*spvDescriptorSet0.cp_c3)._m0[118].z, _451);
    float _463 = _453 + (*spvDescriptorSet0.cp_c3)._m0[117].w;
    int _465 = _243 + 9912;
    uint _467 = uint(int(uint(_465) >> uint(2)));
    uint _469 = uint(int(uint(int(_467)) >> uint(2)));
    int _471 = int(_467) & 3;
    float _473 = (*spvDescriptorSet0.cp_c3)._m0[int(_469)][_471];
    int _475 = int(_467) + 1;
    uint _477 = uint(int(uint(_475) >> uint(2)));
    int _479 = _475 & 3;
    float _481 = (*spvDescriptorSet0.cp_c3)._m0[int(_477)][_479];
    float _483 = fma(_161, _325, _455);
    int _485 = as_type<int>(_461);
    if (!_369)
    {
        int _487 = _417 << 4;
        int _489 = _487 + _459;
        _439 = as_type<float>(_489);
    }
    float _491 = _439;
    float _493 = _461 + (*spvDescriptorSet0.cp_c3)._m0[118].w;
    float _495 = trunc(_463);
    int _497 = int(_495);
    int _499 = 0;
    if (!_421)
    {
        int _501 = _449 << 2;
        _499 = _501;
    }
    int _503 = _499;
    float _505 = fma(_175, _357, _483);
    if (!_421)
    {
        uint _507 = uint(int(uint(_449) >> uint(2)));
        _395 = int(_507);
    }
    int _509 = _395;
    int _511 = _243 + 9928;
    uint _513 = uint(int(uint(_511) >> uint(2)));
    uint _515 = uint(int(uint(int(_513)) >> uint(2)));
    int _517 = int(_513) & 3;
    float _519 = (*spvDescriptorSet0.cp_c3)._m0[int(_515)][_517];
    int _521 = int(_513) + 1;
    uint _523 = uint(int(uint(_521) >> uint(2)));
    int _525 = _521 & 3;
    float _527 = (*spvDescriptorSet0.cp_c3)._m0[int(_523)][_525];
    float _529 = as_type<float>(_509);
    if (!_421)
    {
        int _531 = 12 & _503;
        _485 = _531;
    }
    int _533 = _485;
    float _535 = trunc(_493);
    int _537 = int(_535);
    if (!_421)
    {
        int _539 = _509 << 4;
        int _541 = _539 + _533;
        _529 = as_type<float>(_541);
    }
    float _543 = _529;
    float _545 = _491;
    if (!_369)
    {
        int _547 = as_type<int>(_491) + 256;
        uint _549 = uint(int(uint(_547) >> uint(2)));
        uint _551 = uint(int(uint(int(_549)) >> uint(2)));
        int _553 = int(_549) & 3;
        float _555 = (*spvDescriptorSet0.cp_c3)._m0[int(_551)][_553];
        _545 = _555;
    }
    float _557 = _545;
    int _559 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].y);
    int _561 = _497 + _559;
    int _563 = _561 + 1;
    int _565 = _563;
    if (!_421)
    {
        float _567 = floor(_299);
        _397 = _567;
    }
    float _569 = _397;
    bool _571 = _563 >= 0;
    float _573 = _543;
    if (!_421)
    {
        int _575 = as_type<int>(_543) + 256;
        uint _577 = uint(int(uint(_575) >> uint(2)));
        uint _579 = uint(int(uint(int(_577)) >> uint(2)));
        int _581 = int(_577) & 3;
        float _583 = (*spvDescriptorSet0.cp_c3)._m0[int(_579)][_581];
        _573 = _583;
    }
    float _585 = _573;
    int _587 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].z);
    int _589 = _537 + _587;
    int _591 = _589 + 1;
    float _593 = _505 + _365;
    bool _595 = _563 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _597 = !_571;
    bool _599 = _595 || _597;
    int _601 = _243 + 9936;
    uint _603 = uint(int(uint(_601) >> uint(2)));
    uint _605 = uint(int(uint(int(_603)) >> uint(2)));
    int _607 = int(_603) & 3;
    float _609 = (*spvDescriptorSet0.cp_c3)._m0[int(_605)][_607];
    int _611 = int(_603) + 1;
    uint _613 = uint(int(uint(_611) >> uint(2)));
    int _615 = _611 & 3;
    float _617 = (*spvDescriptorSet0.cp_c3)._m0[int(_613)][_615];
    bool _619 = _591 < 0;
    bool _621 = _619 || _599;
    float _623 = 1.0 / _593;
    bool _625 = _591 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _627 = _625 || _621;
    float _629 = fma(_175, _473, _425);
    int _631 = as_type<int>(_629);
    if (!_627)
    {
        int _633 = _591 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
        int _635 = _633 + _563;
        _565 = _635;
    }
    int _637 = _565;
    float _639 = _629 + _481;
    int _641 = _243 + 9944;
    uint _643 = uint(int(uint(_641) >> uint(2)));
    uint _645 = uint(int(uint(int(_643)) >> uint(2)));
    int _647 = int(_643) & 3;
    float _649 = (*spvDescriptorSet0.cp_c3)._m0[int(_645)][_647];
    int _651 = int(_643) + 1;
    uint _653 = uint(int(uint(_651) >> uint(2)));
    int _655 = _651 & 3;
    float _657 = (*spvDescriptorSet0.cp_c3)._m0[int(_653)][_655];
    int _659 = as_type<int>(_639);
    if (!_627)
    {
        int _661 = _637 << 2;
        _631 = _661;
    }
    int _663 = _631;
    float _665 = fma(_175, _519, _431);
    float _667 = _639 * _623;
    int _669 = _663;
    if (!_627)
    {
        int _671 = 12 & _663;
        _659 = _671;
    }
    int _673 = _659;
    float _675 = _665 + _527;
    float _677 = as_type<float>(_673);
    if (!_627)
    {
        uint _679 = uint(int(uint(_637) >> uint(2)));
        _669 = int(_679);
    }
    int _681 = _669;
    bool _683 = _667 >= 0.0;
    float _685 = _675 * _623;
    float _687 = 0.0;
    float _689 = as_type<float>(_681);
    if (!_627)
    {
        int _691 = _681 << 4;
        int _693 = _691 + _673;
        _687 = as_type<float>(_693);
    }
    float _695 = _687;
    float _697 = _557;
    if (!_369)
    {
        float _699 = rint(_557);
        float _701 = precise::max(_699, 0.0);
        uint _703 = uint(_701);
        uint _705 = clamp(_703, 0u, 65535u);
        _697 = as_type<float>(_705);
    }
    float _707 = _697;
    bool _709 = _667 <= 1.0;
    bool _711 = _709 && _683;
    float _713 = _695;
    if (!_627)
    {
        int _715 = as_type<int>(_695) + 256;
        uint _717 = uint(int(uint(_715) >> uint(2)));
        uint _719 = uint(int(uint(int(_717)) >> uint(2)));
        int _721 = int(_717) & 3;
        float _723 = (*spvDescriptorSet0.cp_c3)._m0[int(_719)][_721];
        _713 = _723;
    }
    float _725 = _713;
    bool _727 = _685 >= 0.0;
    bool _729 = _727 && _711;
    if (!_369)
    {
        float _731 = floor(_221);
        _677 = _731;
    }
    float _733 = _677;
    bool _735 = _685 <= 1.0;
    bool _737 = _735 && _729;
    float _739 = _309 * _617;
    float _741 = _617;
    float _743 = _733;
    if (!_369)
    {
        float _745 = floor(_211);
        _741 = _745;
    }
    float _747 = _741;
    float _749 = fma(_161, _609, _739);
    if (_737)
    {
        float _751 = float(_235);
        _399 = _751;
    }
    float _753 = _399;
    if (!_421)
    {
        float _755 = rint(_585);
        float _757 = precise::max(_755, 0.0);
        uint _759 = uint(_757);
        uint _761 = clamp(_759, 0u, 65535u);
        _689 = as_type<float>(_761);
    }
    float _763 = _689;
    float _765 = _585;
    if (!_627)
    {
        float _767 = floor(_493);
        _765 = _767;
    }
    float _769 = _765;
    float _771 = _747;
    if (!_369)
    {
        float _773 = -_747;
        float _775 = _211 + _773;
        _401 = _775;
    }
    float _777 = _401;
    float _779 = fma(_175, _649, _749);
    if (!_369)
    {
        float _781 = -_733;
        float _783 = _221 + _781;
        _227 = _783;
    }
    float _785 = _227;
    if (!_421)
    {
        float _787 = -_569;
        float _789 = _299 + _787;
        _743 = _789;
    }
    float _791 = _743;
    float _793 = _779 + _657;
    float _795 = _649;
    if (!_421)
    {
        float _797 = floor(_301);
        _795 = _797;
    }
    float _799 = _795;
    float _801 = _793 * _623;
    float _803 = _657;
    int _805 = as_type<int>(_801);
    if (!_627)
    {
        float _807 = floor(_463);
        _803 = _807;
    }
    float _809 = _803;
    float _811 = _769;
    if (!_627)
    {
        float _813 = -_769;
        float _815 = _493 + _813;
        _811 = _815;
    }
    float _817 = _811;
    float _819 = _753;
    if (_737)
    {
        float _821 = rint(_753);
        float _823 = precise::max(_821, 0.0);
        uint _825 = uint(_823);
        uint _827 = clamp(_825, 0u, 65535u);
        _819 = as_type<float>(_827);
    }
    float _829 = _819;
    float _831 = _799;
    if (!_421)
    {
        float _833 = -_799;
        float _835 = _301 + _833;
        _831 = _835;
    }
    float _837 = _831;
    float _839 = _779;
    if (!_627)
    {
        float _841 = rint(_725);
        float _843 = precise::max(_841, 0.0);
        uint _845 = uint(_843);
        uint _847 = clamp(_845, 0u, 65535u);
        _839 = as_type<float>(_847);
    }
    float _849 = _839;
    if (!_627)
    {
        float _851 = -_809;
        float _853 = _463 + _851;
        _771 = _853;
    }
    float _855 = _771;
    int _857 = as_type<int>(_685);
    if (_737)
    {
        float3 _3850 = float3(_667, _685, float(as_type<int>(_829)));
        float3 _3854 = select(_3850, float3(0.0), isnan(_3850));
        float _859 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _3854.xy, uint(rint(_3854.z)), _801, level(0.0));
        _857 = as_type<int>(_859);
    }
    int _861 = _857;
    float _863 = _707;
    if (!_369)
    {
        float3 _3871 = float3(_785, _777, float(as_type<int>(_707)));
        float3 _3873 = select(_3871, float3(0.0), isnan(_3871));
        float _865 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _3873.xy, uint(rint(_3873.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _3873.xy, uint(rint(_3873.z)), level(0.0)).x;
        _863 = _865;
    }
    float _867 = _863;
    float _869 = _301;
    if (!_421)
    {
        float3 _3889 = float3(_791, _837, float(as_type<int>(_763)));
        float3 _3891 = select(_3889, float3(0.0), isnan(_3889));
        float _871 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _3891.xy, uint(rint(_3891.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _3891.xy, uint(rint(_3891.z)), level(0.0)).x;
        _869 = _871;
    }
    float _873 = _869;
    float _875 = _299;
    if (!_627)
    {
        float3 _3907 = float3(_855, _817, float(as_type<int>(_849)));
        float3 _3909 = select(_3907, float3(0.0), isnan(_3907));
        float _877 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _3909.xy, uint(rint(_3909.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _3909.xy, uint(rint(_3909.z)), level(0.0)).x;
        _875 = _877;
    }
    float _879 = _875;
    float _881 = as_type<float>(gl_SubgroupLtMask.x);
    float _883 = fma(_309, (*spvDescriptorSet0.cp_c3)._m0[117].y, _173);
    float _885 = fma(_309, (*spvDescriptorSet0.cp_c3)._m0[118].y, _187);
    float _887 = fma(_171, 9.9999997473787516355514526367188e-05, 1.10000002384185791015625);
    float _889 = fma(_181, 9.9999997473787516355514526367188e-05, 1.10000002384185791015625);
    float _891 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[117].z, _883);
    float _893 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[118].z, _885);
    float _895 = fma(_887, (*spvDescriptorSet0.cp_c3)._m0[14].y, _169);
    float _897 = fma(_189, 9.9999997473787516355514526367188e-05, 1.10000002384185791015625);
    float _899 = _891 + (*spvDescriptorSet0.cp_c3)._m0[117].w;
    float _901 = _893 + (*spvDescriptorSet0.cp_c3)._m0[118].w;
    float _903 = fma(_185, (*spvDescriptorSet0.cp_c3)._m0[14].z, _895);
    float _905 = trunc(_899);
    int _907 = int(_905);
    float _909 = _903 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _911 = -_909;
    bool _913 = _911 > (*spvDescriptorSet0.cp_c3)._m0[631].y;
    int _915 = int(_151) & as_type<int>(_881);
    float _917 = trunc(_901);
    int _919 = int(_917);
    float _921 = -_909;
    bool _923 = _921 > (*spvDescriptorSet0.cp_c3)._m0[631].x;
    float _925 = _237 * (*spvDescriptorSet0.cp_c3)._m0[14].x;
    int _927 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].y);
    int _929 = _907 + _927;
    int _931 = _929 + 1;
    int _933 = popcount(_915);
    bool _935 = !_913;
    int _937 = _935 ? 0 : 1;
    bool _939 = _931 >= 0;
    bool _941 = _931 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _943 = !_939;
    bool _945 = _941 || _943;
    int _947 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].z);
    int _949 = _919 + _947;
    int _951 = _949 + 1;
    int _953 = 2;
    int _955 = _931;
    if (!_913)
    {
        _953 = 1;
    }
    int _957 = _953;
    int _959 = _957;
    if (!_923)
    {
        _959 = _937;
    }
    int _961 = _959;
    int _963 = _933 << 2;
    int _965 = _961 << 6;
    int _967 = _963 + 1;
    bool _969 = _951 < 0;
    bool _971 = _969 || _945;
    int _973 = _967 << 2;
    uint _975 = uint(int(uint(_967) >> uint(5)));
    int _977 = 124 & _973;
    bool _979 = _951 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _981 = _979 || _971;
    int _983 = int(_975) * 896;
    int _985 = _983 + _977;
    int _987 = _965 + 9904;
    uint _989 = uint(int(uint(_987) >> uint(2)));
    uint _991 = uint(int(uint(int(_989)) >> uint(2)));
    int _993 = int(_989) & 3;
    float _995 = (*spvDescriptorSet0.cp_c3)._m0[int(_991)][_993];
    int _997 = int(_989) + 1;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    int _1001 = _997 & 3;
    float _1003 = (*spvDescriptorSet0.cp_c3)._m0[int(_999)][_1001];
    float _1005 = as_type<float>(_961);
    if (!_981)
    {
        int _1007 = _951 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
        int _1009 = _1007 + _931;
        _955 = _1009;
    }
    int _1011 = _955;
    float _1013 = _179 * _1003;
    float _1015 = fma(_161, _995, _1013);
    int _1017 = _965 + 9912;
    uint _1019 = uint(int(uint(_1017) >> uint(2)));
    uint _1021 = uint(int(uint(int(_1019)) >> uint(2)));
    int _1023 = int(_1019) & 3;
    float _1025 = (*spvDescriptorSet0.cp_c3)._m0[int(_1021)][_1023];
    int _1027 = int(_1019) + 1;
    uint _1029 = uint(int(uint(_1027) >> uint(2)));
    int _1031 = _1027 & 3;
    float _1033 = (*spvDescriptorSet0.cp_c3)._m0[int(_1029)][_1031];
    float _1035 = fma(_185, _1025, _1015);
    float _1037 = _1035 + _1033;
    int _1039 = _965 + 9920;
    uint _1041 = uint(int(uint(_1039) >> uint(2)));
    uint _1043 = uint(int(uint(int(_1041)) >> uint(2)));
    int _1045 = int(_1041) & 3;
    float _1047 = (*spvDescriptorSet0.cp_c3)._m0[int(_1043)][_1045];
    int _1049 = int(_1041) + 1;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    int _1053 = _1049 & 3;
    float _1055 = (*spvDescriptorSet0.cp_c3)._m0[int(_1051)][_1053];
    float _1057 = _179 * _1055;
    float _1059 = fma(_161, _1047, _1057);
    int _1061 = _965 + 9928;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    uint _1065 = uint(int(uint(int(_1063)) >> uint(2)));
    int _1067 = int(_1063) & 3;
    float _1069 = (*spvDescriptorSet0.cp_c3)._m0[int(_1065)][_1067];
    int _1071 = int(_1063) + 1;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    int _1075 = _1071 & 3;
    float _1077 = (*spvDescriptorSet0.cp_c3)._m0[int(_1073)][_1075];
    float _1079 = fma(_185, _1069, _1059);
    float _1081 = _1079 + _1077;
    int _1083 = _965 + 9936;
    uint _1085 = uint(int(uint(_1083) >> uint(2)));
    uint _1087 = uint(int(uint(int(_1085)) >> uint(2)));
    int _1089 = int(_1085) & 3;
    float _1091 = (*spvDescriptorSet0.cp_c3)._m0[int(_1087)][_1089];
    int _1093 = int(_1085) + 1;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    int _1097 = _1093 & 3;
    float _1099 = (*spvDescriptorSet0.cp_c3)._m0[int(_1095)][_1097];
    float _1101 = _179 * _1099;
    float _1103 = fma(_161, _1091, _1101);
    int _1105 = _965 + 9944;
    uint _1107 = uint(int(uint(_1105) >> uint(2)));
    uint _1109 = uint(int(uint(int(_1107)) >> uint(2)));
    int _1111 = int(_1107) & 3;
    float _1113 = (*spvDescriptorSet0.cp_c3)._m0[int(_1109)][_1111];
    int _1115 = int(_1107) + 1;
    uint _1117 = uint(int(uint(_1115) >> uint(2)));
    int _1119 = _1115 & 3;
    float _1121 = (*spvDescriptorSet0.cp_c3)._m0[int(_1117)][_1119];
    float _1123 = fma(_185, _1113, _1103);
    float _1125 = _1123 + _1121;
    int _1127 = _965 + 9952;
    uint _1129 = uint(int(uint(_1127) >> uint(2)));
    uint _1131 = uint(int(uint(int(_1129)) >> uint(2)));
    int _1133 = int(_1129) & 3;
    float _1135 = (*spvDescriptorSet0.cp_c3)._m0[int(_1131)][_1133];
    int _1137 = int(_1129) + 1;
    uint _1139 = uint(int(uint(_1137) >> uint(2)));
    int _1141 = _1137 & 3;
    float _1143 = (*spvDescriptorSet0.cp_c3)._m0[int(_1139)][_1141];
    float _1145 = _179 * _1143;
    float _1147 = fma(_161, _1135, _1145);
    int _1149 = _965 + 9960;
    uint _1151 = uint(int(uint(_1149) >> uint(2)));
    uint _1153 = uint(int(uint(int(_1151)) >> uint(2)));
    int _1155 = int(_1151) & 3;
    float _1157 = (*spvDescriptorSet0.cp_c3)._m0[int(_1153)][_1155];
    int _1159 = int(_1151) + 1;
    uint _1161 = uint(int(uint(_1159) >> uint(2)));
    int _1163 = _1159 & 3;
    float _1165 = (*spvDescriptorSet0.cp_c3)._m0[int(_1161)][_1163];
    float _1167 = fma(_185, _1157, _1147);
    float _1169 = _1167 + _1165;
    float _1171 = 1.0 / _1169;
    float _1173 = _1081 * _1171;
    float _1175 = fma(_889, (*spvDescriptorSet0.cp_c3)._m0[14].y, _925);
    float _1177 = _1037 * _1171;
    float _1179 = _1125 * _1171;
    float _1181 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[14].z, _1175);
    float _1183 = fma(_897, (*spvDescriptorSet0.cp_c3)._m0[14].y, _925);
    float _1185 = _1181 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _1187 = fma(_185, (*spvDescriptorSet0.cp_c3)._m0[14].z, _1183);
    float _1189 = -_1185;
    bool _1191 = _1189 > (*spvDescriptorSet0.cp_c3)._m0[631].y;
    float _1193 = _1187 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _1195 = -_1185;
    bool _1197 = _1195 > (*spvDescriptorSet0.cp_c3)._m0[631].x;
    bool _1199 = !_1191;
    int _1201 = _1199 ? 0 : 1;
    int _1203 = 2;
    if (!_1191)
    {
        _1203 = 1;
    }
    int _1205 = _1203;
    int _1207 = _1205;
    if (!_1197)
    {
        _1207 = _1201;
    }
    int _1209 = _1207;
    float _1211 = -_1193;
    bool _1213 = _1211 > (*spvDescriptorSet0.cp_c3)._m0[631].y;
    int _1215 = _1209 << 6;
    float _1217 = -_1193;
    bool _1219 = _1217 > (*spvDescriptorSet0.cp_c3)._m0[631].x;
    int _1221 = _1215 + 9904;
    uint _1223 = uint(int(uint(_1221) >> uint(2)));
    uint _1225 = uint(int(uint(int(_1223)) >> uint(2)));
    int _1227 = int(_1223) & 3;
    float _1229 = (*spvDescriptorSet0.cp_c3)._m0[int(_1225)][_1227];
    int _1231 = int(_1223) + 1;
    uint _1233 = uint(int(uint(_1231) >> uint(2)));
    int _1235 = _1231 & 3;
    float _1237 = (*spvDescriptorSet0.cp_c3)._m0[int(_1233)][_1235];
    bool _1239 = !_1213;
    int _1241 = _1239 ? 0 : 1;
    int _1243 = 2;
    float _1245 = as_type<float>(_1209);
    if (!_1213)
    {
        _1243 = 1;
    }
    int _1247 = _1243;
    int _1249 = _1247;
    if (!_1219)
    {
        _1249 = _1241;
    }
    int _1251 = _1249;
    float _1253 = _215 * _1237;
    float _1255 = fma(_237, _1229, _1253);
    int _1257 = _1215 + 9912;
    uint _1259 = uint(int(uint(_1257) >> uint(2)));
    uint _1261 = uint(int(uint(int(_1259)) >> uint(2)));
    int _1263 = int(_1259) & 3;
    float _1265 = (*spvDescriptorSet0.cp_c3)._m0[int(_1261)][_1263];
    int _1267 = int(_1259) + 1;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    int _1271 = _1267 & 3;
    float _1273 = (*spvDescriptorSet0.cp_c3)._m0[int(_1269)][_1271];
    float _1275 = fma(_175, _1265, _1255);
    float _1277 = _1275 + _1273;
    int _1279 = _1215 + 9920;
    uint _1281 = uint(int(uint(_1279) >> uint(2)));
    uint _1283 = uint(int(uint(int(_1281)) >> uint(2)));
    int _1285 = int(_1281) & 3;
    float _1287 = (*spvDescriptorSet0.cp_c3)._m0[int(_1283)][_1285];
    int _1289 = int(_1281) + 1;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    int _1293 = _1289 & 3;
    float _1295 = (*spvDescriptorSet0.cp_c3)._m0[int(_1291)][_1293];
    float _1297 = _215 * _1295;
    float _1299 = fma(_237, _1287, _1297);
    int _1301 = _1215 + 9928;
    uint _1303 = uint(int(uint(_1301) >> uint(2)));
    uint _1305 = uint(int(uint(int(_1303)) >> uint(2)));
    int _1307 = int(_1303) & 3;
    float _1309 = (*spvDescriptorSet0.cp_c3)._m0[int(_1305)][_1307];
    int _1311 = int(_1303) + 1;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    int _1315 = _1311 & 3;
    float _1317 = (*spvDescriptorSet0.cp_c3)._m0[int(_1313)][_1315];
    float _1319 = fma(_175, _1309, _1299);
    float _1321 = _1319 + _1317;
    int _1323 = _1215 + 9936;
    uint _1325 = uint(int(uint(_1323) >> uint(2)));
    uint _1327 = uint(int(uint(int(_1325)) >> uint(2)));
    int _1329 = int(_1325) & 3;
    float _1331 = (*spvDescriptorSet0.cp_c3)._m0[int(_1327)][_1329];
    int _1333 = int(_1325) + 1;
    uint _1335 = uint(int(uint(_1333) >> uint(2)));
    int _1337 = _1333 & 3;
    float _1339 = (*spvDescriptorSet0.cp_c3)._m0[int(_1335)][_1337];
    float _1341 = _215 * _1339;
    float _1343 = fma(_237, _1331, _1341);
    int _1345 = _1215 + 9944;
    uint _1347 = uint(int(uint(_1345) >> uint(2)));
    uint _1349 = uint(int(uint(int(_1347)) >> uint(2)));
    int _1351 = int(_1347) & 3;
    float _1353 = (*spvDescriptorSet0.cp_c3)._m0[int(_1349)][_1351];
    int _1355 = int(_1347) + 1;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    int _1359 = _1355 & 3;
    float _1361 = (*spvDescriptorSet0.cp_c3)._m0[int(_1357)][_1359];
    float _1363 = fma(_175, _1353, _1343);
    float _1365 = _1363 + _1361;
    int _1367 = _1215 + 9952;
    uint _1369 = uint(int(uint(_1367) >> uint(2)));
    uint _1371 = uint(int(uint(int(_1369)) >> uint(2)));
    int _1373 = int(_1369) & 3;
    float _1375 = (*spvDescriptorSet0.cp_c3)._m0[int(_1371)][_1373];
    int _1377 = int(_1369) + 1;
    uint _1379 = uint(int(uint(_1377) >> uint(2)));
    int _1381 = _1377 & 3;
    float _1383 = (*spvDescriptorSet0.cp_c3)._m0[int(_1379)][_1381];
    float _1385 = _215 * _1383;
    float _1387 = fma(_237, _1375, _1385);
    int _1389 = _1215 + 9960;
    uint _1391 = uint(int(uint(_1389) >> uint(2)));
    uint _1393 = uint(int(uint(int(_1391)) >> uint(2)));
    int _1395 = int(_1391) & 3;
    float _1397 = (*spvDescriptorSet0.cp_c3)._m0[int(_1393)][_1395];
    int _1399 = int(_1391) + 1;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    int _1403 = _1399 & 3;
    float _1405 = (*spvDescriptorSet0.cp_c3)._m0[int(_1401)][_1403];
    float _1407 = fma(_175, _1397, _1387);
    float _1409 = _1407 + _1405;
    float _1411 = 1.0 / _1409;
    float _1413 = _1321 * _1411;
    int _1415 = _1251 << 6;
    float _1417 = _1277 * _1411;
    float _1419 = _1365 * _1411;
    float _1421 = _1365;
    float _1423 = as_type<float>(_1415);
    if (!_737)
    {
        _1421 = 1.0;
    }
    float _1425 = _1421;
    int _1427 = _1415 + 9904;
    uint _1429 = uint(int(uint(_1427) >> uint(2)));
    uint _1431 = uint(int(uint(int(_1429)) >> uint(2)));
    int _1433 = int(_1429) & 3;
    float _1435 = (*spvDescriptorSet0.cp_c3)._m0[int(_1431)][_1433];
    int _1437 = int(_1429) + 1;
    uint _1439 = uint(int(uint(_1437) >> uint(2)));
    int _1441 = _1437 & 3;
    float _1443 = (*spvDescriptorSet0.cp_c3)._m0[int(_1439)][_1441];
    float _1445 = _1425;
    int _1447 = _861;
    if (_737)
    {
        bool _1449 = as_type<float>(_861) >= _801;
        bool _1451 = isnan(as_type<float>(_861));
        bool _1453 = _1449 || _1451;
        bool _1455 = isnan(_801);
        bool _1457 = _1453 || _1455;
        float _1459 = float(_1457);
        _1445 = _1459;
    }
    float _1461 = _1445;
    if (!_981)
    {
        int _1463 = _1011 << 2;
        _805 = _1463;
    }
    int _1465 = _805;
    int _1467 = _1465;
    if (!_981)
    {
        uint _1469 = uint(int(uint(_1011) >> uint(2)));
        _1447 = int(_1469);
    }
    int _1471 = _1447;
    if (!_981)
    {
        int _1473 = 12 & _1465;
        _1467 = _1473;
    }
    int _1475 = _1467;
    bool _1477 = _1177 >= 0.0;
    bool _1479 = _1417 >= 0.0;
    bool _1481 = _1177 <= 1.0;
    bool _1483 = _1481 && _1477;
    bool _1485 = _1417 <= 1.0;
    bool _1487 = _1485 && _1479;
    bool _1489 = _1173 >= 0.0;
    bool _1491 = _1489 && _1483;
    bool _1493 = _1413 >= 0.0;
    bool _1495 = _1493 && _1487;
    bool _1497 = _1173 <= 1.0;
    bool _1499 = _1497 && _1491;
    bool _1501 = _1413 <= 1.0;
    bool _1503 = _1501 && _1495;
    if (_1499)
    {
        float _1505 = float(_961);
        _1005 = _1505;
    }
    float _1507 = _1005;
    float _1509 = _1507;
    if (_1503)
    {
        float _1511 = float(_1209);
        _1245 = _1511;
    }
    float _1513 = _1245;
    float _1515 = _1513;
    if (_1499)
    {
        float _1517 = rint(_1507);
        float _1519 = precise::max(_1517, 0.0);
        uint _1521 = uint(_1519);
        uint _1523 = clamp(_1521, 0u, 65535u);
        _1509 = as_type<float>(_1523);
    }
    float _1525 = _1509;
    float _1527 = _427 * _1443;
    if (_1503)
    {
        float _1529 = rint(_1513);
        float _1531 = precise::max(_1529, 0.0);
        uint _1533 = uint(_1531);
        uint _1535 = clamp(_1533, 0u, 65535u);
        _1515 = as_type<float>(_1535);
    }
    float _1537 = _1515;
    float _1539 = fma(_237, _1435, _1527);
    int _1541 = _1415 + 9912;
    uint _1543 = uint(int(uint(_1541) >> uint(2)));
    uint _1545 = uint(int(uint(int(_1543)) >> uint(2)));
    int _1547 = int(_1543) & 3;
    float _1549 = (*spvDescriptorSet0.cp_c3)._m0[int(_1545)][_1547];
    int _1551 = int(_1543) + 1;
    uint _1553 = uint(int(uint(_1551) >> uint(2)));
    int _1555 = _1551 & 3;
    float _1557 = (*spvDescriptorSet0.cp_c3)._m0[int(_1553)][_1555];
    float _1559 = fma(_185, _1549, _1539);
    float _1561 = _1559 + _1557;
    int _1563 = _1415 + 9920;
    uint _1565 = uint(int(uint(_1563) >> uint(2)));
    uint _1567 = uint(int(uint(int(_1565)) >> uint(2)));
    int _1569 = int(_1565) & 3;
    float _1571 = (*spvDescriptorSet0.cp_c3)._m0[int(_1567)][_1569];
    int _1573 = int(_1565) + 1;
    uint _1575 = uint(int(uint(_1573) >> uint(2)));
    int _1577 = _1573 & 3;
    float _1579 = (*spvDescriptorSet0.cp_c3)._m0[int(_1575)][_1577];
    float _1581 = _427 * _1579;
    float _1583 = fma(_237, _1571, _1581);
    int _1585 = _1415 + 9928;
    uint _1587 = uint(int(uint(_1585) >> uint(2)));
    uint _1589 = uint(int(uint(int(_1587)) >> uint(2)));
    int _1591 = int(_1587) & 3;
    float _1593 = (*spvDescriptorSet0.cp_c3)._m0[int(_1589)][_1591];
    int _1595 = int(_1587) + 1;
    uint _1597 = uint(int(uint(_1595) >> uint(2)));
    int _1599 = _1595 & 3;
    float _1601 = (*spvDescriptorSet0.cp_c3)._m0[int(_1597)][_1599];
    float _1603 = fma(_185, _1593, _1583);
    float _1605 = _1603 + _1601;
    int _1607 = _1415 + 9936;
    uint _1609 = uint(int(uint(_1607) >> uint(2)));
    uint _1611 = uint(int(uint(int(_1609)) >> uint(2)));
    int _1613 = int(_1609) & 3;
    float _1615 = (*spvDescriptorSet0.cp_c3)._m0[int(_1611)][_1613];
    int _1617 = int(_1609) + 1;
    uint _1619 = uint(int(uint(_1617) >> uint(2)));
    int _1621 = _1617 & 3;
    float _1623 = (*spvDescriptorSet0.cp_c3)._m0[int(_1619)][_1621];
    float _1625 = _427 * _1623;
    float _1627 = fma(_237, _1615, _1625);
    int _1629 = _1415 + 9944;
    uint _1631 = uint(int(uint(_1629) >> uint(2)));
    uint _1633 = uint(int(uint(int(_1631)) >> uint(2)));
    int _1635 = int(_1631) & 3;
    float _1637 = (*spvDescriptorSet0.cp_c3)._m0[int(_1633)][_1635];
    int _1639 = int(_1631) + 1;
    uint _1641 = uint(int(uint(_1639) >> uint(2)));
    int _1643 = _1639 & 3;
    float _1645 = (*spvDescriptorSet0.cp_c3)._m0[int(_1641)][_1643];
    float _1647 = fma(_185, _1637, _1627);
    float _1649 = _1647 + _1645;
    int _1651 = _1415 + 9952;
    uint _1653 = uint(int(uint(_1651) >> uint(2)));
    uint _1655 = uint(int(uint(int(_1653)) >> uint(2)));
    int _1657 = int(_1653) & 3;
    float _1659 = (*spvDescriptorSet0.cp_c3)._m0[int(_1655)][_1657];
    int _1661 = int(_1653) + 1;
    uint _1663 = uint(int(uint(_1661) >> uint(2)));
    int _1665 = _1661 & 3;
    float _1667 = (*spvDescriptorSet0.cp_c3)._m0[int(_1663)][_1665];
    float _1669 = _427 * _1667;
    float _1671 = fma(_237, _1659, _1669);
    int _1673 = _1415 + 9960;
    uint _1675 = uint(int(uint(_1673) >> uint(2)));
    uint _1677 = uint(int(uint(int(_1675)) >> uint(2)));
    int _1679 = int(_1675) & 3;
    float _1681 = (*spvDescriptorSet0.cp_c3)._m0[int(_1677)][_1679];
    int _1683 = int(_1675) + 1;
    uint _1685 = uint(int(uint(_1683) >> uint(2)));
    int _1687 = _1683 & 3;
    float _1689 = (*spvDescriptorSet0.cp_c3)._m0[int(_1685)][_1687];
    int _1691 = as_type<int>(_1671);
    float _1693 = _1649;
    if (!_981)
    {
        float _1695 = floor(_901);
        _1423 = _1695;
    }
    float _1697 = _1423;
    float _1699 = fma(_185, _1681, _1671);
    float _1701 = _1697;
    if (!_981)
    {
        int _1703 = _1471 << 4;
        int _1705 = _1703 + _1475;
        _1691 = _1705;
    }
    int _1707 = _1691;
    float _1709 = _1699 + _1689;
    float _1711 = 1.0 / _1709;
    float _1713 = _1561 * _1711;
    float _1715 = _1605 * _1711;
    float _1717 = _1561;
    float _1719 = _1711;
    if (!_981)
    {
        int _1721 = _1707 + 256;
        uint _1723 = uint(int(uint(_1721) >> uint(2)));
        uint _1725 = uint(int(uint(int(_1723)) >> uint(2)));
        int _1727 = int(_1723) & 3;
        float _1729 = (*spvDescriptorSet0.cp_c3)._m0[int(_1725)][_1727];
        _1717 = _1729;
    }
    float _1731 = _1717;
    float _1733 = _1649 * _1711;
    float _1735 = _1605;
    if (!_981)
    {
        float _1737 = floor(_899);
        _1735 = _1737;
    }
    float _1739 = _1735;
    bool _1741 = _1713 >= 0.0;
    if (!_981)
    {
        float _1743 = -_1697;
        float _1745 = _901 + _1743;
        _1719 = _1745;
    }
    float _1747 = _1719;
    bool _1749 = _1713 <= 1.0;
    bool _1751 = _1749 && _1741;
    bool _1753 = _1715 >= 0.0;
    bool _1755 = _1753 && _1751;
    bool _1757 = _1715 <= 1.0;
    bool _1759 = _1757 && _1755;
    if (!_981)
    {
        float _1761 = -_1739;
        float _1763 = _899 + _1761;
        _1701 = _1763;
    }
    float _1765 = _1701;
    if (_1759)
    {
        float _1767 = float(_1251);
        _1693 = _1767;
    }
    float _1769 = _1693;
    float _1771 = _1709;
    if (_1759)
    {
        float _1773 = rint(_1769);
        float _1775 = precise::max(_1773, 0.0);
        uint _1777 = uint(_1775);
        uint _1779 = clamp(_1777, 0u, 65535u);
        _1771 = as_type<float>(_1779);
    }
    float _1781 = _1771;
    float _1783 = _1173;
    if (_1499)
    {
        float3 _5369 = float3(_1177, _1173, float(as_type<int>(_1525)));
        float3 _5371 = select(_5369, float3(0.0), isnan(_5369));
        float _1785 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _5371.xy, uint(rint(_5371.z)), _1179, level(0.0));
        _1783 = _1785;
    }
    float _1787 = _1783;
    float _1789 = _1413;
    if (_1503)
    {
        float3 _5386 = float3(_1417, _1413, float(as_type<int>(_1537)));
        float3 _5388 = select(_5386, float3(0.0), isnan(_5386));
        float _1791 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _5388.xy, uint(rint(_5388.z)), _1419, level(0.0));
        _1789 = _1791;
    }
    float _1793 = _1789;
    float _1795 = as_type<float>(_1251);
    if (!_981)
    {
        float _1797 = rint(_1731);
        float _1799 = precise::max(_1797, 0.0);
        uint _1801 = uint(_1799);
        uint _1803 = clamp(_1801, 0u, 65535u);
        _1795 = as_type<float>(_1803);
    }
    float _1805 = _1795;
    float _1807 = _1781;
    if (_1759)
    {
        float3 _5420 = float3(_1713, _1715, float(as_type<int>(_1781)));
        float3 _5422 = select(_5420, float3(0.0), isnan(_5420));
        float _1809 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _5422.xy, uint(rint(_5422.z)), _1733, level(0.0));
        _1807 = _1809;
    }
    float _1811 = _1807;
    float _1813 = _1765;
    if (!_981)
    {
        float3 _5438 = float3(_1765, _1747, float(as_type<int>(_1805)));
        float3 _5440 = select(_5438, float3(0.0), isnan(_5438));
        float _1815 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _5440.xy, uint(rint(_5440.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _5440.xy, uint(rint(_5440.z)), level(0.0)).x;
        _1813 = _1815;
    }
    float _1817 = _1813;
    int _1819 = _963 + 2;
    float _1821 = _161 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
    int _1823 = _963 << 2;
    int _1825 = _1819 << 2;
    float _1827 = fma(_309, (*spvDescriptorSet0.cp_c3)._m0[5].y, _1821);
    uint _1829 = uint(int(uint(_963) >> uint(5)));
    float _1831 = _161 * (*spvDescriptorSet0.cp_c3)._m0[6].x;
    int _1833 = 124 & _1823;
    float _1835 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[5].z, _1827);
    uint _1837 = uint(int(uint(_1819) >> uint(5)));
    float _1839 = _161 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    int _1841 = 124 & _1825;
    float _1843 = fma(_309, (*spvDescriptorSet0.cp_c3)._m0[6].y, _1831);
    int _1845 = _963 + 3;
    int _1847 = int(_1829) * 896;
    int _1849 = _1847 + _1833;
    float _1851 = _1835 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    int _1853 = int(_1837) * 896;
    int _1855 = _1853 + _1841;
    int _1857 = _1845 << 2;
    float _1859 = fma(_309, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1839);
    float _1861 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[6].z, _1843);
    uint _1863 = uint(int(uint(_1845) >> uint(5)));
    int _1865 = _1849 + 272;
    uint _1867 = uint(int(uint(_1865) >> uint(2)));
    _29[int(_1867)] = as_type<uint>(_1851);
    int _1869 = 124 & _1857;
    float _1871 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1859);
    float _1873 = fma(_179, (*spvDescriptorSet0.cp_c3)._m0[5].y, _1821);
    float _1875 = _237 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _1877 = fma(_179, (*spvDescriptorSet0.cp_c3)._m0[6].y, _1831);
    float _1879 = fma(_179, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1839);
    float _1881 = fma(_185, (*spvDescriptorSet0.cp_c3)._m0[5].z, _1873);
    float _1883 = _237 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _1885 = fma(_185, (*spvDescriptorSet0.cp_c3)._m0[6].z, _1877);
    float _1887 = _1861 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    int _1889 = int(_1863) * 896;
    int _1891 = _1889 + _1869;
    float _1893 = _1871 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    float _1895 = _161 * (*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _1897 = fma(_185, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1879);
    int _1899 = _1849 + 400;
    uint _1901 = uint(int(uint(_1899) >> uint(2)));
    _29[int(_1901)] = as_type<uint>(_1887);
    float _1903 = _1881 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    float _1905 = fma(_309, (*spvDescriptorSet0.cp_c3)._m0[8].y, _1895);
    float _1907 = fma(_179, (*spvDescriptorSet0.cp_c3)._m0[8].y, _1895);
    int _1909 = _1849 + 528;
    uint _1911 = uint(int(uint(_1909) >> uint(2)));
    _29[int(_1911)] = as_type<uint>(_1893);
    float _1913 = _1885 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    float _1915 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[8].z, _1905);
    float _1917 = fma(_185, (*spvDescriptorSet0.cp_c3)._m0[8].z, _1907);
    float _1919 = _1897 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    float _1921 = _237 * (*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _1923 = _1915 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _1925 = _1917 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _1927 = fma(_215, (*spvDescriptorSet0.cp_c3)._m0[5].y, _1883);
    float _1929 = fma(_215, (*spvDescriptorSet0.cp_c3)._m0[6].y, _1921);
    int _1931 = _1849 + 656;
    uint _1933 = uint(int(uint(_1931) >> uint(2)));
    _29[int(_1933)] = as_type<uint>(_1923);
    float _1935 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[5].z, _1927);
    float _1937 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[6].z, _1929);
    int _1939 = _985 + 272;
    uint _1941 = uint(int(uint(_1939) >> uint(2)));
    _29[int(_1941)] = as_type<uint>(_1903);
    float _1943 = _1935 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    float _1945 = _1937 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    int _1947 = _985 + 400;
    uint _1949 = uint(int(uint(_1947) >> uint(2)));
    _29[int(_1949)] = as_type<uint>(_1913);
    float _1951 = fma(_215, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1875);
    float _1953 = fma(_427, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1875);
    int _1955 = _985 + 528;
    uint _1957 = uint(int(uint(_1955) >> uint(2)));
    _29[int(_1957)] = as_type<uint>(_1919);
    float _1959 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1951);
    float _1961 = fma(_185, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1953);
    int _1963 = _985 + 656;
    uint _1965 = uint(int(uint(_1963) >> uint(2)));
    _29[int(_1965)] = as_type<uint>(_1925);
    float _1967 = _1959 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    float _1969 = _237 * (*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _1971 = fma(_427, (*spvDescriptorSet0.cp_c3)._m0[5].y, _1883);
    int _1973 = _1855 + 272;
    uint _1975 = uint(int(uint(_1973) >> uint(2)));
    _29[int(_1975)] = as_type<uint>(_1943);
    float _1977 = fma(_427, (*spvDescriptorSet0.cp_c3)._m0[6].y, _1921);
    float _1979 = _1961 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    float _1981 = fma(_185, (*spvDescriptorSet0.cp_c3)._m0[5].z, _1971);
    int _1983 = _1855 + 400;
    uint _1985 = uint(int(uint(_1983) >> uint(2)));
    _29[int(_1985)] = as_type<uint>(_1945);
    float _1987 = fma(_215, (*spvDescriptorSet0.cp_c3)._m0[8].y, _1969);
    float _1989 = fma(_427, (*spvDescriptorSet0.cp_c3)._m0[8].y, _1969);
    float _1991 = fma(_185, (*spvDescriptorSet0.cp_c3)._m0[6].z, _1977);
    float _1993 = _1981 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    float _1995 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[8].z, _1987);
    float _1997 = fma(_185, (*spvDescriptorSet0.cp_c3)._m0[8].z, _1989);
    float _1999 = _1991 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    int _2001 = _1855 + 528;
    uint _2003 = uint(int(uint(_2001) >> uint(2)));
    _29[int(_2003)] = as_type<uint>(_1967);
    float _2005 = _1995 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _2007 = _1997 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _2009 = _1995;
    float _2011 = _1967;
    if (_981)
    {
        _2009 = 1.0;
    }
    float _2013 = _2009;
    int _2015 = _1855 + 656;
    uint _2017 = uint(int(uint(_2015) >> uint(2)));
    _29[int(_2017)] = as_type<uint>(_2005);
    int _2019 = _1891 + 272;
    uint _2021 = uint(int(uint(_2019) >> uint(2)));
    _29[int(_2021)] = as_type<uint>(_1993);
    float _2023 = _2013;
    if (!_1499)
    {
        _2011 = 1.0;
    }
    float _2025 = _2011;
    int _2027 = _1891 + 400;
    uint _2029 = uint(int(uint(_2027) >> uint(2)));
    _29[int(_2029)] = as_type<uint>(_1999);
    int _2031 = _1891 + 528;
    uint _2033 = uint(int(uint(_2031) >> uint(2)));
    _29[int(_2033)] = as_type<uint>(_1979);
    int _2035 = _1891 + 656;
    uint _2037 = uint(int(uint(_2035) >> uint(2)));
    _29[int(_2037)] = as_type<uint>(_2007);
    float _2039 = _2025;
    if (!_981)
    {
        int _2041 = _1011 << 4;
        int _2043 = _2041 + 1904;
        uint _2045 = uint(int(uint(_2043) >> uint(2)));
        uint _2047 = uint(int(uint(int(_2045)) >> uint(2)));
        int _2049 = int(_2045) & 3;
        float _2051 = (*spvDescriptorSet0.cp_c3)._m0[int(_2047)][_2049];
        int _2053 = int(_2045) + 1;
        uint _2055 = uint(int(uint(_2053) >> uint(2)));
        int _2057 = _2053 & 3;
        float _2059 = (*spvDescriptorSet0.cp_c3)._m0[int(_2055)][_2057];
        int _2061 = _2043 + 8;
        uint _2063 = uint(int(uint(_2061) >> uint(2)));
        uint _2065 = uint(int(uint(int(_2063)) >> uint(2)));
        int _2067 = int(_2063) & 3;
        float _2069 = (*spvDescriptorSet0.cp_c3)._m0[int(_2065)][_2067];
        int _2071 = int(_2063) + 1;
        uint _2073 = uint(int(uint(_2071) >> uint(2)));
        int _2075 = _2071 & 3;
        float _2077 = (*spvDescriptorSet0.cp_c3)._m0[int(_2073)][_2075];
        float _2079 = _309 * _2059;
        float _2081 = fma(_161, _2051, _2079);
        float _2083 = fma(_175, _2069, _2081);
        float _2085 = _2083 + _2077;
        float _2087 = precise::clamp(_2085, 0.0, 1.0);
        float _2089 = -_2087;
        float _2091 = _2089 + _1817;
        float _2093 = fma(_2091, 500.0, 1.5);
        float _2095 = exp2(_2093);
        float _2097 = 0.0 + _2095;
        float _2099 = precise::clamp(_2097, 0.0, 1.0);
        _2023 = _2099;
    }
    float _2101 = _2023;
    int _2103 = _77 + 1;
    float _2105 = _1461 * _2101;
    if (_1499)
    {
        bool _2107 = _1787 >= _1179;
        bool _2109 = isnan(_1787);
        bool _2111 = _2107 || _2109;
        bool _2113 = isnan(_1179);
        bool _2115 = _2111 || _2113;
        float _2117 = float(_2115);
        _2039 = _2117;
    }
    float _2119 = _2039;
    int _2121 = _83 + 1;
    if (_369)
    {
        _153 = 1.0;
    }
    float _2123 = _153;
    float _2125 = _2123;
    if (!_369)
    {
        int _2127 = int(_407) << 4;
        int _2129 = _2127 + 1904;
        uint _2131 = uint(int(uint(_2129) >> uint(2)));
        uint _2133 = uint(int(uint(int(_2131)) >> uint(2)));
        int _2135 = int(_2131) & 3;
        float _2137 = (*spvDescriptorSet0.cp_c3)._m0[int(_2133)][_2135];
        int _2139 = int(_2131) + 1;
        uint _2141 = uint(int(uint(_2139) >> uint(2)));
        int _2143 = _2139 & 3;
        float _2145 = (*spvDescriptorSet0.cp_c3)._m0[int(_2141)][_2143];
        int _2147 = _2129 + 8;
        uint _2149 = uint(int(uint(_2147) >> uint(2)));
        uint _2151 = uint(int(uint(int(_2149)) >> uint(2)));
        int _2153 = int(_2149) & 3;
        float _2155 = (*spvDescriptorSet0.cp_c3)._m0[int(_2151)][_2153];
        int _2157 = int(_2149) + 1;
        uint _2159 = uint(int(uint(_2157) >> uint(2)));
        int _2161 = _2157 & 3;
        float _2163 = (*spvDescriptorSet0.cp_c3)._m0[int(_2159)][_2161];
        float _2165 = _179 * _2145;
        float _2167 = fma(_161, _2137, _2165);
        float _2169 = fma(_185, _2155, _2167);
        float _2171 = _2169 + _2163;
        float _2173 = precise::clamp(_2171, 0.0, 1.0);
        float _2175 = -_2173;
        float _2177 = _2175 + _867;
        float _2179 = fma(_2177, 500.0, 1.5);
        float _2181 = exp2(_2179);
        float _2183 = 0.0 + _2181;
        float _2185 = precise::clamp(_2183, 0.0, 1.0);
        _2125 = _2185;
        _413 = _2145;
    }
    float _2187 = _2125;
    float _2189 = _413;
    float _2191 = float(uint(_2121));
    float _2193 = _157 * 0.03125;
    float _2195 = float(uint(_2103));
    float _2197 = _165 * 0.03125;
    float _2199 = _2119 * _2187;
    float _2201 = _2191 * 0.03125;
    int _2203 = _1849 + 784;
    uint _2205 = uint(int(uint(_2203) >> uint(2)));
    _29[int(_2205)] = as_type<uint>(_2193);
    float _2207 = _2195 * 0.03125;
    float _2209 = _2189;
    float _2211 = _2197;
    float _2213 = _2193;
    if (!_1503)
    {
        _229 = 1.0;
    }
    float _2215 = _229;
    int _2217 = _1849 + 912;
    uint _2219 = uint(int(uint(_2217) >> uint(2)));
    _29[int(_2219)] = as_type<uint>(_2197);
    float _2221 = _2215;
    if (_1503)
    {
        bool _2223 = _1793 >= _1419;
        bool _2225 = isnan(_1793);
        bool _2227 = _2223 || _2225;
        bool _2229 = isnan(_1419);
        bool _2231 = _2227 || _2229;
        float _2233 = float(_2231);
        _2221 = _2233;
    }
    float _2235 = _2221;
    if (_421)
    {
        _2209 = 1.0;
    }
    float _2237 = _2209;
    int _2239 = _1849 + 1040;
    uint _2241 = uint(int(uint(_2239) >> uint(2)));
    _29[int(_2241)] = as_type<uint>(_2105);
    int _2243 = _985 + 784;
    uint _2245 = uint(int(uint(_2243) >> uint(2)));
    _29[int(_2245)] = as_type<uint>(_2193);
    int _2247 = _985 + 912;
    uint _2249 = uint(int(uint(_2247) >> uint(2)));
    _29[int(_2249)] = as_type<uint>(_2201);
    int _2251 = _985 + 1040;
    uint _2253 = uint(int(uint(_2251) >> uint(2)));
    _29[int(_2253)] = as_type<uint>(_2199);
    int _2255 = _1855 + 784;
    uint _2257 = uint(int(uint(_2255) >> uint(2)));
    _29[int(_2257)] = as_type<uint>(_2207);
    int _2259 = _1855 + 912;
    uint _2261 = uint(int(uint(_2259) >> uint(2)));
    _29[int(_2261)] = as_type<uint>(_2197);
    float _2263 = _2237;
    if (!_421)
    {
        int _2265 = _449 << 4;
        int _2267 = _2265 + 1904;
        uint _2269 = uint(int(uint(_2267) >> uint(2)));
        uint _2271 = uint(int(uint(int(_2269)) >> uint(2)));
        int _2273 = int(_2269) & 3;
        float _2275 = (*spvDescriptorSet0.cp_c3)._m0[int(_2271)][_2273];
        int _2277 = int(_2269) + 1;
        uint _2279 = uint(int(uint(_2277) >> uint(2)));
        int _2281 = _2277 & 3;
        float _2283 = (*spvDescriptorSet0.cp_c3)._m0[int(_2279)][_2281];
        int _2285 = _2267 + 8;
        uint _2287 = uint(int(uint(_2285) >> uint(2)));
        uint _2289 = uint(int(uint(int(_2287)) >> uint(2)));
        int _2291 = int(_2287) & 3;
        float _2293 = (*spvDescriptorSet0.cp_c3)._m0[int(_2289)][_2291];
        int _2295 = int(_2287) + 1;
        uint _2297 = uint(int(uint(_2295) >> uint(2)));
        int _2299 = _2295 & 3;
        float _2301 = (*spvDescriptorSet0.cp_c3)._m0[int(_2297)][_2299];
        float _2303 = _215 * _2283;
        float _2305 = fma(_237, _2275, _2303);
        float _2307 = fma(_175, _2293, _2305);
        float _2309 = _2307 + _2301;
        float _2311 = precise::clamp(_2309, 0.0, 1.0);
        float _2313 = -_2311;
        float _2315 = _2313 + _873;
        float _2317 = fma(_2315, 500.0, 1.5);
        float _2319 = exp2(_2317);
        float _2321 = 0.0 + _2319;
        float _2323 = precise::clamp(_2321, 0.0, 1.0);
        _2263 = _2323;
        _2211 = 500.0;
        _2213 = _2319;
    }
    float _2325 = _2263;
    float _2327 = _2211;
    float _2329 = _2213;
    float _2331 = _2327;
    float _2333 = _2329;
    if (!_1759)
    {
        _2331 = 1.0;
    }
    float _2335 = _2331;
    float _2337 = _2335;
    if (_627)
    {
        _2333 = 1.0;
    }
    float _2339 = _2333;
    float _2341 = _2339;
    if (!_627)
    {
        int _2343 = _637 << 4;
        int _2345 = _2343 + 1904;
        uint _2347 = uint(int(uint(_2345) >> uint(2)));
        uint _2349 = uint(int(uint(int(_2347)) >> uint(2)));
        int _2351 = int(_2347) & 3;
        float _2353 = (*spvDescriptorSet0.cp_c3)._m0[int(_2349)][_2351];
        int _2355 = int(_2347) + 1;
        uint _2357 = uint(int(uint(_2355) >> uint(2)));
        int _2359 = _2355 & 3;
        float _2361 = (*spvDescriptorSet0.cp_c3)._m0[int(_2357)][_2359];
        int _2363 = _2345 + 8;
        uint _2365 = uint(int(uint(_2363) >> uint(2)));
        uint _2367 = uint(int(uint(int(_2365)) >> uint(2)));
        int _2369 = int(_2365) & 3;
        float _2371 = (*spvDescriptorSet0.cp_c3)._m0[int(_2367)][_2369];
        int _2373 = int(_2365) + 1;
        uint _2375 = uint(int(uint(_2373) >> uint(2)));
        int _2377 = _2373 & 3;
        float _2379 = (*spvDescriptorSet0.cp_c3)._m0[int(_2375)][_2377];
        float _2381 = _427 * _2361;
        float _2383 = fma(_237, _2353, _2381);
        float _2385 = fma(_185, _2371, _2383);
        float _2387 = _2385 + _2379;
        float _2389 = precise::clamp(_2387, 0.0, 1.0);
        float _2391 = -_2389;
        float _2393 = _2391 + _879;
        float _2395 = fma(_2393, 500.0, 1.5);
        float _2397 = exp2(_2395);
        float _2399 = 0.0 + _2397;
        float _2401 = precise::clamp(_2399, 0.0, 1.0);
        _2341 = _2401;
    }
    float _2403 = _2341;
    uint _2405 = spvSubgroupBallot(true).x;
    if (_1759)
    {
        bool _2407 = _1811 >= _1733;
        bool _2409 = isnan(_1811);
        bool _2411 = _2407 || _2409;
        bool _2413 = isnan(_1733);
        bool _2415 = _2411 || _2413;
        float _2417 = float(_2415);
        _2337 = _2417;
    }
    float _2419 = _2337;
    int _2421 = reverse_bits(int(_2405));
    float _2423 = _2235 * _2325;
    int _2425 = _963 & 255;
    int _2427 = _933 * 6;
    int _2429 = int(spvFindUMSB(uint(_2421)));
    bool _2431 = _2429 != (-1);
    int _2433 = _2429 ^ 31;
    int _2435 = _2431 ? _2433 : _2429;
    float _2437 = _2419 * _2403;
    int _2439 = _1855 + 1040;
    uint _2441 = uint(int(uint(_2439) >> uint(2)));
    _29[int(_2441)] = as_type<uint>(_2423);
    int _2443 = _2425 + 1;
    int _2445 = _2425 + 2;
    int _2447 = _1891 + 784;
    uint _2449 = uint(int(uint(_2447) >> uint(2)));
    _29[int(_2449)] = as_type<uint>(_2207);
    bool _2451 = as_type<int>(_60) != _2435;
    int _2453 = popcount(int(_151));
    int _2455 = _1891 + 912;
    uint _2457 = uint(int(uint(_2455) >> uint(2)));
    _29[int(_2457)] = as_type<uint>(_2201);
    int _2459 = _2425 + 3;
    int _2461 = _1891 + 1040;
    uint _2463 = uint(int(uint(_2461) >> uint(2)));
    _29[int(_2463)] = as_type<uint>(_2437);
    int _2465 = _2427 + 3860;
    int _2467 = _2465;
    int _2469 = _2425;
    _52(_2467, _2469, _29);
    int _2471 = _2427 + 3861;
    int _2473 = _2471;
    int _2475 = _2443;
    _52(_2473, _2475, _29);
    int _2477 = _2427 + 3862;
    int _2479 = _2477;
    int _2481 = _2445;
    _52(_2479, _2481, _29);
    int _2483 = _2427 + 3863;
    int _2485 = _2483;
    int _2487 = _2443;
    _52(_2485, _2487, _29);
    int _2489 = _2427 + 3864;
    int _2491 = _2489;
    int _2493 = _2459;
    _52(_2491, _2493, _29);
    int _2495 = _2427 + 3865;
    int _2497 = _2495;
    int _2499 = _2445;
    _52(_2497, _2499, _29);
    if (_2451)
    {
        return;
    }
    int _2501 = _2453 << 1;
    int _2503 = 3859;
    int _2505 = _2501;
    _52(_2503, _2505, _29);
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
