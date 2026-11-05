#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

using namespace metal;

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

struct _25
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c4 [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    device _25* cp_s0 [[id(2)]];
    device _25* cp_s1 [[id(3)]];
};

static inline __attribute__((always_inline))
void _48(thread const int& _6708, thread const int& _6709, threadgroup spvUnsafeArray<uint, 3541>& _35)
{
    uint _6712 = uint(int(uint(_6708) >> uint(2)));
    int _6714 = _6708 & 3;
    int _6716 = _6714 << 3;
    bool _6718;
    do
    {
        float _6720 = as_type<float>(_35[int(_6712)]);
        int _6722 = int(insert_bits(as_type<uint>(_6720), uint(_6709), uint(_6716), 8u));
        uint _6752 = as_type<uint>(_6720);
        uint _6757;
        do
        {
            _6757 = _6752;
        } while (!atomic_compare_exchange_weak_explicit((threadgroup atomic_uint*)&_35[int(_6712)], &_6757, uint(_6722), memory_order_relaxed, memory_order_relaxed) && _6757 == _6752);
        uint _6724 = _6757;
        _6718 = int(_6724) != as_type<int>(_6720);
    } while (_6718);
}

static inline __attribute__((always_inline)) void dm_stage_body(constant spvDescriptorSetBuffer0& spvDescriptorSet0, uint gl_SubgroupInvocationID, threadgroup spvUnsafeArray<uint, 3541>& _35)
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _1341 = false;
    bool _2239 = false;
    float _52 = as_type<float>(_35[4]);
    int _54 = as_type<int>(_52) << 2;
    int _56 = _54 + 32;
    uint _59 = uint(int(uint(_56) >> uint(2)));
    float _61 = as_type<float>(_35[int(_59)]);
    int _63 = as_type<int>(_61) << 6;
    int _65 = _63 + 28;
    uint _67 = uint(int(uint(_65) >> uint(2)));
    float _69 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_67)]);
    float _71 = as_type<float>(gl_SubgroupInvocationID);
    int _73 = as_type<int>(_71) + 1;
    bool _77 = uint(_73) >= as_type<uint>(_69);
    if (_77)
    {
        return;
    }
    int _79 = as_type<int>(_61) << 5;
    int _81 = _79 + as_type<int>(_71);
    int _83 = _81 * 48;
    int _85 = _83 + 44;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    float _89 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_87)]);
    bool _91 = _89 != 0.0;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.0);
    bool _99 = _95 || _97;
    int _101 = _81;
    if (!_99)
    {
        return;
    }
    int _103 = _63 + 44;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    float _107 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_105)]);
    bool _109 = _89 >= 0.0;
    float _111 = _109 ? 1.0 : (-1.0);
    float _113 = -_107;
    float _115 = fma(_89, _111, _113);
    float _117 = precise::max(0.0, _115);
    bool _119 = _117 != 0.0;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan(0.0);
    bool _127 = _123 || _125;
    float _129 = _111 * _117;
    uint _131 = uint(int(uint(_85) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_131)] = as_type<uint>(_129);
    if (!_127)
    {
        return;
    }
    bool _133 = uint(_81) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].z);
    if (_133)
    {
        int _135 = ~as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z);
        int _137 = _81 + _135;
        int _139 = _137 + 1;
        _101 = _139;
    }
    int _141 = _101;
    int _143 = _141 + 1;
    bool _145 = uint(_143) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].z);
    int _147 = _143;
    if (_145)
    {
        int _149 = ~as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].z);
        int _151 = _143 + _149;
        int _153 = _151 + 1;
        _147 = _153;
    }
    int _155 = _147;
    int _157 = _155 * 48;
    int _159 = _157 + 44;
    uint _161 = uint(int(uint(_159) >> uint(2)));
    float _163 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_161)]);
    bool _165 = _163 >= 0.0;
    if (!_165)
    {
        return;
    }
    int _167 = _157 + 16;
    int _169 = _141 * 48;
    uint _171 = uint(int(uint(_167) >> uint(2)));
    float _173 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_171)]);
    int _175 = _167 + 4;
    uint _177 = uint(int(uint(_175) >> uint(2)));
    float _179 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_177)]);
    int _181 = _167 + 8;
    uint _183 = uint(int(uint(_181) >> uint(2)));
    float _185 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_183)]);
    int _187 = _157 + 32;
    int _189 = _169 + 16;
    uint _191 = uint(int(uint(_157) >> uint(2)));
    float _193 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_191)]);
    int _195 = _157 + 4;
    uint _197 = uint(int(uint(_195) >> uint(2)));
    float _199 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_197)]);
    int _201 = _157 + 8;
    uint _203 = uint(int(uint(_201) >> uint(2)));
    float _205 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_203)]);
    uint _207 = uint(int(uint(_187) >> uint(2)));
    float _209 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_207)]);
    int _211 = _187 + 4;
    uint _213 = uint(int(uint(_211) >> uint(2)));
    float _215 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_213)]);
    int _217 = _187 + 8;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    float _221 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_219)]);
    uint _223 = uint(int(uint(_189) >> uint(2)));
    float _225 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_223)]);
    int _227 = _189 + 4;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    float _231 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_229)]);
    int _233 = _189 + 8;
    uint _235 = uint(int(uint(_233) >> uint(2)));
    float _237 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_235)]);
    int _239 = _169 + 32;
    uint _241 = uint(int(uint(_169) >> uint(2)));
    float _243 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_241)]);
    int _245 = _169 + 4;
    uint _247 = uint(int(uint(_245) >> uint(2)));
    float _249 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_247)]);
    int _251 = _169 + 8;
    uint _253 = uint(int(uint(_251) >> uint(2)));
    float _255 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_253)]);
    uint _257 = uint(int(uint(_239) >> uint(2)));
    float _259 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_257)]);
    int _261 = _239 + 4;
    uint _263 = uint(int(uint(_261) >> uint(2)));
    float _265 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_263)]);
    int _267 = _239 + 8;
    uint _269 = uint(int(uint(_267) >> uint(2)));
    float _271 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_269)]);
    bool _273 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[11].y;
    bool _275 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[11].x;
    float _277 = -(*spvDescriptorSet0.cp_c3)._m0[17].w;
    float _279 = (*spvDescriptorSet0.cp_c3)._m0[17].z + _277;
    bool _281 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[11].z;
    float _283 = _185 * _279;
    float _285 = _185 * (*spvDescriptorSet0.cp_c3)._m0[17].z;
    float _287 = _173 * _279;
    float _289 = _173 * (*spvDescriptorSet0.cp_c3)._m0[17].z;
    float _291 = precise::min(_285, _283);
    float _293 = precise::max(_285, _283);
    float _295 = _179 * _279;
    float _297 = _179 * (*spvDescriptorSet0.cp_c3)._m0[17].z;
    float _299 = precise::min(_289, _287);
    float _301 = _237 * (*spvDescriptorSet0.cp_c3)._m0[17].z;
    float _303 = precise::max(_289, _287);
    float _305 = abs(_221);
    float _307 = -_305;
    float _309 = _205 + _307;
    float _311 = _237 * _279;
    float _313 = precise::min(_297, _295);
    float _315 = abs(_215);
    float _317 = _199 + _315;
    float _319 = precise::max(_297, _295);
    float _321 = abs(_221);
    float _323 = _205 + _321;
    float _325 = _309 + _291;
    float _327 = precise::min(_301, _311);
    float _329 = _231 * _279;
    float _331 = precise::max(_301, _311);
    float _333 = _323 + _293;
    float _335 = abs(_209);
    float _337 = -_335;
    float _339 = _193 + _337;
    float _341 = _225 * _279;
    float _343 = _225 * (*spvDescriptorSet0.cp_c3)._m0[17].z;
    float _345 = _231 * (*spvDescriptorSet0.cp_c3)._m0[17].z;
    float _347 = _339 + _299;
    float _349 = abs(_209);
    float _351 = _193 + _349;
    float _353 = _317 + _319;
    float _355 = precise::min(_343, _341);
    float _357 = abs(_215);
    float _359 = -_357;
    float _361 = _199 + _359;
    float _363 = precise::max(_343, _341);
    float _365 = abs(_271);
    float _367 = -_365;
    float _369 = _255 + _367;
    float _371 = precise::min(_345, _329);
    float _373 = abs(_265);
    float _375 = _249 + _373;
    float _377 = precise::max(_345, _329);
    float _379 = abs(_271);
    float _381 = _255 + _379;
    float _383 = _351 + _303;
    float _385 = _369 + _327;
    float _387 = _361 + _313;
    float _389 = _381 + _331;
    float _391 = abs(_265);
    float _393 = -_391;
    float _395 = _249 + _393;
    float _397 = abs(_259);
    float _399 = -_397;
    float _401 = _243 + _399;
    float _403 = abs(_259);
    float _405 = _243 + _403;
    float _407 = _375 + _377;
    float _409 = _395 + _371;
    float _411 = _401 + _355;
    float _413 = _405 + _363;
    float _415 = _255 + _205;
    float _417 = precise::min(_409, _387);
    float _419 = precise::max(_407, _353);
    float _421 = _249 + _199;
    float _423 = precise::min(_411, _347);
    float _425 = -(*spvDescriptorSet0.cp_c3)._m0[9].z;
    float _427 = fma(_415, 0.5, _425);
    float _429 = precise::max(_413, _383);
    float _431 = _243 + _193;
    float _433 = _273 ? _417 : _419;
    float _435 = -(*spvDescriptorSet0.cp_c3)._m0[9].y;
    float _437 = fma(_421, 0.5, _435);
    float _439 = precise::min(_385, _325);
    float _441 = -(*spvDescriptorSet0.cp_c3)._m0[9].x;
    float _443 = fma(_431, 0.5, _441);
    float _445 = precise::max(_389, _333);
    float _447 = _433 * (*spvDescriptorSet0.cp_c3)._m0[11].y;
    float _449 = _275 ? _423 : _429;
    float _451 = _437 * _437;
    float _453 = _281 ? _439 : _445;
    float _455 = fma(_449, (*spvDescriptorSet0.cp_c3)._m0[11].x, _447);
    float _457 = fma(_443, _443, _451);
    float _459 = fma(_453, (*spvDescriptorSet0.cp_c3)._m0[11].z, _455);
    float _461 = fma(_427, _427, _457);
    float _463 = -(*spvDescriptorSet0.cp_c3)._m0[11].w;
    bool _465 = _459 > _463;
    float _467 = sqrt(_461);
    bool _469 = _275;
    bool _471 = _465;
    if (_465)
    {
        _469 = true;
    }
    bool _473 = _469;
    bool _475 = _473;
    if (!_465)
    {
        bool _477 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[12].y;
        bool _479 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[12].x;
        float _481 = _477 ? _417 : _419;
        bool _483 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[12].z;
        float _485 = _479 ? _423 : _429;
        float _487 = _481 * (*spvDescriptorSet0.cp_c3)._m0[12].y;
        float _489 = _483 ? _439 : _445;
        float _491 = fma(_485, (*spvDescriptorSet0.cp_c3)._m0[12].x, _487);
        float _493 = fma(_489, (*spvDescriptorSet0.cp_c3)._m0[12].z, _491);
        float _495 = -(*spvDescriptorSet0.cp_c3)._m0[12].w;
        bool _497 = _493 > _495;
        _475 = _497;
        _471 = _483;
    }
    bool _499 = _475;
    bool _501 = _471;
    bool _503 = _501;
    bool _505 = _499;
    if (_499)
    {
        _503 = true;
    }
    bool _507 = _503;
    bool _509 = _507;
    if (!_499)
    {
        bool _511 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[13].y;
        bool _513 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[13].x;
        float _515 = _511 ? _417 : _419;
        bool _517 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[13].z;
        float _519 = _513 ? _423 : _429;
        float _521 = _515 * (*spvDescriptorSet0.cp_c3)._m0[13].y;
        float _523 = _517 ? _439 : _445;
        float _525 = fma(_519, (*spvDescriptorSet0.cp_c3)._m0[13].x, _521);
        float _527 = fma(_523, (*spvDescriptorSet0.cp_c3)._m0[13].z, _525);
        float _529 = -(*spvDescriptorSet0.cp_c3)._m0[13].w;
        bool _531 = _527 > _529;
        _509 = _531;
        _505 = _513;
    }
    bool _533 = _509;
    bool _535 = _505;
    bool _537 = _535;
    bool _539 = _533;
    if (_533)
    {
        _537 = true;
    }
    bool _541 = _537;
    bool _543 = _541;
    if (!_533)
    {
        bool _545 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[14].y;
        bool _547 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[14].x;
        float _549 = _545 ? _417 : _419;
        bool _551 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[14].z;
        float _553 = _547 ? _423 : _429;
        float _555 = _549 * (*spvDescriptorSet0.cp_c3)._m0[14].y;
        float _557 = _551 ? _439 : _445;
        float _559 = fma(_553, (*spvDescriptorSet0.cp_c3)._m0[14].x, _555);
        float _561 = fma(_557, (*spvDescriptorSet0.cp_c3)._m0[14].z, _559);
        float _563 = -(*spvDescriptorSet0.cp_c3)._m0[14].w;
        bool _565 = _561 > _563;
        _543 = _565;
        _539 = _551;
    }
    bool _567 = _543;
    bool _569 = _539;
    bool _571 = _569;
    int _573 = _567 ? (-1) : 0;
    if (_567)
    {
        _571 = true;
    }
    bool _575 = _571;
    bool _577 = _575;
    if (!_567)
    {
        bool _579 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[15].y;
        bool _581 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[15].x;
        float _583 = _579 ? _417 : _419;
        bool _585 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[15].z;
        float _587 = _581 ? _423 : _429;
        float _589 = _583 * (*spvDescriptorSet0.cp_c3)._m0[15].y;
        float _591 = _585 ? _439 : _445;
        float _593 = fma(_587, (*spvDescriptorSet0.cp_c3)._m0[15].x, _589);
        float _595 = fma(_591, (*spvDescriptorSet0.cp_c3)._m0[15].z, _593);
        float _597 = -(*spvDescriptorSet0.cp_c3)._m0[15].w;
        bool _599 = _595 > _597;
        _577 = _599;
        _573 = _581 ? (-1) : 0;
    }
    bool _601 = _577;
    int _603 = _573;
    int _605 = _603;
    if (_601)
    {
        _605 = -1;
    }
    int _607 = _605;
    int _609 = _607;
    if (!_601)
    {
        bool _611 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[16].y;
        bool _613 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[16].x;
        float _615 = _611 ? _417 : _419;
        bool _617 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[16].z;
        float _619 = _613 ? _423 : _429;
        float _621 = _615 * (*spvDescriptorSet0.cp_c3)._m0[16].y;
        float _623 = _617 ? _439 : _445;
        float _625 = fma(_619, (*spvDescriptorSet0.cp_c3)._m0[16].x, _621);
        float _627 = fma(_623, (*spvDescriptorSet0.cp_c3)._m0[16].z, _625);
        float _629 = -(*spvDescriptorSet0.cp_c3)._m0[16].w;
        bool _631 = _627 > _629;
        _609 = _631 ? (-1) : 0;
    }
    int _633 = _609;
    bool _635 = _467 < (*spvDescriptorSet0.cp_c3)._m0[20].z;
    int _637 = ~_633;
    int _639 = (_635 ? (-1) : 0) & _637;
    bool _641 = _467 > (*spvDescriptorSet0.cp_c3)._m0[20].x;
    int _643 = (_641 ? (-1) : 0) & _639;
    bool _645 = _467 <= (*spvDescriptorSet0.cp_c3)._m0[20].x;
    bool _647 = isnan(_467);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.cp_c3)._m0[20].x);
    bool _653 = _649 || _651;
    int _655 = (_653 ? (-1) : 0) & _639;
    uint _657 = spvSubgroupBallot(_643 != 0).x;
    uint _659 = spvSubgroupBallot(_655 != 0).x;
    if (!(_639 != 0))
    {
        return;
    }
    float _661 = _205 + _221;
    float _663 = -_221;
    float _665 = _205 + _663;
    int _667 = as_type<int>(_61) << 6;
    int _669 = _667 + 32;
    float _671 = as_type<float>(gl_SubgroupLtMask.x);
    bool _673 = _467 > (*spvDescriptorSet0.cp_c3)._m0[20].x;
    float _675 = _243 + _259;
    float _677 = -_259;
    float _679 = _243 + _677;
    int _681 = _669 + 4;
    int _683 = popcount(int(_659));
    float _685 = -_215;
    float _687 = _199 + _685;
    float _689 = _199 + _215;
    float _691 = -_209;
    float _693 = _193 + _691;
    float _695 = _193 + _209;
    float _697 = _249 + _265;
    float _699 = -_265;
    float _701 = _249 + _699;
    float _703 = -_271;
    float _705 = _255 + _703;
    float _707 = _255 + _271;
    uint _709 = uint(int(uint(_669) >> uint(2)));
    float _711 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_709)]);
    uint _713 = uint(int(uint(_681) >> uint(2)));
    float _715 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_713)]);
    float _717 = _225 * (*spvDescriptorSet0.cp_c3)._m0[17].w;
    float _719 = _231 * (*spvDescriptorSet0.cp_c3)._m0[17].w;
    float _721 = _237 * (*spvDescriptorSet0.cp_c3)._m0[17].w;
    float _723 = fma(_185, (*spvDescriptorSet0.cp_c3)._m0[17].z, _661);
    float _725 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[17].z, _693);
    float _727 = fma(_179, (*spvDescriptorSet0.cp_c3)._m0[17].z, _687);
    float _729 = fma(_185, (*spvDescriptorSet0.cp_c3)._m0[17].z, _665);
    float _731 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[17].z, _675);
    float _733 = fma(_231, (*spvDescriptorSet0.cp_c3)._m0[17].z, _697);
    float _735 = fma(_237, (*spvDescriptorSet0.cp_c3)._m0[17].z, _707);
    float _737 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[17].z, _679);
    float _739 = fma(_231, (*spvDescriptorSet0.cp_c3)._m0[17].z, _701);
    float _741 = fma(_237, (*spvDescriptorSet0.cp_c3)._m0[17].z, _705);
    float _743 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[17].z, _695);
    float _745 = fma(_179, (*spvDescriptorSet0.cp_c3)._m0[17].z, _689);
    bool _747 = !_673;
    if (!_747)
    {
        int _749 = _155 * 48;
        int _751 = _669 + 16;
        int _753 = _749 + 12;
        uint _755 = uint(int(uint(_751) >> uint(2)));
        float _757 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_755)]);
        int _759 = _141 * 48;
        uint _761 = uint(int(uint(_753) >> uint(2)));
        float _763 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_761)]);
        int _765 = _759 + 44;
        int _767 = _759 + 12;
        uint _769 = uint(int(uint(_765) >> uint(2)));
        float _771 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_769)]);
        uint _773 = uint(int(uint(_767) >> uint(2)));
        float _775 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_773)]);
        int _777 = _759 + 28;
        int _779 = _749 + 28;
        uint _781 = uint(int(uint(_777) >> uint(2)));
        float _783 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_781)]);
        uint _785 = uint(int(uint(_779) >> uint(2)));
        float _787 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_785)]);
        float _789 = fma(_231, (*spvDescriptorSet0.cp_c3)._m0[20].y, _697);
        float _791 = fma(_231, (*spvDescriptorSet0.cp_c3)._m0[20].y, _701);
        float _793 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[20].y, _695);
        float _795 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[20].y, _693);
        float _797 = fma(_179, (*spvDescriptorSet0.cp_c3)._m0[20].y, _689);
        float _799 = fma(_179, (*spvDescriptorSet0.cp_c3)._m0[20].y, _687);
        float _801 = _789 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
        float _803 = _789 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
        float _805 = _789 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
        float _807 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[20].y, _675);
        float _809 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[20].y, _679);
        float _811 = _789 * (*spvDescriptorSet0.cp_c3)._m0[4].y;
        float _813 = _791 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
        float _815 = _791 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
        float _817 = _791 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
        float _819 = _791 * (*spvDescriptorSet0.cp_c3)._m0[4].y;
        int _821 = int(_657) & as_type<int>(_671);
        float _823 = fma(_185, (*spvDescriptorSet0.cp_c3)._m0[20].y, _661);
        float _825 = fma(_185, (*spvDescriptorSet0.cp_c3)._m0[20].y, _665);
        float _827 = fma(_807, (*spvDescriptorSet0.cp_c3)._m0[1].x, _801);
        float _829 = fma(_807, (*spvDescriptorSet0.cp_c3)._m0[2].x, _803);
        float _831 = fma(_807, (*spvDescriptorSet0.cp_c3)._m0[3].x, _805);
        float _833 = fma(_807, (*spvDescriptorSet0.cp_c3)._m0[4].x, _811);
        float _835 = fma(_809, (*spvDescriptorSet0.cp_c3)._m0[1].x, _813);
        float _837 = fma(_809, (*spvDescriptorSet0.cp_c3)._m0[2].x, _815);
        float _839 = fma(_809, (*spvDescriptorSet0.cp_c3)._m0[3].x, _817);
        float _841 = fma(_809, (*spvDescriptorSet0.cp_c3)._m0[4].x, _819);
        int _843 = popcount(_821);
        float _845 = _799 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
        float _847 = _799 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
        float _849 = _799 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
        float _851 = fma(_237, (*spvDescriptorSet0.cp_c3)._m0[20].y, _707);
        float _853 = _799 * (*spvDescriptorSet0.cp_c3)._m0[4].y;
        float _855 = fma(_237, (*spvDescriptorSet0.cp_c3)._m0[20].y, _705);
        float _857 = fma(_795, (*spvDescriptorSet0.cp_c3)._m0[1].x, _845);
        float _859 = fma(_851, (*spvDescriptorSet0.cp_c3)._m0[2].z, _829);
        float _861 = fma(_795, (*spvDescriptorSet0.cp_c3)._m0[4].x, _853);
        float _863 = _797 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
        float _865 = _797 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
        float _867 = _797 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
        float _869 = fma(_851, (*spvDescriptorSet0.cp_c3)._m0[1].z, _827);
        float _871 = fma(_851, (*spvDescriptorSet0.cp_c3)._m0[3].z, _831);
        float _873 = fma(_851, (*spvDescriptorSet0.cp_c3)._m0[4].z, _833);
        float _875 = _797 * (*spvDescriptorSet0.cp_c3)._m0[4].y;
        float _877 = fma(_855, (*spvDescriptorSet0.cp_c3)._m0[3].z, _839);
        float _879 = fma(_793, (*spvDescriptorSet0.cp_c3)._m0[1].x, _863);
        float _881 = fma(_793, (*spvDescriptorSet0.cp_c3)._m0[2].x, _865);
        float _883 = fma(_793, (*spvDescriptorSet0.cp_c3)._m0[3].x, _867);
        float _885 = fma(_793, (*spvDescriptorSet0.cp_c3)._m0[4].x, _875);
        int _887 = _683 * 3;
        int _889 = _887 + _843;
        float _891 = fma(_795, (*spvDescriptorSet0.cp_c3)._m0[2].x, _847);
        float _893 = fma(_855, (*spvDescriptorSet0.cp_c3)._m0[1].z, _835);
        float _895 = fma(_855, (*spvDescriptorSet0.cp_c3)._m0[2].z, _837);
        float _897 = fma(_823, (*spvDescriptorSet0.cp_c3)._m0[1].z, _879);
        float _899 = fma(_823, (*spvDescriptorSet0.cp_c3)._m0[2].z, _881);
        float _901 = fma(_823, (*spvDescriptorSet0.cp_c3)._m0[3].z, _883);
        float _903 = fma(_823, (*spvDescriptorSet0.cp_c3)._m0[4].z, _885);
        int _905 = _889 << 1;
        float _907 = fma(_855, (*spvDescriptorSet0.cp_c3)._m0[4].z, _841);
        float _909 = _869 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
        int _911 = _905 << 2;
        float _913 = _873 + (*spvDescriptorSet0.cp_c3)._m0[4].w;
        float _915 = _893 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
        int _917 = 124 & _911;
        float _919 = _895 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
        int _921 = _683 << 1;
        int _923 = _921 + _843;
        float _925 = fma(_795, (*spvDescriptorSet0.cp_c3)._m0[3].x, _849);
        float _927 = _877 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
        float _929 = _907 + (*spvDescriptorSet0.cp_c3)._m0[4].w;
        float _931 = _897 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
        float _933 = fma(_825, (*spvDescriptorSet0.cp_c3)._m0[2].z, _891);
        float _935 = _899 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
        float _937 = _901 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
        float _939 = _903 + (*spvDescriptorSet0.cp_c3)._m0[4].w;
        float _941 = _933 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
        float _943 = abs(_163);
        float _945 = _943 * _757;
        float _947 = precise::clamp(_945, 0.0, 1.0);
        float _949 = _763 * _947;
        float _951 = fma(_825, (*spvDescriptorSet0.cp_c3)._m0[1].z, _857);
        float _953 = fma(_825, (*spvDescriptorSet0.cp_c3)._m0[3].z, _925);
        float _955 = fma(_825, (*spvDescriptorSet0.cp_c3)._m0[4].z, _861);
        bool _957 = _949 >= 0.5;
        bool _959 = isnan(_949);
        bool _961 = _957 || _959;
        bool _963 = isnan(0.5);
        bool _965 = _961 || _963;
        float _967 = _951 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
        float _969 = _953 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
        float _971 = _955 + (*spvDescriptorSet0.cp_c3)._m0[4].w;
        float _973 = abs(_771);
        float _975 = _973 * _757;
        float _977 = precise::clamp(_975, 0.0, 1.0);
        uint _979 = uint(int(uint(_905) >> uint(5)));
        int _981 = _905 + 1;
        float _983 = _775 * _977;
        int _985 = _923 << 2;
        int _987 = int(_979) * 640;
        int _989 = _987 + 8192;
        uint _991 = uint(int(uint(_981) >> uint(5)));
        float _993 = fma(_983, 2.0, -1.0);
        float _995 = precise::clamp(_993, 0.0, 1.0);
        float _997 = _977;
        float _999 = 8.9683101716788292539118693330555e-43;
        int _1001 = _981;
        if (_965)
        {
            _997 = (*spvDescriptorSet0.cp_c3)._m0[18].x;
        }
        float _1003 = _997;
        int _1005 = _989 + _917;
        int _1007 = int(_991) * 640;
        int _1009 = _1007 + 8192;
        float _1011 = fma(_949, 2.0, -1.0);
        if (_965)
        {
            float _1013 = -_1003;
            float _1015 = _1013 + 1.0;
            _999 = _1015;
        }
        float _1017 = _999;
        int _1019 = _981 << 2;
        if (!_965)
        {
            float _1021 = _949 * (*spvDescriptorSet0.cp_c3)._m0[18].x;
            float _1023 = _1021 * 2.0;
            _1001 = as_type<int>(_1023);
        }
        int _1025 = _1001;
        int _1027 = _985 << 2;
        int _1029 = _1025;
        if (_965)
        {
            float _1031 = fma(_1011, _1017, (*spvDescriptorSet0.cp_c3)._m0[18].x);
            _1029 = as_type<int>(_1031);
        }
        int _1033 = _1029;
        bool _1035 = _983 >= 0.5;
        bool _1037 = isnan(_983);
        bool _1039 = _1035 || _1037;
        bool _1041 = isnan(0.5);
        bool _1043 = _1039 || _1041;
        float _1045 = 0.0 + _1011;
        float _1047 = precise::clamp(_1045, 0.0, 1.0);
        int _1049 = 124 & _1019;
        uint _1051 = uint(int(uint(_985) >> uint(5)));
        int _1053 = 124 & _1027;
        int _1055 = _1009 + _1049;
        int _1057 = int(_1051) << 10;
        int _1059 = _1057 + _1053;
        int _1061 = _985 + 1;
        int _1063 = _985 + 3;
        int _1065 = _985 + 2;
        uint _1067 = uint(int(uint(_1061) >> uint(5)));
        int _1069 = _1061 << 2;
        uint _1071 = uint(int(uint(_1063) >> uint(5)));
        int _1073 = _1063 << 2;
        int _1075 = _1065 & 31;
        float _1077 = as_type<float>(_1063);
        float _1079 = as_type<float>(_1075);
        int _1081 = _1065;
        if (_1043)
        {
            _1077 = (*spvDescriptorSet0.cp_c3)._m0[18].x;
        }
        float _1083 = _1077;
        int _1085 = _1075 << 2;
        float _1087 = _1083;
        if (_1043)
        {
            float _1089 = fma(_983, 2.0, -1.0);
            _1079 = _1089;
        }
        float _1091 = _1079;
        if (_1043)
        {
            float _1093 = -_1083;
            float _1095 = _1093 + 1.0;
            _1087 = _1095;
        }
        float _1097 = _1087;
        int _1099 = 124 & _1069;
        int _1101 = _1005 + 400;
        uint _1103 = uint(int(uint(_1101) >> uint(2)));
        _35[int(_1103)] = 3212836864u;
        uint _1105 = uint(int(uint(_1065) >> uint(5)));
        if (!_1043)
        {
            float _1107 = _983 * (*spvDescriptorSet0.cp_c3)._m0[18].x;
            float _1109 = _1107 * 2.0;
            _1081 = as_type<int>(_1109);
        }
        int _1111 = _1081;
        int _1113 = _1111;
        if (_1043)
        {
            float _1115 = fma(_1091, _1097, (*spvDescriptorSet0.cp_c3)._m0[18].x);
            _1113 = as_type<int>(_1115);
        }
        int _1117 = _1113;
        int _1119 = _1005 + 528;
        uint _1121 = uint(int(uint(_1119) >> uint(2)));
        _35[int(_1121)] = 0u;
        int _1123 = int(_1067) << 10;
        int _1125 = _1123 + _1099;
        float _1127 = _859 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
        float _1129 = _871 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
        int _1131 = _1005 + 656;
        uint _1133 = uint(int(uint(_1131) >> uint(2)));
        _35[int(_1133)] = as_type<uint>(_711);
        int _1135 = 124 & _1073;
        int _1137 = int(_1105) << 10;
        int _1139 = _1137 + _1085;
        int _1141 = _1005 + 784;
        uint _1143 = uint(int(uint(_1141) >> uint(2)));
        _35[int(_1143)] = as_type<uint>(_715);
        int _1145 = int(_1071) << 10;
        int _1147 = _1145 + _1135;
        int _1149 = _985 & 255;
        int _1151 = _1055 + 400;
        uint _1153 = uint(int(uint(_1151) >> uint(2)));
        _35[int(_1153)] = 3212836864u;
        int _1155 = _905 << 1;
        int _1157 = _1155 + _905;
        int _1159 = _1149 + 2;
        int _1161 = _1055 + 528;
        uint _1163 = uint(int(uint(_1161) >> uint(2)));
        _35[int(_1163)] = 0u;
        int _1165 = _1055 + 656;
        uint _1167 = uint(int(uint(_1165) >> uint(2)));
        _35[int(_1167)] = as_type<uint>(_711);
        int _1169 = _1055 + 784;
        uint _1171 = uint(int(uint(_1169) >> uint(2)));
        _35[int(_1171)] = as_type<uint>(_715);
        int _1173 = _1059 + 272;
        uint _1175 = uint(int(uint(_1173) >> uint(2)));
        _35[int(_1175)] = as_type<uint>(_909);
        int _1177 = _1059 + 400;
        uint _1179 = uint(int(uint(_1177) >> uint(2)));
        _35[int(_1179)] = as_type<uint>(_1127);
        int _1181 = _1149 + 3;
        int _1183 = _1059 + 528;
        uint _1185 = uint(int(uint(_1183) >> uint(2)));
        _35[int(_1185)] = as_type<uint>(_1129);
        int _1187 = _1059 + 656;
        uint _1189 = uint(int(uint(_1187) >> uint(2)));
        _35[int(_1189)] = as_type<uint>(_913);
        int _1191 = _1125 + 272;
        uint _1193 = uint(int(uint(_1191) >> uint(2)));
        _35[int(_1193)] = as_type<uint>(_915);
        int _1195 = _1125 + 400;
        uint _1197 = uint(int(uint(_1195) >> uint(2)));
        _35[int(_1197)] = as_type<uint>(_919);
        int _1199 = _1125 + 528;
        uint _1201 = uint(int(uint(_1199) >> uint(2)));
        _35[int(_1201)] = as_type<uint>(_927);
        int _1203 = _1125 + 656;
        uint _1205 = uint(int(uint(_1203) >> uint(2)));
        _35[int(_1205)] = as_type<uint>(_929);
        int _1207 = _1139 + 272;
        uint _1209 = uint(int(uint(_1207) >> uint(2)));
        _35[int(_1209)] = as_type<uint>(_931);
        int _1211 = _1149 + 1;
        int _1213 = _1139 + 400;
        uint _1215 = uint(int(uint(_1213) >> uint(2)));
        _35[int(_1215)] = as_type<uint>(_935);
        int _1217 = _1139 + 528;
        uint _1219 = uint(int(uint(_1217) >> uint(2)));
        _35[int(_1219)] = as_type<uint>(_937);
        int _1221 = _1139 + 656;
        uint _1223 = uint(int(uint(_1221) >> uint(2)));
        _35[int(_1223)] = as_type<uint>(_939);
        int _1225 = _1147 + 272;
        uint _1227 = uint(int(uint(_1225) >> uint(2)));
        _35[int(_1227)] = as_type<uint>(_967);
        int _1229 = _1147 + 400;
        uint _1231 = uint(int(uint(_1229) >> uint(2)));
        _35[int(_1231)] = as_type<uint>(_941);
        int _1233 = _1147 + 528;
        uint _1235 = uint(int(uint(_1233) >> uint(2)));
        _35[int(_1235)] = as_type<uint>(_969);
        int _1237 = _1147 + 656;
        uint _1239 = uint(int(uint(_1237) >> uint(2)));
        _35[int(_1239)] = as_type<uint>(_971);
        int _1241 = _1059 + 784;
        uint _1243 = uint(int(uint(_1241) >> uint(2)));
        _35[int(_1243)] = 3212836864u;
        int _1245 = _1059 + 912;
        uint _1247 = uint(int(uint(_1245) >> uint(2)));
        _35[int(_1247)] = as_type<uint>(_783);
        int _1249 = _1059 + 1040;
        uint _1251 = uint(int(uint(_1249) >> uint(2)));
        _35[int(_1251)] = uint(_1117);
        int _1253 = _1059 + 1168;
        uint _1255 = uint(int(uint(_1253) >> uint(2)));
        _35[int(_1255)] = as_type<uint>(_995);
        int _1257 = _1125 + 784;
        uint _1259 = uint(int(uint(_1257) >> uint(2)));
        _35[int(_1259)] = 1065353216u;
        int _1261 = _1125 + 912;
        uint _1263 = uint(int(uint(_1261) >> uint(2)));
        _35[int(_1263)] = as_type<uint>(_783);
        int _1265 = _1125 + 1040;
        uint _1267 = uint(int(uint(_1265) >> uint(2)));
        _35[int(_1267)] = uint(_1117);
        int _1269 = _1125 + 1168;
        uint _1271 = uint(int(uint(_1269) >> uint(2)));
        _35[int(_1271)] = as_type<uint>(_995);
        int _1273 = _1139 + 784;
        uint _1275 = uint(int(uint(_1273) >> uint(2)));
        _35[int(_1275)] = 3212836864u;
        int _1277 = _1139 + 912;
        uint _1279 = uint(int(uint(_1277) >> uint(2)));
        _35[int(_1279)] = as_type<uint>(_787);
        int _1281 = _1139 + 1040;
        uint _1283 = uint(int(uint(_1281) >> uint(2)));
        _35[int(_1283)] = uint(_1033);
        int _1285 = _1139 + 1168;
        uint _1287 = uint(int(uint(_1285) >> uint(2)));
        _35[int(_1287)] = as_type<uint>(_1047);
        int _1289 = _1147 + 784;
        uint _1291 = uint(int(uint(_1289) >> uint(2)));
        _35[int(_1291)] = 1065353216u;
        int _1293 = _1147 + 912;
        uint _1295 = uint(int(uint(_1293) >> uint(2)));
        _35[int(_1295)] = as_type<uint>(_787);
        int _1297 = _1147 + 1040;
        uint _1299 = uint(int(uint(_1297) >> uint(2)));
        _35[int(_1299)] = uint(_1033);
        int _1301 = _1147 + 1168;
        uint _1303 = uint(int(uint(_1301) >> uint(2)));
        _35[int(_1303)] = as_type<uint>(_1047);
        int _1305 = _1157 + 13588;
        int _1307 = _1305;
        int _1309 = _1149;
        _48(_1307, _1309, _35);
        int _1311 = _1157 + 13589;
        int _1313 = _1311;
        int _1315 = _1211;
        _48(_1313, _1315, _35);
        int _1317 = _1157 + 13590;
        int _1319 = _1317;
        int _1321 = _1159;
        _48(_1319, _1321, _35);
        int _1323 = _1157 + 13591;
        int _1325 = _1323;
        int _1327 = _1211;
        _48(_1325, _1327, _35);
        int _1329 = _1157 + 13592;
        int _1331 = _1329;
        int _1333 = _1181;
        _48(_1331, _1333, _35);
        int _1335 = _1157 + 13593;
        int _1337 = _1335;
        int _1339 = _1159;
        _48(_1337, _1339, _35);
        _1341 = true;
    }
    else
    {
        int _1343 = as_type<int>(_61) << 6;
        int _1345 = _1343 + 48;
        uint _1347 = uint(int(uint(_1345) >> uint(2)));
        float _1349 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_1347)]);
        float _1351 = -_179;
        float _1353 = fma(_1351, (*spvDescriptorSet0.cp_c3)._m0[17].w, _745);
        float _1355 = -_179;
        float _1357 = fma(_1355, (*spvDescriptorSet0.cp_c3)._m0[17].w, _727);
        float _1359 = _745 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
        float _1361 = _745 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
        int _1363 = int(_659) & as_type<int>(_671);
        float _1365 = -_173;
        float _1367 = fma(_1365, (*spvDescriptorSet0.cp_c3)._m0[17].w, _743);
        float _1369 = -_173;
        float _1371 = fma(_1369, (*spvDescriptorSet0.cp_c3)._m0[17].w, _725);
        float _1373 = -_185;
        float _1375 = fma(_1373, (*spvDescriptorSet0.cp_c3)._m0[17].w, _723);
        float _1377 = -_185;
        float _1379 = fma(_1377, (*spvDescriptorSet0.cp_c3)._m0[17].w, _729);
        float _1381 = _745 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
        float _1383 = fma(_743, (*spvDescriptorSet0.cp_c3)._m0[1].x, _1359);
        float _1385 = fma(_743, (*spvDescriptorSet0.cp_c3)._m0[3].x, _1361);
        float _1387 = _745 * (*spvDescriptorSet0.cp_c3)._m0[4].y;
        float _1389 = _727 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
        float _1391 = _727 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
        float _1393 = _727 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
        float _1395 = _727 * (*spvDescriptorSet0.cp_c3)._m0[4].y;
        float _1397 = fma(_743, (*spvDescriptorSet0.cp_c3)._m0[2].x, _1381);
        float _1399 = fma(_743, (*spvDescriptorSet0.cp_c3)._m0[4].x, _1387);
        float _1401 = fma(_725, (*spvDescriptorSet0.cp_c3)._m0[1].x, _1389);
        float _1403 = fma(_725, (*spvDescriptorSet0.cp_c3)._m0[2].x, _1391);
        float _1405 = fma(_725, (*spvDescriptorSet0.cp_c3)._m0[3].x, _1393);
        float _1407 = fma(_725, (*spvDescriptorSet0.cp_c3)._m0[4].x, _1395);
        float _1409 = fma(_723, (*spvDescriptorSet0.cp_c3)._m0[3].z, _1385);
        float _1411 = -_719;
        float _1413 = _1411 + _739;
        int _1415 = popcount(_1363);
        float _1417 = fma(_723, (*spvDescriptorSet0.cp_c3)._m0[2].z, _1397);
        float _1419 = fma(_723, (*spvDescriptorSet0.cp_c3)._m0[1].z, _1383);
        float _1421 = fma(_723, (*spvDescriptorSet0.cp_c3)._m0[4].z, _1399);
        float _1423 = fma(_729, (*spvDescriptorSet0.cp_c3)._m0[1].z, _1401);
        float _1425 = fma(_729, (*spvDescriptorSet0.cp_c3)._m0[2].z, _1403);
        float _1427 = fma(_729, (*spvDescriptorSet0.cp_c3)._m0[3].z, _1405);
        float _1429 = fma(_729, (*spvDescriptorSet0.cp_c3)._m0[4].z, _1407);
        float _1431 = _1413 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
        float _1433 = _1413 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
        float _1435 = _1413 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
        float _1437 = -_717;
        float _1439 = _1437 + _737;
        float _1441 = _1413 * (*spvDescriptorSet0.cp_c3)._m0[4].y;
        float _1443 = _1357 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
        float _1445 = _1357 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
        float _1447 = fma(_1439, (*spvDescriptorSet0.cp_c3)._m0[1].x, _1431);
        float _1449 = fma(_1439, (*spvDescriptorSet0.cp_c3)._m0[2].x, _1433);
        float _1451 = fma(_1439, (*spvDescriptorSet0.cp_c3)._m0[3].x, _1435);
        float _1453 = fma(_1439, (*spvDescriptorSet0.cp_c3)._m0[4].x, _1441);
        float _1455 = _1357 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
        float _1457 = fma(_1371, (*spvDescriptorSet0.cp_c3)._m0[3].x, _1443);
        float _1459 = _1357 * (*spvDescriptorSet0.cp_c3)._m0[4].y;
        float _1461 = _1353 * (*spvDescriptorSet0.cp_c3)._m0[4].y;
        float _1463 = -_721;
        float _1465 = _1463 + _741;
        float _1467 = fma(_1371, (*spvDescriptorSet0.cp_c3)._m0[2].x, _1445);
        float _1469 = fma(_1371, (*spvDescriptorSet0.cp_c3)._m0[1].x, _1455);
        float _1471 = fma(_1379, (*spvDescriptorSet0.cp_c3)._m0[3].z, _1457);
        float _1473 = -_717;
        float _1475 = _1473 + _731;
        float _1477 = _1353 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
        float _1479 = _1353 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
        float _1481 = _1353 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
        float _1483 = fma(_1371, (*spvDescriptorSet0.cp_c3)._m0[4].x, _1459);
        float _1485 = fma(_1367, (*spvDescriptorSet0.cp_c3)._m0[4].x, _1461);
        int _1487 = _1415 * 6;
        float _1489 = fma(_1465, (*spvDescriptorSet0.cp_c3)._m0[1].z, _1447);
        float _1491 = fma(_1465, (*spvDescriptorSet0.cp_c3)._m0[2].z, _1449);
        float _1493 = fma(_1465, (*spvDescriptorSet0.cp_c3)._m0[3].z, _1451);
        float _1495 = fma(_1379, (*spvDescriptorSet0.cp_c3)._m0[2].z, _1467);
        float _1497 = fma(_1465, (*spvDescriptorSet0.cp_c3)._m0[4].z, _1453);
        float _1499 = fma(_1379, (*spvDescriptorSet0.cp_c3)._m0[1].z, _1469);
        float _1501 = -_719;
        float _1503 = _1501 + _733;
        float _1505 = fma(_1367, (*spvDescriptorSet0.cp_c3)._m0[1].x, _1477);
        float _1507 = fma(_1367, (*spvDescriptorSet0.cp_c3)._m0[2].x, _1479);
        float _1509 = fma(_1367, (*spvDescriptorSet0.cp_c3)._m0[3].x, _1481);
        float _1511 = -_1475;
        float _1513 = _1511 + _1367;
        float _1515 = fma(_1375, (*spvDescriptorSet0.cp_c3)._m0[4].z, _1485);
        float _1517 = -_721;
        float _1519 = _1517 + _735;
        uint _1521 = uint(int(uint(_1487) >> uint(5)));
        float _1523 = -_1503;
        float _1525 = _1523 + _1353;
        int _1527 = _1487 << 2;
        float _1529 = fma(_1375, (*spvDescriptorSet0.cp_c3)._m0[1].z, _1505);
        float _1531 = fma(_1375, (*spvDescriptorSet0.cp_c3)._m0[2].z, _1507);
        float _1533 = fma(_1375, (*spvDescriptorSet0.cp_c3)._m0[3].z, _1509);
        float _1535 = -_1519;
        float _1537 = _1535 + _1375;
        float _1539 = _1525 * _721;
        int _1541 = int(_1521) * 640;
        int _1543 = _1541 + 8192;
        int _1545 = 124 & _1527;
        float _1547 = _1537 * _717;
        float _1549 = -_1539;
        float _1551 = fma(_1537, _719, _1549);
        float _1553 = fma(_1379, (*spvDescriptorSet0.cp_c3)._m0[4].z, _1483);
        int _1555 = _1543 + _1545;
        float _1557 = _1513 * _719;
        int _1559 = _1487 + 2;
        float _1561 = -_1547;
        float _1563 = fma(_1513, _721, _1561);
        int _1565 = _1487 + 1;
        float _1567 = -_1557;
        float _1569 = fma(_1525, _717, _1567);
        int _1571 = _1487 + 3;
        float _1573 = _1421 + (*spvDescriptorSet0.cp_c3)._m0[4].w;
        int _1575 = _1487 + 4;
        float _1577 = _1423 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
        uint _1579 = uint(int(uint(_1559) >> uint(5)));
        float _1581 = _1425 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
        uint _1583 = uint(int(uint(_1565) >> uint(5)));
        float _1585 = _1427 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
        uint _1587 = uint(int(uint(_1571) >> uint(5)));
        int _1589 = int(_1579) * 640;
        int _1591 = _1589 + 8192;
        uint _1593 = uint(int(uint(_1575) >> uint(5)));
        int _1595 = int(_1583) * 640;
        int _1597 = _1595 + 8192;
        float _1599 = _1503 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
        int _1601 = int(_1587) * 640;
        int _1603 = _1601 + 8192;
        float _1605 = _1503 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
        int _1607 = int(_1593) * 640;
        int _1609 = _1607 + 8192;
        float _1611 = _1503 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
        float _1613 = _1503 * (*spvDescriptorSet0.cp_c3)._m0[4].y;
        float _1615 = fma(_1475, (*spvDescriptorSet0.cp_c3)._m0[2].x, _1599);
        float _1617 = fma(_1475, (*spvDescriptorSet0.cp_c3)._m0[1].x, _1605);
        float _1619 = fma(_1475, (*spvDescriptorSet0.cp_c3)._m0[3].x, _1611);
        float _1621 = fma(_1475, (*spvDescriptorSet0.cp_c3)._m0[4].x, _1613);
        float _1623 = -_1475;
        float _1625 = _1623 + (*spvDescriptorSet0.cp_c3)._m0[9].x;
        float _1627 = -_1503;
        float _1629 = _1627 + (*spvDescriptorSet0.cp_c3)._m0[9].y;
        int _1631 = _1487 + 5;
        float _1633 = fma(_1519, (*spvDescriptorSet0.cp_c3)._m0[1].z, _1617);
        int _1635 = _1565 << 2;
        float _1637 = _1563 * _1629;
        float _1639 = _1563 * _1563;
        uint _1641 = uint(int(uint(_1631) >> uint(5)));
        float _1643 = fma(_1519, (*spvDescriptorSet0.cp_c3)._m0[2].z, _1615);
        int _1645 = _1415 << 3;
        float _1647 = fma(_1551, _1625, _1637);
        int _1649 = _1559 << 2;
        float _1651 = fma(_1551, _1551, _1639);
        int _1653 = _1571 << 2;
        int _1655 = int(_1641) * 640;
        int _1657 = _1655 + 8192;
        int _1659 = _1631 << 2;
        float _1661 = fma(_1519, (*spvDescriptorSet0.cp_c3)._m0[3].z, _1619);
        int _1663 = _1575 << 2;
        float _1665 = _1429 + (*spvDescriptorSet0.cp_c3)._m0[4].w;
        int _1667 = _1645 << 2;
        float _1669 = fma(_1519, (*spvDescriptorSet0.cp_c3)._m0[4].z, _1621);
        int _1671 = 124 & _1649;
        float _1673 = _1633 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
        int _1675 = 124 & _1653;
        float _1677 = _1643 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
        int _1679 = 124 & _1659;
        float _1681 = _1661 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
        uint _1683 = uint(int(uint(_1645) >> uint(5)));
        float _1685 = _1669 + (*spvDescriptorSet0.cp_c3)._m0[4].w;
        int _1687 = 124 & _1667;
        float _1689 = _1531 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
        int _1691 = _1591 + _1671;
        float _1693 = _1533 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
        int _1695 = _1603 + _1675;
        float _1697 = fma(_1569, _1569, _1651);
        int _1699 = _1657 + _1679;
        float _1701 = _1493 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
        int _1703 = _1645 + 1;
        float _1705 = _1497 + (*spvDescriptorSet0.cp_c3)._m0[4].w;
        int _1707 = _1645 + 2;
        float _1709 = rsqrt(_1697);
        int _1711 = _1645 + 4;
        float _1713 = _1499 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
        int _1715 = 124 & _1663;
        int _1717 = _1415 * 18;
        int _1719 = int(_1683) << 10;
        int _1721 = _1719 + _1687;
        float _1723 = -_1519;
        float _1725 = _1723 + (*spvDescriptorSet0.cp_c3)._m0[9].z;
        int _1727 = _1703 << 2;
        int _1729 = _1707 << 2;
        float _1731 = fma(_1569, _1725, _1647);
        int _1733 = _1711 << 2;
        int _1735 = _1609 + _1715;
        int _1737 = _1645 + 3;
        float _1739 = _1731 * _1709;
        uint _1741 = uint(int(uint(_1703) >> uint(5)));
        uint _1743 = uint(int(uint(_1707) >> uint(5)));
        int _1745 = 124 & _1727;
        int _1747 = 124 & _1729;
        uint _1749 = uint(int(uint(_1711) >> uint(5)));
        int _1751 = 124 & _1733;
        uint _1753 = uint(int(uint(_1737) >> uint(5)));
        int _1755 = _1737 << 2;
        int _1757 = int(_1741) << 10;
        int _1759 = _1757 + _1745;
        int _1761 = int(_1743) << 10;
        int _1763 = _1761 + _1747;
        int _1765 = int(_1749) << 10;
        int _1767 = _1765 + _1751;
        int _1769 = _1645 + 5;
        int _1771 = _1645 + 6;
        float _1773 = float(uint(_141));
        uint _1775 = uint(int(uint(_1769) >> uint(5)));
        int _1777 = _1769 << 2;
        int _1779 = _1555 + 400;
        uint _1781 = uint(int(uint(_1779) >> uint(2)));
        _35[int(_1781)] = as_type<uint>(_1773);
        int _1783 = 124 & _1635;
        uint _1785 = uint(int(uint(_1771) >> uint(5)));
        int _1787 = _1771 << 2;
        float _1789 = float(uint(_155));
        int _1791 = _1597 + _1783;
        int _1793 = _1645 + 7;
        int _1795 = _1555 + 528;
        uint _1797 = uint(int(uint(_1795) >> uint(2)));
        _35[int(_1797)] = as_type<uint>(_1789);
        int _1799 = 124 & _1787;
        int _1801 = _1793 << 2;
        int _1803 = _1555 + 656;
        uint _1805 = uint(int(uint(_1803) >> uint(2)));
        _35[int(_1805)] = as_type<uint>(_711);
        uint _1807 = uint(int(uint(_1793) >> uint(5)));
        int _1809 = 124 & _1777;
        int _1811 = _1555 + 784;
        uint _1813 = uint(int(uint(_1811) >> uint(2)));
        _35[int(_1813)] = as_type<uint>(_715);
        int _1815 = 124 & _1801;
        float _1817 = _733 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
        int _1819 = int(_1775) << 10;
        int _1821 = _1819 + _1809;
        int _1823 = _1791 + 400;
        uint _1825 = uint(int(uint(_1823) >> uint(2)));
        _35[int(_1825)] = as_type<uint>(_1773);
        int _1827 = int(_1807) << 10;
        int _1829 = _1827 + _1815;
        float _1831 = _733 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
        float _1833 = _733 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
        int _1835 = _1791 + 528;
        uint _1837 = uint(int(uint(_1835) >> uint(2)));
        _35[int(_1837)] = as_type<uint>(_1789);
        float _1839 = fma(_731, (*spvDescriptorSet0.cp_c3)._m0[3].x, _1817);
        float _1841 = fma(_731, (*spvDescriptorSet0.cp_c3)._m0[1].x, _1831);
        float _1843 = fma(_731, (*spvDescriptorSet0.cp_c3)._m0[2].x, _1833);
        int _1845 = _1791 + 656;
        uint _1847 = uint(int(uint(_1845) >> uint(2)));
        _35[int(_1847)] = as_type<uint>(_711);
        float _1849 = _739 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
        float _1851 = fma(_735, (*spvDescriptorSet0.cp_c3)._m0[1].z, _1841);
        float _1853 = fma(_735, (*spvDescriptorSet0.cp_c3)._m0[2].z, _1843);
        int _1855 = _1791 + 784;
        uint _1857 = uint(int(uint(_1855) >> uint(2)));
        _35[int(_1857)] = as_type<uint>(_715);
        float _1859 = fma(_735, (*spvDescriptorSet0.cp_c3)._m0[3].z, _1839);
        float _1861 = fma(_737, (*spvDescriptorSet0.cp_c3)._m0[3].x, _1849);
        int _1863 = int(_1785) << 10;
        int _1865 = _1863 + _1799;
        int _1867 = _1691 + 400;
        uint _1869 = uint(int(uint(_1867) >> uint(2)));
        _35[int(_1869)] = as_type<uint>(_1773);
        float _1871 = _1859 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
        float _1873 = fma(_741, (*spvDescriptorSet0.cp_c3)._m0[3].z, _1861);
        int _1875 = 124 & _1755;
        int _1877 = _1691 + 528;
        uint _1879 = uint(int(uint(_1877) >> uint(2)));
        _35[int(_1879)] = as_type<uint>(_1789);
        bool _1881 = _1739 >= 0.0;
        float _1883 = _1873 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
        int _1885 = int(_1753) << 10;
        int _1887 = _1885 + _1875;
        int _1889 = _1691 + 656;
        uint _1891 = uint(int(uint(_1889) >> uint(2)));
        _35[int(_1891)] = as_type<uint>(_711);
        int _1893 = _1691 + 784;
        uint _1895 = uint(int(uint(_1893) >> uint(2)));
        _35[int(_1895)] = as_type<uint>(_715);
        int _1897 = _1695 + 400;
        uint _1899 = uint(int(uint(_1897) >> uint(2)));
        _35[int(_1899)] = as_type<uint>(_1773);
        int _1901 = _1695 + 528;
        uint _1903 = uint(int(uint(_1901) >> uint(2)));
        _35[int(_1903)] = as_type<uint>(_1789);
        int _1905 = _1695 + 656;
        uint _1907 = uint(int(uint(_1905) >> uint(2)));
        _35[int(_1907)] = as_type<uint>(_711);
        int _1909 = _1695 + 784;
        uint _1911 = uint(int(uint(_1909) >> uint(2)));
        _35[int(_1911)] = as_type<uint>(_715);
        int _1913 = _1735 + 400;
        uint _1915 = uint(int(uint(_1913) >> uint(2)));
        _35[int(_1915)] = as_type<uint>(_1773);
        int _1917 = _1735 + 528;
        uint _1919 = uint(int(uint(_1917) >> uint(2)));
        _35[int(_1919)] = as_type<uint>(_1789);
        int _1921 = _1735 + 656;
        uint _1923 = uint(int(uint(_1921) >> uint(2)));
        _35[int(_1923)] = as_type<uint>(_711);
        int _1925 = _1735 + 784;
        uint _1927 = uint(int(uint(_1925) >> uint(2)));
        _35[int(_1927)] = as_type<uint>(_715);
        int _1929 = _1699 + 400;
        uint _1931 = uint(int(uint(_1929) >> uint(2)));
        _35[int(_1931)] = as_type<uint>(_1773);
        int _1933 = _1699 + 528;
        uint _1935 = uint(int(uint(_1933) >> uint(2)));
        _35[int(_1935)] = as_type<uint>(_1789);
        int _1937 = _1699 + 656;
        uint _1939 = uint(int(uint(_1937) >> uint(2)));
        _35[int(_1939)] = as_type<uint>(_711);
        int _1941 = _1699 + 784;
        uint _1943 = uint(int(uint(_1941) >> uint(2)));
        _35[int(_1943)] = as_type<uint>(_715);
        int _1945 = _1555 + 272;
        uint _1947 = uint(int(uint(_1945) >> uint(2)));
        _35[int(_1947)] = as_type<uint>(_1349);
        int _1949 = _1791 + 272;
        uint _1951 = uint(int(uint(_1949) >> uint(2)));
        _35[int(_1951)] = as_type<uint>(_1349);
        float _1953 = _733 * (*spvDescriptorSet0.cp_c3)._m0[4].y;
        int _1955 = _1691 + 272;
        uint _1957 = uint(int(uint(_1955) >> uint(2)));
        _35[int(_1957)] = as_type<uint>(_1349);
        float _1959 = fma(_731, (*spvDescriptorSet0.cp_c3)._m0[4].x, _1953);
        float _1961 = _1851 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
        int _1963 = _1695 + 272;
        uint _1965 = uint(int(uint(_1963) >> uint(2)));
        _35[int(_1965)] = as_type<uint>(_1349);
        float _1967 = fma(_735, (*spvDescriptorSet0.cp_c3)._m0[4].z, _1959);
        float _1969 = _1853 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
        int _1971 = _1735 + 272;
        uint _1973 = uint(int(uint(_1971) >> uint(2)));
        _35[int(_1973)] = as_type<uint>(_1349);
        float _1975 = _739 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
        int _1977 = _1699 + 272;
        uint _1979 = uint(int(uint(_1977) >> uint(2)));
        _35[int(_1979)] = as_type<uint>(_1349);
        float _1981 = _739 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
        float _1983 = fma(_737, (*spvDescriptorSet0.cp_c3)._m0[2].x, _1975);
        int _1985 = _1721 + 272;
        uint _1987 = uint(int(uint(_1985) >> uint(2)));
        _35[int(_1987)] = as_type<uint>(_1961);
        float _1989 = _739 * (*spvDescriptorSet0.cp_c3)._m0[4].y;
        float _1991 = fma(_737, (*spvDescriptorSet0.cp_c3)._m0[1].x, _1981);
        float _1993 = fma(_741, (*spvDescriptorSet0.cp_c3)._m0[2].z, _1983);
        int _1995 = _1721 + 400;
        uint _1997 = uint(int(uint(_1995) >> uint(2)));
        _35[int(_1997)] = as_type<uint>(_1969);
        float _1999 = fma(_737, (*spvDescriptorSet0.cp_c3)._m0[4].x, _1989);
        float _2001 = fma(_741, (*spvDescriptorSet0.cp_c3)._m0[1].z, _1991);
        float _2003 = _1967 + (*spvDescriptorSet0.cp_c3)._m0[4].w;
        float _2005 = _1993 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
        float _2007 = fma(_741, (*spvDescriptorSet0.cp_c3)._m0[4].z, _1999);
        float _2009 = _2001 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
        int _2011 = _1721 + 528;
        uint _2013 = uint(int(uint(_2011) >> uint(2)));
        _35[int(_2013)] = as_type<uint>(_1871);
        float _2015 = _1419 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
        float _2017 = _2007 + (*spvDescriptorSet0.cp_c3)._m0[4].w;
        float _2019 = _1417 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
        int _2021 = _1721 + 656;
        uint _2023 = uint(int(uint(_2021) >> uint(2)));
        _35[int(_2023)] = as_type<uint>(_2003);
        float _2025 = _1495 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
        float _2027 = _1553 + (*spvDescriptorSet0.cp_c3)._m0[4].w;
        int _2029 = _1759 + 272;
        uint _2031 = uint(int(uint(_2029) >> uint(2)));
        _35[int(_2031)] = as_type<uint>(_2009);
        int _2033 = _1759 + 400;
        uint _2035 = uint(int(uint(_2033) >> uint(2)));
        _35[int(_2035)] = as_type<uint>(_2005);
        float _2037 = _1409 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
        int _2039 = _1759 + 528;
        uint _2041 = uint(int(uint(_2039) >> uint(2)));
        _35[int(_2041)] = as_type<uint>(_1883);
        int _2043 = _1759 + 656;
        uint _2045 = uint(int(uint(_2043) >> uint(2)));
        _35[int(_2045)] = as_type<uint>(_2017);
        int _2047 = _1763 + 272;
        uint _2049 = uint(int(uint(_2047) >> uint(2)));
        _35[int(_2049)] = as_type<uint>(_2015);
        int _2051 = _1763 + 400;
        uint _2053 = uint(int(uint(_2051) >> uint(2)));
        _35[int(_2053)] = as_type<uint>(_2019);
        int _2055 = _1763 + 528;
        uint _2057 = uint(int(uint(_2055) >> uint(2)));
        _35[int(_2057)] = as_type<uint>(_2037);
        int _2059 = _1763 + 656;
        uint _2061 = uint(int(uint(_2059) >> uint(2)));
        _35[int(_2061)] = as_type<uint>(_1573);
        int _2063 = _1887 + 272;
        uint _2065 = uint(int(uint(_2063) >> uint(2)));
        _35[int(_2065)] = as_type<uint>(_1577);
        float _2067 = _1529 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
        int _2069 = _1887 + 400;
        uint _2071 = uint(int(uint(_2069) >> uint(2)));
        _35[int(_2071)] = as_type<uint>(_1581);
        int _2073 = _1887 + 528;
        uint _2075 = uint(int(uint(_2073) >> uint(2)));
        _35[int(_2075)] = as_type<uint>(_1585);
        float _2077 = _1489 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
        int _2079 = _1887 + 656;
        uint _2081 = uint(int(uint(_2079) >> uint(2)));
        _35[int(_2081)] = as_type<uint>(_1665);
        float _2083 = _1491 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
        float _2085 = _1471 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
        int _2087 = _1767 + 272;
        uint _2089 = uint(int(uint(_2087) >> uint(2)));
        _35[int(_2089)] = as_type<uint>(_1673);
        int _2091 = _1767 + 400;
        uint _2093 = uint(int(uint(_2091) >> uint(2)));
        _35[int(_2093)] = as_type<uint>(_1677);
        float _2095 = _1515 + (*spvDescriptorSet0.cp_c3)._m0[4].w;
        int _2097 = _1767 + 528;
        uint _2099 = uint(int(uint(_2097) >> uint(2)));
        _35[int(_2099)] = as_type<uint>(_1681);
        int _2101 = _1767 + 656;
        uint _2103 = uint(int(uint(_2101) >> uint(2)));
        _35[int(_2103)] = as_type<uint>(_1685);
        int _2105 = _1821 + 272;
        uint _2107 = uint(int(uint(_2105) >> uint(2)));
        _35[int(_2107)] = as_type<uint>(_2067);
        int _2109 = _1821 + 400;
        uint _2111 = uint(int(uint(_2109) >> uint(2)));
        _35[int(_2111)] = as_type<uint>(_1689);
        int _2113 = _1821 + 528;
        uint _2115 = uint(int(uint(_2113) >> uint(2)));
        _35[int(_2115)] = as_type<uint>(_1693);
        int _2117 = _1821 + 656;
        uint _2119 = uint(int(uint(_2117) >> uint(2)));
        _35[int(_2119)] = as_type<uint>(_2095);
        int _2121 = _1865 + 272;
        uint _2123 = uint(int(uint(_2121) >> uint(2)));
        _35[int(_2123)] = as_type<uint>(_2077);
        int _2125 = _1865 + 400;
        uint _2127 = uint(int(uint(_2125) >> uint(2)));
        _35[int(_2127)] = as_type<uint>(_2083);
        int _2129 = _1865 + 528;
        uint _2131 = uint(int(uint(_2129) >> uint(2)));
        _35[int(_2131)] = as_type<uint>(_1701);
        int _2133 = _1865 + 656;
        uint _2135 = uint(int(uint(_2133) >> uint(2)));
        _35[int(_2135)] = as_type<uint>(_1705);
        int _2137 = _1645 & 255;
        int _2139 = _1829 + 272;
        uint _2141 = uint(int(uint(_2139) >> uint(2)));
        _35[int(_2141)] = as_type<uint>(_1713);
        int _2143 = _2137 + 1;
        int _2145 = _1829 + 400;
        uint _2147 = uint(int(uint(_2145) >> uint(2)));
        _35[int(_2147)] = as_type<uint>(_2025);
        int _2149 = _2137 + 3;
        int _2151 = _2137 + 2;
        int _2153 = _1829 + 528;
        uint _2155 = uint(int(uint(_2153) >> uint(2)));
        _35[int(_2155)] = as_type<uint>(_2085);
        int _2157 = _1829 + 656;
        uint _2159 = uint(int(uint(_2157) >> uint(2)));
        _35[int(_2159)] = as_type<uint>(_2027);
        int _2161 = _1717 + 13588;
        int _2163 = _2161;
        int _2165 = _2137;
        _48(_2163, _2165, _35);
        int _2167 = _1717 + 13589;
        int _2169 = _2167;
        int _2171 = _2143;
        _48(_2169, _2171, _35);
        int _2173 = _1717 + 13590;
        int _2175 = _2173;
        int _2177 = _2151;
        _48(_2175, _2177, _35);
        int _2179 = _1717 + 13591;
        int _2181 = _2179;
        int _2183 = _2143;
        _48(_2181, _2183, _35);
        int _2185 = _1717 + 13592;
        int _2187 = _2185;
        int _2189 = _2149;
        _48(_2187, _2189, _35);
        int _2191 = _1717 + 13593;
        int _2193 = _2191;
        int _2195 = _2151;
        _48(_2193, _2195, _35);
        bool _2197 = !_1881;
        if (!_2197)
        {
            int _2199 = _2137 + 4;
            int _2201 = _2137 + 5;
            int _2203 = _1717 + 13594;
            int _2205 = _2203;
            int _2207 = _2199;
            _48(_2205, _2207, _35);
            int _2209 = _1717 + 13595;
            int _2211 = _2209;
            int _2213 = _2137;
            _48(_2211, _2213, _35);
            int _2215 = _1717 + 13596;
            int _2217 = _2215;
            int _2219 = _2201;
            _48(_2217, _2219, _35);
            int _2221 = _1717 + 13597;
            int _2223 = _2221;
            int _2225 = _2137;
            _48(_2223, _2225, _35);
            int _2227 = _1717 + 13598;
            int _2229 = _2227;
            int _2231 = _2151;
            _48(_2229, _2231, _35);
            int _2233 = _1717 + 13599;
            int _2235 = _2233;
            int _2237 = _2201;
            _48(_2235, _2237, _35);
            _2239 = true;
        }
        else
        {
            int _2241 = _2137 + 6;
            int _2243 = _1717 + 13594;
            int _2245 = _2243;
            int _2247 = _2143;
            _48(_2245, _2247, _35);
            int _2249 = _2137 + 7;
            int _2251 = _1717 + 13595;
            int _2253 = _2251;
            int _2255 = _2241;
            _48(_2253, _2255, _35);
            int _2257 = _1717 + 13596;
            int _2259 = _2257;
            int _2261 = _2149;
            _48(_2259, _2261, _35);
            int _2263 = _1717 + 13597;
            int _2265 = _2263;
            int _2267 = _2241;
            _48(_2265, _2267, _35);
            int _2269 = _1717 + 13598;
            int _2271 = _2269;
            int _2273 = _2249;
            _48(_2271, _2273, _35);
            int _2275 = _1717 + 13599;
            int _2277 = _2275;
            int _2279 = _2149;
            _48(_2277, _2279, _35);
        }
        _2239 = false;
        float _2281 = -_735;
        float _2283 = _2281 + _741;
        float _2285 = -_731;
        float _2287 = _2285 + _737;
        float _2289 = -_733;
        float _2291 = _2289 + _739;
        float _2293 = -_733;
        float _2295 = _2293 + (*spvDescriptorSet0.cp_c3)._m0[9].y;
        float _2297 = -_717;
        float _2299 = _2283 * _2297;
        float _2301 = -_735;
        float _2303 = _2301 + (*spvDescriptorSet0.cp_c3)._m0[9].z;
        float _2305 = -_721;
        float _2307 = _2291 * _2305;
        float _2309 = -_721;
        float _2311 = -_2299;
        float _2313 = fma(_2287, _2309, _2311);
        float _2315 = -_719;
        float _2317 = _2287 * _2315;
        float _2319 = -_719;
        float _2321 = -_2307;
        float _2323 = fma(_2283, _2319, _2321);
        float _2325 = _2313 * _2313;
        float _2327 = -_717;
        float _2329 = -_2317;
        float _2331 = fma(_2291, _2327, _2329);
        float _2333 = _2313 * _2295;
        float _2335 = fma(_2323, _2323, _2325);
        float _2337 = -_731;
        float _2339 = _2337 + (*spvDescriptorSet0.cp_c3)._m0[9].x;
        float _2341 = fma(_2331, _2331, _2335);
        float _2343 = fma(_2323, _2339, _2333);
        float _2345 = rsqrt(_2341);
        float _2347 = fma(_2331, _2303, _2343);
        float _2349 = _2347 * _2345;
        bool _2351 = _2349 >= 0.0;
        bool _2353 = !_2351;
        if (!_2353)
        {
            int _2355 = _2137 + 4;
            int _2357 = _1717 + 13600;
            int _2359 = _2357;
            int _2361 = _2137;
            _48(_2359, _2361, _35);
            int _2363 = _2137 + 6;
            int _2365 = _1717 + 13601;
            int _2367 = _2365;
            int _2369 = _2355;
            _48(_2367, _2369, _35);
            int _2371 = _1717 + 13602;
            int _2373 = _2371;
            int _2375 = _2143;
            _48(_2373, _2375, _35);
            int _2377 = _1717 + 13603;
            int _2379 = _2377;
            int _2381 = _2143;
            _48(_2379, _2381, _35);
            int _2383 = _1717 + 13604;
            int _2385 = _2383;
            int _2387 = _2355;
            _48(_2385, _2387, _35);
            int _2389 = _1717 + 13605;
            int _2391 = _2389;
            int _2393 = _2363;
            _48(_2391, _2393, _35);
            _1341 = true;
        }
        else
        {
            int _2395 = _2137 + 5;
            int _2397 = _1717 + 13600;
            int _2399 = _2397;
            int _2401 = _2151;
            _48(_2399, _2401, _35);
            int _2403 = _2137 + 7;
            int _2405 = _1717 + 13601;
            int _2407 = _2405;
            int _2409 = _2149;
            _48(_2407, _2409, _35);
            int _2411 = _1717 + 13602;
            int _2413 = _2411;
            int _2415 = _2395;
            _48(_2413, _2415, _35);
            int _2417 = _1717 + 13603;
            int _2419 = _2417;
            int _2421 = _2149;
            _48(_2419, _2421, _35);
            int _2423 = _1717 + 13604;
            int _2425 = _2423;
            int _2427 = _2403;
            _48(_2425, _2427, _35);
            int _2429 = _1717 + 13605;
            int _2431 = _2429;
            int _2433 = _2395;
            _48(_2431, _2433, _35);
        }
    }
    _1341 = false;
    uint _2435 = spvSubgroupBallot(true).x;
    int _2437 = reverse_bits(int(_2435));
    int _2439 = int(spvFindUMSB(uint(_2437)));
    bool _2441 = _2439 != (-1);
    int _2443 = _2439 ^ 31;
    int _2445 = _2441 ? _2443 : _2439;
    bool _2447 = as_type<int>(_71) != _2445;
    if (_2447)
    {
        return;
    }
    int _2449 = popcount(int(_657));
    int _2451 = _683 * 3;
    int _2453 = _2451 + _2449;
    int _2455 = _2453 << 1;
    int _2457 = 13587;
    int _2459 = _2455;
    _48(_2457, _2459, _35);
}


