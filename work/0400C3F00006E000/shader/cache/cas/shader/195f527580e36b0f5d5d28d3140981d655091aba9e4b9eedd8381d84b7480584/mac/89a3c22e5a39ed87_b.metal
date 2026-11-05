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
int _58(thread const int& _4357, thread const int& _4358, constant _10& support_buffer)
{
    int _4361 = 1 + _4358;
    float _4363 = support_buffer._m5[_4361].x;
    bool _4365 = _4363 == 1.0;
    if (_4365)
    {
        return _4357;
    }
    float _4367 = float(_4357);
    float _4369 = _4367 * _4363;
    int _4371 = int(_4369);
    return _4371;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1293 = false;
    bool _765 = false;
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
    float _119 = 0.0;
    float _121 = 0.0;
    if (!_117)
    {
        _119 = 0.0;
        _121 = 0.0;
    }
    float _123 = _119;
    float _125 = _121;
    float _127 = 0.0;
    float _129 = _123;
    float _131 = _125;
    if (!_117)
    {
        _127 = 0.0;
    }
    float _133 = _127;
    float _135 = 0.0;
    float _137 = 0.0;
    float _139 = _133;
    if (!_117)
    {
        _135 = 0.0;
        _137 = 0.0;
    }
    float _141 = _135;
    float _143 = _137;
    float _145 = 0.0;
    float _147 = _141;
    float _149 = _143;
    if (!_117)
    {
        _145 = 0.0;
    }
    float _151 = _145;
    float _153 = 0.0;
    float _155 = _151;
    if (!_117)
    {
        _153 = 0.0;
    }
    float _157 = _153;
    float _159 = 0.0;
    float _161 = _157;
    if (!_117)
    {
        _159 = 0.0;
    }
    float _163 = _159;
    float _165 = _163;
    if (!_117)
    {
        _74 = 0.0;
    }
    float _167 = _74;
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
        int _193 = _58(_189, _191, (*spvDescriptorSet0.support_buffer));
        int _195 = as_type<int>(_179);
        int _197 = 0;
        int _199 = _58(_195, _197, (*spvDescriptorSet0.support_buffer));
        int3 _1930 = int3(_193, _199, 1);
        float3 _203 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1930.xy), uint(_1930.z), 0).xyz;
        float _205 = _203.x;
        float _207 = _203.y;
        float _209 = _203.z;
        int _211 = _68;
        int _213 = 0;
        int _215 = _58(_211, _213, (*spvDescriptorSet0.support_buffer));
        int _217 = as_type<int>(_187);
        int _219 = 0;
        int _221 = _58(_217, _219, (*spvDescriptorSet0.support_buffer));
        int3 _1948 = int3(_215, _221, 1);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1948.xy), uint(_1948.z), 0).xyz;
        float _225 = _223.x;
        float _227 = _223.y;
        float _229 = _223.z;
        int _231 = _68;
        int _233 = 0;
        int _235 = _58(_231, _233, (*spvDescriptorSet0.support_buffer));
        int _237 = as_type<int>(_179);
        int _239 = 0;
        int _241 = _58(_237, _239, (*spvDescriptorSet0.support_buffer));
        int3 _1966 = int3(_235, _241, 0);
        float3 _243 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1966.xy), uint(_1966.z), 0).xyz;
        float _245 = _243.x;
        float _247 = _243.y;
        float _249 = _243.z;
        int _251 = _68;
        int _253 = 0;
        int _255 = _58(_251, _253, (*spvDescriptorSet0.support_buffer));
        int _257 = as_type<int>(_187);
        int _259 = 0;
        int _261 = _58(_257, _259, (*spvDescriptorSet0.support_buffer));
        int3 _1984 = int3(_255, _261, 0);
        float3 _263 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1984.xy), uint(_1984.z), 0).xyz;
        float _265 = _263.x;
        float _267 = _263.y;
        float _269 = _263.z;
        int _271 = _68;
        int _273 = 0;
        int _275 = _58(_271, _273, (*spvDescriptorSet0.support_buffer));
        int _277 = as_type<int>(_179);
        int _279 = 0;
        int _281 = _58(_277, _279, (*spvDescriptorSet0.support_buffer));
        int3 _2002 = int3(_275, _281, 2);
        float3 _283 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2002.xy), uint(_2002.z), 0).xyz;
        float _285 = _283.x;
        float _287 = _283.y;
        float _289 = _283.z;
        int _291 = _68;
        int _293 = 0;
        int _295 = _58(_291, _293, (*spvDescriptorSet0.support_buffer));
        int _297 = as_type<int>(_187);
        int _299 = 0;
        int _301 = _58(_297, _299, (*spvDescriptorSet0.support_buffer));
        int3 _2020 = int3(_295, _301, 2);
        float3 _303 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2020.xy), uint(_2020.z), 0).xyz;
        float _305 = _303.x;
        float _307 = _303.y;
        float _309 = _303.z;
        int _311 = _103 + 16;
        uint _313 = uint(int(uint(_311) >> uint(2)));
        uint _315 = uint(int(uint(int(_313)) >> uint(2)));
        int _317 = int(_313) & 3;
        float _319 = (*spvDescriptorSet0.cp_c5)._m0[int(_315)][_317];
        float _321 = -_205;
        float _323 = _321 + _225;
        float _325 = -_209;
        float _327 = _325 + _229;
        float _329 = -_247;
        float _331 = _329 + _267;
        float _333 = -_207;
        float _335 = _333 + _227;
        float _337 = fma(_323, _319, _205);
        float _339 = fma(_327, _319, _209);
        float _341 = -_245;
        float _343 = _341 + _265;
        float _345 = -_249;
        float _347 = _345 + _269;
        float _349 = -_285;
        float _351 = _349 + _305;
        float _353 = -_287;
        float _355 = _353 + _307;
        float _357 = -_289;
        float _359 = _357 + _309;
        float _361 = fma(_331, _319, _247);
        float _363 = fma(_335, _319, _207);
        float _365 = fma(_343, _319, _245);
        float _367 = fma(_347, _319, _249);
        float _369 = fma(_351, _319, _285);
        float _371 = fma(_355, _319, _287);
        float _373 = fma(_359, _319, _289);
        _171 = _339;
        _147 = _337;
        _149 = _363;
        _129 = _365;
        _165 = _373;
        _161 = _371;
        _131 = _361;
        _139 = _367;
        _155 = _369;
    }
    float _375 = _171;
    float _377 = _147;
    float _379 = _149;
    float _381 = _129;
    float _383 = _165;
    float _385 = _161;
    float _387 = _131;
    float _389 = _139;
    float _391 = _155;
    int _393 = _103 + 36;
    uint _395 = uint(int(uint(_393) >> uint(2)));
    uint _397 = uint(int(uint(int(_395)) >> uint(2)));
    int _399 = int(_395) & 3;
    float _401 = (*spvDescriptorSet0.cp_c5)._m0[int(_397)][_399];
    int _403 = _101 & as_type<int>(_401);
    bool _405 = _403 != 0;
    bool _407 = !_405;
    float _409 = _381;
    float _411 = _391;
    float _413 = _385;
    float _415 = _383;
    float _417 = _387;
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
    float _755;
    float _757;
    float _759;
    float _761;
    float _763;
    if (!_407)
    {
        int _419 = _103 + 8;
        uint _421 = uint(int(uint(_419) >> uint(2)));
        uint _423 = uint(int(uint(int(_421)) >> uint(2)));
        int _425 = int(_421) & 3;
        float _427 = (*spvDescriptorSet0.cp_c5)._m0[int(_423)][_425];
        int _429 = int(_421) + 1;
        uint _431 = uint(int(uint(_429) >> uint(2)));
        int _433 = _429 & 3;
        float _435 = (*spvDescriptorSet0.cp_c5)._m0[int(_431)][_433];
        int _437 = _68;
        int _439 = 1;
        int _441 = _58(_437, _439, (*spvDescriptorSet0.support_buffer));
        int _443 = as_type<int>(_427);
        int _445 = 1;
        int _447 = _58(_443, _445, (*spvDescriptorSet0.support_buffer));
        int3 _2222 = int3(_441, _447, 1);
        float3 _449 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2222.xy), uint(_2222.z), 0).xyz;
        float _451 = _449.x;
        float _453 = _449.y;
        float _455 = _449.z;
        int _457 = _68;
        int _459 = 1;
        int _461 = _58(_457, _459, (*spvDescriptorSet0.support_buffer));
        int _463 = as_type<int>(_435);
        int _465 = 1;
        int _467 = _58(_463, _465, (*spvDescriptorSet0.support_buffer));
        int3 _2240 = int3(_461, _467, 1);
        float3 _469 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2240.xy), uint(_2240.z), 0).xyz;
        float _471 = _469.x;
        float _473 = _469.y;
        float _475 = _469.z;
        int _477 = _68;
        int _479 = 1;
        int _481 = _58(_477, _479, (*spvDescriptorSet0.support_buffer));
        int _483 = as_type<int>(_427);
        int _485 = 1;
        int _487 = _58(_483, _485, (*spvDescriptorSet0.support_buffer));
        int3 _2258 = int3(_481, _487, 0);
        float3 _489 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2258.xy), uint(_2258.z), 0).xyz;
        float _491 = _489.x;
        float _493 = _489.y;
        float _495 = _489.z;
        int _497 = _68;
        int _499 = 1;
        int _501 = _58(_497, _499, (*spvDescriptorSet0.support_buffer));
        int _503 = as_type<int>(_435);
        int _505 = 1;
        int _507 = _58(_503, _505, (*spvDescriptorSet0.support_buffer));
        int3 _2276 = int3(_501, _507, 0);
        float3 _509 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2276.xy), uint(_2276.z), 0).xyz;
        float _511 = _509.x;
        float _513 = _509.y;
        float _515 = _509.z;
        int _517 = _68;
        int _519 = 1;
        int _521 = _58(_517, _519, (*spvDescriptorSet0.support_buffer));
        int _523 = as_type<int>(_427);
        int _525 = 1;
        int _527 = _58(_523, _525, (*spvDescriptorSet0.support_buffer));
        int3 _2294 = int3(_521, _527, 2);
        float3 _529 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2294.xy), uint(_2294.z), 0).xyz;
        float _531 = _529.x;
        float _533 = _529.y;
        float _535 = _529.z;
        int _537 = _68;
        int _539 = 1;
        int _541 = _58(_537, _539, (*spvDescriptorSet0.support_buffer));
        int _543 = as_type<int>(_435);
        int _545 = 1;
        int _547 = _58(_543, _545, (*spvDescriptorSet0.support_buffer));
        int3 _2312 = int3(_541, _547, 2);
        float3 _549 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2312.xy), uint(_2312.z), 0).xyz;
        float _551 = _549.x;
        float _553 = _549.y;
        float _555 = _549.z;
        int _557 = _103 + 24;
        uint _559 = uint(int(uint(_557) >> uint(2)));
        uint _561 = uint(int(uint(int(_559)) >> uint(2)));
        int _563 = int(_559) & 3;
        float _565 = (*spvDescriptorSet0.cp_c5)._m0[int(_561)][_563];
        int _567 = int(_559) + 1;
        uint _569 = uint(int(uint(_567) >> uint(2)));
        int _571 = _567 & 3;
        float _573 = (*spvDescriptorSet0.cp_c5)._m0[int(_569)][_571];
        int _575 = _103 + 20;
        uint _577 = uint(int(uint(_575) >> uint(2)));
        uint _579 = uint(int(uint(int(_577)) >> uint(2)));
        int _581 = int(_577) & 3;
        float _583 = (*spvDescriptorSet0.cp_c5)._m0[int(_579)][_581];
        float _585 = -_455;
        float _587 = _585 + _475;
        float _589 = -_451;
        float _591 = _589 + _471;
        float _593 = fma(_587, _565, _455);
        float _595 = fma(_591, _565, _451);
        float _597 = _593 * _573;
        float _599 = _595 * _573;
        float _601 = fma(_375, _583, _597);
        float _603 = -_453;
        float _605 = _603 + _473;
        float _607 = fma(_377, _583, _599);
        float _609 = _601 * 0.15915493667125701904296875;
        float _611 = fma(_605, _565, _453);
        float _613 = _607 * 0.15915493667125701904296875;
        float _615 = _609 * 6.283185482025146484375;
        float _617 = sin(_615);
        float _619 = _611 * _573;
        float _621 = fma(_379, _583, _619);
        float _623 = _613 * 6.283185482025146484375;
        float _625 = cos(_623);
        float _627 = _621 * 0.15915493667125701904296875;
        float _629 = -_491;
        float _631 = _629 + _511;
        float _633 = -_495;
        float _635 = _633 + _515;
        float _637 = -_535;
        float _639 = _637 + _555;
        float _641 = fma(_631, _565, _491);
        float _643 = fma(_635, _565, _495);
        float _645 = _609 * 6.283185482025146484375;
        float _647 = cos(_645);
        float _649 = -_533;
        float _651 = _649 + _553;
        float _653 = _641 * _573;
        float _655 = fma(_639, _565, _535);
        float _657 = _643 * _573;
        float _659 = fma(_651, _565, _533);
        float _661 = fma(_381, _583, _653);
        float _663 = _655 * _573;
        float _665 = _627 * 6.283185482025146484375;
        float _667 = cos(_665);
        float _669 = _617 * _625;
        float _671 = _659 * _573;
        float _673 = fma(_383, _583, _663);
        float _675 = fma(_385, _583, _671);
        float _677 = _613 * 6.283185482025146484375;
        float _679 = sin(_677);
        float _681 = _625 * _647;
        float _683 = _627 * 6.283185482025146484375;
        float _685 = sin(_683);
        float _687 = _625 * _667;
        float _689 = _667 * _647;
        float _691 = _617 * _667;
        float _693 = _679 * _667;
        float _695 = _679 * _617;
        float _697 = -_493;
        float _699 = _697 + _513;
        float _701 = fma(_699, _565, _493);
        float _703 = _679 * _685;
        float _705 = _679 * _647;
        float _707 = -_669;
        float _709 = fma(_647, _703, _707);
        float _711 = -_705;
        float _713 = fma(_685, _669, _711);
        float _715 = -_531;
        float _717 = _715 + _551;
        float _719 = fma(_617, _703, _681);
        float _721 = fma(_685, _681, _695);
        float _723 = _701 * _573;
        float _725 = fma(_717, _565, _531);
        float _727 = fma(_387, _583, _723);
        float _729 = _725 * _573;
        float _731 = fma(_389, _583, _657);
        float _733 = fma(_391, _583, _729);
        _409 = _661;
        _735 = _685;
        _737 = _689;
        _739 = _691;
        _741 = _727;
        _743 = _709;
        _745 = _719;
        _747 = _693;
        _749 = _731;
        _751 = _721;
        _753 = _713;
        _755 = _687;
        _411 = _733;
        _413 = _675;
        _415 = _673;
        _417 = _729;
        _757 = _671;
        _759 = _725;
        _761 = _663;
        _763 = _695;
        _765 = true;
    }
    else
    {
        float _767 = _377 * 0.15915493667125701904296875;
        float _769 = _375 * 0.15915493667125701904296875;
        float _771 = _379 * 0.15915493667125701904296875;
        float _773 = _767 * 6.283185482025146484375;
        float _775 = sin(_773);
        float _777 = _767 * 6.283185482025146484375;
        float _779 = cos(_777);
        float _781 = _769 * 6.283185482025146484375;
        float _783 = sin(_781);
        float _785 = _769 * 6.283185482025146484375;
        float _787 = cos(_785);
        float _789 = _771 * 6.283185482025146484375;
        float _791 = cos(_789);
        float _793 = _783 * _779;
        float _795 = _775 * _783;
        float _797 = _771 * 6.283185482025146484375;
        float _799 = sin(_797);
        float _801 = _779 * _787;
        float _803 = _779 * _791;
        float _805 = _791 * _787;
        float _807 = _783 * _791;
        float _809 = _775 * _791;
        float _811 = _775 * _787;
        float _813 = _775 * _799;
        float _815 = -_793;
        float _817 = fma(_787, _813, _815);
        float _819 = fma(_783, _813, _801);
        float _821 = -_811;
        float _823 = fma(_799, _793, _821);
        float _825 = fma(_799, _801, _795);
        _735 = _799;
        _737 = _805;
        _739 = _807;
        _741 = _387;
        _743 = _817;
        _745 = _819;
        _747 = _809;
        _749 = _389;
        _751 = _825;
        _753 = _823;
        _755 = _803;
        _757 = _771;
        _759 = _801;
        _761 = _769;
        _763 = _793;
    }
    _765 = false;
    float _827 = _409;
    float _829 = _735;
    float _831 = _737;
    float _833 = _739;
    float _835 = _741;
    float _837 = _743;
    float _839 = _745;
    float _841 = _747;
    float _843 = _749;
    float _845 = _751;
    float _847 = _753;
    float _849 = _755;
    float _851 = _411;
    float _853 = _413;
    float _855 = _415;
    float _857 = _417;
    float _859 = _757;
    float _861 = _759;
    float _863 = _761;
    float _865 = _763;
    float _867 = _827 * _829;
    float _869 = _827 * _831;
    float _871 = _827 * _833;
    bool _873 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _875 = _835 * _837;
    bool _877 = _68 != 0;
    float _879 = _835 * _839;
    float _881 = _835 * _841;
    int _883 = _68 * 48;
    float _885 = _843 * _845;
    float _887 = _843 * _847;
    float _889 = -_867;
    float _891 = _889 + (-0.0);
    float _893 = _843 * _849;
    float _895 = _835;
    float _897 = _829;
    float _899 = _843;
    float _901 = _865;
    float _903 = _863;
    float _905 = _861;
    float _907 = _859;
    float _909 = _827;
    float _911 = _857;
    float _913 = _881;
    float _915 = _893;
    float _917 = _855;
    if (!_873)
    {
        int _919 = _68 * 48;
        float _921 = -_867;
        float _923 = _921 + (-0.0);
        int _925 = _919 + 16;
        uint _927 = uint(int(uint(_919) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_927)] = as_type<uint>(_869);
        int _929 = _919 + 4;
        uint _931 = uint(int(uint(_929) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_931)] = as_type<uint>(_875);
        int _933 = _919 + 8;
        uint _935 = uint(int(uint(_933) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_935)] = as_type<uint>(_885);
        int _937 = _919 + 12;
        uint _939 = uint(int(uint(_937) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_939)] = as_type<uint>(_851);
        int _941 = _919 + 32;
        uint _943 = uint(int(uint(_925) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_943)] = as_type<uint>(_871);
        int _945 = _925 + 4;
        uint _947 = uint(int(uint(_945) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_947)] = as_type<uint>(_879);
        int _949 = _925 + 8;
        uint _951 = uint(int(uint(_949) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_951)] = as_type<uint>(_887);
        int _953 = _925 + 12;
        uint _955 = uint(int(uint(_953) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_955)] = as_type<uint>(_853);
        uint _957 = uint(int(uint(_941) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_957)] = as_type<uint>(_923);
        int _959 = _941 + 4;
        uint _961 = uint(int(uint(_959) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_961)] = as_type<uint>(_881);
        int _963 = _941 + 8;
        uint _965 = uint(int(uint(_963) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_965)] = as_type<uint>(_893);
        int _967 = _941 + 12;
        uint _969 = uint(int(uint(_967) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_969)] = as_type<uint>(_855);
        _895 = as_type<float>(_925);
        _897 = as_type<float>(_919);
        _899 = as_type<float>(_941);
    }
    float _971 = _895;
    float _973 = _897;
    float _975 = _899;
    uint _977 = uint(int(uint(_883) >> uint(2)));
    _39[int(_977)] = as_type<uint>(_869);
    int _979 = _883 + 4;
    uint _981 = uint(int(uint(_979) >> uint(2)));
    _39[int(_981)] = as_type<uint>(_875);
    int _983 = _883 + 8;
    uint _985 = uint(int(uint(_983) >> uint(2)));
    _39[int(_985)] = as_type<uint>(_885);
    int _987 = _883 + 12;
    uint _989 = uint(int(uint(_987) >> uint(2)));
    _39[int(_989)] = as_type<uint>(_851);
    int _991 = _68 * 112;
    float _993 = _975;
    float _995 = _971;
    float _997 = _973;
    if (!_877)
    {
        _901 = _869;
    }
    float _999 = _901;
    int _1001 = _883 + 32;
    uint _1003 = uint(int(uint(_1001) >> uint(2)));
    _39[int(_1003)] = as_type<uint>(_891);
    int _1005 = _883 + 36;
    uint _1007 = uint(int(uint(_1005) >> uint(2)));
    _39[int(_1007)] = as_type<uint>(_881);
    int _1009 = _883 + 40;
    uint _1011 = uint(int(uint(_1009) >> uint(2)));
    _39[int(_1011)] = as_type<uint>(_893);
    int _1013 = _883 + 44;
    uint _1015 = uint(int(uint(_1013) >> uint(2)));
    _39[int(_1015)] = as_type<uint>(_855);
    float _1017 = _999;
    if (!_877)
    {
        _903 = _875;
    }
    float _1019 = _903;
    float _1021 = _1019;
    if (!_877)
    {
        _905 = _885;
    }
    float _1023 = _905;
    int _1025 = _883 + 16;
    uint _1027 = uint(int(uint(_1025) >> uint(2)));
    _39[int(_1027)] = as_type<uint>(_871);
    int _1029 = _883 + 20;
    uint _1031 = uint(int(uint(_1029) >> uint(2)));
    _39[int(_1031)] = as_type<uint>(_879);
    int _1033 = _883 + 24;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    _39[int(_1035)] = as_type<uint>(_887);
    int _1037 = _883 + 28;
    uint _1039 = uint(int(uint(_1037) >> uint(2)));
    _39[int(_1039)] = as_type<uint>(_853);
    float _1041 = _1023;
    if (!_877)
    {
        _907 = _851;
    }
    float _1043 = _907;
    float _1045 = _1043;
    if (!_877)
    {
        _909 = _871;
    }
    float _1047 = _909;
    float _1049 = _1047;
    if (!_877)
    {
        _911 = _879;
    }
    float _1051 = _911;
    float _1053 = _1051;
    if (!_877)
    {
        _993 = _887;
    }
    float _1055 = _993;
    float _1057 = _1055;
    if (!_877)
    {
        _995 = _853;
    }
    float _1059 = _995;
    float _1061 = _1059;
    if (!_877)
    {
        _997 = _891;
    }
    float _1063 = _997;
    bool _1065 = !_877;
    float _1067 = _1063;
    if (!_1065)
    {
        bool _1069 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1071 = !_1069;
        if (!_1071)
        {
            uint _1073 = uint(int(uint(_991) >> uint(2)));
            uint _1075 = uint(int(uint(int(_1073)) >> uint(2)));
            int _1077 = int(_1073) & 3;
            float _1079 = (*spvDescriptorSet0.cp_c6)._m0[int(_1075)][_1077];
            int _1081 = as_type<int>(_1079) * 48;
            int _1083 = 0;
            bool _1085;
            float _1183;
            float _1185;
            float _1187;
            float _1195;
            float _1211;
            float _1213;
            float _1225;
            float _1235;
            float _1239;
            float _1241;
            float _1243;
            float _1245;
            do
            {
                int _1087 = _1083;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1089 = uint(int(uint(_1081) >> uint(2)));
                float _1091 = as_type<float>(_39[int(_1089)]);
                int _1093 = _1081 + 4;
                uint _1095 = uint(int(uint(_1093) >> uint(2)));
                float _1097 = as_type<float>(_39[int(_1095)]);
                int _1099 = _1081 + 8;
                uint _1101 = uint(int(uint(_1099) >> uint(2)));
                float _1103 = as_type<float>(_39[int(_1101)]);
                int _1105 = _1081 + 12;
                uint _1107 = uint(int(uint(_1105) >> uint(2)));
                float _1109 = as_type<float>(_39[int(_1107)]);
                int _1111 = _1087 + 1;
                int _1113 = _1081 + 16;
                uint _1115 = uint(int(uint(_1113) >> uint(2)));
                float _1117 = as_type<float>(_39[int(_1115)]);
                int _1119 = _1081 + 20;
                uint _1121 = uint(int(uint(_1119) >> uint(2)));
                float _1123 = as_type<float>(_39[int(_1121)]);
                int _1125 = _1081 + 24;
                uint _1127 = uint(int(uint(_1125) >> uint(2)));
                float _1129 = as_type<float>(_39[int(_1127)]);
                int _1131 = _1081 + 28;
                uint _1133 = uint(int(uint(_1131) >> uint(2)));
                float _1135 = as_type<float>(_39[int(_1133)]);
                bool _1137 = uint(_1111) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1139 = _1081 + 32;
                uint _1141 = uint(int(uint(_1139) >> uint(2)));
                float _1143 = as_type<float>(_39[int(_1141)]);
                int _1145 = _1081 + 36;
                uint _1147 = uint(int(uint(_1145) >> uint(2)));
                float _1149 = as_type<float>(_39[int(_1147)]);
                int _1151 = _1081 + 40;
                uint _1153 = uint(int(uint(_1151) >> uint(2)));
                float _1155 = as_type<float>(_39[int(_1153)]);
                int _1157 = _1081 + 44;
                uint _1159 = uint(int(uint(_1157) >> uint(2)));
                float _1161 = as_type<float>(_39[int(_1159)]);
                float _1163 = _1097 * _853;
                float _1165 = _871 * _1097;
                float _1167 = _879 * _1097;
                float _1169 = _887 * _1097;
                float _1171 = fma(_1091, _851, _1163);
                float _1173 = fma(_869, _1091, _1165);
                float _1175 = fma(_875, _1091, _1167);
                float _1177 = fma(_885, _1091, _1169);
                float _1179 = fma(_1103, _855, _1171);
                float _1181 = -_867;
                _1183 = fma(_1181, _1103, _1173);
                _1185 = fma(_881, _1103, _1175);
                _1187 = fma(_893, _1103, _1177);
                float _1189 = _1123 * _853;
                float _1191 = _871 * _1123;
                float _1193 = _879 * _1123;
                _1195 = _1109 + _1179;
                float _1197 = fma(_1117, _851, _1189);
                float _1199 = fma(_869, _1117, _1191);
                float _1201 = fma(_875, _1117, _1193);
                float _1203 = _887 * _1123;
                float _1205 = fma(_1129, _855, _1197);
                float _1207 = _1149 * _853;
                float _1209 = -_867;
                _1211 = fma(_1209, _1129, _1199);
                _1213 = fma(_881, _1129, _1201);
                float _1215 = _871 * _1149;
                float _1217 = _879 * _1149;
                float _1219 = _887 * _1149;
                float _1221 = fma(_1143, _851, _1207);
                float _1223 = fma(_885, _1117, _1203);
                _1225 = _1135 + _1205;
                float _1227 = fma(_869, _1143, _1215);
                float _1229 = fma(_875, _1143, _1217);
                float _1231 = fma(_885, _1143, _1219);
                float _1233 = fma(_1155, _855, _1221);
                _1235 = fma(_893, _1129, _1223);
                float _1237 = -_867;
                _1239 = fma(_1237, _1155, _1227);
                _1241 = fma(_881, _1155, _1229);
                _1243 = fma(_893, _1155, _1231);
                _1245 = _1161 + _1233;
                uint _1247 = uint(int(uint(_883) >> uint(2)));
                _39[int(_1247)] = as_type<uint>(_1183);
                int _1249 = _883 + 4;
                uint _1251 = uint(int(uint(_1249) >> uint(2)));
                _39[int(_1251)] = as_type<uint>(_1185);
                int _1253 = _883 + 8;
                uint _1255 = uint(int(uint(_1253) >> uint(2)));
                _39[int(_1255)] = as_type<uint>(_1187);
                int _1257 = _883 + 12;
                uint _1259 = uint(int(uint(_1257) >> uint(2)));
                _39[int(_1259)] = as_type<uint>(_1195);
                int _1261 = _883 + 16;
                uint _1263 = uint(int(uint(_1261) >> uint(2)));
                _39[int(_1263)] = as_type<uint>(_1211);
                int _1265 = _883 + 20;
                uint _1267 = uint(int(uint(_1265) >> uint(2)));
                _39[int(_1267)] = as_type<uint>(_1213);
                int _1269 = _883 + 24;
                uint _1271 = uint(int(uint(_1269) >> uint(2)));
                _39[int(_1271)] = as_type<uint>(_1235);
                int _1273 = _883 + 28;
                uint _1275 = uint(int(uint(_1273) >> uint(2)));
                _39[int(_1275)] = as_type<uint>(_1225);
                int _1277 = _883 + 32;
                uint _1279 = uint(int(uint(_1277) >> uint(2)));
                _39[int(_1279)] = as_type<uint>(_1239);
                int _1281 = _883 + 36;
                uint _1283 = uint(int(uint(_1281) >> uint(2)));
                _39[int(_1283)] = as_type<uint>(_1241);
                int _1285 = _883 + 40;
                uint _1287 = uint(int(uint(_1285) >> uint(2)));
                _39[int(_1287)] = as_type<uint>(_1243);
                int _1289 = _883 + 44;
                uint _1291 = uint(int(uint(_1289) >> uint(2)));
                _39[int(_1291)] = as_type<uint>(_1245);
                _1085 = !_1137;
                _1083 = _1111;
            } while (_1085);
            _913 = _1241;
            _1021 = _1185;
            _1053 = _1213;
            _1067 = _1239;
            _1017 = _1183;
            _1049 = _1211;
            _1057 = _1235;
            _915 = _1243;
            _1041 = _1187;
            _1061 = _1225;
            _1045 = _1195;
            _917 = _1245;
            _1293 = true;
        }
        else
        {
            _913 = 0.0;
            _1021 = 0.0;
            _1053 = 0.0;
            _1067 = 0.0;
            _1017 = 0.0;
            _1049 = 0.0;
            _1057 = 0.0;
            _915 = 0.0;
            _1041 = 0.0;
            _1061 = 0.0;
            _1045 = 0.0;
            _917 = 0.0;
        }
    }
    _1293 = false;
    float _1295 = _913;
    float _1297 = _1021;
    float _1299 = _1053;
    float _1301 = _1067;
    float _1303 = _1017;
    float _1305 = _1049;
    float _1307 = _1057;
    float _1309 = _915;
    float _1311 = _1041;
    float _1313 = _1061;
    float _1315 = _1045;
    float _1317 = _917;
    int _1319 = _991 + 80;
    uint _1321 = uint(int(uint(_1319) >> uint(2)));
    uint _1323 = uint(int(uint(int(_1321)) >> uint(2)));
    int _1325 = int(_1321) & 3;
    float _1327 = (*spvDescriptorSet0.cp_c6)._m0[int(_1323)][_1325];
    int _1329 = int(_1321) + 1;
    uint _1331 = uint(int(uint(_1329) >> uint(2)));
    int _1333 = _1329 & 3;
    float _1335 = (*spvDescriptorSet0.cp_c6)._m0[int(_1331)][_1333];
    int _1337 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1339 = _1337 + _68;
    int _1341 = _991 + 64;
    uint _1343 = uint(int(uint(_1341) >> uint(2)));
    uint _1345 = uint(int(uint(int(_1343)) >> uint(2)));
    int _1347 = int(_1343) & 3;
    float _1349 = (*spvDescriptorSet0.cp_c6)._m0[int(_1345)][_1347];
    int _1351 = int(_1343) + 1;
    uint _1353 = uint(int(uint(_1351) >> uint(2)));
    int _1355 = _1351 & 3;
    float _1357 = (*spvDescriptorSet0.cp_c6)._m0[int(_1353)][_1355];
    int _1359 = _1339 * 48;
    int _1361 = _991 + 88;
    uint _1363 = uint(int(uint(_1361) >> uint(2)));
    uint _1365 = uint(int(uint(int(_1363)) >> uint(2)));
    int _1367 = int(_1363) & 3;
    float _1369 = (*spvDescriptorSet0.cp_c6)._m0[int(_1365)][_1367];
    int _1371 = int(_1363) + 1;
    uint _1373 = uint(int(uint(_1371) >> uint(2)));
    int _1375 = _1371 & 3;
    float _1377 = (*spvDescriptorSet0.cp_c6)._m0[int(_1373)][_1375];
    int _1379 = _991 + 72;
    uint _1381 = uint(int(uint(_1379) >> uint(2)));
    uint _1383 = uint(int(uint(int(_1381)) >> uint(2)));
    int _1385 = int(_1381) & 3;
    float _1387 = (*spvDescriptorSet0.cp_c6)._m0[int(_1383)][_1385];
    int _1389 = int(_1381) + 1;
    uint _1391 = uint(int(uint(_1389) >> uint(2)));
    int _1393 = _1389 & 3;
    float _1395 = (*spvDescriptorSet0.cp_c6)._m0[int(_1391)][_1393];
    int _1397 = _991 + 96;
    uint _1399 = uint(int(uint(_1397) >> uint(2)));
    uint _1401 = uint(int(uint(int(_1399)) >> uint(2)));
    int _1403 = int(_1399) & 3;
    float _1405 = (*spvDescriptorSet0.cp_c6)._m0[int(_1401)][_1403];
    int _1407 = int(_1399) + 1;
    uint _1409 = uint(int(uint(_1407) >> uint(2)));
    int _1411 = _1407 & 3;
    float _1413 = (*spvDescriptorSet0.cp_c6)._m0[int(_1409)][_1411];
    int _1415 = _991 + 104;
    uint _1417 = uint(int(uint(_1415) >> uint(2)));
    uint _1419 = uint(int(uint(int(_1417)) >> uint(2)));
    int _1421 = int(_1417) & 3;
    float _1423 = (*spvDescriptorSet0.cp_c6)._m0[int(_1419)][_1421];
    int _1425 = int(_1417) + 1;
    uint _1427 = uint(int(uint(_1425) >> uint(2)));
    int _1429 = _1425 & 3;
    float _1431 = (*spvDescriptorSet0.cp_c6)._m0[int(_1427)][_1429];
    float _1433 = _1295 * _1327;
    int _1435 = _991 + 16;
    uint _1437 = uint(int(uint(_1435) >> uint(2)));
    uint _1439 = uint(int(uint(int(_1437)) >> uint(2)));
    int _1441 = int(_1437) & 3;
    float _1443 = (*spvDescriptorSet0.cp_c6)._m0[int(_1439)][_1441];
    int _1445 = int(_1437) + 1;
    uint _1447 = uint(int(uint(_1445) >> uint(2)));
    int _1449 = _1445 & 3;
    float _1451 = (*spvDescriptorSet0.cp_c6)._m0[int(_1447)][_1449];
    float _1453 = _1297 * _1327;
    float _1455 = _1299 * _1327;
    float _1457 = _1299 * _1335;
    float _1459 = fma(_1301, _1349, _1433);
    float _1461 = _1295 * _1335;
    int _1463 = _991 + 32;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    uint _1467 = uint(int(uint(int(_1465)) >> uint(2)));
    int _1469 = int(_1465) & 3;
    float _1471 = (*spvDescriptorSet0.cp_c6)._m0[int(_1467)][_1469];
    int _1473 = int(_1465) + 1;
    uint _1475 = uint(int(uint(_1473) >> uint(2)));
    int _1477 = _1473 & 3;
    float _1479 = (*spvDescriptorSet0.cp_c6)._m0[int(_1475)][_1477];
    float _1481 = fma(_1303, _1349, _1453);
    float _1483 = fma(_1305, _1349, _1455);
    float _1485 = fma(_1305, _1357, _1457);
    float _1487 = _1297 * _1335;
    float _1489 = fma(_1301, _1357, _1461);
    float _1491 = _1297 * _1369;
    float _1493 = _1299 * _1369;
    int _1495 = _991 + 48;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    uint _1499 = uint(int(uint(int(_1497)) >> uint(2)));
    int _1501 = int(_1497) & 3;
    float _1503 = (*spvDescriptorSet0.cp_c6)._m0[int(_1499)][_1501];
    int _1505 = int(_1497) + 1;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    int _1509 = _1505 & 3;
    float _1511 = (*spvDescriptorSet0.cp_c6)._m0[int(_1507)][_1509];
    float _1513 = _1297 * _1377;
    float _1515 = _1299 * _1377;
    float _1517 = _1295 * _1369;
    float _1519 = _1295 * _1377;
    float _1521 = fma(_1303, _1357, _1487);
    float _1523 = fma(_1305, _1387, _1493);
    float _1525 = fma(_1305, _1395, _1515);
    int _1527 = _991 + 24;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    uint _1531 = uint(int(uint(int(_1529)) >> uint(2)));
    int _1533 = int(_1529) & 3;
    float _1535 = (*spvDescriptorSet0.cp_c6)._m0[int(_1531)][_1533];
    int _1537 = int(_1529) + 1;
    uint _1539 = uint(int(uint(_1537) >> uint(2)));
    int _1541 = _1537 & 3;
    float _1543 = (*spvDescriptorSet0.cp_c6)._m0[int(_1539)][_1541];
    float _1545 = fma(_1303, _1387, _1491);
    float _1547 = fma(_1303, _1395, _1513);
    float _1549 = fma(_1301, _1387, _1517);
    float _1551 = fma(_1301, _1395, _1519);
    float _1553 = fma(_1307, _1405, _1483);
    float _1555 = fma(_1307, _1413, _1485);
    int _1557 = _991 + 40;
    uint _1559 = uint(int(uint(_1557) >> uint(2)));
    uint _1561 = uint(int(uint(int(_1559)) >> uint(2)));
    int _1563 = int(_1559) & 3;
    float _1565 = (*spvDescriptorSet0.cp_c6)._m0[int(_1561)][_1563];
    int _1567 = int(_1559) + 1;
    uint _1569 = uint(int(uint(_1567) >> uint(2)));
    int _1571 = _1567 & 3;
    float _1573 = (*spvDescriptorSet0.cp_c6)._m0[int(_1569)][_1571];
    float _1575 = fma(_1309, _1405, _1459);
    float _1577 = fma(_1311, _1405, _1481);
    float _1579 = fma(_1311, _1413, _1521);
    float _1581 = fma(_1309, _1413, _1489);
    float _1583 = fma(_1307, _1423, _1523);
    float _1585 = fma(_1307, _1431, _1525);
    int _1587 = _991 + 56;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    uint _1591 = uint(int(uint(int(_1589)) >> uint(2)));
    int _1593 = int(_1589) & 3;
    float _1595 = (*spvDescriptorSet0.cp_c6)._m0[int(_1591)][_1593];
    int _1597 = int(_1589) + 1;
    uint _1599 = uint(int(uint(_1597) >> uint(2)));
    int _1601 = _1597 & 3;
    float _1603 = (*spvDescriptorSet0.cp_c6)._m0[int(_1599)][_1601];
    float _1605 = fma(_1311, _1423, _1545);
    float _1607 = fma(_1311, _1431, _1547);
    float _1609 = _1585 + _1313;
    float _1611 = fma(_1309, _1431, _1551);
    float _1613 = fma(_1309, _1423, _1549);
    float _1615 = _1607 + _1315;
    float _1617 = _1609 * _1451;
    float _1619 = _1611 + _1317;
    float _1621 = _1553 * _1451;
    float _1623 = _1555 * _1451;
    float _1625 = fma(_1615, _1443, _1617);
    float _1627 = _1583 * _1451;
    float _1629 = fma(_1577, _1443, _1621);
    float _1631 = fma(_1579, _1443, _1623);
    float _1633 = _1553 * _1479;
    float _1635 = _1609 * _1479;
    float _1637 = _1555 * _1479;
    float _1639 = _1583 * _1479;
    float _1641 = fma(_1577, _1471, _1633);
    float _1643 = fma(_1615, _1471, _1635);
    float _1645 = fma(_1605, _1443, _1627);
    float _1647 = fma(_1605, _1471, _1639);
    float _1649 = _1553 * _1511;
    float _1651 = _1609 * _1511;
    float _1653 = _1555 * _1511;
    float _1655 = _1583 * _1511;
    float _1657 = fma(_1577, _1503, _1649);
    float _1659 = fma(_1615, _1503, _1651);
    float _1661 = fma(_1579, _1503, _1653);
    float _1663 = fma(_1605, _1503, _1655);
    float _1665 = fma(_1619, _1535, _1625);
    float _1667 = fma(_1579, _1471, _1637);
    float _1669 = fma(_1581, _1535, _1631);
    float _1671 = fma(_1575, _1535, _1629);
    float _1673 = _1665 + _1543;
    float _1675 = fma(_1613, _1535, _1645);
    float _1677 = fma(_1619, _1565, _1643);
    float _1679 = fma(_1575, _1565, _1641);
    float _1681 = fma(_1613, _1565, _1647);
    float _1683 = fma(_1581, _1565, _1667);
    float _1685 = _1677 + _1573;
    float _1687 = fma(_1619, _1595, _1659);
    float _1689 = fma(_1575, _1595, _1657);
    float _1691 = fma(_1581, _1595, _1661);
    float _1693 = fma(_1613, _1595, _1663);
    int _1695 = _1359 + 16;
    float _1697 = _1687 + _1603;
    int _1699 = _1359 + 32;
    int _1701 = _1359 + 48;
    uint _1703 = uint(int(uint(_1695) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1703)] = as_type<uint>(_1671);
    int _1705 = _1695 + 4;
    uint _1707 = uint(int(uint(_1705) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1707)] = as_type<uint>(_1669);
    int _1709 = _1695 + 8;
    uint _1711 = uint(int(uint(_1709) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1711)] = as_type<uint>(_1675);
    int _1713 = _1695 + 12;
    uint _1715 = uint(int(uint(_1713) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1715)] = as_type<uint>(_1673);
    uint _1717 = uint(int(uint(_1699) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1717)] = as_type<uint>(_1679);
    int _1719 = _1699 + 4;
    uint _1721 = uint(int(uint(_1719) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1721)] = as_type<uint>(_1683);
    int _1723 = _1699 + 8;
    uint _1725 = uint(int(uint(_1723) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1725)] = as_type<uint>(_1681);
    int _1727 = _1699 + 12;
    uint _1729 = uint(int(uint(_1727) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1729)] = as_type<uint>(_1685);
    uint _1731 = uint(int(uint(_1701) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1731)] = as_type<uint>(_1689);
    int _1733 = _1701 + 4;
    uint _1735 = uint(int(uint(_1733) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1735)] = as_type<uint>(_1691);
    int _1737 = _1701 + 8;
    uint _1739 = uint(int(uint(_1737) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1739)] = as_type<uint>(_1693);
    int _1741 = _1701 + 12;
    uint _1743 = uint(int(uint(_1741) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1743)] = as_type<uint>(_1697);
}

