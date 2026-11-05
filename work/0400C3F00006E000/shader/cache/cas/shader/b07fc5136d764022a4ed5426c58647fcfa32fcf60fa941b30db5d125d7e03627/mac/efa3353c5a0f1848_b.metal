#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* cp_c4 [[id(1)]];
    constant _16* cp_c5 [[id(2)]];
    constant _16* cp_c6 [[id(3)]];
    constant _16* cp_c3 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_A [[id(9)]];
    sampler cp_t_tcb_ASmplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _4066, thread const int& _4067, constant _10& support_buffer)
{
    int _4070 = 1 + _4067;
    float _4072 = support_buffer._m5[_4070].x;
    bool _4074 = _4072 == 1.0;
    if (_4074)
    {
        return _4066;
    }
    float _4076 = float(_4066);
    float _4078 = _4076 * _4072;
    int _4080 = int(_4078);
    return _4080;
}

static inline __attribute__((always_inline))
int _58(thread const int& _4102, thread const int& _4103, thread const int& _4104, thread int& _4105, thread uint& gl_SubgroupInvocationID)
{
    int _4108 = _4104 & 31;
    uint _4110 = uint(int(uint(_4104) >> uint(8)));
    int _4112 = int(_4110) & 31;
    float _4114 = as_type<float>(gl_SubgroupInvocationID);
    int _4116 = as_type<int>(_4114) & _4112;
    int _4118 = ~_4112;
    int _4120 = _4108 & _4118;
    int _4122 = _4120 | _4116;
    int _4124 = ~_4112;
    int _4126 = _4103 & _4124;
    int _4128 = _4126 | _4116;
    bool _4130 = uint(_4128) <= uint(_4122);
    _4105 = _4130 ? (-1) : 0;
    float _4132 = spvSubgroupShuffle(as_type<float>(_4102), uint(_4128));
    uint _4134 = uint(_4130 ? as_type<int>(_4132) : _4102);
    return int(_4134);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1221 = false;
    bool _755 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    float _74 = _64;
    if (_72)
    {
        return;
    }
    int _76 = _68 & 31;
    bool _78 = _76 == 0;
    bool _80 = uint(_76) < 32u;
    int _82 = 32 - _76;
    int _84 = _76 - 32;
    int _86 = 1 << _76;
    uint _89 = uint(int(uint(0) >> uint(_82)));
    int _91 = _86 | int(_89);
    int _93 = _78 ? 1 : _91;
    bool _95 = uint(_84) < 32u;
    int _97 = 0 << _84;
    int _99 = _95 ? _97 : 0;
    int _101 = _80 ? _93 : _99;
    int _103 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _105 = _103 + 32;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.cp_c5)._m0[int(_109)][_111];
    int _115 = _101 & as_type<int>(_113);
    bool _117 = _115 != 0;
    if (!_117)
    {
        _74 = 0.0;
    }
    float _119 = _74;
    float _121 = 0.0;
    float _123 = 0.0;
    float _125 = _119;
    if (!_117)
    {
        _121 = 0.0;
        _123 = 0.0;
    }
    float _127 = _121;
    float _129 = _123;
    float _131 = 0.0;
    float _133 = 0.0;
    float _135 = _127;
    float _137 = _129;
    if (!_117)
    {
        _131 = 0.0;
        _133 = 0.0;
    }
    float _139 = _131;
    float _141 = _133;
    float _143 = 0.0;
    float _145 = _139;
    float _147 = _141;
    if (!_117)
    {
        _143 = 0.0;
    }
    float _149 = _143;
    float _151 = 0.0;
    float _153 = 0.0;
    float _155 = _149;
    if (!_117)
    {
        _151 = 0.0;
        _153 = 0.0;
    }
    float _157 = _151;
    float _159 = _153;
    float _161 = 0.0;
    float _163 = _157;
    float _165 = _159;
    if (!_117)
    {
        _161 = 0.0;
    }
    float _167 = _161;
    bool _169 = !_117;
    float _171 = _167;
    if (!_169)
    {
        uint _173 = uint(int(uint(_103) >> uint(2)));
        uint _175 = uint(int(uint(int(_173)) >> uint(2)));
        int _177 = int(_173) & 3;
        float _179 = (*spvDescriptorSet0.cp_c5)._m0[int(_175)][_177];
        int _181 = int(_173) + 1;
        uint _183 = uint(int(uint(_181) >> uint(2)));
        int _185 = _181 & 3;
        float _187 = (*spvDescriptorSet0.cp_c5)._m0[int(_183)][_185];
        int _189 = _68;
        int _191 = 0;
        int _193 = _56(_189, _191, (*spvDescriptorSet0.support_buffer));
        int _195 = as_type<int>(_179);
        int _197 = 0;
        int _199 = _56(_195, _197, (*spvDescriptorSet0.support_buffer));
        int3 _1907 = int3(_193, _199, 1);
        float3 _203 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1907.xy), uint(_1907.z), 0).xyz;
        float _205 = _203.x;
        float _207 = _203.y;
        float _209 = _203.z;
        int _211 = _68;
        int _213 = 0;
        int _215 = _56(_211, _213, (*spvDescriptorSet0.support_buffer));
        int _217 = as_type<int>(_187);
        int _219 = 0;
        int _221 = _56(_217, _219, (*spvDescriptorSet0.support_buffer));
        int3 _1925 = int3(_215, _221, 1);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1925.xy), uint(_1925.z), 0).xyz;
        float _225 = _223.x;
        float _227 = _223.y;
        float _229 = _223.z;
        int _231 = _68;
        int _233 = 0;
        int _235 = _56(_231, _233, (*spvDescriptorSet0.support_buffer));
        int _237 = as_type<int>(_179);
        int _239 = 0;
        int _241 = _56(_237, _239, (*spvDescriptorSet0.support_buffer));
        int3 _1943 = int3(_235, _241, 0);
        float3 _243 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1943.xy), uint(_1943.z), 0).xyz;
        float _245 = _243.x;
        float _247 = _243.y;
        float _249 = _243.z;
        int _251 = _68;
        int _253 = 0;
        int _255 = _56(_251, _253, (*spvDescriptorSet0.support_buffer));
        int _257 = as_type<int>(_187);
        int _259 = 0;
        int _261 = _56(_257, _259, (*spvDescriptorSet0.support_buffer));
        int3 _1961 = int3(_255, _261, 0);
        float3 _263 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1961.xy), uint(_1961.z), 0).xyz;
        float _265 = _263.x;
        float _267 = _263.y;
        float _269 = _263.z;
        int _271 = _68;
        int _273 = 0;
        int _275 = _56(_271, _273, (*spvDescriptorSet0.support_buffer));
        int _277 = as_type<int>(_179);
        int _279 = 0;
        int _281 = _56(_277, _279, (*spvDescriptorSet0.support_buffer));
        int3 _1979 = int3(_275, _281, 2);
        float3 _283 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1979.xy), uint(_1979.z), 0).xyz;
        float _285 = _283.x;
        float _287 = _283.y;
        float _289 = _283.z;
        int _291 = _68;
        int _293 = 0;
        int _295 = _56(_291, _293, (*spvDescriptorSet0.support_buffer));
        int _297 = as_type<int>(_187);
        int _299 = 0;
        int _301 = _56(_297, _299, (*spvDescriptorSet0.support_buffer));
        int3 _1997 = int3(_295, _301, 2);
        float3 _303 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1997.xy), uint(_1997.z), 0).xyz;
        float _305 = _303.x;
        float _307 = _303.y;
        float _309 = _303.z;
        int _311 = _103 + 16;
        uint _313 = uint(int(uint(_311) >> uint(2)));
        uint _315 = uint(int(uint(int(_313)) >> uint(2)));
        int _317 = int(_313) & 3;
        float _319 = (*spvDescriptorSet0.cp_c5)._m0[int(_315)][_317];
        float _321 = -_207;
        float _323 = _321 + _227;
        float _325 = -_205;
        float _327 = _325 + _225;
        float _329 = -_245;
        float _331 = _329 + _265;
        float _333 = -_209;
        float _335 = _333 + _229;
        float _337 = -_247;
        float _339 = _337 + _267;
        float _341 = -_249;
        float _343 = _341 + _269;
        float _345 = fma(_331, _319, _245);
        float _347 = -_285;
        float _349 = _347 + _305;
        float _351 = -_287;
        float _353 = _351 + _307;
        float _355 = -_289;
        float _357 = _355 + _309;
        float _359 = fma(_327, _319, _205);
        float _361 = fma(_323, _319, _207);
        float _363 = fma(_335, _319, _209);
        float _365 = fma(_339, _319, _247);
        float _367 = fma(_343, _319, _249);
        float _369 = fma(_349, _319, _285);
        float _371 = fma(_353, _319, _287);
        float _373 = fma(_357, _319, _289);
        _171 = _359;
        _163 = _363;
        _165 = _361;
        _125 = _345;
        _155 = _373;
        _135 = _367;
        _137 = _365;
        _145 = _369;
        _147 = _371;
    }
    float _375 = _171;
    float _377 = _163;
    float _379 = _165;
    float _381 = _125;
    float _383 = _155;
    float _385 = _135;
    float _387 = _137;
    float _389 = _145;
    float _391 = _147;
    int _393 = _103 + 36;
    uint _395 = uint(int(uint(_393) >> uint(2)));
    uint _397 = uint(int(uint(int(_395)) >> uint(2)));
    int _399 = int(_395) & 3;
    float _401 = (*spvDescriptorSet0.cp_c5)._m0[int(_397)][_399];
    int _403 = _101 & as_type<int>(_401);
    bool _405 = _403 != 0;
    bool _407 = !_405;
    float _409 = _381;
    float _727;
    float _729;
    float _731;
    float _733;
    float _735;
    float _737;
    float _739;
    float _741;
    float _743;
    float _745;
    float _747;
    float _749;
    float _751;
    float _753;
    if (!_407)
    {
        int _411 = _103 + 8;
        uint _413 = uint(int(uint(_411) >> uint(2)));
        uint _415 = uint(int(uint(int(_413)) >> uint(2)));
        int _417 = int(_413) & 3;
        float _419 = (*spvDescriptorSet0.cp_c5)._m0[int(_415)][_417];
        int _421 = int(_413) + 1;
        uint _423 = uint(int(uint(_421) >> uint(2)));
        int _425 = _421 & 3;
        float _427 = (*spvDescriptorSet0.cp_c5)._m0[int(_423)][_425];
        int _429 = _68;
        int _431 = 1;
        int _433 = _56(_429, _431, (*spvDescriptorSet0.support_buffer));
        int _435 = as_type<int>(_419);
        int _437 = 1;
        int _439 = _56(_435, _437, (*spvDescriptorSet0.support_buffer));
        int3 _2195 = int3(_433, _439, 1);
        float3 _441 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2195.xy), uint(_2195.z), 0).xyz;
        float _443 = _441.x;
        float _445 = _441.y;
        float _447 = _441.z;
        int _449 = _68;
        int _451 = 1;
        int _453 = _56(_449, _451, (*spvDescriptorSet0.support_buffer));
        int _455 = as_type<int>(_427);
        int _457 = 1;
        int _459 = _56(_455, _457, (*spvDescriptorSet0.support_buffer));
        int3 _2213 = int3(_453, _459, 1);
        float3 _461 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2213.xy), uint(_2213.z), 0).xyz;
        float _463 = _461.x;
        float _465 = _461.y;
        float _467 = _461.z;
        int _469 = _68;
        int _471 = 1;
        int _473 = _56(_469, _471, (*spvDescriptorSet0.support_buffer));
        int _475 = as_type<int>(_419);
        int _477 = 1;
        int _479 = _56(_475, _477, (*spvDescriptorSet0.support_buffer));
        int3 _2231 = int3(_473, _479, 0);
        float3 _481 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2231.xy), uint(_2231.z), 0).xyz;
        float _483 = _481.x;
        float _485 = _481.y;
        float _487 = _481.z;
        int _489 = _68;
        int _491 = 1;
        int _493 = _56(_489, _491, (*spvDescriptorSet0.support_buffer));
        int _495 = as_type<int>(_427);
        int _497 = 1;
        int _499 = _56(_495, _497, (*spvDescriptorSet0.support_buffer));
        int3 _2249 = int3(_493, _499, 0);
        float3 _501 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2249.xy), uint(_2249.z), 0).xyz;
        float _503 = _501.x;
        float _505 = _501.y;
        float _507 = _501.z;
        int _509 = _68;
        int _511 = 1;
        int _513 = _56(_509, _511, (*spvDescriptorSet0.support_buffer));
        int _515 = as_type<int>(_419);
        int _517 = 1;
        int _519 = _56(_515, _517, (*spvDescriptorSet0.support_buffer));
        int3 _2267 = int3(_513, _519, 2);
        float3 _521 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2267.xy), uint(_2267.z), 0).xyz;
        float _523 = _521.x;
        float _525 = _521.y;
        float _527 = _521.z;
        int _529 = _68;
        int _531 = 1;
        int _533 = _56(_529, _531, (*spvDescriptorSet0.support_buffer));
        int _535 = as_type<int>(_427);
        int _537 = 1;
        int _539 = _56(_535, _537, (*spvDescriptorSet0.support_buffer));
        int3 _2285 = int3(_533, _539, 2);
        float3 _541 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2285.xy), uint(_2285.z), 0).xyz;
        float _543 = _541.x;
        float _545 = _541.y;
        float _547 = _541.z;
        int _549 = _103 + 24;
        uint _551 = uint(int(uint(_549) >> uint(2)));
        uint _553 = uint(int(uint(int(_551)) >> uint(2)));
        int _555 = int(_551) & 3;
        float _557 = (*spvDescriptorSet0.cp_c5)._m0[int(_553)][_555];
        int _559 = int(_551) + 1;
        uint _561 = uint(int(uint(_559) >> uint(2)));
        int _563 = _559 & 3;
        float _565 = (*spvDescriptorSet0.cp_c5)._m0[int(_561)][_563];
        int _567 = _103 + 20;
        uint _569 = uint(int(uint(_567) >> uint(2)));
        uint _571 = uint(int(uint(int(_569)) >> uint(2)));
        int _573 = int(_569) & 3;
        float _575 = (*spvDescriptorSet0.cp_c5)._m0[int(_571)][_573];
        float _577 = -_443;
        float _579 = _577 + _463;
        float _581 = -_447;
        float _583 = _581 + _467;
        float _585 = fma(_579, _557, _443);
        float _587 = -_445;
        float _589 = _587 + _465;
        float _591 = fma(_583, _557, _447);
        float _593 = _585 * _565;
        float _595 = fma(_589, _557, _445);
        float _597 = _591 * _565;
        float _599 = fma(_375, _575, _593);
        float _601 = _595 * _565;
        float _603 = fma(_377, _575, _597);
        float _605 = _599 * 0.15915493667125701904296875;
        float _607 = fma(_379, _575, _601);
        float _609 = _603 * 0.15915493667125701904296875;
        float _611 = _605 * 6.283185482025146484375;
        float _613 = sin(_611);
        float _615 = _607 * 0.15915493667125701904296875;
        float _617 = -_483;
        float _619 = _617 + _503;
        float _621 = -_527;
        float _623 = _621 + _547;
        float _625 = fma(_619, _557, _483);
        float _627 = fma(_623, _557, _527);
        float _629 = _605 * 6.283185482025146484375;
        float _631 = cos(_629);
        float _633 = _625 * _565;
        float _635 = fma(_381, _575, _633);
        float _637 = _609 * 6.283185482025146484375;
        float _639 = cos(_637);
        float _641 = _615 * 6.283185482025146484375;
        float _643 = sin(_641);
        float _645 = _609 * 6.283185482025146484375;
        float _647 = sin(_645);
        float _649 = _631 * _639;
        float _651 = _613 * _639;
        float _653 = _615 * 6.283185482025146484375;
        float _655 = cos(_653);
        float _657 = _613 * _643;
        float _659 = _647 * _631;
        float _661 = _613 * _647;
        float _663 = -_487;
        float _665 = _663 + _507;
        float _667 = -_651;
        float _669 = fma(_643, _659, _667);
        float _671 = fma(_643, _649, _661);
        float _673 = fma(_665, _557, _487);
        float _675 = _631 * _655;
        float _677 = _655 * _639;
        float _679 = _647 * _655;
        float _681 = _613 * _655;
        float _683 = fma(_647, _657, _649);
        float _685 = -_485;
        float _687 = _685 + _505;
        float _689 = -_659;
        float _691 = fma(_639, _657, _689);
        float _693 = _673 * _565;
        float _695 = _627 * _565;
        float _697 = fma(_687, _557, _485);
        float _699 = -_523;
        float _701 = _699 + _543;
        float _703 = -_525;
        float _705 = _703 + _545;
        float _707 = fma(_383, _575, _695);
        float _709 = _697 * _565;
        float _711 = fma(_701, _557, _523);
        float _713 = fma(_705, _557, _525);
        float _715 = fma(_385, _575, _693);
        float _717 = fma(_387, _575, _709);
        float _719 = _711 * _565;
        float _721 = _713 * _565;
        float _723 = fma(_389, _575, _719);
        float _725 = fma(_391, _575, _721);
        _409 = _635;
        _727 = _677;
        _729 = _679;
        _731 = _643;
        _733 = _717;
        _735 = _681;
        _737 = _691;
        _739 = _683;
        _741 = _715;
        _743 = _671;
        _745 = _669;
        _747 = _675;
        _749 = _707;
        _751 = _725;
        _753 = _723;
        _755 = true;
    }
    else
    {
        float _757 = _375 * 0.15915493667125701904296875;
        float _759 = _377 * 0.15915493667125701904296875;
        float _761 = _379 * 0.15915493667125701904296875;
        float _763 = _757 * 6.283185482025146484375;
        float _765 = sin(_763);
        float _767 = _757 * 6.283185482025146484375;
        float _769 = cos(_767);
        float _771 = _759 * 6.283185482025146484375;
        float _773 = sin(_771);
        float _775 = _759 * 6.283185482025146484375;
        float _777 = cos(_775);
        float _779 = _761 * 6.283185482025146484375;
        float _781 = cos(_779);
        float _783 = _773 * _769;
        float _785 = _761 * 6.283185482025146484375;
        float _787 = sin(_785);
        float _789 = _769 * _777;
        float _791 = _765 * _777;
        float _793 = _769 * _781;
        float _795 = _765 * _773;
        float _797 = _781 * _777;
        float _799 = _773 * _781;
        float _801 = _765 * _781;
        float _803 = _765 * _787;
        float _805 = fma(_787, _789, _795);
        float _807 = -_791;
        float _809 = fma(_787, _783, _807);
        float _811 = -_783;
        float _813 = fma(_777, _803, _811);
        float _815 = fma(_773, _803, _789);
        _727 = _797;
        _729 = _799;
        _731 = _787;
        _733 = _387;
        _735 = _801;
        _737 = _813;
        _739 = _815;
        _741 = _385;
        _743 = _805;
        _745 = _809;
        _747 = _793;
        _749 = _383;
        _751 = _391;
        _753 = _389;
    }
    _755 = false;
    float _817 = _409;
    float _819 = _727;
    float _821 = _729;
    float _823 = _731;
    float _825 = _733;
    float _827 = _735;
    float _829 = _737;
    float _831 = _739;
    float _833 = _741;
    float _835 = _743;
    float _837 = _745;
    float _839 = _747;
    float _841 = _749;
    float _843 = _751;
    float _845 = _753;
    bool _847 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _849 = _817 * _819;
    float _851 = _817 * _821;
    float _853 = _817 * _823;
    float _855 = _825 * _827;
    float _857 = _825 * _829;
    float _859 = _825 * _831;
    float _861 = _833 * _835;
    float _863 = _833 * _837;
    float _865 = _833 * _839;
    int _867 = _68 * 112;
    bool _869 = !_847;
    float _871 = _849;
    float _873 = _857;
    float _875 = _861;
    float _877 = _845;
    float _879 = _859;
    float _881 = _863;
    float _883 = _843;
    float _885 = _855;
    float _887 = _865;
    float _889 = _841;
    float _1217;
    float _1219;
    if (!_869)
    {
        float _891 = -_853;
        float _893 = _891 + (-0.0);
        int _895 = 0;
        float _897 = _849;
        float _899 = _857;
        float _901 = _861;
        float _903 = _845;
        float _905 = _851;
        float _907 = _859;
        float _909 = _863;
        float _911 = _843;
        float _913 = _893;
        float _915 = _855;
        float _917 = _865;
        float _919 = _841;
        bool _921;
        int _969;
        int _979;
        int _989;
        int _999;
        int _1009;
        int _1019;
        int _1029;
        int _1039;
        int _1049;
        int _1059;
        int _1069;
        int _1079;
        float _1193;
        float _1195;
        float _1197;
        int _1199;
        float _1201;
        int _1203;
        int _1205;
        int _1207;
        int _1209;
        float _1211;
        float _1213;
        float _1215;
        do
        {
            int _923 = _895;
            float _925 = _897;
            float _927 = _899;
            float _929 = _901;
            int _931 = as_type<int>(_903);
            float _933 = _905;
            int _935 = as_type<int>(_907);
            int _937 = as_type<int>(_909);
            int _939 = as_type<int>(_911);
            int _941 = as_type<int>(_913);
            float _943 = _915;
            float _945 = _917;
            float _947 = _919;
            uint _949 = uint(int(uint(_867) >> uint(2)));
            uint _951 = uint(int(uint(int(_949)) >> uint(2)));
            int _953 = int(_949) & 3;
            float _955 = (*spvDescriptorSet0.cp_c6)._m0[int(_951)][_953];
            bool _957 = _68 != 0;
            int _959 = _923 + 1;
            bool _961 = uint(_959) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _963 = as_type<int>(_925);
            int _965 = as_type<int>(_955);
            int _967 = 31;
            int _2806 = _58(_963, _965, _967, _969, gl_SubgroupInvocationID);
            int _971 = _2806;
            int _973 = as_type<int>(_927);
            int _975 = as_type<int>(_955);
            int _977 = 31;
            int _2811 = _58(_973, _975, _977, _979, gl_SubgroupInvocationID);
            int _981 = _2811;
            int _983 = as_type<int>(_929);
            int _985 = as_type<int>(_955);
            int _987 = 31;
            int _2816 = _58(_983, _985, _987, _989, gl_SubgroupInvocationID);
            int _991 = _2816;
            int _993 = _931;
            int _995 = as_type<int>(_955);
            int _997 = 31;
            int _2820 = _58(_993, _995, _997, _999, gl_SubgroupInvocationID);
            int _1001 = _2820;
            int _1003 = as_type<int>(_933);
            int _1005 = as_type<int>(_955);
            int _1007 = 31;
            int _2825 = _58(_1003, _1005, _1007, _1009, gl_SubgroupInvocationID);
            int _1011 = _2825;
            int _1013 = _935;
            int _1015 = as_type<int>(_955);
            int _1017 = 31;
            int _2829 = _58(_1013, _1015, _1017, _1019, gl_SubgroupInvocationID);
            int _1021 = _2829;
            int _1023 = _937;
            int _1025 = as_type<int>(_955);
            int _1027 = 31;
            int _2833 = _58(_1023, _1025, _1027, _1029, gl_SubgroupInvocationID);
            int _1031 = _2833;
            int _1033 = _939;
            int _1035 = as_type<int>(_955);
            int _1037 = 31;
            int _2837 = _58(_1033, _1035, _1037, _1039, gl_SubgroupInvocationID);
            int _1041 = _2837;
            int _1043 = _941;
            int _1045 = as_type<int>(_955);
            int _1047 = 31;
            int _2841 = _58(_1043, _1045, _1047, _1049, gl_SubgroupInvocationID);
            int _1051 = _2841;
            int _1053 = as_type<int>(_943);
            int _1055 = as_type<int>(_955);
            int _1057 = 31;
            int _2846 = _58(_1053, _1055, _1057, _1059, gl_SubgroupInvocationID);
            int _1061 = _2846;
            int _1063 = as_type<int>(_945);
            int _1065 = as_type<int>(_955);
            int _1067 = 31;
            int _2851 = _58(_1063, _1065, _1067, _1069, gl_SubgroupInvocationID);
            int _1071 = _2851;
            int _1073 = as_type<int>(_947);
            int _1075 = as_type<int>(_955);
            int _1077 = 31;
            int _2856 = _58(_1073, _1075, _1077, _1079, gl_SubgroupInvocationID);
            int _1081 = _2856;
            bool _1083 = !_957;
            _895 = _959;
            float _1085 = _925;
            float _1087 = _927;
            float _1089 = _929;
            int _1091 = _931;
            float _1093 = _933;
            int _1095 = _935;
            int _1097 = _937;
            int _1099 = _939;
            int _1101 = _941;
            float _1103 = _943;
            float _1105 = _945;
            float _1107 = _947;
            if (!_1083)
            {
                float _1109 = as_type<float>(_981) * _843;
                float _1111 = _851 * as_type<float>(_1021);
                float _1113 = _863 * as_type<float>(_1021);
                float _1115 = _851 * as_type<float>(_981);
                float _1117 = fma(as_type<float>(_971), _845, _1109);
                float _1119 = _859 * as_type<float>(_1021);
                float _1121 = _859 * as_type<float>(_981);
                float _1123 = _863 * as_type<float>(_981);
                float _1125 = fma(_849, as_type<float>(_1011), _1111);
                float _1127 = fma(_857, as_type<float>(_1011), _1119);
                float _1129 = fma(_861, as_type<float>(_1011), _1113);
                float _1131 = as_type<float>(_1021) * _843;
                float _1133 = _851 * as_type<float>(_1061);
                float _1135 = _859 * as_type<float>(_1061);
                float _1137 = _863 * as_type<float>(_1061);
                float _1139 = as_type<float>(_1061) * _843;
                float _1141 = fma(_849, as_type<float>(_971), _1115);
                float _1143 = fma(_857, as_type<float>(_971), _1121);
                float _1145 = fma(_861, as_type<float>(_971), _1123);
                float _1147 = fma(as_type<float>(_1011), _845, _1131);
                float _1149 = fma(_849, as_type<float>(_1051), _1133);
                float _1151 = fma(_861, as_type<float>(_1051), _1137);
                float _1153 = fma(as_type<float>(_1051), _845, _1139);
                float _1155 = -_853;
                float _1157 = fma(_1155, as_type<float>(_991), _1141);
                float _1159 = fma(_855, as_type<float>(_991), _1143);
                float _1161 = fma(_865, as_type<float>(_991), _1145);
                float _1163 = fma(_857, as_type<float>(_1051), _1135);
                float _1165 = fma(as_type<float>(_991), _841, _1117);
                float _1167 = -_853;
                float _1169 = fma(_1167, as_type<float>(_1031), _1125);
                float _1171 = fma(_855, as_type<float>(_1031), _1127);
                float _1173 = fma(_865, as_type<float>(_1031), _1129);
                float _1175 = fma(as_type<float>(_1031), _841, _1147);
                float _1177 = fma(as_type<float>(_1071), _841, _1153);
                float _1179 = -_853;
                float _1181 = fma(_1179, as_type<float>(_1071), _1149);
                float _1183 = fma(_855, as_type<float>(_1071), _1163);
                float _1185 = fma(_865, as_type<float>(_1071), _1151);
                float _1187 = as_type<float>(_1001) + _1165;
                float _1189 = as_type<float>(_1041) + _1175;
                float _1191 = as_type<float>(_1081) + _1177;
                _1085 = _1157;
                _1087 = _1159;
                _1089 = _1161;
                _1091 = as_type<int>(_1187);
                _1093 = _1169;
                _1095 = as_type<int>(_1171);
                _1097 = as_type<int>(_1173);
                _1099 = as_type<int>(_1189);
                _1101 = as_type<int>(_1181);
                _1103 = _1183;
                _1105 = _1185;
                _1107 = _1191;
            }
            _1193 = _1085;
            _1195 = _1087;
            _1197 = _1089;
            _1199 = _1091;
            _1201 = _1093;
            _1203 = _1095;
            _1205 = _1097;
            _1207 = _1099;
            _1209 = _1101;
            _1211 = _1103;
            _1213 = _1105;
            _1215 = _1107;
            _921 = !_961;
            _897 = _1193;
            _899 = _1195;
            _901 = _1197;
            _903 = as_type<float>(_1199);
            _905 = _1201;
            _907 = as_type<float>(_1203);
            _909 = as_type<float>(_1205);
            _911 = as_type<float>(_1207);
            _913 = as_type<float>(_1209);
            _915 = _1211;
            _917 = _1213;
            _919 = _1215;
        } while (_921);
        _871 = _1193;
        _873 = _1195;
        _875 = _1197;
        _877 = as_type<float>(_1199);
        _1217 = _1201;
        _879 = as_type<float>(_1203);
        _881 = as_type<float>(_1205);
        _883 = as_type<float>(_1207);
        _1219 = as_type<float>(_1209);
        _885 = _1211;
        _887 = _1213;
        _889 = _1215;
        _1221 = true;
    }
    else
    {
        float _1223 = -_853;
        float _1225 = _1223 + (-0.0);
        _1217 = _851;
        _1219 = _1225;
    }
    _1221 = false;
    float _1227 = _871;
    float _1229 = _873;
    float _1231 = _875;
    float _1233 = _877;
    float _1235 = _1217;
    float _1237 = _879;
    float _1239 = _881;
    float _1241 = _883;
    float _1243 = _1219;
    float _1245 = _885;
    float _1247 = _887;
    float _1249 = _889;
    int _1251 = _867 + 80;
    uint _1253 = uint(int(uint(_1251) >> uint(2)));
    uint _1255 = uint(int(uint(int(_1253)) >> uint(2)));
    int _1257 = int(_1253) & 3;
    float _1259 = (*spvDescriptorSet0.cp_c6)._m0[int(_1255)][_1257];
    int _1261 = int(_1253) + 1;
    uint _1263 = uint(int(uint(_1261) >> uint(2)));
    int _1265 = _1261 & 3;
    float _1267 = (*spvDescriptorSet0.cp_c6)._m0[int(_1263)][_1265];
    bool _1269 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1271 = _867 + 64;
    uint _1273 = uint(int(uint(_1271) >> uint(2)));
    uint _1275 = uint(int(uint(int(_1273)) >> uint(2)));
    int _1277 = int(_1273) & 3;
    float _1279 = (*spvDescriptorSet0.cp_c6)._m0[int(_1275)][_1277];
    int _1281 = int(_1273) + 1;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    int _1285 = _1281 & 3;
    float _1287 = (*spvDescriptorSet0.cp_c6)._m0[int(_1283)][_1285];
    int _1289 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1291 = _1289 + _68;
    int _1293 = _867 + 88;
    uint _1295 = uint(int(uint(_1293) >> uint(2)));
    uint _1297 = uint(int(uint(int(_1295)) >> uint(2)));
    int _1299 = int(_1295) & 3;
    float _1301 = (*spvDescriptorSet0.cp_c6)._m0[int(_1297)][_1299];
    int _1303 = int(_1295) + 1;
    uint _1305 = uint(int(uint(_1303) >> uint(2)));
    int _1307 = _1303 & 3;
    float _1309 = (*spvDescriptorSet0.cp_c6)._m0[int(_1305)][_1307];
    int _1311 = _867 + 72;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    uint _1315 = uint(int(uint(int(_1313)) >> uint(2)));
    int _1317 = int(_1313) & 3;
    float _1319 = (*spvDescriptorSet0.cp_c6)._m0[int(_1315)][_1317];
    int _1321 = int(_1313) + 1;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    int _1325 = _1321 & 3;
    float _1327 = (*spvDescriptorSet0.cp_c6)._m0[int(_1323)][_1325];
    int _1329 = _867 + 96;
    uint _1331 = uint(int(uint(_1329) >> uint(2)));
    uint _1333 = uint(int(uint(int(_1331)) >> uint(2)));
    int _1335 = int(_1331) & 3;
    float _1337 = (*spvDescriptorSet0.cp_c6)._m0[int(_1333)][_1335];
    int _1339 = int(_1331) + 1;
    uint _1341 = uint(int(uint(_1339) >> uint(2)));
    int _1343 = _1339 & 3;
    float _1345 = (*spvDescriptorSet0.cp_c6)._m0[int(_1341)][_1343];
    int _1347 = _867 + 104;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    uint _1351 = uint(int(uint(int(_1349)) >> uint(2)));
    int _1353 = int(_1349) & 3;
    float _1355 = (*spvDescriptorSet0.cp_c6)._m0[int(_1351)][_1353];
    int _1357 = int(_1349) + 1;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    int _1361 = _1357 & 3;
    float _1363 = (*spvDescriptorSet0.cp_c6)._m0[int(_1359)][_1361];
    int _1365 = _867 + 16;
    uint _1367 = uint(int(uint(_1365) >> uint(2)));
    uint _1369 = uint(int(uint(int(_1367)) >> uint(2)));
    int _1371 = int(_1367) & 3;
    float _1373 = (*spvDescriptorSet0.cp_c6)._m0[int(_1369)][_1371];
    int _1375 = int(_1367) + 1;
    uint _1377 = uint(int(uint(_1375) >> uint(2)));
    int _1379 = _1375 & 3;
    float _1381 = (*spvDescriptorSet0.cp_c6)._m0[int(_1377)][_1379];
    if (!_1269)
    {
        int _1383 = _68 * 48;
        int _1385 = _1383 + 16;
        uint _1387 = uint(int(uint(_1383) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1387)] = as_type<uint>(_1227);
        int _1389 = _1383 + 4;
        uint _1391 = uint(int(uint(_1389) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1391)] = as_type<uint>(_1229);
        int _1393 = _1383 + 8;
        uint _1395 = uint(int(uint(_1393) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1395)] = as_type<uint>(_1231);
        int _1397 = _1383 + 12;
        uint _1399 = uint(int(uint(_1397) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1399)] = as_type<uint>(_1233);
        int _1401 = _1383 + 32;
        uint _1403 = uint(int(uint(_1385) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1403)] = as_type<uint>(_1235);
        int _1405 = _1385 + 4;
        uint _1407 = uint(int(uint(_1405) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1407)] = as_type<uint>(_1237);
        int _1409 = _1385 + 8;
        uint _1411 = uint(int(uint(_1409) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1411)] = as_type<uint>(_1239);
        int _1413 = _1385 + 12;
        uint _1415 = uint(int(uint(_1413) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1415)] = as_type<uint>(_1241);
        uint _1417 = uint(int(uint(_1401) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1417)] = as_type<uint>(_1243);
        int _1419 = _1401 + 4;
        uint _1421 = uint(int(uint(_1419) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1421)] = as_type<uint>(_1245);
        int _1423 = _1401 + 8;
        uint _1425 = uint(int(uint(_1423) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1425)] = as_type<uint>(_1247);
        int _1427 = _1401 + 12;
        uint _1429 = uint(int(uint(_1427) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1429)] = as_type<uint>(_1249);
    }
    float _1431 = _1245 * _1259;
    float _1433 = _1229 * _1259;
    float _1435 = _1237 * _1259;
    int _1437 = _867 + 32;
    uint _1439 = uint(int(uint(_1437) >> uint(2)));
    uint _1441 = uint(int(uint(int(_1439)) >> uint(2)));
    int _1443 = int(_1439) & 3;
    float _1445 = (*spvDescriptorSet0.cp_c6)._m0[int(_1441)][_1443];
    int _1447 = int(_1439) + 1;
    uint _1449 = uint(int(uint(_1447) >> uint(2)));
    int _1451 = _1447 & 3;
    float _1453 = (*spvDescriptorSet0.cp_c6)._m0[int(_1449)][_1451];
    float _1455 = fma(_1243, _1279, _1431);
    float _1457 = _1229 * _1267;
    float _1459 = fma(_1227, _1279, _1433);
    float _1461 = fma(_1235, _1279, _1435);
    float _1463 = _1237 * _1267;
    float _1465 = fma(_1227, _1287, _1457);
    float _1467 = _1229 * _1301;
    float _1469 = _1229 * _1309;
    float _1471 = _1245 * _1267;
    int _1473 = _867 + 48;
    uint _1475 = uint(int(uint(_1473) >> uint(2)));
    uint _1477 = uint(int(uint(int(_1475)) >> uint(2)));
    int _1479 = int(_1475) & 3;
    float _1481 = (*spvDescriptorSet0.cp_c6)._m0[int(_1477)][_1479];
    int _1483 = int(_1475) + 1;
    uint _1485 = uint(int(uint(_1483) >> uint(2)));
    int _1487 = _1483 & 3;
    float _1489 = (*spvDescriptorSet0.cp_c6)._m0[int(_1485)][_1487];
    float _1491 = _1237 * _1301;
    float _1493 = _1237 * _1309;
    float _1495 = fma(_1235, _1287, _1463);
    float _1497 = fma(_1243, _1287, _1471);
    float _1499 = _1245 * _1301;
    float _1501 = _1245 * _1309;
    float _1503 = fma(_1227, _1319, _1467);
    float _1505 = fma(_1227, _1327, _1469);
    float _1507 = fma(_1235, _1319, _1491);
    int _1509 = _867 + 24;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    uint _1513 = uint(int(uint(int(_1511)) >> uint(2)));
    int _1515 = int(_1511) & 3;
    float _1517 = (*spvDescriptorSet0.cp_c6)._m0[int(_1513)][_1515];
    int _1519 = int(_1511) + 1;
    uint _1521 = uint(int(uint(_1519) >> uint(2)));
    int _1523 = _1519 & 3;
    float _1525 = (*spvDescriptorSet0.cp_c6)._m0[int(_1521)][_1523];
    float _1527 = fma(_1235, _1327, _1493);
    float _1529 = fma(_1243, _1327, _1501);
    float _1531 = fma(_1243, _1319, _1499);
    float _1533 = fma(_1231, _1337, _1459);
    float _1535 = fma(_1239, _1363, _1527);
    float _1537 = fma(_1239, _1337, _1461);
    float _1539 = fma(_1247, _1337, _1455);
    int _1541 = _867 + 40;
    uint _1543 = uint(int(uint(_1541) >> uint(2)));
    uint _1545 = uint(int(uint(int(_1543)) >> uint(2)));
    int _1547 = int(_1543) & 3;
    float _1549 = (*spvDescriptorSet0.cp_c6)._m0[int(_1545)][_1547];
    int _1551 = int(_1543) + 1;
    uint _1553 = uint(int(uint(_1551) >> uint(2)));
    int _1555 = _1551 & 3;
    float _1557 = (*spvDescriptorSet0.cp_c6)._m0[int(_1553)][_1555];
    float _1559 = fma(_1231, _1345, _1465);
    float _1561 = fma(_1231, _1355, _1503);
    float _1563 = fma(_1231, _1363, _1505);
    float _1565 = fma(_1239, _1345, _1495);
    float _1567 = fma(_1239, _1355, _1507);
    float _1569 = fma(_1247, _1363, _1529);
    float _1571 = _1535 + _1241;
    int _1573 = _867 + 56;
    uint _1575 = uint(int(uint(_1573) >> uint(2)));
    uint _1577 = uint(int(uint(int(_1575)) >> uint(2)));
    int _1579 = int(_1575) & 3;
    float _1581 = (*spvDescriptorSet0.cp_c6)._m0[int(_1577)][_1579];
    int _1583 = int(_1575) + 1;
    uint _1585 = uint(int(uint(_1583) >> uint(2)));
    int _1587 = _1583 & 3;
    float _1589 = (*spvDescriptorSet0.cp_c6)._m0[int(_1585)][_1587];
    float _1591 = fma(_1247, _1345, _1497);
    float _1593 = fma(_1247, _1355, _1531);
    float _1595 = _1569 + _1249;
    float _1597 = _1563 + _1233;
    float _1599 = _1537 * _1381;
    float _1601 = _1565 * _1381;
    float _1603 = _1567 * _1381;
    float _1605 = _1571 * _1381;
    float _1607 = fma(_1533, _1373, _1599);
    float _1609 = fma(_1559, _1373, _1601);
    float _1611 = fma(_1561, _1373, _1603);
    float _1613 = fma(_1597, _1373, _1605);
    float _1615 = _1571 * _1453;
    float _1617 = _1537 * _1453;
    float _1619 = _1565 * _1453;
    float _1621 = _1567 * _1453;
    float _1623 = fma(_1597, _1445, _1615);
    float _1625 = fma(_1533, _1445, _1617);
    float _1627 = fma(_1559, _1445, _1619);
    float _1629 = fma(_1561, _1445, _1621);
    int _1631 = _1291 * 48;
    float _1633 = _1571 * _1489;
    float _1635 = _1537 * _1489;
    float _1637 = _1565 * _1489;
    float _1639 = _1567 * _1489;
    float _1641 = fma(_1597, _1481, _1633);
    float _1643 = fma(_1533, _1481, _1635);
    float _1645 = fma(_1559, _1481, _1637);
    float _1647 = fma(_1561, _1481, _1639);
    float _1649 = fma(_1595, _1517, _1613);
    float _1651 = fma(_1591, _1517, _1609);
    float _1653 = fma(_1539, _1517, _1607);
    float _1655 = fma(_1593, _1517, _1611);
    float _1657 = _1649 + _1525;
    float _1659 = fma(_1595, _1549, _1623);
    float _1661 = fma(_1539, _1549, _1625);
    float _1663 = fma(_1591, _1549, _1627);
    float _1665 = fma(_1593, _1549, _1629);
    float _1667 = _1659 + _1557;
    int _1669 = _1631 + 16;
    int _1671 = _1631 + 32;
    float _1673 = fma(_1595, _1581, _1641);
    float _1675 = fma(_1539, _1581, _1643);
    float _1677 = fma(_1591, _1581, _1645);
    float _1679 = fma(_1593, _1581, _1647);
    float _1681 = _1673 + _1589;
    int _1683 = _1631 + 48;
    uint _1685 = uint(int(uint(_1669) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1685)] = as_type<uint>(_1653);
    int _1687 = _1669 + 4;
    uint _1689 = uint(int(uint(_1687) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1689)] = as_type<uint>(_1651);
    int _1691 = _1669 + 8;
    uint _1693 = uint(int(uint(_1691) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1693)] = as_type<uint>(_1655);
    int _1695 = _1669 + 12;
    uint _1697 = uint(int(uint(_1695) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1697)] = as_type<uint>(_1657);
    uint _1699 = uint(int(uint(_1671) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1699)] = as_type<uint>(_1661);
    int _1701 = _1671 + 4;
    uint _1703 = uint(int(uint(_1701) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1703)] = as_type<uint>(_1663);
    int _1705 = _1671 + 8;
    uint _1707 = uint(int(uint(_1705) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1707)] = as_type<uint>(_1665);
    int _1709 = _1671 + 12;
    uint _1711 = uint(int(uint(_1709) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1711)] = as_type<uint>(_1667);
    uint _1713 = uint(int(uint(_1683) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1713)] = as_type<uint>(_1675);
    int _1715 = _1683 + 4;
    uint _1717 = uint(int(uint(_1715) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1717)] = as_type<uint>(_1677);
    int _1719 = _1683 + 8;
    uint _1721 = uint(int(uint(_1719) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1721)] = as_type<uint>(_1679);
    int _1723 = _1683 + 12;
    uint _1725 = uint(int(uint(_1723) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1725)] = as_type<uint>(_1681);
}