struct dm_payload_t { uint w[64]; };
struct dm_vertex_t {
    float4 position [[position]];
    float4 a2 [[user(locn2)]];
};
struct dm_prim_t {
    float4 p0 [[user(locn0)]];
    float4 p1 [[user(locn1)]];
};
using dm_mesh_t = metal::mesh<dm_vertex_t, dm_prim_t, 256, 192, metal::topology::triangle>;
[[mesh]] void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint dm_lid [[thread_position_in_threadgroup]], uint dm_tg [[threadgroup_position_in_grid]], dm_mesh_t dm_out, const object_data dm_payload_t& dm_payload [[payload]])
{
    threadgroup spvUnsafeArray<uint, 3541> _35;
    for (uint i = dm_lid; i < 3541u; i += 32u) _35[i] = 0u;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    for (uint i = dm_lid; i < 64u; i += 32u) _35[4u + i] = dm_payload.w[i];
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (dm_lid == 0u) { _35[0] = dm_tg; _35[4] = dm_tg; }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    dm_stage_body(spvDescriptorSet0, gl_SubgroupInvocationID, _35);
    threadgroup_barrier(mem_flags::mem_threadgroup);
    uint np = min(_35[3396] >> 24, 192u);
    if (dm_lid == 0u) dm_out.set_primitive_count(np);
    for (uint n = dm_lid; n < 256u; n += 32u)
    {
        uint b = 68u + (n / 32u) * 416u + n % 32u;
        dm_vertex_t v;
        v.position = float4(as_type<float>(_35[b + 0u]), as_type<float>(_35[b + 32u]), as_type<float>(_35[b + 64u]), as_type<float>(_35[b + 96u]));
        v.a2 = float4(as_type<float>(_35[b + 128u]), as_type<float>(_35[b + 160u]), as_type<float>(_35[b + 192u]), as_type<float>(_35[b + 224u]));
        v.position.z = fma(v.position.z, 0.5, v.position.w * 0.5);
        dm_out.set_vertex(n, v);
    }
    for (uint n = dm_lid; n < np; n += 32u)
    {
        uint b = 68u + (n / 32u) * 416u + n % 32u;
        dm_prim_t p;
        p.p0 = float4(as_type<float>(_35[b + 256u]), 0.0, 0.0, 1.0);
        p.p1 = float4(as_type<float>(_35[b + 288u]), as_type<float>(_35[b + 320u]), as_type<float>(_35[b + 352u]), as_type<float>(_35[b + 384u]));
        dm_out.set_primitive(n, p);
    }
    for (uint n = dm_lid; n < np * 3u; n += 32u)
    {
        uint at = 13588u + n;
        dm_out.set_index(n, (_35[at >> 2] >> ((at & 3u) * 8u)) & 0xffu);
    }
}

