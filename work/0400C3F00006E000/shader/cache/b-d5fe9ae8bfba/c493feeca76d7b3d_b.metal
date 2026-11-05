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
void _52(thread const int& _6840, thread const int& _6841, threadgroup spvUnsafeArray<uint, 1141>& _29)
{
    uint _6844 = uint(int(uint(_6840) >> uint(2)));
    int _6846 = _6840 & 3;
    int _6848 = _6846 << 3;
    bool _6850;
    do
    {
        float _6852 = as_type<float>(_29[int(_6844)]);
        int _6854 = int(insert_bits(as_type<uint>(_6852), uint(_6841), uint(_6848), 8u));
        uint _6884 = as_type<uint>(_6852);
        uint _6889;
        do
        {
            _6889 = _6884;
        } while (!atomic_compare_exchange_weak_explicit((threadgroup atomic_uint*)&_29[int(_6844)], &_6889, uint(_6854), memory_order_relaxed, memory_order_relaxed) && _6889 == _6884);
        uint _6856 = _6889;
        _6850 = int(_6856) != as_type<int>(_6852);
    } while (_6850);
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
    float _171 = fma(_165, 2.0, _163);
    float _173 = fma(_167, (*spvDescriptorSet0.cp_c3)._m0[14].y, _169);
    float _175 = fma(_171, (*spvDescriptorSet0.cp_c3)._m0[14].z, _173);
    float _177 = _175 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _179 = -_177;
    bool _181 = _179 > (*spvDescriptorSet0.cp_c3)._m0[631].y;
    float _183 = -_177;
    bool _185 = _183 > (*spvDescriptorSet0.cp_c3)._m0[631].x;
    bool _187 = !_181;
    int _189 = _187 ? 0 : 1;
    int _191 = 2;
    float _193 = _165;
    if (!_181)
    {
        _191 = 1;
    }
    int _195 = _191;
    int _197 = _195;
    if (!_185)
    {
        _197 = _189;
    }
    int _199 = _197;
    float _201 = fma(_159, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    int _203 = _199 << 6;
    int _205 = _203 + 9952;
    uint _207 = uint(int(uint(_205) >> uint(2)));
    uint _209 = uint(int(uint(int(_207)) >> uint(2)));
    int _211 = int(_207) & 3;
    float _213 = (*spvDescriptorSet0.cp_c3)._m0[int(_209)][_211];
    int _215 = int(_207) + 1;
    uint _217 = uint(int(uint(_215) >> uint(2)));
    int _219 = _215 & 3;
    float _221 = (*spvDescriptorSet0.cp_c3)._m0[int(_217)][_219];
    int _223 = _203 + 9960;
    uint _225 = uint(int(uint(_223) >> uint(2)));
    uint _227 = uint(int(uint(int(_225)) >> uint(2)));
    int _229 = int(_225) & 3;
    float _231 = (*spvDescriptorSet0.cp_c3)._m0[int(_227)][_229];
    int _233 = int(_225) + 1;
    uint _235 = uint(int(uint(_233) >> uint(2)));
    int _237 = _233 & 3;
    float _239 = (*spvDescriptorSet0.cp_c3)._m0[int(_235)][_237];
    int _241 = _203 + 9904;
    uint _243 = uint(int(uint(_241) >> uint(2)));
    uint _245 = uint(int(uint(int(_243)) >> uint(2)));
    int _247 = int(_243) & 3;
    float _249 = (*spvDescriptorSet0.cp_c3)._m0[int(_245)][_247];
    int _251 = int(_243) + 1;
    uint _253 = uint(int(uint(_251) >> uint(2)));
    int _255 = _251 & 3;
    float _257 = (*spvDescriptorSet0.cp_c3)._m0[int(_253)][_255];
    int _259 = _203 + 9920;
    uint _261 = uint(int(uint(_259) >> uint(2)));
    uint _263 = uint(int(uint(int(_261)) >> uint(2)));
    int _265 = int(_261) & 3;
    float _267 = (*spvDescriptorSet0.cp_c3)._m0[int(_263)][_265];
    int _269 = int(_261) + 1;
    uint _271 = uint(int(uint(_269) >> uint(2)));
    int _273 = _269 & 3;
    float _275 = (*spvDescriptorSet0.cp_c3)._m0[int(_271)][_273];
    int _277 = _203 + 9912;
    uint _279 = uint(int(uint(_277) >> uint(2)));
    uint _281 = uint(int(uint(int(_279)) >> uint(2)));
    int _283 = int(_279) & 3;
    float _285 = (*spvDescriptorSet0.cp_c3)._m0[int(_281)][_283];
    int _287 = int(_279) + 1;
    uint _289 = uint(int(uint(_287) >> uint(2)));
    int _291 = _287 & 3;
    float _293 = (*spvDescriptorSet0.cp_c3)._m0[int(_289)][_291];
    int _295 = _203 + 9928;
    uint _297 = uint(int(uint(_295) >> uint(2)));
    uint _299 = uint(int(uint(int(_297)) >> uint(2)));
    int _301 = int(_297) & 3;
    float _303 = (*spvDescriptorSet0.cp_c3)._m0[int(_299)][_301];
    int _305 = int(_297) + 1;
    uint _307 = uint(int(uint(_305) >> uint(2)));
    int _309 = _305 & 3;
    float _311 = (*spvDescriptorSet0.cp_c3)._m0[int(_307)][_309];
    float _313 = _201 * _221;
    float _315 = fma(_161, _213, _313);
    float _317 = fma(_171, _231, _315);
    float _319 = _317 + _239;
    float _321 = _201 * _257;
    float _323 = 1.0 / _319;
    float _325 = fma(_161, _249, _321);
    float _327 = _201 * _275;
    float _329 = fma(_161, _267, _327);
    int _331 = _203 + 9936;
    float _333 = fma(_171, _285, _325);
    float _335 = _333 + _293;
    int _337 = _203 + 9936;
    uint _339 = uint(int(uint(_337) >> uint(2)));
    uint _341 = uint(int(uint(int(_339)) >> uint(2)));
    int _343 = int(_339) & 3;
    float _345 = (*spvDescriptorSet0.cp_c3)._m0[int(_341)][_343];
    int _347 = int(_339) + 1;
    uint _349 = uint(int(uint(_347) >> uint(2)));
    int _351 = _347 & 3;
    float _353 = (*spvDescriptorSet0.cp_c3)._m0[int(_349)][_351];
    float _355 = fma(_171, _303, _329);
    float _357 = _335 * _323;
    float _359 = _355 + _311;
    bool _361 = _357 >= 0.0;
    int _363 = _203 + 9944;
    uint _365 = uint(int(uint(_363) >> uint(2)));
    uint _367 = uint(int(uint(int(_365)) >> uint(2)));
    int _369 = int(_365) & 3;
    float _371 = (*spvDescriptorSet0.cp_c3)._m0[int(_367)][_369];
    float _373 = _359 * _323;
    bool _375 = _357 <= 1.0;
    bool _377 = _375 && _361;
    bool _379 = _373 >= 0.0;
    bool _381 = _379 && _377;
    bool _383 = _373 <= 1.0;
    bool _385 = _383 && _381;
    float _387 = 0.0;
    float _389 = _249;
    float _391 = as_type<float>(_199);
    if (_385)
    {
        int _393 = _331 + 12;
        uint _395 = uint(int(uint(_393) >> uint(2)));
        uint _397 = uint(int(uint(int(_395)) >> uint(2)));
        int _399 = int(_395) & 3;
        float _401 = (*spvDescriptorSet0.cp_c3)._m0[int(_397)][_399];
        _387 = _401;
    }
    float _403 = _387;
    if (_385)
    {
        float _405 = float(_199);
        _389 = _405;
    }
    float _407 = _389;
    float _409 = _407;
    if (_385)
    {
        float _411 = rint(_407);
        float _413 = precise::max(_411, 0.0);
        uint _415 = uint(_413);
        uint _417 = clamp(_415, 0u, 65535u);
        _409 = as_type<float>(_417);
    }
    float _419 = _409;
    float _421 = _201 * _353;
    float _423 = fma(_161, _345, _421);
    float _425 = fma(_171, _371, _423);
    if (_385)
    {
        float _427 = _425 + _403;
        _391 = _427;
    }
    float _429 = _391;
    float _431 = _429;
    if (_385)
    {
        float _433 = _429 * _323;
        _431 = _433;
    }
    float _435 = _431;
    float _437 = 0.0;
    if (_385)
    {
        float3 _3222 = float3(_357, _373, float(as_type<int>(_419)));
        float3 _3226 = select(_3222, float3(0.0), isnan(_3222));
        float _439 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _3226.xy, uint(rint(_3226.z)), _435, level(0.0));
        _437 = _439;
    }
    float _441 = _437;
    float _443 = float(as_type<uint>(_123));
    float _445 = _161 + 2.0;
    float _447 = as_type<float>(gl_SubgroupLtMask.x);
    float _449 = float(as_type<uint>(_119));
    float _451 = _445 * (*spvDescriptorSet0.cp_c3)._m0[14].x;
    float _453 = _171 + 2.0;
    float _455 = fma(_443, 9.9999997473787516355514526367188e-05, 1.10000002384185791015625);
    float _457 = float(as_type<uint>(_127));
    float _459 = fma(_449, 9.9999997473787516355514526367188e-05, 1.10000002384185791015625);
    float _461 = fma(_455, (*spvDescriptorSet0.cp_c3)._m0[14].y, _169);
    float _463 = fma(_457, 9.9999997473787516355514526367188e-05, 1.10000002384185791015625);
    float _465 = fma(_459, (*spvDescriptorSet0.cp_c3)._m0[14].y, _451);
    float _467 = fma(_453, (*spvDescriptorSet0.cp_c3)._m0[14].z, _461);
    float _469 = _161 * (*spvDescriptorSet0.cp_c3)._m0[117].x;
    float _471 = fma(_463, (*spvDescriptorSet0.cp_c3)._m0[14].y, _451);
    float _473 = fma(_171, (*spvDescriptorSet0.cp_c3)._m0[14].z, _465);
    float _475 = _467 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _477 = _161 * (*spvDescriptorSet0.cp_c3)._m0[118].x;
    float _479 = _445 * (*spvDescriptorSet0.cp_c3)._m0[117].x;
    float _481 = _473 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _483 = -_475;
    bool _485 = _483 > (*spvDescriptorSet0.cp_c3)._m0[631].x;
    float _487 = -_475;
    bool _489 = _487 > (*spvDescriptorSet0.cp_c3)._m0[631].y;
    float _491 = fma(_201, (*spvDescriptorSet0.cp_c3)._m0[117].y, _469);
    float _493 = -_481;
    bool _495 = _493 > (*spvDescriptorSet0.cp_c3)._m0[631].y;
    float _497 = -_481;
    bool _499 = _497 > (*spvDescriptorSet0.cp_c3)._m0[631].x;
    float _501 = fma(_171, (*spvDescriptorSet0.cp_c3)._m0[117].z, _491);
    int _503 = int(_151) & as_type<int>(_447);
    float _505 = fma(_453, (*spvDescriptorSet0.cp_c3)._m0[14].z, _471);
    float _507 = fma(_201, (*spvDescriptorSet0.cp_c3)._m0[118].y, _477);
    float _509 = _501 + (*spvDescriptorSet0.cp_c3)._m0[117].w;
    bool _511 = !_495;
    int _513 = _511 ? 0 : 1;
    float _515 = _505 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _517 = fma(_171, (*spvDescriptorSet0.cp_c3)._m0[118].z, _507);
    bool _519 = !_489;
    int _521 = _519 ? 0 : 1;
    float _523 = trunc(_509);
    int _525 = int(_523);
    int _527 = 2;
    int _529 = 2;
    int _531 = 2;
    float _533 = _509;
    if (!_495)
    {
        _527 = 1;
    }
    int _535 = _527;
    float _537 = _517 + (*spvDescriptorSet0.cp_c3)._m0[118].w;
    int _539 = _535;
    if (!_499)
    {
        _539 = _513;
    }
    int _541 = _539;
    float _543 = fma(_443, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    float _545 = as_type<float>(_541);
    if (!_489)
    {
        _529 = 1;
    }
    int _547 = _529;
    float _549 = fma(_449, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    float _551 = -_515;
    bool _553 = _551 > (*spvDescriptorSet0.cp_c3)._m0[631].x;
    float _555 = fma(_543, (*spvDescriptorSet0.cp_c3)._m0[117].y, _469);
    float _557 = -_515;
    bool _559 = _557 > (*spvDescriptorSet0.cp_c3)._m0[631].y;
    int _561 = popcount(_503);
    int _563 = _547;
    if (!_485)
    {
        _563 = _521;
    }
    int _565 = _563;
    float _567 = fma(_453, (*spvDescriptorSet0.cp_c3)._m0[117].z, _555);
    float _569 = fma(_543, (*spvDescriptorSet0.cp_c3)._m0[118].y, _477);
    int _571 = _541 << 6;
    float _573 = fma(_457, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    int _575 = _565 << 6;
    float _577 = _567 + (*spvDescriptorSet0.cp_c3)._m0[117].w;
    float _579 = trunc(_537);
    int _581 = int(_579);
    int _583 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].y);
    int _585 = _525 + _583;
    int _587 = _585 + 1;
    int _589 = _575 + 9952;
    uint _591 = uint(int(uint(_589) >> uint(2)));
    uint _593 = uint(int(uint(int(_591)) >> uint(2)));
    int _595 = int(_591) & 3;
    float _597 = (*spvDescriptorSet0.cp_c3)._m0[int(_593)][_595];
    int _599 = int(_591) + 1;
    uint _601 = uint(int(uint(_599) >> uint(2)));
    int _603 = _599 & 3;
    float _605 = (*spvDescriptorSet0.cp_c3)._m0[int(_601)][_603];
    float _607 = fma(_453, (*spvDescriptorSet0.cp_c3)._m0[118].z, _569);
    bool _609 = !_559;
    int _611 = _609 ? 0 : 1;
    float _613 = fma(_573, (*spvDescriptorSet0.cp_c3)._m0[117].y, _479);
    bool _615 = _587 >= 0;
    float _617 = _607 + (*spvDescriptorSet0.cp_c3)._m0[118].w;
    int _619 = _561 << 2;
    int _621 = _575 + 9904;
    uint _623 = uint(int(uint(_621) >> uint(2)));
    uint _625 = uint(int(uint(int(_623)) >> uint(2)));
    int _627 = int(_623) & 3;
    float _629 = (*spvDescriptorSet0.cp_c3)._m0[int(_625)][_627];
    int _631 = int(_623) + 1;
    uint _633 = uint(int(uint(_631) >> uint(2)));
    int _635 = _631 & 3;
    float _637 = (*spvDescriptorSet0.cp_c3)._m0[int(_633)][_635];
    bool _639 = _587 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _641 = !_615;
    bool _643 = _639 || _641;
    float _645 = trunc(_617);
    int _647 = int(_645);
    int _649 = _619 + 1;
    float _651 = as_type<float>(_565);
    int _653 = _571;
    if (!_559)
    {
        _531 = 1;
    }
    int _655 = _531;
    int _657 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].z);
    int _659 = _581 + _657;
    int _661 = _659 + 1;
    int _663 = _575 + 9920;
    uint _665 = uint(int(uint(_663) >> uint(2)));
    uint _667 = uint(int(uint(int(_665)) >> uint(2)));
    int _669 = int(_665) & 3;
    float _671 = (*spvDescriptorSet0.cp_c3)._m0[int(_667)][_669];
    int _673 = int(_665) + 1;
    uint _675 = uint(int(uint(_673) >> uint(2)));
    int _677 = _673 & 3;
    float _679 = (*spvDescriptorSet0.cp_c3)._m0[int(_675)][_677];
    uint _681 = uint(int(uint(_649) >> uint(5)));
    int _683 = _649 << 2;
    float _685 = trunc(_577);
    int _687 = int(_685);
    bool _689 = _661 < 0;
    bool _691 = _689 || _643;
    int _693 = _575 + 9960;
    uint _695 = uint(int(uint(_693) >> uint(2)));
    uint _697 = uint(int(uint(int(_695)) >> uint(2)));
    int _699 = int(_695) & 3;
    float _701 = (*spvDescriptorSet0.cp_c3)._m0[int(_697)][_699];
    int _703 = int(_695) + 1;
    uint _705 = uint(int(uint(_703) >> uint(2)));
    int _707 = _703 & 3;
    float _709 = (*spvDescriptorSet0.cp_c3)._m0[int(_705)][_707];
    int _711 = 124 & _683;
    bool _713 = _661 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _715 = _713 || _691;
    int _717 = int(_681) << 10;
    int _719 = _717 + _711;
    float _721 = fma(_549, (*spvDescriptorSet0.cp_c3)._m0[117].y, _479);
    int _723 = _655;
    if (!_553)
    {
        _723 = _611;
    }
    int _725 = _723;
    int _727 = _575 + 9912;
    uint _729 = uint(int(uint(_727) >> uint(2)));
    uint _731 = uint(int(uint(int(_729)) >> uint(2)));
    int _733 = int(_729) & 3;
    float _735 = (*spvDescriptorSet0.cp_c3)._m0[int(_731)][_733];
    int _737 = int(_729) + 1;
    uint _739 = uint(int(uint(_737) >> uint(2)));
    int _741 = _737 & 3;
    float _743 = (*spvDescriptorSet0.cp_c3)._m0[int(_739)][_741];
    float _745 = _445 * (*spvDescriptorSet0.cp_c3)._m0[118].x;
    float _747 = fma(_171, (*spvDescriptorSet0.cp_c3)._m0[117].z, _721);
    int _749 = _725 << 6;
    int _751 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].y);
    int _753 = _687 + _751;
    int _755 = _753 + 1;
    float _757 = fma(_549, (*spvDescriptorSet0.cp_c3)._m0[118].y, _745);
    int _759 = _571 + 9904;
    uint _761 = uint(int(uint(_759) >> uint(2)));
    uint _763 = uint(int(uint(int(_761)) >> uint(2)));
    int _765 = int(_761) & 3;
    float _767 = (*spvDescriptorSet0.cp_c3)._m0[int(_763)][_765];
    int _769 = int(_761) + 1;
    uint _771 = uint(int(uint(_769) >> uint(2)));
    int _773 = _769 & 3;
    float _775 = (*spvDescriptorSet0.cp_c3)._m0[int(_771)][_773];
    int _777 = _687;
    if (!_715)
    {
        int _779 = _661 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
        int _781 = _779 + _587;
        _777 = _781;
    }
    int _783 = _777;
    float _785 = _747 + (*spvDescriptorSet0.cp_c3)._m0[117].w;
    int _787 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].z);
    int _789 = _647 + _787;
    int _791 = _789 + 1;
    float _793 = fma(_171, (*spvDescriptorSet0.cp_c3)._m0[118].z, _757);
    bool _795 = _755 >= 0;
    float _797 = trunc(_785);
    int _799 = int(_797);
    int _801 = _575 + 9928;
    uint _803 = uint(int(uint(_801) >> uint(2)));
    uint _805 = uint(int(uint(int(_803)) >> uint(2)));
    int _807 = int(_803) & 3;
    float _809 = (*spvDescriptorSet0.cp_c3)._m0[int(_805)][_807];
    int _811 = int(_803) + 1;
    uint _813 = uint(int(uint(_811) >> uint(2)));
    int _815 = _811 & 3;
    float _817 = (*spvDescriptorSet0.cp_c3)._m0[int(_813)][_815];
    float _819 = _543 * _605;
    float _821 = _793 + (*spvDescriptorSet0.cp_c3)._m0[118].w;
    bool _823 = _755 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _825 = !_795;
    bool _827 = _823 || _825;
    float _829 = fma(_161, _597, _819);
    float _831 = trunc(_821);
    int _833 = int(_831);
    bool _835 = _791 < 0;
    bool _837 = _835 || _827;
    int _839 = _575 + 9936;
    uint _841 = uint(int(uint(_839) >> uint(2)));
    uint _843 = uint(int(uint(int(_841)) >> uint(2)));
    int _845 = int(_841) & 3;
    float _847 = (*spvDescriptorSet0.cp_c3)._m0[int(_843)][_845];
    int _849 = int(_841) + 1;
    uint _851 = uint(int(uint(_849) >> uint(2)));
    int _853 = _849 & 3;
    float _855 = (*spvDescriptorSet0.cp_c3)._m0[int(_851)][_853];
    float _857 = _543 * _637;
    bool _859 = _791 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _861 = _859 || _837;
    float _863 = fma(_161, _629, _857);
    int _865 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].y);
    int _867 = _799 + _865;
    int _869 = _867 + 1;
    float _871 = 0.0;
    int _873 = _869;
    if (!_715)
    {
        float _875 = floor(_509);
        _871 = _875;
    }
    float _877 = _871;
    float _879 = _543 * _679;
    float _881 = fma(_453, (*spvDescriptorSet0.cp_c3)._m0[117].z, _613);
    int _883 = _575 + 9944;
    uint _885 = uint(int(uint(_883) >> uint(2)));
    uint _887 = uint(int(uint(int(_885)) >> uint(2)));
    int _889 = int(_885) & 3;
    float _891 = (*spvDescriptorSet0.cp_c3)._m0[int(_887)][_889];
    bool _893 = _869 >= 0;
    float _895 = fma(_161, _671, _879);
    float _897 = fma(_573, (*spvDescriptorSet0.cp_c3)._m0[118].y, _745);
    float _899 = _881 + (*spvDescriptorSet0.cp_c3)._m0[117].w;
    int _901 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].z);
    int _903 = _833 + _901;
    int _905 = _903 + 1;
    float _907 = fma(_453, _701, _829);
    float _909 = fma(_453, (*spvDescriptorSet0.cp_c3)._m0[118].z, _897);
    int _911 = _571 + 9920;
    uint _913 = uint(int(uint(_911) >> uint(2)));
    uint _915 = uint(int(uint(int(_913)) >> uint(2)));
    int _917 = int(_913) & 3;
    float _919 = (*spvDescriptorSet0.cp_c3)._m0[int(_915)][_917];
    int _921 = int(_913) + 1;
    uint _923 = uint(int(uint(_921) >> uint(2)));
    int _925 = _921 & 3;
    float _927 = (*spvDescriptorSet0.cp_c3)._m0[int(_923)][_925];
    float _929 = trunc(_899);
    int _931 = int(_929);
    float _933 = _907 + _709;
    float _935 = _909 + (*spvDescriptorSet0.cp_c3)._m0[118].w;
    bool _937 = _869 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _939 = !_893;
    bool _941 = _937 || _939;
    float _943 = _935;
    if (!_715)
    {
        float _945 = -_877;
        float _947 = _509 + _945;
        _533 = _947;
    }
    float _949 = _533;
    float _951 = fma(_453, _735, _863);
    int _953 = _575 + 9936;
    int _955 = _571 + 9952;
    uint _957 = uint(int(uint(_955) >> uint(2)));
    uint _959 = uint(int(uint(int(_957)) >> uint(2)));
    int _961 = int(_957) & 3;
    float _963 = (*spvDescriptorSet0.cp_c3)._m0[int(_959)][_961];
    int _965 = int(_957) + 1;
    uint _967 = uint(int(uint(_965) >> uint(2)));
    int _969 = _965 & 3;
    float _971 = (*spvDescriptorSet0.cp_c3)._m0[int(_967)][_969];
    float _973 = 1.0 / _933;
    float _975 = _951 + _743;
    bool _977 = _905 < 0;
    bool _979 = _977 || _941;
    float _981 = _549 * _775;
    bool _983 = _905 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _985 = _983 || _979;
    int _987 = _571 + 9936;
    uint _989 = uint(int(uint(_987) >> uint(2)));
    uint _991 = uint(int(uint(int(_989)) >> uint(2)));
    int _993 = int(_989) & 3;
    float _995 = (*spvDescriptorSet0.cp_c3)._m0[int(_991)][_993];
    int _997 = int(_989) + 1;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    int _1001 = _997 & 3;
    float _1003 = (*spvDescriptorSet0.cp_c3)._m0[int(_999)][_1001];
    float _1005 = trunc(_935);
    int _1007 = int(_1005);
    float _1009 = fma(_445, _767, _981);
    int _1011 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].y);
    int _1013 = _931 + _1011;
    int _1015 = _1013 + 1;
    float _1017 = fma(_453, _809, _895);
    bool _1019 = _1015 >= 0;
    int _1021 = _571 + 9960;
    uint _1023 = uint(int(uint(_1021) >> uint(2)));
    uint _1025 = uint(int(uint(int(_1023)) >> uint(2)));
    int _1027 = int(_1023) & 3;
    float _1029 = (*spvDescriptorSet0.cp_c3)._m0[int(_1025)][_1027];
    int _1031 = int(_1023) + 1;
    uint _1033 = uint(int(uint(_1031) >> uint(2)));
    int _1035 = _1031 & 3;
    float _1037 = (*spvDescriptorSet0.cp_c3)._m0[int(_1033)][_1035];
    float _1039 = _975 * _973;
    float _1041 = _1017 + _817;
    bool _1043 = _1015 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _1045 = !_1019;
    bool _1047 = _1043 || _1045;
    uint _1049 = uint(_1015);
    float _1051 = _973;
    if (!_985)
    {
        int _1053 = _905 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
        int _1055 = _1053 + _869;
        _873 = _1055;
    }
    int _1057 = _873;
    float _1059 = 0.0;
    if (!_861)
    {
        float _1061 = floor(_577);
        _1059 = _1061;
    }
    float _1063 = _1059;
    float _1065 = _543 * _855;
    bool _1067 = _1039 >= 0.0;
    int _1069 = _749 + 9952;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    uint _1073 = uint(int(uint(int(_1071)) >> uint(2)));
    int _1075 = int(_1071) & 3;
    float _1077 = (*spvDescriptorSet0.cp_c3)._m0[int(_1073)][_1075];
    int _1079 = int(_1071) + 1;
    uint _1081 = uint(int(uint(_1079) >> uint(2)));
    int _1083 = _1079 & 3;
    float _1085 = (*spvDescriptorSet0.cp_c3)._m0[int(_1081)][_1083];
    int _1087 = ~as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].z);
    int _1089 = _1007 + _1087;
    int _1091 = _1089 + 1;
    float _1093 = fma(_161, _847, _1065);
    int _1095 = as_type<int>(_1065);
    if (!_861)
    {
        int _1097 = _791 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
        int _1099 = _1097 + _755;
        _1095 = _1099;
    }
    int _1101 = _1095;
    float _1103 = _1041 * _973;
    bool _1105 = _1091 < 0;
    bool _1107 = _1105 || _1047;
    float _1109 = 0.0;
    if (!_715)
    {
        float _1111 = floor(_537);
        _1109 = _1111;
    }
    float _1113 = _1109;
    bool _1115 = _1039 <= 1.0;
    bool _1117 = _1115 && _1067;
    int _1119 = _749 + 9960;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    uint _1123 = uint(int(uint(int(_1121)) >> uint(2)));
    int _1125 = int(_1121) & 3;
    float _1127 = (*spvDescriptorSet0.cp_c3)._m0[int(_1123)][_1125];
    int _1129 = int(_1121) + 1;
    uint _1131 = uint(int(uint(_1129) >> uint(2)));
    int _1133 = _1129 & 3;
    float _1135 = (*spvDescriptorSet0.cp_c3)._m0[int(_1131)][_1133];
    bool _1137 = _1091 >= as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
    bool _1139 = _1137 || _1107;
    float _1141 = fma(_453, _891, _1093);
    int _1143 = 0;
    if (!_861)
    {
        int _1145 = _1101 << 2;
        _1143 = _1145;
    }
    int _1147 = _1143;
    int _1149 = 0;
    int _1151 = _1147;
    if (!_861)
    {
        uint _1153 = uint(int(uint(_1101) >> uint(2)));
        _1149 = int(_1153);
    }
    int _1155 = _1149;
    int _1157 = _1155;
    if (!_861)
    {
        int _1159 = 12 & _1147;
        _1151 = _1159;
    }
    int _1161 = _1151;
    int _1163 = _749 + 9904;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    uint _1167 = uint(int(uint(int(_1165)) >> uint(2)));
    int _1169 = int(_1165) & 3;
    float _1171 = (*spvDescriptorSet0.cp_c3)._m0[int(_1167)][_1169];
    int _1173 = int(_1165) + 1;
    uint _1175 = uint(int(uint(_1173) >> uint(2)));
    int _1177 = _1173 & 3;
    float _1179 = (*spvDescriptorSet0.cp_c3)._m0[int(_1175)][_1177];
    bool _1181 = _1103 >= 0.0;
    bool _1183 = _1181 && _1117;
    float _1185 = _549 * _927;
    float _1187 = as_type<float>(_1161);
    if (!_861)
    {
        int _1189 = _1155 << 4;
        int _1191 = _1189 + _1161;
        _1187 = as_type<float>(_1191);
    }
    float _1193 = _1187;
    if (!_985)
    {
        int _1195 = _1057 << 2;
        _1157 = _1195;
    }
    int _1197 = _1157;
    int _1199 = _1197;
    if (!_1139)
    {
        int _1201 = _1091 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[116].x);
        int _1203 = _1201 + _1015;
        _1049 = uint(_1203);
    }
    uint _1205 = _1049;
    bool _1207 = _1103 <= 1.0;
    bool _1209 = _1207 && _1183;
    int _1211 = _749 + 9920;
    uint _1213 = uint(int(uint(_1211) >> uint(2)));
    uint _1215 = uint(int(uint(int(_1213)) >> uint(2)));
    int _1217 = int(_1213) & 3;
    float _1219 = (*spvDescriptorSet0.cp_c3)._m0[int(_1215)][_1217];
    int _1221 = int(_1213) + 1;
    uint _1223 = uint(int(uint(_1221) >> uint(2)));
    int _1225 = _1221 & 3;
    float _1227 = (*spvDescriptorSet0.cp_c3)._m0[int(_1223)][_1225];
    if (!_985)
    {
        int _1229 = 12 & _1197;
        _1199 = _1229;
    }
    int _1231 = _1199;
    float _1233 = _549 * _971;
    float _1235 = fma(_445, _919, _1185);
    float _1237 = as_type<float>(_1091);
    float _1239 = _1113;
    int _1241 = as_type<int>(_1233);
    int _1243 = _1231;
    if (!_861)
    {
        float _1245 = floor(_617);
        _1237 = _1245;
    }
    float _1247 = _1237;
    if (!_715)
    {
        float _1249 = -_1113;
        float _1251 = _537 + _1249;
        _1239 = _1251;
    }
    float _1253 = _1239;
    float _1255 = fma(_445, _963, _1233);
    if (!_1139)
    {
        uint _1257 = uint(int(uint(int(_1205)) >> uint(2)));
        _1241 = int(_1257);
    }
    int _1259 = _1241;
    int _1261 = _571 + 9912;
    uint _1263 = uint(int(uint(_1261) >> uint(2)));
    uint _1265 = uint(int(uint(int(_1263)) >> uint(2)));
    int _1267 = int(_1263) & 3;
    float _1269 = (*spvDescriptorSet0.cp_c3)._m0[int(_1265)][_1267];
    int _1271 = int(_1263) + 1;
    uint _1273 = uint(int(uint(_1271) >> uint(2)));
    int _1275 = _1271 & 3;
    float _1277 = (*spvDescriptorSet0.cp_c3)._m0[int(_1273)][_1275];
    if (_1209)
    {
        float _1279 = float(_565);
        _651 = _1279;
    }
    float _1281 = _651;
    int _1283 = _571 + 9928;
    uint _1285 = uint(int(uint(_1283) >> uint(2)));
    uint _1287 = uint(int(uint(int(_1285)) >> uint(2)));
    int _1289 = int(_1285) & 3;
    float _1291 = (*spvDescriptorSet0.cp_c3)._m0[int(_1287)][_1289];
    int _1293 = int(_1285) + 1;
    uint _1295 = uint(int(uint(_1293) >> uint(2)));
    int _1297 = _1293 & 3;
    float _1299 = (*spvDescriptorSet0.cp_c3)._m0[int(_1295)][_1297];
    float _1301 = fma(_171, _1029, _1255);
    float _1303 = _1281;
    float _1305 = _1037;
    if (_1209)
    {
        float _1307 = rint(_1281);
        float _1309 = precise::max(_1307, 0.0);
        uint _1311 = uint(_1309);
        uint _1313 = clamp(_1311, 0u, 65535u);
        _1303 = as_type<float>(_1313);
    }
    float _1315 = _1303;
    float _1317 = _1247;
    if (!_861)
    {
        float _1319 = -_1247;
        float _1321 = _617 + _1319;
        _1317 = _1321;
    }
    float _1323 = _1317;
    float _1325 = _1301 + _1037;
    int _1327 = _571 + 9944;
    uint _1329 = uint(int(uint(_1327) >> uint(2)));
    uint _1331 = uint(int(uint(int(_1329)) >> uint(2)));
    int _1333 = int(_1329) & 3;
    float _1335 = (*spvDescriptorSet0.cp_c3)._m0[int(_1331)][_1333];
    int _1337 = int(_1329) + 1;
    uint _1339 = uint(int(uint(_1337) >> uint(2)));
    int _1341 = _1337 & 3;
    float _1343 = (*spvDescriptorSet0.cp_c3)._m0[int(_1339)][_1341];
    float _1345 = _573 * _1085;
    float _1347 = 1.0 / _1325;
    float _1349 = fma(_445, _1077, _1345);
    int _1351 = _749 + 9936;
    uint _1353 = uint(int(uint(_1351) >> uint(2)));
    uint _1355 = uint(int(uint(int(_1353)) >> uint(2)));
    int _1357 = int(_1353) & 3;
    float _1359 = (*spvDescriptorSet0.cp_c3)._m0[int(_1355)][_1357];
    int _1361 = int(_1353) + 1;
    uint _1363 = uint(int(uint(_1361) >> uint(2)));
    int _1365 = _1361 & 3;
    float _1367 = (*spvDescriptorSet0.cp_c3)._m0[int(_1363)][_1365];
    int _1369 = as_type<int>(_1085);
    if (!_985)
    {
        uint _1371 = uint(int(uint(_1057) >> uint(2)));
        _653 = int(_1371);
    }
    int _1373 = _653;
    float _1375 = fma(_453, _1127, _1349);
    float _1377 = as_type<float>(_1373);
    if (!_985)
    {
        int _1379 = _1373 << 4;
        int _1381 = _1379 + _1231;
        _1377 = as_type<float>(_1381);
    }
    float _1383 = _1377;
    if (!_1139)
    {
        int _1385 = int(_1205) << 2;
        _1243 = _1385;
    }
    int _1387 = _1243;
    int _1389 = _749 + 9928;
    uint _1391 = uint(int(uint(_1389) >> uint(2)));
    uint _1393 = uint(int(uint(int(_1391)) >> uint(2)));
    int _1395 = int(_1391) & 3;
    float _1397 = (*spvDescriptorSet0.cp_c3)._m0[int(_1393)][_1395];
    int _1399 = int(_1391) + 1;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    int _1403 = _1399 & 3;
    float _1405 = (*spvDescriptorSet0.cp_c3)._m0[int(_1401)][_1403];
    float _1407 = _573 * _1179;
    int _1409 = _1387;
    if (!_1139)
    {
        int _1411 = 12 & _1387;
        _1409 = _1411;
    }
    int _1413 = _1409;
    float _1415 = fma(_445, _1171, _1407);
    float _1417 = as_type<float>(_1413);
    int _1419 = as_type<int>(_1415);
    if (!_1139)
    {
        int _1421 = _1259 << 4;
        int _1423 = _1421 + _1413;
        _1369 = _1423;
    }
    int _1425 = _1369;
    int _1427 = _749 + 9944;
    uint _1429 = uint(int(uint(_1427) >> uint(2)));
    uint _1431 = uint(int(uint(int(_1429)) >> uint(2)));
    int _1433 = int(_1429) & 3;
    float _1435 = (*spvDescriptorSet0.cp_c3)._m0[int(_1431)][_1433];
    int _1437 = int(_1429) + 1;
    uint _1439 = uint(int(uint(_1437) >> uint(2)));
    int _1441 = _1437 & 3;
    float _1443 = (*spvDescriptorSet0.cp_c3)._m0[int(_1439)][_1441];
    float _1445 = _1375 + _1135;
    float _1447 = _573 * _1227;
    int _1449 = as_type<int>(_1447);
    float _1451 = as_type<float>(_1425);
    if (!_1139)
    {
        float _1453 = floor(_899);
        _1417 = _1453;
    }
    float _1455 = _1417;
    float _1457 = fma(_445, _1219, _1447);
    if (!_715)
    {
        int _1459 = _783 << 2;
        _1449 = _1459;
    }
    int _1461 = _1449;
    int _1463 = _749 + 9912;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    uint _1467 = uint(int(uint(int(_1465)) >> uint(2)));
    int _1469 = int(_1465) & 3;
    float _1471 = (*spvDescriptorSet0.cp_c3)._m0[int(_1467)][_1469];
    int _1473 = int(_1465) + 1;
    uint _1475 = uint(int(uint(_1473) >> uint(2)));
    int _1477 = _1473 & 3;
    float _1479 = (*spvDescriptorSet0.cp_c3)._m0[int(_1475)][_1477];
    float _1481 = fma(_171, _1269, _1009);
    float _1483 = 1.0 / _1445;
    int _1485 = _1461;
    if (!_715)
    {
        int _1487 = 12 & _1461;
        _1485 = _1487;
    }
    int _1489 = _1485;
    float _1491 = _549 * _1003;
    float _1493 = _1193;
    if (!_861)
    {
        int _1495 = as_type<int>(_1193) + 256;
        uint _1497 = uint(int(uint(_1495) >> uint(2)));
        uint _1499 = uint(int(uint(int(_1497)) >> uint(2)));
        int _1501 = int(_1497) & 3;
        float _1503 = (*spvDescriptorSet0.cp_c3)._m0[int(_1499)][_1501];
        _1493 = _1503;
    }
    float _1505 = _1493;
    float _1507 = fma(_171, _1291, _1235);
    float _1509 = fma(_445, _995, _1491);
    float _1511 = _1507 + _1299;
    float _1513 = _1491;
    float _1515 = _1507;
    if (!_985)
    {
        float _1517 = floor(_821);
        _1513 = _1517;
    }
    float _1519 = _1513;
    float _1521 = fma(_171, _1335, _1509);
    float _1523 = _1003;
    if (_1209)
    {
        int _1525 = _953 + 12;
        uint _1527 = uint(int(uint(_1525) >> uint(2)));
        uint _1529 = uint(int(uint(int(_1527)) >> uint(2)));
        int _1531 = int(_1527) & 3;
        float _1533 = (*spvDescriptorSet0.cp_c3)._m0[int(_1529)][_1531];
        _1523 = _1533;
    }
    float _1535 = _1523;
    if (!_385)
    {
        _1515 = 1.0;
    }
    float _1537 = _1515;
    float _1539 = _1521 + _1343;
    float _1541 = _1511 * _1347;
    float _1543 = _573 * _1367;
    float _1545 = _1383;
    float _1547 = _1537;
    if (!_985)
    {
        int _1549 = as_type<int>(_1383) + 256;
        uint _1551 = uint(int(uint(_1549) >> uint(2)));
        uint _1553 = uint(int(uint(int(_1551)) >> uint(2)));
        int _1555 = int(_1551) & 3;
        float _1557 = (*spvDescriptorSet0.cp_c3)._m0[int(_1553)][_1555];
        _1545 = _1557;
    }
    float _1559 = _1545;
    float _1561 = as_type<float>(_953);
    if (!_985)
    {
        float _1563 = floor(_785);
        _1561 = _1563;
    }
    float _1565 = _1561;
    float _1567 = fma(_445, _1359, _1543);
    float _1569 = _1519;
    if (!_985)
    {
        float _1571 = -_1519;
        float _1573 = _821 + _1571;
        _1569 = _1573;
    }
    float _1575 = _1569;
    float _1577 = fma(_453, _1397, _1457);
    float _1579 = _1077;
    float _1581 = _1577;
    if (!_1139)
    {
        int _1583 = _1425 + 256;
        uint _1585 = uint(int(uint(_1583) >> uint(2)));
        uint _1587 = uint(int(uint(int(_1585)) >> uint(2)));
        int _1589 = int(_1585) & 3;
        float _1591 = (*spvDescriptorSet0.cp_c3)._m0[int(_1587)][_1589];
        _1579 = _1591;
    }
    float _1593 = _1579;
    float _1595 = _1577 + _1405;
    float _1597 = fma(_453, _1435, _1567);
    float _1599 = _1481 + _1277;
    if (!_985)
    {
        float _1601 = -_1565;
        float _1603 = _785 + _1601;
        _1305 = _1603;
    }
    float _1605 = _1305;
    float _1607 = _1277;
    if (!_1139)
    {
        float _1609 = floor(_935);
        _1607 = _1609;
    }
    float _1611 = _1607;
    if (!_1139)
    {
        float _1613 = -_1455;
        float _1615 = _899 + _1613;
        _1451 = _1615;
    }
    float _1617 = _1451;
    float _1619 = _1599 * _1347;
    float _1621 = _1597 + _1443;
    float _1623 = fma(_453, _1471, _1415);
    if (!_715)
    {
        uint _1625 = uint(int(uint(_783) >> uint(2)));
        _1419 = int(_1625);
    }
    int _1627 = _1419;
    bool _1629 = _1619 >= 0.0;
    float _1631 = _1623 + _1479;
    int _1633 = _1627;
    if (!_715)
    {
        int _1635 = _1627 << 4;
        int _1637 = _1635 + _1489;
        _1633 = _1637;
    }
    int _1639 = _1633;
    if (_385)
    {
        bool _1641 = _441 >= _435;
        bool _1643 = isnan(_441);
        bool _1645 = _1641 || _1643;
        bool _1647 = isnan(_435);
        bool _1649 = _1645 || _1647;
        float _1651 = float(_1649);
        _1547 = _1651;
    }
    float _1653 = _1547;
    float _1655 = _1631 * _1483;
    float _1657 = _1481;
    if (!_861)
    {
        float _1659 = rint(_1505);
        float _1661 = precise::max(_1659, 0.0);
        uint _1663 = uint(_1661);
        uint _1665 = clamp(_1663, 0u, 65535u);
        _1657 = as_type<float>(_1665);
    }
    float _1667 = _1657;
    float _1669 = _1511;
    if (!_715)
    {
        int _1671 = _1639 + 256;
        uint _1673 = uint(int(uint(_1671) >> uint(2)));
        uint _1675 = uint(int(uint(int(_1673)) >> uint(2)));
        int _1677 = int(_1673) & 3;
        float _1679 = (*spvDescriptorSet0.cp_c3)._m0[int(_1675)][_1677];
        _1669 = _1679;
    }
    float _1681 = _1669;
    float _1683 = _1611;
    if (!_1139)
    {
        float _1685 = -_1611;
        float _1687 = _935 + _1685;
        _943 = _1687;
    }
    float _1689 = _943;
    if (!_861)
    {
        float _1691 = -_1063;
        float _1693 = _577 + _1691;
        _1683 = _1693;
    }
    float _1695 = _1683;
    bool _1697 = _1619 <= 1.0;
    bool _1699 = _1697 && _1629;
    bool _1701 = _1655 >= 0.0;
    if (_1209)
    {
        float _1703 = _1141 + _1535;
        _1581 = _1703;
    }
    float _1705 = _1581;
    float _1707 = _1539 * _1347;
    float _1709 = _1595 * _1483;
    bool _1711 = _1655 <= 1.0;
    bool _1713 = _1711 && _1701;
    float _1715 = _1705;
    if (_1209)
    {
        float _1717 = _1705 * _973;
        _1051 = _1717;
    }
    float _1719 = _1051;
    bool _1721 = _1541 >= 0.0;
    bool _1723 = _1721 && _1699;
    float _1725 = _1621 * _1483;
    bool _1727 = _1709 >= 0.0;
    bool _1729 = _1727 && _1713;
    float _1731 = _1595;
    if (!_985)
    {
        float _1733 = rint(_1559);
        float _1735 = precise::max(_1733, 0.0);
        uint _1737 = uint(_1735);
        uint _1739 = clamp(_1737, 0u, 65535u);
        _1731 = as_type<float>(_1739);
    }
    float _1741 = _1731;
    float _1743 = _1593;
    if (!_1139)
    {
        float _1745 = rint(_1593);
        float _1747 = precise::max(_1745, 0.0);
        uint _1749 = uint(_1747);
        uint _1751 = clamp(_1749, 0u, 65535u);
        _1743 = as_type<float>(_1751);
    }
    float _1753 = _1743;
    float _1755 = _1667;
    if (!_861)
    {
        float3 _5358 = float3(_1695, _1323, float(as_type<int>(_1667)));
        float3 _5360 = select(_5358, float3(0.0), isnan(_5358));
        float _1757 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _5360.xy, uint(rint(_5360.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _5360.xy, uint(rint(_5360.z)), level(0.0)).x;
        _1755 = _1757;
    }
    float _1759 = _1755;
    bool _1761 = _1709 <= 1.0;
    bool _1763 = _1761 && _1729;
    bool _1765 = _1541 <= 1.0;
    bool _1767 = _1765 && _1723;
    float _1769 = _1741;
    if (!_985)
    {
        float3 _5386 = float3(_1605, _1575, float(as_type<int>(_1741)));
        float3 _5388 = select(_5386, float3(0.0), isnan(_5386));
        float _1771 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _5388.xy, uint(rint(_5388.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _5388.xy, uint(rint(_5388.z)), level(0.0)).x;
        _1769 = _1771;
    }
    float _1773 = _1769;
    if (_1763)
    {
        float _1775 = float(_725);
        _1715 = _1775;
    }
    float _1777 = _1715;
    float _1779 = _1753;
    float _1781 = _1777;
    if (!_1139)
    {
        float3 _5412 = float3(_1617, _1689, float(as_type<int>(_1753)));
        float3 _5414 = select(_5412, float3(0.0), isnan(_5412));
        float _1783 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _5414.xy, uint(rint(_5414.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _5414.xy, uint(rint(_5414.z)), level(0.0)).x;
        _1779 = _1783;
    }
    float _1785 = _1779;
    float _1787 = _1315;
    if (_1209)
    {
        float3 _5429 = float3(_1039, _1103, float(as_type<int>(_1315)));
        float3 _5431 = select(_5429, float3(0.0), isnan(_5429));
        float _1789 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _5431.xy, uint(rint(_5431.z)), _1719, level(0.0));
        _1787 = _1789;
    }
    float _1791 = _1787;
    if (_1767)
    {
        float _1793 = float(_541);
        _545 = _1793;
    }
    float _1795 = _545;
    if (_1763)
    {
        float _1797 = rint(_1777);
        float _1799 = precise::max(_1797, 0.0);
        uint _1801 = uint(_1799);
        uint _1803 = clamp(_1801, 0u, 65535u);
        _1781 = as_type<float>(_1803);
    }
    float _1805 = _1781;
    float _1807 = as_type<float>(_1639);
    if (_1767)
    {
        float _1809 = rint(_1795);
        float _1811 = precise::max(_1809, 0.0);
        uint _1813 = uint(_1811);
        uint _1815 = clamp(_1813, 0u, 65535u);
        _1807 = as_type<float>(_1815);
    }
    float _1817 = _1807;
    float _1819 = _785;
    if (!_715)
    {
        float _1821 = rint(_1681);
        float _1823 = precise::max(_1821, 0.0);
        uint _1825 = uint(_1823);
        uint _1827 = clamp(_1825, 0u, 65535u);
        _1819 = as_type<float>(_1827);
    }
    float _1829 = _1819;
    float _1831 = _1817;
    if (_1767)
    {
        float3 _5499 = float3(_1619, _1541, float(as_type<int>(_1817)));
        float3 _5501 = select(_5499, float3(0.0), isnan(_5499));
        float _1833 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _5501.xy, uint(rint(_5501.z)), _1707, level(0.0));
        _1831 = _1833;
    }
    float _1835 = _1831;
    float _1837 = _1805;
    if (_1763)
    {
        float3 _5516 = float3(_1655, _1709, float(as_type<int>(_1805)));
        float3 _5518 = select(_5516, float3(0.0), isnan(_5516));
        float _1839 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_A).sample_compare(spvDescriptorSet0.cp_t_tcb_ASmplr, _5518.xy, uint(rint(_5518.z)), _1725, level(0.0));
        _1837 = _1839;
    }
    float _1841 = _1837;
    float _1843 = _1829;
    if (!_715)
    {
        float3 _5534 = float3(_949, _1253, float(as_type<int>(_1829)));
        float3 _5536 = select(_5534, float3(0.0), isnan(_5534));
        float _1845 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _5536.xy, uint(rint(_5536.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _5536.xy, uint(rint(_5536.z)), level(0.0)).x;
        _1843 = _1845;
    }
    float _1847 = _1843;
    float _1849 = _161 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
    int _1851 = _619 << 2;
    uint _1853 = uint(int(uint(_619) >> uint(5)));
    float _1855 = fma(_201, (*spvDescriptorSet0.cp_c3)._m0[5].y, _1849);
    int _1857 = _619 + 2;
    int _1859 = 124 & _1851;
    float _1861 = fma(_171, (*spvDescriptorSet0.cp_c3)._m0[5].z, _1855);
    int _1863 = _1857 << 2;
    int _1865 = int(_1853) << 10;
    int _1867 = _1865 + _1859;
    float _1869 = _1861 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    int _1871 = _619 + 3;
    float _1873 = _161 * (*spvDescriptorSet0.cp_c3)._m0[6].x;
    uint _1875 = uint(int(uint(_1857) >> uint(5)));
    float _1877 = _161 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    int _1879 = 124 & _1863;
    int _1881 = _1867 + 272;
    uint _1883 = uint(int(uint(_1881) >> uint(2)));
    _29[int(_1883)] = as_type<uint>(_1869);
    float _1885 = _161 * (*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _1887 = fma(_201, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1877);
    int _1889 = int(_1875) << 10;
    int _1891 = _1889 + _1879;
    float _1893 = fma(_201, (*spvDescriptorSet0.cp_c3)._m0[6].y, _1873);
    float _1895 = fma(_201, (*spvDescriptorSet0.cp_c3)._m0[8].y, _1885);
    float _1897 = fma(_543, (*spvDescriptorSet0.cp_c3)._m0[5].y, _1849);
    float _1899 = fma(_171, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1887);
    float _1901 = fma(_171, (*spvDescriptorSet0.cp_c3)._m0[6].z, _1893);
    float _1903 = fma(_171, (*spvDescriptorSet0.cp_c3)._m0[8].z, _1895);
    int _1905 = _1871 << 2;
    float _1907 = fma(_453, (*spvDescriptorSet0.cp_c3)._m0[5].z, _1897);
    uint _1909 = uint(int(uint(_1871) >> uint(5)));
    float _1911 = _1901 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    int _1913 = 124 & _1905;
    float _1915 = _1899 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    float _1917 = _1903 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _1919 = fma(_543, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1877);
    int _1921 = int(_1909) << 10;
    int _1923 = _1921 + _1913;
    float _1925 = fma(_543, (*spvDescriptorSet0.cp_c3)._m0[6].y, _1873);
    float _1927 = _445 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _1929 = _1907 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    float _1931 = fma(_543, (*spvDescriptorSet0.cp_c3)._m0[8].y, _1885);
    float _1933 = fma(_453, (*spvDescriptorSet0.cp_c3)._m0[6].z, _1925);
    float _1935 = _445 * (*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _1937 = _445 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    int _1939 = _1867 + 400;
    uint _1941 = uint(int(uint(_1939) >> uint(2)));
    _29[int(_1941)] = as_type<uint>(_1911);
    float _1943 = _445 * (*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _1945 = _1933 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    float _1947 = fma(_453, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1919);
    int _1949 = _1867 + 528;
    uint _1951 = uint(int(uint(_1949) >> uint(2)));
    _29[int(_1951)] = as_type<uint>(_1915);
    float _1953 = fma(_453, (*spvDescriptorSet0.cp_c3)._m0[8].z, _1931);
    float _1955 = fma(_573, (*spvDescriptorSet0.cp_c3)._m0[5].y, _1927);
    float _1957 = fma(_573, (*spvDescriptorSet0.cp_c3)._m0[6].y, _1935);
    int _1959 = _1867 + 656;
    uint _1961 = uint(int(uint(_1959) >> uint(2)));
    _29[int(_1961)] = as_type<uint>(_1917);
    float _1963 = _1947 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    float _1965 = fma(_549, (*spvDescriptorSet0.cp_c3)._m0[5].y, _1927);
    float _1967 = _1953 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    int _1969 = _719 + 272;
    uint _1971 = uint(int(uint(_1969) >> uint(2)));
    _29[int(_1971)] = as_type<uint>(_1929);
    float _1973 = fma(_453, (*spvDescriptorSet0.cp_c3)._m0[5].z, _1955);
    float _1975 = fma(_549, (*spvDescriptorSet0.cp_c3)._m0[6].y, _1935);
    float _1977 = fma(_171, (*spvDescriptorSet0.cp_c3)._m0[5].z, _1965);
    int _1979 = _719 + 400;
    uint _1981 = uint(int(uint(_1979) >> uint(2)));
    _29[int(_1981)] = as_type<uint>(_1945);
    float _1983 = fma(_453, (*spvDescriptorSet0.cp_c3)._m0[6].z, _1957);
    float _1985 = fma(_549, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1937);
    float _1987 = fma(_171, (*spvDescriptorSet0.cp_c3)._m0[6].z, _1975);
    float _1989 = _1977 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    int _1991 = _719 + 528;
    uint _1993 = uint(int(uint(_1991) >> uint(2)));
    _29[int(_1993)] = as_type<uint>(_1963);
    float _1995 = fma(_549, (*spvDescriptorSet0.cp_c3)._m0[8].y, _1943);
    float _1997 = fma(_171, (*spvDescriptorSet0.cp_c3)._m0[7].z, _1985);
    float _1999 = _1987 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    int _2001 = _719 + 656;
    uint _2003 = uint(int(uint(_2001) >> uint(2)));
    _29[int(_2003)] = as_type<uint>(_1967);
    float _2005 = fma(_573, (*spvDescriptorSet0.cp_c3)._m0[7].y, _1937);
    float _2007 = fma(_171, (*spvDescriptorSet0.cp_c3)._m0[8].z, _1995);
    float _2009 = _1997 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    float _2011 = _1973 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    float _2013 = fma(_453, (*spvDescriptorSet0.cp_c3)._m0[7].z, _2005);
    float _2015 = _2007 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    int _2017 = _1891 + 272;
    uint _2019 = uint(int(uint(_2017) >> uint(2)));
    _29[int(_2019)] = as_type<uint>(_1989);
    float _2021 = _1983 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    float _2023 = _2013 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    float _2025 = float(uint(_77));
    int _2027 = _1891 + 400;
    uint _2029 = uint(int(uint(_2027) >> uint(2)));
    _29[int(_2029)] = as_type<uint>(_1999);
    float _2031 = _1927;
    if (_715)
    {
        _2031 = 1.0;
    }
    float _2033 = _2031;
    int _2035 = _1891 + 528;
    uint _2037 = uint(int(uint(_2035) >> uint(2)));
    _29[int(_2037)] = as_type<uint>(_2009);
    float _2039 = fma(_201, (*spvDescriptorSet0.cp_c3)._m0[14].y, _169);
    int _2041 = _1891 + 656;
    uint _2043 = uint(int(uint(_2041) >> uint(2)));
    _29[int(_2043)] = as_type<uint>(_2015);
    float _2045 = fma(_573, (*spvDescriptorSet0.cp_c3)._m0[8].y, _1943);
    int _2047 = _1923 + 272;
    uint _2049 = uint(int(uint(_2047) >> uint(2)));
    _29[int(_2049)] = as_type<uint>(_2011);
    float _2051 = fma(_453, (*spvDescriptorSet0.cp_c3)._m0[8].z, _2045);
    int _2053 = _1923 + 400;
    uint _2055 = uint(int(uint(_2053) >> uint(2)));
    _29[int(_2055)] = as_type<uint>(_2021);
    int _2057 = _1923 + 528;
    uint _2059 = uint(int(uint(_2057) >> uint(2)));
    _29[int(_2059)] = as_type<uint>(_2023);
    float _2061 = _2033;
    if (!_715)
    {
        int _2063 = _783 << 4;
        int _2065 = _2063 + 1904;
        uint _2067 = uint(int(uint(_2065) >> uint(2)));
        uint _2069 = uint(int(uint(int(_2067)) >> uint(2)));
        int _2071 = int(_2067) & 3;
        float _2073 = (*spvDescriptorSet0.cp_c3)._m0[int(_2069)][_2071];
        int _2075 = int(_2067) + 1;
        uint _2077 = uint(int(uint(_2075) >> uint(2)));
        int _2079 = _2075 & 3;
        float _2081 = (*spvDescriptorSet0.cp_c3)._m0[int(_2077)][_2079];
        int _2083 = _2065 + 8;
        uint _2085 = uint(int(uint(_2083) >> uint(2)));
        uint _2087 = uint(int(uint(int(_2085)) >> uint(2)));
        int _2089 = int(_2085) & 3;
        float _2091 = (*spvDescriptorSet0.cp_c3)._m0[int(_2087)][_2089];
        int _2093 = int(_2085) + 1;
        uint _2095 = uint(int(uint(_2093) >> uint(2)));
        int _2097 = _2093 & 3;
        float _2099 = (*spvDescriptorSet0.cp_c3)._m0[int(_2095)][_2097];
        float _2101 = _201 * _2081;
        float _2103 = fma(_161, _2073, _2101);
        float _2105 = fma(_171, _2091, _2103);
        float _2107 = _2105 + _2099;
        float _2109 = precise::clamp(_2107, 0.0, 1.0);
        float _2111 = -_2109;
        float _2113 = _2111 + _1847;
        float _2115 = fma(_2113, 500.0, 1.5);
        float _2117 = exp2(_2115);
        float _2119 = 0.0 + _2117;
        float _2121 = precise::clamp(_2119, 0.0, 1.0);
        _2061 = _2121;
    }
    float _2123 = _2061;
    float _2125 = fma(_171, (*spvDescriptorSet0.cp_c3)._m0[14].z, _2039);
    float _2127 = _2051 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _2129 = _2025 * 0.03125;
    float _2131 = _165 * 0.03125;
    float _2133 = _2125 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _2135 = _1653 * _2123;
    int _2137 = _1923 + 656;
    uint _2139 = uint(int(uint(_2137) >> uint(2)));
    _29[int(_2139)] = as_type<uint>(_2127);
    int _2141 = _83 + 1;
    if (!_1209)
    {
        _193 = 1.0;
    }
    float _2143 = _193;
    int _2145 = _1867 + 784;
    uint _2147 = uint(int(uint(_2145) >> uint(2)));
    _29[int(_2147)] = as_type<uint>(_2129);
    int _2149 = _77 + 1;
    float _2151 = fma(_543, (*spvDescriptorSet0.cp_c3)._m0[14].y, _169);
    float _2153 = _2143;
    if (_1209)
    {
        bool _2155 = _1791 >= _1719;
        bool _2157 = isnan(_1791);
        bool _2159 = _2155 || _2157;
        bool _2161 = isnan(_1719);
        bool _2163 = _2159 || _2161;
        float _2165 = float(_2163);
        _2153 = _2165;
    }
    float _2167 = _2153;
    int _2169 = _1867 + 912;
    uint _2171 = uint(int(uint(_2169) >> uint(2)));
    _29[int(_2171)] = as_type<uint>(_2131);
    float _2173 = float(uint(_2141));
    if (_861)
    {
        _153 = 1.0;
    }
    float _2175 = _153;
    int _2177 = _1867 + 1040;
    uint _2179 = uint(int(uint(_2177) >> uint(2)));
    _29[int(_2179)] = as_type<uint>(_2133);
    int _2181 = _1867 + 1168;
    uint _2183 = uint(int(uint(_2181) >> uint(2)));
    _29[int(_2183)] = as_type<uint>(_2135);
    int _2185 = _719 + 784;
    uint _2187 = uint(int(uint(_2185) >> uint(2)));
    _29[int(_2187)] = as_type<uint>(_2129);
    float _2189 = _2175;
    if (!_861)
    {
        int _2191 = _1101 << 4;
        int _2193 = _2191 + 1904;
        uint _2195 = uint(int(uint(_2193) >> uint(2)));
        uint _2197 = uint(int(uint(int(_2195)) >> uint(2)));
        int _2199 = int(_2195) & 3;
        float _2201 = (*spvDescriptorSet0.cp_c3)._m0[int(_2197)][_2199];
        int _2203 = int(_2195) + 1;
        uint _2205 = uint(int(uint(_2203) >> uint(2)));
        int _2207 = _2203 & 3;
        float _2209 = (*spvDescriptorSet0.cp_c3)._m0[int(_2205)][_2207];
        int _2211 = _2193 + 8;
        uint _2213 = uint(int(uint(_2211) >> uint(2)));
        uint _2215 = uint(int(uint(int(_2213)) >> uint(2)));
        int _2217 = int(_2213) & 3;
        float _2219 = (*spvDescriptorSet0.cp_c3)._m0[int(_2215)][_2217];
        int _2221 = int(_2213) + 1;
        uint _2223 = uint(int(uint(_2221) >> uint(2)));
        int _2225 = _2221 & 3;
        float _2227 = (*spvDescriptorSet0.cp_c3)._m0[int(_2223)][_2225];
        float _2229 = _543 * _2209;
        float _2231 = fma(_161, _2201, _2229);
        float _2233 = fma(_453, _2219, _2231);
        float _2235 = _2233 + _2227;
        float _2237 = precise::clamp(_2235, 0.0, 1.0);
        float _2239 = -_2237;
        float _2241 = _2239 + _1759;
        float _2243 = fma(_2241, 500.0, 1.5);
        float _2245 = exp2(_2243);
        float _2247 = 0.0 + _2245;
        float _2249 = precise::clamp(_2247, 0.0, 1.0);
        _2189 = _2249;
    }
    float _2251 = _2189;
    float _2253 = fma(_549, (*spvDescriptorSet0.cp_c3)._m0[14].y, _451);
    float _2255 = fma(_453, (*spvDescriptorSet0.cp_c3)._m0[14].z, _2151);
    float _2257 = float(uint(_2149));
    float _2259 = _2173 * 0.03125;
    float _2261 = fma(_171, (*spvDescriptorSet0.cp_c3)._m0[14].z, _2253);
    float _2263 = _2255 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    float _2265 = _2167 * _2251;
    float _2267 = _2257 * 0.03125;
    float _2269 = _2261 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    int _2271 = _719 + 912;
    uint _2273 = uint(int(uint(_2271) >> uint(2)));
    _29[int(_2273)] = as_type<uint>(_2259);
    float _2275 = _2261;
    float _2277 = _2251;
    if (!_1767)
    {
        _2275 = 1.0;
    }
    float _2279 = _2275;
    float _2281 = fma(_573, (*spvDescriptorSet0.cp_c3)._m0[14].y, _451);
    int _2283 = _719 + 1040;
    uint _2285 = uint(int(uint(_2283) >> uint(2)));
    _29[int(_2285)] = as_type<uint>(_2263);
    float _2287 = _2279;
    if (_1767)
    {
        bool _2289 = _1835 >= _1707;
        bool _2291 = isnan(_1835);
        bool _2293 = _2289 || _2291;
        bool _2295 = isnan(_1707);
        bool _2297 = _2293 || _2295;
        float _2299 = float(_2297);
        _2287 = _2299;
    }
    float _2301 = _2287;
    float _2303 = _2301;
    if (_985)
    {
        _2277 = 1.0;
    }
    float _2305 = _2277;
    int _2307 = _719 + 1168;
    uint _2309 = uint(int(uint(_2307) >> uint(2)));
    _29[int(_2309)] = as_type<uint>(_2265);
    int _2311 = _1891 + 784;
    uint _2313 = uint(int(uint(_2311) >> uint(2)));
    _29[int(_2313)] = as_type<uint>(_2267);
    int _2315 = _1891 + 912;
    uint _2317 = uint(int(uint(_2315) >> uint(2)));
    _29[int(_2317)] = as_type<uint>(_2131);
    int _2319 = _1891 + 1040;
    uint _2321 = uint(int(uint(_2319) >> uint(2)));
    _29[int(_2321)] = as_type<uint>(_2269);
    float _2323 = _2305;
    if (!_985)
    {
        int _2325 = _1057 << 4;
        int _2327 = _2325 + 1904;
        uint _2329 = uint(int(uint(_2327) >> uint(2)));
        uint _2331 = uint(int(uint(int(_2329)) >> uint(2)));
        int _2333 = int(_2329) & 3;
        float _2335 = (*spvDescriptorSet0.cp_c3)._m0[int(_2331)][_2333];
        int _2337 = int(_2329) + 1;
        uint _2339 = uint(int(uint(_2337) >> uint(2)));
        int _2341 = _2337 & 3;
        float _2343 = (*spvDescriptorSet0.cp_c3)._m0[int(_2339)][_2341];
        int _2345 = _2327 + 8;
        uint _2347 = uint(int(uint(_2345) >> uint(2)));
        uint _2349 = uint(int(uint(int(_2347)) >> uint(2)));
        int _2351 = int(_2347) & 3;
        float _2353 = (*spvDescriptorSet0.cp_c3)._m0[int(_2349)][_2351];
        int _2355 = int(_2347) + 1;
        uint _2357 = uint(int(uint(_2355) >> uint(2)));
        int _2359 = _2355 & 3;
        float _2361 = (*spvDescriptorSet0.cp_c3)._m0[int(_2357)][_2359];
        float _2363 = _549 * _2343;
        float _2365 = fma(_445, _2335, _2363);
        float _2367 = fma(_171, _2353, _2365);
        float _2369 = _2367 + _2361;
        float _2371 = precise::clamp(_2369, 0.0, 1.0);
        float _2373 = -_2371;
        float _2375 = _2373 + _1773;
        float _2377 = fma(_2375, 500.0, 1.5);
        float _2379 = exp2(_2377);
        float _2381 = 0.0 + _2379;
        float _2383 = precise::clamp(_2381, 0.0, 1.0);
        _2323 = _2383;
    }
    float _2385 = _2323;
    float _2387 = _2301 * _2385;
    float _2389 = fma(_453, (*spvDescriptorSet0.cp_c3)._m0[14].z, _2281);
    float _2391 = _2385;
    if (_1139)
    {
        _2391 = 1.0;
    }
    float _2393 = _2391;
    float _2395 = _2393;
    if (!_1139)
    {
        int _2397 = int(_1205) << 4;
        int _2399 = _2397 + 1904;
        uint _2401 = uint(int(uint(_2399) >> uint(2)));
        uint _2403 = uint(int(uint(int(_2401)) >> uint(2)));
        int _2405 = int(_2401) & 3;
        float _2407 = (*spvDescriptorSet0.cp_c3)._m0[int(_2403)][_2405];
        int _2409 = int(_2401) + 1;
        uint _2411 = uint(int(uint(_2409) >> uint(2)));
        int _2413 = _2409 & 3;
        float _2415 = (*spvDescriptorSet0.cp_c3)._m0[int(_2411)][_2413];
        int _2417 = _2399 + 8;
        uint _2419 = uint(int(uint(_2417) >> uint(2)));
        uint _2421 = uint(int(uint(int(_2419)) >> uint(2)));
        int _2423 = int(_2419) & 3;
        float _2425 = (*spvDescriptorSet0.cp_c3)._m0[int(_2421)][_2423];
        int _2427 = int(_2419) + 1;
        uint _2429 = uint(int(uint(_2427) >> uint(2)));
        int _2431 = _2427 & 3;
        float _2433 = (*spvDescriptorSet0.cp_c3)._m0[int(_2429)][_2431];
        float _2435 = _573 * _2415;
        float _2437 = fma(_445, _2407, _2435);
        float _2439 = fma(_453, _2425, _2437);
        float _2441 = _2439 + _2433;
        float _2443 = precise::clamp(_2441, 0.0, 1.0);
        float _2445 = -_2443;
        float _2447 = _2445 + _1785;
        float _2449 = fma(_2447, 500.0, 1.5);
        float _2451 = exp2(_2449);
        float _2453 = 0.0 + _2451;
        float _2455 = precise::clamp(_2453, 0.0, 1.0);
        _2303 = _2451;
        _2395 = _2455;
    }
    float _2457 = _2303;
    float _2459 = _2395;
    uint _2461 = spvSubgroupBallot(true).x;
    float _2463 = _2457;
    if (!_1763)
    {
        _2463 = 1.0;
    }
    float _2465 = _2463;
    int _2467 = reverse_bits(int(_2461));
    float _2469 = _2465;
    if (_1763)
    {
        bool _2471 = _1841 >= _1725;
        bool _2473 = isnan(_1841);
        bool _2475 = _2471 || _2473;
        bool _2477 = isnan(_1725);
        bool _2479 = _2475 || _2477;
        float _2481 = float(_2479);
        _2469 = _2481;
    }
    float _2483 = _2469;
    float _2485 = _2389 + (*spvDescriptorSet0.cp_c3)._m0[14].w;
    int _2487 = _619 & 255;
    int _2489 = int(spvFindUMSB(uint(_2467)));
    bool _2491 = _2489 != (-1);
    int _2493 = _2489 ^ 31;
    int _2495 = _2491 ? _2493 : _2489;
    int _2497 = _1891 + 1168;
    uint _2499 = uint(int(uint(_2497) >> uint(2)));
    _29[int(_2499)] = as_type<uint>(_2387);
    float _2501 = _2483 * _2459;
    int _2503 = _561 * 6;
    int _2505 = _2487 + 1;
    int _2507 = _1923 + 784;
    uint _2509 = uint(int(uint(_2507) >> uint(2)));
    _29[int(_2509)] = as_type<uint>(_2267);
    bool _2511 = as_type<int>(_60) != _2495;
    int _2513 = popcount(int(_151));
    int _2515 = _1923 + 912;
    uint _2517 = uint(int(uint(_2515) >> uint(2)));
    _29[int(_2517)] = as_type<uint>(_2259);
    int _2519 = _2487 + 2;
    int _2521 = _2487 + 3;
    int _2523 = _1923 + 1040;
    uint _2525 = uint(int(uint(_2523) >> uint(2)));
    _29[int(_2525)] = as_type<uint>(_2485);
    int _2527 = _1923 + 1168;
    uint _2529 = uint(int(uint(_2527) >> uint(2)));
    _29[int(_2529)] = as_type<uint>(_2501);
    int _2531 = _2503 + 4372;
    int _2533 = _2531;
    int _2535 = _2487;
    _52(_2533, _2535, _29);
    int _2537 = _2503 + 4373;
    int _2539 = _2537;
    int _2541 = _2505;
    _52(_2539, _2541, _29);
    int _2543 = _2503 + 4374;
    int _2545 = _2543;
    int _2547 = _2519;
    _52(_2545, _2547, _29);
    int _2549 = _2503 + 4375;
    int _2551 = _2549;
    int _2553 = _2505;
    _52(_2551, _2553, _29);
    int _2555 = _2503 + 4376;
    int _2557 = _2555;
    int _2559 = _2521;
    _52(_2557, _2559, _29);
    int _2561 = _2503 + 4377;
    int _2563 = _2561;
    int _2565 = _2519;
    _52(_2563, _2565, _29);
    if (_2511)
    {
        return;
    }
    int _2567 = _2513 << 1;
    int _2569 = 4371;
    int _2571 = _2567;
    _52(_2569, _2571, _29);
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
