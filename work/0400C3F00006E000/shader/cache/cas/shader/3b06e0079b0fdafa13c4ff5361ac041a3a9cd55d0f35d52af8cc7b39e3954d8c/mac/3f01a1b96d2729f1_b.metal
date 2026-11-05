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
    constant _16* cp_c5 [[id(1)]];
    constant _16* cp_c6 [[id(2)]];
    constant _16* cp_c3 [[id(3)]];
    constant _16* cp_c4 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_A [[id(7)]];
    sampler cp_t_tcb_ASmplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_8 [[id(9)]];
    sampler cp_t_tcb_8Smplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _4175, thread const int& _4176, constant _10& support_buffer)
{
    int _4179 = 1 + _4176;
    float _4181 = support_buffer._m5[_4179].x;
    bool _4183 = _4181 == 1.0;
    if (_4183)
    {
        return _4175;
    }
    float _4185 = float(_4175);
    float _4187 = _4185 * _4181;
    int _4189 = int(_4187);
    return _4189;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1195 = false;
    bool _707 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_72)
    {
        return;
    }
    int _74 = _68 & 31;
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
    float _99 = _78 ? as_type<float>(_91) : as_type<float>(_97);
    int _101 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _103 = _101 + 36;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = _101 + 32;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    uint _117 = uint(int(uint(int(_115)) >> uint(2)));
    int _119 = int(_115) & 3;
    float _121 = (*spvDescriptorSet0.cp_c5)._m0[int(_117)][_119];
    int _123 = as_type<int>(_99) & as_type<int>(_111);
    bool _125 = _123 != 0;
    int _127 = as_type<int>(_99) & as_type<int>(_121);
    bool _129 = _127 != 0;
    int _131 = 0;
    float _133 = _99;
    float _135 = _121;
    float _137 = _111;
    if (_125)
    {
        int _139 = _101 + 8;
        uint _141 = uint(int(uint(_139) >> uint(2)));
        uint _143 = uint(int(uint(int(_141)) >> uint(2)));
        int _145 = int(_141) & 3;
        float _147 = (*spvDescriptorSet0.cp_c5)._m0[int(_143)][_145];
        _131 = as_type<int>(_147);
    }
    int _149 = _131;
    float _151 = 0.0;
    if (_125)
    {
        _151 = 1.4012984643248170709237295832899e-45;
    }
    float _153 = _151;
    float _155 = 0.0;
    if (_125)
    {
        _155 = 2.8025969286496341418474591665798e-45;
    }
    float _157 = _155;
    int _159 = 0;
    if (_129)
    {
        uint _161 = uint(int(uint(_101) >> uint(2)));
        uint _163 = uint(int(uint(int(_161)) >> uint(2)));
        int _165 = int(_161) & 3;
        float _167 = (*spvDescriptorSet0.cp_c5)._m0[int(_163)][_165];
        _159 = as_type<int>(_167);
    }
    int _169 = _159;
    if (_129)
    {
        _133 = 1.4012984643248170709237295832899e-45;
    }
    float _171 = _133;
    float _173 = _153;
    float _175 = as_type<float>(_68);
    float _177 = 0.0;
    float _179 = as_type<float>(_149);
    if (_125)
    {
        int _181 = _68;
        int _183 = 0;
        int _185 = _58(_181, _183, (*spvDescriptorSet0.support_buffer));
        int _187 = _149;
        int _189 = 0;
        int _191 = _58(_187, _189, (*spvDescriptorSet0.support_buffer));
        int3 _1850 = int3(_185, _191, as_type<int>(_153));
        float3 _195 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1850.xy), uint(_1850.z), 0).xyz;
        float _197 = _195.x;
        float _199 = _195.y;
        float _201 = _195.z;
        _173 = _197;
        _175 = _199;
        _177 = _201;
    }
    float _203 = _173;
    float _205 = _175;
    float _207 = _177;
    float _209 = 0.0;
    float _211 = 0.0;
    float _213 = 0.0;
    if (_125)
    {
        int _215 = _68;
        int _217 = 0;
        int _219 = _58(_215, _217, (*spvDescriptorSet0.support_buffer));
        int _221 = _149;
        int _223 = 0;
        int _225 = _58(_221, _223, (*spvDescriptorSet0.support_buffer));
        int3 _1876 = int3(_219, _225, 0);
        float3 _227 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1876.xy), uint(_1876.z), 0).xyz;
        float _229 = _227.x;
        float _231 = _227.y;
        float _233 = _227.z;
        _209 = _229;
        _211 = _231;
        _213 = _233;
    }
    float _235 = _209;
    float _237 = _211;
    float _239 = _213;
    float _241 = 0.0;
    float _243 = 0.0;
    float _245 = _157;
    if (_125)
    {
        int _247 = _68;
        int _249 = 0;
        int _251 = _58(_247, _249, (*spvDescriptorSet0.support_buffer));
        int _253 = _149;
        int _255 = 0;
        int _257 = _58(_253, _255, (*spvDescriptorSet0.support_buffer));
        int3 _1905 = int3(_251, _257, as_type<int>(_157));
        float3 _259 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1905.xy), uint(_1905.z), 0).xyz;
        float _261 = _259.x;
        float _263 = _259.y;
        float _265 = _259.z;
        _241 = _261;
        _243 = _263;
        _245 = _265;
    }
    float _267 = _241;
    float _269 = _243;
    float _271 = _245;
    float _273 = 0.0;
    float _275 = as_type<float>(_68);
    float _277 = 0.0;
    if (_129)
    {
        int _279 = _68;
        int _281 = 1;
        int _283 = _58(_279, _281, (*spvDescriptorSet0.support_buffer));
        int _285 = _169;
        int _287 = 1;
        int _289 = _58(_285, _287, (*spvDescriptorSet0.support_buffer));
        int3 _1933 = int3(_283, _289, 0);
        float3 _291 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1933.xy), uint(_1933.z), 0).xyz;
        float _293 = _291.x;
        float _295 = _291.y;
        float _297 = _291.z;
        _273 = _293;
        _275 = _295;
        _277 = _297;
    }
    float _299 = _273;
    float _301 = _275;
    float _303 = _277;
    float _305 = 0.0;
    float _307 = 0.0;
    float _309 = _171;
    if (_129)
    {
        int _311 = _68;
        int _313 = 1;
        int _315 = _58(_311, _313, (*spvDescriptorSet0.support_buffer));
        int _317 = _169;
        int _319 = 1;
        int _321 = _58(_317, _319, (*spvDescriptorSet0.support_buffer));
        int3 _1962 = int3(_315, _321, as_type<int>(_171));
        float3 _323 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1962.xy), uint(_1962.z), 0).xyz;
        float _325 = _323.x;
        float _327 = _323.y;
        float _329 = _323.z;
        _305 = _325;
        _307 = _327;
        _309 = _329;
    }
    float _331 = _305;
    float _333 = _307;
    float _335 = _309;
    float _337 = 0.0;
    if (!_129)
    {
        _337 = 0.0;
    }
    float _339 = _337;
    float _341 = 0.0;
    float _343 = _339;
    if (!_129)
    {
        _135 = 0.0;
        _341 = 0.0;
    }
    float _345 = _135;
    float _347 = _341;
    float _349 = 0.0;
    float _351 = _345;
    float _353 = _347;
    if (!_129)
    {
        _349 = 0.0;
    }
    float _355 = _349;
    float _357 = _355;
    if (!_129)
    {
        _137 = 0.0;
    }
    float _359 = _137;
    float _361 = 0.0;
    float _363 = _359;
    if (!_129)
    {
        _179 = 0.0;
        _361 = 0.0;
    }
    float _365 = _179;
    float _367 = _361;
    float _369 = 0.0;
    float _371 = _365;
    float _373 = _367;
    if (!_129)
    {
        _369 = 0.0;
    }
    float _375 = _369;
    float _377 = 0.0;
    float _379 = _375;
    if (!_129)
    {
        _377 = 0.0;
    }
    float _381 = _377;
    bool _383 = !_129;
    float _385 = _381;
    if (!_383)
    {
        int _387 = _68;
        int _389 = 1;
        int _391 = _58(_387, _389, (*spvDescriptorSet0.support_buffer));
        int _393 = _169;
        int _395 = 1;
        int _397 = _58(_393, _395, (*spvDescriptorSet0.support_buffer));
        int3 _2037 = int3(_391, _397, 2);
        float3 _399 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2037.xy), uint(_2037.z), 0).xyz;
        float _401 = _399.x;
        float _403 = _399.y;
        float _405 = _399.z;
        _385 = _331;
        _351 = _333;
        _353 = _335;
        _343 = _299;
        _379 = _405;
        _371 = _403;
        _363 = _303;
        _373 = _401;
        _357 = _301;
    }
    float _407 = _385;
    float _409 = _351;
    float _411 = _353;
    float _413 = _343;
    float _415 = _379;
    float _417 = _371;
    float _419 = _363;
    float _421 = _373;
    float _423 = _357;
    bool _425 = !_125;
    float _427 = _413;
    int _429 = as_type<int>(_417);
    int _431 = as_type<int>(_415);
    float _679;
    float _681;
    float _683;
    float _685;
    float _687;
    float _689;
    float _691;
    float _693;
    float _695;
    float _697;
    float _699;
    int _701;
    float _703;
    float _705;
    if (!_425)
    {
        float _433 = _407 * 0.15915493667125701904296875;
        float _435 = _409 * 0.15915493667125701904296875;
        float _437 = _411 * 0.15915493667125701904296875;
        float _439 = _205 * 0.15915493667125701904296875;
        float _441 = _433 * 6.283185482025146484375;
        float _443 = cos(_441);
        float _445 = _207 * 0.15915493667125701904296875;
        float _447 = _203 * 0.15915493667125701904296875;
        int _449 = _101 + 20;
        uint _451 = uint(int(uint(_449) >> uint(2)));
        uint _453 = uint(int(uint(int(_451)) >> uint(2)));
        int _455 = int(_451) & 3;
        float _457 = (*spvDescriptorSet0.cp_c5)._m0[int(_453)][_455];
        float _459 = _435 * 6.283185482025146484375;
        float _461 = cos(_459);
        int _463 = _101 + 28;
        uint _465 = uint(int(uint(_463) >> uint(2)));
        uint _467 = uint(int(uint(int(_465)) >> uint(2)));
        int _469 = int(_465) & 3;
        float _471 = (*spvDescriptorSet0.cp_c5)._m0[int(_467)][_469];
        float _473 = _437 * 6.283185482025146484375;
        float _475 = sin(_473);
        float _477 = _437 * 6.283185482025146484375;
        float _479 = cos(_477);
        float _481 = _443 * _461;
        float _483 = _433 * 6.283185482025146484375;
        float _485 = sin(_483);
        float _487 = _475 * _461;
        float _489 = _237 * _471;
        float _491 = _239 * _471;
        float _493 = _235 * _471;
        float _495 = _271 * _471;
        float _497 = _435 * 6.283185482025146484375;
        float _499 = sin(_497);
        float _501 = _443 * _479;
        float _503 = _475 * _443;
        float _505 = fma(_413, _457, _493);
        float _507 = fma(_415, _457, _495);
        float _509 = _439 * 6.283185482025146484375;
        float _511 = sin(_509);
        float _513 = _461 * _479;
        float _515 = _485 * _461;
        float _517 = _439 * 6.283185482025146484375;
        float _519 = cos(_517);
        float _521 = _485 * _499;
        float _523 = _445 * 6.283185482025146484375;
        float _525 = sin(_523);
        float _527 = _485 * _479;
        float _529 = -_503;
        float _531 = fma(_479, _521, _529);
        float _533 = fma(_475, _521, _501);
        float _535 = -_527;
        float _537 = fma(_499, _503, _535);
        float _539 = _445 * 6.283185482025146484375;
        float _541 = cos(_539);
        float _543 = _447 * 6.283185482025146484375;
        float _545 = cos(_543);
        float _547 = _485 * _475;
        float _549 = _525 * _519;
        float _551 = fma(_499, _501, _547);
        float _553 = _447 * 6.283185482025146484375;
        float _555 = sin(_553);
        float _557 = _519 * _541;
        float _559 = _557 * _471;
        float _561 = _545 * _541;
        float _563 = _525 * _545;
        float _565 = _545 * _519;
        float _567 = fma(_513, _457, _559);
        float _569 = _555 * _511;
        float _571 = _555 * _525;
        float _573 = _555 * _541;
        float _575 = _555 * _519;
        float _577 = -_563;
        float _579 = fma(_541, _569, _577);
        float _581 = fma(_525, _569, _561);
        float _583 = fma(_511, _561, _571);
        float _585 = _499 * _457;
        float _587 = -_573;
        float _589 = fma(_511, _563, _587);
        float _591 = _549 * _471;
        float _593 = _575 * _471;
        float _595 = -_511;
        float _597 = -_585;
        float _599 = fma(_595, _471, _597);
        float _601 = _579 * _471;
        float _603 = _581 * _471;
        float _605 = _583 * _471;
        float _607 = fma(_487, _457, _591);
        float _609 = fma(_531, _457, _601);
        float _611 = _589 * _471;
        float _613 = fma(_515, _457, _593);
        float _615 = fma(_533, _457, _603);
        float _617 = fma(_551, _457, _605);
        float _619 = fma(_537, _457, _611);
        float _621 = _607 * _607;
        float _623 = _565 * _471;
        float _625 = _615 * _615;
        float _627 = _619 * _619;
        float _629 = fma(_567, _567, _621);
        float _631 = fma(_481, _457, _623);
        float _633 = fma(_609, _609, _625);
        float _635 = fma(_617, _617, _627);
        float _637 = fma(_599, _599, _629);
        float _639 = _269 * _471;
        float _641 = fma(_613, _613, _633);
        float _643 = fma(_631, _631, _635);
        float _645 = rsqrt(_637);
        float _647 = _267 * _471;
        float _649 = fma(_417, _457, _639);
        float _651 = fma(_419, _457, _491);
        float _653 = fma(_421, _457, _647);
        float _655 = rsqrt(_643);
        float _657 = fma(_423, _457, _489);
        float _659 = rsqrt(_641);
        float _661 = _567 * _645;
        float _663 = _607 * _645;
        float _665 = _599 * _645;
        float _667 = _617 * _655;
        float _669 = _619 * _655;
        float _671 = _631 * _655;
        float _673 = _609 * _659;
        float _675 = _615 * _659;
        float _677 = _613 * _659;
        _427 = _505;
        _679 = _661;
        _681 = _663;
        _683 = _665;
        _685 = _657;
        _687 = _673;
        _689 = _675;
        _691 = _677;
        _693 = _651;
        _695 = _667;
        _697 = _669;
        _699 = _671;
        _701 = as_type<int>(_653);
        _429 = as_type<int>(_649);
        _431 = as_type<int>(_507);
        _703 = _631;
        _705 = _613;
        _707 = true;
    }
    else
    {
        float _709 = _407 * 0.15915493667125701904296875;
        float _711 = _411 * 0.15915493667125701904296875;
        float _713 = _409 * 0.15915493667125701904296875;
        float _715 = _709 * 6.283185482025146484375;
        float _717 = cos(_715);
        float _719 = _711 * 6.283185482025146484375;
        float _721 = sin(_719);
        float _723 = _711 * 6.283185482025146484375;
        float _725 = cos(_723);
        float _727 = _713 * 6.283185482025146484375;
        float _729 = cos(_727);
        float _731 = _721 * _717;
        float _733 = _709 * 6.283185482025146484375;
        float _735 = sin(_733);
        float _737 = _717 * _725;
        float _739 = _713 * 6.283185482025146484375;
        float _741 = sin(_739);
        float _743 = _717 * _729;
        float _745 = _721 * _729;
        float _747 = _729 * _725;
        float _749 = _735 * _721;
        float _751 = _735 * _725;
        float _753 = _735 * _729;
        float _755 = _735 * _741;
        float _757 = -_751;
        float _759 = fma(_741, _731, _757);
        float _761 = -_741;
        float _763 = _761 + (-0.0);
        float _765 = -_731;
        float _767 = fma(_725, _755, _765);
        float _769 = fma(_721, _755, _737);
        float _771 = fma(_741, _737, _749);
        _679 = _747;
        _681 = _745;
        _683 = _763;
        _685 = _423;
        _687 = _767;
        _689 = _769;
        _691 = _753;
        _693 = _419;
        _695 = _771;
        _697 = _759;
        _699 = _743;
        _701 = as_type<int>(_421);
        _703 = _741;
        _705 = _729;
    }
    _707 = false;
    float _773 = _427;
    float _775 = _679;
    float _777 = _681;
    float _779 = _683;
    float _781 = _685;
    float _783 = _687;
    float _785 = _689;
    float _787 = _691;
    float _789 = _693;
    float _791 = _695;
    float _793 = _697;
    float _795 = _699;
    int _797 = _701;
    int _799 = _429;
    int _801 = _431;
    float _803 = _703;
    float _805 = _705;
    float _807 = _773 * _775;
    float _809 = _773 * _777;
    float _811 = _773 * _779;
    float _813 = _781 * _783;
    float _815 = _781 * _785;
    float _817 = _781 * _787;
    int _819 = _68 * 48;
    float _821 = _789 * _791;
    float _823 = _789 * _793;
    float _825 = _789 * _795;
    int _827 = _68 * 112;
    uint _829 = uint(int(uint(_819) >> uint(2)));
    _39[int(_829)] = as_type<uint>(_807);
    int _831 = _819 + 4;
    uint _833 = uint(int(uint(_831) >> uint(2)));
    _39[int(_833)] = as_type<uint>(_813);
    int _835 = _819 + 8;
    uint _837 = uint(int(uint(_835) >> uint(2)));
    _39[int(_837)] = as_type<uint>(_821);
    int _839 = _819 + 12;
    uint _841 = uint(int(uint(_839) >> uint(2)));
    _39[int(_841)] = uint(_797);
    bool _843 = _68 != 0;
    bool _845 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _847 = _819 + 16;
    uint _849 = uint(int(uint(_847) >> uint(2)));
    _39[int(_849)] = as_type<uint>(_809);
    int _851 = _819 + 20;
    uint _853 = uint(int(uint(_851) >> uint(2)));
    _39[int(_853)] = as_type<uint>(_815);
    int _855 = _819 + 24;
    uint _857 = uint(int(uint(_855) >> uint(2)));
    _39[int(_857)] = as_type<uint>(_823);
    int _859 = _819 + 28;
    uint _861 = uint(int(uint(_859) >> uint(2)));
    _39[int(_861)] = uint(_799);
    int _863 = _819 + 32;
    uint _865 = uint(int(uint(_863) >> uint(2)));
    _39[int(_865)] = as_type<uint>(_811);
    int _867 = _819 + 36;
    uint _869 = uint(int(uint(_867) >> uint(2)));
    _39[int(_869)] = as_type<uint>(_817);
    int _871 = _819 + 40;
    uint _873 = uint(int(uint(_871) >> uint(2)));
    _39[int(_873)] = as_type<uint>(_825);
    int _875 = _819 + 44;
    uint _877 = uint(int(uint(_875) >> uint(2)));
    _39[int(_877)] = uint(_801);
    float _879 = _805;
    float _881 = _773;
    float _883 = _803;
    float _885 = _789;
    float _887 = _781;
    float _889 = (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _891 = _817;
    float _893 = _811;
    float _895 = _823;
    float _897 = _825;
    float _899 = as_type<float>(_799);
    float _901 = as_type<float>(_801);
    if (!_843)
    {
        _879 = _807;
    }
    float _903 = _879;
    float _905 = _903;
    if (!_843)
    {
        _881 = _813;
    }
    float _907 = _881;
    float _909 = _907;
    if (!_843)
    {
        _883 = _821;
    }
    float _911 = _883;
    float _913 = _911;
    if (!_843)
    {
        _885 = as_type<float>(_797);
    }
    float _915 = _885;
    float _917 = _915;
    if (!_843)
    {
        _887 = _809;
    }
    float _919 = _887;
    float _921 = _919;
    if (!_843)
    {
        _889 = _815;
    }
    float _923 = _889;
    float _925 = _923;
    if (!_845)
    {
        int _927 = _68 * 48;
        int _929 = _927 + 16;
        uint _931 = uint(int(uint(_927) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_931)] = as_type<uint>(_807);
        int _933 = _927 + 4;
        uint _935 = uint(int(uint(_933) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_935)] = as_type<uint>(_813);
        int _937 = _927 + 8;
        uint _939 = uint(int(uint(_937) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_939)] = as_type<uint>(_821);
        int _941 = _927 + 12;
        uint _943 = uint(int(uint(_941) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_943)] = uint(_797);
        int _945 = _927 + 32;
        uint _947 = uint(int(uint(_929) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_947)] = as_type<uint>(_809);
        int _949 = _929 + 4;
        uint _951 = uint(int(uint(_949) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_951)] = as_type<uint>(_815);
        int _953 = _929 + 8;
        uint _955 = uint(int(uint(_953) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_955)] = as_type<uint>(_823);
        int _957 = _929 + 12;
        uint _959 = uint(int(uint(_957) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_959)] = uint(_799);
        uint _961 = uint(int(uint(_945) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_961)] = as_type<uint>(_811);
        int _963 = _945 + 4;
        uint _965 = uint(int(uint(_963) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_965)] = as_type<uint>(_817);
        int _967 = _945 + 8;
        uint _969 = uint(int(uint(_967) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_969)] = as_type<uint>(_825);
        int _971 = _945 + 12;
        uint _973 = uint(int(uint(_971) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_973)] = uint(_801);
    }
    bool _975 = !_843;
    if (!_975)
    {
        bool _977 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _979 = !_977;
        if (!_979)
        {
            uint _981 = uint(int(uint(_827) >> uint(2)));
            uint _983 = uint(int(uint(int(_981)) >> uint(2)));
            int _985 = int(_981) & 3;
            float _987 = (*spvDescriptorSet0.cp_c6)._m0[int(_983)][_985];
            int _989 = as_type<int>(_987) * 48;
            int _991 = 0;
            bool _993;
            float _1089;
            float _1093;
            float _1097;
            float _1101;
            float _1115;
            float _1117;
            float _1129;
            float _1139;
            float _1141;
            float _1143;
            float _1145;
            float _1147;
            do
            {
                int _995 = _991;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _997 = uint(int(uint(_989) >> uint(2)));
                float _999 = as_type<float>(_39[int(_997)]);
                int _1001 = _989 + 4;
                uint _1003 = uint(int(uint(_1001) >> uint(2)));
                float _1005 = as_type<float>(_39[int(_1003)]);
                int _1007 = _989 + 8;
                uint _1009 = uint(int(uint(_1007) >> uint(2)));
                float _1011 = as_type<float>(_39[int(_1009)]);
                int _1013 = _989 + 12;
                uint _1015 = uint(int(uint(_1013) >> uint(2)));
                float _1017 = as_type<float>(_39[int(_1015)]);
                int _1019 = _995 + 1;
                int _1021 = _989 + 16;
                uint _1023 = uint(int(uint(_1021) >> uint(2)));
                float _1025 = as_type<float>(_39[int(_1023)]);
                int _1027 = _989 + 20;
                uint _1029 = uint(int(uint(_1027) >> uint(2)));
                float _1031 = as_type<float>(_39[int(_1029)]);
                int _1033 = _989 + 24;
                uint _1035 = uint(int(uint(_1033) >> uint(2)));
                float _1037 = as_type<float>(_39[int(_1035)]);
                int _1039 = _989 + 28;
                uint _1041 = uint(int(uint(_1039) >> uint(2)));
                float _1043 = as_type<float>(_39[int(_1041)]);
                bool _1045 = uint(_1019) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1047 = _989 + 32;
                uint _1049 = uint(int(uint(_1047) >> uint(2)));
                float _1051 = as_type<float>(_39[int(_1049)]);
                int _1053 = _989 + 36;
                uint _1055 = uint(int(uint(_1053) >> uint(2)));
                float _1057 = as_type<float>(_39[int(_1055)]);
                int _1059 = _989 + 40;
                uint _1061 = uint(int(uint(_1059) >> uint(2)));
                float _1063 = as_type<float>(_39[int(_1061)]);
                int _1065 = _989 + 44;
                uint _1067 = uint(int(uint(_1065) >> uint(2)));
                float _1069 = as_type<float>(_39[int(_1067)]);
                float _1071 = _1005 * as_type<float>(_799);
                float _1073 = _809 * _1005;
                float _1075 = _815 * _1005;
                float _1077 = _823 * _1005;
                float _1079 = fma(_999, as_type<float>(_797), _1071);
                float _1081 = fma(_807, _999, _1073);
                float _1083 = fma(_813, _999, _1075);
                float _1085 = fma(_821, _999, _1077);
                float _1087 = fma(_1011, as_type<float>(_801), _1079);
                _1089 = fma(_811, _1011, _1081);
                float _1091 = _809 * _1031;
                _1093 = fma(_825, _1011, _1085);
                float _1095 = _1031 * as_type<float>(_799);
                _1097 = _1017 + _1087;
                float _1099 = _815 * _1031;
                _1101 = fma(_817, _1011, _1083);
                float _1103 = fma(_1025, as_type<float>(_797), _1095);
                float _1105 = fma(_807, _1025, _1091);
                float _1107 = fma(_813, _1025, _1099);
                float _1109 = _823 * _1031;
                float _1111 = fma(_1037, as_type<float>(_801), _1103);
                float _1113 = _1057 * as_type<float>(_799);
                _1115 = fma(_811, _1037, _1105);
                _1117 = fma(_817, _1037, _1107);
                float _1119 = _809 * _1057;
                float _1121 = _815 * _1057;
                float _1123 = _823 * _1057;
                float _1125 = fma(_1051, as_type<float>(_797), _1113);
                float _1127 = fma(_821, _1025, _1109);
                _1129 = _1043 + _1111;
                float _1131 = fma(_807, _1051, _1119);
                float _1133 = fma(_813, _1051, _1121);
                float _1135 = fma(_821, _1051, _1123);
                float _1137 = fma(_1063, as_type<float>(_801), _1125);
                _1139 = fma(_825, _1037, _1127);
                _1141 = fma(_811, _1063, _1131);
                _1143 = fma(_817, _1063, _1133);
                _1145 = fma(_825, _1063, _1135);
                _1147 = _1069 + _1137;
                uint _1149 = uint(int(uint(_819) >> uint(2)));
                _39[int(_1149)] = as_type<uint>(_1089);
                int _1151 = _819 + 4;
                uint _1153 = uint(int(uint(_1151) >> uint(2)));
                _39[int(_1153)] = as_type<uint>(_1101);
                int _1155 = _819 + 8;
                uint _1157 = uint(int(uint(_1155) >> uint(2)));
                _39[int(_1157)] = as_type<uint>(_1093);
                int _1159 = _819 + 12;
                uint _1161 = uint(int(uint(_1159) >> uint(2)));
                _39[int(_1161)] = as_type<uint>(_1097);
                int _1163 = _819 + 16;
                uint _1165 = uint(int(uint(_1163) >> uint(2)));
                _39[int(_1165)] = as_type<uint>(_1115);
                int _1167 = _819 + 20;
                uint _1169 = uint(int(uint(_1167) >> uint(2)));
                _39[int(_1169)] = as_type<uint>(_1117);
                int _1171 = _819 + 24;
                uint _1173 = uint(int(uint(_1171) >> uint(2)));
                _39[int(_1173)] = as_type<uint>(_1139);
                int _1175 = _819 + 28;
                uint _1177 = uint(int(uint(_1175) >> uint(2)));
                _39[int(_1177)] = as_type<uint>(_1129);
                int _1179 = _819 + 32;
                uint _1181 = uint(int(uint(_1179) >> uint(2)));
                _39[int(_1181)] = as_type<uint>(_1141);
                int _1183 = _819 + 36;
                uint _1185 = uint(int(uint(_1183) >> uint(2)));
                _39[int(_1185)] = as_type<uint>(_1143);
                int _1187 = _819 + 40;
                uint _1189 = uint(int(uint(_1187) >> uint(2)));
                _39[int(_1189)] = as_type<uint>(_1145);
                int _1191 = _819 + 44;
                uint _1193 = uint(int(uint(_1191) >> uint(2)));
                _39[int(_1193)] = as_type<uint>(_1147);
                _993 = !_1045;
                _991 = _1019;
            } while (_993);
            _925 = _1117;
            _891 = _1143;
            _909 = _1101;
            _921 = _1115;
            _893 = _1141;
            _905 = _1089;
            _895 = _1139;
            _913 = _1093;
            _897 = _1145;
            _899 = _1129;
            _917 = _1097;
            _901 = _1147;
            _1195 = true;
        }
        else
        {
            _925 = 0.0;
            _891 = 0.0;
            _909 = 0.0;
            _921 = 0.0;
            _893 = 0.0;
            _905 = 0.0;
            _895 = 0.0;
            _913 = 0.0;
            _897 = 0.0;
            _899 = 0.0;
            _917 = 0.0;
            _901 = 0.0;
        }
    }
    _1195 = false;
    float _1197 = _925;
    float _1199 = _891;
    float _1201 = _909;
    float _1203 = _921;
    float _1205 = _893;
    float _1207 = _905;
    float _1209 = _895;
    float _1211 = _913;
    float _1213 = _897;
    float _1215 = _899;
    float _1217 = _917;
    float _1219 = _901;
    int _1221 = _827 + 80;
    uint _1223 = uint(int(uint(_1221) >> uint(2)));
    uint _1225 = uint(int(uint(int(_1223)) >> uint(2)));
    int _1227 = int(_1223) & 3;
    float _1229 = (*spvDescriptorSet0.cp_c6)._m0[int(_1225)][_1227];
    int _1231 = int(_1223) + 1;
    uint _1233 = uint(int(uint(_1231) >> uint(2)));
    int _1235 = _1231 & 3;
    float _1237 = (*spvDescriptorSet0.cp_c6)._m0[int(_1233)][_1235];
    int _1239 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1241 = _1239 + _68;
    int _1243 = _827 + 64;
    uint _1245 = uint(int(uint(_1243) >> uint(2)));
    uint _1247 = uint(int(uint(int(_1245)) >> uint(2)));
    int _1249 = int(_1245) & 3;
    float _1251 = (*spvDescriptorSet0.cp_c6)._m0[int(_1247)][_1249];
    int _1253 = int(_1245) + 1;
    uint _1255 = uint(int(uint(_1253) >> uint(2)));
    int _1257 = _1253 & 3;
    float _1259 = (*spvDescriptorSet0.cp_c6)._m0[int(_1255)][_1257];
    int _1261 = _1241 * 48;
    int _1263 = _827 + 88;
    uint _1265 = uint(int(uint(_1263) >> uint(2)));
    uint _1267 = uint(int(uint(int(_1265)) >> uint(2)));
    int _1269 = int(_1265) & 3;
    float _1271 = (*spvDescriptorSet0.cp_c6)._m0[int(_1267)][_1269];
    int _1273 = int(_1265) + 1;
    uint _1275 = uint(int(uint(_1273) >> uint(2)));
    int _1277 = _1273 & 3;
    float _1279 = (*spvDescriptorSet0.cp_c6)._m0[int(_1275)][_1277];
    int _1281 = _827 + 72;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    uint _1285 = uint(int(uint(int(_1283)) >> uint(2)));
    int _1287 = int(_1283) & 3;
    float _1289 = (*spvDescriptorSet0.cp_c6)._m0[int(_1285)][_1287];
    int _1291 = int(_1283) + 1;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    int _1295 = _1291 & 3;
    float _1297 = (*spvDescriptorSet0.cp_c6)._m0[int(_1293)][_1295];
    int _1299 = _827 + 96;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    uint _1303 = uint(int(uint(int(_1301)) >> uint(2)));
    int _1305 = int(_1301) & 3;
    float _1307 = (*spvDescriptorSet0.cp_c6)._m0[int(_1303)][_1305];
    int _1309 = int(_1301) + 1;
    uint _1311 = uint(int(uint(_1309) >> uint(2)));
    int _1313 = _1309 & 3;
    float _1315 = (*spvDescriptorSet0.cp_c6)._m0[int(_1311)][_1313];
    int _1317 = _827 + 104;
    uint _1319 = uint(int(uint(_1317) >> uint(2)));
    uint _1321 = uint(int(uint(int(_1319)) >> uint(2)));
    int _1323 = int(_1319) & 3;
    float _1325 = (*spvDescriptorSet0.cp_c6)._m0[int(_1321)][_1323];
    int _1327 = int(_1319) + 1;
    uint _1329 = uint(int(uint(_1327) >> uint(2)));
    int _1331 = _1327 & 3;
    float _1333 = (*spvDescriptorSet0.cp_c6)._m0[int(_1329)][_1331];
    float _1335 = _1197 * _1229;
    float _1337 = _1199 * _1229;
    int _1339 = _827 + 16;
    uint _1341 = uint(int(uint(_1339) >> uint(2)));
    uint _1343 = uint(int(uint(int(_1341)) >> uint(2)));
    int _1345 = int(_1341) & 3;
    float _1347 = (*spvDescriptorSet0.cp_c6)._m0[int(_1343)][_1345];
    int _1349 = int(_1341) + 1;
    uint _1351 = uint(int(uint(_1349) >> uint(2)));
    int _1353 = _1349 & 3;
    float _1355 = (*spvDescriptorSet0.cp_c6)._m0[int(_1351)][_1353];
    float _1357 = _1201 * _1229;
    float _1359 = fma(_1203, _1251, _1335);
    float _1361 = _1201 * _1237;
    int _1363 = _827 + 32;
    uint _1365 = uint(int(uint(_1363) >> uint(2)));
    uint _1367 = uint(int(uint(int(_1365)) >> uint(2)));
    int _1369 = int(_1365) & 3;
    float _1371 = (*spvDescriptorSet0.cp_c6)._m0[int(_1367)][_1369];
    int _1373 = int(_1365) + 1;
    uint _1375 = uint(int(uint(_1373) >> uint(2)));
    int _1377 = _1373 & 3;
    float _1379 = (*spvDescriptorSet0.cp_c6)._m0[int(_1375)][_1377];
    float _1381 = fma(_1205, _1251, _1337);
    float _1383 = _1197 * _1237;
    float _1385 = fma(_1207, _1259, _1361);
    float _1387 = _1199 * _1237;
    float _1389 = fma(_1207, _1251, _1357);
    float _1391 = _1201 * _1271;
    float _1393 = _1201 * _1279;
    int _1395 = _827 + 48;
    uint _1397 = uint(int(uint(_1395) >> uint(2)));
    uint _1399 = uint(int(uint(int(_1397)) >> uint(2)));
    int _1401 = int(_1397) & 3;
    float _1403 = (*spvDescriptorSet0.cp_c6)._m0[int(_1399)][_1401];
    int _1405 = int(_1397) + 1;
    uint _1407 = uint(int(uint(_1405) >> uint(2)));
    int _1409 = _1405 & 3;
    float _1411 = (*spvDescriptorSet0.cp_c6)._m0[int(_1407)][_1409];
    float _1413 = _1197 * _1271;
    float _1415 = _1197 * _1279;
    float _1417 = _1199 * _1271;
    float _1419 = _1199 * _1279;
    float _1421 = fma(_1203, _1259, _1383);
    float _1423 = fma(_1205, _1259, _1387);
    float _1425 = fma(_1207, _1289, _1391);
    int _1427 = _827 + 24;
    uint _1429 = uint(int(uint(_1427) >> uint(2)));
    uint _1431 = uint(int(uint(int(_1429)) >> uint(2)));
    int _1433 = int(_1429) & 3;
    float _1435 = (*spvDescriptorSet0.cp_c6)._m0[int(_1431)][_1433];
    int _1437 = int(_1429) + 1;
    uint _1439 = uint(int(uint(_1437) >> uint(2)));
    int _1441 = _1437 & 3;
    float _1443 = (*spvDescriptorSet0.cp_c6)._m0[int(_1439)][_1441];
    float _1445 = fma(_1207, _1297, _1393);
    float _1447 = fma(_1203, _1289, _1413);
    float _1449 = fma(_1203, _1297, _1415);
    float _1451 = fma(_1205, _1289, _1417);
    float _1453 = fma(_1205, _1297, _1419);
    float _1455 = fma(_1209, _1307, _1359);
    float _1457 = fma(_1209, _1315, _1421);
    int _1459 = _827 + 40;
    uint _1461 = uint(int(uint(_1459) >> uint(2)));
    uint _1463 = uint(int(uint(int(_1461)) >> uint(2)));
    int _1465 = int(_1461) & 3;
    float _1467 = (*spvDescriptorSet0.cp_c6)._m0[int(_1463)][_1465];
    int _1469 = int(_1461) + 1;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    int _1473 = _1469 & 3;
    float _1475 = (*spvDescriptorSet0.cp_c6)._m0[int(_1471)][_1473];
    float _1477 = fma(_1211, _1315, _1385);
    float _1479 = fma(_1213, _1307, _1381);
    float _1481 = fma(_1213, _1315, _1423);
    float _1483 = fma(_1211, _1307, _1389);
    float _1485 = fma(_1209, _1325, _1447);
    float _1487 = fma(_1209, _1333, _1449);
    int _1489 = _827 + 56;
    uint _1491 = uint(int(uint(_1489) >> uint(2)));
    uint _1493 = uint(int(uint(int(_1491)) >> uint(2)));
    int _1495 = int(_1491) & 3;
    float _1497 = (*spvDescriptorSet0.cp_c6)._m0[int(_1493)][_1495];
    int _1499 = int(_1491) + 1;
    uint _1501 = uint(int(uint(_1499) >> uint(2)));
    int _1503 = _1499 & 3;
    float _1505 = (*spvDescriptorSet0.cp_c6)._m0[int(_1501)][_1503];
    float _1507 = fma(_1211, _1333, _1445);
    float _1509 = fma(_1213, _1333, _1453);
    float _1511 = _1487 + _1215;
    float _1513 = fma(_1213, _1325, _1451);
    float _1515 = _1507 + _1217;
    float _1517 = fma(_1211, _1325, _1425);
    float _1519 = _1509 + _1219;
    float _1521 = _1511 * _1355;
    float _1523 = _1457 * _1355;
    float _1525 = _1485 * _1355;
    float _1527 = _1455 * _1355;
    float _1529 = fma(_1515, _1347, _1521);
    float _1531 = fma(_1477, _1347, _1523);
    float _1533 = fma(_1517, _1347, _1525);
    float _1535 = fma(_1483, _1347, _1527);
    float _1537 = _1511 * _1379;
    float _1539 = _1455 * _1379;
    float _1541 = _1457 * _1379;
    float _1543 = _1485 * _1379;
    float _1545 = fma(_1515, _1371, _1537);
    float _1547 = fma(_1483, _1371, _1539);
    float _1549 = fma(_1477, _1371, _1541);
    float _1551 = fma(_1517, _1371, _1543);
    float _1553 = _1511 * _1411;
    float _1555 = _1457 * _1411;
    float _1557 = _1455 * _1411;
    float _1559 = _1485 * _1411;
    float _1561 = fma(_1515, _1403, _1553);
    float _1563 = fma(_1477, _1403, _1555);
    float _1565 = fma(_1483, _1403, _1557);
    float _1567 = fma(_1517, _1403, _1559);
    float _1569 = fma(_1519, _1435, _1529);
    float _1571 = fma(_1481, _1435, _1531);
    float _1573 = fma(_1513, _1435, _1533);
    float _1575 = fma(_1479, _1435, _1535);
    float _1577 = _1569 + _1443;
    int _1579 = _1261 + 16;
    int _1581 = _1261 + 32;
    float _1583 = fma(_1519, _1467, _1545);
    float _1585 = fma(_1479, _1467, _1547);
    float _1587 = fma(_1481, _1467, _1549);
    float _1589 = fma(_1513, _1467, _1551);
    float _1591 = _1583 + _1475;
    int _1593 = _1261 + 48;
    uint _1595 = uint(int(uint(_1579) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1595)] = as_type<uint>(_1575);
    int _1597 = _1579 + 4;
    uint _1599 = uint(int(uint(_1597) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1599)] = as_type<uint>(_1571);
    int _1601 = _1579 + 8;
    uint _1603 = uint(int(uint(_1601) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1603)] = as_type<uint>(_1573);
    int _1605 = _1579 + 12;
    uint _1607 = uint(int(uint(_1605) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1607)] = as_type<uint>(_1577);
    float _1609 = fma(_1519, _1497, _1561);
    float _1611 = fma(_1479, _1497, _1565);
    float _1613 = fma(_1481, _1497, _1563);
    float _1615 = fma(_1513, _1497, _1567);
    float _1617 = _1609 + _1505;
    uint _1619 = uint(int(uint(_1581) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1619)] = as_type<uint>(_1585);
    int _1621 = _1581 + 4;
    uint _1623 = uint(int(uint(_1621) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1623)] = as_type<uint>(_1587);
    int _1625 = _1581 + 8;
    uint _1627 = uint(int(uint(_1625) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1627)] = as_type<uint>(_1589);
    int _1629 = _1581 + 12;
    uint _1631 = uint(int(uint(_1629) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1631)] = as_type<uint>(_1591);
    uint _1633 = uint(int(uint(_1593) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1633)] = as_type<uint>(_1611);
    int _1635 = _1593 + 4;
    uint _1637 = uint(int(uint(_1635) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1637)] = as_type<uint>(_1613);
    int _1639 = _1593 + 8;
    uint _1641 = uint(int(uint(_1639) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1641)] = as_type<uint>(_1615);
    int _1643 = _1593 + 12;
    uint _1645 = uint(int(uint(_1643) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1645)] = as_type<uint>(_1617);
}