[[mesh]] void main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint dm_lid [[thread_position_in_threadgroup]], uint dm_tg [[threadgroup_position_in_grid]], dm_mesh_t dm_out, const object_data dm_payload_t& dm_payload [[payload]])
{
    threadgroup spvUnsafeArray<uint, 3541> _35;
    for (uint i = dm_lid; i < 3541u; i += 32u) _35[i] = 0u;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    for (uint i = dm_lid; i < 64u; i += 32u) _35[4u + i] = dm_payload.w[i];
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (dm_lid == 0u) { _35[0] = dm_tg; _35[4] = dm_tg; }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    dm_stage_body(spvDescriptorSet0, gl_SubgroupInvocationID, _35);
    threadgroup_barrier(mem_flags::mem_threadgroup);
    uint np = min(_35[3396] >> 24, 192u);
    if (dm_lid == 0u) dm_out.set_primitive_count(np);
    for (uint n = dm_lid; n < 256u; n += 32u)
    {
        uint b = 68u + (n / 32u) * 416u + n % 32u;
        dm_vertex_t v;
        v.position = float4(as_type<float>(_35[b + 0u]), as_type<float>(_35[b + 32u]), as_type<float>(_35[b + 64u]), as_type<float>(_35[b + 96u]));
        v.a2 = float4(as_type<float>(_35[b + 128u]), as_type<float>(_35[b + 160u]), as_type<float>(_35[b + 192u]), as_type<float>(_35[b + 224u]));
        dm_out.set_vertex(n, v);
    }
    for (uint n = dm_lid; n < np; n += 32u)
    {
        uint b = 68u + (n / 32u) * 416u + n % 32u;
        dm_prim_t p;
        p.p0 = float4(as_type<float>(_35[b + 256u]), 0.0, 0.0, 1.0);
        p.p1 = float4(as_type<float>(_35[b + 288u]), as_type<float>(_35[b + 320u]), as_type<float>(_35[b + 352u]), as_type<float>(_35[b + 384u]));
        dm_out.set_primitive(n, p);
    }
    for (uint n = dm_lid; n < np * 3u; n += 32u)
    {
        uint at = 13588u + n;
        dm_out.set_index(n, (_35[at >> 2] >> ((at & 3u) * 8u)) & 0xffu);
    }
}
