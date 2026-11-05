#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

#include <metal_stdlib>
#include <simd/simd.h>

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
    constant _16* cp_c3 [[id(1)]];
    texture2d<float> cp_i_tcb_48_ [[id(2)]];
    texture2d<float, access::write> cp_i_tcb_4A_ [[id(3)]];
    texture2d<float, access::write> cp_i_tcb_4C_ [[id(4)]];
    texture2d<float, access::write> cp_i_tcb_4E_ [[id(5)]];
    texture2d<float, access::write> cp_i_tcb_50_ [[id(6)]];
    texture2d<float, access::write> cp_i_tcb_52_ [[id(7)]];
    texture2d<float, access::write> cp_i_tcb_54_ [[id(8)]];
};

static inline __attribute__((always_inline))
int _55(thread const int& _4231, thread const int& _4232, constant _10& support_buffer)
{
    int _4235 = 1 + _4232;
    float _4237 = support_buffer._m5[_4235].x;
    bool _4239 = _4237 == 1.0;
    if (_4239)
    {
        return _4231;
    }
    float _4241 = float(_4231);
    float _4243 = _4241 * _4237;
    int _4245 = int(_4243);
    return _4245;
}

static inline __attribute__((always_inline))
int _57(thread const int& _4266, thread const int& _4267, thread const int& _4268, thread int& _4269, thread uint& gl_SubgroupInvocationID)
{
    int _4272 = _4268 & 31;
    uint _4274 = uint(int(uint(_4268) >> uint(8)));
    int _4276 = int(_4274) & 31;
    float _4278 = as_type<float>(gl_SubgroupInvocationID);
    int _4280 = as_type<int>(_4278) & _4276;
    int _4282 = ~_4276;
    int _4284 = _4272 & _4282;
    int _4286 = _4284 | _4280;
    int _4288 = as_type<int>(_4278) ^ _4267;
    bool _4290 = uint(_4288) <= uint(_4286);
    _4269 = _4290 ? (-1) : 0;
    float _4292 = spvSubgroupShuffle(as_type<float>(_4266), uint(_4288));
    uint _4294 = uint(_4290 ? as_type<int>(_4292) : _4266);
    return int(_4294);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    threadgroup spvUnsafeArray<uint, 1024> _24;
    float _61 = as_type<float>(gl_LocalInvocationID.x);
    float _63 = as_type<float>(gl_WorkGroupID.x);
    float _65 = as_type<float>(gl_WorkGroupID.y);
    int _67 = as_type<int>(_61) & 63;
    uint _70 = uint(int(uint(as_type<int>(_61)) >> uint(6)));
    uint _72 = uint(int(uint(_67) >> uint(3)));
    uint _74 = uint(int(uint(_67) >> uint(1)));
    uint _76 = uint(int(uint(_67) >> uint(2)));
    uint _78 = extract_bits(_72, 0u, 3u);
    uint _80 = extract_bits(_74, 0u, 2u);
    uint _82 = extract_bits(_76, 0u, 3u);
    int _84 = 3 & int(_80);
    int _86 = (-4) & int(_78);
    int _88 = _84 | _86;
    int _90 = 1 & _67;
    int _92 = (-2) & int(_82);
    int _94 = _90 | _92;
    uint _96 = uint(int(uint(as_type<int>(_61)) >> uint(7)));
    int _98 = int(_70) & 1;
    int _100 = int(_96) << 3;
    int _102 = _100 + _88;
    int _104 = _98 << 3;
    int _106 = _104 + _94;
    int _108 = _102 << 1;
    int _110 = _106 << 1;
    int _112 = as_type<int>(_65) << 6;
    int _114 = _112 + _108;
    int _116 = as_type<int>(_63) << 6;
    int _118 = _116 + _110;
    int _120 = _114 + 1;
    int _122 = _118;
    int _124 = 0;
    int _126 = _55(_122, _124, (*spvDescriptorSet0.support_buffer));
    int _128 = _114;
    int _130 = 0;
    int _132 = _55(_128, _130, (*spvDescriptorSet0.support_buffer));
    float4 _135 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_126, _132))).xyzw);
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _135.w;
    int _145 = _118 + 1;
    int _147 = _118;
    int _149 = 0;
    int _151 = _55(_147, _149, (*spvDescriptorSet0.support_buffer));
    int _153 = _120;
    int _155 = 0;
    int _157 = _55(_153, _155, (*spvDescriptorSet0.support_buffer));
    float4 _159 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_151, _157))).xyzw);
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = _159.z;
    float _167 = _159.w;
    int _169 = _145;
    int _171 = 0;
    int _173 = _55(_169, _171, (*spvDescriptorSet0.support_buffer));
    int _175 = _114;
    int _177 = 0;
    int _179 = _55(_175, _177, (*spvDescriptorSet0.support_buffer));
    float4 _181 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_173, _179))).xyzw);
    float _183 = _181.x;
    float _185 = _181.y;
    float _187 = _181.z;
    float _189 = _181.w;
    int _191 = _145;
    int _193 = 0;
    int _195 = _55(_191, _193, (*spvDescriptorSet0.support_buffer));
    int _197 = _120;
    int _199 = 0;
    int _201 = _55(_197, _199, (*spvDescriptorSet0.support_buffer));
    float4 _203 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_195, _201))).xyzw);
    float _205 = _203.x;
    float _207 = _203.y;
    float _209 = _203.z;
    float _211 = _203.w;
    int _213 = _118 + 32;
    int _215 = as_type<int>(_63) << 5;
    int _217 = _215 + _106;
    int _219 = as_type<int>(_65) << 5;
    int _221 = _219 + _102;
    int _223 = _118 + 33;
    float _225 = _137 + _161;
    float _227 = _139 + _163;
    float _229 = _141 + _165;
    float _231 = _143 + _167;
    float _233 = _183 + _225;
    float _235 = _185 + _227;
    float _237 = _187 + _229;
    float _239 = _189 + _231;
    float _241 = _205 + _233;
    float _243 = _207 + _235;
    float _245 = _209 + _237;
    float _247 = _211 + _239;
    float _249 = _241 * 0.25;
    float _251 = _243 * 0.25;
    float _253 = _245 * 0.25;
    float _255 = _247 * 0.25;
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_249, _251, _253, _255), uint2(int2(_217, _221)));
    int _257 = _213;
    int _259 = 0;
    int _261 = _55(_257, _259, (*spvDescriptorSet0.support_buffer));
    int _263 = _120;
    int _265 = 0;
    int _267 = _55(_263, _265, (*spvDescriptorSet0.support_buffer));
    float4 _269 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_261, _267))).xyzw);
    float _271 = _269.x;
    float _273 = _269.y;
    float _275 = _269.z;
    float _277 = _269.w;
    int _279 = _213;
    int _281 = 0;
    int _283 = _55(_279, _281, (*spvDescriptorSet0.support_buffer));
    int _285 = _114;
    int _287 = 0;
    int _289 = _55(_285, _287, (*spvDescriptorSet0.support_buffer));
    float4 _291 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_283, _289))).xyzw);
    float _293 = _291.x;
    float _295 = _291.y;
    float _297 = _291.z;
    float _299 = _291.w;
    int _301 = _223;
    int _303 = 0;
    int _305 = _55(_301, _303, (*spvDescriptorSet0.support_buffer));
    int _307 = _114;
    int _309 = 0;
    int _311 = _55(_307, _309, (*spvDescriptorSet0.support_buffer));
    float4 _313 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_305, _311))).xyzw);
    float _315 = _313.x;
    float _317 = _313.y;
    float _319 = _313.z;
    float _321 = _313.w;
    int _323 = _223;
    int _325 = 0;
    int _327 = _55(_323, _325, (*spvDescriptorSet0.support_buffer));
    int _329 = _120;
    int _331 = 0;
    int _333 = _55(_329, _331, (*spvDescriptorSet0.support_buffer));
    float4 _335 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_327, _333))).xyzw);
    float _337 = _335.x;
    float _339 = _335.y;
    float _341 = _335.z;
    float _343 = _335.w;
    int _345 = _217 + 16;
    float _347 = _293 + _271;
    float _349 = _295 + _273;
    float _351 = _297 + _275;
    float _353 = _299 + _277;
    float _355 = _315 + _347;
    float _357 = _317 + _349;
    float _359 = _319 + _351;
    float _361 = _321 + _353;
    float _363 = _337 + _355;
    float _365 = _339 + _357;
    float _367 = _341 + _359;
    float _369 = _343 + _361;
    float _371 = _363 * 0.25;
    float _373 = _365 * 0.25;
    float _375 = _367 * 0.25;
    float _377 = _369 * 0.25;
    int _379 = _114 + 32;
    int _381 = _114 + 33;
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_371, _373, _375, _377), uint2(int2(_345, _221)));
    int _383 = _118;
    int _385 = 0;
    int _387 = _55(_383, _385, (*spvDescriptorSet0.support_buffer));
    int _389 = _379;
    int _391 = 0;
    int _393 = _55(_389, _391, (*spvDescriptorSet0.support_buffer));
    float4 _395 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_387, _393))).xyzw);
    float _397 = _395.x;
    float _399 = _395.y;
    float _401 = _395.z;
    float _403 = _395.w;
    int _405 = _118;
    int _407 = 0;
    int _409 = _55(_405, _407, (*spvDescriptorSet0.support_buffer));
    int _411 = _381;
    int _413 = 0;
    int _415 = _55(_411, _413, (*spvDescriptorSet0.support_buffer));
    float4 _417 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_409, _415))).xyzw);
    float _419 = _417.x;
    float _421 = _417.y;
    float _423 = _417.z;
    float _425 = _417.w;
    int _427 = _145;
    int _429 = 0;
    int _431 = _55(_427, _429, (*spvDescriptorSet0.support_buffer));
    int _433 = _379;
    int _435 = 0;
    int _437 = _55(_433, _435, (*spvDescriptorSet0.support_buffer));
    float4 _439 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_431, _437))).xyzw);
    float _441 = _439.x;
    float _443 = _439.y;
    float _445 = _439.z;
    float _447 = _439.w;
    int _449 = _145;
    int _451 = 0;
    int _453 = _55(_449, _451, (*spvDescriptorSet0.support_buffer));
    int _455 = _381;
    int _457 = 0;
    int _459 = _55(_455, _457, (*spvDescriptorSet0.support_buffer));
    float4 _461 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_453, _459))).xyzw);
    float _463 = _461.x;
    float _465 = _461.y;
    float _467 = _461.z;
    float _469 = _461.w;
    int _471 = _221 + 16;
    float _473 = _397 + _419;
    float _475 = _399 + _421;
    float _477 = _401 + _423;
    float _479 = _403 + _425;
    float _481 = _441 + _473;
    float _483 = _443 + _475;
    float _485 = _445 + _477;
    float _487 = _447 + _479;
    float _489 = _463 + _481;
    float _491 = _465 + _483;
    float _493 = _467 + _485;
    float _495 = _469 + _487;
    float _497 = _489 * 0.25;
    float _499 = _491 * 0.25;
    float _501 = _493 * 0.25;
    float _503 = _495 * 0.25;
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_497, _499, _501, _503), uint2(int2(_217, _471)));
    int _505 = _213;
    int _507 = 0;
    int _509 = _55(_505, _507, (*spvDescriptorSet0.support_buffer));
    int _511 = _379;
    int _513 = 0;
    int _515 = _55(_511, _513, (*spvDescriptorSet0.support_buffer));
    float4 _517 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_509, _515))).xyzw);
    float _519 = _517.x;
    float _521 = _517.y;
    float _523 = _517.z;
    float _525 = _517.w;
    int _527 = _213;
    int _529 = 0;
    int _531 = _55(_527, _529, (*spvDescriptorSet0.support_buffer));
    int _533 = _381;
    int _535 = 0;
    int _537 = _55(_533, _535, (*spvDescriptorSet0.support_buffer));
    float4 _539 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_531, _537))).xyzw);
    float _541 = _539.x;
    float _543 = _539.y;
    float _545 = _539.z;
    float _547 = _539.w;
    int _549 = _223;
    int _551 = 0;
    int _553 = _55(_549, _551, (*spvDescriptorSet0.support_buffer));
    int _555 = _379;
    int _557 = 0;
    int _559 = _55(_555, _557, (*spvDescriptorSet0.support_buffer));
    float4 _561 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_553, _559))).xyzw);
    float _563 = _561.x;
    float _565 = _561.y;
    float _567 = _561.z;
    float _569 = _561.w;
    int _571 = _223;
    int _573 = 0;
    int _575 = _55(_571, _573, (*spvDescriptorSet0.support_buffer));
    int _577 = _381;
    int _579 = 0;
    int _581 = _55(_577, _579, (*spvDescriptorSet0.support_buffer));
    float4 _583 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_575, _581))).xyzw);
    float _585 = _583.x;
    float _587 = _583.y;
    float _589 = _583.z;
    float _591 = _583.w;
    float _593 = _519 + _541;
    float _595 = _521 + _543;
    float _597 = _523 + _545;
    float _599 = _525 + _547;
    float _601 = _563 + _593;
    float _603 = _565 + _595;
    float _605 = _567 + _597;
    float _607 = _569 + _599;
    float _609 = _585 + _601;
    float _611 = _587 + _603;
    float _613 = _589 + _605;
    float _615 = _591 + _607;
    float _617 = _609 * 0.25;
    float _619 = _611 * 0.25;
    float _621 = _613 * 0.25;
    float _623 = _615 * 0.25;
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_617, _619, _621, _623), uint2(int2(_345, _471)));
    bool _627 = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x) >= 2u;
    bool _629 = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x) >= 3u;
    bool _631 = !_627;
    if (!_631)
    {
        int _633 = as_type<int>(_251);
        int _635 = 1;
        int _637 = 7199;
        int _639;
        int _2559 = _57(_633, _635, _637, _639, gl_SubgroupInvocationID);
        int _641 = _2559;
        int _643 = as_type<int>(_61) & 3;
        bool _645 = _643 != 0;
        int _647 = as_type<int>(_253);
        int _649 = 1;
        int _651 = 7199;
        int _653;
        int _2567 = _57(_647, _649, _651, _653, gl_SubgroupInvocationID);
        int _655 = _2567;
        int _657 = as_type<int>(_371);
        int _659 = 1;
        int _661 = 7199;
        int _663;
        int _2570 = _57(_657, _659, _661, _663, gl_SubgroupInvocationID);
        int _665 = _2570;
        int _667 = as_type<int>(_253);
        int _669 = 2;
        int _671 = 7199;
        int _673;
        int _2573 = _57(_667, _669, _671, _673, gl_SubgroupInvocationID);
        int _675 = _2573;
        int _677 = as_type<int>(_371);
        int _679 = 2;
        int _681 = 7199;
        int _683;
        int _2576 = _57(_677, _679, _681, _683, gl_SubgroupInvocationID);
        int _685 = _2576;
        int _687 = as_type<int>(_251);
        int _689 = 2;
        int _691 = 7199;
        int _693;
        int _2579 = _57(_687, _689, _691, _693, gl_SubgroupInvocationID);
        int _695 = _2579;
        int _697 = as_type<int>(_249);
        int _699 = 1;
        int _701 = 7199;
        int _703;
        int _2582 = _57(_697, _699, _701, _703, gl_SubgroupInvocationID);
        int _705 = _2582;
        float _707 = _251 + as_type<float>(_641);
        int _709 = as_type<int>(_249);
        int _711 = 2;
        int _713 = 7199;
        int _715;
        int _2589 = _57(_709, _711, _713, _715, gl_SubgroupInvocationID);
        int _717 = _2589;
        float _719 = _253 + as_type<float>(_655);
        int _721 = as_type<int>(_255);
        int _723 = 1;
        int _725 = 7199;
        int _727;
        int _2596 = _57(_721, _723, _725, _727, gl_SubgroupInvocationID);
        int _729 = _2596;
        float _731 = _371 + as_type<float>(_665);
        int _733 = as_type<int>(_255);
        int _735 = 2;
        int _737 = 7199;
        int _739;
        int _2603 = _57(_733, _735, _737, _739, gl_SubgroupInvocationID);
        int _741 = _2603;
        float _743 = as_type<float>(_675) + _719;
        int _745 = as_type<int>(_251);
        int _747 = 3;
        int _749 = 7199;
        int _751;
        int _2610 = _57(_745, _747, _749, _751, gl_SubgroupInvocationID);
        int _753 = _2610;
        float _755 = as_type<float>(_685) + _731;
        int _757 = as_type<int>(_373);
        int _759 = 1;
        int _761 = 7199;
        int _763;
        int _2617 = _57(_757, _759, _761, _763, gl_SubgroupInvocationID);
        int _765 = _2617;
        float _767 = as_type<float>(_695) + _707;
        int _769 = as_type<int>(_253);
        int _771 = 3;
        int _773 = 7199;
        int _775;
        int _2624 = _57(_769, _771, _773, _775, gl_SubgroupInvocationID);
        int _777 = _2624;
        float _779 = _249 + as_type<float>(_705);
        int _781 = as_type<int>(_249);
        int _783 = 3;
        int _785 = 7199;
        int _787;
        int _2631 = _57(_781, _783, _785, _787, gl_SubgroupInvocationID);
        int _789 = _2631;
        float _791 = as_type<float>(_717) + _779;
        int _793 = as_type<int>(_255);
        int _795 = 3;
        int _797 = 7199;
        int _799;
        int _2638 = _57(_793, _795, _797, _799, gl_SubgroupInvocationID);
        int _801 = _2638;
        float _803 = _255 + as_type<float>(_729);
        int _805 = as_type<int>(_375);
        int _807 = 1;
        int _809 = 7199;
        int _811;
        int _2645 = _57(_805, _807, _809, _811, gl_SubgroupInvocationID);
        int _813 = _2645;
        float _815 = as_type<float>(_741) + _803;
        int _817 = as_type<int>(_371);
        int _819 = 3;
        int _821 = 7199;
        int _823;
        int _2652 = _57(_817, _819, _821, _823, gl_SubgroupInvocationID);
        int _825 = _2652;
        float _827 = as_type<float>(_753) + _767;
        int _829 = as_type<int>(_375);
        int _831 = 2;
        int _833 = 7199;
        int _835;
        int _2659 = _57(_829, _831, _833, _835, gl_SubgroupInvocationID);
        int _837 = _2659;
        float _839 = _373 + as_type<float>(_765);
        int _841 = as_type<int>(_377);
        int _843 = 1;
        int _845 = 7199;
        int _847;
        int _2666 = _57(_841, _843, _845, _847, gl_SubgroupInvocationID);
        int _849 = _2666;
        float _851 = as_type<float>(_777) + _743;
        int _853 = as_type<int>(_373);
        int _855 = 2;
        int _857 = 7199;
        int _859;
        int _2673 = _57(_853, _855, _857, _859, gl_SubgroupInvocationID);
        int _861 = _2673;
        float _863 = as_type<float>(_789) + _791;
        int _865 = as_type<int>(_497);
        int _867 = 1;
        int _869 = 7199;
        int _871;
        int _2680 = _57(_865, _867, _869, _871, gl_SubgroupInvocationID);
        int _873 = _2680;
        float _875 = as_type<float>(_801) + _815;
        int _877 = as_type<int>(_373);
        int _879 = 3;
        int _881 = 7199;
        int _883;
        int _2687 = _57(_877, _879, _881, _883, gl_SubgroupInvocationID);
        int _885 = _2687;
        float _887 = _375 + as_type<float>(_813);
        int _889 = as_type<int>(_377);
        int _891 = 2;
        int _893 = 7199;
        int _895;
        int _2694 = _57(_889, _891, _893, _895, gl_SubgroupInvocationID);
        int _897 = _2694;
        float _899 = as_type<float>(_825) + _755;
        int _901 = as_type<int>(_499);
        int _903 = 1;
        int _905 = 7199;
        int _907;
        int _2701 = _57(_901, _903, _905, _907, gl_SubgroupInvocationID);
        int _909 = _2701;
        float _911 = as_type<float>(_837) + _887;
        int _913 = as_type<int>(_501);
        int _915 = 1;
        int _917 = 7199;
        int _919;
        int _2708 = _57(_913, _915, _917, _919, gl_SubgroupInvocationID);
        int _921 = _2708;
        float _923 = _377 + as_type<float>(_849);
        int _925 = as_type<int>(_499);
        int _927 = 2;
        int _929 = 7199;
        int _931;
        int _2715 = _57(_925, _927, _929, _931, gl_SubgroupInvocationID);
        int _933 = _2715;
        float _935 = as_type<float>(_861) + _839;
        int _937 = as_type<int>(_503);
        int _939 = 1;
        int _941 = 7199;
        int _943;
        int _2722 = _57(_937, _939, _941, _943, gl_SubgroupInvocationID);
        int _945 = _2722;
        float _947 = _497 + as_type<float>(_873);
        int _949 = as_type<int>(_501);
        int _951 = 2;
        int _953 = 7199;
        int _955;
        int _2729 = _57(_949, _951, _953, _955, gl_SubgroupInvocationID);
        int _957 = _2729;
        float _959 = as_type<float>(_885) + _935;
        int _961 = as_type<int>(_503);
        int _963 = 2;
        int _965 = 7199;
        int _967;
        int _2736 = _57(_961, _963, _965, _967, gl_SubgroupInvocationID);
        int _969 = _2736;
        float _971 = as_type<float>(_897) + _923;
        int _973 = as_type<int>(_375);
        int _975 = 3;
        int _977 = 7199;
        int _979;
        int _2743 = _57(_973, _975, _977, _979, gl_SubgroupInvocationID);
        int _981 = _2743;
        float _983 = _499 + as_type<float>(_909);
        int _985 = as_type<int>(_619);
        int _987 = 1;
        int _989 = 7199;
        int _991;
        int _2750 = _57(_985, _987, _989, _991, gl_SubgroupInvocationID);
        int _993 = _2750;
        float _995 = _501 + as_type<float>(_921);
        int _997 = as_type<int>(_497);
        int _999 = 2;
        int _1001 = 7199;
        int _1003;
        int _2757 = _57(_997, _999, _1001, _1003, gl_SubgroupInvocationID);
        int _1005 = _2757;
        float _1007 = as_type<float>(_933) + _983;
        int _1009 = as_type<int>(_621);
        int _1011 = 1;
        int _1013 = 7199;
        int _1015;
        int _2764 = _57(_1009, _1011, _1013, _1015, gl_SubgroupInvocationID);
        int _1017 = _2764;
        float _1019 = _503 + as_type<float>(_945);
        int _1021 = as_type<int>(_617);
        int _1023 = 1;
        int _1025 = 7199;
        int _1027;
        int _2771 = _57(_1021, _1023, _1025, _1027, gl_SubgroupInvocationID);
        int _1029 = _2771;
        float _1031 = as_type<float>(_957) + _995;
        int _1033 = as_type<int>(_619);
        int _1035 = 2;
        int _1037 = 7199;
        int _1039;
        int _2778 = _57(_1033, _1035, _1037, _1039, gl_SubgroupInvocationID);
        int _1041 = _2778;
        float _1043 = as_type<float>(_969) + _1019;
        int _1045 = as_type<int>(_617);
        int _1047 = 2;
        int _1049 = 7199;
        int _1051;
        int _2785 = _57(_1045, _1047, _1049, _1051, gl_SubgroupInvocationID);
        int _1053 = _2785;
        float _1055 = as_type<float>(_981) + _911;
        int _1057 = as_type<int>(_621);
        int _1059 = 2;
        int _1061 = 7199;
        int _1063;
        int _2792 = _57(_1057, _1059, _1061, _1063, gl_SubgroupInvocationID);
        int _1065 = _2792;
        float _1067 = _619 + as_type<float>(_993);
        float _1069 = as_type<float>(_1005) + _947;
        int _1071 = as_type<int>(_377);
        int _1073 = 3;
        int _1075 = 7199;
        int _1077;
        int _2803 = _57(_1071, _1073, _1075, _1077, gl_SubgroupInvocationID);
        int _1079 = _2803;
        float _1081 = _621 + as_type<float>(_1017);
        int _1083 = as_type<int>(_497);
        int _1085 = 3;
        int _1087 = 7199;
        int _1089;
        int _2810 = _57(_1083, _1085, _1087, _1089, gl_SubgroupInvocationID);
        int _1091 = _2810;
        float _1093 = _617 + as_type<float>(_1029);
        int _1095 = as_type<int>(_499);
        int _1097 = 3;
        int _1099 = 7199;
        int _1101;
        int _2817 = _57(_1095, _1097, _1099, _1101, gl_SubgroupInvocationID);
        int _1103 = _2817;
        float _1105 = as_type<float>(_1041) + _1067;
        int _1107 = as_type<int>(_617);
        int _1109 = 3;
        int _1111 = 7199;
        int _1113;
        int _2824 = _57(_1107, _1109, _1111, _1113, gl_SubgroupInvocationID);
        int _1115 = _2824;
        float _1117 = as_type<float>(_1053) + _1093;
        int _1119 = as_type<int>(_623);
        int _1121 = 1;
        int _1123 = 7199;
        int _1125;
        int _2831 = _57(_1119, _1121, _1123, _1125, gl_SubgroupInvocationID);
        int _1127 = _2831;
        float _1129 = as_type<float>(_1065) + _1081;
        int _1131 = as_type<int>(_623);
        int _1133 = 2;
        int _1135 = 7199;
        int _1137;
        int _2838 = _57(_1131, _1133, _1135, _1137, gl_SubgroupInvocationID);
        int _1139 = _2838;
        int _1141 = as_type<int>(_501);
        int _1143 = 3;
        int _1145 = 7199;
        int _1147;
        int _2841 = _57(_1141, _1143, _1145, _1147, gl_SubgroupInvocationID);
        int _1149 = _2841;
        float _1151 = as_type<float>(_1079) + _971;
        int _1153 = as_type<int>(_503);
        int _1155 = 3;
        int _1157 = 7199;
        int _1159;
        int _2848 = _57(_1153, _1155, _1157, _1159, gl_SubgroupInvocationID);
        int _1161 = _2848;
        float _1163 = as_type<float>(_1091) + _1069;
        int _1165 = as_type<int>(_619);
        int _1167 = 3;
        int _1169 = 7199;
        int _1171;
        int _2855 = _57(_1165, _1167, _1169, _1171, gl_SubgroupInvocationID);
        int _1173 = _2855;
        float _1175 = as_type<float>(_1103) + _1007;
        int _1177 = as_type<int>(_621);
        int _1179 = 3;
        int _1181 = 7199;
        int _1183;
        int _2862 = _57(_1177, _1179, _1181, _1183, gl_SubgroupInvocationID);
        int _1185 = _2862;
        float _1187 = as_type<float>(_1115) + _1117;
        int _1189 = as_type<int>(_623);
        int _1191 = 3;
        int _1193 = 7199;
        int _1195;
        int _2869 = _57(_1189, _1191, _1193, _1195, gl_SubgroupInvocationID);
        int _1197 = _2869;
        float _1199 = _623 + as_type<float>(_1127);
        float _1201 = as_type<float>(_1139) + _1199;
        float _1203 = as_type<float>(_1149) + _1031;
        float _1205 = as_type<float>(_1161) + _1043;
        float _1207 = as_type<float>(_1173) + _1105;
        float _1209 = as_type<float>(_1185) + _1129;
        float _1211 = as_type<float>(_1197) + _1201;
        if (!_645)
        {
            uint _1213 = uint(int(uint(_106) >> uint(1)));
            float _1215 = _1055 * 0.25;
            uint _1217 = uint(int(uint(_102) >> uint(1)));
            float _1219 = _1163 * 0.25;
            int _1221 = as_type<int>(_63) << 4;
            int _1223 = _1221 + int(_1213);
            float _1225 = _959 * 0.25;
            int _1227 = as_type<int>(_65) << 4;
            int _1229 = _1227 + int(_1217);
            float _1231 = _827 * 0.25;
            float _1233 = _1175 * 0.25;
            int _1235 = _1223 + 8;
            float _1237 = _863 * 0.25;
            int _1239 = _1229 + 8;
            float _1241 = _851 * 0.25;
            float _1243 = _875 * 0.25;
            float _1245 = _899 * 0.25;
            float _1247 = _1151 * 0.25;
            float _1249 = _1203 * 0.25;
            float _1251 = _1205 * 0.25;
            float _1253 = _1187 * 0.25;
            float _1255 = _1207 * 0.25;
            float _1257 = _1209 * 0.25;
            float _1259 = _1211 * 0.25;
            spvDescriptorSet0.cp_i_tcb_4C_.write(float4(_1237, _1231, _1241, _1243), uint2(int2(_1223, _1229)));
            spvDescriptorSet0.cp_i_tcb_4C_.write(float4(_1245, _1225, _1215, _1247), uint2(int2(_1235, _1229)));
            spvDescriptorSet0.cp_i_tcb_4C_.write(float4(_1219, _1233, _1249, _1251), uint2(int2(_1223, _1239)));
            int _1261 = int(_1213) << 4;
            int _1263 = _1261 + int(_1217);
            spvDescriptorSet0.cp_i_tcb_4C_.write(float4(_1253, _1255, _1257, _1259), uint2(int2(_1235, _1239)));
            int _1265 = _1263 << 4;
            uint _1267 = uint(int(uint(_1265) >> uint(2)));
            _24[int(_1267)] = as_type<uint>(_1237);
            int _1269 = _1265 + 4;
            uint _1271 = uint(int(uint(_1269) >> uint(2)));
            _24[int(_1271)] = as_type<uint>(_1231);
            int _1273 = _1265 + 8;
            uint _1275 = uint(int(uint(_1273) >> uint(2)));
            _24[int(_1275)] = as_type<uint>(_1241);
            int _1277 = _1265 + 12;
            uint _1279 = uint(int(uint(_1277) >> uint(2)));
            _24[int(_1279)] = as_type<uint>(_1243);
            int _1281 = _1263 << 4;
            int _1283 = _1281 + 2048;
            uint _1285 = uint(int(uint(_1283) >> uint(2)));
            _24[int(_1285)] = as_type<uint>(_1245);
            int _1287 = _1281 + 2052;
            uint _1289 = uint(int(uint(_1287) >> uint(2)));
            _24[int(_1289)] = as_type<uint>(_1225);
            int _1291 = _1281 + 2056;
            uint _1293 = uint(int(uint(_1291) >> uint(2)));
            _24[int(_1293)] = as_type<uint>(_1215);
            int _1295 = _1281 + 2060;
            uint _1297 = uint(int(uint(_1295) >> uint(2)));
            _24[int(_1297)] = as_type<uint>(_1247);
            int _1299 = _1263 << 4;
            int _1301 = _1299 + 128;
            uint _1303 = uint(int(uint(_1301) >> uint(2)));
            _24[int(_1303)] = as_type<uint>(_1219);
            int _1305 = _1299 + 132;
            uint _1307 = uint(int(uint(_1305) >> uint(2)));
            _24[int(_1307)] = as_type<uint>(_1233);
            int _1309 = _1299 + 136;
            uint _1311 = uint(int(uint(_1309) >> uint(2)));
            _24[int(_1311)] = as_type<uint>(_1249);
            int _1313 = _1299 + 140;
            uint _1315 = uint(int(uint(_1313) >> uint(2)));
            _24[int(_1315)] = as_type<uint>(_1251);
            int _1317 = _1263 << 4;
            int _1319 = _1317 + 2176;
            uint _1321 = uint(int(uint(_1319) >> uint(2)));
            _24[int(_1321)] = as_type<uint>(_1253);
            int _1323 = _1317 + 2180;
            uint _1325 = uint(int(uint(_1323) >> uint(2)));
            _24[int(_1325)] = as_type<uint>(_1255);
            int _1327 = _1317 + 2184;
            uint _1329 = uint(int(uint(_1327) >> uint(2)));
            _24[int(_1329)] = as_type<uint>(_1257);
            int _1331 = _1317 + 2188;
            uint _1333 = uint(int(uint(_1331) >> uint(2)));
            _24[int(_1333)] = as_type<uint>(_1259);
        }
    }
    if (!_629)
    {
        return;
    }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    bool _1335 = as_type<uint>(_61) >= 64u;
    bool _1337 = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x) >= 4u;
    if (!_1335)
    {
        int _1339 = _102 << 5;
        int _1341 = _106 << 9;
        int _1343 = _1341 + _1339;
        uint _1345 = uint(int(uint(_1343) >> uint(2)));
        float _1347 = as_type<float>(_24[int(_1345)]);
        int _1349 = _1343 + 4;
        uint _1351 = uint(int(uint(_1349) >> uint(2)));
        float _1353 = as_type<float>(_24[int(_1351)]);
        int _1355 = _1343 + 8;
        uint _1357 = uint(int(uint(_1355) >> uint(2)));
        float _1359 = as_type<float>(_24[int(_1357)]);
        int _1361 = _1343 + 12;
        uint _1363 = uint(int(uint(_1361) >> uint(2)));
        float _1365 = as_type<float>(_24[int(_1363)]);
        int _1367 = _1343 + 256;
        uint _1369 = uint(int(uint(_1367) >> uint(2)));
        float _1371 = as_type<float>(_24[int(_1369)]);
        int _1373 = _1343 + 260;
        uint _1375 = uint(int(uint(_1373) >> uint(2)));
        float _1377 = as_type<float>(_24[int(_1375)]);
        int _1379 = _1343 + 264;
        uint _1381 = uint(int(uint(_1379) >> uint(2)));
        float _1383 = as_type<float>(_24[int(_1381)]);
        int _1385 = _1343 + 268;
        uint _1387 = uint(int(uint(_1385) >> uint(2)));
        float _1389 = as_type<float>(_24[int(_1387)]);
        int _1391 = _1343 + 16;
        uint _1393 = uint(int(uint(_1391) >> uint(2)));
        float _1395 = as_type<float>(_24[int(_1393)]);
        int _1397 = _1343 + 20;
        uint _1399 = uint(int(uint(_1397) >> uint(2)));
        float _1401 = as_type<float>(_24[int(_1399)]);
        int _1403 = _1343 + 24;
        uint _1405 = uint(int(uint(_1403) >> uint(2)));
        float _1407 = as_type<float>(_24[int(_1405)]);
        int _1409 = _1343 + 28;
        uint _1411 = uint(int(uint(_1409) >> uint(2)));
        float _1413 = as_type<float>(_24[int(_1411)]);
        int _1415 = _1343 + 272;
        uint _1417 = uint(int(uint(_1415) >> uint(2)));
        float _1419 = as_type<float>(_24[int(_1417)]);
        int _1421 = _1343 + 276;
        uint _1423 = uint(int(uint(_1421) >> uint(2)));
        float _1425 = as_type<float>(_24[int(_1423)]);
        int _1427 = _1343 + 280;
        uint _1429 = uint(int(uint(_1427) >> uint(2)));
        float _1431 = as_type<float>(_24[int(_1429)]);
        int _1433 = _1343 + 284;
        uint _1435 = uint(int(uint(_1433) >> uint(2)));
        float _1437 = as_type<float>(_24[int(_1435)]);
        float _1439 = _1347 + _1371;
        float _1441 = _1353 + _1377;
        float _1443 = _1359 + _1383;
        float _1445 = _1365 + _1389;
        float _1447 = _1395 + _1439;
        float _1449 = _1401 + _1441;
        float _1451 = _1407 + _1443;
        float _1453 = _1413 + _1445;
        float _1455 = _1419 + _1447;
        float _1457 = _1425 + _1449;
        float _1459 = _1431 + _1451;
        float _1461 = _1437 + _1453;
        int _1463 = as_type<int>(_63) << 3;
        int _1465 = _1463 + _106;
        float _1467 = _1455 * 0.25;
        int _1469 = as_type<int>(_65) << 3;
        int _1471 = _1469 + _102;
        float _1473 = _1457 * 0.25;
        float _1475 = _1459 * 0.25;
        float _1477 = _1461 * 0.25;
        int _1479 = _102 & 1;
        spvDescriptorSet0.cp_i_tcb_4E_.write(float4(_1467, _1473, _1475, _1477), uint2(int2(_1465, _1471)));
        int _1481 = _110 + _1479;
        int _1483 = _1481 << 8;
        int _1485 = _1483 + _1339;
        uint _1487 = uint(int(uint(_1485) >> uint(2)));
        _24[int(_1487)] = as_type<uint>(_1467);
        int _1489 = _1485 + 4;
        uint _1491 = uint(int(uint(_1489) >> uint(2)));
        _24[int(_1491)] = as_type<uint>(_1473);
        int _1493 = _1485 + 8;
        uint _1495 = uint(int(uint(_1493) >> uint(2)));
        _24[int(_1495)] = as_type<uint>(_1475);
        int _1497 = _1485 + 12;
        uint _1499 = uint(int(uint(_1497) >> uint(2)));
        _24[int(_1499)] = as_type<uint>(_1477);
    }
    if (!_1337)
    {
        return;
    }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    bool _1501 = as_type<uint>(_61) >= 16u;
    bool _1503 = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x) >= 5u;
    if (!_1501)
    {
        int _1505 = _102 << 6;
        int _1507 = _106 << 10;
        int _1509 = _1507 + _1505;
        uint _1511 = uint(int(uint(_1509) >> uint(2)));
        float _1513 = as_type<float>(_24[int(_1511)]);
        int _1515 = _1509 + 4;
        uint _1517 = uint(int(uint(_1515) >> uint(2)));
        float _1519 = as_type<float>(_24[int(_1517)]);
        int _1521 = _1509 + 8;
        uint _1523 = uint(int(uint(_1521) >> uint(2)));
        float _1525 = as_type<float>(_24[int(_1523)]);
        int _1527 = _1509 + 12;
        uint _1529 = uint(int(uint(_1527) >> uint(2)));
        float _1531 = as_type<float>(_24[int(_1529)]);
        int _1533 = _1509 + 512;
        uint _1535 = uint(int(uint(_1533) >> uint(2)));
        float _1537 = as_type<float>(_24[int(_1535)]);
        int _1539 = _1509 + 516;
        uint _1541 = uint(int(uint(_1539) >> uint(2)));
        float _1543 = as_type<float>(_24[int(_1541)]);
        int _1545 = _1509 + 520;
        uint _1547 = uint(int(uint(_1545) >> uint(2)));
        float _1549 = as_type<float>(_24[int(_1547)]);
        int _1551 = _1509 + 524;
        uint _1553 = uint(int(uint(_1551) >> uint(2)));
        float _1555 = as_type<float>(_24[int(_1553)]);
        int _1557 = _1509 + 288;
        uint _1559 = uint(int(uint(_1557) >> uint(2)));
        float _1561 = as_type<float>(_24[int(_1559)]);
        int _1563 = _1509 + 292;
        uint _1565 = uint(int(uint(_1563) >> uint(2)));
        float _1567 = as_type<float>(_24[int(_1565)]);
        int _1569 = _1509 + 296;
        uint _1571 = uint(int(uint(_1569) >> uint(2)));
        float _1573 = as_type<float>(_24[int(_1571)]);
        int _1575 = _1509 + 300;
        uint _1577 = uint(int(uint(_1575) >> uint(2)));
        float _1579 = as_type<float>(_24[int(_1577)]);
        int _1581 = _1509 + 800;
        uint _1583 = uint(int(uint(_1581) >> uint(2)));
        float _1585 = as_type<float>(_24[int(_1583)]);
        int _1587 = _1509 + 804;
        uint _1589 = uint(int(uint(_1587) >> uint(2)));
        float _1591 = as_type<float>(_24[int(_1589)]);
        int _1593 = _1509 + 808;
        uint _1595 = uint(int(uint(_1593) >> uint(2)));
        float _1597 = as_type<float>(_24[int(_1595)]);
        int _1599 = _1509 + 812;
        uint _1601 = uint(int(uint(_1599) >> uint(2)));
        float _1603 = as_type<float>(_24[int(_1601)]);
        int _1605 = _106 << 2;
        int _1607 = _1605 + _102;
        int _1609 = _1607 << 8;
        int _1611 = _1609 + _1505;
        float _1613 = _1513 + _1537;
        float _1615 = _1519 + _1543;
        float _1617 = _1525 + _1549;
        float _1619 = _1531 + _1555;
        float _1621 = _1561 + _1613;
        float _1623 = _1567 + _1615;
        float _1625 = _1573 + _1617;
        float _1627 = _1579 + _1619;
        float _1629 = _1585 + _1621;
        float _1631 = _1591 + _1623;
        float _1633 = _1597 + _1625;
        float _1635 = _1603 + _1627;
        int _1637 = as_type<int>(_63) << 2;
        int _1639 = _1637 + _106;
        float _1641 = _1629 * 0.25;
        int _1643 = as_type<int>(_65) << 2;
        int _1645 = _1643 + _102;
        float _1647 = _1631 * 0.25;
        float _1649 = _1633 * 0.25;
        float _1651 = _1635 * 0.25;
        spvDescriptorSet0.cp_i_tcb_50_.write(float4(_1641, _1647, _1649, _1651), uint2(int2(_1639, _1645)));
        uint _1653 = uint(int(uint(_1611) >> uint(2)));
        _24[int(_1653)] = as_type<uint>(_1641);
        int _1655 = _1611 + 4;
        uint _1657 = uint(int(uint(_1655) >> uint(2)));
        _24[int(_1657)] = as_type<uint>(_1647);
        int _1659 = _1611 + 8;
        uint _1661 = uint(int(uint(_1659) >> uint(2)));
        _24[int(_1661)] = as_type<uint>(_1649);
        int _1663 = _1611 + 12;
        uint _1665 = uint(int(uint(_1663) >> uint(2)));
        _24[int(_1665)] = as_type<uint>(_1651);
    }
    if (!_1503)
    {
        return;
    }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    bool _1667 = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x) >= 6u;
    bool _1669 = as_type<uint>(_61) >= 4u;
    if (!_1669)
    {
        int _1671 = _106 << 3;
        int _1673 = _1671 + _108;
        int _1675 = _106 + _108;
        int _1677 = _1673 << 1;
        int _1679 = _1677 + _102;
        int _1681 = _1675 << 8;
        int _1683 = _1679 << 7;
        uint _1685 = uint(int(uint(_1683) >> uint(2)));
        float _1687 = as_type<float>(_24[int(_1685)]);
        int _1689 = _1683 + 4;
        uint _1691 = uint(int(uint(_1689) >> uint(2)));
        float _1693 = as_type<float>(_24[int(_1691)]);
        int _1695 = _1683 + 8;
        uint _1697 = uint(int(uint(_1695) >> uint(2)));
        float _1699 = as_type<float>(_24[int(_1697)]);
        int _1701 = _1683 + 12;
        uint _1703 = uint(int(uint(_1701) >> uint(2)));
        float _1705 = as_type<float>(_24[int(_1703)]);
        int _1707 = _1683 + 1024;
        uint _1709 = uint(int(uint(_1707) >> uint(2)));
        float _1711 = as_type<float>(_24[int(_1709)]);
        int _1713 = _1683 + 1028;
        uint _1715 = uint(int(uint(_1713) >> uint(2)));
        float _1717 = as_type<float>(_24[int(_1715)]);
        int _1719 = _1683 + 1032;
        uint _1721 = uint(int(uint(_1719) >> uint(2)));
        float _1723 = as_type<float>(_24[int(_1721)]);
        int _1725 = _1683 + 1036;
        uint _1727 = uint(int(uint(_1725) >> uint(2)));
        float _1729 = as_type<float>(_24[int(_1727)]);
        int _1731 = _1683 + 320;
        uint _1733 = uint(int(uint(_1731) >> uint(2)));
        float _1735 = as_type<float>(_24[int(_1733)]);
        int _1737 = _1683 + 324;
        uint _1739 = uint(int(uint(_1737) >> uint(2)));
        float _1741 = as_type<float>(_24[int(_1739)]);
        int _1743 = _1683 + 328;
        uint _1745 = uint(int(uint(_1743) >> uint(2)));
        float _1747 = as_type<float>(_24[int(_1745)]);
        int _1749 = _1683 + 332;
        uint _1751 = uint(int(uint(_1749) >> uint(2)));
        float _1753 = as_type<float>(_24[int(_1751)]);
        int _1755 = _1683 + 1344;
        uint _1757 = uint(int(uint(_1755) >> uint(2)));
        float _1759 = as_type<float>(_24[int(_1757)]);
        int _1761 = _1683 + 1348;
        uint _1763 = uint(int(uint(_1761) >> uint(2)));
        float _1765 = as_type<float>(_24[int(_1763)]);
        int _1767 = _1683 + 1352;
        uint _1769 = uint(int(uint(_1767) >> uint(2)));
        float _1771 = as_type<float>(_24[int(_1769)]);
        int _1773 = _1683 + 1356;
        uint _1775 = uint(int(uint(_1773) >> uint(2)));
        float _1777 = as_type<float>(_24[int(_1775)]);
        float _1779 = _1687 + _1711;
        float _1781 = _1693 + _1717;
        float _1783 = _1699 + _1723;
        float _1785 = _1705 + _1729;
        float _1787 = _1735 + _1779;
        float _1789 = _1741 + _1781;
        float _1791 = _1747 + _1783;
        float _1793 = _1753 + _1785;
        float _1795 = _1759 + _1787;
        float _1797 = _1765 + _1789;
        float _1799 = _1771 + _1791;
        float _1801 = _1777 + _1793;
        int _1803 = as_type<int>(_65) << 1;
        int _1805 = _1803 + _102;
        float _1807 = _1795 * 0.25;
        int _1809 = as_type<int>(_63) << 1;
        int _1811 = _1809 + _106;
        float _1813 = _1797 * 0.25;
        float _1815 = _1799 * 0.25;
        float _1817 = _1801 * 0.25;
        spvDescriptorSet0.cp_i_tcb_52_.write(float4(_1807, _1813, _1815, _1817), uint2(int2(_1811, _1805)));
        uint _1819 = uint(int(uint(_1681) >> uint(2)));
        _24[int(_1819)] = as_type<uint>(_1807);
        int _1821 = _1681 + 4;
        uint _1823 = uint(int(uint(_1821) >> uint(2)));
        _24[int(_1823)] = as_type<uint>(_1813);
        int _1825 = _1681 + 8;
        uint _1827 = uint(int(uint(_1825) >> uint(2)));
        _24[int(_1827)] = as_type<uint>(_1815);
        int _1829 = _1681 + 12;
        uint _1831 = uint(int(uint(_1829) >> uint(2)));
        _24[int(_1831)] = as_type<uint>(_1817);
    }
    if (!_1667)
    {
        return;
    }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    bool _1833 = as_type<int>(_61) != 0;
    if (_1833)
    {
        return;
    }
    float _1835 = as_type<float>(_24[0]);
    float _1837 = as_type<float>(_24[1]);
    float _1839 = as_type<float>(_24[2]);
    float _1841 = as_type<float>(_24[3]);
    float _1843 = as_type<float>(_24[64]);
    float _1845 = as_type<float>(_24[65]);
    float _1847 = as_type<float>(_24[66]);
    float _1849 = as_type<float>(_24[67]);
    float _1851 = as_type<float>(_24[128]);
    float _1853 = as_type<float>(_24[129]);
    float _1855 = as_type<float>(_24[130]);
    float _1857 = as_type<float>(_24[131]);
    float _1859 = as_type<float>(_24[192]);
    float _1861 = as_type<float>(_24[193]);
    float _1863 = as_type<float>(_24[194]);
    float _1865 = as_type<float>(_24[195]);
    float _1867 = _1835 + _1843;
    float _1869 = _1837 + _1845;
    float _1871 = _1839 + _1847;
    float _1873 = _1841 + _1849;
    float _1875 = _1851 + _1867;
    float _1877 = _1853 + _1869;
    float _1879 = _1855 + _1871;
    float _1881 = _1857 + _1873;
    float _1883 = _1859 + _1875;
    float _1885 = _1861 + _1877;
    float _1887 = _1863 + _1879;
    float _1889 = _1865 + _1881;
    float _1891 = _1883 * 0.25;
    float _1893 = _1885 * 0.25;
    float _1895 = _1887 * 0.25;
    float _1897 = _1889 * 0.25;
    spvDescriptorSet0.cp_i_tcb_54_.write(float4(_1891, _1893, _1895, _1897), uint2(int2(as_type<int>(_63), as_type<int>(_65))));
}

