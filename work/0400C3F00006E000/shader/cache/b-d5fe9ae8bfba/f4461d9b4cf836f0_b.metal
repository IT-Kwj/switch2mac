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
void _52(thread const int& _6773, thread const int& _6774, threadgroup spvUnsafeArray<uint, 1141>& _29)
{
    uint _6777 = uint(int(uint(_6773) >> uint(2)));
    int _6779 = _6773 & 3;
    int _6781 = _6779 << 3;
    bool _6783;
    do
    {
        float _6785 = as_type<float>(_29[int(_6777)]);
        int _6787 = int(insert_bits(as_type<uint>(_6785), uint(_6774), uint(_6781), 8u));
        uint _6817 = as_type<uint>(_6785);
        uint _6822;
        do
        {
            _6822 = _6817;
        } while (!atomic_compare_exchange_weak_explicit((threadgroup atomic_uint*)&_29[int(_6777)], &_6822, uint(_6787), memory_order_relaxed, memory_order_relaxed) && _6822 == _6817);
        uint _6789 = _6822;
        _6783 = int(_6789) != as_type<int>(_6785);
    } while (_6783);
}

static inline __attribute__((always_inline)) void dm_stage_body(constant spvDescriptorSetBuffer0& spvDescriptorSet0, uint gl_SubgroupInvocationID, threadgroup spvUnsafeArray<uint, 1141>& _29)
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
    if (!_149)
    {
        return;
    }
    float _153 = float(as_type<int>((*spvDescriptorSet0.cp_c3)._m0[3].z));
    float _155 = float(uint(_77));
    float _157 = float(as_type<uint>(_113));
    float _159 = fma(_155, 2.0, _153);
    float _161 = float(as_type<int>((*spvDescriptorSet0.cp_c3)._m0[3].w));
    float _163 = float(uint(_83));
    float _165 = fma(_157, 9.9999997473787516355514526367188e-05, 1.10000002384185791015625);
    float _167 = _159 * (*spvDescriptorSet0.cp_c3)._m0[14].x;
    float _169 = float(as_type<uint>(_123));
    float _171 = _159 * (*spvDescriptorSet0.cp_c3)._m0[117].x;
    float _173 = fma(_163, 2.0, _161);
    float _175 = fma(_165, (*spvDescriptorSet0.cp_c3)._m0[14].y, _167);
    float _177 = _159 * (*spvDescriptorSet0.cp_c3)._m0[118].x;
    float _179 = float(as_type<uint>(_119));
    float _181 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[14].z, _175);
    float _183 = _173 + 2.0;
    float _185 = float(as_type<uint>(_127));
    float _187 = _181 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _189 = -_187;
    bool _191 = _189 > (*spvDescriptorSet0.cp_c3)._m0[631].y;
    float _193 = -_187;
    bool _195 = _193 > (*spvDescriptorSet0.cp_c3)._m0[631].x;
    float _197 = fma(_169, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    bool _199 = !_191;
    int _201 = _199 ? 0 : 1;
    float _203 = fma(_197, (*spvDescriptorSet0.cp_c3)._m0[117].y, _171);
    float _205 = fma(_197, (*spvDescriptorSet0.cp_c3)._m0[118].y, _177);
    float _207 = fma(_183, (*spvDescriptorSet0.cp_c3)._m0[117].z, _203);
    float _209 = fma(_179, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    int _211 = 2;
    int _213 = as_type<int>(_157);
    float _215 = _163;
    if (!_191)
    {
        _211 = 1;
    }
    int _217 = _211;
    float _219 = fma(_183, (*spvDescriptorSet0.cp_c3)._m0[118].z, _205);
    int _221 = _217;
    if (!_195)
    {
        _221 = _201;
    }
    int _223 = _221;
    float _225 = _159 + 2.0;
    float _227 = _207 + (*spvDescriptorSet0.cp_c3)._m0[117].w;
    float _229 = _219 + (*spvDescriptorSet0.cp_c3)._m0[118].w;
    int _231 = _223 << 6;
    float _233 = _225 * (*spvDescriptorSet0.cp_c3)._m0[117].x;
    float _235 = _225 * (*spvDescriptorSet0.cp_c3)._m0[118].x;
    float _237 = trunc(_227);
    int _239 = int(_237);
    int _241 = _231 + 9904;
    uint _243 = uint(int(uint(_241) >> uint(2)));
    uint _245 = uint(int(uint(int(_243)) >> uint(2)));
    int _247 = int(_243) & 3;
    float _249 = (*spvDescriptorSet0.cp_c3)._m0[int(_245)][_247];
    int _251 = int(_243) + 1;
    uint _253 = uint(int(uint(_251) >> uint(2)));
    int _255 = _251 & 3;
    float _257 = (*spvDescriptorSet0.cp_c3)._m0[int(_253)][_255];
    float _259 = fma(_209, (*spvDescriptorSet0.cp_c3)._m0[117].y, _233);
    float _261 = fma(_209, (*spvDescriptorSet0.cp_c3)._m0[118].y, _235);
    float _263 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[117].z, _259);
    float _265 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[118].z, _261);
    float _267 = trunc(_229);
    int _269 = int(_267);
    int _271 = _231 + 9952;
    uint _273 = uint(int(uint(_271) >> uint(2)));
    uint _275 = uint(int(uint(int(_273)) >> uint(2)));
    int _277 = int(_273) & 3;
    float _279 = (*spvDescriptorSet0.cp_c3)._m0[int(_275)][_277];
    int _281 = int(_273) + 1;
    uint _283 = uint(int(uint(_281) >> uint(2)));
    int _285 = _281 & 3;
    float _287 = (*spvDescriptorSet0.cp_c3)._m0[int(_283)][_285];
    float _289 = _263 + (*spvDescriptorSet0.cp_c3)._m0[117].w;
    float _291 = _265 + (*spvDescriptorSet0.cp_c3)._m0[118].w;
    float _293 = fma(_157, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    float _295 = fma(_185, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    float _297 = trunc(_289);
    int _299 = int(_297);
    int _301 = _231 + 9960;
    uint _303 = uint(int(uint(_301) >> uint(2)));
    uint _305 = uint(int(uint(int(_303)) >> uint(2)));
    int _307 = int(_303) & 3;
    float _309 = (*spvDescriptorSet0.cp_c3)._m0[int(_305)][_307];
    int _311 = int(_303) + 1;
    uint _313 = uint(int(uint(_311) >> uint(2)));
    int _315 = _311 & 3;
    float _317 = (*spvDescriptorSet0.cp_c3)._m0[int(_313)][_315];
    int _319 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].y);
    int _321 = _239 + _319;
    int _323 = _321 + 1;
    bool _325 = _323 >= 0;
    float _327 = trunc(_291);
    int _329 = int(_327);
    int _331 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].z);
    int _333 = _269 + _331;
    int _335 = _333 + 1;
    bool _337 = _323 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _339 = !_325;
    bool _341 = _337 || _339;
    bool _343 = _335 < 0;
    bool _345 = _343 || _341;
    int _347 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].y);
    int _349 = _299 + _347;
    int _351 = _349 + 1;
    bool _353 = _335 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _355 = _353 || _345;
    bool _357 = _351 >= 0;
    int _359 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].z);
    int _361 = _329 + _359;
    int _363 = _361 + 1;
    bool _365 = _351 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _367 = !_357;
    bool _369 = _365 || _367;
    bool _371 = _363 < 0;
    bool _373 = _371 || _369;
    int _375 = _351;
    int _377 = _323;
    int _379 = _335;
    float _381 = _289;
    float _383 = _227;
    float _385 = as_type<float>(_231);
    if (!_355)
    {
        int _387 = _335 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
        int _389 = _387 + _323;
        _213 = _389;
    }
    int _391 = _213;
    float _393 = _293 * _257;
    bool _395 = _363 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _397 = _395 || _373;
    float _399 = 0.0;
    int _401 = as_type<int>(_257);
    if (!_355)
    {
        float _403 = floor(_229);
        _399 = _403;
    }
    float _405 = _399;
    float _407 = fma(_159, _249, _393);
    float _409 = fma(_295, (*spvDescriptorSet0.cp_c3)._m0[117].y, _233);
    int _411 = as_type<int>(_407);
    float _413 = _405;
    if (!_355)
    {
        int _415 = _391 << 2;
        _401 = _415;
    }
    int _417 = _401;
    int _419 = _231 + 9920;
    uint _421 = uint(int(uint(_419) >> uint(2)));
    uint _423 = uint(int(uint(int(_421)) >> uint(2)));
    int _425 = int(_421) & 3;
    float _427 = (*spvDescriptorSet0.cp_c3)._m0[int(_423)][_425];
    int _429 = int(_421) + 1;
    uint _431 = uint(int(uint(_429) >> uint(2)));
    int _433 = _429 & 3;
    float _435 = (*spvDescriptorSet0.cp_c3)._m0[int(_431)][_433];
    float _437 = _293 * _287;
    float _439 = fma(_183, (*spvDescriptorSet0.cp_c3)._m0[117].z, _409);
    int _441 = _417;
    if (!_355)
    {
        int _443 = 12 & _417;
        _441 = _443;
    }
    int _445 = _441;
    float _447 = fma(_159, _279, _437);
    int _449 = 0;
    if (!_355)
    {
        uint _451 = uint(int(uint(_391) >> uint(2)));
        _449 = int(_451);
    }
    int _453 = _449;
    int _455 = _453;
    if (!_397)
    {
        int _457 = _363 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
        int _459 = _457 + _351;
        _375 = _459;
    }
    int _461 = _375;
    float _463 = fma(_173, _309, _447);
    float _465 = fma(_295, (*spvDescriptorSet0.cp_c3)._m0[118].y, _235);
    float _467 = _439 + (*spvDescriptorSet0.cp_c3)._m0[117].w;
    if (!_397)
    {
        int _469 = _461 << 2;
        _377 = _469;
    }
    int _471 = _377;
    int _473 = _231 + 9912;
    uint _475 = uint(int(uint(_473) >> uint(2)));
    uint _477 = uint(int(uint(int(_475)) >> uint(2)));
    int _479 = int(_475) & 3;
    float _481 = (*spvDescriptorSet0.cp_c3)._m0[int(_477)][_479];
    int _483 = int(_475) + 1;
    uint _485 = uint(int(uint(_483) >> uint(2)));
    int _487 = _483 & 3;
    float _489 = (*spvDescriptorSet0.cp_c3)._m0[int(_485)][_487];
    int _491 = _471;
    if (!_397)
    {
        uint _493 = uint(int(uint(_461) >> uint(2)));
        _379 = int(_493);
    }
    int _495 = _379;
    float _497 = fma(_183, (*spvDescriptorSet0.cp_c3)._m0[118].z, _465);
    float _499 = as_type<float>(_495);
    if (!_397)
    {
        int _501 = 12 & _471;
        _491 = _501;
    }
    int _503 = _491;
    float _505 = trunc(_467);
    int _507 = int(_505);
    if (!_355)
    {
        int _509 = _453 << 4;
        int _511 = _509 + _445;
        _455 = _511;
    }
    int _513 = _455;
    if (!_397)
    {
        int _515 = _495 << 4;
        int _517 = _515 + _503;
        _499 = as_type<float>(_517);
    }
    float _519 = _499;
    int _521 = _231 + 9928;
    uint _523 = uint(int(uint(_521) >> uint(2)));
    uint _525 = uint(int(uint(int(_523)) >> uint(2)));
    int _527 = int(_523) & 3;
    float _529 = (*spvDescriptorSet0.cp_c3)._m0[int(_525)][_527];
    int _531 = int(_523) + 1;
    uint _533 = uint(int(uint(_531) >> uint(2)));
    int _535 = _531 & 3;
    float _537 = (*spvDescriptorSet0.cp_c3)._m0[int(_533)][_535];
    float _539 = _497 + (*spvDescriptorSet0.cp_c3)._m0[118].w;
    float _541 = trunc(_539);
    int _543 = int(_541);
    float _545 = _519;
    if (!_397)
    {
        int _547 = as_type<int>(_519) + 256;
        uint _549 = uint(int(uint(_547) >> uint(2)));
        uint _551 = uint(int(uint(int(_549)) >> uint(2)));
        int _553 = int(_549) & 3;
        float _555 = (*spvDescriptorSet0.cp_c3)._m0[int(_551)][_553];
        _545 = _555;
    }
    float _557 = _545;
    int _559 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].y);
    int _561 = _507 + _559;
    int _563 = _561 + 1;
    bool _565 = _563 >= 0;
    bool _567 = _563 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _569 = !_565;
    bool _571 = _567 || _569;
    int _573 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].z);
    int _575 = _543 + _573;
    int _577 = _575 + 1;
    bool _579 = _577 < 0;
    bool _581 = _579 || _571;
    float _583 = _293 * _435;
    bool _585 = _577 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _587 = _585 || _581;
    float _589 = fma(_159, _427, _583);
    float _591 = _463 + _317;
    float _593 = _463;
    int _595 = _577;
    float _597 = _427;
    if (!_355)
    {
        int _599 = _513 + 256;
        uint _601 = uint(int(uint(_599) >> uint(2)));
        uint _603 = uint(int(uint(int(_601)) >> uint(2)));
        int _605 = int(_601) & 3;
        float _607 = (*spvDescriptorSet0.cp_c3)._m0[int(_603)][_605];
        _593 = _607;
    }
    float _609 = _593;
    float _611 = 1.0 / _591;
    float _613 = fma(_173, _481, _407);
    if (!_587)
    {
        int _615 = _577 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
        int _617 = _615 + _563;
        _411 = _617;
    }
    int _619 = _411;
    int _621 = _231 + 9936;
    uint _623 = uint(int(uint(_621) >> uint(2)));
    uint _625 = uint(int(uint(int(_623)) >> uint(2)));
    int _627 = int(_623) & 3;
    float _629 = (*spvDescriptorSet0.cp_c3)._m0[int(_625)][_627];
    int _631 = int(_623) + 1;
    uint _633 = uint(int(uint(_631) >> uint(2)));
    int _635 = _631 & 3;
    float _637 = (*spvDescriptorSet0.cp_c3)._m0[int(_633)][_635];
    float _639 = as_type<float>(_513);
    if (!_397)
    {
        float _641 = floor(_289);
        _639 = _641;
    }
    float _643 = _639;
    float _645 = fma(_173, _529, _589);
    int _647 = as_type<int>(_645);
    float _649 = _557;
    if (!_587)
    {
        int _651 = _619 << 2;
        _595 = _651;
    }
    int _653 = _595;
    float _655 = _613 + _489;
    float _657 = _645 + _537;
    int _659 = _653;
    if (!_587)
    {
        int _661 = 12 & _653;
        _659 = _661;
    }
    int _663 = _659;
    int _665 = _231 + 9944;
    uint _667 = uint(int(uint(_665) >> uint(2)));
    uint _669 = uint(int(uint(int(_667)) >> uint(2)));
    int _671 = int(_667) & 3;
    float _673 = (*spvDescriptorSet0.cp_c3)._m0[int(_669)][_671];
    int _675 = int(_667) + 1;
    uint _677 = uint(int(uint(_675) >> uint(2)));
    int _679 = _675 & 3;
    float _681 = (*spvDescriptorSet0.cp_c3)._m0[int(_677)][_679];
    float _683 = as_type<float>(_663);
    if (!_587)
    {
        uint _685 = uint(int(uint(_619) >> uint(2)));
        _647 = int(_685);
    }
    int _687 = _647;
    float _689 = _655 * _611;
    if (!_397)
    {
        float _691 = rint(_557);
        float _693 = precise::max(_691, 0.0);
        uint _695 = uint(_693);
        uint _697 = clamp(_695, 0u, 65535u);
        _649 = as_type<float>(_697);
    }
    float _699 = _649;
    float _701 = 0.0;
    if (!_587)
    {
        int _703 = _687 << 4;
        int _705 = _703 + _663;
        _701 = as_type<float>(_705);
    }
    float _707 = _701;
    float _709 = _657 * _611;
    bool _711 = _689 >= 0.0;
    if (!_397)
    {
        float _713 = -_643;
        float _715 = _289 + _713;
        _381 = _715;
    }
    float _717 = _381;
    float _719 = _707;
    if (!_587)
    {
        int _721 = as_type<int>(_707) + 256;
        uint _723 = uint(int(uint(_721) >> uint(2)));
        uint _725 = uint(int(uint(int(_723)) >> uint(2)));
        int _727 = int(_723) & 3;
        float _729 = (*spvDescriptorSet0.cp_c3)._m0[int(_725)][_727];
        _719 = _729;
    }
    float _731 = _719;
    bool _733 = _689 <= 1.0;
    bool _735 = _733 && _711;
    if (!_587)
    {
        float _737 = floor(_539);
        _683 = _737;
    }
    float _739 = _683;
    bool _741 = _709 >= 0.0;
    bool _743 = _741 && _735;
    bool _745 = _709 <= 1.0;
    bool _747 = _745 && _743;
    float _749 = _609;
    if (!_355)
    {
        float _751 = rint(_609);
        float _753 = precise::max(_751, 0.0);
        uint _755 = uint(_753);
        uint _757 = clamp(_755, 0u, 65535u);
        _749 = as_type<float>(_757);
    }
    float _759 = _749;
    if (_747)
    {
        float _761 = float(_223);
        _597 = _761;
    }
    float _763 = _597;
    float _765 = as_type<float>(_223);
    float _767 = _763;
    if (!_355)
    {
        float _769 = floor(_227);
        _765 = _769;
    }
    float _771 = _765;
    float _773 = _293 * _637;
    float _775 = fma(_159, _629, _773);
    if (_747)
    {
        float _777 = rint(_763);
        float _779 = precise::max(_777, 0.0);
        uint _781 = uint(_779);
        uint _783 = clamp(_781, 0u, 65535u);
        _767 = as_type<float>(_783);
    }
    float _785 = _767;
    float _787 = fma(_173, _673, _775);
    float _789 = _773;
    float _791 = _681;
    if (!_397)
    {
        float _793 = floor(_291);
        _789 = _793;
    }
    float _795 = _789;
    float _797 = _787 + _681;
    if (!_355)
    {
        float _799 = -_405;
        float _801 = _229 + _799;
        _791 = _801;
    }
    float _803 = _791;
    if (!_355)
    {
        float _805 = -_771;
        float _807 = _227 + _805;
        _383 = _807;
    }
    float _809 = _383;
    if (!_587)
    {
        float _811 = -_739;
        float _813 = _539 + _811;
        _413 = _813;
    }
    float _815 = _413;
    float _817 = _797 * _611;
    float _819 = _673;
    if (!_587)
    {
        float _821 = floor(_467);
        _819 = _821;
    }
    float _823 = _819;
    float _825 = _787;
    if (!_587)
    {
        float _827 = rint(_731);
        float _829 = precise::max(_827, 0.0);
        uint _831 = uint(_829);
        uint _833 = clamp(_831, 0u, 65535u);
        _825 = as_type<float>(_833);
    }
    float _835 = _825;
    float _837 = _795;
    if (!_397)
    {
        float _839 = -_795;
        float _841 = _291 + _839;
        _385 = _841;
    }
    float _843 = _385;
    float _845 = _709;
    if (_747)
    {
        float3 _3858 = float3(_689, _709, float(as_type<int>(_785)));
        float3 _3862 = select(_3858, float3(0.0), isnan(_3858));
        float _847 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _3862.xy, uint(rint(_3862.z)), _817, level(0.0));
        _845 = _847;
    }
    float _849 = _845;
    float _851 = _229;
    if (!_355)
    {
        float3 _3878 = float3(_809, _803, float(as_type<int>(_759)));
        float3 _3880 = select(_3878, float3(0.0), isnan(_3878));
        float _853 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _3880.xy, uint(rint(_3880.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _3880.xy, uint(rint(_3880.z)), level(0.0)).x;
        _851 = _853;
    }
    float _855 = _851;
    if (!_587)
    {
        float _857 = -_823;
        float _859 = _467 + _857;
        _837 = _859;
    }
    float _861 = _837;
    float _863 = _467;
    if (!_397)
    {
        float3 _3907 = float3(_717, _843, float(as_type<int>(_699)));
        float3 _3909 = select(_3907, float3(0.0), isnan(_3907));
        float _865 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _3909.xy, uint(rint(_3909.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _3909.xy, uint(rint(_3909.z)), level(0.0)).x;
        _863 = _865;
    }
    float _867 = _863;
    float _869 = _539;
    if (!_587)
    {
        float3 _3925 = float3(_861, _815, float(as_type<int>(_835)));
        float3 _3927 = select(_3925, float3(0.0), isnan(_3925));
        float _871 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _3927.xy, uint(rint(_3927.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _3927.xy, uint(rint(_3927.z)), level(0.0)).x;
        _869 = _871;
    }
    float _873 = _869;
    float _875 = as_type<float>(gl_SubgroupLtMask.x);
    float _877 = fma(_293, (*spvDescriptorSet0.cp_c3)._m0[117].y, _171);
    float _879 = fma(_293, (*spvDescriptorSet0.cp_c3)._m0[118].y, _177);
    float _881 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[117].z, _877);
    float _883 = _159 * (*spvDescriptorSet0.cp_c3)._m0[14].x;
    float _885 = fma(_169, 9.9999997473787516355514526367188e-05, 1.10000002384185791015625);
    float _887 = _881 + (*spvDescriptorSet0.cp_c3)._m0[117].w;
    float _889 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[118].z, _879);
    float _891 = fma(_885, (*spvDescriptorSet0.cp_c3)._m0[14].y, _883);
    float _893 = _889 + (*spvDescriptorSet0.cp_c3)._m0[118].w;
    float _895 = fma(_183, (*spvDescriptorSet0.cp_c3)._m0[14].z, _891);
    int _897 = int(_151) & as_type<int>(_875);
    float _899 = trunc(_893);
    int _901 = int(_899);
    float _903 = _895 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _905 = -_903;
    bool _907 = _905 > (*spvDescriptorSet0.cp_c3)._m0[631].y;
    int _909 = popcount(_897);
    float _911 = -_903;
    bool _913 = _911 > (*spvDescriptorSet0.cp_c3)._m0[631].x;
    int _915 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].z);
    int _917 = _901 + _915;
    int _919 = _917 + 1;
    float _921 = trunc(_887);
    int _923 = int(_921);
    bool _925 = !_907;
    int _927 = _925 ? 0 : 1;
    int _929 = 2;
    uint _931 = uint(_919);
    float _933 = _893;
    if (!_907)
    {
        _929 = 1;
    }
    int _935 = _929;
    int _937 = _935;
    if (!_913)
    {
        _937 = _927;
    }
    int _939 = _937;
    int _941 = _909 << 2;
    int _943 = _939 << 6;
    int _945 = _941 + 1;
    int _947 = _945 << 2;
    uint _949 = uint(int(uint(_945) >> uint(5)));
    int _951 = 124 & _947;
    int _953 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].y);
    int _955 = _923 + _953;
    int _957 = _955 + 1;
    int _959 = int(_949) << 10;
    int _961 = _959 + _951;
    int _963 = _943 + 9904;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    uint _967 = uint(int(uint(int(_965)) >> uint(2)));
    int _969 = int(_965) & 3;
    float _971 = (*spvDescriptorSet0.cp_c3)._m0[int(_967)][_969];
    int _973 = int(_965) + 1;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    int _977 = _973 & 3;
    float _979 = (*spvDescriptorSet0.cp_c3)._m0[int(_975)][_977];
    bool _981 = _957 >= 0;
    bool _983 = _957 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _985 = !_981;
    bool _987 = _983 || _985;
    bool _989 = _919 < 0;
    bool _991 = _989 || _987;
    bool _993 = _919 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _995 = _993 || _991;
    float _997 = as_type<float>(_939);
    if (!_995)
    {
        int _999 = _919 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
        int _1001 = _999 + _957;
        _931 = uint(_1001);
    }
    uint _1003 = _931;
    float _1005 = _197 * _979;
    float _1007 = fma(_159, _971, _1005);
    int _1009 = _943 + 9912;
    uint _1011 = uint(int(uint(_1009) >> uint(2)));
    uint _1013 = uint(int(uint(int(_1011)) >> uint(2)));
    int _1015 = int(_1011) & 3;
    float _1017 = (*spvDescriptorSet0.cp_c3)._m0[int(_1013)][_1015];
    int _1019 = int(_1011) + 1;
    uint _1021 = uint(int(uint(_1019) >> uint(2)));
    int _1023 = _1019 & 3;
    float _1025 = (*spvDescriptorSet0.cp_c3)._m0[int(_1021)][_1023];
    float _1027 = fma(_183, _1017, _1007);
    float _1029 = _1027 + _1025;
    int _1031 = _943 + 9920;
    uint _1033 = uint(int(uint(_1031) >> uint(2)));
    uint _1035 = uint(int(uint(int(_1033)) >> uint(2)));
    int _1037 = int(_1033) & 3;
    float _1039 = (*spvDescriptorSet0.cp_c3)._m0[int(_1035)][_1037];
    int _1041 = int(_1033) + 1;
    uint _1043 = uint(int(uint(_1041) >> uint(2)));
    int _1045 = _1041 & 3;
    float _1047 = (*spvDescriptorSet0.cp_c3)._m0[int(_1043)][_1045];
    float _1049 = _197 * _1047;
    float _1051 = fma(_159, _1039, _1049);
    int _1053 = _943 + 9928;
    uint _1055 = uint(int(uint(_1053) >> uint(2)));
    uint _1057 = uint(int(uint(int(_1055)) >> uint(2)));
    int _1059 = int(_1055) & 3;
    float _1061 = (*spvDescriptorSet0.cp_c3)._m0[int(_1057)][_1059];
    int _1063 = int(_1055) + 1;
    uint _1065 = uint(int(uint(_1063) >> uint(2)));
    int _1067 = _1063 & 3;
    float _1069 = (*spvDescriptorSet0.cp_c3)._m0[int(_1065)][_1067];
    float _1071 = fma(_183, _1061, _1051);
    float _1073 = _1071 + _1069;
    int _1075 = _943 + 9936;
    uint _1077 = uint(int(uint(_1075) >> uint(2)));
    uint _1079 = uint(int(uint(int(_1077)) >> uint(2)));
    int _1081 = int(_1077) & 3;
    float _1083 = (*spvDescriptorSet0.cp_c3)._m0[int(_1079)][_1081];
    int _1085 = int(_1077) + 1;
    uint _1087 = uint(int(uint(_1085) >> uint(2)));
    int _1089 = _1085 & 3;
    float _1091 = (*spvDescriptorSet0.cp_c3)._m0[int(_1087)][_1089];
    float _1093 = _197 * _1091;
    float _1095 = fma(_159, _1083, _1093);
    int _1097 = _943 + 9944;
    uint _1099 = uint(int(uint(_1097) >> uint(2)));
    uint _1101 = uint(int(uint(int(_1099)) >> uint(2)));
    int _1103 = int(_1099) & 3;
    float _1105 = (*spvDescriptorSet0.cp_c3)._m0[int(_1101)][_1103];
    int _1107 = int(_1099) + 1;
    uint _1109 = uint(int(uint(_1107) >> uint(2)));
    int _1111 = _1107 & 3;
    float _1113 = (*spvDescriptorSet0.cp_c3)._m0[int(_1109)][_1111];
    float _1115 = fma(_183, _1105, _1095);
    float _1117 = _1115 + _1113;
    int _1119 = _943 + 9952;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    uint _1123 = uint(int(uint(int(_1121)) >> uint(2)));
    int _1125 = int(_1121) & 3;
    float _1127 = (*spvDescriptorSet0.cp_c3)._m0[int(_1123)][_1125];
    int _1129 = int(_1121) + 1;
    uint _1131 = uint(int(uint(_1129) >> uint(2)));
    int _1133 = _1129 & 3;
    float _1135 = (*spvDescriptorSet0.cp_c3)._m0[int(_1131)][_1133];
    float _1137 = _197 * _1135;
    float _1139 = fma(_159, _1127, _1137);
    int _1141 = _943 + 9960;
    uint _1143 = uint(int(uint(_1141) >> uint(2)));
    uint _1145 = uint(int(uint(int(_1143)) >> uint(2)));
    int _1147 = int(_1143) & 3;
    float _1149 = (*spvDescriptorSet0.cp_c3)._m0[int(_1145)][_1147];
    int _1151 = int(_1143) + 1;
    uint _1153 = uint(int(uint(_1151) >> uint(2)));
    int _1155 = _1151 & 3;
    float _1157 = (*spvDescriptorSet0.cp_c3)._m0[int(_1153)][_1155];
    float _1159 = fma(_183, _1149, _1139);
    float _1161 = _1159 + _1157;
    float _1163 = 1.0 / _1161;
    float _1165 = _1073 * _1163;
    float _1167 = fma(_179, 9.9999997473787516355514526367188e-05, 1.10000002384185791015625);
    float _1169 = _225 * (*spvDescriptorSet0.cp_c3)._m0[14].x;
    float _1171 = _1029 * _1163;
    float _1173 = _1117 * _1163;
    float _1175 = fma(_1167, (*spvDescriptorSet0.cp_c3)._m0[14].y, _1169);
    float _1177 = fma(_185, 9.9999997473787516355514526367188e-05, 1.10000002384185791015625);
    float _1179 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[14].z, _1175);
    float _1181 = fma(_1177, (*spvDescriptorSet0.cp_c3)._m0[14].y, _1169);
    float _1183 = _1179 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _1185 = fma(_183, (*spvDescriptorSet0.cp_c3)._m0[14].z, _1181);
    float _1187 = -_1183;
    bool _1189 = _1187 > (*spvDescriptorSet0.cp_c3)._m0[631].y;
    float _1191 = _1185 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _1193 = -_1183;
    bool _1195 = _1193 > (*spvDescriptorSet0.cp_c3)._m0[631].x;
    bool _1197 = !_1189;
    int _1199 = _1197 ? 0 : 1;
    int _1201 = 2;
    int _1203 = 2;
    float _1205 = _1173;
    if (!_1189)
    {
        _1201 = 1;
    }
    int _1207 = _1201;
    int _1209 = _1207;
    if (!_1195)
    {
        _1209 = _1199;
    }
    int _1211 = _1209;
    float _1213 = -_1191;
    bool _1215 = _1213 > (*spvDescriptorSet0.cp_c3)._m0[631].y;
    int _1217 = _1211 << 6;
    float _1219 = -_1191;
    bool _1221 = _1219 > (*spvDescriptorSet0.cp_c3)._m0[631].x;
    int _1223 = _1217 + 9904;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    uint _1227 = uint(int(uint(int(_1225)) >> uint(2)));
    int _1229 = int(_1225) & 3;
    float _1231 = (*spvDescriptorSet0.cp_c3)._m0[int(_1227)][_1229];
    int _1233 = int(_1225) + 1;
    uint _1235 = uint(int(uint(_1233) >> uint(2)));
    int _1237 = _1233 & 3;
    float _1239 = (*spvDescriptorSet0.cp_c3)._m0[int(_1235)][_1237];
    int _1241 = _1217;
    float _1243 = as_type<float>(_1211);
    if (!_1215)
    {
        _1203 = 1;
    }
    int _1245 = _1203;
    float _1247 = _209 * _1239;
    float _1249 = fma(_225, _1231, _1247);
    int _1251 = _1217 + 9912;
    uint _1253 = uint(int(uint(_1251) >> uint(2)));
    uint _1255 = uint(int(uint(int(_1253)) >> uint(2)));
    int _1257 = int(_1253) & 3;
    float _1259 = (*spvDescriptorSet0.cp_c3)._m0[int(_1255)][_1257];
    int _1261 = int(_1253) + 1;
    uint _1263 = uint(int(uint(_1261) >> uint(2)));
    int _1265 = _1261 & 3;
    float _1267 = (*spvDescriptorSet0.cp_c3)._m0[int(_1263)][_1265];
    float _1269 = fma(_173, _1259, _1249);
    float _1271 = _1269 + _1267;
    int _1273 = _1217 + 9920;
    uint _1275 = uint(int(uint(_1273) >> uint(2)));
    uint _1277 = uint(int(uint(int(_1275)) >> uint(2)));
    int _1279 = int(_1275) & 3;
    float _1281 = (*spvDescriptorSet0.cp_c3)._m0[int(_1277)][_1279];
    int _1283 = int(_1275) + 1;
    uint _1285 = uint(int(uint(_1283) >> uint(2)));
    int _1287 = _1283 & 3;
    float _1289 = (*spvDescriptorSet0.cp_c3)._m0[int(_1285)][_1287];
    float _1291 = _209 * _1289;
    float _1293 = fma(_225, _1281, _1291);
    int _1295 = _1217 + 9928;
    uint _1297 = uint(int(uint(_1295) >> uint(2)));
    uint _1299 = uint(int(uint(int(_1297)) >> uint(2)));
    int _1301 = int(_1297) & 3;
    float _1303 = (*spvDescriptorSet0.cp_c3)._m0[int(_1299)][_1301];
    int _1305 = int(_1297) + 1;
    uint _1307 = uint(int(uint(_1305) >> uint(2)));
    int _1309 = _1305 & 3;
    float _1311 = (*spvDescriptorSet0.cp_c3)._m0[int(_1307)][_1309];
    float _1313 = fma(_173, _1303, _1293);
    float _1315 = _1313 + _1311;
    int _1317 = _1217 + 9936;
    uint _1319 = uint(int(uint(_1317) >> uint(2)));
    uint _1321 = uint(int(uint(int(_1319)) >> uint(2)));
    int _1323 = int(_1319) & 3;
    float _1325 = (*spvDescriptorSet0.cp_c3)._m0[int(_1321)][_1323];
    int _1327 = int(_1319) + 1;
    uint _1329 = uint(int(uint(_1327) >> uint(2)));
    int _1331 = _1327 & 3;
    float _1333 = (*spvDescriptorSet0.cp_c3)._m0[int(_1329)][_1331];
    float _1335 = _209 * _1333;
    float _1337 = fma(_225, _1325, _1335);
    int _1339 = _1217 + 9944;
    uint _1341 = uint(int(uint(_1339) >> uint(2)));
    uint _1343 = uint(int(uint(int(_1341)) >> uint(2)));
    int _1345 = int(_1341) & 3;
    float _1347 = (*spvDescriptorSet0.cp_c3)._m0[int(_1343)][_1345];
    int _1349 = int(_1341) + 1;
    uint _1351 = uint(int(uint(_1349) >> uint(2)));
    int _1353 = _1349 & 3;
    float _1355 = (*spvDescriptorSet0.cp_c3)._m0[int(_1351)][_1353];
    float _1357 = fma(_173, _1347, _1337);
    float _1359 = _1357 + _1355;
    int _1361 = _1217 + 9952;
    uint _1363 = uint(int(uint(_1361) >> uint(2)));
    uint _1365 = uint(int(uint(int(_1363)) >> uint(2)));
    int _1367 = int(_1363) & 3;
    float _1369 = (*spvDescriptorSet0.cp_c3)._m0[int(_1365)][_1367];
    int _1371 = int(_1363) + 1;
    uint _1373 = uint(int(uint(_1371) >> uint(2)));
    int _1375 = _1371 & 3;
    float _1377 = (*spvDescriptorSet0.cp_c3)._m0[int(_1373)][_1375];
    float _1379 = _209 * _1377;
    float _1381 = fma(_225, _1369, _1379);
    int _1383 = _1217 + 9960;
    uint _1385 = uint(int(uint(_1383) >> uint(2)));
    uint _1387 = uint(int(uint(int(_1385)) >> uint(2)));
    int _1389 = int(_1385) & 3;
    float _1391 = (*spvDescriptorSet0.cp_c3)._m0[int(_1387)][_1389];
    int _1393 = int(_1385) + 1;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    int _1397 = _1393 & 3;
    float _1399 = (*spvDescriptorSet0.cp_c3)._m0[int(_1395)][_1397];
    int _1401 = _1245;
    if (!_995)
    {
        uint _1403 = uint(int(uint(int(_1003)) >> uint(2)));
        _1241 = int(_1403);
    }
    int _1405 = _1241;
    float _1407 = fma(_173, _1391, _1381);
    float _1409 = _1407 + _1399;
    float _1411 = 1.0 / _1409;
    float _1413 = _1315 * _1411;
    bool _1415 = !_1215;
    int _1417 = _1415 ? 0 : 1;
    float _1419 = _1271 * _1411;
    float _1421 = _1359 * _1411;
    float _1423 = as_type<float>(_1405);
    if (!_1221)
    {
        _1401 = _1417;
    }
    int _1425 = _1401;
    bool _1427 = _1419 >= 0.0;
    int _1429 = _1425 << 6;
    bool _1431 = _1419 <= 1.0;
    bool _1433 = _1431 && _1427;
    int _1435 = _1429 + 9904;
    uint _1437 = uint(int(uint(_1435) >> uint(2)));
    uint _1439 = uint(int(uint(int(_1437)) >> uint(2)));
    int _1441 = int(_1437) & 3;
    float _1443 = (*spvDescriptorSet0.cp_c3)._m0[int(_1439)][_1441];
    int _1445 = int(_1437) + 1;
    uint _1447 = uint(int(uint(_1445) >> uint(2)));
    int _1449 = _1445 & 3;
    float _1451 = (*spvDescriptorSet0.cp_c3)._m0[int(_1447)][_1449];
    bool _1453 = _1413 >= 0.0;
    bool _1455 = _1453 && _1433;
    bool _1457 = _1413 <= 1.0;
    bool _1459 = _1457 && _1455;
    float _1461 = as_type<float>(_1429);
    float _1463 = as_type<float>(_1425);
    if (_1459)
    {
        float _1465 = float(_1211);
        _1243 = _1465;
    }
    float _1467 = _1243;
    float _1469 = _1467;
    if (_1459)
    {
        float _1471 = rint(_1467);
        float _1473 = precise::max(_1471, 0.0);
        uint _1475 = uint(_1473);
        uint _1477 = clamp(_1475, 0u, 65535u);
        _1469 = as_type<float>(_1477);
    }
    float _1479 = _1469;
    float _1481 = _295 * _1451;
    float _1483 = fma(_225, _1443, _1481);
    int _1485 = _1429 + 9912;
    uint _1487 = uint(int(uint(_1485) >> uint(2)));
    uint _1489 = uint(int(uint(int(_1487)) >> uint(2)));
    int _1491 = int(_1487) & 3;
    float _1493 = (*spvDescriptorSet0.cp_c3)._m0[int(_1489)][_1491];
    int _1495 = int(_1487) + 1;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    int _1499 = _1495 & 3;
    float _1501 = (*spvDescriptorSet0.cp_c3)._m0[int(_1497)][_1499];
    float _1503 = fma(_183, _1493, _1483);
    float _1505 = _1483;
    if (!_747)
    {
        _1505 = 1.0;
    }
    float _1507 = _1505;
    float _1509 = _1507;
    if (_747)
    {
        bool _1511 = _849 >= _817;
        bool _1513 = isnan(_849);
        bool _1515 = _1511 || _1513;
        bool _1517 = isnan(_817);
        bool _1519 = _1515 || _1517;
        float _1521 = float(_1519);
        _1509 = _1521;
    }
    float _1523 = _1509;
    float _1525 = _1503 + _1501;
    int _1527 = _1429 + 9920;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    uint _1531 = uint(int(uint(int(_1529)) >> uint(2)));
    int _1533 = int(_1529) & 3;
    float _1535 = (*spvDescriptorSet0.cp_c3)._m0[int(_1531)][_1533];
    int _1537 = int(_1529) + 1;
    uint _1539 = uint(int(uint(_1537) >> uint(2)));
    int _1541 = _1537 & 3;
    float _1543 = (*spvDescriptorSet0.cp_c3)._m0[int(_1539)][_1541];
    bool _1545 = _1171 >= 0.0;
    bool _1547 = _1171 <= 1.0;
    bool _1549 = _1547 && _1545;
    bool _1551 = _1165 >= 0.0;
    bool _1553 = _1551 && _1549;
    bool _1555 = _1165 <= 1.0;
    bool _1557 = _1555 && _1553;
    if (_1557)
    {
        float _1559 = float(_939);
        _997 = _1559;
    }
    float _1561 = _997;
    float _1563 = _1561;
    if (_1557)
    {
        float _1565 = rint(_1561);
        float _1567 = precise::max(_1565, 0.0);
        uint _1569 = uint(_1567);
        uint _1571 = clamp(_1569, 0u, 65535u);
        _1563 = as_type<float>(_1571);
    }
    float _1573 = _1563;
    float _1575 = _295 * _1543;
    float _1577 = fma(_225, _1535, _1575);
    int _1579 = _1429 + 9928;
    uint _1581 = uint(int(uint(_1579) >> uint(2)));
    uint _1583 = uint(int(uint(int(_1581)) >> uint(2)));
    int _1585 = int(_1581) & 3;
    float _1587 = (*spvDescriptorSet0.cp_c3)._m0[int(_1583)][_1585];
    int _1589 = int(_1581) + 1;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    int _1593 = _1589 & 3;
    float _1595 = (*spvDescriptorSet0.cp_c3)._m0[int(_1591)][_1593];
    float _1597 = fma(_183, _1587, _1577);
    int _1599 = as_type<int>(_1587);
    if (!_995)
    {
        int _1601 = int(_1003) << 2;
        _1599 = _1601;
    }
    int _1603 = _1599;
    float _1605 = _1597 + _1595;
    int _1607 = _1603;
    float _1609 = _1605;
    if (!_995)
    {
        int _1611 = 12 & _1603;
        _1607 = _1611;
    }
    int _1613 = _1607;
    if (!_995)
    {
        int _1615 = _1405 << 4;
        int _1617 = _1615 + _1613;
        _1423 = as_type<float>(_1617);
    }
    float _1619 = _1423;
    int _1621 = _1429 + 9936;
    uint _1623 = uint(int(uint(_1621) >> uint(2)));
    uint _1625 = uint(int(uint(int(_1623)) >> uint(2)));
    int _1627 = int(_1623) & 3;
    float _1629 = (*spvDescriptorSet0.cp_c3)._m0[int(_1625)][_1627];
    int _1631 = int(_1623) + 1;
    uint _1633 = uint(int(uint(_1631) >> uint(2)));
    int _1635 = _1631 & 3;
    float _1637 = (*spvDescriptorSet0.cp_c3)._m0[int(_1633)][_1635];
    float _1639 = _1619;
    if (!_995)
    {
        int _1641 = as_type<int>(_1619) + 256;
        uint _1643 = uint(int(uint(_1641) >> uint(2)));
        uint _1645 = uint(int(uint(int(_1643)) >> uint(2)));
        int _1647 = int(_1643) & 3;
        float _1649 = (*spvDescriptorSet0.cp_c3)._m0[int(_1645)][_1647];
        _1639 = _1649;
    }
    float _1651 = _1639;
    float _1653 = _295 * _1637;
    float _1655 = fma(_225, _1629, _1653);
    int _1657 = _1429 + 9944;
    uint _1659 = uint(int(uint(_1657) >> uint(2)));
    uint _1661 = uint(int(uint(int(_1659)) >> uint(2)));
    int _1663 = int(_1659) & 3;
    float _1665 = (*spvDescriptorSet0.cp_c3)._m0[int(_1661)][_1663];
    int _1667 = int(_1659) + 1;
    uint _1669 = uint(int(uint(_1667) >> uint(2)));
    int _1671 = _1667 & 3;
    float _1673 = (*spvDescriptorSet0.cp_c3)._m0[int(_1669)][_1671];
    float _1675 = fma(_183, _1665, _1655);
    float _1677 = _1675 + _1673;
    int _1679 = _1429 + 9952;
    uint _1681 = uint(int(uint(_1679) >> uint(2)));
    uint _1683 = uint(int(uint(int(_1681)) >> uint(2)));
    int _1685 = int(_1681) & 3;
    float _1687 = (*spvDescriptorSet0.cp_c3)._m0[int(_1683)][_1685];
    int _1689 = int(_1681) + 1;
    uint _1691 = uint(int(uint(_1689) >> uint(2)));
    int _1693 = _1689 & 3;
    float _1695 = (*spvDescriptorSet0.cp_c3)._m0[int(_1691)][_1693];
    float _1697 = _295 * _1695;
    float _1699 = fma(_225, _1687, _1697);
    int _1701 = _1429 + 9960;
    uint _1703 = uint(int(uint(_1701) >> uint(2)));
    uint _1705 = uint(int(uint(int(_1703)) >> uint(2)));
    int _1707 = int(_1703) & 3;
    float _1709 = (*spvDescriptorSet0.cp_c3)._m0[int(_1705)][_1707];
    int _1711 = int(_1703) + 1;
    uint _1713 = uint(int(uint(_1711) >> uint(2)));
    int _1715 = _1711 & 3;
    float _1717 = (*spvDescriptorSet0.cp_c3)._m0[int(_1713)][_1715];
    float _1719 = fma(_183, _1709, _1699);
    float _1721 = _1719 + _1717;
    float _1723 = 1.0 / _1721;
    float _1725 = _1525 * _1723;
    float _1727 = _1605 * _1723;
    float _1729 = _1677 * _1723;
    float _1731 = _1723;
    if (!_995)
    {
        float _1733 = floor(_893);
        _1731 = _1733;
    }
    float _1735 = _1731;
    bool _1737 = _1725 >= 0.0;
    bool _1739 = _1725 <= 1.0;
    bool _1741 = _1739 && _1737;
    float _1743 = _1677;
    if (!_995)
    {
        float _1745 = floor(_887);
        _1743 = _1745;
    }
    float _1747 = _1743;
    bool _1749 = _1727 >= 0.0;
    bool _1751 = _1749 && _1741;
    bool _1753 = _1727 <= 1.0;
    bool _1755 = _1753 && _1751;
    if (!_995)
    {
        float _1757 = -_1735;
        float _1759 = _893 + _1757;
        _1461 = _1759;
    }
    float _1761 = _1461;
    if (!_995)
    {
        float _1763 = rint(_1651);
        float _1765 = precise::max(_1763, 0.0);
        uint _1767 = uint(_1765);
        uint _1769 = clamp(_1767, 0u, 65535u);
        _933 = as_type<float>(_1769);
    }
    float _1771 = _933;
    if (_1755)
    {
        float _1773 = float(_1425);
        _1609 = _1773;
    }
    float _1775 = _1609;
    if (!_995)
    {
        float _1777 = -_1747;
        float _1779 = _887 + _1777;
        _1463 = _1779;
    }
    float _1781 = _1463;
    float _1783 = _1775;
    if (_1755)
    {
        float _1785 = rint(_1775);
        float _1787 = precise::max(_1785, 0.0);
        uint _1789 = uint(_1787);
        uint _1791 = clamp(_1789, 0u, 65535u);
        _1783 = as_type<float>(_1791);
    }
    float _1793 = _1783;
    float _1795 = _1165;
    if (_1557)
    {
        float3 _5415 = float3(_1171, _1165, float(as_type<int>(_1573)));
        float3 _5417 = select(_5415, float3(0.0), isnan(_5415));
        float _1797 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _5417.xy, uint(rint(_5417.z)), _1173, level(0.0));
        _1795 = _1797;
    }
    float _1799 = _1795;
    float _1801 = _1413;
    if (_1459)
    {
        float3 _5432 = float3(_1419, _1413, float(as_type<int>(_1479)));
        float3 _5434 = select(_5432, float3(0.0), isnan(_5432));
        float _1803 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _5434.xy, uint(rint(_5434.z)), _1421, level(0.0));
        _1801 = _1803;
    }
    float _1805 = _1801;
    float _1807 = _1793;
    if (_1755)
    {
        float3 _5449 = float3(_1725, _1727, float(as_type<int>(_1793)));
        float3 _5451 = select(_5449, float3(0.0), isnan(_5449));
        float _1809 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _5451.xy, uint(rint(_5451.z)), _1729, level(0.0));
        _1807 = _1809;
    }
    float _1811 = _1807;
    float _1813 = _1781;
    if (!_995)
    {
        float3 _5467 = float3(_1781, _1761, float(as_type<int>(_1771)));
        float3 _5469 = select(_5467, float3(0.0), isnan(_5467));
        float _1815 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _5469.xy, uint(rint(_5469.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _5469.xy, uint(rint(_5469.z)), level(0.0)).x;
        _1813 = _1815;
    }
    float _1817 = _1813;
    int _1819 = _941 + 3;
    int _1821 = _941 + 2;
    int _1823 = _1819 << 2;
    float _1825 = _159 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
    uint _1827 = uint(int(uint(_1819) >> uint(5)));
    float _1829 = _159 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    int _1831 = 124 & _1823;
    int _1833 = _1821 << 2;
    int _1835 = _941 << 2;
    int _1837 = int(_1827) << 10;
    int _1839 = _1837 + _1831;
    float _1841 = fma(_293, (*spvDescriptorSet0.cp_c3)._m0[5].y, _1825);
    uint _1843 = uint(int(uint(_1821) >> uint(5)));
    int _1845 = 124 & _1833;
    float _1847 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[5].z, _1841);
    uint _1849 = uint(int(uint(_941) >> uint(5)));
    float _1851 = fma(_293, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1829);
    int _1853 = 124 & _1835;
    float _1855 = _1847 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    int _1857 = int(_1843) << 10;
    int _1859 = _1857 + _1845;
    float _1861 = _159 * (*spvDescriptorSet0.cp_c3)._m0[6].x;
    int _1863 = int(_1849) << 10;
    int _1865 = _1863 + _1853;
    float _1867 = _159 * (*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _1869 = fma(_197, (*spvDescriptorSet0.cp_c3)._m0[5].y, _1825);
    float _1871 = fma(_293, (*spvDescriptorSet0.cp_c3)._m0[6].y, _1861);
    float _1873 = fma(_197, (*spvDescriptorSet0.cp_c3)._m0[6].y, _1861);
    float _1875 = fma(_293, (*spvDescriptorSet0.cp_c3)._m0[8].y, _1867);
    float _1877 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1851);
    float _1879 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[6].z, _1871);
    float _1881 = fma(_183, (*spvDescriptorSet0.cp_c3)._m0[6].z, _1873);
    float _1883 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[8].z, _1875);
    float _1885 = fma(_183, (*spvDescriptorSet0.cp_c3)._m0[5].z, _1869);
    float _1887 = _1879 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    float _1889 = _1877 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    float _1891 = _1883 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _1893 = _1881 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    float _1895 = _225 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
    int _1897 = _1865 + 272;
    uint _1899 = uint(int(uint(_1897) >> uint(2)));
    _29[int(_1899)] = as_type<uint>(_1855);
    int _1901 = _1865 + 400;
    uint _1903 = uint(int(uint(_1901) >> uint(2)));
    _29[int(_1903)] = as_type<uint>(_1887);
    int _1905 = _1865 + 528;
    uint _1907 = uint(int(uint(_1905) >> uint(2)));
    _29[int(_1907)] = as_type<uint>(_1889);
    float _1909 = _1885 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    float _1911 = fma(_209, (*spvDescriptorSet0.cp_c3)._m0[5].y, _1895);
    int _1913 = _1865 + 656;
    uint _1915 = uint(int(uint(_1913) >> uint(2)));
    _29[int(_1915)] = as_type<uint>(_1891);
    float _1917 = fma(_197, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1829);
    float _1919 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[5].z, _1911);
    int _1921 = _961 + 272;
    uint _1923 = uint(int(uint(_1921) >> uint(2)));
    _29[int(_1923)] = as_type<uint>(_1909);
    float _1925 = _225 * (*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _1927 = fma(_197, (*spvDescriptorSet0.cp_c3)._m0[8].y, _1867);
    float _1929 = fma(_183, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1917);
    float _1931 = _225 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    int _1933 = _961 + 400;
    uint _1935 = uint(int(uint(_1933) >> uint(2)));
    _29[int(_1935)] = as_type<uint>(_1893);
    float _1937 = fma(_183, (*spvDescriptorSet0.cp_c3)._m0[8].z, _1927);
    float _1939 = _1929 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    float _1941 = _225 * (*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _1943 = _1919 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    float _1945 = fma(_209, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1931);
    float _1947 = _1937 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    int _1949 = _961 + 528;
    uint _1951 = uint(int(uint(_1949) >> uint(2)));
    _29[int(_1951)] = as_type<uint>(_1939);
    float _1953 = fma(_295, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1931);
    float _1955 = fma(_209, (*spvDescriptorSet0.cp_c3)._m0[6].y, _1941);
    float _1957 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1945);
    int _1959 = _961 + 656;
    uint _1961 = uint(int(uint(_1959) >> uint(2)));
    _29[int(_1961)] = as_type<uint>(_1947);
    float _1963 = fma(_183, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1953);
    float _1965 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[6].z, _1955);
    int _1967 = _1859 + 272;
    uint _1969 = uint(int(uint(_1967) >> uint(2)));
    _29[int(_1969)] = as_type<uint>(_1943);
    float _1971 = fma(_209, (*spvDescriptorSet0.cp_c3)._m0[8].y, _1925);
    float _1973 = _1965 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    float _1975 = fma(_295, (*spvDescriptorSet0.cp_c3)._m0[5].y, _1895);
    float _1977 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[8].z, _1971);
    int _1979 = _1859 + 400;
    uint _1981 = uint(int(uint(_1979) >> uint(2)));
    _29[int(_1981)] = as_type<uint>(_1973);
    float _1983 = _1957 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    float _1985 = fma(_295, (*spvDescriptorSet0.cp_c3)._m0[6].y, _1941);
    float _1987 = fma(_183, (*spvDescriptorSet0.cp_c3)._m0[5].z, _1975);
    float _1989 = _1977 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _1991 = fma(_183, (*spvDescriptorSet0.cp_c3)._m0[6].z, _1985);
    float _1993 = _1987 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    int _1995 = _1859 + 528;
    uint _1997 = uint(int(uint(_1995) >> uint(2)));
    _29[int(_1997)] = as_type<uint>(_1983);
    float _1999 = _1963 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    float _2001 = _1991 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    float _2003 = fma(_293, (*spvDescriptorSet0.cp_c3)._m0[14].y, _167);
    int _2005 = _1859 + 656;
    uint _2007 = uint(int(uint(_2005) >> uint(2)));
    _29[int(_2007)] = as_type<uint>(_1989);
    int _2009 = _1839 + 272;
    uint _2011 = uint(int(uint(_2009) >> uint(2)));
    _29[int(_2011)] = as_type<uint>(_1993);
    int _2013 = _1839 + 400;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    _29[int(_2015)] = as_type<uint>(_2001);
    float _2017 = fma(_295, (*spvDescriptorSet0.cp_c3)._m0[8].y, _1925);
    float _2019 = _1925;
    if (_995)
    {
        _2019 = 1.0;
    }
    float _2021 = _2019;
    int _2023 = _1839 + 528;
    uint _2025 = uint(int(uint(_2023) >> uint(2)));
    _29[int(_2025)] = as_type<uint>(_1999);
    float _2027 = fma(_183, (*spvDescriptorSet0.cp_c3)._m0[8].z, _2017);
    float _2029 = _2021;
    if (!_995)
    {
        int _2031 = int(_1003) << 4;
        int _2033 = _2031 + 1904;
        uint _2035 = uint(int(uint(_2033) >> uint(2)));
        uint _2037 = uint(int(uint(int(_2035)) >> uint(2)));
        int _2039 = int(_2035) & 3;
        float _2041 = (*spvDescriptorSet0.cp_c3)._m0[int(_2037)][_2039];
        int _2043 = int(_2035) + 1;
        uint _2045 = uint(int(uint(_2043) >> uint(2)));
        int _2047 = _2043 & 3;
        float _2049 = (*spvDescriptorSet0.cp_c3)._m0[int(_2045)][_2047];
        int _2051 = _2033 + 8;
        uint _2053 = uint(int(uint(_2051) >> uint(2)));
        uint _2055 = uint(int(uint(int(_2053)) >> uint(2)));
        int _2057 = int(_2053) & 3;
        float _2059 = (*spvDescriptorSet0.cp_c3)._m0[int(_2055)][_2057];
        int _2061 = int(_2053) + 1;
        uint _2063 = uint(int(uint(_2061) >> uint(2)));
        int _2065 = _2061 & 3;
        float _2067 = (*spvDescriptorSet0.cp_c3)._m0[int(_2063)][_2065];
        float _2069 = _293 * _2049;
        float _2071 = fma(_159, _2041, _2069);
        float _2073 = fma(_173, _2059, _2071);
        float _2075 = _2073 + _2067;
        float _2077 = precise::clamp(_2075, 0.0, 1.0);
        float _2079 = -_2077;
        float _2081 = _2079 + _1817;
        float _2083 = fma(_2081, 500.0, 1.5);
        float _2085 = exp2(_2083);
        float _2087 = 0.0 + _2085;
        float _2089 = precise::clamp(_2087, 0.0, 1.0);
        _2029 = _2089;
    }
    float _2091 = _2029;
    float _2093 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[14].z, _2003);
    float _2095 = _2027 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _2097 = _155 * 0.03125;
    float _2099 = _163 * 0.03125;
    float _2101 = _2093 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _2103 = _1523 * _2091;
    int _2105 = _1839 + 656;
    uint _2107 = uint(int(uint(_2105) >> uint(2)));
    _29[int(_2107)] = as_type<uint>(_2095);
    int _2109 = _83 + 1;
    float _2111 = _2099;
    if (!_1557)
    {
        _215 = 1.0;
    }
    float _2113 = _215;
    int _2115 = _1865 + 784;
    uint _2117 = uint(int(uint(_2115) >> uint(2)));
    _29[int(_2117)] = as_type<uint>(_2097);
    float _2119 = _2113;
    if (_1557)
    {
        bool _2121 = _1799 >= _1173;
        bool _2123 = isnan(_1799);
        bool _2125 = _2121 || _2123;
        bool _2127 = isnan(_1173);
        bool _2129 = _2125 || _2127;
        float _2131 = float(_2129);
        _2119 = _2131;
    }
    float _2133 = _2119;
    float _2135 = fma(_197, (*spvDescriptorSet0.cp_c3)._m0[14].y, _167);
    int _2137 = _77 + 1;
    int _2139 = _1865 + 912;
    uint _2141 = uint(int(uint(_2139) >> uint(2)));
    _29[int(_2141)] = as_type<uint>(_2099);
    float _2143 = float(uint(_2109));
    float _2145 = _2133;
    if (_355)
    {
        _1205 = 1.0;
    }
    float _2147 = _1205;
    int _2149 = _1865 + 1040;
    uint _2151 = uint(int(uint(_2149) >> uint(2)));
    _29[int(_2151)] = as_type<uint>(_2101);
    int _2153 = _1865 + 1168;
    uint _2155 = uint(int(uint(_2153) >> uint(2)));
    _29[int(_2155)] = as_type<uint>(_2103);
    int _2157 = _961 + 784;
    uint _2159 = uint(int(uint(_2157) >> uint(2)));
    _29[int(_2159)] = as_type<uint>(_2097);
    float _2161 = _2147;
    if (!_355)
    {
        int _2163 = _391 << 4;
        int _2165 = _2163 + 1904;
        uint _2167 = uint(int(uint(_2165) >> uint(2)));
        uint _2169 = uint(int(uint(int(_2167)) >> uint(2)));
        int _2171 = int(_2167) & 3;
        float _2173 = (*spvDescriptorSet0.cp_c3)._m0[int(_2169)][_2171];
        int _2175 = int(_2167) + 1;
        uint _2177 = uint(int(uint(_2175) >> uint(2)));
        int _2179 = _2175 & 3;
        float _2181 = (*spvDescriptorSet0.cp_c3)._m0[int(_2177)][_2179];
        int _2183 = _2165 + 8;
        uint _2185 = uint(int(uint(_2183) >> uint(2)));
        uint _2187 = uint(int(uint(int(_2185)) >> uint(2)));
        int _2189 = int(_2185) & 3;
        float _2191 = (*spvDescriptorSet0.cp_c3)._m0[int(_2187)][_2189];
        int _2193 = int(_2185) + 1;
        uint _2195 = uint(int(uint(_2193) >> uint(2)));
        int _2197 = _2193 & 3;
        float _2199 = (*spvDescriptorSet0.cp_c3)._m0[int(_2195)][_2197];
        float _2201 = _197 * _2181;
        float _2203 = fma(_159, _2173, _2201);
        float _2205 = fma(_183, _2191, _2203);
        float _2207 = _2205 + _2199;
        float _2209 = precise::clamp(_2207, 0.0, 1.0);
        float _2211 = -_2209;
        float _2213 = _2211 + _855;
        float _2215 = fma(_2213, 500.0, 1.5);
        float _2217 = exp2(_2215);
        float _2219 = 0.0 + _2217;
        float _2221 = precise::clamp(_2219, 0.0, 1.0);
        _2161 = _2221;
    }
    float _2223 = _2161;
    float _2225 = fma(_209, (*spvDescriptorSet0.cp_c3)._m0[14].y, _1169);
    float _2227 = fma(_183, (*spvDescriptorSet0.cp_c3)._m0[14].z, _2135);
    float _2229 = float(uint(_2137));
    float _2231 = _2143 * 0.03125;
    float _2233 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[14].z, _2225);
    float _2235 = _2227 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _2237 = _2133 * _2223;
    float _2239 = _2229 * 0.03125;
    float _2241 = _2233 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    int _2243 = _961 + 912;
    uint _2245 = uint(int(uint(_2243) >> uint(2)));
    _29[int(_2245)] = as_type<uint>(_2231);
    float _2247 = _2223;
    if (!_1459)
    {
        _2247 = 1.0;
    }
    float _2249 = _2247;
    float _2251 = fma(_295, (*spvDescriptorSet0.cp_c3)._m0[14].y, _1169);
    int _2253 = _961 + 1040;
    uint _2255 = uint(int(uint(_2253) >> uint(2)));
    _29[int(_2255)] = as_type<uint>(_2235);
    float _2257 = _2249;
    if (_1459)
    {
        bool _2259 = _1805 >= _1421;
        bool _2261 = isnan(_1805);
        bool _2263 = _2259 || _2261;
        bool _2265 = isnan(_1421);
        bool _2267 = _2263 || _2265;
        float _2269 = float(_2267);
        _2257 = _2269;
    }
    float _2271 = _2257;
    if (_397)
    {
        _2145 = 1.0;
    }
    float _2273 = _2145;
    int _2275 = _961 + 1168;
    uint _2277 = uint(int(uint(_2275) >> uint(2)));
    _29[int(_2277)] = as_type<uint>(_2237);
    int _2279 = _1859 + 784;
    uint _2281 = uint(int(uint(_2279) >> uint(2)));
    _29[int(_2281)] = as_type<uint>(_2239);
    int _2283 = _1859 + 912;
    uint _2285 = uint(int(uint(_2283) >> uint(2)));
    _29[int(_2285)] = as_type<uint>(_2099);
    int _2287 = _1859 + 1040;
    uint _2289 = uint(int(uint(_2287) >> uint(2)));
    _29[int(_2289)] = as_type<uint>(_2241);
    float _2291 = _2273;
    if (!_397)
    {
        int _2293 = _461 << 4;
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
        float _2331 = _209 * _2311;
        float _2333 = fma(_225, _2303, _2331);
        float _2335 = fma(_173, _2321, _2333);
        float _2337 = _2335 + _2329;
        float _2339 = precise::clamp(_2337, 0.0, 1.0);
        float _2341 = -_2339;
        float _2343 = _2341 + _867;
        float _2345 = fma(_2343, 500.0, 1.5);
        float _2347 = exp2(_2345);
        float _2349 = 0.0 + _2347;
        float _2351 = precise::clamp(_2349, 0.0, 1.0);
        _2291 = _2351;
        _2111 = _2347;
    }
    float _2353 = _2291;
    float _2355 = _2111;
    float _2357 = _2271 * _2353;
    float _2359 = fma(_183, (*spvDescriptorSet0.cp_c3)._m0[14].z, _2251);
    float _2361 = _2355;
    float _2363 = _2353;
    if (_587)
    {
        _2361 = 1.0;
    }
    float _2365 = _2361;
    float _2367 = _2365;
    if (!_587)
    {
        int _2369 = _619 << 4;
        int _2371 = _2369 + 1904;
        uint _2373 = uint(int(uint(_2371) >> uint(2)));
        uint _2375 = uint(int(uint(int(_2373)) >> uint(2)));
        int _2377 = int(_2373) & 3;
        float _2379 = (*spvDescriptorSet0.cp_c3)._m0[int(_2375)][_2377];
        int _2381 = int(_2373) + 1;
        uint _2383 = uint(int(uint(_2381) >> uint(2)));
        int _2385 = _2381 & 3;
        float _2387 = (*spvDescriptorSet0.cp_c3)._m0[int(_2383)][_2385];
        int _2389 = _2371 + 8;
        uint _2391 = uint(int(uint(_2389) >> uint(2)));
        uint _2393 = uint(int(uint(int(_2391)) >> uint(2)));
        int _2395 = int(_2391) & 3;
        float _2397 = (*spvDescriptorSet0.cp_c3)._m0[int(_2393)][_2395];
        int _2399 = int(_2391) + 1;
        uint _2401 = uint(int(uint(_2399) >> uint(2)));
        int _2403 = _2399 & 3;
        float _2405 = (*spvDescriptorSet0.cp_c3)._m0[int(_2401)][_2403];
        float _2407 = _295 * _2387;
        float _2409 = fma(_225, _2379, _2407);
        float _2411 = fma(_183, _2397, _2409);
        float _2413 = _2411 + _2405;
        float _2415 = precise::clamp(_2413, 0.0, 1.0);
        float _2417 = -_2415;
        float _2419 = _2417 + _873;
        float _2421 = fma(_2419, 500.0, 1.5);
        float _2423 = exp2(_2421);
        float _2425 = 0.0 + _2423;
        float _2427 = precise::clamp(_2425, 0.0, 1.0);
        _2363 = _2379;
        _2367 = _2427;
    }
    float _2429 = _2363;
    float _2431 = _2367;
    uint _2433 = spvSubgroupBallot(true).x;
    float _2435 = _2429;
    if (!_1755)
    {
        _2435 = 1.0;
    }
    float _2437 = _2435;
    int _2439 = reverse_bits(int(_2433));
    float _2441 = _2437;
    if (_1755)
    {
        bool _2443 = _1811 >= _1729;
        bool _2445 = isnan(_1811);
        bool _2447 = _2443 || _2445;
        bool _2449 = isnan(_1729);
        bool _2451 = _2447 || _2449;
        float _2453 = float(_2451);
        _2441 = _2453;
    }
    float _2455 = _2441;
    float _2457 = _2359 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    int _2459 = _941 & 255;
    int _2461 = int(spvFindUMSB(uint(_2439)));
    bool _2463 = _2461 != (-1);
    int _2465 = _2461 ^ 31;
    int _2467 = _2463 ? _2465 : _2461;
    int _2469 = _1859 + 1168;
    uint _2471 = uint(int(uint(_2469) >> uint(2)));
    _29[int(_2471)] = as_type<uint>(_2357);
    float _2473 = _2455 * _2431;
    int _2475 = _909 * 6;
    int _2477 = popcount(int(_151));
    int _2479 = _1839 + 784;
    uint _2481 = uint(int(uint(_2479) >> uint(2)));
    _29[int(_2481)] = as_type<uint>(_2239);
    bool _2483 = as_type<int>(_60) != _2467;
    int _2485 = _2459 + 1;
    int _2487 = _1839 + 912;
    uint _2489 = uint(int(uint(_2487) >> uint(2)));
    _29[int(_2489)] = as_type<uint>(_2231);
    int _2491 = _2459 + 2;
    int _2493 = _1839 + 1040;
    uint _2495 = uint(int(uint(_2493) >> uint(2)));
    _29[int(_2495)] = as_type<uint>(_2457);
    int _2497 = _2459 + 3;
    int _2499 = _1839 + 1168;
    uint _2501 = uint(int(uint(_2499) >> uint(2)));
    _29[int(_2501)] = as_type<uint>(_2473);
    int _2503 = _2475 + 4372;
    int _2505 = _2503;
    int _2507 = _2459;
    _52(_2505, _2507, _29);
    int _2509 = _2475 + 4373;
    int _2511 = _2509;
    int _2513 = _2485;
    _52(_2511, _2513, _29);
    int _2515 = _2475 + 4374;
    int _2517 = _2515;
    int _2519 = _2491;
    _52(_2517, _2519, _29);
    int _2521 = _2475 + 4375;
    int _2523 = _2521;
    int _2525 = _2485;
    _52(_2523, _2525, _29);
    int _2527 = _2475 + 4376;
    int _2529 = _2527;
    int _2531 = _2497;
    _52(_2529, _2531, _29);
    int _2533 = _2475 + 4377;
    int _2535 = _2533;
    int _2537 = _2491;
    _52(_2535, _2537, _29);
    if (_2483)
    {
        return;
    }
    int _2539 = _2477 << 1;
    int _2541 = 4371;
    int _2543 = _2539;
    _52(_2541, _2543, _29);
}


