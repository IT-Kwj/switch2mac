#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    device _23* cp_s0 [[id(2)]];
    texture2d<float> cp_i_tcb_4A_ [[id(3)]];
    texture2d<float> cp_i_tcb_48_ [[id(4)]];
};

static inline __attribute__((always_inline))
int _47(thread const int& _4804, thread const int& _4805, constant _10& support_buffer)
{
    int _4808 = 1 + _4805;
    float _4810 = support_buffer._m5[_4808].x;
    bool _4812 = _4810 == 1.0;
    if (_4812)
    {
        return _4804;
    }
    float _4814 = float(_4804);
    float _4816 = _4814 * _4810;
    int _4818 = int(_4816);
    return _4818;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    float _51 = as_type<float>(gl_WorkGroupID.x);
    float _53 = as_type<float>(gl_LocalInvocationID.x);
    float _55 = as_type<float>(gl_WorkGroupID.y);
    float _57 = as_type<float>(gl_LocalInvocationID.y);
    int _59 = as_type<int>(_51) * 8;
    int _61 = _59 + as_type<int>(_53);
    int _63 = as_type<int>(_55) * 8;
    int _65 = _63 + as_type<int>(_57);
    int _67 = _61;
    int _69 = 0;
    int _71 = _47(_67, _69, (*spvDescriptorSet0.support_buffer));
    int _73 = _65;
    int _75 = 0;
    int _77 = _47(_73, _75, (*spvDescriptorSet0.support_buffer));
    float _79 = spvDescriptorSet0.cp_i_tcb_4A_.read(uint2(int2(_71, _77))).x;
    int _81 = _61;
    int _83 = 1;
    int _85 = _47(_81, _83, (*spvDescriptorSet0.support_buffer));
    int _87 = _65;
    int _89 = 1;
    int _91 = _47(_87, _89, (*spvDescriptorSet0.support_buffer));
    float4 _94 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_85, _91))).xyzw);
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    bool _106 = _79 > (*spvDescriptorSet0.cp_c3)._m0[0].x;
    bool _108 = _96 == _98;
    bool _110 = _108 && _106;
    bool _112 = _100 == 1.0;
    bool _114 = _112 && _110;
    if (!_114)
    {
        return;
    }
    float _116 = _96 * 65535.0;
    float _118 = _79 * 65535.0;
    float _120 = as_type<float>(gl_SubgroupInvocationID);
    uint _123 = spvSubgroupBallot(true).x;
    int _125 = int(spvFindUMSB(_123));
    float _127 = trunc(_116);
    float _129 = precise::max(_127, 0.0);
    uint _131 = uint(_129);
    float _133 = trunc(_118);
    float _135 = precise::max(_133, 0.0);
    uint _137 = uint(_135);
    uint _139 = spvSubgroupBallot(true).x;
    float _141 = spvSubgroupShuffle(as_type<float>(_131), 0u);
    int _143 = int(_139) & 1;
    bool _145 = _143 != 0;
    uint _147 = uint(_145 ? as_type<int>(_141) : (-1));
    float _149 = spvSubgroupShuffle(as_type<float>(_131), 1u);
    uint _151 = min(_147, as_type<uint>(_149));
    uint _153 = uint(int(uint(int(_139)) >> uint(1)));
    int _155 = int(_153) & 1;
    bool _157 = _155 != 0;
    uint _159 = uint(_157 ? int(_151) : int(_147));
    float _161 = spvSubgroupShuffle(as_type<float>(_131), 2u);
    uint _163 = min(_159, as_type<uint>(_161));
    uint _165 = uint(int(uint(int(_139)) >> uint(2)));
    int _167 = int(_165) & 1;
    bool _169 = _167 != 0;
    uint _171 = uint(_169 ? int(_163) : int(_159));
    float _173 = spvSubgroupShuffle(as_type<float>(_131), 3u);
    uint _175 = min(_171, as_type<uint>(_173));
    uint _177 = uint(int(uint(int(_139)) >> uint(3)));
    int _179 = int(_177) & 1;
    bool _181 = _179 != 0;
    uint _183 = uint(_181 ? int(_175) : int(_171));
    float _185 = spvSubgroupShuffle(as_type<float>(_131), 4u);
    uint _187 = min(_183, as_type<uint>(_185));
    uint _189 = uint(int(uint(int(_139)) >> uint(4)));
    int _191 = int(_189) & 1;
    bool _193 = _191 != 0;
    uint _195 = uint(_193 ? int(_187) : int(_183));
    float _197 = spvSubgroupShuffle(as_type<float>(_131), 5u);
    uint _199 = min(_195, as_type<uint>(_197));
    uint _201 = uint(int(uint(int(_139)) >> uint(5)));
    int _203 = int(_201) & 1;
    bool _205 = _203 != 0;
    uint _207 = uint(_205 ? int(_199) : int(_195));
    float _209 = spvSubgroupShuffle(as_type<float>(_131), 6u);
    uint _211 = min(_207, as_type<uint>(_209));
    uint _213 = uint(int(uint(int(_139)) >> uint(6)));
    int _215 = int(_213) & 1;
    bool _217 = _215 != 0;
    uint _219 = uint(_217 ? int(_211) : int(_207));
    float _221 = spvSubgroupShuffle(as_type<float>(_131), 7u);
    uint _223 = min(_219, as_type<uint>(_221));
    uint _225 = uint(int(uint(int(_139)) >> uint(7)));
    int _227 = int(_225) & 1;
    bool _229 = _227 != 0;
    uint _231 = uint(_229 ? int(_223) : int(_219));
    float _233 = spvSubgroupShuffle(as_type<float>(_131), 8u);
    uint _235 = min(_231, as_type<uint>(_233));
    uint _237 = uint(int(uint(int(_139)) >> uint(8)));
    int _239 = int(_237) & 1;
    bool _241 = _239 != 0;
    uint _243 = uint(_241 ? int(_235) : int(_231));
    float _245 = spvSubgroupShuffle(as_type<float>(_131), 9u);
    uint _247 = min(_243, as_type<uint>(_245));
    uint _249 = uint(int(uint(int(_139)) >> uint(9)));
    int _251 = int(_249) & 1;
    bool _253 = _251 != 0;
    uint _255 = uint(_253 ? int(_247) : int(_243));
    float _257 = spvSubgroupShuffle(as_type<float>(_131), 10u);
    uint _259 = min(_255, as_type<uint>(_257));
    uint _261 = uint(int(uint(int(_139)) >> uint(10)));
    int _263 = int(_261) & 1;
    bool _265 = _263 != 0;
    uint _267 = uint(_265 ? int(_259) : int(_255));
    float _269 = spvSubgroupShuffle(as_type<float>(_131), 11u);
    uint _271 = min(_267, as_type<uint>(_269));
    uint _273 = uint(int(uint(int(_139)) >> uint(11)));
    int _275 = int(_273) & 1;
    bool _277 = _275 != 0;
    uint _279 = uint(_277 ? int(_271) : int(_267));
    float _281 = spvSubgroupShuffle(as_type<float>(_131), 12u);
    uint _283 = min(_279, as_type<uint>(_281));
    uint _285 = uint(int(uint(int(_139)) >> uint(12)));
    int _287 = int(_285) & 1;
    bool _289 = _287 != 0;
    uint _291 = uint(_289 ? int(_283) : int(_279));
    float _293 = spvSubgroupShuffle(as_type<float>(_131), 13u);
    uint _295 = min(_291, as_type<uint>(_293));
    uint _297 = uint(int(uint(int(_139)) >> uint(13)));
    int _299 = int(_297) & 1;
    bool _301 = _299 != 0;
    uint _303 = uint(_301 ? int(_295) : int(_291));
    float _305 = spvSubgroupShuffle(as_type<float>(_131), 14u);
    uint _307 = min(_303, as_type<uint>(_305));
    uint _309 = uint(int(uint(int(_139)) >> uint(14)));
    int _311 = int(_309) & 1;
    bool _313 = _311 != 0;
    uint _315 = uint(_313 ? int(_307) : int(_303));
    float _317 = spvSubgroupShuffle(as_type<float>(_131), 15u);
    uint _319 = min(_315, as_type<uint>(_317));
    uint _321 = uint(int(uint(int(_139)) >> uint(15)));
    int _323 = int(_321) & 1;
    bool _325 = _323 != 0;
    uint _327 = uint(_325 ? int(_319) : int(_315));
    float _329 = spvSubgroupShuffle(as_type<float>(_131), 16u);
    uint _331 = min(_327, as_type<uint>(_329));
    uint _333 = uint(int(uint(int(_139)) >> uint(16)));
    int _335 = int(_333) & 1;
    bool _337 = _335 != 0;
    uint _339 = uint(_337 ? int(_331) : int(_327));
    float _341 = spvSubgroupShuffle(as_type<float>(_131), 17u);
    uint _343 = min(_339, as_type<uint>(_341));
    uint _345 = uint(int(uint(int(_139)) >> uint(17)));
    int _347 = int(_345) & 1;
    bool _349 = _347 != 0;
    uint _351 = uint(_349 ? int(_343) : int(_339));
    float _353 = spvSubgroupShuffle(as_type<float>(_131), 18u);
    uint _355 = min(_351, as_type<uint>(_353));
    uint _357 = uint(int(uint(int(_139)) >> uint(18)));
    int _359 = int(_357) & 1;
    bool _361 = _359 != 0;
    uint _363 = uint(_361 ? int(_355) : int(_351));
    float _365 = spvSubgroupShuffle(as_type<float>(_131), 19u);
    uint _367 = min(_363, as_type<uint>(_365));
    uint _369 = uint(int(uint(int(_139)) >> uint(19)));
    int _371 = int(_369) & 1;
    bool _373 = _371 != 0;
    uint _375 = uint(_373 ? int(_367) : int(_363));
    float _377 = spvSubgroupShuffle(as_type<float>(_131), 20u);
    uint _379 = min(_375, as_type<uint>(_377));
    uint _381 = uint(int(uint(int(_139)) >> uint(20)));
    int _383 = int(_381) & 1;
    bool _385 = _383 != 0;
    uint _387 = uint(_385 ? int(_379) : int(_375));
    float _389 = spvSubgroupShuffle(as_type<float>(_131), 21u);
    uint _391 = min(_387, as_type<uint>(_389));
    uint _393 = uint(int(uint(int(_139)) >> uint(21)));
    int _395 = int(_393) & 1;
    bool _397 = _395 != 0;
    uint _399 = uint(_397 ? int(_391) : int(_387));
    float _401 = spvSubgroupShuffle(as_type<float>(_131), 22u);
    uint _403 = min(_399, as_type<uint>(_401));
    uint _405 = uint(int(uint(int(_139)) >> uint(22)));
    int _407 = int(_405) & 1;
    bool _409 = _407 != 0;
    uint _411 = uint(_409 ? int(_403) : int(_399));
    float _413 = spvSubgroupShuffle(as_type<float>(_131), 23u);
    uint _415 = min(_411, as_type<uint>(_413));
    uint _417 = uint(int(uint(int(_139)) >> uint(23)));
    int _419 = int(_417) & 1;
    bool _421 = _419 != 0;
    uint _423 = uint(_421 ? int(_415) : int(_411));
    float _425 = spvSubgroupShuffle(as_type<float>(_131), 24u);
    uint _427 = min(_423, as_type<uint>(_425));
    uint _429 = uint(int(uint(int(_139)) >> uint(24)));
    int _431 = int(_429) & 1;
    bool _433 = _431 != 0;
    uint _435 = uint(_433 ? int(_427) : int(_423));
    float _437 = spvSubgroupShuffle(as_type<float>(_131), 25u);
    uint _439 = min(_435, as_type<uint>(_437));
    uint _441 = uint(int(uint(int(_139)) >> uint(25)));
    int _443 = int(_441) & 1;
    bool _445 = _443 != 0;
    uint _447 = uint(_445 ? int(_439) : int(_435));
    float _449 = spvSubgroupShuffle(as_type<float>(_131), 26u);
    uint _451 = min(_447, as_type<uint>(_449));
    uint _453 = uint(int(uint(int(_139)) >> uint(26)));
    int _455 = int(_453) & 1;
    bool _457 = _455 != 0;
    uint _459 = uint(_457 ? int(_451) : int(_447));
    float _461 = spvSubgroupShuffle(as_type<float>(_131), 27u);
    uint _463 = min(_459, as_type<uint>(_461));
    uint _465 = uint(int(uint(int(_139)) >> uint(27)));
    int _467 = int(_465) & 1;
    bool _469 = _467 != 0;
    uint _471 = uint(_469 ? int(_463) : int(_459));
    float _473 = spvSubgroupShuffle(as_type<float>(_131), 28u);
    uint _475 = min(_471, as_type<uint>(_473));
    uint _477 = uint(int(uint(int(_139)) >> uint(28)));
    int _479 = int(_477) & 1;
    bool _481 = _479 != 0;
    uint _483 = uint(_481 ? int(_475) : int(_471));
    float _485 = spvSubgroupShuffle(as_type<float>(_131), 29u);
    uint _487 = min(_483, as_type<uint>(_485));
    uint _489 = uint(int(uint(int(_139)) >> uint(29)));
    int _491 = int(_489) & 1;
    bool _493 = _491 != 0;
    uint _495 = uint(_493 ? int(_487) : int(_483));
    float _497 = spvSubgroupShuffle(as_type<float>(_131), 30u);
    uint _499 = min(_495, as_type<uint>(_497));
    uint _501 = uint(int(uint(int(_139)) >> uint(30)));
    int _503 = int(_501) & 1;
    bool _505 = _503 != 0;
    uint _507 = uint(_505 ? int(_499) : int(_495));
    float _509 = spvSubgroupShuffle(as_type<float>(_131), 31u);
    uint _511 = min(_507, as_type<uint>(_509));
    uint _513 = uint(int(uint(int(_139)) >> uint(31)));
    int _515 = int(_513) & 1;
    bool _517 = _515 != 0;
    int _519 = _517 ? int(_511) : int(_507);
    int _521 = popcount(int(_123));
    bool _523 = as_type<int>(_120) == _125;
    uint _525 = spvSubgroupBallot(true).x;
    float _527 = spvSubgroupShuffle(as_type<float>(_131), 0u);
    int _529 = int(_525) & 1;
    bool _531 = _529 != 0;
    uint _533 = uint(_531 ? as_type<int>(_527) : 0);
    float _535 = spvSubgroupShuffle(as_type<float>(_131), 1u);
    uint _537 = max(_533, as_type<uint>(_535));
    uint _539 = uint(int(uint(int(_525)) >> uint(1)));
    int _541 = int(_539) & 1;
    bool _543 = _541 != 0;
    uint _545 = uint(_543 ? int(_537) : int(_533));
    float _547 = spvSubgroupShuffle(as_type<float>(_131), 2u);
    uint _549 = max(_545, as_type<uint>(_547));
    uint _551 = uint(int(uint(int(_525)) >> uint(2)));
    int _553 = int(_551) & 1;
    bool _555 = _553 != 0;
    uint _557 = uint(_555 ? int(_549) : int(_545));
    float _559 = spvSubgroupShuffle(as_type<float>(_131), 3u);
    uint _561 = max(_557, as_type<uint>(_559));
    uint _563 = uint(int(uint(int(_525)) >> uint(3)));
    int _565 = int(_563) & 1;
    bool _567 = _565 != 0;
    uint _569 = uint(_567 ? int(_561) : int(_557));
    float _571 = spvSubgroupShuffle(as_type<float>(_131), 4u);
    uint _573 = max(_569, as_type<uint>(_571));
    uint _575 = uint(int(uint(int(_525)) >> uint(4)));
    int _577 = int(_575) & 1;
    bool _579 = _577 != 0;
    uint _581 = uint(_579 ? int(_573) : int(_569));
    float _583 = spvSubgroupShuffle(as_type<float>(_131), 5u);
    uint _585 = max(_581, as_type<uint>(_583));
    uint _587 = uint(int(uint(int(_525)) >> uint(5)));
    int _589 = int(_587) & 1;
    bool _591 = _589 != 0;
    uint _593 = uint(_591 ? int(_585) : int(_581));
    float _595 = spvSubgroupShuffle(as_type<float>(_131), 6u);
    uint _597 = max(_593, as_type<uint>(_595));
    uint _599 = uint(int(uint(int(_525)) >> uint(6)));
    int _601 = int(_599) & 1;
    bool _603 = _601 != 0;
    uint _605 = uint(_603 ? int(_597) : int(_593));
    float _607 = spvSubgroupShuffle(as_type<float>(_131), 7u);
    uint _609 = max(_605, as_type<uint>(_607));
    uint _611 = uint(int(uint(int(_525)) >> uint(7)));
    int _613 = int(_611) & 1;
    bool _615 = _613 != 0;
    uint _617 = uint(_615 ? int(_609) : int(_605));
    float _619 = spvSubgroupShuffle(as_type<float>(_131), 8u);
    uint _621 = max(_617, as_type<uint>(_619));
    uint _623 = uint(int(uint(int(_525)) >> uint(8)));
    int _625 = int(_623) & 1;
    bool _627 = _625 != 0;
    uint _629 = uint(_627 ? int(_621) : int(_617));
    float _631 = spvSubgroupShuffle(as_type<float>(_131), 9u);
    uint _633 = max(_629, as_type<uint>(_631));
    uint _635 = uint(int(uint(int(_525)) >> uint(9)));
    int _637 = int(_635) & 1;
    bool _639 = _637 != 0;
    uint _641 = uint(_639 ? int(_633) : int(_629));
    float _643 = spvSubgroupShuffle(as_type<float>(_131), 10u);
    uint _645 = max(_641, as_type<uint>(_643));
    uint _647 = uint(int(uint(int(_525)) >> uint(10)));
    int _649 = int(_647) & 1;
    bool _651 = _649 != 0;
    uint _653 = uint(_651 ? int(_645) : int(_641));
    float _655 = spvSubgroupShuffle(as_type<float>(_131), 11u);
    uint _657 = max(_653, as_type<uint>(_655));
    uint _659 = uint(int(uint(int(_525)) >> uint(11)));
    int _661 = int(_659) & 1;
    bool _663 = _661 != 0;
    uint _665 = uint(_663 ? int(_657) : int(_653));
    float _667 = spvSubgroupShuffle(as_type<float>(_131), 12u);
    uint _669 = max(_665, as_type<uint>(_667));
    uint _671 = uint(int(uint(int(_525)) >> uint(12)));
    int _673 = int(_671) & 1;
    bool _675 = _673 != 0;
    uint _677 = uint(_675 ? int(_669) : int(_665));
    float _679 = spvSubgroupShuffle(as_type<float>(_131), 13u);
    uint _681 = max(_677, as_type<uint>(_679));
    uint _683 = uint(int(uint(int(_525)) >> uint(13)));
    int _685 = int(_683) & 1;
    bool _687 = _685 != 0;
    uint _689 = uint(_687 ? int(_681) : int(_677));
    float _691 = spvSubgroupShuffle(as_type<float>(_131), 14u);
    uint _693 = max(_689, as_type<uint>(_691));
    uint _695 = uint(int(uint(int(_525)) >> uint(14)));
    int _697 = int(_695) & 1;
    bool _699 = _697 != 0;
    uint _701 = uint(_699 ? int(_693) : int(_689));
    float _703 = spvSubgroupShuffle(as_type<float>(_131), 15u);
    uint _705 = max(_701, as_type<uint>(_703));
    uint _707 = uint(int(uint(int(_525)) >> uint(15)));
    int _709 = int(_707) & 1;
    bool _711 = _709 != 0;
    uint _713 = uint(_711 ? int(_705) : int(_701));
    float _715 = spvSubgroupShuffle(as_type<float>(_131), 16u);
    uint _717 = max(_713, as_type<uint>(_715));
    uint _719 = uint(int(uint(int(_525)) >> uint(16)));
    int _721 = int(_719) & 1;
    bool _723 = _721 != 0;
    uint _725 = uint(_723 ? int(_717) : int(_713));
    float _727 = spvSubgroupShuffle(as_type<float>(_131), 17u);
    uint _729 = max(_725, as_type<uint>(_727));
    uint _731 = uint(int(uint(int(_525)) >> uint(17)));
    int _733 = int(_731) & 1;
    bool _735 = _733 != 0;
    uint _737 = uint(_735 ? int(_729) : int(_725));
    float _739 = spvSubgroupShuffle(as_type<float>(_131), 18u);
    uint _741 = max(_737, as_type<uint>(_739));
    uint _743 = uint(int(uint(int(_525)) >> uint(18)));
    int _745 = int(_743) & 1;
    bool _747 = _745 != 0;
    uint _749 = uint(_747 ? int(_741) : int(_737));
    float _751 = spvSubgroupShuffle(as_type<float>(_131), 19u);
    uint _753 = max(_749, as_type<uint>(_751));
    uint _755 = uint(int(uint(int(_525)) >> uint(19)));
    int _757 = int(_755) & 1;
    bool _759 = _757 != 0;
    uint _761 = uint(_759 ? int(_753) : int(_749));
    float _763 = spvSubgroupShuffle(as_type<float>(_131), 20u);
    uint _765 = max(_761, as_type<uint>(_763));
    uint _767 = uint(int(uint(int(_525)) >> uint(20)));
    int _769 = int(_767) & 1;
    bool _771 = _769 != 0;
    uint _773 = uint(_771 ? int(_765) : int(_761));
    float _775 = spvSubgroupShuffle(as_type<float>(_131), 21u);
    uint _777 = max(_773, as_type<uint>(_775));
    uint _779 = uint(int(uint(int(_525)) >> uint(21)));
    int _781 = int(_779) & 1;
    bool _783 = _781 != 0;
    uint _785 = uint(_783 ? int(_777) : int(_773));
    float _787 = spvSubgroupShuffle(as_type<float>(_131), 22u);
    uint _789 = max(_785, as_type<uint>(_787));
    uint _791 = uint(int(uint(int(_525)) >> uint(22)));
    int _793 = int(_791) & 1;
    bool _795 = _793 != 0;
    uint _797 = uint(_795 ? int(_789) : int(_785));
    float _799 = spvSubgroupShuffle(as_type<float>(_131), 23u);
    uint _801 = max(_797, as_type<uint>(_799));
    uint _803 = uint(int(uint(int(_525)) >> uint(23)));
    int _805 = int(_803) & 1;
    bool _807 = _805 != 0;
    uint _809 = uint(_807 ? int(_801) : int(_797));
    float _811 = spvSubgroupShuffle(as_type<float>(_131), 24u);
    uint _813 = max(_809, as_type<uint>(_811));
    uint _815 = uint(int(uint(int(_525)) >> uint(24)));
    int _817 = int(_815) & 1;
    bool _819 = _817 != 0;
    uint _821 = uint(_819 ? int(_813) : int(_809));
    float _823 = spvSubgroupShuffle(as_type<float>(_131), 25u);
    uint _825 = max(_821, as_type<uint>(_823));
    uint _827 = uint(int(uint(int(_525)) >> uint(25)));
    int _829 = int(_827) & 1;
    bool _831 = _829 != 0;
    uint _833 = uint(_831 ? int(_825) : int(_821));
    float _835 = spvSubgroupShuffle(as_type<float>(_131), 26u);
    uint _837 = max(_833, as_type<uint>(_835));
    uint _839 = uint(int(uint(int(_525)) >> uint(26)));
    int _841 = int(_839) & 1;
    bool _843 = _841 != 0;
    uint _845 = uint(_843 ? int(_837) : int(_833));
    float _847 = spvSubgroupShuffle(as_type<float>(_131), 27u);
    uint _849 = max(_845, as_type<uint>(_847));
    uint _851 = uint(int(uint(int(_525)) >> uint(27)));
    int _853 = int(_851) & 1;
    bool _855 = _853 != 0;
    uint _857 = uint(_855 ? int(_849) : int(_845));
    float _859 = spvSubgroupShuffle(as_type<float>(_131), 28u);
    uint _861 = max(_857, as_type<uint>(_859));
    uint _863 = uint(int(uint(int(_525)) >> uint(28)));
    int _865 = int(_863) & 1;
    bool _867 = _865 != 0;
    uint _869 = uint(_867 ? int(_861) : int(_857));
    float _871 = spvSubgroupShuffle(as_type<float>(_131), 29u);
    uint _873 = max(_869, as_type<uint>(_871));
    uint _875 = uint(int(uint(int(_525)) >> uint(29)));
    int _877 = int(_875) & 1;
    bool _879 = _877 != 0;
    uint _881 = uint(_879 ? int(_873) : int(_869));
    float _883 = spvSubgroupShuffle(as_type<float>(_131), 30u);
    uint _885 = max(_881, as_type<uint>(_883));
    uint _887 = uint(int(uint(int(_525)) >> uint(30)));
    int _889 = int(_887) & 1;
    bool _891 = _889 != 0;
    uint _893 = uint(_891 ? int(_885) : int(_881));
    float _895 = spvSubgroupShuffle(as_type<float>(_131), 31u);
    uint _897 = max(_893, as_type<uint>(_895));
    uint _899 = uint(int(uint(int(_525)) >> uint(31)));
    int _901 = int(_899) & 1;
    bool _903 = _901 != 0;
    int _905 = _903 ? int(_897) : int(_893);
    uint _907 = spvSubgroupBallot(true).x;
    float _909 = spvSubgroupShuffle(as_type<float>(_137), 0u);
    int _911 = int(_907) & 1;
    bool _913 = _911 != 0;
    uint _915 = uint(_913 ? as_type<int>(_909) : (-1));
    float _917 = spvSubgroupShuffle(as_type<float>(_137), 1u);
    uint _919 = min(_915, as_type<uint>(_917));
    uint _921 = uint(int(uint(int(_907)) >> uint(1)));
    int _923 = int(_921) & 1;
    bool _925 = _923 != 0;
    uint _927 = uint(_925 ? int(_919) : int(_915));
    float _929 = spvSubgroupShuffle(as_type<float>(_137), 2u);
    uint _931 = min(_927, as_type<uint>(_929));
    uint _933 = uint(int(uint(int(_907)) >> uint(2)));
    int _935 = int(_933) & 1;
    bool _937 = _935 != 0;
    uint _939 = uint(_937 ? int(_931) : int(_927));
    float _941 = spvSubgroupShuffle(as_type<float>(_137), 3u);
    uint _943 = min(_939, as_type<uint>(_941));
    uint _945 = uint(int(uint(int(_907)) >> uint(3)));
    int _947 = int(_945) & 1;
    bool _949 = _947 != 0;
    uint _951 = uint(_949 ? int(_943) : int(_939));
    float _953 = spvSubgroupShuffle(as_type<float>(_137), 4u);
    uint _955 = min(_951, as_type<uint>(_953));
    uint _957 = uint(int(uint(int(_907)) >> uint(4)));
    int _959 = int(_957) & 1;
    bool _961 = _959 != 0;
    uint _963 = uint(_961 ? int(_955) : int(_951));
    float _965 = spvSubgroupShuffle(as_type<float>(_137), 5u);
    uint _967 = min(_963, as_type<uint>(_965));
    uint _969 = uint(int(uint(int(_907)) >> uint(5)));
    int _971 = int(_969) & 1;
    bool _973 = _971 != 0;
    uint _975 = uint(_973 ? int(_967) : int(_963));
    float _977 = spvSubgroupShuffle(as_type<float>(_137), 6u);
    uint _979 = min(_975, as_type<uint>(_977));
    uint _981 = uint(int(uint(int(_907)) >> uint(6)));
    int _983 = int(_981) & 1;
    bool _985 = _983 != 0;
    uint _987 = uint(_985 ? int(_979) : int(_975));
    float _989 = spvSubgroupShuffle(as_type<float>(_137), 7u);
    uint _991 = min(_987, as_type<uint>(_989));
    uint _993 = uint(int(uint(int(_907)) >> uint(7)));
    int _995 = int(_993) & 1;
    bool _997 = _995 != 0;
    uint _999 = uint(_997 ? int(_991) : int(_987));
    float _1001 = spvSubgroupShuffle(as_type<float>(_137), 8u);
    uint _1003 = min(_999, as_type<uint>(_1001));
    uint _1005 = uint(int(uint(int(_907)) >> uint(8)));
    int _1007 = int(_1005) & 1;
    bool _1009 = _1007 != 0;
    uint _1011 = uint(_1009 ? int(_1003) : int(_999));
    float _1013 = spvSubgroupShuffle(as_type<float>(_137), 9u);
    uint _1015 = min(_1011, as_type<uint>(_1013));
    uint _1017 = uint(int(uint(int(_907)) >> uint(9)));
    int _1019 = int(_1017) & 1;
    bool _1021 = _1019 != 0;
    uint _1023 = uint(_1021 ? int(_1015) : int(_1011));
    float _1025 = spvSubgroupShuffle(as_type<float>(_137), 10u);
    uint _1027 = min(_1023, as_type<uint>(_1025));
    uint _1029 = uint(int(uint(int(_907)) >> uint(10)));
    int _1031 = int(_1029) & 1;
    bool _1033 = _1031 != 0;
    uint _1035 = uint(_1033 ? int(_1027) : int(_1023));
    float _1037 = spvSubgroupShuffle(as_type<float>(_137), 11u);
    uint _1039 = min(_1035, as_type<uint>(_1037));
    uint _1041 = uint(int(uint(int(_907)) >> uint(11)));
    int _1043 = int(_1041) & 1;
    bool _1045 = _1043 != 0;
    uint _1047 = uint(_1045 ? int(_1039) : int(_1035));
    float _1049 = spvSubgroupShuffle(as_type<float>(_137), 12u);
    uint _1051 = min(_1047, as_type<uint>(_1049));
    uint _1053 = uint(int(uint(int(_907)) >> uint(12)));
    int _1055 = int(_1053) & 1;
    bool _1057 = _1055 != 0;
    uint _1059 = uint(_1057 ? int(_1051) : int(_1047));
    float _1061 = spvSubgroupShuffle(as_type<float>(_137), 13u);
    uint _1063 = min(_1059, as_type<uint>(_1061));
    uint _1065 = uint(int(uint(int(_907)) >> uint(13)));
    int _1067 = int(_1065) & 1;
    bool _1069 = _1067 != 0;
    uint _1071 = uint(_1069 ? int(_1063) : int(_1059));
    float _1073 = spvSubgroupShuffle(as_type<float>(_137), 14u);
    uint _1075 = min(_1071, as_type<uint>(_1073));
    uint _1077 = uint(int(uint(int(_907)) >> uint(14)));
    int _1079 = int(_1077) & 1;
    bool _1081 = _1079 != 0;
    uint _1083 = uint(_1081 ? int(_1075) : int(_1071));
    float _1085 = spvSubgroupShuffle(as_type<float>(_137), 15u);
    uint _1087 = min(_1083, as_type<uint>(_1085));
    uint _1089 = uint(int(uint(int(_907)) >> uint(15)));
    int _1091 = int(_1089) & 1;
    bool _1093 = _1091 != 0;
    uint _1095 = uint(_1093 ? int(_1087) : int(_1083));
    float _1097 = spvSubgroupShuffle(as_type<float>(_137), 16u);
    uint _1099 = min(_1095, as_type<uint>(_1097));
    uint _1101 = uint(int(uint(int(_907)) >> uint(16)));
    int _1103 = int(_1101) & 1;
    bool _1105 = _1103 != 0;
    uint _1107 = uint(_1105 ? int(_1099) : int(_1095));
    float _1109 = spvSubgroupShuffle(as_type<float>(_137), 17u);
    uint _1111 = min(_1107, as_type<uint>(_1109));
    uint _1113 = uint(int(uint(int(_907)) >> uint(17)));
    int _1115 = int(_1113) & 1;
    bool _1117 = _1115 != 0;
    uint _1119 = uint(_1117 ? int(_1111) : int(_1107));
    float _1121 = spvSubgroupShuffle(as_type<float>(_137), 18u);
    uint _1123 = min(_1119, as_type<uint>(_1121));
    uint _1125 = uint(int(uint(int(_907)) >> uint(18)));
    int _1127 = int(_1125) & 1;
    bool _1129 = _1127 != 0;
    uint _1131 = uint(_1129 ? int(_1123) : int(_1119));
    float _1133 = spvSubgroupShuffle(as_type<float>(_137), 19u);
    uint _1135 = min(_1131, as_type<uint>(_1133));
    uint _1137 = uint(int(uint(int(_907)) >> uint(19)));
    int _1139 = int(_1137) & 1;
    bool _1141 = _1139 != 0;
    uint _1143 = uint(_1141 ? int(_1135) : int(_1131));
    float _1145 = spvSubgroupShuffle(as_type<float>(_137), 20u);
    uint _1147 = min(_1143, as_type<uint>(_1145));
    uint _1149 = uint(int(uint(int(_907)) >> uint(20)));
    int _1151 = int(_1149) & 1;
    bool _1153 = _1151 != 0;
    uint _1155 = uint(_1153 ? int(_1147) : int(_1143));
    float _1157 = spvSubgroupShuffle(as_type<float>(_137), 21u);
    uint _1159 = min(_1155, as_type<uint>(_1157));
    uint _1161 = uint(int(uint(int(_907)) >> uint(21)));
    int _1163 = int(_1161) & 1;
    bool _1165 = _1163 != 0;
    uint _1167 = uint(_1165 ? int(_1159) : int(_1155));
    float _1169 = spvSubgroupShuffle(as_type<float>(_137), 22u);
    uint _1171 = min(_1167, as_type<uint>(_1169));
    uint _1173 = uint(int(uint(int(_907)) >> uint(22)));
    int _1175 = int(_1173) & 1;
    bool _1177 = _1175 != 0;
    uint _1179 = uint(_1177 ? int(_1171) : int(_1167));
    float _1181 = spvSubgroupShuffle(as_type<float>(_137), 23u);
    uint _1183 = min(_1179, as_type<uint>(_1181));
    uint _1185 = uint(int(uint(int(_907)) >> uint(23)));
    int _1187 = int(_1185) & 1;
    bool _1189 = _1187 != 0;
    uint _1191 = uint(_1189 ? int(_1183) : int(_1179));
    float _1193 = spvSubgroupShuffle(as_type<float>(_137), 24u);
    uint _1195 = min(_1191, as_type<uint>(_1193));
    uint _1197 = uint(int(uint(int(_907)) >> uint(24)));
    int _1199 = int(_1197) & 1;
    bool _1201 = _1199 != 0;
    uint _1203 = uint(_1201 ? int(_1195) : int(_1191));
    float _1205 = spvSubgroupShuffle(as_type<float>(_137), 25u);
    uint _1207 = min(_1203, as_type<uint>(_1205));
    uint _1209 = uint(int(uint(int(_907)) >> uint(25)));
    int _1211 = int(_1209) & 1;
    bool _1213 = _1211 != 0;
    uint _1215 = uint(_1213 ? int(_1207) : int(_1203));
    float _1217 = spvSubgroupShuffle(as_type<float>(_137), 26u);
    uint _1219 = min(_1215, as_type<uint>(_1217));
    uint _1221 = uint(int(uint(int(_907)) >> uint(26)));
    int _1223 = int(_1221) & 1;
    bool _1225 = _1223 != 0;
    uint _1227 = uint(_1225 ? int(_1219) : int(_1215));
    float _1229 = spvSubgroupShuffle(as_type<float>(_137), 27u);
    uint _1231 = min(_1227, as_type<uint>(_1229));
    uint _1233 = uint(int(uint(int(_907)) >> uint(27)));
    int _1235 = int(_1233) & 1;
    bool _1237 = _1235 != 0;
    uint _1239 = uint(_1237 ? int(_1231) : int(_1227));
    float _1241 = spvSubgroupShuffle(as_type<float>(_137), 28u);
    uint _1243 = min(_1239, as_type<uint>(_1241));
    uint _1245 = uint(int(uint(int(_907)) >> uint(28)));
    int _1247 = int(_1245) & 1;
    bool _1249 = _1247 != 0;
    uint _1251 = uint(_1249 ? int(_1243) : int(_1239));
    float _1253 = spvSubgroupShuffle(as_type<float>(_137), 29u);
    uint _1255 = min(_1251, as_type<uint>(_1253));
    uint _1257 = uint(int(uint(int(_907)) >> uint(29)));
    int _1259 = int(_1257) & 1;
    bool _1261 = _1259 != 0;
    uint _1263 = uint(_1261 ? int(_1255) : int(_1251));
    float _1265 = spvSubgroupShuffle(as_type<float>(_137), 30u);
    uint _1267 = min(_1263, as_type<uint>(_1265));
    uint _1269 = uint(int(uint(int(_907)) >> uint(30)));
    int _1271 = int(_1269) & 1;
    bool _1273 = _1271 != 0;
    uint _1275 = uint(_1273 ? int(_1267) : int(_1263));
    float _1277 = spvSubgroupShuffle(as_type<float>(_137), 31u);
    uint _1279 = min(_1275, as_type<uint>(_1277));
    uint _1281 = uint(int(uint(int(_907)) >> uint(31)));
    int _1283 = int(_1281) & 1;
    bool _1285 = _1283 != 0;
    int _1287 = _1285 ? int(_1279) : int(_1275);
    uint _1289 = spvSubgroupBallot(true).x;
    float _1291 = spvSubgroupShuffle(as_type<float>(_137), 0u);
    int _1293 = int(_1289) & 1;
    bool _1295 = _1293 != 0;
    uint _1297 = uint(_1295 ? as_type<int>(_1291) : 0);
    float _1299 = spvSubgroupShuffle(as_type<float>(_137), 1u);
    uint _1301 = max(_1297, as_type<uint>(_1299));
    uint _1303 = uint(int(uint(int(_1289)) >> uint(1)));
    int _1305 = int(_1303) & 1;
    bool _1307 = _1305 != 0;
    uint _1309 = uint(_1307 ? int(_1301) : int(_1297));
    float _1311 = spvSubgroupShuffle(as_type<float>(_137), 2u);
    uint _1313 = max(_1309, as_type<uint>(_1311));
    uint _1315 = uint(int(uint(int(_1289)) >> uint(2)));
    int _1317 = int(_1315) & 1;
    bool _1319 = _1317 != 0;
    uint _1321 = uint(_1319 ? int(_1313) : int(_1309));
    float _1323 = spvSubgroupShuffle(as_type<float>(_137), 3u);
    uint _1325 = max(_1321, as_type<uint>(_1323));
    uint _1327 = uint(int(uint(int(_1289)) >> uint(3)));
    int _1329 = int(_1327) & 1;
    bool _1331 = _1329 != 0;
    uint _1333 = uint(_1331 ? int(_1325) : int(_1321));
    float _1335 = spvSubgroupShuffle(as_type<float>(_137), 4u);
    uint _1337 = max(_1333, as_type<uint>(_1335));
    uint _1339 = uint(int(uint(int(_1289)) >> uint(4)));
    int _1341 = int(_1339) & 1;
    bool _1343 = _1341 != 0;
    uint _1345 = uint(_1343 ? int(_1337) : int(_1333));
    float _1347 = spvSubgroupShuffle(as_type<float>(_137), 5u);
    uint _1349 = max(_1345, as_type<uint>(_1347));
    uint _1351 = uint(int(uint(int(_1289)) >> uint(5)));
    int _1353 = int(_1351) & 1;
    bool _1355 = _1353 != 0;
    uint _1357 = uint(_1355 ? int(_1349) : int(_1345));
    float _1359 = spvSubgroupShuffle(as_type<float>(_137), 6u);
    uint _1361 = max(_1357, as_type<uint>(_1359));
    uint _1363 = uint(int(uint(int(_1289)) >> uint(6)));
    int _1365 = int(_1363) & 1;
    bool _1367 = _1365 != 0;
    uint _1369 = uint(_1367 ? int(_1361) : int(_1357));
    float _1371 = spvSubgroupShuffle(as_type<float>(_137), 7u);
    uint _1373 = max(_1369, as_type<uint>(_1371));
    uint _1375 = uint(int(uint(int(_1289)) >> uint(7)));
    int _1377 = int(_1375) & 1;
    bool _1379 = _1377 != 0;
    uint _1381 = uint(_1379 ? int(_1373) : int(_1369));
    float _1383 = spvSubgroupShuffle(as_type<float>(_137), 8u);
    uint _1385 = max(_1381, as_type<uint>(_1383));
    uint _1387 = uint(int(uint(int(_1289)) >> uint(8)));
    int _1389 = int(_1387) & 1;
    bool _1391 = _1389 != 0;
    uint _1393 = uint(_1391 ? int(_1385) : int(_1381));
    float _1395 = spvSubgroupShuffle(as_type<float>(_137), 9u);
    uint _1397 = max(_1393, as_type<uint>(_1395));
    uint _1399 = uint(int(uint(int(_1289)) >> uint(9)));
    int _1401 = int(_1399) & 1;
    bool _1403 = _1401 != 0;
    uint _1405 = uint(_1403 ? int(_1397) : int(_1393));
    float _1407 = spvSubgroupShuffle(as_type<float>(_137), 10u);
    uint _1409 = max(_1405, as_type<uint>(_1407));
    uint _1411 = uint(int(uint(int(_1289)) >> uint(10)));
    int _1413 = int(_1411) & 1;
    bool _1415 = _1413 != 0;
    uint _1417 = uint(_1415 ? int(_1409) : int(_1405));
    float _1419 = spvSubgroupShuffle(as_type<float>(_137), 11u);
    uint _1421 = max(_1417, as_type<uint>(_1419));
    uint _1423 = uint(int(uint(int(_1289)) >> uint(11)));
    int _1425 = int(_1423) & 1;
    bool _1427 = _1425 != 0;
    uint _1429 = uint(_1427 ? int(_1421) : int(_1417));
    float _1431 = spvSubgroupShuffle(as_type<float>(_137), 12u);
    uint _1433 = max(_1429, as_type<uint>(_1431));
    uint _1435 = uint(int(uint(int(_1289)) >> uint(12)));
    int _1437 = int(_1435) & 1;
    bool _1439 = _1437 != 0;
    uint _1441 = uint(_1439 ? int(_1433) : int(_1429));
    float _1443 = spvSubgroupShuffle(as_type<float>(_137), 13u);
    uint _1445 = max(_1441, as_type<uint>(_1443));
    uint _1447 = uint(int(uint(int(_1289)) >> uint(13)));
    int _1449 = int(_1447) & 1;
    bool _1451 = _1449 != 0;
    uint _1453 = uint(_1451 ? int(_1445) : int(_1441));
    float _1455 = spvSubgroupShuffle(as_type<float>(_137), 14u);
    uint _1457 = max(_1453, as_type<uint>(_1455));
    uint _1459 = uint(int(uint(int(_1289)) >> uint(14)));
    int _1461 = int(_1459) & 1;
    bool _1463 = _1461 != 0;
    uint _1465 = uint(_1463 ? int(_1457) : int(_1453));
    float _1467 = spvSubgroupShuffle(as_type<float>(_137), 15u);
    uint _1469 = max(_1465, as_type<uint>(_1467));
    uint _1471 = uint(int(uint(int(_1289)) >> uint(15)));
    int _1473 = int(_1471) & 1;
    bool _1475 = _1473 != 0;
    uint _1477 = uint(_1475 ? int(_1469) : int(_1465));
    float _1479 = spvSubgroupShuffle(as_type<float>(_137), 16u);
    uint _1481 = max(_1477, as_type<uint>(_1479));
    uint _1483 = uint(int(uint(int(_1289)) >> uint(16)));
    int _1485 = int(_1483) & 1;
    bool _1487 = _1485 != 0;
    uint _1489 = uint(_1487 ? int(_1481) : int(_1477));
    float _1491 = spvSubgroupShuffle(as_type<float>(_137), 17u);
    uint _1493 = max(_1489, as_type<uint>(_1491));
    uint _1495 = uint(int(uint(int(_1289)) >> uint(17)));
    int _1497 = int(_1495) & 1;
    bool _1499 = _1497 != 0;
    uint _1501 = uint(_1499 ? int(_1493) : int(_1489));
    float _1503 = spvSubgroupShuffle(as_type<float>(_137), 18u);
    uint _1505 = max(_1501, as_type<uint>(_1503));
    uint _1507 = uint(int(uint(int(_1289)) >> uint(18)));
    int _1509 = int(_1507) & 1;
    bool _1511 = _1509 != 0;
    uint _1513 = uint(_1511 ? int(_1505) : int(_1501));
    float _1515 = spvSubgroupShuffle(as_type<float>(_137), 19u);
    uint _1517 = max(_1513, as_type<uint>(_1515));
    uint _1519 = uint(int(uint(int(_1289)) >> uint(19)));
    int _1521 = int(_1519) & 1;
    bool _1523 = _1521 != 0;
    uint _1525 = uint(_1523 ? int(_1517) : int(_1513));
    float _1527 = spvSubgroupShuffle(as_type<float>(_137), 20u);
    uint _1529 = max(_1525, as_type<uint>(_1527));
    uint _1531 = uint(int(uint(int(_1289)) >> uint(20)));
    int _1533 = int(_1531) & 1;
    bool _1535 = _1533 != 0;
    uint _1537 = uint(_1535 ? int(_1529) : int(_1525));
    float _1539 = spvSubgroupShuffle(as_type<float>(_137), 21u);
    uint _1541 = max(_1537, as_type<uint>(_1539));
    uint _1543 = uint(int(uint(int(_1289)) >> uint(21)));
    int _1545 = int(_1543) & 1;
    bool _1547 = _1545 != 0;
    uint _1549 = uint(_1547 ? int(_1541) : int(_1537));
    float _1551 = spvSubgroupShuffle(as_type<float>(_137), 22u);
    uint _1553 = max(_1549, as_type<uint>(_1551));
    uint _1555 = uint(int(uint(int(_1289)) >> uint(22)));
    int _1557 = int(_1555) & 1;
    bool _1559 = _1557 != 0;
    uint _1561 = uint(_1559 ? int(_1553) : int(_1549));
    float _1563 = spvSubgroupShuffle(as_type<float>(_137), 23u);
    uint _1565 = max(_1561, as_type<uint>(_1563));
    uint _1567 = uint(int(uint(int(_1289)) >> uint(23)));
    int _1569 = int(_1567) & 1;
    bool _1571 = _1569 != 0;
    uint _1573 = uint(_1571 ? int(_1565) : int(_1561));
    float _1575 = spvSubgroupShuffle(as_type<float>(_137), 24u);
    uint _1577 = max(_1573, as_type<uint>(_1575));
    uint _1579 = uint(int(uint(int(_1289)) >> uint(24)));
    int _1581 = int(_1579) & 1;
    bool _1583 = _1581 != 0;
    uint _1585 = uint(_1583 ? int(_1577) : int(_1573));
    float _1587 = spvSubgroupShuffle(as_type<float>(_137), 25u);
    uint _1589 = max(_1585, as_type<uint>(_1587));
    uint _1591 = uint(int(uint(int(_1289)) >> uint(25)));
    int _1593 = int(_1591) & 1;
    bool _1595 = _1593 != 0;
    uint _1597 = uint(_1595 ? int(_1589) : int(_1585));
    float _1599 = spvSubgroupShuffle(as_type<float>(_137), 26u);
    uint _1601 = max(_1597, as_type<uint>(_1599));
    uint _1603 = uint(int(uint(int(_1289)) >> uint(26)));
    int _1605 = int(_1603) & 1;
    bool _1607 = _1605 != 0;
    uint _1609 = uint(_1607 ? int(_1601) : int(_1597));
    float _1611 = spvSubgroupShuffle(as_type<float>(_137), 27u);
    uint _1613 = max(_1609, as_type<uint>(_1611));
    uint _1615 = uint(int(uint(int(_1289)) >> uint(27)));
    int _1617 = int(_1615) & 1;
    bool _1619 = _1617 != 0;
    uint _1621 = uint(_1619 ? int(_1613) : int(_1609));
    float _1623 = spvSubgroupShuffle(as_type<float>(_137), 28u);
    uint _1625 = max(_1621, as_type<uint>(_1623));
    uint _1627 = uint(int(uint(int(_1289)) >> uint(28)));
    int _1629 = int(_1627) & 1;
    bool _1631 = _1629 != 0;
    uint _1633 = uint(_1631 ? int(_1625) : int(_1621));
    float _1635 = spvSubgroupShuffle(as_type<float>(_137), 29u);
    uint _1637 = max(_1633, as_type<uint>(_1635));
    uint _1639 = uint(int(uint(int(_1289)) >> uint(29)));
    int _1641 = int(_1639) & 1;
    bool _1643 = _1641 != 0;
    uint _1645 = uint(_1643 ? int(_1637) : int(_1633));
    float _1647 = spvSubgroupShuffle(as_type<float>(_137), 30u);
    uint _1649 = max(_1645, as_type<uint>(_1647));
    uint _1651 = uint(int(uint(int(_1289)) >> uint(30)));
    int _1653 = int(_1651) & 1;
    bool _1655 = _1653 != 0;
    uint _1657 = uint(_1655 ? int(_1649) : int(_1645));
    float _1659 = spvSubgroupShuffle(as_type<float>(_137), 31u);
    uint _1661 = max(_1657, as_type<uint>(_1659));
    uint _1663 = uint(int(uint(int(_1289)) >> uint(31)));
    int _1665 = int(_1663) & 1;
    bool _1667 = _1665 != 0;
    int _1669 = _1667 ? int(_1661) : int(_1657);
    if (_523)
    {
        uint _4774 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[0], uint(_519), memory_order_relaxed);
        uint _1671 = _4774;
    }
    if (_523)
    {
        uint _4781 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[1], uint(_905), memory_order_relaxed);
        uint _1673 = _4781;
    }
    if (_523)
    {
        uint _4788 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[2], uint(_1287), memory_order_relaxed);
        uint _1675 = _4788;
    }
    if (_523)
    {
        uint _4795 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[3], uint(_1669), memory_order_relaxed);
        uint _1677 = _4795;
    }
    if (_523)
    {
        uint _4802 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[4], uint(_521), memory_order_relaxed);
        uint _1679 = _4802;
    }
}

