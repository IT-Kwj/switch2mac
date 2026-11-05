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
    texture2d_array<float> cp_i_tcb_48_ [[id(2)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(3)]];
    texture2d_array<float, access::write> cp_i_tcb_4C_ [[id(4)]];
    texture2d_array<float, access::write> cp_i_tcb_4E_ [[id(5)]];
    texture2d_array<float, access::write> cp_i_tcb_50_ [[id(6)]];
    texture2d_array<float, access::write> cp_i_tcb_52_ [[id(7)]];
    texture2d_array<float, access::write> cp_i_tcb_54_ [[id(8)]];
};

static inline __attribute__((always_inline))
int _55(thread const int& _4302, thread const int& _4303, constant _10& support_buffer)
{
    int _4306 = 1 + _4303;
    float _4308 = support_buffer._m5[_4306].x;
    bool _4310 = _4308 == 1.0;
    if (_4310)
    {
        return _4302;
    }
    float _4312 = float(_4302);
    float _4314 = _4312 * _4308;
    int _4316 = int(_4314);
    return _4316;
}

static inline __attribute__((always_inline))
int _57(thread const int& _4337, thread const int& _4338, thread const int& _4339, thread int& _4340, thread uint& gl_SubgroupInvocationID)
{
    int _4343 = _4339 & 31;
    uint _4345 = uint(int(uint(_4339) >> uint(8)));
    int _4347 = int(_4345) & 31;
    float _4349 = as_type<float>(gl_SubgroupInvocationID);
    int _4351 = as_type<int>(_4349) & _4347;
    int _4353 = ~_4347;
    int _4355 = _4343 & _4353;
    int _4357 = _4355 | _4351;
    int _4359 = as_type<int>(_4349) ^ _4338;
    bool _4361 = uint(_4359) <= uint(_4357);
    _4340 = _4361 ? (-1) : 0;
    float _4363 = spvSubgroupShuffle(as_type<float>(_4337), uint(_4359));
    uint _4365 = uint(_4361 ? as_type<int>(_4363) : _4337);
    return int(_4365);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    threadgroup spvUnsafeArray<uint, 1024> _24;
    float _61 = as_type<float>(gl_LocalInvocationID.x);
    float _63 = as_type<float>(gl_WorkGroupID.x);
    float _65 = as_type<float>(gl_WorkGroupID.y);
    float _67 = as_type<float>(gl_WorkGroupID.z);
    int _69 = as_type<int>(_61) & 63;
    uint _72 = uint(int(uint(as_type<int>(_61)) >> uint(6)));
    uint _74 = uint(int(uint(_69) >> uint(2)));
    uint _76 = uint(int(uint(_69) >> uint(3)));
    uint _78 = uint(int(uint(_69) >> uint(1)));
    uint _80 = extract_bits(_74, 0u, 3u);
    uint _82 = extract_bits(_76, 0u, 3u);
    uint _84 = extract_bits(_78, 0u, 2u);
    int _86 = 1 & _69;
    int _88 = (-2) & int(_80);
    int _90 = _86 | _88;
    int _92 = 3 & int(_84);
    int _94 = (-4) & int(_82);
    int _96 = _92 | _94;
    uint _98 = uint(int(uint(as_type<int>(_61)) >> uint(7)));
    int _100 = int(_72) & 1;
    int _102 = int(_98) << 3;
    int _104 = _102 + _96;
    int _106 = _100 << 3;
    int _108 = _106 + _90;
    int _110 = _104 << 1;
    int _112 = _108 << 1;
    int _114 = as_type<int>(_65) << 6;
    int _116 = _114 + _110;
    int _118 = as_type<int>(_63) << 6;
    int _120 = _118 + _112;
    int _122 = _116 + 1;
    int _124 = _120;
    int _126 = 0;
    int _128 = _55(_124, _126, (*spvDescriptorSet0.support_buffer));
    int _130 = _116;
    int _132 = 0;
    int _134 = _55(_130, _132, (*spvDescriptorSet0.support_buffer));
    int3 _2013 = int3(_128, _134, as_type<int>(_67));
    float4 _137 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_2013.xy), uint(_2013.z)).xyzw);
    float _139 = _137.x;
    float _141 = _137.y;
    float _143 = _137.z;
    float _145 = _137.w;
    int _147 = _120 + 1;
    int _149 = _120;
    int _151 = 0;
    int _153 = _55(_149, _151, (*spvDescriptorSet0.support_buffer));
    int _155 = _122;
    int _157 = 0;
    int _159 = _55(_155, _157, (*spvDescriptorSet0.support_buffer));
    int3 _2036 = int3(_153, _159, as_type<int>(_67));
    float4 _161 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_2036.xy), uint(_2036.z)).xyzw);
    float _163 = _161.x;
    float _165 = _161.y;
    float _167 = _161.z;
    float _169 = _161.w;
    int _171 = _147;
    int _173 = 0;
    int _175 = _55(_171, _173, (*spvDescriptorSet0.support_buffer));
    int _177 = _116;
    int _179 = 0;
    int _181 = _55(_177, _179, (*spvDescriptorSet0.support_buffer));
    int3 _2057 = int3(_175, _181, as_type<int>(_67));
    float4 _183 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_2057.xy), uint(_2057.z)).xyzw);
    float _185 = _183.x;
    float _187 = _183.y;
    float _189 = _183.z;
    float _191 = _183.w;
    int _193 = _147;
    int _195 = 0;
    int _197 = _55(_193, _195, (*spvDescriptorSet0.support_buffer));
    int _199 = _122;
    int _201 = 0;
    int _203 = _55(_199, _201, (*spvDescriptorSet0.support_buffer));
    int3 _2078 = int3(_197, _203, as_type<int>(_67));
    float4 _205 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_2078.xy), uint(_2078.z)).xyzw);
    float _207 = _205.x;
    float _209 = _205.y;
    float _211 = _205.z;
    float _213 = _205.w;
    int _215 = _120 + 32;
    int _217 = as_type<int>(_63) << 5;
    int _219 = _217 + _108;
    int _221 = as_type<int>(_65) << 5;
    int _223 = _221 + _104;
    float _225 = _139 + _163;
    float _227 = _141 + _165;
    float _229 = _143 + _167;
    float _231 = _145 + _169;
    float _233 = _185 + _225;
    float _235 = _187 + _227;
    float _237 = _189 + _229;
    float _239 = _191 + _231;
    float _241 = _207 + _233;
    float _243 = _209 + _235;
    float _245 = _211 + _237;
    float _247 = _213 + _239;
    float _249 = _241 * 0.25;
    float _251 = _243 * 0.25;
    float _253 = _245 * 0.25;
    float _255 = _247 * 0.25;
    int _257 = _120 + 33;
    int3 _2159 = int3(_219, _223, as_type<int>(_67));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_249, _251, _253, _255), uint2(_2159.xy), uint(_2159.z));
    int _259 = _215;
    int _261 = 0;
    int _263 = _55(_259, _261, (*spvDescriptorSet0.support_buffer));
    int _265 = _116;
    int _267 = 0;
    int _269 = _55(_265, _267, (*spvDescriptorSet0.support_buffer));
    int3 _2174 = int3(_263, _269, as_type<int>(_67));
    float4 _271 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_2174.xy), uint(_2174.z)).xyzw);
    float _273 = _271.x;
    float _275 = _271.y;
    float _277 = _271.z;
    float _279 = _271.w;
    int _281 = _215;
    int _283 = 0;
    int _285 = _55(_281, _283, (*spvDescriptorSet0.support_buffer));
    int _287 = _122;
    int _289 = 0;
    int _291 = _55(_287, _289, (*spvDescriptorSet0.support_buffer));
    int3 _2195 = int3(_285, _291, as_type<int>(_67));
    float4 _293 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_2195.xy), uint(_2195.z)).xyzw);
    float _295 = _293.x;
    float _297 = _293.y;
    float _299 = _293.z;
    float _301 = _293.w;
    int _303 = _257;
    int _305 = 0;
    int _307 = _55(_303, _305, (*spvDescriptorSet0.support_buffer));
    int _309 = _116;
    int _311 = 0;
    int _313 = _55(_309, _311, (*spvDescriptorSet0.support_buffer));
    int3 _2216 = int3(_307, _313, as_type<int>(_67));
    float4 _315 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_2216.xy), uint(_2216.z)).xyzw);
    float _317 = _315.x;
    float _319 = _315.y;
    float _321 = _315.z;
    float _323 = _315.w;
    int _325 = _257;
    int _327 = 0;
    int _329 = _55(_325, _327, (*spvDescriptorSet0.support_buffer));
    int _331 = _122;
    int _333 = 0;
    int _335 = _55(_331, _333, (*spvDescriptorSet0.support_buffer));
    int3 _2237 = int3(_329, _335, as_type<int>(_67));
    float4 _337 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_2237.xy), uint(_2237.z)).xyzw);
    float _339 = _337.x;
    float _341 = _337.y;
    float _343 = _337.z;
    float _345 = _337.w;
    int _347 = _219 + 16;
    float _349 = _273 + _295;
    float _351 = _275 + _297;
    float _353 = _277 + _299;
    float _355 = _279 + _301;
    float _357 = _317 + _349;
    float _359 = _319 + _351;
    float _361 = _321 + _353;
    float _363 = _323 + _355;
    float _365 = _339 + _357;
    float _367 = _341 + _359;
    float _369 = _343 + _361;
    float _371 = _345 + _363;
    int _373 = _116 + 32;
    float _375 = _365 * 0.25;
    float _377 = _367 * 0.25;
    float _379 = _369 * 0.25;
    float _381 = _371 * 0.25;
    int _383 = _116 + 33;
    int3 _2305 = int3(_347, _223, as_type<int>(_67));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_375, _377, _379, _381), uint2(_2305.xy), uint(_2305.z));
    int _385 = _120;
    int _387 = 0;
    int _389 = _55(_385, _387, (*spvDescriptorSet0.support_buffer));
    int _391 = _373;
    int _393 = 0;
    int _395 = _55(_391, _393, (*spvDescriptorSet0.support_buffer));
    int3 _2320 = int3(_389, _395, as_type<int>(_67));
    float4 _397 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_2320.xy), uint(_2320.z)).xyzw);
    float _399 = _397.x;
    float _401 = _397.y;
    float _403 = _397.z;
    float _405 = _397.w;
    int _407 = _120;
    int _409 = 0;
    int _411 = _55(_407, _409, (*spvDescriptorSet0.support_buffer));
    int _413 = _383;
    int _415 = 0;
    int _417 = _55(_413, _415, (*spvDescriptorSet0.support_buffer));
    int3 _2341 = int3(_411, _417, as_type<int>(_67));
    float4 _419 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_2341.xy), uint(_2341.z)).xyzw);
    float _421 = _419.x;
    float _423 = _419.y;
    float _425 = _419.z;
    float _427 = _419.w;
    int _429 = _147;
    int _431 = 0;
    int _433 = _55(_429, _431, (*spvDescriptorSet0.support_buffer));
    int _435 = _373;
    int _437 = 0;
    int _439 = _55(_435, _437, (*spvDescriptorSet0.support_buffer));
    int3 _2362 = int3(_433, _439, as_type<int>(_67));
    float4 _441 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_2362.xy), uint(_2362.z)).xyzw);
    float _443 = _441.x;
    float _445 = _441.y;
    float _447 = _441.z;
    float _449 = _441.w;
    int _451 = _147;
    int _453 = 0;
    int _455 = _55(_451, _453, (*spvDescriptorSet0.support_buffer));
    int _457 = _383;
    int _459 = 0;
    int _461 = _55(_457, _459, (*spvDescriptorSet0.support_buffer));
    int3 _2383 = int3(_455, _461, as_type<int>(_67));
    float4 _463 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_2383.xy), uint(_2383.z)).xyzw);
    float _465 = _463.x;
    float _467 = _463.y;
    float _469 = _463.z;
    float _471 = _463.w;
    float _473 = _399 + _421;
    float _475 = _401 + _423;
    float _477 = _403 + _425;
    float _479 = _405 + _427;
    float _481 = _443 + _473;
    float _483 = _445 + _475;
    float _485 = _447 + _477;
    float _487 = _449 + _479;
    float _489 = _465 + _481;
    float _491 = _467 + _483;
    float _493 = _469 + _485;
    float _495 = _471 + _487;
    float _497 = _489 * 0.25;
    int _499 = as_type<int>(_63) << 5;
    int _501 = _499 + _108;
    float _503 = _491 * 0.25;
    int _505 = _223 + 16;
    float _507 = _493 * 0.25;
    float _509 = _495 * 0.25;
    int3 _2452 = int3(_501, _505, as_type<int>(_67));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_497, _503, _507, _509), uint2(_2452.xy), uint(_2452.z));
    int _511 = _215;
    int _513 = 0;
    int _515 = _55(_511, _513, (*spvDescriptorSet0.support_buffer));
    int _517 = _373;
    int _519 = 0;
    int _521 = _55(_517, _519, (*spvDescriptorSet0.support_buffer));
    int3 _2467 = int3(_515, _521, as_type<int>(_67));
    float4 _523 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_2467.xy), uint(_2467.z)).xyzw);
    float _525 = _523.x;
    float _527 = _523.y;
    float _529 = _523.z;
    float _531 = _523.w;
    int _533 = _215;
    int _535 = 0;
    int _537 = _55(_533, _535, (*spvDescriptorSet0.support_buffer));
    int _539 = _383;
    int _541 = 0;
    int _543 = _55(_539, _541, (*spvDescriptorSet0.support_buffer));
    int3 _2488 = int3(_537, _543, as_type<int>(_67));
    float4 _545 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_2488.xy), uint(_2488.z)).xyzw);
    float _547 = _545.x;
    float _549 = _545.y;
    float _551 = _545.z;
    float _553 = _545.w;
    float _555 = _525 + _547;
    float _557 = _527 + _549;
    float _559 = _529 + _551;
    int _561 = _257;
    int _563 = 0;
    int _565 = _55(_561, _563, (*spvDescriptorSet0.support_buffer));
    int _567 = _383;
    int _569 = 0;
    int _571 = _55(_567, _569, (*spvDescriptorSet0.support_buffer));
    int3 _2518 = int3(_565, _571, as_type<int>(_67));
    float4 _573 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_2518.xy), uint(_2518.z)).xyzw);
    float _575 = _573.x;
    float _577 = _573.y;
    float _579 = _573.z;
    float _581 = _573.w;
    int _583 = _257;
    int _585 = 0;
    int _587 = _55(_583, _585, (*spvDescriptorSet0.support_buffer));
    int _589 = _373;
    int _591 = 0;
    int _593 = _55(_589, _591, (*spvDescriptorSet0.support_buffer));
    int3 _2539 = int3(_587, _593, as_type<int>(_67));
    float4 _595 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_2539.xy), uint(_2539.z)).xyzw);
    float _597 = _595.x;
    float _599 = _595.y;
    float _601 = _595.z;
    float _603 = _595.w;
    float _605 = _531 + _553;
    float _607 = _597 + _555;
    float _609 = _599 + _557;
    float _611 = _601 + _559;
    float _613 = _603 + _605;
    float _615 = _575 + _607;
    float _617 = _577 + _609;
    float _619 = _579 + _611;
    float _621 = _581 + _613;
    float _623 = _615 * 0.25;
    float _625 = _617 * 0.25;
    float _627 = _619 * 0.25;
    float _629 = _621 * 0.25;
    int3 _2591 = int3(_347, _505, as_type<int>(_67));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_623, _625, _627, _629), uint2(_2591.xy), uint(_2591.z));
    bool _633 = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x) >= 2u;
    bool _635 = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x) >= 3u;
    bool _637 = !_633;
    if (!_637)
    {
        int _639 = as_type<int>(_249);
        int _641 = 1;
        int _643 = 7199;
        int _645;
        int _2614 = _57(_639, _641, _643, _645, gl_SubgroupInvocationID);
        int _647 = _2614;
        int _649 = as_type<int>(_61) & 3;
        bool _651 = _649 != 0;
        int _653 = as_type<int>(_251);
        int _655 = 1;
        int _657 = 7199;
        int _659;
        int _2622 = _57(_653, _655, _657, _659, gl_SubgroupInvocationID);
        int _661 = _2622;
        int _663 = as_type<int>(_249);
        int _665 = 2;
        int _667 = 7199;
        int _669;
        int _2625 = _57(_663, _665, _667, _669, gl_SubgroupInvocationID);
        int _671 = _2625;
        int _673 = as_type<int>(_251);
        int _675 = 2;
        int _677 = 7199;
        int _679;
        int _2628 = _57(_673, _675, _677, _679, gl_SubgroupInvocationID);
        int _681 = _2628;
        int _683 = as_type<int>(_253);
        int _685 = 2;
        int _687 = 7199;
        int _689;
        int _2631 = _57(_683, _685, _687, _689, gl_SubgroupInvocationID);
        int _691 = _2631;
        int _693 = as_type<int>(_377);
        int _695 = 1;
        int _697 = 7199;
        int _699;
        int _2634 = _57(_693, _695, _697, _699, gl_SubgroupInvocationID);
        int _701 = _2634;
        float _703 = _249 + as_type<float>(_647);
        int _705 = as_type<int>(_255);
        int _707 = 2;
        int _709 = 7199;
        int _711;
        int _2641 = _57(_705, _707, _709, _711, gl_SubgroupInvocationID);
        int _713 = _2641;
        float _715 = _251 + as_type<float>(_661);
        int _717 = as_type<int>(_253);
        int _719 = 1;
        int _721 = 7199;
        int _723;
        int _2648 = _57(_717, _719, _721, _723, gl_SubgroupInvocationID);
        int _725 = _2648;
        float _727 = as_type<float>(_671) + _703;
        int _729 = as_type<int>(_255);
        int _731 = 1;
        int _733 = 7199;
        int _735;
        int _2655 = _57(_729, _731, _733, _735, gl_SubgroupInvocationID);
        int _737 = _2655;
        float _739 = as_type<float>(_681) + _715;
        int _741 = as_type<int>(_375);
        int _743 = 1;
        int _745 = 7199;
        int _747;
        int _2662 = _57(_741, _743, _745, _747, gl_SubgroupInvocationID);
        int _749 = _2662;
        int _751 = as_type<int>(_375);
        int _753 = 2;
        int _755 = 7199;
        int _757;
        int _2665 = _57(_751, _753, _755, _757, gl_SubgroupInvocationID);
        int _759 = _2665;
        int _761 = as_type<int>(_377);
        int _763 = 2;
        int _765 = 7199;
        int _767;
        int _2668 = _57(_761, _763, _765, _767, gl_SubgroupInvocationID);
        int _769 = _2668;
        int _771 = as_type<int>(_375);
        int _773 = 3;
        int _775 = 7199;
        int _777;
        int _2671 = _57(_771, _773, _775, _777, gl_SubgroupInvocationID);
        int _779 = _2671;
        float _781 = _253 + as_type<float>(_725);
        int _783 = as_type<int>(_249);
        int _785 = 3;
        int _787 = 7199;
        int _789;
        int _2678 = _57(_783, _785, _787, _789, gl_SubgroupInvocationID);
        int _791 = _2678;
        float _793 = _255 + as_type<float>(_737);
        float _795 = as_type<float>(_691) + _781;
        float _797 = _377 + as_type<float>(_701);
        int _799 = as_type<int>(_377);
        int _801 = 3;
        int _803 = 7199;
        int _805;
        int _2693 = _57(_799, _801, _803, _805, gl_SubgroupInvocationID);
        int _807 = _2693;
        float _809 = _375 + as_type<float>(_749);
        float _811 = as_type<float>(_713) + _793;
        int _813 = as_type<int>(_379);
        int _815 = 1;
        int _817 = 7199;
        int _819;
        int _2704 = _57(_813, _815, _817, _819, gl_SubgroupInvocationID);
        int _821 = _2704;
        float _823 = as_type<float>(_759) + _809;
        int _825 = as_type<int>(_253);
        int _827 = 3;
        int _829 = 7199;
        int _831;
        int _2711 = _57(_825, _827, _829, _831, gl_SubgroupInvocationID);
        int _833 = _2711;
        float _835 = as_type<float>(_769) + _797;
        int _837 = as_type<int>(_251);
        int _839 = 3;
        int _841 = 7199;
        int _843;
        int _2718 = _57(_837, _839, _841, _843, gl_SubgroupInvocationID);
        int _845 = _2718;
        float _847 = as_type<float>(_779) + _823;
        int _849 = as_type<int>(_255);
        int _851 = 3;
        int _853 = 7199;
        int _855;
        int _2725 = _57(_849, _851, _853, _855, gl_SubgroupInvocationID);
        int _857 = _2725;
        float _859 = as_type<float>(_791) + _727;
        int _861 = as_type<int>(_381);
        int _863 = 1;
        int _865 = 7199;
        int _867;
        int _2732 = _57(_861, _863, _865, _867, gl_SubgroupInvocationID);
        int _869 = _2732;
        int _871 = as_type<int>(_507);
        int _873 = 1;
        int _875 = 7199;
        int _877;
        int _2735 = _57(_871, _873, _875, _877, gl_SubgroupInvocationID);
        int _879 = _2735;
        float _881 = as_type<float>(_807) + _835;
        int _883 = as_type<int>(_497);
        int _885 = 2;
        int _887 = 7199;
        int _889;
        int _2742 = _57(_883, _885, _887, _889, gl_SubgroupInvocationID);
        int _891 = _2742;
        float _893 = _379 + as_type<float>(_821);
        float _895 = as_type<float>(_833) + _795;
        int _897 = as_type<int>(_381);
        int _899 = 2;
        int _901 = 7199;
        int _903;
        int _2753 = _57(_897, _899, _901, _903, gl_SubgroupInvocationID);
        int _905 = _2753;
        float _907 = as_type<float>(_845) + _739;
        int _909 = as_type<int>(_497);
        int _911 = 1;
        int _913 = 7199;
        int _915;
        int _2760 = _57(_909, _911, _913, _915, gl_SubgroupInvocationID);
        int _917 = _2760;
        float _919 = as_type<float>(_857) + _811;
        int _921 = as_type<int>(_503);
        int _923 = 1;
        int _925 = 7199;
        int _927;
        int _2767 = _57(_921, _923, _925, _927, gl_SubgroupInvocationID);
        int _929 = _2767;
        float _931 = _381 + as_type<float>(_869);
        int _933 = as_type<int>(_509);
        int _935 = 1;
        int _937 = 7199;
        int _939;
        int _2774 = _57(_933, _935, _937, _939, gl_SubgroupInvocationID);
        int _941 = _2774;
        int _943 = as_type<int>(_507);
        int _945 = 2;
        int _947 = 7199;
        int _949;
        int _2777 = _57(_943, _945, _947, _949, gl_SubgroupInvocationID);
        int _951 = _2777;
        int _953 = as_type<int>(_379);
        int _955 = 2;
        int _957 = 7199;
        int _959;
        int _2780 = _57(_953, _955, _957, _959, gl_SubgroupInvocationID);
        int _961 = _2780;
        int _963 = as_type<int>(_509);
        int _965 = 2;
        int _967 = 7199;
        int _969;
        int _2783 = _57(_963, _965, _967, _969, gl_SubgroupInvocationID);
        int _971 = _2783;
        float _973 = as_type<float>(_905) + _931;
        float _975 = _497 + as_type<float>(_917);
        int _977 = as_type<int>(_381);
        int _979 = 3;
        int _981 = 7199;
        int _983;
        int _2794 = _57(_977, _979, _981, _983, gl_SubgroupInvocationID);
        int _985 = _2794;
        float _987 = _503 + as_type<float>(_929);
        float _989 = _507 + as_type<float>(_879);
        float _991 = as_type<float>(_891) + _975;
        int _993 = as_type<int>(_627);
        int _995 = 1;
        int _997 = 7199;
        int _999;
        int _2809 = _57(_993, _995, _997, _999, gl_SubgroupInvocationID);
        int _1001 = _2809;
        float _1003 = _509 + as_type<float>(_941);
        int _1005 = as_type<int>(_623);
        int _1007 = 1;
        int _1009 = 7199;
        int _1011;
        int _2816 = _57(_1005, _1007, _1009, _1011, gl_SubgroupInvocationID);
        int _1013 = _2816;
        float _1015 = as_type<float>(_951) + _989;
        int _1017 = as_type<int>(_625);
        int _1019 = 1;
        int _1021 = 7199;
        int _1023;
        int _2823 = _57(_1017, _1019, _1021, _1023, gl_SubgroupInvocationID);
        int _1025 = _2823;
        float _1027 = as_type<float>(_961) + _893;
        int _1029 = as_type<int>(_623);
        int _1031 = 2;
        int _1033 = 7199;
        int _1035;
        int _2830 = _57(_1029, _1031, _1033, _1035, gl_SubgroupInvocationID);
        int _1037 = _2830;
        float _1039 = as_type<float>(_971) + _1003;
        int _1041 = as_type<int>(_379);
        int _1043 = 3;
        int _1045 = 7199;
        int _1047;
        int _2837 = _57(_1041, _1043, _1045, _1047, gl_SubgroupInvocationID);
        int _1049 = _2837;
        float _1051 = as_type<float>(_985) + _973;
        int _1053 = as_type<int>(_503);
        int _1055 = 2;
        int _1057 = 7199;
        int _1059;
        int _2844 = _57(_1053, _1055, _1057, _1059, gl_SubgroupInvocationID);
        int _1061 = _2844;
        int _1063 = as_type<int>(_625);
        int _1065 = 2;
        int _1067 = 7199;
        int _1069;
        int _2847 = _57(_1063, _1065, _1067, _1069, gl_SubgroupInvocationID);
        int _1071 = _2847;
        int _1073 = as_type<int>(_627);
        int _1075 = 2;
        int _1077 = 7199;
        int _1079;
        int _2850 = _57(_1073, _1075, _1077, _1079, gl_SubgroupInvocationID);
        int _1081 = _2850;
        float _1083 = _623 + as_type<float>(_1013);
        float _1085 = _625 + as_type<float>(_1025);
        int _1087 = as_type<int>(_497);
        int _1089 = 3;
        int _1091 = 7199;
        int _1093;
        int _2861 = _57(_1087, _1089, _1091, _1093, gl_SubgroupInvocationID);
        int _1095 = _2861;
        float _1097 = as_type<float>(_1037) + _1083;
        int _1099 = as_type<int>(_503);
        int _1101 = 3;
        int _1103 = 7199;
        int _1105;
        int _2868 = _57(_1099, _1101, _1103, _1105, gl_SubgroupInvocationID);
        int _1107 = _2868;
        float _1109 = as_type<float>(_1049) + _1027;
        int _1111 = as_type<int>(_629);
        int _1113 = 1;
        int _1115 = 7199;
        int _1117;
        int _2875 = _57(_1111, _1113, _1115, _1117, gl_SubgroupInvocationID);
        int _1119 = _2875;
        float _1121 = _627 + as_type<float>(_1001);
        float _1123 = as_type<float>(_1061) + _987;
        int _1125 = as_type<int>(_629);
        int _1127 = 2;
        int _1129 = 7199;
        int _1131;
        int _2886 = _57(_1125, _1127, _1129, _1131, gl_SubgroupInvocationID);
        int _1133 = _2886;
        float _1135 = as_type<float>(_1071) + _1085;
        int _1137 = as_type<int>(_507);
        int _1139 = 3;
        int _1141 = 7199;
        int _1143;
        int _2893 = _57(_1137, _1139, _1141, _1143, gl_SubgroupInvocationID);
        int _1145 = _2893;
        float _1147 = as_type<float>(_1081) + _1121;
        int _1149 = as_type<int>(_509);
        int _1151 = 3;
        int _1153 = 7199;
        int _1155;
        int _2900 = _57(_1149, _1151, _1153, _1155, gl_SubgroupInvocationID);
        int _1157 = _2900;
        int _1159 = as_type<int>(_623);
        int _1161 = 3;
        int _1163 = 7199;
        int _1165;
        int _2903 = _57(_1159, _1161, _1163, _1165, gl_SubgroupInvocationID);
        int _1167 = _2903;
        float _1169 = as_type<float>(_1095) + _991;
        int _1171 = as_type<int>(_625);
        int _1173 = 3;
        int _1175 = 7199;
        int _1177;
        int _2910 = _57(_1171, _1173, _1175, _1177, gl_SubgroupInvocationID);
        int _1179 = _2910;
        float _1181 = as_type<float>(_1107) + _1123;
        int _1183 = as_type<int>(_627);
        int _1185 = 3;
        int _1187 = 7199;
        int _1189;
        int _2917 = _57(_1183, _1185, _1187, _1189, gl_SubgroupInvocationID);
        int _1191 = _2917;
        float _1193 = _629 + as_type<float>(_1119);
        int _1195 = as_type<int>(_629);
        int _1197 = 3;
        int _1199 = 7199;
        int _1201;
        int _2924 = _57(_1195, _1197, _1199, _1201, gl_SubgroupInvocationID);
        int _1203 = _2924;
        float _1205 = as_type<float>(_1133) + _1193;
        float _1207 = as_type<float>(_1145) + _1015;
        float _1209 = as_type<float>(_1157) + _1039;
        float _1211 = as_type<float>(_1167) + _1097;
        float _1213 = as_type<float>(_1179) + _1135;
        float _1215 = as_type<float>(_1191) + _1147;
        float _1217 = as_type<float>(_1203) + _1205;
        if (!_651)
        {
            uint _1219 = uint(int(uint(_108) >> uint(1)));
            float _1221 = _859 * 0.25;
            uint _1223 = uint(int(uint(_104) >> uint(1)));
            float _1225 = _907 * 0.25;
            int _1227 = as_type<int>(_63) << 4;
            int _1229 = _1227 + int(_1219);
            float _1231 = _895 * 0.25;
            int _1233 = as_type<int>(_65) << 4;
            int _1235 = _1233 + int(_1223);
            float _1237 = _919 * 0.25;
            float _1239 = _847 * 0.25;
            float _1241 = _881 * 0.25;
            float _1243 = _1109 * 0.25;
            float _1245 = _1051 * 0.25;
            int _1247 = _1229 + 8;
            float _1249 = _1207 * 0.25;
            int3 _3003 = int3(_1229, _1235, as_type<int>(_67));
            spvDescriptorSet0.cp_i_tcb_4C_.write(float4(_1221, _1225, _1231, _1237), uint2(_3003.xy), uint(_3003.z));
            int _1251 = _1235 + 8;
            float _1253 = _1181 * 0.25;
            float _1255 = _1209 * 0.25;
            float _1257 = _1169 * 0.25;
            int3 _3022 = int3(_1247, _1235, as_type<int>(_67));
            spvDescriptorSet0.cp_i_tcb_4C_.write(float4(_1239, _1241, _1243, _1245), uint2(_3022.xy), uint(_3022.z));
            float _1259 = _1211 * 0.25;
            float _1261 = _1213 * 0.25;
            float _1263 = _1215 * 0.25;
            float _1265 = _1217 * 0.25;
            int3 _3041 = int3(_1229, _1251, as_type<int>(_67));
            spvDescriptorSet0.cp_i_tcb_4C_.write(float4(_1257, _1253, _1249, _1255), uint2(_3041.xy), uint(_3041.z));
            int _1267 = int(_1219) << 4;
            int _1269 = _1267 + int(_1223);
            int _1271 = _1269 << 4;
            uint _1273 = uint(int(uint(_1271) >> uint(2)));
            _24[int(_1273)] = as_type<uint>(_1221);
            int _1275 = _1271 + 4;
            uint _1277 = uint(int(uint(_1275) >> uint(2)));
            _24[int(_1277)] = as_type<uint>(_1225);
            int _1279 = _1271 + 8;
            uint _1281 = uint(int(uint(_1279) >> uint(2)));
            _24[int(_1281)] = as_type<uint>(_1231);
            int _1283 = _1271 + 12;
            uint _1285 = uint(int(uint(_1283) >> uint(2)));
            _24[int(_1285)] = as_type<uint>(_1237);
            int _1287 = _1269 << 4;
            int _1289 = _1287 + 2048;
            uint _1291 = uint(int(uint(_1289) >> uint(2)));
            _24[int(_1291)] = as_type<uint>(_1239);
            int _1293 = _1287 + 2052;
            uint _1295 = uint(int(uint(_1293) >> uint(2)));
            _24[int(_1295)] = as_type<uint>(_1241);
            int _1297 = _1287 + 2056;
            uint _1299 = uint(int(uint(_1297) >> uint(2)));
            _24[int(_1299)] = as_type<uint>(_1243);
            int _1301 = _1287 + 2060;
            uint _1303 = uint(int(uint(_1301) >> uint(2)));
            _24[int(_1303)] = as_type<uint>(_1245);
            int _1305 = _1269 << 4;
            int _1307 = _1305 + 128;
            uint _1309 = uint(int(uint(_1307) >> uint(2)));
            _24[int(_1309)] = as_type<uint>(_1257);
            int _1311 = _1305 + 132;
            uint _1313 = uint(int(uint(_1311) >> uint(2)));
            _24[int(_1313)] = as_type<uint>(_1253);
            int _1315 = _1305 + 136;
            uint _1317 = uint(int(uint(_1315) >> uint(2)));
            _24[int(_1317)] = as_type<uint>(_1249);
            int _1319 = _1305 + 140;
            uint _1321 = uint(int(uint(_1319) >> uint(2)));
            _24[int(_1321)] = as_type<uint>(_1255);
            int _1323 = _1269 << 4;
            int _1325 = _1323 + 2176;
            uint _1327 = uint(int(uint(_1325) >> uint(2)));
            _24[int(_1327)] = as_type<uint>(_1259);
            int _1329 = _1323 + 2180;
            uint _1331 = uint(int(uint(_1329) >> uint(2)));
            _24[int(_1331)] = as_type<uint>(_1261);
            int _1333 = _1323 + 2184;
            uint _1335 = uint(int(uint(_1333) >> uint(2)));
            _24[int(_1335)] = as_type<uint>(_1263);
            int _1337 = _1323 + 2188;
            uint _1339 = uint(int(uint(_1337) >> uint(2)));
            _24[int(_1339)] = as_type<uint>(_1265);
            int3 _3239 = int3(_1247, _1251, as_type<int>(_67));
            spvDescriptorSet0.cp_i_tcb_4C_.write(float4(_1259, _1261, _1263, _1265), uint2(_3239.xy), uint(_3239.z));
        }
    }
    if (!_635)
    {
        return;
    }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    bool _1341 = as_type<uint>(_61) >= 64u;
    bool _1343 = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x) >= 4u;
    if (!_1341)
    {
        int _1345 = _104 << 5;
        int _1347 = _108 << 9;
        int _1349 = _1347 + _1345;
        uint _1351 = uint(int(uint(_1349) >> uint(2)));
        float _1353 = as_type<float>(_24[int(_1351)]);
        int _1355 = _1349 + 4;
        uint _1357 = uint(int(uint(_1355) >> uint(2)));
        float _1359 = as_type<float>(_24[int(_1357)]);
        int _1361 = _1349 + 8;
        uint _1363 = uint(int(uint(_1361) >> uint(2)));
        float _1365 = as_type<float>(_24[int(_1363)]);
        int _1367 = _1349 + 12;
        uint _1369 = uint(int(uint(_1367) >> uint(2)));
        float _1371 = as_type<float>(_24[int(_1369)]);
        int _1373 = _1349 + 256;
        uint _1375 = uint(int(uint(_1373) >> uint(2)));
        float _1377 = as_type<float>(_24[int(_1375)]);
        int _1379 = _1349 + 260;
        uint _1381 = uint(int(uint(_1379) >> uint(2)));
        float _1383 = as_type<float>(_24[int(_1381)]);
        int _1385 = _1349 + 264;
        uint _1387 = uint(int(uint(_1385) >> uint(2)));
        float _1389 = as_type<float>(_24[int(_1387)]);
        int _1391 = _1349 + 268;
        uint _1393 = uint(int(uint(_1391) >> uint(2)));
        float _1395 = as_type<float>(_24[int(_1393)]);
        int _1397 = _1349 + 16;
        uint _1399 = uint(int(uint(_1397) >> uint(2)));
        float _1401 = as_type<float>(_24[int(_1399)]);
        int _1403 = _1349 + 20;
        uint _1405 = uint(int(uint(_1403) >> uint(2)));
        float _1407 = as_type<float>(_24[int(_1405)]);
        int _1409 = _1349 + 24;
        uint _1411 = uint(int(uint(_1409) >> uint(2)));
        float _1413 = as_type<float>(_24[int(_1411)]);
        int _1415 = _1349 + 28;
        uint _1417 = uint(int(uint(_1415) >> uint(2)));
        float _1419 = as_type<float>(_24[int(_1417)]);
        int _1421 = _1349 + 272;
        uint _1423 = uint(int(uint(_1421) >> uint(2)));
        float _1425 = as_type<float>(_24[int(_1423)]);
        int _1427 = _1349 + 276;
        uint _1429 = uint(int(uint(_1427) >> uint(2)));
        float _1431 = as_type<float>(_24[int(_1429)]);
        int _1433 = _1349 + 280;
        uint _1435 = uint(int(uint(_1433) >> uint(2)));
        float _1437 = as_type<float>(_24[int(_1435)]);
        int _1439 = _1349 + 284;
        uint _1441 = uint(int(uint(_1439) >> uint(2)));
        float _1443 = as_type<float>(_24[int(_1441)]);
        int _1445 = as_type<int>(_63) << 3;
        int _1447 = _1445 + _108;
        float _1449 = _1353 + _1377;
        float _1451 = _1359 + _1383;
        float _1453 = _1365 + _1389;
        float _1455 = _1371 + _1395;
        float _1457 = _1401 + _1449;
        float _1459 = _1407 + _1451;
        float _1461 = _1413 + _1453;
        float _1463 = _1419 + _1455;
        float _1465 = _1425 + _1457;
        float _1467 = _1431 + _1459;
        float _1469 = _1437 + _1461;
        float _1471 = _1443 + _1463;
        int _1473 = as_type<int>(_65) << 3;
        int _1475 = _1473 + _104;
        float _1477 = _1465 * 0.25;
        float _1479 = _1467 * 0.25;
        float _1481 = _1469 * 0.25;
        float _1483 = _1471 * 0.25;
        int _1485 = _104 & 1;
        int3 _3505 = int3(_1447, _1475, as_type<int>(_67));
        spvDescriptorSet0.cp_i_tcb_4E_.write(float4(_1477, _1479, _1481, _1483), uint2(_3505.xy), uint(_3505.z));
        int _1487 = _112 + _1485;
        int _1489 = _1487 << 8;
        int _1491 = _1489 + _1345;
        uint _1493 = uint(int(uint(_1491) >> uint(2)));
        _24[int(_1493)] = as_type<uint>(_1477);
        int _1495 = _1491 + 4;
        uint _1497 = uint(int(uint(_1495) >> uint(2)));
        _24[int(_1497)] = as_type<uint>(_1479);
        int _1499 = _1491 + 8;
        uint _1501 = uint(int(uint(_1499) >> uint(2)));
        _24[int(_1501)] = as_type<uint>(_1481);
        int _1503 = _1491 + 12;
        uint _1505 = uint(int(uint(_1503) >> uint(2)));
        _24[int(_1505)] = as_type<uint>(_1483);
    }
    if (!_1343)
    {
        return;
    }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    bool _1507 = as_type<uint>(_61) >= 16u;
    bool _1509 = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x) >= 5u;
    if (!_1507)
    {
        int _1511 = _104 << 6;
        int _1513 = _108 << 10;
        int _1515 = _1513 + _1511;
        uint _1517 = uint(int(uint(_1515) >> uint(2)));
        float _1519 = as_type<float>(_24[int(_1517)]);
        int _1521 = _1515 + 4;
        uint _1523 = uint(int(uint(_1521) >> uint(2)));
        float _1525 = as_type<float>(_24[int(_1523)]);
        int _1527 = _1515 + 8;
        uint _1529 = uint(int(uint(_1527) >> uint(2)));
        float _1531 = as_type<float>(_24[int(_1529)]);
        int _1533 = _1515 + 12;
        uint _1535 = uint(int(uint(_1533) >> uint(2)));
        float _1537 = as_type<float>(_24[int(_1535)]);
        int _1539 = _1515 + 512;
        uint _1541 = uint(int(uint(_1539) >> uint(2)));
        float _1543 = as_type<float>(_24[int(_1541)]);
        int _1545 = _1515 + 516;
        uint _1547 = uint(int(uint(_1545) >> uint(2)));
        float _1549 = as_type<float>(_24[int(_1547)]);
        int _1551 = _1515 + 520;
        uint _1553 = uint(int(uint(_1551) >> uint(2)));
        float _1555 = as_type<float>(_24[int(_1553)]);
        int _1557 = _1515 + 524;
        uint _1559 = uint(int(uint(_1557) >> uint(2)));
        float _1561 = as_type<float>(_24[int(_1559)]);
        int _1563 = _1515 + 288;
        uint _1565 = uint(int(uint(_1563) >> uint(2)));
        float _1567 = as_type<float>(_24[int(_1565)]);
        int _1569 = _1515 + 292;
        uint _1571 = uint(int(uint(_1569) >> uint(2)));
        float _1573 = as_type<float>(_24[int(_1571)]);
        int _1575 = _1515 + 296;
        uint _1577 = uint(int(uint(_1575) >> uint(2)));
        float _1579 = as_type<float>(_24[int(_1577)]);
        int _1581 = _1515 + 300;
        uint _1583 = uint(int(uint(_1581) >> uint(2)));
        float _1585 = as_type<float>(_24[int(_1583)]);
        int _1587 = _1515 + 800;
        uint _1589 = uint(int(uint(_1587) >> uint(2)));
        float _1591 = as_type<float>(_24[int(_1589)]);
        int _1593 = _1515 + 804;
        uint _1595 = uint(int(uint(_1593) >> uint(2)));
        float _1597 = as_type<float>(_24[int(_1595)]);
        int _1599 = _1515 + 808;
        uint _1601 = uint(int(uint(_1599) >> uint(2)));
        float _1603 = as_type<float>(_24[int(_1601)]);
        int _1605 = _1515 + 812;
        uint _1607 = uint(int(uint(_1605) >> uint(2)));
        float _1609 = as_type<float>(_24[int(_1607)]);
        float _1611 = _1519 + _1543;
        float _1613 = _1525 + _1549;
        float _1615 = _1531 + _1555;
        float _1617 = _1537 + _1561;
        float _1619 = _1567 + _1611;
        float _1621 = _1573 + _1613;
        float _1623 = _1579 + _1615;
        float _1625 = _1585 + _1617;
        float _1627 = _1591 + _1619;
        float _1629 = _1597 + _1621;
        float _1631 = _1603 + _1623;
        float _1633 = _1609 + _1625;
        int _1635 = as_type<int>(_63) << 2;
        int _1637 = _1635 + _108;
        float _1639 = _1627 * 0.25;
        int _1641 = as_type<int>(_65) << 2;
        int _1643 = _1641 + _104;
        float _1645 = _1629 * 0.25;
        float _1647 = _1631 * 0.25;
        float _1649 = _1633 * 0.25;
        int _1651 = _108 << 2;
        int _1653 = _1651 + _104;
        int3 _3818 = int3(_1637, _1643, as_type<int>(_67));
        spvDescriptorSet0.cp_i_tcb_50_.write(float4(_1639, _1645, _1647, _1649), uint2(_3818.xy), uint(_3818.z));
        int _1655 = _1653 << 8;
        int _1657 = _1655 + _1511;
        uint _1659 = uint(int(uint(_1657) >> uint(2)));
        _24[int(_1659)] = as_type<uint>(_1639);
        int _1661 = _1657 + 4;
        uint _1663 = uint(int(uint(_1661) >> uint(2)));
        _24[int(_1663)] = as_type<uint>(_1645);
        int _1665 = _1657 + 8;
        uint _1667 = uint(int(uint(_1665) >> uint(2)));
        _24[int(_1667)] = as_type<uint>(_1647);
        int _1669 = _1657 + 12;
        uint _1671 = uint(int(uint(_1669) >> uint(2)));
        _24[int(_1671)] = as_type<uint>(_1649);
    }
    if (!_1509)
    {
        return;
    }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    bool _1673 = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x) >= 6u;
    bool _1675 = as_type<uint>(_61) >= 4u;
    if (!_1675)
    {
        int _1677 = _108 << 3;
        int _1679 = _1677 + _110;
        int _1681 = _1679 << 1;
        int _1683 = _1681 + _104;
        int _1685 = _1683 << 7;
        uint _1687 = uint(int(uint(_1685) >> uint(2)));
        float _1689 = as_type<float>(_24[int(_1687)]);
        int _1691 = _1685 + 4;
        uint _1693 = uint(int(uint(_1691) >> uint(2)));
        float _1695 = as_type<float>(_24[int(_1693)]);
        int _1697 = _1685 + 8;
        uint _1699 = uint(int(uint(_1697) >> uint(2)));
        float _1701 = as_type<float>(_24[int(_1699)]);
        int _1703 = _1685 + 12;
        uint _1705 = uint(int(uint(_1703) >> uint(2)));
        float _1707 = as_type<float>(_24[int(_1705)]);
        int _1709 = _1685 + 1024;
        uint _1711 = uint(int(uint(_1709) >> uint(2)));
        float _1713 = as_type<float>(_24[int(_1711)]);
        int _1715 = _1685 + 1028;
        uint _1717 = uint(int(uint(_1715) >> uint(2)));
        float _1719 = as_type<float>(_24[int(_1717)]);
        int _1721 = _1685 + 1032;
        uint _1723 = uint(int(uint(_1721) >> uint(2)));
        float _1725 = as_type<float>(_24[int(_1723)]);
        int _1727 = _1685 + 1036;
        uint _1729 = uint(int(uint(_1727) >> uint(2)));
        float _1731 = as_type<float>(_24[int(_1729)]);
        int _1733 = _1685 + 320;
        uint _1735 = uint(int(uint(_1733) >> uint(2)));
        float _1737 = as_type<float>(_24[int(_1735)]);
        int _1739 = _1685 + 324;
        uint _1741 = uint(int(uint(_1739) >> uint(2)));
        float _1743 = as_type<float>(_24[int(_1741)]);
        int _1745 = _1685 + 328;
        uint _1747 = uint(int(uint(_1745) >> uint(2)));
        float _1749 = as_type<float>(_24[int(_1747)]);
        int _1751 = _1685 + 332;
        uint _1753 = uint(int(uint(_1751) >> uint(2)));
        float _1755 = as_type<float>(_24[int(_1753)]);
        int _1757 = _1685 + 1344;
        uint _1759 = uint(int(uint(_1757) >> uint(2)));
        float _1761 = as_type<float>(_24[int(_1759)]);
        int _1763 = _1685 + 1348;
        uint _1765 = uint(int(uint(_1763) >> uint(2)));
        float _1767 = as_type<float>(_24[int(_1765)]);
        int _1769 = _1685 + 1352;
        uint _1771 = uint(int(uint(_1769) >> uint(2)));
        float _1773 = as_type<float>(_24[int(_1771)]);
        int _1775 = _1685 + 1356;
        uint _1777 = uint(int(uint(_1775) >> uint(2)));
        float _1779 = as_type<float>(_24[int(_1777)]);
        int _1781 = as_type<int>(_63) << 1;
        int _1783 = _1781 + _108;
        int _1785 = _108 + _110;
        int _1787 = _1785 << 8;
        float _1789 = _1689 + _1713;
        float _1791 = _1695 + _1719;
        float _1793 = _1701 + _1725;
        float _1795 = _1707 + _1731;
        float _1797 = _1737 + _1789;
        float _1799 = _1743 + _1791;
        float _1801 = _1749 + _1793;
        float _1803 = _1755 + _1795;
        float _1805 = _1761 + _1797;
        float _1807 = _1767 + _1799;
        float _1809 = _1773 + _1801;
        float _1811 = _1779 + _1803;
        int _1813 = as_type<int>(_65) << 1;
        int _1815 = _1813 + _104;
        float _1817 = _1805 * 0.25;
        float _1819 = _1807 * 0.25;
        float _1821 = _1809 * 0.25;
        float _1823 = _1811 * 0.25;
        int3 _4131 = int3(_1783, _1815, as_type<int>(_67));
        spvDescriptorSet0.cp_i_tcb_52_.write(float4(_1817, _1819, _1821, _1823), uint2(_4131.xy), uint(_4131.z));
        uint _1825 = uint(int(uint(_1787) >> uint(2)));
        _24[int(_1825)] = as_type<uint>(_1817);
        int _1827 = _1787 + 4;
        uint _1829 = uint(int(uint(_1827) >> uint(2)));
        _24[int(_1829)] = as_type<uint>(_1819);
        int _1831 = _1787 + 8;
        uint _1833 = uint(int(uint(_1831) >> uint(2)));
        _24[int(_1833)] = as_type<uint>(_1821);
        int _1835 = _1787 + 12;
        uint _1837 = uint(int(uint(_1835) >> uint(2)));
        _24[int(_1837)] = as_type<uint>(_1823);
    }
    if (!_1673)
    {
        return;
    }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    bool _1839 = as_type<int>(_61) != 0;
    if (_1839)
    {
        return;
    }
    float _1841 = as_type<float>(_24[0]);
    float _1843 = as_type<float>(_24[1]);
    float _1845 = as_type<float>(_24[2]);
    float _1847 = as_type<float>(_24[3]);
    float _1849 = as_type<float>(_24[64]);
    float _1851 = as_type<float>(_24[65]);
    float _1853 = as_type<float>(_24[66]);
    float _1855 = as_type<float>(_24[67]);
    float _1857 = as_type<float>(_24[128]);
    float _1859 = as_type<float>(_24[129]);
    float _1861 = as_type<float>(_24[130]);
    float _1863 = as_type<float>(_24[131]);
    float _1865 = as_type<float>(_24[192]);
    float _1867 = as_type<float>(_24[193]);
    float _1869 = as_type<float>(_24[194]);
    float _1871 = as_type<float>(_24[195]);
    float _1873 = _1841 + _1849;
    float _1875 = _1843 + _1851;
    float _1877 = _1845 + _1853;
    float _1879 = _1847 + _1855;
    float _1881 = _1857 + _1873;
    float _1883 = _1859 + _1875;
    float _1885 = _1861 + _1877;
    float _1887 = _1863 + _1879;
    float _1889 = _1865 + _1881;
    float _1891 = _1867 + _1883;
    float _1893 = _1869 + _1885;
    float _1895 = _1871 + _1887;
    float _1897 = _1889 * 0.25;
    float _1899 = _1891 * 0.25;
    float _1901 = _1893 * 0.25;
    float _1903 = _1895 * 0.25;
    int3 _4296 = int3(as_type<int>(_63), as_type<int>(_65), as_type<int>(_67));
    spvDescriptorSet0.cp_i_tcb_54_.write(float4(_1897, _1899, _1901, _1903), uint2(_4296.xy), uint(_4296.z));
}