struct dm_payload_t { uint w[64]; };
struct dm_vertex_t {
    float4 position [[position]];
    float4 a0 [[user(locn0)]];
};
using dm_mesh_t = metal::mesh<dm_vertex_t, void, 128, 64, metal::topology::triangle>;
[[mesh]] void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint dm_lid [[thread_position_in_threadgroup]], uint dm_tg [[threadgroup_position_in_grid]], dm_mesh_t dm_out, const object_data dm_payload_t& dm_payload [[payload]])
{
    threadgroup spvUnsafeArray<uint, 1141> _29;
    for (uint i = dm_lid; i < 1141u; i += 32u) _29[i] = 0u;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    for (uint i = dm_lid; i < 64u; i += 32u) _29[4u + i] = dm_payload.w[i];
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (dm_lid == 0u) { _29[0] = dm_tg; _29[4] = dm_tg; }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    dm_stage_body(spvDescriptorSet0, gl_SubgroupInvocationID, _29);
    threadgroup_barrier(mem_flags::mem_threadgroup);
    uint np = min(_29[1092] >> 24, 64u);
    if (dm_lid == 0u) dm_out.set_primitive_count(np);
    for (uint n = dm_lid; n < 128u; n += 32u)
    {
        uint b = 68u + (n / 32u) * 256u + n % 32u;
        dm_vertex_t v;
        v.position = float4(as_type<float>(_29[b + 0u]), as_type<float>(_29[b + 32u]), as_type<float>(_29[b + 64u]), as_type<float>(_29[b + 96u]));
        v.a0 = float4(as_type<float>(_29[b + 128u]), as_type<float>(_29[b + 160u]), as_type<float>(_29[b + 192u]), as_type<float>(_29[b + 224u]));
        v.position.z = fma(v.position.z, 0.5, v.position.w * 0.5);
        dm_out.set_vertex(n, v);
    }
    for (uint n = dm_lid; n < np * 3u; n += 32u)
    {
        uint at = 4372u + n;
        dm_out.set_index(n, (_29[at >> 2] >> ((at & 3u) * 8u)) & 0xffu);
    }
}

