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
int _56(thread const int& _4089, thread const int& _4090, constant _10& support_buffer)
{
    int _4093 = 1 + _4090;
    float _4095 = support_buffer._m5[_4093].x;
    bool _4097 = _4095 == 1.0;
    if (_4097)
    {
        return _4089;
    }
    float _4099 = float(_4089);
    float _4101 = _4099 * _4095;
    int _4103 = int(_4101);
    return _4103;
}

static inline __attribute__((always_inline))
int _58(thread const int& _4125, thread const int& _4126, thread const int& _4127, thread int& _4128, thread uint& gl_SubgroupInvocationID)
{
    int _4131 = _4127 & 31;
    uint _4133 = uint(int(uint(_4127) >> uint(8)));
    int _4135 = int(_4133) & 31;
    float _4137 = as_type<float>(gl_SubgroupInvocationID);
    int _4139 = as_type<int>(_4137) & _4135;
    int _4141 = ~_4135;
    int _4143 = _4131 & _4141;
    int _4145 = _4143 | _4139;
    int _4147 = ~_4135;
    int _4149 = _4126 & _4147;
    int _4151 = _4149 | _4139;
    bool _4153 = uint(_4151) <= uint(_4145);
    _4128 = _4153 ? (-1) : 0;
    float _4155 = spvSubgroupShuffle(as_type<float>(_4125), uint(_4151));
    uint _4157 = uint(_4153 ? as_type<int>(_4155) : _4125);
    return int(_4157);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1275 = false;
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
        int3 _1911 = int3(_193, _199, 1);
        float3 _203 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1911.xy), uint(_1911.z), 0).xyz;
        float _205 = _203.x;
        float _207 = _203.y;
        float _209 = _203.z;
        int _211 = _68;
        int _213 = 0;
        int _215 = _56(_211, _213, (*spvDescriptorSet0.support_buffer));
        int _217 = as_type<int>(_187);
        int _219 = 0;
        int _221 = _56(_217, _219, (*spvDescriptorSet0.support_buffer));
        int3 _1929 = int3(_215, _221, 1);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1929.xy), uint(_1929.z), 0).xyz;
        float _225 = _223.x;
        float _227 = _223.y;
        float _229 = _223.z;
        int _231 = _68;
        int _233 = 0;
        int _235 = _56(_231, _233, (*spvDescriptorSet0.support_buffer));
        int _237 = as_type<int>(_179);
        int _239 = 0;
        int _241 = _56(_237, _239, (*spvDescriptorSet0.support_buffer));
        int3 _1947 = int3(_235, _241, 0);
        float3 _243 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1947.xy), uint(_1947.z), 0).xyz;
        float _245 = _243.x;
        float _247 = _243.y;
        float _249 = _243.z;
        int _251 = _68;
        int _253 = 0;
        int _255 = _56(_251, _253, (*spvDescriptorSet0.support_buffer));
        int _257 = as_type<int>(_187);
        int _259 = 0;
        int _261 = _56(_257, _259, (*spvDescriptorSet0.support_buffer));
        int3 _1965 = int3(_255, _261, 0);
        float3 _263 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1965.xy), uint(_1965.z), 0).xyz;
        float _265 = _263.x;
        float _267 = _263.y;
        float _269 = _263.z;
        int _271 = _68;
        int _273 = 0;
        int _275 = _56(_271, _273, (*spvDescriptorSet0.support_buffer));
        int _277 = as_type<int>(_179);
        int _279 = 0;
        int _281 = _56(_277, _279, (*spvDescriptorSet0.support_buffer));
        int3 _1983 = int3(_275, _281, 2);
        float3 _283 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1983.xy), uint(_1983.z), 0).xyz;
        float _285 = _283.x;
        float _287 = _283.y;
        float _289 = _283.z;
        int _291 = _68;
        int _293 = 0;
        int _295 = _56(_291, _293, (*spvDescriptorSet0.support_buffer));
        int _297 = as_type<int>(_187);
        int _299 = 0;
        int _301 = _56(_297, _299, (*spvDescriptorSet0.support_buffer));
        int3 _2001 = int3(_295, _301, 2);
        float3 _303 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2001.xy), uint(_2001.z), 0).xyz;
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
        _135 = _365;
        _137 = _367;
        _145 = _369;
        _147 = _371;
        _155 = _373;
    }
    float _375 = _171;
    float _377 = _163;
    float _379 = _165;
    float _381 = _125;
    float _383 = _135;
    float _385 = _137;
    float _387 = _145;
    float _389 = _147;
    float _391 = _155;
    int _393 = _103 + 36;
    uint _395 = uint(int(uint(_393) >> uint(2)));
    uint _397 = uint(int(uint(int(_395)) >> uint(2)));
    int _399 = int(_395) & 3;
    float _401 = (*spvDescriptorSet0.cp_c5)._m0[int(_397)][_399];
    int _403 = _101 & as_type<int>(_401);
    bool _405 = _403 != 0;
    bool _407 = !_405;
    float _409 = _383;
    float _411 = _381;
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
        int _413 = _103 + 8;
        uint _415 = uint(int(uint(_413) >> uint(2)));
        uint _417 = uint(int(uint(int(_415)) >> uint(2)));
        int _419 = int(_415) & 3;
        float _421 = (*spvDescriptorSet0.cp_c5)._m0[int(_417)][_419];
        int _423 = int(_415) + 1;
        uint _425 = uint(int(uint(_423) >> uint(2)));
        int _427 = _423 & 3;
        float _429 = (*spvDescriptorSet0.cp_c5)._m0[int(_425)][_427];
        int _431 = _68;
        int _433 = 1;
        int _435 = _56(_431, _433, (*spvDescriptorSet0.support_buffer));
        int _437 = as_type<int>(_421);
        int _439 = 1;
        int _441 = _56(_437, _439, (*spvDescriptorSet0.support_buffer));
        int3 _2200 = int3(_435, _441, 1);
        float3 _443 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2200.xy), uint(_2200.z), 0).xyz;
        float _445 = _443.x;
        float _447 = _443.y;
        float _449 = _443.z;
        int _451 = _68;
        int _453 = 1;
        int _455 = _56(_451, _453, (*spvDescriptorSet0.support_buffer));
        int _457 = as_type<int>(_429);
        int _459 = 1;
        int _461 = _56(_457, _459, (*spvDescriptorSet0.support_buffer));
        int3 _2218 = int3(_455, _461, 1);
        float3 _463 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2218.xy), uint(_2218.z), 0).xyz;
        float _465 = _463.x;
        float _467 = _463.y;
        float _469 = _463.z;
        int _471 = _68;
        int _473 = 1;
        int _475 = _56(_471, _473, (*spvDescriptorSet0.support_buffer));
        int _477 = as_type<int>(_421);
        int _479 = 1;
        int _481 = _56(_477, _479, (*spvDescriptorSet0.support_buffer));
        int3 _2236 = int3(_475, _481, 0);
        float3 _483 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2236.xy), uint(_2236.z), 0).xyz;
        float _485 = _483.x;
        float _487 = _483.y;
        float _489 = _483.z;
        int _491 = _68;
        int _493 = 1;
        int _495 = _56(_491, _493, (*spvDescriptorSet0.support_buffer));
        int _497 = as_type<int>(_429);
        int _499 = 1;
        int _501 = _56(_497, _499, (*spvDescriptorSet0.support_buffer));
        int3 _2254 = int3(_495, _501, 0);
        float3 _503 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2254.xy), uint(_2254.z), 0).xyz;
        float _505 = _503.x;
        float _507 = _503.y;
        float _509 = _503.z;
        int _511 = _68;
        int _513 = 1;
        int _515 = _56(_511, _513, (*spvDescriptorSet0.support_buffer));
        int _517 = as_type<int>(_421);
        int _519 = 1;
        int _521 = _56(_517, _519, (*spvDescriptorSet0.support_buffer));
        int3 _2272 = int3(_515, _521, 2);
        float3 _523 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2272.xy), uint(_2272.z), 0).xyz;
        float _525 = _523.x;
        float _527 = _523.y;
        float _529 = _523.z;
        int _531 = _68;
        int _533 = 1;
        int _535 = _56(_531, _533, (*spvDescriptorSet0.support_buffer));
        int _537 = as_type<int>(_429);
        int _539 = 1;
        int _541 = _56(_537, _539, (*spvDescriptorSet0.support_buffer));
        int3 _2290 = int3(_535, _541, 2);
        float3 _543 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2290.xy), uint(_2290.z), 0).xyz;
        float _545 = _543.x;
        float _547 = _543.y;
        float _549 = _543.z;
        int _551 = _103 + 24;
        uint _553 = uint(int(uint(_551) >> uint(2)));
        uint _555 = uint(int(uint(int(_553)) >> uint(2)));
        int _557 = int(_553) & 3;
        float _559 = (*spvDescriptorSet0.cp_c5)._m0[int(_555)][_557];
        int _561 = int(_553) + 1;
        uint _563 = uint(int(uint(_561) >> uint(2)));
        int _565 = _561 & 3;
        float _567 = (*spvDescriptorSet0.cp_c5)._m0[int(_563)][_565];
        int _569 = _103 + 20;
        uint _571 = uint(int(uint(_569) >> uint(2)));
        uint _573 = uint(int(uint(int(_571)) >> uint(2)));
        int _575 = int(_571) & 3;
        float _577 = (*spvDescriptorSet0.cp_c5)._m0[int(_573)][_575];
        float _579 = -_445;
        float _581 = _579 + _465;
        float _583 = -_449;
        float _585 = _583 + _469;
        float _587 = fma(_581, _559, _445);
        float _589 = -_447;
        float _591 = _589 + _467;
        float _593 = fma(_585, _559, _449);
        float _595 = _587 * _567;
        float _597 = fma(_591, _559, _447);
        float _599 = _593 * _567;
        float _601 = fma(_375, _577, _595);
        float _603 = _597 * _567;
        float _605 = fma(_377, _577, _599);
        float _607 = _601 * 0.15915493667125701904296875;
        float _609 = fma(_379, _577, _603);
        float _611 = _605 * 0.15915493667125701904296875;
        float _613 = _607 * 6.283185482025146484375;
        float _615 = sin(_613);
        float _617 = _609 * 0.15915493667125701904296875;
        float _619 = -_485;
        float _621 = _619 + _505;
        float _623 = -_529;
        float _625 = _623 + _549;
        float _627 = fma(_621, _559, _485);
        float _629 = fma(_625, _559, _529);
        float _631 = _607 * 6.283185482025146484375;
        float _633 = cos(_631);
        float _635 = _627 * _567;
        float _637 = fma(_381, _577, _635);
        float _639 = _611 * 6.283185482025146484375;
        float _641 = cos(_639);
        float _643 = _617 * 6.283185482025146484375;
        float _645 = sin(_643);
        float _647 = _611 * 6.283185482025146484375;
        float _649 = sin(_647);
        float _651 = _633 * _641;
        float _653 = _615 * _641;
        float _655 = _617 * 6.283185482025146484375;
        float _657 = cos(_655);
        float _659 = _615 * _645;
        float _661 = _649 * _633;
        float _663 = _615 * _649;
        float _665 = -_489;
        float _667 = _665 + _509;
        float _669 = -_653;
        float _671 = fma(_645, _661, _669);
        float _673 = fma(_645, _651, _663);
        float _675 = fma(_667, _559, _489);
        float _677 = _633 * _657;
        float _679 = _657 * _641;
        float _681 = _649 * _657;
        float _683 = _615 * _657;
        float _685 = fma(_649, _659, _651);
        float _687 = -_487;
        float _689 = _687 + _507;
        float _691 = -_525;
        float _693 = _691 + _545;
        float _695 = -_527;
        float _697 = _695 + _547;
        float _699 = -_661;
        float _701 = fma(_641, _659, _699);
        float _703 = fma(_689, _559, _487);
        float _705 = fma(_693, _559, _525);
        float _707 = fma(_697, _559, _527);
        float _709 = _675 * _567;
        float _711 = _703 * _567;
        float _713 = _705 * _567;
        float _715 = _707 * _567;
        float _717 = _629 * _567;
        float _719 = fma(_383, _577, _711);
        float _721 = fma(_385, _577, _709);
        float _723 = fma(_387, _577, _713);
        float _725 = fma(_389, _577, _715);
        float _727 = fma(_391, _577, _717);
        _409 = _719;
        _729 = _683;
        _411 = _637;
        _731 = _645;
        _733 = _681;
        _735 = _679;
        _737 = _701;
        _739 = _685;
        _741 = _721;
        _743 = _673;
        _745 = _671;
        _747 = _677;
        _749 = _723;
        _751 = _725;
        _753 = _727;
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
        _729 = _801;
        _731 = _787;
        _733 = _799;
        _735 = _797;
        _737 = _813;
        _739 = _815;
        _741 = _385;
        _743 = _805;
        _745 = _809;
        _747 = _793;
        _749 = _387;
        _751 = _389;
        _753 = _391;
    }
    _755 = false;
    float _817 = _409;
    float _819 = _729;
    float _821 = _411;
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
    float _847 = _817 * _819;
    float _849 = _821 * _823;
    bool _851 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _853 = _821 * _825;
    bool _855 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _857 = _821 * _827;
    float _859 = _817 * _829;
    float _861 = _817 * _831;
    float _863 = _833 * _835;
    float _865 = _833 * _837;
    float _867 = _833 * _839;
    if (!_855)
    {
        int _869 = _68 * 48;
        float _871 = -_849;
        float _873 = _871 + (-0.0);
        int _875 = _869 + 16;
        uint _877 = uint(int(uint(_869) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_877)] = as_type<uint>(_857);
        int _879 = _869 + 4;
        uint _881 = uint(int(uint(_879) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_881)] = as_type<uint>(_859);
        int _883 = _869 + 8;
        uint _885 = uint(int(uint(_883) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_885)] = as_type<uint>(_863);
        int _887 = _869 + 12;
        uint _889 = uint(int(uint(_887) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_889)] = as_type<uint>(_841);
        int _891 = _869 + 32;
        uint _893 = uint(int(uint(_875) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_893)] = as_type<uint>(_853);
        int _895 = _875 + 4;
        uint _897 = uint(int(uint(_895) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_897)] = as_type<uint>(_861);
        int _899 = _875 + 8;
        uint _901 = uint(int(uint(_899) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_901)] = as_type<uint>(_865);
        int _903 = _875 + 12;
        uint _905 = uint(int(uint(_903) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_905)] = as_type<uint>(_843);
        uint _907 = uint(int(uint(_891) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_907)] = as_type<uint>(_873);
        int _909 = _891 + 4;
        uint _911 = uint(int(uint(_909) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_911)] = as_type<uint>(_847);
        int _913 = _891 + 8;
        uint _915 = uint(int(uint(_913) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_915)] = as_type<uint>(_867);
        int _917 = _891 + 12;
        uint _919 = uint(int(uint(_917) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_919)] = as_type<uint>(_845);
    }
    int _921 = _68 * 112;
    bool _923 = !_851;
    float _1251;
    float _1253;
    float _1255;
    float _1257;
    float _1259;
    float _1261;
    float _1263;
    float _1265;
    float _1267;
    float _1269;
    float _1271;
    float _1273;
    if (!_923)
    {
        float _925 = -_849;
        float _927 = _925 + (-0.0);
        int _929 = 0;
        float _931 = _857;
        float _933 = _859;
        float _935 = _863;
        float _937 = _841;
        float _939 = _853;
        float _941 = _861;
        float _943 = _865;
        float _945 = _843;
        float _947 = _927;
        float _949 = _847;
        float _951 = _867;
        float _953 = _845;
        bool _955;
        int _1003;
        int _1013;
        int _1023;
        int _1033;
        int _1043;
        int _1053;
        int _1063;
        int _1073;
        int _1083;
        int _1093;
        int _1103;
        int _1113;
        int _1227;
        int _1231;
        int _1233;
        int _1237;
        float _1239;
        int _1241;
        float _1245;
        int _1247;
        int _1249;
        do
        {
            int _957 = _929;
            int _959 = as_type<int>(_931);
            int _961 = as_type<int>(_933);
            int _963 = as_type<int>(_935);
            int _965 = as_type<int>(_937);
            int _967 = as_type<int>(_939);
            int _969 = as_type<int>(_941);
            float _971 = _943;
            int _973 = as_type<int>(_945);
            int _975 = as_type<int>(_947);
            float _977 = _949;
            int _979 = as_type<int>(_951);
            int _981 = as_type<int>(_953);
            uint _983 = uint(int(uint(_921) >> uint(2)));
            uint _985 = uint(int(uint(int(_983)) >> uint(2)));
            int _987 = int(_983) & 3;
            float _989 = (*spvDescriptorSet0.cp_c6)._m0[int(_985)][_987];
            bool _991 = _68 != 0;
            int _993 = _957 + 1;
            bool _995 = uint(_993) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _997 = _959;
            int _999 = as_type<int>(_989);
            int _1001 = 31;
            int _2942 = _58(_997, _999, _1001, _1003, gl_SubgroupInvocationID);
            int _1005 = _2942;
            int _1007 = _961;
            int _1009 = as_type<int>(_989);
            int _1011 = 31;
            int _2946 = _58(_1007, _1009, _1011, _1013, gl_SubgroupInvocationID);
            int _1015 = _2946;
            int _1017 = _963;
            int _1019 = as_type<int>(_989);
            int _1021 = 31;
            int _2950 = _58(_1017, _1019, _1021, _1023, gl_SubgroupInvocationID);
            int _1025 = _2950;
            int _1027 = _965;
            int _1029 = as_type<int>(_989);
            int _1031 = 31;
            int _2954 = _58(_1027, _1029, _1031, _1033, gl_SubgroupInvocationID);
            int _1035 = _2954;
            int _1037 = _967;
            int _1039 = as_type<int>(_989);
            int _1041 = 31;
            int _2958 = _58(_1037, _1039, _1041, _1043, gl_SubgroupInvocationID);
            int _1045 = _2958;
            int _1047 = _969;
            int _1049 = as_type<int>(_989);
            int _1051 = 31;
            int _2962 = _58(_1047, _1049, _1051, _1053, gl_SubgroupInvocationID);
            int _1055 = _2962;
            int _1057 = as_type<int>(_971);
            int _1059 = as_type<int>(_989);
            int _1061 = 31;
            int _2967 = _58(_1057, _1059, _1061, _1063, gl_SubgroupInvocationID);
            int _1065 = _2967;
            int _1067 = _973;
            int _1069 = as_type<int>(_989);
            int _1071 = 31;
            int _2971 = _58(_1067, _1069, _1071, _1073, gl_SubgroupInvocationID);
            int _1075 = _2971;
            int _1077 = _975;
            int _1079 = as_type<int>(_989);
            int _1081 = 31;
            int _2975 = _58(_1077, _1079, _1081, _1083, gl_SubgroupInvocationID);
            int _1085 = _2975;
            int _1087 = as_type<int>(_977);
            int _1089 = as_type<int>(_989);
            int _1091 = 31;
            int _2980 = _58(_1087, _1089, _1091, _1093, gl_SubgroupInvocationID);
            int _1095 = _2980;
            int _1097 = _979;
            int _1099 = as_type<int>(_989);
            int _1101 = 31;
            int _2984 = _58(_1097, _1099, _1101, _1103, gl_SubgroupInvocationID);
            int _1105 = _2984;
            int _1107 = _981;
            int _1109 = as_type<int>(_989);
            int _1111 = 31;
            int _2988 = _58(_1107, _1109, _1111, _1113, gl_SubgroupInvocationID);
            int _1115 = _2988;
            bool _1117 = !_991;
            _929 = _993;
            int _1119 = _959;
            int _1121 = _961;
            int _1123 = _963;
            int _1125 = _965;
            int _1127 = _967;
            int _1129 = _969;
            float _1131 = _971;
            int _1133 = _973;
            int _1135 = _975;
            float _1137 = _977;
            int _1139 = _979;
            int _1141 = _981;
            if (!_1117)
            {
                float _1143 = as_type<float>(_1015) * _843;
                float _1145 = _853 * as_type<float>(_1015);
                float _1147 = _861 * as_type<float>(_1015);
                float _1149 = _865 * as_type<float>(_1015);
                float _1151 = fma(as_type<float>(_1005), _841, _1143);
                float _1153 = _853 * as_type<float>(_1055);
                float _1155 = _861 * as_type<float>(_1055);
                float _1157 = _865 * as_type<float>(_1055);
                float _1159 = as_type<float>(_1055) * _843;
                float _1161 = fma(_857, as_type<float>(_1005), _1145);
                float _1163 = fma(_859, as_type<float>(_1005), _1147);
                float _1165 = fma(_863, as_type<float>(_1005), _1149);
                float _1167 = fma(_857, as_type<float>(_1045), _1153);
                float _1169 = as_type<float>(_1095) * _843;
                float _1171 = fma(_859, as_type<float>(_1045), _1155);
                float _1173 = fma(_863, as_type<float>(_1045), _1157);
                float _1175 = _853 * as_type<float>(_1095);
                float _1177 = fma(as_type<float>(_1045), _841, _1159);
                float _1179 = _861 * as_type<float>(_1095);
                float _1181 = _865 * as_type<float>(_1095);
                float _1183 = fma(as_type<float>(_1085), _841, _1169);
                float _1185 = fma(_857, as_type<float>(_1085), _1175);
                float _1187 = -_849;
                float _1189 = fma(_1187, as_type<float>(_1025), _1161);
                float _1191 = fma(_867, as_type<float>(_1025), _1165);
                float _1193 = fma(_859, as_type<float>(_1085), _1179);
                float _1195 = fma(_863, as_type<float>(_1085), _1181);
                float _1197 = -_849;
                float _1199 = fma(_1197, as_type<float>(_1065), _1167);
                float _1201 = fma(_847, as_type<float>(_1065), _1171);
                float _1203 = fma(_867, as_type<float>(_1065), _1173);
                float _1205 = fma(as_type<float>(_1025), _845, _1151);
                float _1207 = fma(as_type<float>(_1065), _845, _1177);
                float _1209 = fma(as_type<float>(_1105), _845, _1183);
                float _1211 = fma(_847, as_type<float>(_1025), _1163);
                float _1213 = fma(_847, as_type<float>(_1105), _1193);
                float _1215 = -_849;
                float _1217 = fma(_1215, as_type<float>(_1105), _1185);
                float _1219 = fma(_867, as_type<float>(_1105), _1195);
                float _1221 = as_type<float>(_1035) + _1205;
                float _1223 = as_type<float>(_1075) + _1207;
                float _1225 = as_type<float>(_1115) + _1209;
                _1119 = as_type<int>(_1189);
                _1121 = as_type<int>(_1211);
                _1123 = as_type<int>(_1191);
                _1125 = as_type<int>(_1221);
                _1127 = as_type<int>(_1199);
                _1129 = as_type<int>(_1201);
                _1131 = _1203;
                _1133 = as_type<int>(_1223);
                _1135 = as_type<int>(_1217);
                _1137 = _1213;
                _1139 = as_type<int>(_1219);
                _1141 = as_type<int>(_1225);
            }
            _1227 = _1119;
            int _1229 = _1121;
            _1231 = _1123;
            _1233 = _1125;
            int _1235 = _1127;
            _1237 = _1129;
            _1239 = _1131;
            _1241 = _1133;
            int _1243 = _1135;
            _1245 = _1137;
            _1247 = _1139;
            _1249 = _1141;
            _955 = !_995;
            _931 = as_type<float>(_1227);
            _933 = as_type<float>(_1229);
            _935 = as_type<float>(_1231);
            _937 = as_type<float>(_1233);
            _939 = as_type<float>(_1235);
            _941 = as_type<float>(_1237);
            _943 = _1239;
            _945 = as_type<float>(_1241);
            _947 = as_type<float>(_1243);
            _949 = _1245;
            _951 = as_type<float>(_1247);
            _953 = as_type<float>(_1249);
            _1251 = as_type<float>(_1229);
            _1253 = as_type<float>(_1235);
            _1255 = as_type<float>(_1243);
        } while (_955);
        _1257 = as_type<float>(_1237);
        _1259 = _1245;
        _1261 = as_type<float>(_1227);
        _1263 = _1239;
        _1265 = as_type<float>(_1241);
        _1267 = as_type<float>(_1231);
        _1269 = as_type<float>(_1247);
        _1271 = as_type<float>(_1233);
        _1273 = as_type<float>(_1249);
        _1275 = true;
    }
    else
    {
        float _1277 = -_849;
        float _1279 = _1277 + (-0.0);
        _1251 = _859;
        _1257 = _861;
        _1259 = _847;
        _1261 = _857;
        _1253 = _853;
        _1255 = _1279;
        _1263 = _865;
        _1265 = _843;
        _1267 = _863;
        _1269 = _867;
        _1271 = _841;
        _1273 = _845;
    }
    _1275 = false;
    float _1281 = _1251;
    float _1283 = _1257;
    float _1285 = _1259;
    float _1287 = _1261;
    float _1289 = _1253;
    float _1291 = _1255;
    float _1293 = _1263;
    float _1295 = _1265;
    float _1297 = _1267;
    float _1299 = _1269;
    float _1301 = _1271;
    float _1303 = _1273;
    int _1305 = _921 + 80;
    uint _1307 = uint(int(uint(_1305) >> uint(2)));
    uint _1309 = uint(int(uint(int(_1307)) >> uint(2)));
    int _1311 = int(_1307) & 3;
    float _1313 = (*spvDescriptorSet0.cp_c6)._m0[int(_1309)][_1311];
    int _1315 = int(_1307) + 1;
    uint _1317 = uint(int(uint(_1315) >> uint(2)));
    int _1319 = _1315 & 3;
    float _1321 = (*spvDescriptorSet0.cp_c6)._m0[int(_1317)][_1319];
    int _1323 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1325 = _1323 + _68;
    int _1327 = _921 + 64;
    uint _1329 = uint(int(uint(_1327) >> uint(2)));
    uint _1331 = uint(int(uint(int(_1329)) >> uint(2)));
    int _1333 = int(_1329) & 3;
    float _1335 = (*spvDescriptorSet0.cp_c6)._m0[int(_1331)][_1333];
    int _1337 = int(_1329) + 1;
    uint _1339 = uint(int(uint(_1337) >> uint(2)));
    int _1341 = _1337 & 3;
    float _1343 = (*spvDescriptorSet0.cp_c6)._m0[int(_1339)][_1341];
    int _1345 = _1325 * 48;
    int _1347 = _921 + 88;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    uint _1351 = uint(int(uint(int(_1349)) >> uint(2)));
    int _1353 = int(_1349) & 3;
    float _1355 = (*spvDescriptorSet0.cp_c6)._m0[int(_1351)][_1353];
    int _1357 = int(_1349) + 1;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    int _1361 = _1357 & 3;
    float _1363 = (*spvDescriptorSet0.cp_c6)._m0[int(_1359)][_1361];
    int _1365 = _921 + 72;
    uint _1367 = uint(int(uint(_1365) >> uint(2)));
    uint _1369 = uint(int(uint(int(_1367)) >> uint(2)));
    int _1371 = int(_1367) & 3;
    float _1373 = (*spvDescriptorSet0.cp_c6)._m0[int(_1369)][_1371];
    int _1375 = int(_1367) + 1;
    uint _1377 = uint(int(uint(_1375) >> uint(2)));
    int _1379 = _1375 & 3;
    float _1381 = (*spvDescriptorSet0.cp_c6)._m0[int(_1377)][_1379];
    int _1383 = _921 + 104;
    uint _1385 = uint(int(uint(_1383) >> uint(2)));
    uint _1387 = uint(int(uint(int(_1385)) >> uint(2)));
    int _1389 = int(_1385) & 3;
    float _1391 = (*spvDescriptorSet0.cp_c6)._m0[int(_1387)][_1389];
    int _1393 = int(_1385) + 1;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    int _1397 = _1393 & 3;
    float _1399 = (*spvDescriptorSet0.cp_c6)._m0[int(_1395)][_1397];
    int _1401 = _921 + 96;
    uint _1403 = uint(int(uint(_1401) >> uint(2)));
    uint _1405 = uint(int(uint(int(_1403)) >> uint(2)));
    int _1407 = int(_1403) & 3;
    float _1409 = (*spvDescriptorSet0.cp_c6)._m0[int(_1405)][_1407];
    int _1411 = int(_1403) + 1;
    uint _1413 = uint(int(uint(_1411) >> uint(2)));
    int _1415 = _1411 & 3;
    float _1417 = (*spvDescriptorSet0.cp_c6)._m0[int(_1413)][_1415];
    float _1419 = _1281 * _1313;
    float _1421 = _1283 * _1313;
    float _1423 = _1285 * _1313;
    int _1425 = _921 + 16;
    uint _1427 = uint(int(uint(_1425) >> uint(2)));
    uint _1429 = uint(int(uint(int(_1427)) >> uint(2)));
    int _1431 = int(_1427) & 3;
    float _1433 = (*spvDescriptorSet0.cp_c6)._m0[int(_1429)][_1431];
    int _1435 = int(_1427) + 1;
    uint _1437 = uint(int(uint(_1435) >> uint(2)));
    int _1439 = _1435 & 3;
    float _1441 = (*spvDescriptorSet0.cp_c6)._m0[int(_1437)][_1439];
    float _1443 = _1285 * _1321;
    float _1445 = fma(_1287, _1335, _1419);
    float _1447 = fma(_1289, _1335, _1421);
    float _1449 = fma(_1291, _1335, _1423);
    float _1451 = _1281 * _1321;
    int _1453 = _921 + 32;
    uint _1455 = uint(int(uint(_1453) >> uint(2)));
    uint _1457 = uint(int(uint(int(_1455)) >> uint(2)));
    int _1459 = int(_1455) & 3;
    float _1461 = (*spvDescriptorSet0.cp_c6)._m0[int(_1457)][_1459];
    int _1463 = int(_1455) + 1;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    int _1467 = _1463 & 3;
    float _1469 = (*spvDescriptorSet0.cp_c6)._m0[int(_1465)][_1467];
    float _1471 = _1283 * _1321;
    float _1473 = fma(_1291, _1343, _1443);
    float _1475 = fma(_1287, _1343, _1451);
    float _1477 = _1281 * _1355;
    float _1479 = _1281 * _1363;
    float _1481 = _1283 * _1355;
    float _1483 = _1283 * _1363;
    int _1485 = _921 + 48;
    uint _1487 = uint(int(uint(_1485) >> uint(2)));
    uint _1489 = uint(int(uint(int(_1487)) >> uint(2)));
    int _1491 = int(_1487) & 3;
    float _1493 = (*spvDescriptorSet0.cp_c6)._m0[int(_1489)][_1491];
    int _1495 = int(_1487) + 1;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    int _1499 = _1495 & 3;
    float _1501 = (*spvDescriptorSet0.cp_c6)._m0[int(_1497)][_1499];
    float _1503 = _1285 * _1355;
    float _1505 = _1285 * _1363;
    float _1507 = fma(_1289, _1343, _1471);
    float _1509 = fma(_1287, _1373, _1477);
    float _1511 = fma(_1287, _1381, _1479);
    float _1513 = fma(_1289, _1373, _1481);
    float _1515 = fma(_1289, _1381, _1483);
    int _1517 = _921 + 24;
    uint _1519 = uint(int(uint(_1517) >> uint(2)));
    uint _1521 = uint(int(uint(int(_1519)) >> uint(2)));
    int _1523 = int(_1519) & 3;
    float _1525 = (*spvDescriptorSet0.cp_c6)._m0[int(_1521)][_1523];
    int _1527 = int(_1519) + 1;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    int _1531 = _1527 & 3;
    float _1533 = (*spvDescriptorSet0.cp_c6)._m0[int(_1529)][_1531];
    float _1535 = fma(_1291, _1373, _1503);
    float _1537 = fma(_1291, _1381, _1505);
    float _1539 = fma(_1293, _1399, _1515);
    int _1541 = _921 + 40;
    uint _1543 = uint(int(uint(_1541) >> uint(2)));
    uint _1545 = uint(int(uint(int(_1543)) >> uint(2)));
    int _1547 = int(_1543) & 3;
    float _1549 = (*spvDescriptorSet0.cp_c6)._m0[int(_1545)][_1547];
    int _1551 = int(_1543) + 1;
    uint _1553 = uint(int(uint(_1551) >> uint(2)));
    int _1555 = _1551 & 3;
    float _1557 = (*spvDescriptorSet0.cp_c6)._m0[int(_1553)][_1555];
    float _1559 = _1539 + _1295;
    float _1561 = fma(_1297, _1409, _1445);
    float _1563 = fma(_1293, _1409, _1447);
    float _1565 = fma(_1297, _1417, _1475);
    float _1567 = fma(_1297, _1391, _1509);
    int _1569 = _921 + 56;
    uint _1571 = uint(int(uint(_1569) >> uint(2)));
    uint _1573 = uint(int(uint(int(_1571)) >> uint(2)));
    int _1575 = int(_1571) & 3;
    float _1577 = (*spvDescriptorSet0.cp_c6)._m0[int(_1573)][_1575];
    int _1579 = int(_1571) + 1;
    uint _1581 = uint(int(uint(_1579) >> uint(2)));
    int _1583 = _1579 & 3;
    float _1585 = (*spvDescriptorSet0.cp_c6)._m0[int(_1581)][_1583];
    float _1587 = fma(_1297, _1399, _1511);
    float _1589 = fma(_1299, _1409, _1449);
    float _1591 = fma(_1299, _1399, _1537);
    float _1593 = fma(_1293, _1417, _1507);
    float _1595 = fma(_1293, _1391, _1513);
    float _1597 = fma(_1299, _1391, _1535);
    float _1599 = _1587 + _1301;
    float _1601 = _1591 + _1303;
    float _1603 = _1559 * _1441;
    float _1605 = _1563 * _1441;
    float _1607 = _1593 * _1441;
    float _1609 = _1595 * _1441;
    float _1611 = fma(_1599, _1433, _1603);
    float _1613 = fma(_1561, _1433, _1605);
    float _1615 = fma(_1565, _1433, _1607);
    float _1617 = _1559 * _1469;
    float _1619 = fma(_1567, _1433, _1609);
    float _1621 = _1563 * _1469;
    float _1623 = fma(_1299, _1417, _1473);
    float _1625 = _1593 * _1469;
    float _1627 = _1595 * _1469;
    float _1629 = fma(_1599, _1461, _1617);
    float _1631 = fma(_1561, _1461, _1621);
    float _1633 = _1559 * _1501;
    float _1635 = _1563 * _1501;
    float _1637 = _1593 * _1501;
    float _1639 = _1595 * _1501;
    float _1641 = fma(_1599, _1493, _1633);
    float _1643 = fma(_1565, _1461, _1625);
    float _1645 = fma(_1567, _1461, _1627);
    float _1647 = fma(_1561, _1493, _1635);
    float _1649 = fma(_1601, _1525, _1611);
    float _1651 = fma(_1565, _1493, _1637);
    float _1653 = fma(_1567, _1493, _1639);
    float _1655 = fma(_1589, _1525, _1613);
    float _1657 = _1649 + _1533;
    float _1659 = fma(_1623, _1525, _1615);
    float _1661 = fma(_1597, _1525, _1619);
    float _1663 = fma(_1601, _1549, _1629);
    float _1665 = fma(_1589, _1549, _1631);
    float _1667 = fma(_1623, _1549, _1643);
    int _1669 = _1345 + 16;
    float _1671 = fma(_1597, _1549, _1645);
    float _1673 = _1663 + _1557;
    int _1675 = _1345 + 32;
    float _1677 = fma(_1601, _1577, _1641);
    float _1679 = fma(_1589, _1577, _1647);
    float _1681 = fma(_1623, _1577, _1651);
    float _1683 = fma(_1597, _1577, _1653);
    float _1685 = _1677 + _1585;
    int _1687 = _1345 + 48;
    uint _1689 = uint(int(uint(_1669) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1689)] = as_type<uint>(_1655);
    int _1691 = _1669 + 4;
    uint _1693 = uint(int(uint(_1691) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1693)] = as_type<uint>(_1659);
    int _1695 = _1669 + 8;
    uint _1697 = uint(int(uint(_1695) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1697)] = as_type<uint>(_1661);
    int _1699 = _1669 + 12;
    uint _1701 = uint(int(uint(_1699) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1701)] = as_type<uint>(_1657);
    uint _1703 = uint(int(uint(_1675) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1703)] = as_type<uint>(_1665);
    int _1705 = _1675 + 4;
    uint _1707 = uint(int(uint(_1705) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1707)] = as_type<uint>(_1667);
    int _1709 = _1675 + 8;
    uint _1711 = uint(int(uint(_1709) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1711)] = as_type<uint>(_1671);
    int _1713 = _1675 + 12;
    uint _1715 = uint(int(uint(_1713) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1715)] = as_type<uint>(_1673);
    uint _1717 = uint(int(uint(_1687) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1717)] = as_type<uint>(_1679);
    int _1719 = _1687 + 4;
    uint _1721 = uint(int(uint(_1719) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1721)] = as_type<uint>(_1681);
    int _1723 = _1687 + 8;
    uint _1725 = uint(int(uint(_1723) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1725)] = as_type<uint>(_1683);
    int _1727 = _1687 + 12;
    uint _1729 = uint(int(uint(_1727) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1729)] = as_type<uint>(_1685);
}

