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
int _58(thread const int& _4636, thread const int& _4637, constant _10& support_buffer)
{
    int _4640 = 1 + _4637;
    float _4642 = support_buffer._m5[_4640].x;
    bool _4644 = _4642 == 1.0;
    if (_4644)
    {
        return _4636;
    }
    float _4646 = float(_4636);
    float _4648 = _4646 * _4642;
    int _4650 = int(_4648);
    return _4650;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1347 = false;
    bool _889 = false;
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
    float _129 = 0.0;
    float _131 = _123;
    float _133 = _125;
    if (!_117)
    {
        _127 = 0.0;
        _129 = 0.0;
    }
    float _135 = _127;
    float _137 = _129;
    float _139 = 0.0;
    float _141 = 0.0;
    float _143 = _135;
    float _145 = _137;
    if (!_117)
    {
        _139 = 0.0;
        _141 = 0.0;
    }
    float _147 = _139;
    float _149 = _141;
    float _151 = 0.0;
    float _153 = 0.0;
    float _155 = _149;
    float _157 = _147;
    if (!_117)
    {
        _151 = 0.0;
        _153 = 0.0;
    }
    float _159 = _151;
    float _161 = _153;
    float _163 = _159;
    float _165 = _161;
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
        int3 _2020 = int3(_193, _199, 1);
        float3 _203 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2020.xy), uint(_2020.z), 0).xyz;
        float _205 = _203.x;
        float _207 = _203.y;
        float _209 = _203.z;
        int _211 = _68;
        int _213 = 0;
        int _215 = _58(_211, _213, (*spvDescriptorSet0.support_buffer));
        int _217 = as_type<int>(_187);
        int _219 = 0;
        int _221 = _58(_217, _219, (*spvDescriptorSet0.support_buffer));
        int3 _2038 = int3(_215, _221, 1);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2038.xy), uint(_2038.z), 0).xyz;
        float _225 = _223.x;
        float _227 = _223.y;
        float _229 = _223.z;
        int _231 = _68;
        int _233 = 0;
        int _235 = _58(_231, _233, (*spvDescriptorSet0.support_buffer));
        int _237 = as_type<int>(_179);
        int _239 = 0;
        int _241 = _58(_237, _239, (*spvDescriptorSet0.support_buffer));
        int3 _2056 = int3(_235, _241, 0);
        float3 _243 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2056.xy), uint(_2056.z), 0).xyz;
        float _245 = _243.x;
        float _247 = _243.y;
        float _249 = _243.z;
        int _251 = _68;
        int _253 = 0;
        int _255 = _58(_251, _253, (*spvDescriptorSet0.support_buffer));
        int _257 = as_type<int>(_187);
        int _259 = 0;
        int _261 = _58(_257, _259, (*spvDescriptorSet0.support_buffer));
        int3 _2074 = int3(_255, _261, 0);
        float3 _263 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2074.xy), uint(_2074.z), 0).xyz;
        float _265 = _263.x;
        float _267 = _263.y;
        float _269 = _263.z;
        int _271 = _68;
        int _273 = 0;
        int _275 = _58(_271, _273, (*spvDescriptorSet0.support_buffer));
        int _277 = as_type<int>(_179);
        int _279 = 0;
        int _281 = _58(_277, _279, (*spvDescriptorSet0.support_buffer));
        int3 _2092 = int3(_275, _281, 2);
        float3 _283 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2092.xy), uint(_2092.z), 0).xyz;
        float _285 = _283.x;
        float _287 = _283.y;
        float _289 = _283.z;
        int _291 = _68;
        int _293 = 0;
        int _295 = _58(_291, _293, (*spvDescriptorSet0.support_buffer));
        int _297 = as_type<int>(_187);
        int _299 = 0;
        int _301 = _58(_297, _299, (*spvDescriptorSet0.support_buffer));
        int3 _2110 = int3(_295, _301, 2);
        float3 _303 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2110.xy), uint(_2110.z), 0).xyz;
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
        float _325 = -_207;
        float _327 = _325 + _227;
        float _329 = -_209;
        float _331 = _329 + _229;
        float _333 = fma(_323, _319, _205);
        float _335 = -_247;
        float _337 = _335 + _267;
        float _339 = fma(_327, _319, _207);
        float _341 = fma(_331, _319, _209);
        float _343 = -_249;
        float _345 = _343 + _269;
        float _347 = fma(_337, _319, _247);
        float _349 = -_245;
        float _351 = _349 + _265;
        float _353 = -_285;
        float _355 = _353 + _305;
        float _357 = -_287;
        float _359 = _357 + _307;
        float _361 = -_289;
        float _363 = _361 + _309;
        float _365 = fma(_345, _319, _249);
        float _367 = fma(_351, _319, _245);
        float _369 = fma(_355, _319, _285);
        float _371 = fma(_359, _319, _287);
        float _373 = fma(_363, _319, _289);
        _163 = _333;
        _171 = _341;
        _165 = _339;
        _131 = _367;
        _133 = _347;
        _143 = _365;
        _145 = _369;
        _155 = _371;
        _157 = _373;
    }
    float _375 = _163;
    float _377 = _171;
    float _379 = _165;
    float _381 = _131;
    float _383 = _133;
    float _385 = _143;
    float _387 = _145;
    float _389 = _155;
    float _391 = _157;
    int _393 = _103 + 36;
    uint _395 = uint(int(uint(_393) >> uint(2)));
    uint _397 = uint(int(uint(int(_395)) >> uint(2)));
    int _399 = int(_395) & 3;
    float _401 = (*spvDescriptorSet0.cp_c5)._m0[int(_397)][_399];
    int _403 = _101 & as_type<int>(_401);
    bool _405 = _403 != 0;
    bool _407 = !_405;
    float _409 = _381;
    float _411 = _383;
    float _413 = _391;
    float _415 = _389;
    float _863;
    float _865;
    float _867;
    float _869;
    float _871;
    float _873;
    float _875;
    float _877;
    float _879;
    float _881;
    int _883;
    int _885;
    int _887;
    if (!_407)
    {
        int _417 = _103 + 8;
        uint _419 = uint(int(uint(_417) >> uint(2)));
        uint _421 = uint(int(uint(int(_419)) >> uint(2)));
        int _423 = int(_419) & 3;
        float _425 = (*spvDescriptorSet0.cp_c5)._m0[int(_421)][_423];
        int _427 = int(_419) + 1;
        uint _429 = uint(int(uint(_427) >> uint(2)));
        int _431 = _427 & 3;
        float _433 = (*spvDescriptorSet0.cp_c5)._m0[int(_429)][_431];
        int _435 = _68;
        int _437 = 1;
        int _439 = _58(_435, _437, (*spvDescriptorSet0.support_buffer));
        int _441 = as_type<int>(_425);
        int _443 = 1;
        int _445 = _58(_441, _443, (*spvDescriptorSet0.support_buffer));
        int3 _2311 = int3(_439, _445, 1);
        float3 _447 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2311.xy), uint(_2311.z), 0).xyz;
        float _449 = _447.x;
        float _451 = _447.y;
        float _453 = _447.z;
        int _455 = _68;
        int _457 = 1;
        int _459 = _58(_455, _457, (*spvDescriptorSet0.support_buffer));
        int _461 = as_type<int>(_433);
        int _463 = 1;
        int _465 = _58(_461, _463, (*spvDescriptorSet0.support_buffer));
        int3 _2329 = int3(_459, _465, 1);
        float3 _467 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2329.xy), uint(_2329.z), 0).xyz;
        float _469 = _467.x;
        float _471 = _467.y;
        float _473 = _467.z;
        int _475 = _68;
        int _477 = 1;
        int _479 = _58(_475, _477, (*spvDescriptorSet0.support_buffer));
        int _481 = as_type<int>(_425);
        int _483 = 1;
        int _485 = _58(_481, _483, (*spvDescriptorSet0.support_buffer));
        int3 _2347 = int3(_479, _485, 0);
        float3 _487 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2347.xy), uint(_2347.z), 0).xyz;
        float _489 = _487.x;
        float _491 = _487.y;
        float _493 = _487.z;
        int _495 = _68;
        int _497 = 1;
        int _499 = _58(_495, _497, (*spvDescriptorSet0.support_buffer));
        int _501 = as_type<int>(_433);
        int _503 = 1;
        int _505 = _58(_501, _503, (*spvDescriptorSet0.support_buffer));
        int3 _2365 = int3(_499, _505, 0);
        float3 _507 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2365.xy), uint(_2365.z), 0).xyz;
        float _509 = _507.x;
        float _511 = _507.y;
        float _513 = _507.z;
        int _515 = _68;
        int _517 = 1;
        int _519 = _58(_515, _517, (*spvDescriptorSet0.support_buffer));
        int _521 = as_type<int>(_425);
        int _523 = 1;
        int _525 = _58(_521, _523, (*spvDescriptorSet0.support_buffer));
        int3 _2383 = int3(_519, _525, 2);
        float3 _527 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2383.xy), uint(_2383.z), 0).xyz;
        float _529 = _527.x;
        float _531 = _527.y;
        float _533 = _527.z;
        int _535 = _68;
        int _537 = 1;
        int _539 = _58(_535, _537, (*spvDescriptorSet0.support_buffer));
        int _541 = as_type<int>(_433);
        int _543 = 1;
        int _545 = _58(_541, _543, (*spvDescriptorSet0.support_buffer));
        int3 _2401 = int3(_539, _545, 2);
        float3 _547 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2401.xy), uint(_2401.z), 0).xyz;
        float _549 = _547.x;
        float _551 = _547.y;
        float _553 = _547.z;
        float _555 = _375 * 0.15915493667125701904296875;
        float _557 = _377 * 0.15915493667125701904296875;
        float _559 = _379 * 0.15915493667125701904296875;
        int _561 = _103 + 24;
        uint _563 = uint(int(uint(_561) >> uint(2)));
        uint _565 = uint(int(uint(int(_563)) >> uint(2)));
        int _567 = int(_563) & 3;
        float _569 = (*spvDescriptorSet0.cp_c5)._m0[int(_565)][_567];
        int _571 = int(_563) + 1;
        uint _573 = uint(int(uint(_571) >> uint(2)));
        int _575 = _571 & 3;
        float _577 = (*spvDescriptorSet0.cp_c5)._m0[int(_573)][_575];
        float _579 = _555 * 6.283185482025146484375;
        float _581 = cos(_579);
        int _583 = _103 + 20;
        uint _585 = uint(int(uint(_583) >> uint(2)));
        uint _587 = uint(int(uint(int(_585)) >> uint(2)));
        int _589 = int(_585) & 3;
        float _591 = (*spvDescriptorSet0.cp_c5)._m0[int(_587)][_589];
        float _593 = _557 * 6.283185482025146484375;
        float _595 = sin(_593);
        float _597 = _557 * 6.283185482025146484375;
        float _599 = cos(_597);
        float _601 = _559 * 6.283185482025146484375;
        float _603 = cos(_601);
        float _605 = _555 * 6.283185482025146484375;
        float _607 = sin(_605);
        float _609 = _581 * _599;
        float _611 = _559 * 6.283185482025146484375;
        float _613 = sin(_611);
        float _615 = _595 * _581;
        float _617 = _581 * _603;
        float _619 = _603 * _599;
        float _621 = _595 * _603;
        float _623 = _607 * _599;
        float _625 = _607 * _603;
        float _627 = _607 * _595;
        float _629 = _607 * _613;
        float _631 = -_623;
        float _633 = fma(_613, _615, _631);
        float _635 = fma(_613, _609, _627);
        float _637 = _613 * _591;
        float _639 = -_615;
        float _641 = fma(_599, _629, _639);
        float _643 = fma(_595, _629, _609);
        float _645 = -_451;
        float _647 = _645 + _471;
        float _649 = -_453;
        float _651 = _649 + _473;
        float _653 = -_449;
        float _655 = _653 + _469;
        float _657 = -_493;
        float _659 = _657 + _513;
        float _661 = fma(_647, _569, _451);
        float _663 = fma(_651, _569, _453);
        float _665 = fma(_655, _569, _449);
        float _667 = -_533;
        float _669 = _667 + _553;
        float _671 = _661 * 0.15915493667125701904296875;
        float _673 = _663 * 0.15915493667125701904296875;
        float _675 = _665 * 0.15915493667125701904296875;
        float _677 = fma(_659, _569, _493);
        float _679 = _671 * 6.283185482025146484375;
        float _681 = cos(_679);
        float _683 = fma(_669, _569, _533);
        float _685 = _677 * _577;
        float _687 = _673 * 6.283185482025146484375;
        float _689 = sin(_687);
        float _691 = _673 * 6.283185482025146484375;
        float _693 = cos(_691);
        float _695 = _675 * 6.283185482025146484375;
        float _697 = cos(_695);
        float _699 = _671 * 6.283185482025146484375;
        float _701 = sin(_699);
        float _703 = _681 * _693;
        float _705 = _703 * _577;
        float _707 = _675 * 6.283185482025146484375;
        float _709 = sin(_707);
        float _711 = _697 * _693;
        float _713 = _689 * _697;
        float _715 = _697 * _681;
        float _717 = _689 * _681;
        float _719 = fma(_619, _591, _705);
        float _721 = _715 * _577;
        float _723 = _717 * _577;
        float _725 = -_701;
        float _727 = -_637;
        float _729 = fma(_725, _577, _727);
        float _731 = fma(_617, _591, _721);
        float _733 = fma(_621, _591, _723);
        float _735 = _709 * _701;
        float _737 = _709 * _693;
        float _739 = _709 * _681;
        float _741 = _709 * _689;
        float _743 = -_713;
        float _745 = fma(_693, _735, _743);
        float _747 = fma(_689, _735, _711);
        float _749 = _739 * _577;
        float _751 = _733 * _733;
        float _753 = _745 * _577;
        float _755 = _747 * _577;
        float _757 = -_737;
        float _759 = fma(_701, _713, _757);
        float _761 = fma(_701, _711, _741);
        float _763 = fma(_641, _591, _753);
        float _765 = fma(_643, _591, _755);
        float _767 = fma(_625, _591, _749);
        float _769 = fma(_719, _719, _751);
        float _771 = _759 * _577;
        float _773 = _765 * _765;
        float _775 = _761 * _577;
        float _777 = fma(_729, _729, _769);
        float _779 = fma(_633, _591, _771);
        float _781 = fma(_763, _763, _773);
        float _783 = fma(_635, _591, _775);
        float _785 = rsqrt(_777);
        float _787 = _779 * _779;
        float _789 = fma(_767, _767, _781);
        float _791 = -_489;
        float _793 = _791 + _509;
        float _795 = fma(_783, _783, _787);
        float _797 = fma(_793, _569, _489);
        float _799 = rsqrt(_789);
        float _801 = fma(_731, _731, _795);
        float _803 = _797 * _577;
        float _805 = fma(_381, _591, _803);
        float _807 = rsqrt(_801);
        float _809 = _719 * _785;
        float _811 = _733 * _785;
        float _813 = _729 * _785;
        float _815 = -_491;
        float _817 = _815 + _511;
        float _819 = _683 * _577;
        float _821 = _763 * _799;
        float _823 = -_529;
        float _825 = _823 + _549;
        float _827 = -_531;
        float _829 = _827 + _551;
        float _831 = fma(_817, _569, _491);
        float _833 = _767 * _799;
        float _835 = fma(_825, _569, _529);
        float _837 = fma(_829, _569, _531);
        float _839 = _831 * _577;
        float _841 = _765 * _799;
        float _843 = _835 * _577;
        float _845 = _837 * _577;
        float _847 = _731 * _807;
        float _849 = _783 * _807;
        float _851 = _779 * _807;
        float _853 = fma(_383, _591, _839);
        float _855 = fma(_385, _591, _685);
        float _857 = fma(_387, _591, _843);
        float _859 = fma(_389, _591, _845);
        float _861 = fma(_391, _591, _819);
        _409 = _805;
        _863 = _809;
        _865 = _811;
        _867 = _813;
        _411 = _853;
        _869 = _821;
        _871 = _841;
        _873 = _833;
        _875 = _855;
        _877 = _849;
        _879 = _851;
        _881 = _847;
        _883 = as_type<int>(_857);
        _885 = as_type<int>(_859);
        _887 = as_type<int>(_861);
        _889 = true;
    }
    else
    {
        float _891 = _375 * 0.15915493667125701904296875;
        float _893 = _377 * 0.15915493667125701904296875;
        float _895 = _379 * 0.15915493667125701904296875;
        float _897 = _891 * 6.283185482025146484375;
        float _899 = sin(_897);
        float _901 = _891 * 6.283185482025146484375;
        float _903 = cos(_901);
        float _905 = _893 * 6.283185482025146484375;
        float _907 = sin(_905);
        float _909 = _893 * 6.283185482025146484375;
        float _911 = cos(_909);
        float _913 = _895 * 6.283185482025146484375;
        float _915 = cos(_913);
        float _917 = _899 * _907;
        float _919 = _907 * _903;
        float _921 = _895 * 6.283185482025146484375;
        float _923 = sin(_921);
        float _925 = _903 * _911;
        float _927 = _899 * _911;
        float _929 = _903 * _915;
        float _931 = _915 * _911;
        float _933 = _907 * _915;
        float _935 = _899 * _915;
        float _937 = _899 * _923;
        float _939 = fma(_923, _925, _917);
        float _941 = -_927;
        float _943 = fma(_923, _919, _941);
        float _945 = -_923;
        float _947 = _945 + (-0.0);
        float _949 = -_919;
        float _951 = fma(_911, _937, _949);
        float _953 = fma(_907, _937, _925);
        _863 = _931;
        _865 = _933;
        _867 = _947;
        _869 = _951;
        _871 = _953;
        _873 = _935;
        _875 = _385;
        _877 = _939;
        _879 = _943;
        _881 = _929;
        _883 = as_type<int>(_387);
        _885 = as_type<int>(_389);
        _887 = as_type<int>(_391);
    }
    _889 = false;
    float _955 = _409;
    float _957 = _863;
    float _959 = _865;
    float _961 = _867;
    float _963 = _411;
    float _965 = _869;
    float _967 = _871;
    float _969 = _873;
    float _971 = _875;
    float _973 = _877;
    float _975 = _879;
    float _977 = _881;
    int _979 = _883;
    int _981 = _885;
    int _983 = _887;
    float _985 = _955 * _957;
    float _987 = _955 * _959;
    float _989 = _955 * _961;
    float _991 = _963 * _965;
    float _993 = _963 * _967;
    float _995 = _963 * _969;
    int _997 = _68 * 48;
    float _999 = _971 * _973;
    float _1001 = _971 * _975;
    float _1003 = _971 * _977;
    bool _1005 = _68 != 0;
    uint _1007 = uint(int(uint(_997) >> uint(2)));
    _39[int(_1007)] = as_type<uint>(_985);
    int _1009 = _997 + 4;
    uint _1011 = uint(int(uint(_1009) >> uint(2)));
    _39[int(_1011)] = as_type<uint>(_991);
    int _1013 = _997 + 8;
    uint _1015 = uint(int(uint(_1013) >> uint(2)));
    _39[int(_1015)] = as_type<uint>(_999);
    int _1017 = _997 + 12;
    uint _1019 = uint(int(uint(_1017) >> uint(2)));
    _39[int(_1019)] = uint(_979);
    int _1021 = _68 * 112;
    int _1023 = _997 + 16;
    int _1025 = _997 + 16;
    uint _1027 = uint(int(uint(_1025) >> uint(2)));
    _39[int(_1027)] = as_type<uint>(_987);
    int _1029 = _997 + 20;
    uint _1031 = uint(int(uint(_1029) >> uint(2)));
    _39[int(_1031)] = as_type<uint>(_993);
    int _1033 = _997 + 24;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    _39[int(_1035)] = as_type<uint>(_1001);
    int _1037 = _997 + 28;
    uint _1039 = uint(int(uint(_1037) >> uint(2)));
    _39[int(_1039)] = uint(_981);
    int _1041 = _997 + 32;
    int _1043 = _997 + 32;
    uint _1045 = uint(int(uint(_1043) >> uint(2)));
    _39[int(_1045)] = as_type<uint>(_989);
    int _1047 = _997 + 36;
    uint _1049 = uint(int(uint(_1047) >> uint(2)));
    _39[int(_1049)] = as_type<uint>(_995);
    int _1051 = _997 + 40;
    uint _1053 = uint(int(uint(_1051) >> uint(2)));
    _39[int(_1053)] = as_type<uint>(_1003);
    int _1055 = _997 + 44;
    uint _1057 = uint(int(uint(_1055) >> uint(2)));
    _39[int(_1057)] = uint(_983);
    float _1059 = _955;
    float _1061 = _963;
    float _1063 = _959;
    float _1065 = _973;
    float _1067 = _965;
    float _1069 = _957;
    float _1071 = _969;
    float _1073 = _961;
    float _1075 = _975;
    float _1077 = _967;
    if (!_1005)
    {
        _1059 = _985;
    }
    float _1079 = _1059;
    float _1081 = _1079;
    if (!_1005)
    {
        _1061 = _991;
    }
    float _1083 = _1061;
    float _1085 = _1083;
    if (!_1005)
    {
        _413 = _999;
    }
    float _1087 = _413;
    float _1089 = _1087;
    if (!_1005)
    {
        _415 = as_type<float>(_979);
    }
    float _1091 = _415;
    float _1093 = _1091;
    if (!_1005)
    {
        _1063 = _987;
    }
    float _1095 = _1063;
    float _1097 = _1095;
    if (!_1005)
    {
        _1065 = _993;
    }
    float _1099 = _1065;
    float _1101 = _1099;
    if (!_1005)
    {
        _1067 = _1001;
    }
    float _1103 = _1067;
    float _1105 = _1103;
    if (!_1005)
    {
        _1069 = as_type<float>(_981);
    }
    float _1107 = _1069;
    float _1109 = _1107;
    if (!_1005)
    {
        _1071 = _989;
    }
    float _1111 = _1071;
    float _1113 = _1111;
    if (!_1005)
    {
        _1073 = _995;
    }
    float _1115 = _1073;
    float _1117 = _1115;
    if (!_1005)
    {
        _1075 = _1003;
    }
    float _1119 = _1075;
    float _1121 = _1119;
    if (!_1005)
    {
        _1077 = as_type<float>(_983);
    }
    float _1123 = _1077;
    bool _1125 = !_1005;
    float _1127 = _1123;
    if (!_1125)
    {
        bool _1129 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1131 = !_1129;
        if (!_1131)
        {
            uint _1133 = uint(int(uint(_1021) >> uint(2)));
            uint _1135 = uint(int(uint(int(_1133)) >> uint(2)));
            int _1137 = int(_1133) & 3;
            float _1139 = (*spvDescriptorSet0.cp_c6)._m0[int(_1135)][_1137];
            int _1141 = as_type<int>(_1139) * 48;
            int _1143 = 0;
            bool _1145;
            float _1243;
            float _1245;
            float _1253;
            float _1263;
            float _1265;
            float _1277;
            float _1289;
            float _1291;
            float _1293;
            float _1295;
            float _1297;
            float _1299;
            do
            {
                int _1147 = _1143;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1149 = uint(int(uint(_1141) >> uint(2)));
                float _1151 = as_type<float>(_39[int(_1149)]);
                int _1153 = _1141 + 4;
                uint _1155 = uint(int(uint(_1153) >> uint(2)));
                float _1157 = as_type<float>(_39[int(_1155)]);
                int _1159 = _1141 + 8;
                uint _1161 = uint(int(uint(_1159) >> uint(2)));
                float _1163 = as_type<float>(_39[int(_1161)]);
                int _1165 = _1141 + 12;
                uint _1167 = uint(int(uint(_1165) >> uint(2)));
                float _1169 = as_type<float>(_39[int(_1167)]);
                int _1171 = _1147 + 1;
                int _1173 = _1141 + 16;
                uint _1175 = uint(int(uint(_1173) >> uint(2)));
                float _1177 = as_type<float>(_39[int(_1175)]);
                int _1179 = _1141 + 20;
                uint _1181 = uint(int(uint(_1179) >> uint(2)));
                float _1183 = as_type<float>(_39[int(_1181)]);
                int _1185 = _1141 + 24;
                uint _1187 = uint(int(uint(_1185) >> uint(2)));
                float _1189 = as_type<float>(_39[int(_1187)]);
                int _1191 = _1141 + 28;
                uint _1193 = uint(int(uint(_1191) >> uint(2)));
                float _1195 = as_type<float>(_39[int(_1193)]);
                bool _1197 = uint(_1171) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1199 = _1141 + 32;
                uint _1201 = uint(int(uint(_1199) >> uint(2)));
                float _1203 = as_type<float>(_39[int(_1201)]);
                int _1205 = _1141 + 36;
                uint _1207 = uint(int(uint(_1205) >> uint(2)));
                float _1209 = as_type<float>(_39[int(_1207)]);
                int _1211 = _1141 + 40;
                uint _1213 = uint(int(uint(_1211) >> uint(2)));
                float _1215 = as_type<float>(_39[int(_1213)]);
                int _1217 = _1141 + 44;
                uint _1219 = uint(int(uint(_1217) >> uint(2)));
                float _1221 = as_type<float>(_39[int(_1219)]);
                float _1223 = _1157 * as_type<float>(_981);
                float _1225 = _987 * _1157;
                float _1227 = _993 * _1157;
                float _1229 = _1001 * _1157;
                float _1231 = fma(_1151, as_type<float>(_979), _1223);
                float _1233 = fma(_985, _1151, _1225);
                float _1235 = fma(_991, _1151, _1227);
                float _1237 = fma(_999, _1151, _1229);
                float _1239 = fma(_1163, as_type<float>(_983), _1231);
                float _1241 = _1183 * as_type<float>(_981);
                _1243 = fma(_989, _1163, _1233);
                _1245 = fma(_995, _1163, _1235);
                float _1247 = _987 * _1183;
                float _1249 = _993 * _1183;
                float _1251 = fma(_1177, as_type<float>(_979), _1241);
                _1253 = _1169 + _1239;
                float _1255 = fma(_985, _1177, _1247);
                float _1257 = fma(_991, _1177, _1249);
                float _1259 = fma(_1189, as_type<float>(_983), _1251);
                float _1261 = _1209 * as_type<float>(_981);
                _1263 = fma(_989, _1189, _1255);
                _1265 = fma(_995, _1189, _1257);
                float _1267 = _987 * _1209;
                float _1269 = _993 * _1209;
                float _1271 = _1001 * _1183;
                float _1273 = _1001 * _1209;
                float _1275 = fma(_1203, as_type<float>(_979), _1261);
                _1277 = _1195 + _1259;
                float _1279 = fma(_999, _1177, _1271);
                float _1281 = fma(_985, _1203, _1267);
                float _1283 = fma(_991, _1203, _1269);
                float _1285 = fma(_999, _1203, _1273);
                float _1287 = fma(_1215, as_type<float>(_983), _1275);
                _1289 = fma(_1003, _1163, _1237);
                _1291 = fma(_1003, _1189, _1279);
                _1293 = fma(_989, _1215, _1281);
                _1295 = fma(_995, _1215, _1283);
                _1297 = fma(_1003, _1215, _1285);
                _1299 = _1221 + _1287;
                uint _1301 = uint(int(uint(_997) >> uint(2)));
                _39[int(_1301)] = as_type<uint>(_1243);
                int _1303 = _997 + 4;
                uint _1305 = uint(int(uint(_1303) >> uint(2)));
                _39[int(_1305)] = as_type<uint>(_1245);
                int _1307 = _997 + 8;
                uint _1309 = uint(int(uint(_1307) >> uint(2)));
                _39[int(_1309)] = as_type<uint>(_1289);
                int _1311 = _997 + 12;
                uint _1313 = uint(int(uint(_1311) >> uint(2)));
                _39[int(_1313)] = as_type<uint>(_1253);
                int _1315 = _997 + 16;
                uint _1317 = uint(int(uint(_1315) >> uint(2)));
                _39[int(_1317)] = as_type<uint>(_1263);
                int _1319 = _997 + 20;
                uint _1321 = uint(int(uint(_1319) >> uint(2)));
                _39[int(_1321)] = as_type<uint>(_1265);
                int _1323 = _997 + 24;
                uint _1325 = uint(int(uint(_1323) >> uint(2)));
                _39[int(_1325)] = as_type<uint>(_1291);
                int _1327 = _997 + 28;
                uint _1329 = uint(int(uint(_1327) >> uint(2)));
                _39[int(_1329)] = as_type<uint>(_1277);
                int _1331 = _997 + 32;
                uint _1333 = uint(int(uint(_1331) >> uint(2)));
                _39[int(_1333)] = as_type<uint>(_1293);
                int _1335 = _997 + 36;
                uint _1337 = uint(int(uint(_1335) >> uint(2)));
                _39[int(_1337)] = as_type<uint>(_1295);
                int _1339 = _997 + 40;
                uint _1341 = uint(int(uint(_1339) >> uint(2)));
                _39[int(_1341)] = as_type<uint>(_1297);
                int _1343 = _997 + 44;
                uint _1345 = uint(int(uint(_1343) >> uint(2)));
                _39[int(_1345)] = as_type<uint>(_1299);
                _1145 = !_1197;
                _1143 = _1171;
            } while (_1145);
            _1081 = _1243;
            _1085 = _1245;
            _1089 = _1289;
            _1093 = _1253;
            _1097 = _1263;
            _1101 = _1265;
            _1105 = _1291;
            _1109 = _1277;
            _1113 = _1293;
            _1117 = _1295;
            _1121 = _1297;
            _1127 = _1299;
            _1347 = true;
        }
        else
        {
            _1081 = 0.0;
            _1085 = 0.0;
            _1089 = 0.0;
            _1093 = 0.0;
            _1097 = 0.0;
            _1101 = 0.0;
            _1105 = 0.0;
            _1109 = 0.0;
            _1113 = 0.0;
            _1117 = 0.0;
            _1121 = 0.0;
            _1127 = 0.0;
        }
    }
    _1347 = false;
    float _1349 = _1081;
    float _1351 = _1085;
    float _1353 = _1089;
    float _1355 = _1093;
    float _1357 = _1097;
    float _1359 = _1101;
    float _1361 = _1105;
    float _1363 = _1109;
    float _1365 = _1113;
    float _1367 = _1117;
    float _1369 = _1121;
    float _1371 = _1127;
    int _1373 = _1021 + 80;
    uint _1375 = uint(int(uint(_1373) >> uint(2)));
    uint _1377 = uint(int(uint(int(_1375)) >> uint(2)));
    int _1379 = int(_1375) & 3;
    float _1381 = (*spvDescriptorSet0.cp_c6)._m0[int(_1377)][_1379];
    int _1383 = int(_1375) + 1;
    uint _1385 = uint(int(uint(_1383) >> uint(2)));
    int _1387 = _1383 & 3;
    float _1389 = (*spvDescriptorSet0.cp_c6)._m0[int(_1385)][_1387];
    bool _1391 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1393 = _1021 + 64;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    uint _1397 = uint(int(uint(int(_1395)) >> uint(2)));
    int _1399 = int(_1395) & 3;
    float _1401 = (*spvDescriptorSet0.cp_c6)._m0[int(_1397)][_1399];
    int _1403 = int(_1395) + 1;
    uint _1405 = uint(int(uint(_1403) >> uint(2)));
    int _1407 = _1403 & 3;
    float _1409 = (*spvDescriptorSet0.cp_c6)._m0[int(_1405)][_1407];
    int _1411 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1413 = _1411 + _68;
    int _1415 = _1021 + 88;
    uint _1417 = uint(int(uint(_1415) >> uint(2)));
    uint _1419 = uint(int(uint(int(_1417)) >> uint(2)));
    int _1421 = int(_1417) & 3;
    float _1423 = (*spvDescriptorSet0.cp_c6)._m0[int(_1419)][_1421];
    int _1425 = int(_1417) + 1;
    uint _1427 = uint(int(uint(_1425) >> uint(2)));
    int _1429 = _1425 & 3;
    float _1431 = (*spvDescriptorSet0.cp_c6)._m0[int(_1427)][_1429];
    int _1433 = _1021 + 72;
    uint _1435 = uint(int(uint(_1433) >> uint(2)));
    uint _1437 = uint(int(uint(int(_1435)) >> uint(2)));
    int _1439 = int(_1435) & 3;
    float _1441 = (*spvDescriptorSet0.cp_c6)._m0[int(_1437)][_1439];
    int _1443 = int(_1435) + 1;
    uint _1445 = uint(int(uint(_1443) >> uint(2)));
    int _1447 = _1443 & 3;
    float _1449 = (*spvDescriptorSet0.cp_c6)._m0[int(_1445)][_1447];
    int _1451 = _1021 + 96;
    uint _1453 = uint(int(uint(_1451) >> uint(2)));
    uint _1455 = uint(int(uint(int(_1453)) >> uint(2)));
    int _1457 = int(_1453) & 3;
    float _1459 = (*spvDescriptorSet0.cp_c6)._m0[int(_1455)][_1457];
    int _1461 = int(_1453) + 1;
    uint _1463 = uint(int(uint(_1461) >> uint(2)));
    int _1465 = _1461 & 3;
    float _1467 = (*spvDescriptorSet0.cp_c6)._m0[int(_1463)][_1465];
    int _1469 = _1021 + 104;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    uint _1473 = uint(int(uint(int(_1471)) >> uint(2)));
    int _1475 = int(_1471) & 3;
    float _1477 = (*spvDescriptorSet0.cp_c6)._m0[int(_1473)][_1475];
    int _1479 = int(_1471) + 1;
    uint _1481 = uint(int(uint(_1479) >> uint(2)));
    int _1483 = _1479 & 3;
    float _1485 = (*spvDescriptorSet0.cp_c6)._m0[int(_1481)][_1483];
    int _1487 = _1021 + 16;
    uint _1489 = uint(int(uint(_1487) >> uint(2)));
    uint _1491 = uint(int(uint(int(_1489)) >> uint(2)));
    int _1493 = int(_1489) & 3;
    float _1495 = (*spvDescriptorSet0.cp_c6)._m0[int(_1491)][_1493];
    int _1497 = int(_1489) + 1;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    int _1501 = _1497 & 3;
    float _1503 = (*spvDescriptorSet0.cp_c6)._m0[int(_1499)][_1501];
    if (!_1391)
    {
        uint _1505 = uint(int(uint(_997) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1505)] = as_type<uint>(_1349);
        int _1507 = _997 + 4;
        uint _1509 = uint(int(uint(_1507) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1509)] = as_type<uint>(_1351);
        int _1511 = _997 + 8;
        uint _1513 = uint(int(uint(_1511) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1513)] = as_type<uint>(_1353);
        int _1515 = _997 + 12;
        uint _1517 = uint(int(uint(_1515) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1517)] = as_type<uint>(_1355);
        uint _1519 = uint(int(uint(_1023) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1519)] = as_type<uint>(_1357);
        int _1521 = _1023 + 4;
        uint _1523 = uint(int(uint(_1521) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1523)] = as_type<uint>(_1359);
        int _1525 = _1023 + 8;
        uint _1527 = uint(int(uint(_1525) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1527)] = as_type<uint>(_1361);
        int _1529 = _1023 + 12;
        uint _1531 = uint(int(uint(_1529) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1531)] = as_type<uint>(_1363);
        uint _1533 = uint(int(uint(_1041) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1533)] = as_type<uint>(_1365);
        int _1535 = _1041 + 4;
        uint _1537 = uint(int(uint(_1535) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1537)] = as_type<uint>(_1367);
        int _1539 = _1041 + 8;
        uint _1541 = uint(int(uint(_1539) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1541)] = as_type<uint>(_1369);
        int _1543 = _1041 + 12;
        uint _1545 = uint(int(uint(_1543) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1545)] = as_type<uint>(_1371);
    }
    float _1547 = _1359 * _1381;
    float _1549 = _1367 * _1381;
    int _1551 = _1021 + 32;
    uint _1553 = uint(int(uint(_1551) >> uint(2)));
    uint _1555 = uint(int(uint(int(_1553)) >> uint(2)));
    int _1557 = int(_1553) & 3;
    float _1559 = (*spvDescriptorSet0.cp_c6)._m0[int(_1555)][_1557];
    int _1561 = int(_1553) + 1;
    uint _1563 = uint(int(uint(_1561) >> uint(2)));
    int _1565 = _1561 & 3;
    float _1567 = (*spvDescriptorSet0.cp_c6)._m0[int(_1563)][_1565];
    float _1569 = _1351 * _1381;
    float _1571 = fma(_1357, _1401, _1547);
    float _1573 = fma(_1365, _1401, _1549);
    float _1575 = _1351 * _1389;
    float _1577 = _1359 * _1389;
    float _1579 = _1367 * _1389;
    float _1581 = _1351 * _1431;
    int _1583 = _1021 + 48;
    uint _1585 = uint(int(uint(_1583) >> uint(2)));
    uint _1587 = uint(int(uint(int(_1585)) >> uint(2)));
    int _1589 = int(_1585) & 3;
    float _1591 = (*spvDescriptorSet0.cp_c6)._m0[int(_1587)][_1589];
    int _1593 = int(_1585) + 1;
    uint _1595 = uint(int(uint(_1593) >> uint(2)));
    int _1597 = _1593 & 3;
    float _1599 = (*spvDescriptorSet0.cp_c6)._m0[int(_1595)][_1597];
    float _1601 = fma(_1349, _1409, _1575);
    float _1603 = _1351 * _1423;
    float _1605 = fma(_1357, _1409, _1577);
    float _1607 = fma(_1365, _1409, _1579);
    float _1609 = _1359 * _1423;
    float _1611 = _1359 * _1431;
    float _1613 = _1367 * _1423;
    float _1615 = _1367 * _1431;
    int _1617 = _1021 + 24;
    uint _1619 = uint(int(uint(_1617) >> uint(2)));
    uint _1621 = uint(int(uint(int(_1619)) >> uint(2)));
    int _1623 = int(_1619) & 3;
    float _1625 = (*spvDescriptorSet0.cp_c6)._m0[int(_1621)][_1623];
    int _1627 = int(_1619) + 1;
    uint _1629 = uint(int(uint(_1627) >> uint(2)));
    int _1631 = _1627 & 3;
    float _1633 = (*spvDescriptorSet0.cp_c6)._m0[int(_1629)][_1631];
    float _1635 = fma(_1349, _1441, _1603);
    float _1637 = fma(_1349, _1449, _1581);
    float _1639 = fma(_1357, _1441, _1609);
    float _1641 = fma(_1357, _1449, _1611);
    float _1643 = fma(_1365, _1441, _1613);
    float _1645 = fma(_1365, _1449, _1615);
    float _1647 = fma(_1353, _1467, _1601);
    int _1649 = _1021 + 40;
    uint _1651 = uint(int(uint(_1649) >> uint(2)));
    uint _1653 = uint(int(uint(int(_1651)) >> uint(2)));
    int _1655 = int(_1651) & 3;
    float _1657 = (*spvDescriptorSet0.cp_c6)._m0[int(_1653)][_1655];
    int _1659 = int(_1651) + 1;
    uint _1661 = uint(int(uint(_1659) >> uint(2)));
    int _1663 = _1659 & 3;
    float _1665 = (*spvDescriptorSet0.cp_c6)._m0[int(_1661)][_1663];
    float _1667 = fma(_1361, _1459, _1571);
    float _1669 = fma(_1361, _1467, _1605);
    float _1671 = fma(_1361, _1477, _1639);
    float _1673 = fma(_1361, _1485, _1641);
    float _1675 = fma(_1349, _1401, _1569);
    float _1677 = fma(_1353, _1485, _1637);
    float _1679 = fma(_1369, _1485, _1645);
    int _1681 = _1021 + 56;
    uint _1683 = uint(int(uint(_1681) >> uint(2)));
    uint _1685 = uint(int(uint(int(_1683)) >> uint(2)));
    int _1687 = int(_1683) & 3;
    float _1689 = (*spvDescriptorSet0.cp_c6)._m0[int(_1685)][_1687];
    int _1691 = int(_1683) + 1;
    uint _1693 = uint(int(uint(_1691) >> uint(2)));
    int _1695 = _1691 & 3;
    float _1697 = (*spvDescriptorSet0.cp_c6)._m0[int(_1693)][_1695];
    float _1699 = _1673 + _1363;
    float _1701 = fma(_1353, _1459, _1675);
    float _1703 = fma(_1353, _1477, _1635);
    float _1705 = _1677 + _1355;
    float _1707 = _1671 * _1503;
    float _1709 = _1699 * _1503;
    float _1711 = _1679 + _1371;
    float _1713 = fma(_1369, _1459, _1573);
    float _1715 = fma(_1369, _1467, _1607);
    float _1717 = fma(_1369, _1477, _1643);
    float _1719 = _1669 * _1503;
    float _1721 = _1667 * _1503;
    float _1723 = fma(_1703, _1495, _1707);
    float _1725 = fma(_1705, _1495, _1709);
    float _1727 = _1699 * _1567;
    float _1729 = _1667 * _1567;
    float _1731 = _1669 * _1567;
    float _1733 = _1671 * _1567;
    float _1735 = fma(_1705, _1559, _1727);
    float _1737 = fma(_1647, _1495, _1719);
    int _1739 = _1413 * 48;
    float _1741 = fma(_1701, _1495, _1721);
    float _1743 = _1699 * _1599;
    float _1745 = _1667 * _1599;
    float _1747 = _1669 * _1599;
    float _1749 = _1671 * _1599;
    float _1751 = fma(_1705, _1591, _1743);
    float _1753 = fma(_1701, _1559, _1729);
    float _1755 = fma(_1647, _1559, _1731);
    float _1757 = fma(_1703, _1559, _1733);
    float _1759 = fma(_1701, _1591, _1745);
    float _1761 = fma(_1711, _1625, _1725);
    float _1763 = fma(_1647, _1591, _1747);
    float _1765 = fma(_1703, _1591, _1749);
    float _1767 = fma(_1715, _1625, _1737);
    float _1769 = fma(_1713, _1625, _1741);
    float _1771 = fma(_1717, _1625, _1723);
    float _1773 = _1761 + _1633;
    int _1775 = _1739 + 16;
    float _1777 = fma(_1711, _1657, _1735);
    float _1779 = fma(_1713, _1657, _1753);
    float _1781 = fma(_1715, _1657, _1755);
    float _1783 = fma(_1717, _1657, _1757);
    float _1785 = _1777 + _1665;
    int _1787 = _1739 + 32;
    int _1789 = _1739 + 48;
    float _1791 = fma(_1711, _1689, _1751);
    float _1793 = fma(_1713, _1689, _1759);
    float _1795 = fma(_1715, _1689, _1763);
    float _1797 = fma(_1717, _1689, _1765);
    float _1799 = _1791 + _1697;
    uint _1801 = uint(int(uint(_1775) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1801)] = as_type<uint>(_1769);
    int _1803 = _1775 + 4;
    uint _1805 = uint(int(uint(_1803) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1805)] = as_type<uint>(_1767);
    int _1807 = _1775 + 8;
    uint _1809 = uint(int(uint(_1807) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1809)] = as_type<uint>(_1771);
    int _1811 = _1775 + 12;
    uint _1813 = uint(int(uint(_1811) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1813)] = as_type<uint>(_1773);
    uint _1815 = uint(int(uint(_1787) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1815)] = as_type<uint>(_1779);
    int _1817 = _1787 + 4;
    uint _1819 = uint(int(uint(_1817) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1819)] = as_type<uint>(_1781);
    int _1821 = _1787 + 8;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1823)] = as_type<uint>(_1783);
    int _1825 = _1787 + 12;
    uint _1827 = uint(int(uint(_1825) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1827)] = as_type<uint>(_1785);
    uint _1829 = uint(int(uint(_1789) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1829)] = as_type<uint>(_1793);
    int _1831 = _1789 + 4;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1833)] = as_type<uint>(_1795);
    int _1835 = _1789 + 8;
    uint _1837 = uint(int(uint(_1835) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1837)] = as_type<uint>(_1797);
    int _1839 = _1789 + 12;
    uint _1841 = uint(int(uint(_1839) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1841)] = as_type<uint>(_1799);
}