[[mesh]] void main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint dm_lid [[thread_position_in_threadgroup]], uint dm_tg [[threadgroup_position_in_grid]], dm_mesh_t dm_out, const object_data dm_payload_t& dm_payload [[payload]])
{
    threadgroup spvUnsafeArray<uint, 1141> _29;
    for (uint i = dm_lid; i < 1141u; i += 32u) _29[i] = 0u;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    for (uint i = dm_lid; i < 64u; i += 32u) _29[4u + i] = dm_payload.w[i];
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (dm_lid == 0u) { _29[0] = dm_tg; _29[4] = dm_tg; }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    dm_stage_body(spvDescriptorSet0, gl_SubgroupInvocationID, _29);
    threadgroup_barrier(mem_flags::mem_threadgroup);
    uint np = min(_29[1092] >> 24, 64u);
    if (dm_lid == 0u) dm_out.set_primitive_count(np);
    for (uint n = dm_lid; n < 128u; n += 32u)
    {
        uint b = 68u + (n / 32u) * 256u + n % 32u;
        dm_vertex_t v;
        v.position = float4(as_type<float>(_29[b + 0u]), as_type<float>(_29[b + 32u]), as_type<float>(_29[b + 64u]), as_type<float>(_29[b + 96u]));
        v.a0 = float4(as_type<float>(_29[b + 128u]), as_type<float>(_29[b + 160u]), as_type<float>(_29[b + 192u]), as_type<float>(_29[b + 224u]));
        dm_out.set_vertex(n, v);
    }
    for (uint n = dm_lid; n < np * 3u; n += 32u)
    {
        uint at = 4372u + n;
        dm_out.set_index(n, (_29[at >> 2] >> ((at & 3u) * 8u)) & 0xffu);
    }
}
