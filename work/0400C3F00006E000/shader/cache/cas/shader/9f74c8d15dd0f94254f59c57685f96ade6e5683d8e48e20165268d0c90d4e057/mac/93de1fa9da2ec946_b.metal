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
int _58(thread const int& _4195, thread const int& _4196, constant _10& support_buffer)
{
    int _4199 = 1 + _4196;
    float _4201 = support_buffer._m5[_4199].x;
    bool _4203 = _4201 == 1.0;
    if (_4203)
    {
        return _4195;
    }
    float _4205 = float(_4195);
    float _4207 = _4205 * _4201;
    int _4209 = int(_4207);
    return _4209;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1161 = false;
    bool _711 = false;
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
    if (_125)
    {
        int _137 = _101 + 8;
        uint _139 = uint(int(uint(_137) >> uint(2)));
        uint _141 = uint(int(uint(int(_139)) >> uint(2)));
        int _143 = int(_139) & 3;
        float _145 = (*spvDescriptorSet0.cp_c5)._m0[int(_141)][_143];
        _131 = as_type<int>(_145);
    }
    int _147 = _131;
    float _149 = 0.0;
    if (_125)
    {
        _149 = 1.4012984643248170709237295832899e-45;
    }
    float _151 = _149;
    float _153 = 0.0;
    if (_125)
    {
        _153 = 2.8025969286496341418474591665798e-45;
    }
    float _155 = _153;
    int _157 = 0;
    if (_129)
    {
        uint _159 = uint(int(uint(_101) >> uint(2)));
        uint _161 = uint(int(uint(int(_159)) >> uint(2)));
        int _163 = int(_159) & 3;
        float _165 = (*spvDescriptorSet0.cp_c5)._m0[int(_161)][_163];
        _157 = as_type<int>(_165);
    }
    int _167 = _157;
    if (_129)
    {
        _133 = 1.4012984643248170709237295832899e-45;
    }
    float _169 = _133;
    float _171 = _151;
    float _173 = as_type<float>(_68);
    float _175 = 0.0;
    float _177 = as_type<float>(_147);
    if (_125)
    {
        int _179 = _68;
        int _181 = 0;
        int _183 = _58(_179, _181, (*spvDescriptorSet0.support_buffer));
        int _185 = _147;
        int _187 = 0;
        int _189 = _58(_185, _187, (*spvDescriptorSet0.support_buffer));
        int3 _1859 = int3(_183, _189, as_type<int>(_151));
        float3 _193 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1859.xy), uint(_1859.z), 0).xyz;
        float _195 = _193.x;
        float _197 = _193.y;
        float _199 = _193.z;
        _171 = _195;
        _173 = _197;
        _175 = _199;
    }
    float _201 = _171;
    float _203 = _173;
    float _205 = _175;
    float _207 = 0.0;
    float _209 = 0.0;
    float _211 = 0.0;
    if (_125)
    {
        int _213 = _68;
        int _215 = 0;
        int _217 = _58(_213, _215, (*spvDescriptorSet0.support_buffer));
        int _219 = _147;
        int _221 = 0;
        int _223 = _58(_219, _221, (*spvDescriptorSet0.support_buffer));
        int3 _1885 = int3(_217, _223, 0);
        float3 _225 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1885.xy), uint(_1885.z), 0).xyz;
        float _227 = _225.x;
        float _229 = _225.y;
        float _231 = _225.z;
        _207 = _227;
        _209 = _229;
        _211 = _231;
    }
    float _233 = _207;
    float _235 = _209;
    float _237 = _211;
    float _239 = 0.0;
    float _241 = 0.0;
    float _243 = _155;
    if (_125)
    {
        int _245 = _68;
        int _247 = 0;
        int _249 = _58(_245, _247, (*spvDescriptorSet0.support_buffer));
        int _251 = _147;
        int _253 = 0;
        int _255 = _58(_251, _253, (*spvDescriptorSet0.support_buffer));
        int3 _1914 = int3(_249, _255, as_type<int>(_155));
        float3 _257 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1914.xy), uint(_1914.z), 0).xyz;
        float _259 = _257.x;
        float _261 = _257.y;
        float _263 = _257.z;
        _239 = _259;
        _241 = _261;
        _243 = _263;
    }
    float _265 = _239;
    float _267 = _241;
    float _269 = _243;
    float _271 = 0.0;
    float _273 = as_type<float>(_68);
    float _275 = 0.0;
    if (_129)
    {
        int _277 = _68;
        int _279 = 1;
        int _281 = _58(_277, _279, (*spvDescriptorSet0.support_buffer));
        int _283 = _167;
        int _285 = 1;
        int _287 = _58(_283, _285, (*spvDescriptorSet0.support_buffer));
        int3 _1942 = int3(_281, _287, 0);
        float3 _289 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1942.xy), uint(_1942.z), 0).xyz;
        float _291 = _289.x;
        float _293 = _289.y;
        float _295 = _289.z;
        _271 = _291;
        _273 = _293;
        _275 = _295;
    }
    float _297 = _271;
    float _299 = _273;
    float _301 = _275;
    float _303 = 0.0;
    float _305 = _111;
    float _307 = _169;
    if (_129)
    {
        int _309 = _68;
        int _311 = 1;
        int _313 = _58(_309, _311, (*spvDescriptorSet0.support_buffer));
        int _315 = _167;
        int _317 = 1;
        int _319 = _58(_315, _317, (*spvDescriptorSet0.support_buffer));
        int3 _1972 = int3(_313, _319, as_type<int>(_169));
        float3 _321 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1972.xy), uint(_1972.z), 0).xyz;
        float _323 = _321.x;
        float _325 = _321.y;
        float _327 = _321.z;
        _303 = _323;
        _305 = _325;
        _307 = _327;
    }
    float _329 = _303;
    float _331 = _305;
    float _333 = _307;
    float _335 = 0.0;
    float _337 = 0.0;
    if (!_129)
    {
        _335 = 0.0;
        _337 = 0.0;
    }
    float _339 = _335;
    float _341 = _337;
    float _343 = 0.0;
    float _345 = _339;
    float _347 = _341;
    if (!_129)
    {
        _343 = 0.0;
    }
    float _349 = _343;
    float _351 = 0.0;
    float _353 = _349;
    if (!_129)
    {
        _135 = 0.0;
        _351 = 0.0;
    }
    float _355 = _135;
    float _357 = _351;
    float _359 = 0.0;
    float _361 = _355;
    float _363 = _357;
    if (!_129)
    {
        _359 = 0.0;
    }
    float _365 = _359;
    float _367 = 0.0;
    float _369 = _365;
    if (!_129)
    {
        _367 = 0.0;
        _177 = 0.0;
    }
    float _371 = _367;
    float _373 = _177;
    float _375 = 0.0;
    float _377 = _371;
    float _379 = _373;
    if (!_129)
    {
        _375 = 0.0;
    }
    float _381 = _375;
    bool _383 = !_129;
    float _385 = _381;
    if (!_383)
    {
        int _387 = _68;
        int _389 = 1;
        int _391 = _58(_387, _389, (*spvDescriptorSet0.support_buffer));
        int _393 = _167;
        int _395 = 1;
        int _397 = _58(_393, _395, (*spvDescriptorSet0.support_buffer));
        int3 _2043 = int3(_391, _397, 2);
        float3 _399 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2043.xy), uint(_2043.z), 0).xyz;
        float _401 = _399.x;
        float _403 = _399.y;
        float _405 = _399.z;
        _385 = _329;
        _361 = _331;
        _363 = _333;
        _345 = _297;
        _347 = _299;
        _353 = _301;
        _377 = _401;
        _369 = _405;
        _379 = _403;
    }
    float _407 = _385;
    float _409 = _361;
    float _411 = _363;
    float _413 = _345;
    float _415 = _347;
    float _417 = _353;
    float _419 = _377;
    float _421 = _369;
    float _423 = _379;
    bool _425 = !_125;
    float _427 = _413;
    float _429 = _415;
    float _431 = _417;
    int _433 = as_type<int>(_423);
    float _435 = _421;
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
    int _703;
    float _705;
    float _707;
    float _709;
    if (!_425)
    {
        float _437 = _407 * 0.15915493667125701904296875;
        float _439 = _409 * 0.15915493667125701904296875;
        float _441 = _411 * 0.15915493667125701904296875;
        float _443 = _203 * 0.15915493667125701904296875;
        float _445 = _437 * 6.283185482025146484375;
        float _447 = cos(_445);
        float _449 = _205 * 0.15915493667125701904296875;
        float _451 = _201 * 0.15915493667125701904296875;
        int _453 = _101 + 20;
        uint _455 = uint(int(uint(_453) >> uint(2)));
        uint _457 = uint(int(uint(int(_455)) >> uint(2)));
        int _459 = int(_455) & 3;
        float _461 = (*spvDescriptorSet0.cp_c5)._m0[int(_457)][_459];
        float _463 = _439 * 6.283185482025146484375;
        float _465 = cos(_463);
        int _467 = _101 + 28;
        uint _469 = uint(int(uint(_467) >> uint(2)));
        uint _471 = uint(int(uint(int(_469)) >> uint(2)));
        int _473 = int(_469) & 3;
        float _475 = (*spvDescriptorSet0.cp_c5)._m0[int(_471)][_473];
        float _477 = _441 * 6.283185482025146484375;
        float _479 = sin(_477);
        float _481 = _441 * 6.283185482025146484375;
        float _483 = cos(_481);
        float _485 = _437 * 6.283185482025146484375;
        float _487 = sin(_485);
        float _489 = _479 * _465;
        float _491 = _233 * _475;
        float _493 = _235 * _475;
        float _495 = _237 * _475;
        float _497 = fma(_413, _461, _491);
        float _499 = _439 * 6.283185482025146484375;
        float _501 = sin(_499);
        float _503 = _447 * _483;
        float _505 = _479 * _447;
        float _507 = fma(_415, _461, _493);
        float _509 = fma(_417, _461, _495);
        float _511 = _443 * 6.283185482025146484375;
        float _513 = sin(_511);
        float _515 = _487 * _479;
        float _517 = _465 * _483;
        float _519 = _443 * 6.283185482025146484375;
        float _521 = cos(_519);
        float _523 = fma(_501, _503, _515);
        float _525 = _449 * 6.283185482025146484375;
        float _527 = sin(_525);
        float _529 = _447 * _465;
        float _531 = _487 * _501;
        float _533 = _487 * _465;
        float _535 = _449 * 6.283185482025146484375;
        float _537 = cos(_535);
        float _539 = _451 * 6.283185482025146484375;
        float _541 = cos(_539);
        float _543 = _487 * _483;
        float _545 = -_505;
        float _547 = fma(_483, _531, _545);
        float _549 = fma(_479, _531, _503);
        float _551 = _527 * _521;
        float _553 = -_543;
        float _555 = fma(_501, _505, _553);
        float _557 = _451 * 6.283185482025146484375;
        float _559 = sin(_557);
        float _561 = _521 * _537;
        float _563 = _551 * _475;
        float _565 = _561 * _475;
        float _567 = fma(_489, _461, _563);
        float _569 = _541 * _537;
        float _571 = _527 * _541;
        float _573 = _541 * _521;
        float _575 = fma(_517, _461, _565);
        float _577 = _567 * _567;
        float _579 = _573 * _475;
        float _581 = _559 * _513;
        float _583 = _559 * _527;
        float _585 = _559 * _537;
        float _587 = _559 * _521;
        float _589 = -_571;
        float _591 = fma(_537, _581, _589);
        float _593 = fma(_527, _581, _569);
        float _595 = fma(_513, _569, _583);
        float _597 = _501 * _461;
        float _599 = -_585;
        float _601 = fma(_513, _571, _599);
        float _603 = _587 * _475;
        float _605 = _593 * _475;
        float _607 = -_513;
        float _609 = -_597;
        float _611 = fma(_607, _475, _609);
        float _613 = _591 * _475;
        float _615 = fma(_533, _461, _603);
        float _617 = fma(_549, _461, _605);
        float _619 = _595 * _475;
        float _621 = fma(_547, _461, _613);
        float _623 = _601 * _475;
        float _625 = fma(_575, _575, _577);
        float _627 = _617 * _617;
        float _629 = fma(_523, _461, _619);
        float _631 = fma(_555, _461, _623);
        float _633 = fma(_529, _461, _579);
        float _635 = fma(_621, _621, _627);
        float _637 = fma(_611, _611, _625);
        float _639 = _631 * _631;
        float _641 = _269 * _475;
        float _643 = fma(_615, _615, _635);
        float _645 = rsqrt(_637);
        float _647 = fma(_629, _629, _639);
        float _649 = _265 * _475;
        float _651 = fma(_633, _633, _647);
        float _653 = fma(_419, _461, _649);
        float _655 = rsqrt(_643);
        float _657 = _267 * _475;
        float _659 = fma(_421, _461, _641);
        float _661 = fma(_423, _461, _657);
        float _663 = rsqrt(_651);
        float _665 = _575 * _645;
        float _667 = _567 * _645;
        float _669 = _611 * _645;
        float _671 = _615 * _655;
        float _673 = _621 * _655;
        float _675 = _617 * _655;
        float _677 = _631 * _663;
        float _679 = _629 * _663;
        float _681 = _633 * _663;
        _427 = _497;
        _683 = _669;
        _685 = _665;
        _687 = _667;
        _429 = _507;
        _689 = _673;
        _691 = _675;
        _693 = _671;
        _431 = _509;
        _695 = _679;
        _697 = _677;
        _699 = _681;
        _701 = as_type<int>(_653);
        _433 = as_type<int>(_661);
        _703 = as_type<int>(_659);
        _705 = _663;
        _707 = _629;
        _709 = _633;
        _711 = true;
    }
    else
    {
        float _713 = _407 * 0.15915493667125701904296875;
        float _715 = _411 * 0.15915493667125701904296875;
        float _717 = _409 * 0.15915493667125701904296875;
        float _719 = _713 * 6.283185482025146484375;
        float _721 = sin(_719);
        float _723 = _713 * 6.283185482025146484375;
        float _725 = cos(_723);
        float _727 = _715 * 6.283185482025146484375;
        float _729 = sin(_727);
        float _731 = _715 * 6.283185482025146484375;
        float _733 = cos(_731);
        float _735 = _717 * 6.283185482025146484375;
        float _737 = sin(_735);
        float _739 = _721 * _729;
        float _741 = _729 * _725;
        float _743 = _717 * 6.283185482025146484375;
        float _745 = cos(_743);
        float _747 = _725 * _733;
        float _749 = _721 * _733;
        float _751 = _721 * _737;
        float _753 = -_737;
        float _755 = _753 + (-0.0);
        float _757 = -_741;
        float _759 = fma(_733, _751, _757);
        float _761 = _729 * _745;
        float _763 = _721 * _745;
        float _765 = fma(_729, _751, _747);
        float _767 = fma(_737, _747, _739);
        float _769 = -_749;
        float _771 = fma(_737, _741, _769);
        float _773 = _725 * _745;
        float _775 = _745 * _733;
        _683 = _755;
        _685 = _775;
        _687 = _761;
        _689 = _759;
        _691 = _765;
        _693 = _763;
        _695 = _767;
        _697 = _771;
        _699 = _773;
        _701 = as_type<int>(_419);
        _703 = as_type<int>(_421);
        _705 = _737;
        _707 = _751;
        _709 = _745;
    }
    _711 = false;
    float _777 = _427;
    float _779 = _683;
    float _781 = _685;
    float _783 = _687;
    float _785 = _429;
    float _787 = _689;
    float _789 = _691;
    float _791 = _693;
    float _793 = _431;
    float _795 = _695;
    float _797 = _697;
    float _799 = _699;
    int _801 = _701;
    int _803 = _433;
    int _805 = _703;
    float _807 = _705;
    float _809 = _707;
    float _811 = _709;
    float _813 = _777 * _779;
    float _815 = _777 * _781;
    float _817 = _777 * _783;
    float _819 = _785 * _787;
    float _821 = _785 * _789;
    float _823 = _785 * _791;
    int _825 = _68 * 48;
    float _827 = _793 * _795;
    float _829 = _793 * _797;
    float _831 = _793 * _799;
    bool _833 = _68 != 0;
    uint _835 = uint(int(uint(_825) >> uint(2)));
    _39[int(_835)] = as_type<uint>(_815);
    int _837 = _825 + 4;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    _39[int(_839)] = as_type<uint>(_819);
    int _841 = _825 + 8;
    uint _843 = uint(int(uint(_841) >> uint(2)));
    _39[int(_843)] = as_type<uint>(_827);
    int _845 = _825 + 12;
    uint _847 = uint(int(uint(_845) >> uint(2)));
    _39[int(_847)] = uint(_801);
    int _849 = _68 * 112;
    int _851 = _825 + 16;
    int _853 = _825 + 16;
    uint _855 = uint(int(uint(_853) >> uint(2)));
    _39[int(_855)] = as_type<uint>(_817);
    int _857 = _825 + 20;
    uint _859 = uint(int(uint(_857) >> uint(2)));
    _39[int(_859)] = as_type<uint>(_821);
    int _861 = _825 + 24;
    uint _863 = uint(int(uint(_861) >> uint(2)));
    _39[int(_863)] = as_type<uint>(_829);
    int _865 = _825 + 28;
    uint _867 = uint(int(uint(_865) >> uint(2)));
    _39[int(_867)] = uint(_803);
    int _869 = _825 + 32;
    int _871 = _825 + 32;
    uint _873 = uint(int(uint(_871) >> uint(2)));
    _39[int(_873)] = as_type<uint>(_813);
    int _875 = _825 + 36;
    uint _877 = uint(int(uint(_875) >> uint(2)));
    _39[int(_877)] = as_type<uint>(_823);
    int _879 = _825 + 40;
    uint _881 = uint(int(uint(_879) >> uint(2)));
    _39[int(_881)] = as_type<uint>(_831);
    int _883 = _825 + 44;
    uint _885 = uint(int(uint(_883) >> uint(2)));
    _39[int(_885)] = uint(_805);
    float _887 = _807;
    float _889 = _809;
    float _891 = _811;
    float _893 = _797;
    float _895 = _793;
    float _897 = _785;
    float _899 = _777;
    float _901 = _817;
    float _903 = _821;
    float _905 = _829;
    float _907 = as_type<float>(_803);
    if (!_833)
    {
        _435 = _815;
    }
    float _909 = _435;
    float _911 = _909;
    if (!_833)
    {
        _887 = _819;
    }
    float _913 = _887;
    float _915 = _913;
    if (!_833)
    {
        _889 = _827;
    }
    float _917 = _889;
    float _919 = _917;
    if (!_833)
    {
        _891 = as_type<float>(_801);
    }
    float _921 = _891;
    float _923 = _921;
    if (!_833)
    {
        _893 = _813;
    }
    float _925 = _893;
    float _927 = _925;
    if (!_833)
    {
        _895 = _823;
    }
    float _929 = _895;
    float _931 = _929;
    if (!_833)
    {
        _897 = _831;
    }
    float _933 = _897;
    float _935 = _933;
    if (!_833)
    {
        _899 = as_type<float>(_805);
    }
    float _937 = _899;
    bool _939 = !_833;
    float _941 = _937;
    if (!_939)
    {
        bool _943 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _945 = !_943;
        if (!_945)
        {
            uint _947 = uint(int(uint(_849) >> uint(2)));
            uint _949 = uint(int(uint(int(_947)) >> uint(2)));
            int _951 = int(_947) & 3;
            float _953 = (*spvDescriptorSet0.cp_c6)._m0[int(_949)][_951];
            int _955 = as_type<int>(_953) * 48;
            int _957 = 0;
            bool _959;
            float _1057;
            float _1059;
            float _1067;
            float _1077;
            float _1079;
            float _1093;
            float _1103;
            float _1105;
            float _1107;
            float _1109;
            float _1111;
            float _1113;
            do
            {
                int _961 = _957;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _963 = uint(int(uint(_955) >> uint(2)));
                float _965 = as_type<float>(_39[int(_963)]);
                int _967 = _955 + 4;
                uint _969 = uint(int(uint(_967) >> uint(2)));
                float _971 = as_type<float>(_39[int(_969)]);
                int _973 = _955 + 8;
                uint _975 = uint(int(uint(_973) >> uint(2)));
                float _977 = as_type<float>(_39[int(_975)]);
                int _979 = _955 + 12;
                uint _981 = uint(int(uint(_979) >> uint(2)));
                float _983 = as_type<float>(_39[int(_981)]);
                int _985 = _961 + 1;
                int _987 = _955 + 16;
                uint _989 = uint(int(uint(_987) >> uint(2)));
                float _991 = as_type<float>(_39[int(_989)]);
                int _993 = _955 + 20;
                uint _995 = uint(int(uint(_993) >> uint(2)));
                float _997 = as_type<float>(_39[int(_995)]);
                int _999 = _955 + 24;
                uint _1001 = uint(int(uint(_999) >> uint(2)));
                float _1003 = as_type<float>(_39[int(_1001)]);
                int _1005 = _955 + 28;
                uint _1007 = uint(int(uint(_1005) >> uint(2)));
                float _1009 = as_type<float>(_39[int(_1007)]);
                bool _1011 = uint(_985) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1013 = _955 + 32;
                uint _1015 = uint(int(uint(_1013) >> uint(2)));
                float _1017 = as_type<float>(_39[int(_1015)]);
                int _1019 = _955 + 36;
                uint _1021 = uint(int(uint(_1019) >> uint(2)));
                float _1023 = as_type<float>(_39[int(_1021)]);
                int _1025 = _955 + 40;
                uint _1027 = uint(int(uint(_1025) >> uint(2)));
                float _1029 = as_type<float>(_39[int(_1027)]);
                int _1031 = _955 + 44;
                uint _1033 = uint(int(uint(_1031) >> uint(2)));
                float _1035 = as_type<float>(_39[int(_1033)]);
                float _1037 = _971 * as_type<float>(_803);
                float _1039 = _817 * _971;
                float _1041 = _821 * _971;
                float _1043 = _829 * _971;
                float _1045 = fma(_965, as_type<float>(_801), _1037);
                float _1047 = fma(_815, _965, _1039);
                float _1049 = fma(_819, _965, _1041);
                float _1051 = fma(_827, _965, _1043);
                float _1053 = fma(_977, as_type<float>(_805), _1045);
                float _1055 = _997 * as_type<float>(_803);
                _1057 = fma(_813, _977, _1047);
                _1059 = fma(_823, _977, _1049);
                float _1061 = _817 * _997;
                float _1063 = _821 * _997;
                float _1065 = fma(_991, as_type<float>(_801), _1055);
                _1067 = _983 + _1053;
                float _1069 = fma(_815, _991, _1061);
                float _1071 = fma(_819, _991, _1063);
                float _1073 = fma(_1003, as_type<float>(_805), _1065);
                float _1075 = _1023 * as_type<float>(_803);
                _1077 = fma(_813, _1003, _1069);
                _1079 = fma(_823, _1003, _1071);
                float _1081 = _829 * _997;
                float _1083 = _817 * _1023;
                float _1085 = _821 * _1023;
                float _1087 = _829 * _1023;
                float _1089 = fma(_1017, as_type<float>(_801), _1075);
                float _1091 = fma(_827, _991, _1081);
                _1093 = _1009 + _1073;
                float _1095 = fma(_815, _1017, _1083);
                float _1097 = fma(_819, _1017, _1085);
                float _1099 = fma(_827, _1017, _1087);
                float _1101 = fma(_1029, as_type<float>(_805), _1089);
                _1103 = fma(_831, _1003, _1091);
                _1105 = fma(_831, _977, _1051);
                _1107 = fma(_813, _1029, _1095);
                _1109 = fma(_823, _1029, _1097);
                _1111 = fma(_831, _1029, _1099);
                _1113 = _1035 + _1101;
                uint _1115 = uint(int(uint(_825) >> uint(2)));
                _39[int(_1115)] = as_type<uint>(_1057);
                int _1117 = _825 + 4;
                uint _1119 = uint(int(uint(_1117) >> uint(2)));
                _39[int(_1119)] = as_type<uint>(_1059);
                int _1121 = _825 + 8;
                uint _1123 = uint(int(uint(_1121) >> uint(2)));
                _39[int(_1123)] = as_type<uint>(_1105);
                int _1125 = _825 + 12;
                uint _1127 = uint(int(uint(_1125) >> uint(2)));
                _39[int(_1127)] = as_type<uint>(_1067);
                int _1129 = _825 + 16;
                uint _1131 = uint(int(uint(_1129) >> uint(2)));
                _39[int(_1131)] = as_type<uint>(_1077);
                int _1133 = _825 + 20;
                uint _1135 = uint(int(uint(_1133) >> uint(2)));
                _39[int(_1135)] = as_type<uint>(_1079);
                int _1137 = _825 + 24;
                uint _1139 = uint(int(uint(_1137) >> uint(2)));
                _39[int(_1139)] = as_type<uint>(_1103);
                int _1141 = _825 + 28;
                uint _1143 = uint(int(uint(_1141) >> uint(2)));
                _39[int(_1143)] = as_type<uint>(_1093);
                int _1145 = _825 + 32;
                uint _1147 = uint(int(uint(_1145) >> uint(2)));
                _39[int(_1147)] = as_type<uint>(_1107);
                int _1149 = _825 + 36;
                uint _1151 = uint(int(uint(_1149) >> uint(2)));
                _39[int(_1151)] = as_type<uint>(_1109);
                int _1153 = _825 + 40;
                uint _1155 = uint(int(uint(_1153) >> uint(2)));
                _39[int(_1155)] = as_type<uint>(_1111);
                int _1157 = _825 + 44;
                uint _1159 = uint(int(uint(_1157) >> uint(2)));
                _39[int(_1159)] = as_type<uint>(_1113);
                _959 = !_1011;
                _957 = _985;
            } while (_959);
            _911 = _1057;
            _915 = _1059;
            _919 = _1105;
            _923 = _1067;
            _901 = _1077;
            _903 = _1079;
            _905 = _1103;
            _907 = _1093;
            _927 = _1107;
            _931 = _1109;
            _935 = _1111;
            _941 = _1113;
            _1161 = true;
        }
        else
        {
            _911 = 0.0;
            _915 = 0.0;
            _919 = 0.0;
            _923 = 0.0;
            _901 = 0.0;
            _903 = 0.0;
            _905 = 0.0;
            _907 = 0.0;
            _927 = 0.0;
            _931 = 0.0;
            _935 = 0.0;
            _941 = 0.0;
        }
    }
    _1161 = false;
    float _1163 = _911;
    float _1165 = _915;
    float _1167 = _919;
    float _1169 = _923;
    float _1171 = _901;
    float _1173 = _903;
    float _1175 = _905;
    float _1177 = _907;
    float _1179 = _927;
    float _1181 = _931;
    float _1183 = _935;
    float _1185 = _941;
    int _1187 = _849 + 80;
    uint _1189 = uint(int(uint(_1187) >> uint(2)));
    uint _1191 = uint(int(uint(int(_1189)) >> uint(2)));
    int _1193 = int(_1189) & 3;
    float _1195 = (*spvDescriptorSet0.cp_c6)._m0[int(_1191)][_1193];
    int _1197 = int(_1189) + 1;
    uint _1199 = uint(int(uint(_1197) >> uint(2)));
    int _1201 = _1197 & 3;
    float _1203 = (*spvDescriptorSet0.cp_c6)._m0[int(_1199)][_1201];
    bool _1205 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1207 = _849 + 64;
    uint _1209 = uint(int(uint(_1207) >> uint(2)));
    uint _1211 = uint(int(uint(int(_1209)) >> uint(2)));
    int _1213 = int(_1209) & 3;
    float _1215 = (*spvDescriptorSet0.cp_c6)._m0[int(_1211)][_1213];
    int _1217 = int(_1209) + 1;
    uint _1219 = uint(int(uint(_1217) >> uint(2)));
    int _1221 = _1217 & 3;
    float _1223 = (*spvDescriptorSet0.cp_c6)._m0[int(_1219)][_1221];
    int _1225 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1227 = _1225 + _68;
    int _1229 = _849 + 88;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    uint _1233 = uint(int(uint(int(_1231)) >> uint(2)));
    int _1235 = int(_1231) & 3;
    float _1237 = (*spvDescriptorSet0.cp_c6)._m0[int(_1233)][_1235];
    int _1239 = int(_1231) + 1;
    uint _1241 = uint(int(uint(_1239) >> uint(2)));
    int _1243 = _1239 & 3;
    float _1245 = (*spvDescriptorSet0.cp_c6)._m0[int(_1241)][_1243];
    int _1247 = _849 + 72;
    uint _1249 = uint(int(uint(_1247) >> uint(2)));
    uint _1251 = uint(int(uint(int(_1249)) >> uint(2)));
    int _1253 = int(_1249) & 3;
    float _1255 = (*spvDescriptorSet0.cp_c6)._m0[int(_1251)][_1253];
    int _1257 = int(_1249) + 1;
    uint _1259 = uint(int(uint(_1257) >> uint(2)));
    int _1261 = _1257 & 3;
    float _1263 = (*spvDescriptorSet0.cp_c6)._m0[int(_1259)][_1261];
    int _1265 = _849 + 96;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    uint _1269 = uint(int(uint(int(_1267)) >> uint(2)));
    int _1271 = int(_1267) & 3;
    float _1273 = (*spvDescriptorSet0.cp_c6)._m0[int(_1269)][_1271];
    int _1275 = int(_1267) + 1;
    uint _1277 = uint(int(uint(_1275) >> uint(2)));
    int _1279 = _1275 & 3;
    float _1281 = (*spvDescriptorSet0.cp_c6)._m0[int(_1277)][_1279];
    int _1283 = _849 + 104;
    uint _1285 = uint(int(uint(_1283) >> uint(2)));
    uint _1287 = uint(int(uint(int(_1285)) >> uint(2)));
    int _1289 = int(_1285) & 3;
    float _1291 = (*spvDescriptorSet0.cp_c6)._m0[int(_1287)][_1289];
    int _1293 = int(_1285) + 1;
    uint _1295 = uint(int(uint(_1293) >> uint(2)));
    int _1297 = _1293 & 3;
    float _1299 = (*spvDescriptorSet0.cp_c6)._m0[int(_1295)][_1297];
    int _1301 = _849 + 16;
    uint _1303 = uint(int(uint(_1301) >> uint(2)));
    uint _1305 = uint(int(uint(int(_1303)) >> uint(2)));
    int _1307 = int(_1303) & 3;
    float _1309 = (*spvDescriptorSet0.cp_c6)._m0[int(_1305)][_1307];
    int _1311 = int(_1303) + 1;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    int _1315 = _1311 & 3;
    float _1317 = (*spvDescriptorSet0.cp_c6)._m0[int(_1313)][_1315];
    if (!_1205)
    {
        uint _1319 = uint(int(uint(_825) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1319)] = as_type<uint>(_1163);
        int _1321 = _825 + 4;
        uint _1323 = uint(int(uint(_1321) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1323)] = as_type<uint>(_1165);
        int _1325 = _825 + 8;
        uint _1327 = uint(int(uint(_1325) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1327)] = as_type<uint>(_1167);
        int _1329 = _825 + 12;
        uint _1331 = uint(int(uint(_1329) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1331)] = as_type<uint>(_1169);
        uint _1333 = uint(int(uint(_851) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1333)] = as_type<uint>(_1171);
        int _1335 = _851 + 4;
        uint _1337 = uint(int(uint(_1335) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1337)] = as_type<uint>(_1173);
        int _1339 = _851 + 8;
        uint _1341 = uint(int(uint(_1339) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1341)] = as_type<uint>(_1175);
        int _1343 = _851 + 12;
        uint _1345 = uint(int(uint(_1343) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1345)] = as_type<uint>(_1177);
        uint _1347 = uint(int(uint(_869) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1347)] = as_type<uint>(_1179);
        int _1349 = _869 + 4;
        uint _1351 = uint(int(uint(_1349) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1351)] = as_type<uint>(_1181);
        int _1353 = _869 + 8;
        uint _1355 = uint(int(uint(_1353) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1355)] = as_type<uint>(_1183);
        int _1357 = _869 + 12;
        uint _1359 = uint(int(uint(_1357) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1359)] = as_type<uint>(_1185);
    }
    float _1361 = _1173 * _1195;
    float _1363 = _1181 * _1195;
    int _1365 = _849 + 32;
    uint _1367 = uint(int(uint(_1365) >> uint(2)));
    uint _1369 = uint(int(uint(int(_1367)) >> uint(2)));
    int _1371 = int(_1367) & 3;
    float _1373 = (*spvDescriptorSet0.cp_c6)._m0[int(_1369)][_1371];
    int _1375 = int(_1367) + 1;
    uint _1377 = uint(int(uint(_1375) >> uint(2)));
    int _1379 = _1375 & 3;
    float _1381 = (*spvDescriptorSet0.cp_c6)._m0[int(_1377)][_1379];
    float _1383 = _1165 * _1195;
    float _1385 = fma(_1171, _1215, _1361);
    float _1387 = fma(_1179, _1215, _1363);
    float _1389 = _1165 * _1203;
    float _1391 = _1173 * _1203;
    float _1393 = _1181 * _1203;
    float _1395 = _1165 * _1245;
    int _1397 = _849 + 48;
    uint _1399 = uint(int(uint(_1397) >> uint(2)));
    uint _1401 = uint(int(uint(int(_1399)) >> uint(2)));
    int _1403 = int(_1399) & 3;
    float _1405 = (*spvDescriptorSet0.cp_c6)._m0[int(_1401)][_1403];
    int _1407 = int(_1399) + 1;
    uint _1409 = uint(int(uint(_1407) >> uint(2)));
    int _1411 = _1407 & 3;
    float _1413 = (*spvDescriptorSet0.cp_c6)._m0[int(_1409)][_1411];
    float _1415 = fma(_1163, _1223, _1389);
    float _1417 = fma(_1171, _1223, _1391);
    float _1419 = fma(_1179, _1223, _1393);
    float _1421 = _1165 * _1237;
    float _1423 = _1173 * _1237;
    float _1425 = _1181 * _1237;
    float _1427 = _1173 * _1245;
    float _1429 = _1181 * _1245;
    float _1431 = fma(_1163, _1255, _1421);
    int _1433 = _849 + 24;
    uint _1435 = uint(int(uint(_1433) >> uint(2)));
    uint _1437 = uint(int(uint(int(_1435)) >> uint(2)));
    int _1439 = int(_1435) & 3;
    float _1441 = (*spvDescriptorSet0.cp_c6)._m0[int(_1437)][_1439];
    int _1443 = int(_1435) + 1;
    uint _1445 = uint(int(uint(_1443) >> uint(2)));
    int _1447 = _1443 & 3;
    float _1449 = (*spvDescriptorSet0.cp_c6)._m0[int(_1445)][_1447];
    float _1451 = fma(_1163, _1263, _1395);
    float _1453 = fma(_1171, _1255, _1423);
    float _1455 = fma(_1171, _1263, _1427);
    float _1457 = fma(_1179, _1255, _1425);
    float _1459 = fma(_1179, _1263, _1429);
    float _1461 = fma(_1167, _1281, _1415);
    float _1463 = fma(_1175, _1273, _1385);
    int _1465 = _849 + 40;
    uint _1467 = uint(int(uint(_1465) >> uint(2)));
    uint _1469 = uint(int(uint(int(_1467)) >> uint(2)));
    int _1471 = int(_1467) & 3;
    float _1473 = (*spvDescriptorSet0.cp_c6)._m0[int(_1469)][_1471];
    int _1475 = int(_1467) + 1;
    uint _1477 = uint(int(uint(_1475) >> uint(2)));
    int _1479 = _1475 & 3;
    float _1481 = (*spvDescriptorSet0.cp_c6)._m0[int(_1477)][_1479];
    float _1483 = fma(_1175, _1281, _1417);
    float _1485 = fma(_1175, _1291, _1453);
    float _1487 = fma(_1175, _1299, _1455);
    float _1489 = fma(_1167, _1299, _1451);
    float _1491 = fma(_1183, _1273, _1387);
    float _1493 = fma(_1183, _1281, _1419);
    float _1495 = _1487 + _1177;
    int _1497 = _849 + 56;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    uint _1501 = uint(int(uint(int(_1499)) >> uint(2)));
    int _1503 = int(_1499) & 3;
    float _1505 = (*spvDescriptorSet0.cp_c6)._m0[int(_1501)][_1503];
    int _1507 = int(_1499) + 1;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    int _1511 = _1507 & 3;
    float _1513 = (*spvDescriptorSet0.cp_c6)._m0[int(_1509)][_1511];
    float _1515 = fma(_1183, _1299, _1459);
    float _1517 = fma(_1183, _1291, _1457);
    float _1519 = fma(_1163, _1215, _1383);
    float _1521 = _1489 + _1169;
    float _1523 = _1495 * _1317;
    float _1525 = fma(_1167, _1291, _1431);
    float _1527 = _1515 + _1185;
    float _1529 = _1485 * _1317;
    float _1531 = fma(_1167, _1273, _1519);
    float _1533 = _1463 * _1317;
    float _1535 = _1483 * _1317;
    float _1537 = fma(_1521, _1309, _1523);
    float _1539 = fma(_1525, _1309, _1529);
    float _1541 = _1495 * _1381;
    float _1543 = _1463 * _1381;
    float _1545 = _1483 * _1381;
    float _1547 = _1485 * _1381;
    float _1549 = fma(_1521, _1373, _1541);
    int _1551 = _1227 * 48;
    float _1553 = fma(_1531, _1309, _1533);
    float _1555 = fma(_1461, _1309, _1535);
    float _1557 = _1495 * _1413;
    float _1559 = _1463 * _1413;
    float _1561 = _1483 * _1413;
    float _1563 = _1485 * _1413;
    float _1565 = fma(_1521, _1405, _1557);
    float _1567 = fma(_1531, _1373, _1543);
    float _1569 = fma(_1461, _1373, _1545);
    float _1571 = fma(_1525, _1373, _1547);
    float _1573 = fma(_1531, _1405, _1559);
    float _1575 = fma(_1461, _1405, _1561);
    float _1577 = fma(_1527, _1441, _1537);
    float _1579 = fma(_1525, _1405, _1563);
    float _1581 = fma(_1517, _1441, _1539);
    float _1583 = fma(_1491, _1441, _1553);
    float _1585 = fma(_1493, _1441, _1555);
    float _1587 = _1577 + _1449;
    int _1589 = _1551 + 16;
    float _1591 = fma(_1527, _1473, _1549);
    float _1593 = fma(_1491, _1473, _1567);
    float _1595 = fma(_1493, _1473, _1569);
    float _1597 = fma(_1517, _1473, _1571);
    float _1599 = _1591 + _1481;
    int _1601 = _1551 + 32;
    uint _1603 = uint(int(uint(_1589) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1603)] = as_type<uint>(_1583);
    int _1605 = _1589 + 4;
    uint _1607 = uint(int(uint(_1605) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1607)] = as_type<uint>(_1585);
    int _1609 = _1589 + 8;
    uint _1611 = uint(int(uint(_1609) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1611)] = as_type<uint>(_1581);
    int _1613 = _1589 + 12;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1615)] = as_type<uint>(_1587);
    int _1617 = _1551 + 48;
    float _1619 = fma(_1527, _1505, _1565);
    float _1621 = fma(_1491, _1505, _1573);
    float _1623 = fma(_1493, _1505, _1575);
    float _1625 = fma(_1517, _1505, _1579);
    float _1627 = _1619 + _1513;
    uint _1629 = uint(int(uint(_1601) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1629)] = as_type<uint>(_1593);
    int _1631 = _1601 + 4;
    uint _1633 = uint(int(uint(_1631) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1633)] = as_type<uint>(_1595);
    int _1635 = _1601 + 8;
    uint _1637 = uint(int(uint(_1635) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1637)] = as_type<uint>(_1597);
    int _1639 = _1601 + 12;
    uint _1641 = uint(int(uint(_1639) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1641)] = as_type<uint>(_1599);
    uint _1643 = uint(int(uint(_1617) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1643)] = as_type<uint>(_1621);
    int _1645 = _1617 + 4;
    uint _1647 = uint(int(uint(_1645) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1647)] = as_type<uint>(_1623);
    int _1649 = _1617 + 8;
    uint _1651 = uint(int(uint(_1649) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1651)] = as_type<uint>(_1625);
    int _1653 = _1617 + 12;
    uint _1655 = uint(int(uint(_1653) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1655)] = as_type<uint>(_1627);
}

