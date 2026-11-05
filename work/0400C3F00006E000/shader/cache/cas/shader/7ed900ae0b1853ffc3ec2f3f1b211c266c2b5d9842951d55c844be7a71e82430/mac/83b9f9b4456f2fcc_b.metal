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
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _4160, thread const int& _4161, constant _10& support_buffer)
{
    int _4164 = 1 + _4161;
    float _4166 = support_buffer._m5[_4164].x;
    bool _4168 = _4166 == 1.0;
    if (_4168)
    {
        return _4160;
    }
    float _4170 = float(_4160);
    float _4172 = _4170 * _4166;
    int _4174 = int(_4172);
    return _4174;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1225 = false;
    bool _763 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    float _72 = _62;
    if (_70)
    {
        return;
    }
    int _74 = _66 & 31;
    bool _76 = _74 == 0;
    bool _78 = uint(_74) < 32u;
    int _80 = 32 - _74;
    int _82 = _74 - 32;
    int _84 = 1 << _74;
    uint _87 = uint(int(uint(0) >> uint(_80)));
    int _89 = _84 | int(_87);
    int _91 = _76 ? 1 : _89;
    bool _93 = uint(_82) < 32u;
    int _95 = 0 << _82;
    int _97 = _93 ? _95 : 0;
    int _99 = _78 ? _91 : _97;
    int _101 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _103 = _101 + 32;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = _99 & as_type<int>(_111);
    bool _115 = _113 != 0;
    float _117 = 0.0;
    float _119 = 0.0;
    if (!_115)
    {
        _117 = 0.0;
        _119 = 0.0;
    }
    float _121 = _117;
    float _123 = _119;
    float _125 = 0.0;
    float _127 = _121;
    float _129 = _123;
    if (!_115)
    {
        _125 = 0.0;
    }
    float _131 = _125;
    float _133 = 0.0;
    float _135 = 0.0;
    float _137 = _131;
    if (!_115)
    {
        _133 = 0.0;
        _135 = 0.0;
    }
    float _139 = _133;
    float _141 = _135;
    float _143 = 0.0;
    float _145 = _139;
    float _147 = _141;
    if (!_115)
    {
        _143 = 0.0;
    }
    float _149 = _143;
    float _151 = 0.0;
    float _153 = _149;
    if (!_115)
    {
        _151 = 0.0;
    }
    float _155 = _151;
    float _157 = 0.0;
    float _159 = _155;
    if (!_115)
    {
        _157 = 0.0;
    }
    float _161 = _157;
    float _163 = _161;
    if (!_115)
    {
        _72 = 0.0;
    }
    float _165 = _72;
    bool _167 = !_115;
    float _169 = _165;
    if (!_167)
    {
        uint _171 = uint(int(uint(_101) >> uint(2)));
        uint _173 = uint(int(uint(int(_171)) >> uint(2)));
        int _175 = int(_171) & 3;
        float _177 = (*spvDescriptorSet0.cp_c5)._m0[int(_173)][_175];
        int _179 = int(_171) + 1;
        uint _181 = uint(int(uint(_179) >> uint(2)));
        int _183 = _179 & 3;
        float _185 = (*spvDescriptorSet0.cp_c5)._m0[int(_181)][_183];
        int _187 = _66;
        int _189 = 0;
        int _191 = _56(_187, _189, (*spvDescriptorSet0.support_buffer));
        int _193 = as_type<int>(_177);
        int _195 = 0;
        int _197 = _56(_193, _195, (*spvDescriptorSet0.support_buffer));
        int3 _1862 = int3(_191, _197, 1);
        float3 _201 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1862.xy), uint(_1862.z), 0).xyz;
        float _203 = _201.x;
        float _205 = _201.y;
        float _207 = _201.z;
        int _209 = _66;
        int _211 = 0;
        int _213 = _56(_209, _211, (*spvDescriptorSet0.support_buffer));
        int _215 = as_type<int>(_185);
        int _217 = 0;
        int _219 = _56(_215, _217, (*spvDescriptorSet0.support_buffer));
        int3 _1880 = int3(_213, _219, 1);
        float3 _221 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1880.xy), uint(_1880.z), 0).xyz;
        float _223 = _221.x;
        float _225 = _221.y;
        float _227 = _221.z;
        int _229 = _66;
        int _231 = 0;
        int _233 = _56(_229, _231, (*spvDescriptorSet0.support_buffer));
        int _235 = as_type<int>(_177);
        int _237 = 0;
        int _239 = _56(_235, _237, (*spvDescriptorSet0.support_buffer));
        int3 _1898 = int3(_233, _239, 0);
        float3 _241 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1898.xy), uint(_1898.z), 0).xyz;
        float _243 = _241.x;
        float _245 = _241.y;
        float _247 = _241.z;
        int _249 = _66;
        int _251 = 0;
        int _253 = _56(_249, _251, (*spvDescriptorSet0.support_buffer));
        int _255 = as_type<int>(_185);
        int _257 = 0;
        int _259 = _56(_255, _257, (*spvDescriptorSet0.support_buffer));
        int3 _1916 = int3(_253, _259, 0);
        float3 _261 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1916.xy), uint(_1916.z), 0).xyz;
        float _263 = _261.x;
        float _265 = _261.y;
        float _267 = _261.z;
        int _269 = _66;
        int _271 = 0;
        int _273 = _56(_269, _271, (*spvDescriptorSet0.support_buffer));
        int _275 = as_type<int>(_177);
        int _277 = 0;
        int _279 = _56(_275, _277, (*spvDescriptorSet0.support_buffer));
        int3 _1934 = int3(_273, _279, 2);
        float3 _281 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1934.xy), uint(_1934.z), 0).xyz;
        float _283 = _281.x;
        float _285 = _281.y;
        float _287 = _281.z;
        int _289 = _66;
        int _291 = 0;
        int _293 = _56(_289, _291, (*spvDescriptorSet0.support_buffer));
        int _295 = as_type<int>(_185);
        int _297 = 0;
        int _299 = _56(_295, _297, (*spvDescriptorSet0.support_buffer));
        int3 _1952 = int3(_293, _299, 2);
        float3 _301 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1952.xy), uint(_1952.z), 0).xyz;
        float _303 = _301.x;
        float _305 = _301.y;
        float _307 = _301.z;
        int _309 = _101 + 16;
        uint _311 = uint(int(uint(_309) >> uint(2)));
        uint _313 = uint(int(uint(int(_311)) >> uint(2)));
        int _315 = int(_311) & 3;
        float _317 = (*spvDescriptorSet0.cp_c5)._m0[int(_313)][_315];
        float _319 = -_203;
        float _321 = _319 + _223;
        float _323 = -_207;
        float _325 = _323 + _227;
        float _327 = -_245;
        float _329 = _327 + _265;
        float _331 = -_205;
        float _333 = _331 + _225;
        float _335 = fma(_321, _317, _203);
        float _337 = fma(_325, _317, _207);
        float _339 = -_243;
        float _341 = _339 + _263;
        float _343 = -_247;
        float _345 = _343 + _267;
        float _347 = -_283;
        float _349 = _347 + _303;
        float _351 = -_285;
        float _353 = _351 + _305;
        float _355 = -_287;
        float _357 = _355 + _307;
        float _359 = fma(_329, _317, _245);
        float _361 = fma(_333, _317, _205);
        float _363 = fma(_341, _317, _243);
        float _365 = fma(_345, _317, _247);
        float _367 = fma(_349, _317, _283);
        float _369 = fma(_353, _317, _285);
        float _371 = fma(_357, _317, _287);
        _169 = _337;
        _145 = _335;
        _147 = _361;
        _127 = _363;
        _163 = _371;
        _159 = _369;
        _129 = _359;
        _137 = _365;
        _153 = _367;
    }
    float _373 = _169;
    float _375 = _145;
    float _377 = _147;
    float _379 = _127;
    float _381 = _163;
    float _383 = _159;
    float _385 = _129;
    float _387 = _137;
    float _389 = _153;
    int _391 = _101 + 36;
    uint _393 = uint(int(uint(_391) >> uint(2)));
    uint _395 = uint(int(uint(int(_393)) >> uint(2)));
    int _397 = int(_393) & 3;
    float _399 = (*spvDescriptorSet0.cp_c5)._m0[int(_395)][_397];
    int _401 = _99 & as_type<int>(_399);
    bool _403 = _401 != 0;
    bool _405 = !_403;
    float _407 = _379;
    int _409 = as_type<int>(_389);
    int _411 = as_type<int>(_383);
    int _413 = as_type<int>(_381);
    float _415 = _385;
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
    float _755;
    float _757;
    float _759;
    float _761;
    if (!_405)
    {
        int _417 = _101 + 8;
        uint _419 = uint(int(uint(_417) >> uint(2)));
        uint _421 = uint(int(uint(int(_419)) >> uint(2)));
        int _423 = int(_419) & 3;
        float _425 = (*spvDescriptorSet0.cp_c5)._m0[int(_421)][_423];
        int _427 = int(_419) + 1;
        uint _429 = uint(int(uint(_427) >> uint(2)));
        int _431 = _427 & 3;
        float _433 = (*spvDescriptorSet0.cp_c5)._m0[int(_429)][_431];
        int _435 = _66;
        int _437 = 1;
        int _439 = _56(_435, _437, (*spvDescriptorSet0.support_buffer));
        int _441 = as_type<int>(_425);
        int _443 = 1;
        int _445 = _56(_441, _443, (*spvDescriptorSet0.support_buffer));
        int3 _2157 = int3(_439, _445, 1);
        float3 _447 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2157.xy), uint(_2157.z), 0).xyz;
        float _449 = _447.x;
        float _451 = _447.y;
        float _453 = _447.z;
        int _455 = _66;
        int _457 = 1;
        int _459 = _56(_455, _457, (*spvDescriptorSet0.support_buffer));
        int _461 = as_type<int>(_433);
        int _463 = 1;
        int _465 = _56(_461, _463, (*spvDescriptorSet0.support_buffer));
        int3 _2175 = int3(_459, _465, 1);
        float3 _467 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2175.xy), uint(_2175.z), 0).xyz;
        float _469 = _467.x;
        float _471 = _467.y;
        float _473 = _467.z;
        int _475 = _66;
        int _477 = 1;
        int _479 = _56(_475, _477, (*spvDescriptorSet0.support_buffer));
        int _481 = as_type<int>(_425);
        int _483 = 1;
        int _485 = _56(_481, _483, (*spvDescriptorSet0.support_buffer));
        int3 _2193 = int3(_479, _485, 0);
        float3 _487 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2193.xy), uint(_2193.z), 0).xyz;
        float _489 = _487.x;
        float _491 = _487.y;
        float _493 = _487.z;
        int _495 = _66;
        int _497 = 1;
        int _499 = _56(_495, _497, (*spvDescriptorSet0.support_buffer));
        int _501 = as_type<int>(_433);
        int _503 = 1;
        int _505 = _56(_501, _503, (*spvDescriptorSet0.support_buffer));
        int3 _2211 = int3(_499, _505, 0);
        float3 _507 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2211.xy), uint(_2211.z), 0).xyz;
        float _509 = _507.x;
        float _511 = _507.y;
        float _513 = _507.z;
        int _515 = _66;
        int _517 = 1;
        int _519 = _56(_515, _517, (*spvDescriptorSet0.support_buffer));
        int _521 = as_type<int>(_425);
        int _523 = 1;
        int _525 = _56(_521, _523, (*spvDescriptorSet0.support_buffer));
        int3 _2229 = int3(_519, _525, 2);
        float3 _527 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2229.xy), uint(_2229.z), 0).xyz;
        float _529 = _527.x;
        float _531 = _527.y;
        float _533 = _527.z;
        int _535 = _66;
        int _537 = 1;
        int _539 = _56(_535, _537, (*spvDescriptorSet0.support_buffer));
        int _541 = as_type<int>(_433);
        int _543 = 1;
        int _545 = _56(_541, _543, (*spvDescriptorSet0.support_buffer));
        int3 _2247 = int3(_539, _545, 2);
        float3 _547 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2247.xy), uint(_2247.z), 0).xyz;
        float _549 = _547.x;
        float _551 = _547.y;
        float _553 = _547.z;
        int _555 = _101 + 24;
        uint _557 = uint(int(uint(_555) >> uint(2)));
        uint _559 = uint(int(uint(int(_557)) >> uint(2)));
        int _561 = int(_557) & 3;
        float _563 = (*spvDescriptorSet0.cp_c5)._m0[int(_559)][_561];
        int _565 = int(_557) + 1;
        uint _567 = uint(int(uint(_565) >> uint(2)));
        int _569 = _565 & 3;
        float _571 = (*spvDescriptorSet0.cp_c5)._m0[int(_567)][_569];
        int _573 = _101 + 20;
        uint _575 = uint(int(uint(_573) >> uint(2)));
        uint _577 = uint(int(uint(int(_575)) >> uint(2)));
        int _579 = int(_575) & 3;
        float _581 = (*spvDescriptorSet0.cp_c5)._m0[int(_577)][_579];
        float _583 = -_453;
        float _585 = _583 + _473;
        float _587 = -_449;
        float _589 = _587 + _469;
        float _591 = fma(_585, _563, _453);
        float _593 = fma(_589, _563, _449);
        float _595 = _591 * _571;
        float _597 = _593 * _571;
        float _599 = fma(_373, _581, _595);
        float _601 = -_451;
        float _603 = _601 + _471;
        float _605 = fma(_375, _581, _597);
        float _607 = _599 * 0.15915493667125701904296875;
        float _609 = fma(_603, _563, _451);
        float _611 = _605 * 0.15915493667125701904296875;
        float _613 = _607 * 6.283185482025146484375;
        float _615 = sin(_613);
        float _617 = _609 * _571;
        float _619 = fma(_377, _581, _617);
        float _621 = _611 * 6.283185482025146484375;
        float _623 = cos(_621);
        float _625 = _619 * 0.15915493667125701904296875;
        float _627 = -_489;
        float _629 = _627 + _509;
        float _631 = -_493;
        float _633 = _631 + _513;
        float _635 = -_533;
        float _637 = _635 + _553;
        float _639 = fma(_629, _563, _489);
        float _641 = fma(_633, _563, _493);
        float _643 = _607 * 6.283185482025146484375;
        float _645 = cos(_643);
        float _647 = -_531;
        float _649 = _647 + _551;
        float _651 = _639 * _571;
        float _653 = fma(_637, _563, _533);
        float _655 = _641 * _571;
        float _657 = fma(_649, _563, _531);
        float _659 = fma(_379, _581, _651);
        float _661 = _653 * _571;
        float _663 = _625 * 6.283185482025146484375;
        float _665 = cos(_663);
        float _667 = _615 * _623;
        float _669 = _657 * _571;
        float _671 = fma(_381, _581, _661);
        float _673 = fma(_383, _581, _669);
        float _675 = _611 * 6.283185482025146484375;
        float _677 = sin(_675);
        float _679 = _623 * _645;
        float _681 = _625 * 6.283185482025146484375;
        float _683 = sin(_681);
        float _685 = _623 * _665;
        float _687 = _665 * _645;
        float _689 = _615 * _665;
        float _691 = _677 * _665;
        float _693 = _677 * _615;
        float _695 = -_491;
        float _697 = _695 + _511;
        float _699 = fma(_697, _563, _491);
        float _701 = _677 * _683;
        float _703 = _677 * _645;
        float _705 = -_667;
        float _707 = fma(_645, _701, _705);
        float _709 = -_703;
        float _711 = fma(_683, _667, _709);
        float _713 = -_529;
        float _715 = _713 + _549;
        float _717 = fma(_615, _701, _679);
        float _719 = fma(_683, _679, _693);
        float _721 = _699 * _571;
        float _723 = fma(_715, _563, _529);
        float _725 = fma(_385, _581, _721);
        float _727 = _723 * _571;
        float _729 = fma(_387, _581, _655);
        float _731 = fma(_389, _581, _727);
        _407 = _659;
        _733 = _683;
        _735 = _687;
        _737 = _689;
        _739 = _725;
        _741 = _707;
        _743 = _717;
        _745 = _691;
        _747 = _729;
        _749 = _719;
        _751 = _711;
        _753 = _685;
        _409 = as_type<int>(_731);
        _411 = as_type<int>(_673);
        _413 = as_type<int>(_671);
        _415 = _727;
        _755 = _669;
        _757 = _723;
        _759 = _661;
        _761 = _693;
        _763 = true;
    }
    else
    {
        float _765 = _375 * 0.15915493667125701904296875;
        float _767 = _373 * 0.15915493667125701904296875;
        float _769 = _377 * 0.15915493667125701904296875;
        float _771 = _765 * 6.283185482025146484375;
        float _773 = sin(_771);
        float _775 = _765 * 6.283185482025146484375;
        float _777 = cos(_775);
        float _779 = _767 * 6.283185482025146484375;
        float _781 = sin(_779);
        float _783 = _767 * 6.283185482025146484375;
        float _785 = cos(_783);
        float _787 = _769 * 6.283185482025146484375;
        float _789 = cos(_787);
        float _791 = _781 * _777;
        float _793 = _773 * _781;
        float _795 = _769 * 6.283185482025146484375;
        float _797 = sin(_795);
        float _799 = _777 * _785;
        float _801 = _777 * _789;
        float _803 = _789 * _785;
        float _805 = _781 * _789;
        float _807 = _773 * _789;
        float _809 = _773 * _785;
        float _811 = _773 * _797;
        float _813 = -_791;
        float _815 = fma(_785, _811, _813);
        float _817 = fma(_781, _811, _799);
        float _819 = -_809;
        float _821 = fma(_797, _791, _819);
        float _823 = fma(_797, _799, _793);
        _733 = _797;
        _735 = _803;
        _737 = _805;
        _739 = _385;
        _741 = _815;
        _743 = _817;
        _745 = _807;
        _747 = _387;
        _749 = _823;
        _751 = _821;
        _753 = _801;
        _755 = _769;
        _757 = _799;
        _759 = _767;
        _761 = _791;
    }
    _763 = false;
    float _825 = _407;
    float _827 = _733;
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
    int _849 = _409;
    int _851 = _411;
    int _853 = _413;
    float _855 = _415;
    float _857 = _755;
    float _859 = _757;
    float _861 = _759;
    float _863 = _761;
    float _865 = _825 * _827;
    float _867 = _825 * _829;
    float _869 = _825 * _831;
    float _871 = _833 * _835;
    float _873 = _833 * _837;
    float _875 = _833 * _839;
    int _877 = _66 * 48;
    float _879 = _841 * _843;
    float _881 = _841 * _845;
    float _883 = _841 * _847;
    float _885 = -_865;
    float _887 = _885 + (-0.0);
    bool _889 = _66 != 0;
    uint _891 = uint(int(uint(_877) >> uint(2)));
    _37[int(_891)] = as_type<uint>(_867);
    int _893 = _877 + 4;
    uint _895 = uint(int(uint(_893) >> uint(2)));
    _37[int(_895)] = as_type<uint>(_871);
    int _897 = _877 + 8;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    _37[int(_899)] = as_type<uint>(_879);
    int _901 = _877 + 12;
    uint _903 = uint(int(uint(_901) >> uint(2)));
    _37[int(_903)] = uint(_849);
    int _905 = _66 * 112;
    int _907 = _877 + 16;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    _37[int(_909)] = as_type<uint>(_869);
    int _911 = _877 + 20;
    uint _913 = uint(int(uint(_911) >> uint(2)));
    _37[int(_913)] = as_type<uint>(_873);
    int _915 = _877 + 24;
    uint _917 = uint(int(uint(_915) >> uint(2)));
    _37[int(_917)] = as_type<uint>(_881);
    int _919 = _877 + 28;
    uint _921 = uint(int(uint(_919) >> uint(2)));
    _37[int(_921)] = uint(_851);
    int _923 = _877 + 32;
    uint _925 = uint(int(uint(_923) >> uint(2)));
    _37[int(_925)] = as_type<uint>(_887);
    int _927 = _877 + 36;
    uint _929 = uint(int(uint(_927) >> uint(2)));
    _37[int(_929)] = as_type<uint>(_875);
    int _931 = _877 + 40;
    uint _933 = uint(int(uint(_931) >> uint(2)));
    _37[int(_933)] = as_type<uint>(_883);
    int _935 = _877 + 44;
    uint _937 = uint(int(uint(_935) >> uint(2)));
    _37[int(_937)] = uint(_853);
    float _939 = _863;
    float _941 = _861;
    float _943 = _859;
    float _945 = _857;
    float _947 = _825;
    float _949 = _855;
    float _951 = _841;
    float _953 = _833;
    float _955 = _827;
    float _957 = _887;
    float _959 = _883;
    float _961 = as_type<float>(_853);
    if (!_889)
    {
        _939 = _867;
    }
    float _963 = _939;
    float _965 = _963;
    if (!_889)
    {
        _941 = _871;
    }
    float _967 = _941;
    float _969 = _967;
    if (!_889)
    {
        _943 = _879;
    }
    float _971 = _943;
    float _973 = _971;
    if (!_889)
    {
        _945 = as_type<float>(_849);
    }
    float _975 = _945;
    float _977 = _975;
    if (!_889)
    {
        _947 = _869;
    }
    float _979 = _947;
    float _981 = _979;
    if (!_889)
    {
        _949 = _873;
    }
    float _983 = _949;
    float _985 = _983;
    if (!_889)
    {
        _951 = _881;
    }
    float _987 = _951;
    float _989 = _987;
    if (!_889)
    {
        _953 = as_type<float>(_851);
    }
    float _991 = _953;
    float _993 = _991;
    if (!_889)
    {
        _955 = _875;
    }
    float _995 = _955;
    bool _997 = !_889;
    float _999 = _995;
    if (!_997)
    {
        bool _1001 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1003 = !_1001;
        if (!_1003)
        {
            uint _1005 = uint(int(uint(_905) >> uint(2)));
            uint _1007 = uint(int(uint(int(_1005)) >> uint(2)));
            int _1009 = int(_1005) & 3;
            float _1011 = (*spvDescriptorSet0.cp_c6)._m0[int(_1007)][_1009];
            int _1013 = as_type<int>(_1011) * 48;
            int _1015 = 0;
            bool _1017;
            float _1115;
            float _1117;
            float _1119;
            float _1127;
            float _1143;
            float _1145;
            float _1157;
            float _1167;
            float _1171;
            float _1173;
            float _1175;
            float _1177;
            do
            {
                int _1019 = _1015;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1021 = uint(int(uint(_1013) >> uint(2)));
                float _1023 = as_type<float>(_37[int(_1021)]);
                int _1025 = _1013 + 4;
                uint _1027 = uint(int(uint(_1025) >> uint(2)));
                float _1029 = as_type<float>(_37[int(_1027)]);
                int _1031 = _1013 + 8;
                uint _1033 = uint(int(uint(_1031) >> uint(2)));
                float _1035 = as_type<float>(_37[int(_1033)]);
                int _1037 = _1013 + 12;
                uint _1039 = uint(int(uint(_1037) >> uint(2)));
                float _1041 = as_type<float>(_37[int(_1039)]);
                int _1043 = _1019 + 1;
                int _1045 = _1013 + 16;
                uint _1047 = uint(int(uint(_1045) >> uint(2)));
                float _1049 = as_type<float>(_37[int(_1047)]);
                int _1051 = _1013 + 20;
                uint _1053 = uint(int(uint(_1051) >> uint(2)));
                float _1055 = as_type<float>(_37[int(_1053)]);
                int _1057 = _1013 + 24;
                uint _1059 = uint(int(uint(_1057) >> uint(2)));
                float _1061 = as_type<float>(_37[int(_1059)]);
                int _1063 = _1013 + 28;
                uint _1065 = uint(int(uint(_1063) >> uint(2)));
                float _1067 = as_type<float>(_37[int(_1065)]);
                bool _1069 = uint(_1043) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1071 = _1013 + 32;
                uint _1073 = uint(int(uint(_1071) >> uint(2)));
                float _1075 = as_type<float>(_37[int(_1073)]);
                int _1077 = _1013 + 36;
                uint _1079 = uint(int(uint(_1077) >> uint(2)));
                float _1081 = as_type<float>(_37[int(_1079)]);
                int _1083 = _1013 + 40;
                uint _1085 = uint(int(uint(_1083) >> uint(2)));
                float _1087 = as_type<float>(_37[int(_1085)]);
                int _1089 = _1013 + 44;
                uint _1091 = uint(int(uint(_1089) >> uint(2)));
                float _1093 = as_type<float>(_37[int(_1091)]);
                float _1095 = _1029 * as_type<float>(_851);
                float _1097 = _869 * _1029;
                float _1099 = _873 * _1029;
                float _1101 = _881 * _1029;
                float _1103 = fma(_1023, as_type<float>(_849), _1095);
                float _1105 = fma(_867, _1023, _1097);
                float _1107 = fma(_871, _1023, _1099);
                float _1109 = fma(_879, _1023, _1101);
                float _1111 = fma(_1035, as_type<float>(_853), _1103);
                float _1113 = -_865;
                _1115 = fma(_1113, _1035, _1105);
                _1117 = fma(_875, _1035, _1107);
                _1119 = fma(_883, _1035, _1109);
                float _1121 = _1055 * as_type<float>(_851);
                float _1123 = _869 * _1055;
                float _1125 = _873 * _1055;
                _1127 = _1041 + _1111;
                float _1129 = fma(_1049, as_type<float>(_849), _1121);
                float _1131 = fma(_867, _1049, _1123);
                float _1133 = fma(_871, _1049, _1125);
                float _1135 = _881 * _1055;
                float _1137 = fma(_1061, as_type<float>(_853), _1129);
                float _1139 = _1081 * as_type<float>(_851);
                float _1141 = -_865;
                _1143 = fma(_1141, _1061, _1131);
                _1145 = fma(_875, _1061, _1133);
                float _1147 = _869 * _1081;
                float _1149 = _873 * _1081;
                float _1151 = _881 * _1081;
                float _1153 = fma(_1075, as_type<float>(_849), _1139);
                float _1155 = fma(_879, _1049, _1135);
                _1157 = _1067 + _1137;
                float _1159 = fma(_867, _1075, _1147);
                float _1161 = fma(_871, _1075, _1149);
                float _1163 = fma(_879, _1075, _1151);
                float _1165 = fma(_1087, as_type<float>(_853), _1153);
                _1167 = fma(_883, _1061, _1155);
                float _1169 = -_865;
                _1171 = fma(_1169, _1087, _1159);
                _1173 = fma(_875, _1087, _1161);
                _1175 = fma(_883, _1087, _1163);
                _1177 = _1093 + _1165;
                uint _1179 = uint(int(uint(_877) >> uint(2)));
                _37[int(_1179)] = as_type<uint>(_1115);
                int _1181 = _877 + 4;
                uint _1183 = uint(int(uint(_1181) >> uint(2)));
                _37[int(_1183)] = as_type<uint>(_1117);
                int _1185 = _877 + 8;
                uint _1187 = uint(int(uint(_1185) >> uint(2)));
                _37[int(_1187)] = as_type<uint>(_1119);
                int _1189 = _877 + 12;
                uint _1191 = uint(int(uint(_1189) >> uint(2)));
                _37[int(_1191)] = as_type<uint>(_1127);
                int _1193 = _877 + 16;
                uint _1195 = uint(int(uint(_1193) >> uint(2)));
                _37[int(_1195)] = as_type<uint>(_1143);
                int _1197 = _877 + 20;
                uint _1199 = uint(int(uint(_1197) >> uint(2)));
                _37[int(_1199)] = as_type<uint>(_1145);
                int _1201 = _877 + 24;
                uint _1203 = uint(int(uint(_1201) >> uint(2)));
                _37[int(_1203)] = as_type<uint>(_1167);
                int _1205 = _877 + 28;
                uint _1207 = uint(int(uint(_1205) >> uint(2)));
                _37[int(_1207)] = as_type<uint>(_1157);
                int _1209 = _877 + 32;
                uint _1211 = uint(int(uint(_1209) >> uint(2)));
                _37[int(_1211)] = as_type<uint>(_1171);
                int _1213 = _877 + 36;
                uint _1215 = uint(int(uint(_1213) >> uint(2)));
                _37[int(_1215)] = as_type<uint>(_1173);
                int _1217 = _877 + 40;
                uint _1219 = uint(int(uint(_1217) >> uint(2)));
                _37[int(_1219)] = as_type<uint>(_1175);
                int _1221 = _877 + 44;
                uint _1223 = uint(int(uint(_1221) >> uint(2)));
                _37[int(_1223)] = as_type<uint>(_1177);
                _1017 = !_1069;
                _1015 = _1043;
            } while (_1017);
            _999 = _1173;
            _969 = _1117;
            _985 = _1145;
            _957 = _1171;
            _965 = _1115;
            _981 = _1143;
            _989 = _1167;
            _959 = _1175;
            _973 = _1119;
            _993 = _1157;
            _977 = _1127;
            _961 = _1177;
            _1225 = true;
        }
        else
        {
            _999 = 0.0;
            _969 = 0.0;
            _985 = 0.0;
            _957 = 0.0;
            _965 = 0.0;
            _981 = 0.0;
            _989 = 0.0;
            _959 = 0.0;
            _973 = 0.0;
            _993 = 0.0;
            _977 = 0.0;
            _961 = 0.0;
        }
    }
    _1225 = false;
    float _1227 = _999;
    float _1229 = _969;
    float _1231 = _985;
    float _1233 = _957;
    float _1235 = _965;
    float _1237 = _981;
    float _1239 = _989;
    float _1241 = _959;
    float _1243 = _973;
    float _1245 = _993;
    float _1247 = _977;
    float _1249 = _961;
    int _1251 = _905 + 80;
    uint _1253 = uint(int(uint(_1251) >> uint(2)));
    uint _1255 = uint(int(uint(int(_1253)) >> uint(2)));
    int _1257 = int(_1253) & 3;
    float _1259 = (*spvDescriptorSet0.cp_c6)._m0[int(_1255)][_1257];
    int _1261 = int(_1253) + 1;
    uint _1263 = uint(int(uint(_1261) >> uint(2)));
    int _1265 = _1261 & 3;
    float _1267 = (*spvDescriptorSet0.cp_c6)._m0[int(_1263)][_1265];
    int _1269 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1271 = _1269 + _66;
    int _1273 = _905 + 64;
    uint _1275 = uint(int(uint(_1273) >> uint(2)));
    uint _1277 = uint(int(uint(int(_1275)) >> uint(2)));
    int _1279 = int(_1275) & 3;
    float _1281 = (*spvDescriptorSet0.cp_c6)._m0[int(_1277)][_1279];
    int _1283 = int(_1275) + 1;
    uint _1285 = uint(int(uint(_1283) >> uint(2)));
    int _1287 = _1283 & 3;
    float _1289 = (*spvDescriptorSet0.cp_c6)._m0[int(_1285)][_1287];
    int _1291 = _1271 * 48;
    int _1293 = _905 + 88;
    uint _1295 = uint(int(uint(_1293) >> uint(2)));
    uint _1297 = uint(int(uint(int(_1295)) >> uint(2)));
    int _1299 = int(_1295) & 3;
    float _1301 = (*spvDescriptorSet0.cp_c6)._m0[int(_1297)][_1299];
    int _1303 = int(_1295) + 1;
    uint _1305 = uint(int(uint(_1303) >> uint(2)));
    int _1307 = _1303 & 3;
    float _1309 = (*spvDescriptorSet0.cp_c6)._m0[int(_1305)][_1307];
    int _1311 = _905 + 72;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    uint _1315 = uint(int(uint(int(_1313)) >> uint(2)));
    int _1317 = int(_1313) & 3;
    float _1319 = (*spvDescriptorSet0.cp_c6)._m0[int(_1315)][_1317];
    int _1321 = int(_1313) + 1;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    int _1325 = _1321 & 3;
    float _1327 = (*spvDescriptorSet0.cp_c6)._m0[int(_1323)][_1325];
    int _1329 = _905 + 96;
    uint _1331 = uint(int(uint(_1329) >> uint(2)));
    uint _1333 = uint(int(uint(int(_1331)) >> uint(2)));
    int _1335 = int(_1331) & 3;
    float _1337 = (*spvDescriptorSet0.cp_c6)._m0[int(_1333)][_1335];
    int _1339 = int(_1331) + 1;
    uint _1341 = uint(int(uint(_1339) >> uint(2)));
    int _1343 = _1339 & 3;
    float _1345 = (*spvDescriptorSet0.cp_c6)._m0[int(_1341)][_1343];
    int _1347 = _905 + 104;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    uint _1351 = uint(int(uint(int(_1349)) >> uint(2)));
    int _1353 = int(_1349) & 3;
    float _1355 = (*spvDescriptorSet0.cp_c6)._m0[int(_1351)][_1353];
    int _1357 = int(_1349) + 1;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    int _1361 = _1357 & 3;
    float _1363 = (*spvDescriptorSet0.cp_c6)._m0[int(_1359)][_1361];
    float _1365 = _1227 * _1259;
    int _1367 = _905 + 16;
    uint _1369 = uint(int(uint(_1367) >> uint(2)));
    uint _1371 = uint(int(uint(int(_1369)) >> uint(2)));
    int _1373 = int(_1369) & 3;
    float _1375 = (*spvDescriptorSet0.cp_c6)._m0[int(_1371)][_1373];
    int _1377 = int(_1369) + 1;
    uint _1379 = uint(int(uint(_1377) >> uint(2)));
    int _1381 = _1377 & 3;
    float _1383 = (*spvDescriptorSet0.cp_c6)._m0[int(_1379)][_1381];
    float _1385 = _1229 * _1259;
    float _1387 = _1231 * _1259;
    float _1389 = _1231 * _1267;
    float _1391 = fma(_1233, _1281, _1365);
    float _1393 = _1227 * _1267;
    int _1395 = _905 + 32;
    uint _1397 = uint(int(uint(_1395) >> uint(2)));
    uint _1399 = uint(int(uint(int(_1397)) >> uint(2)));
    int _1401 = int(_1397) & 3;
    float _1403 = (*spvDescriptorSet0.cp_c6)._m0[int(_1399)][_1401];
    int _1405 = int(_1397) + 1;
    uint _1407 = uint(int(uint(_1405) >> uint(2)));
    int _1409 = _1405 & 3;
    float _1411 = (*spvDescriptorSet0.cp_c6)._m0[int(_1407)][_1409];
    float _1413 = fma(_1235, _1281, _1385);
    float _1415 = fma(_1237, _1281, _1387);
    float _1417 = fma(_1237, _1289, _1389);
    float _1419 = fma(_1233, _1289, _1393);
    float _1421 = _1229 * _1267;
    float _1423 = _1231 * _1301;
    float _1425 = _1229 * _1301;
    int _1427 = _905 + 48;
    uint _1429 = uint(int(uint(_1427) >> uint(2)));
    uint _1431 = uint(int(uint(int(_1429)) >> uint(2)));
    int _1433 = int(_1429) & 3;
    float _1435 = (*spvDescriptorSet0.cp_c6)._m0[int(_1431)][_1433];
    int _1437 = int(_1429) + 1;
    uint _1439 = uint(int(uint(_1437) >> uint(2)));
    int _1441 = _1437 & 3;
    float _1443 = (*spvDescriptorSet0.cp_c6)._m0[int(_1439)][_1441];
    float _1445 = _1231 * _1309;
    float _1447 = _1227 * _1301;
    float _1449 = _1229 * _1309;
    float _1451 = _1227 * _1309;
    float _1453 = fma(_1235, _1289, _1421);
    float _1455 = fma(_1237, _1319, _1423);
    float _1457 = fma(_1237, _1327, _1445);
    int _1459 = _905 + 24;
    uint _1461 = uint(int(uint(_1459) >> uint(2)));
    uint _1463 = uint(int(uint(int(_1461)) >> uint(2)));
    int _1465 = int(_1461) & 3;
    float _1467 = (*spvDescriptorSet0.cp_c6)._m0[int(_1463)][_1465];
    int _1469 = int(_1461) + 1;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    int _1473 = _1469 & 3;
    float _1475 = (*spvDescriptorSet0.cp_c6)._m0[int(_1471)][_1473];
    float _1477 = fma(_1235, _1319, _1425);
    float _1479 = fma(_1235, _1327, _1449);
    float _1481 = fma(_1233, _1319, _1447);
    float _1483 = fma(_1233, _1327, _1451);
    float _1485 = fma(_1239, _1337, _1415);
    float _1487 = fma(_1239, _1345, _1417);
    int _1489 = _905 + 40;
    uint _1491 = uint(int(uint(_1489) >> uint(2)));
    uint _1493 = uint(int(uint(int(_1491)) >> uint(2)));
    int _1495 = int(_1491) & 3;
    float _1497 = (*spvDescriptorSet0.cp_c6)._m0[int(_1493)][_1495];
    int _1499 = int(_1491) + 1;
    uint _1501 = uint(int(uint(_1499) >> uint(2)));
    int _1503 = _1499 & 3;
    float _1505 = (*spvDescriptorSet0.cp_c6)._m0[int(_1501)][_1503];
    float _1507 = fma(_1241, _1337, _1391);
    float _1509 = fma(_1243, _1337, _1413);
    float _1511 = fma(_1243, _1345, _1453);
    float _1513 = fma(_1241, _1345, _1419);
    float _1515 = fma(_1239, _1355, _1455);
    float _1517 = fma(_1239, _1363, _1457);
    int _1519 = _905 + 56;
    uint _1521 = uint(int(uint(_1519) >> uint(2)));
    uint _1523 = uint(int(uint(int(_1521)) >> uint(2)));
    int _1525 = int(_1521) & 3;
    float _1527 = (*spvDescriptorSet0.cp_c6)._m0[int(_1523)][_1525];
    int _1529 = int(_1521) + 1;
    uint _1531 = uint(int(uint(_1529) >> uint(2)));
    int _1533 = _1529 & 3;
    float _1535 = (*spvDescriptorSet0.cp_c6)._m0[int(_1531)][_1533];
    float _1537 = fma(_1243, _1355, _1477);
    float _1539 = fma(_1243, _1363, _1479);
    float _1541 = _1517 + _1245;
    float _1543 = fma(_1241, _1363, _1483);
    float _1545 = fma(_1241, _1355, _1481);
    float _1547 = _1539 + _1247;
    float _1549 = _1541 * _1383;
    float _1551 = _1543 + _1249;
    float _1553 = _1485 * _1383;
    float _1555 = _1487 * _1383;
    float _1557 = fma(_1547, _1375, _1549);
    float _1559 = _1515 * _1383;
    float _1561 = fma(_1509, _1375, _1553);
    float _1563 = fma(_1511, _1375, _1555);
    float _1565 = _1541 * _1411;
    float _1567 = _1485 * _1411;
    float _1569 = _1515 * _1411;
    float _1571 = _1487 * _1411;
    float _1573 = fma(_1547, _1403, _1565);
    float _1575 = fma(_1537, _1375, _1559);
    float _1577 = fma(_1509, _1403, _1567);
    float _1579 = fma(_1537, _1403, _1569);
    float _1581 = _1541 * _1443;
    float _1583 = _1485 * _1443;
    float _1585 = _1515 * _1443;
    float _1587 = _1487 * _1443;
    float _1589 = fma(_1547, _1435, _1581);
    float _1591 = fma(_1509, _1435, _1583);
    float _1593 = fma(_1537, _1435, _1585);
    float _1595 = fma(_1511, _1403, _1571);
    float _1597 = fma(_1551, _1467, _1557);
    float _1599 = fma(_1511, _1435, _1587);
    float _1601 = fma(_1513, _1467, _1563);
    float _1603 = fma(_1545, _1467, _1575);
    float _1605 = _1597 + _1475;
    float _1607 = fma(_1507, _1467, _1561);
    float _1609 = fma(_1551, _1497, _1573);
    float _1611 = fma(_1507, _1497, _1577);
    float _1613 = fma(_1545, _1497, _1579);
    int _1615 = _1291 + 16;
    float _1617 = fma(_1513, _1497, _1595);
    float _1619 = _1609 + _1505;
    float _1621 = fma(_1551, _1527, _1589);
    float _1623 = fma(_1507, _1527, _1591);
    float _1625 = fma(_1545, _1527, _1593);
    float _1627 = fma(_1513, _1527, _1599);
    int _1629 = _1291 + 32;
    float _1631 = _1621 + _1535;
    int _1633 = _1291 + 48;
    uint _1635 = uint(int(uint(_1615) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1635)] = as_type<uint>(_1607);
    int _1637 = _1615 + 4;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1639)] = as_type<uint>(_1601);
    int _1641 = _1615 + 8;
    uint _1643 = uint(int(uint(_1641) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1643)] = as_type<uint>(_1603);
    int _1645 = _1615 + 12;
    uint _1647 = uint(int(uint(_1645) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1647)] = as_type<uint>(_1605);
    uint _1649 = uint(int(uint(_1629) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1649)] = as_type<uint>(_1611);
    int _1651 = _1629 + 4;
    uint _1653 = uint(int(uint(_1651) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1653)] = as_type<uint>(_1617);
    int _1655 = _1629 + 8;
    uint _1657 = uint(int(uint(_1655) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1657)] = as_type<uint>(_1613);
    int _1659 = _1629 + 12;
    uint _1661 = uint(int(uint(_1659) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1661)] = as_type<uint>(_1619);
    uint _1663 = uint(int(uint(_1633) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1663)] = as_type<uint>(_1623);
    int _1665 = _1633 + 4;
    uint _1667 = uint(int(uint(_1665) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1667)] = as_type<uint>(_1627);
    int _1669 = _1633 + 8;
    uint _1671 = uint(int(uint(_1669) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1671)] = as_type<uint>(_1625);
    int _1673 = _1633 + 12;
    uint _1675 = uint(int(uint(_1673) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1675)] = as_type<uint>(_1631);
}

