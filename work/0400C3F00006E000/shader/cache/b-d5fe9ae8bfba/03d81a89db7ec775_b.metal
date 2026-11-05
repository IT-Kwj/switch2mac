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
int _58(thread const int& _3895, thread const int& _3896, constant _10& support_buffer)
{
    int _3899 = 1 + _3896;
    float _3901 = support_buffer._m5[_3899].x;
    bool _3903 = _3901 == 1.0;
    if (_3903)
    {
        return _3895;
    }
    float _3905 = float(_3895);
    float _3907 = _3905 * _3901;
    int _3909 = int(_3907);
    return _3909;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1041 = false;
    bool _583 = false;
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
    float _169 = 0.0;
    if (_129)
    {
        _169 = 1.4012984643248170709237295832899e-45;
    }
    float _171 = _169;
    float _173 = _151;
    float _175 = as_type<float>(_68);
    float _177 = 0.0;
    float _179 = as_type<float>(_147);
    if (_125)
    {
        int _181 = _68;
        int _183 = 0;
        int _185 = _58(_181, _183, (*spvDescriptorSet0.support_buffer));
        int _187 = _147;
        int _189 = 0;
        int _191 = _58(_187, _189, (*spvDescriptorSet0.support_buffer));
        int3 _1739 = int3(_185, _191, as_type<int>(_151));
        float3 _195 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1739.xy), uint(_1739.z), 0).xyz;
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
    float _211 = as_type<float>(_68);
    float _213 = 0.0;
    if (_125)
    {
        int _215 = _68;
        int _217 = 0;
        int _219 = _58(_215, _217, (*spvDescriptorSet0.support_buffer));
        int _221 = _147;
        int _223 = 0;
        int _225 = _58(_221, _223, (*spvDescriptorSet0.support_buffer));
        int3 _1767 = int3(_219, _225, 0);
        float3 _227 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1767.xy), uint(_1767.z), 0).xyz;
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
    float _241 = _155;
    float _243 = as_type<float>(_68);
    float _245 = 0.0;
    if (_125)
    {
        int _247 = _68;
        int _249 = 0;
        int _251 = _58(_247, _249, (*spvDescriptorSet0.support_buffer));
        int _253 = _147;
        int _255 = 0;
        int _257 = _58(_253, _255, (*spvDescriptorSet0.support_buffer));
        int3 _1798 = int3(_251, _257, as_type<int>(_155));
        float3 _259 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1798.xy), uint(_1798.z), 0).xyz;
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
        int _285 = _167;
        int _287 = 1;
        int _289 = _58(_285, _287, (*spvDescriptorSet0.support_buffer));
        int3 _1826 = int3(_283, _289, 0);
        float3 _291 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1826.xy), uint(_1826.z), 0).xyz;
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
    float _307 = _111;
    float _309 = _171;
    if (_129)
    {
        int _311 = _68;
        int _313 = 1;
        int _315 = _58(_311, _313, (*spvDescriptorSet0.support_buffer));
        int _317 = _167;
        int _319 = 1;
        int _321 = _58(_317, _319, (*spvDescriptorSet0.support_buffer));
        int3 _1856 = int3(_315, _321, as_type<int>(_171));
        float3 _323 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1856.xy), uint(_1856.z), 0).xyz;
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
    float _339 = 0.0;
    if (!_129)
    {
        _337 = 0.0;
        _339 = 0.0;
    }
    float _341 = _337;
    float _343 = _339;
    float _345 = 0.0;
    float _347 = 0.0;
    float _349 = _343;
    float _351 = _341;
    if (!_129)
    {
        _345 = 0.0;
        _347 = 0.0;
    }
    float _353 = _345;
    float _355 = _347;
    float _357 = 0.0;
    float _359 = _353;
    float _361 = _355;
    if (!_129)
    {
        _357 = 0.0;
    }
    float _363 = _357;
    float _365 = _363;
    if (!_129)
    {
        _133 = 0.0;
        _135 = 0.0;
    }
    float _367 = _133;
    float _369 = _135;
    float _371 = 0.0;
    float _373 = _367;
    float _375 = _369;
    if (!_129)
    {
        _371 = 0.0;
        _179 = 0.0;
    }
    float _377 = _371;
    float _379 = _179;
    bool _381 = !_129;
    float _383 = _377;
    float _385 = _379;
    float _387 = _203;
    if (!_381)
    {
        int _389 = _68;
        int _391 = 1;
        int _393 = _58(_389, _391, (*spvDescriptorSet0.support_buffer));
        int _395 = _167;
        int _397 = 1;
        int _399 = _58(_395, _397, (*spvDescriptorSet0.support_buffer));
        int3 _1924 = int3(_393, _399, 2);
        float3 _401 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1924.xy), uint(_1924.z), 0).xyz;
        float _403 = _401.x;
        float _405 = _401.y;
        float _407 = _401.z;
        _373 = _335;
        _365 = _331;
        _359 = _301;
        _375 = _333;
        _383 = _403;
        _349 = _299;
        _361 = _303;
        _385 = _405;
        _351 = _407;
    }
    float _409 = _373;
    float _411 = _365;
    float _413 = _359;
    float _415 = _375;
    float _417 = _383;
    float _419 = _349;
    float _421 = _361;
    float _423 = _385;
    float _425 = _351;
    bool _427 = !_125;
    float _429 = _419;
    float _431 = _413;
    float _433 = _421;
    float _435 = _417;
    float _437 = _423;
    float _439 = _425;
    float _557;
    float _559;
    float _561;
    float _563;
    float _565;
    float _567;
    float _569;
    float _571;
    float _573;
    int _575;
    int _577;
    int _579;
    float _581;
    if (!_427)
    {
        int _441 = _101 + 28;
        uint _443 = uint(int(uint(_441) >> uint(2)));
        uint _445 = uint(int(uint(int(_443)) >> uint(2)));
        int _447 = int(_443) & 3;
        float _449 = (*spvDescriptorSet0.cp_c5)._m0[int(_445)][_447];
        int _451 = _101 + 20;
        uint _453 = uint(int(uint(_451) >> uint(2)));
        uint _455 = uint(int(uint(int(_453)) >> uint(2)));
        int _457 = int(_453) & 3;
        float _459 = (*spvDescriptorSet0.cp_c5)._m0[int(_455)][_457];
        float _461 = _207 * _449;
        float _463 = _203 * _449;
        float _465 = _237 * _449;
        float _467 = _267 * _449;
        float _469 = _235 * _449;
        float _471 = _239 * _449;
        float _473 = fma(_409, _459, _461);
        float _475 = _205 * _449;
        float _477 = fma(_411, _459, _463);
        float _479 = fma(_413, _459, _465);
        float _481 = _473 * 0.15915493667125701904296875;
        float _483 = fma(_415, _459, _475);
        float _485 = _477 * 0.15915493667125701904296875;
        float _487 = fma(_417, _459, _467);
        float _489 = _481 * 6.283185482025146484375;
        float _491 = sin(_489);
        float _493 = _483 * 0.15915493667125701904296875;
        float _495 = fma(_419, _459, _469);
        float _497 = fma(_421, _459, _471);
        float _499 = _485 * 6.283185482025146484375;
        float _501 = sin(_499);
        float _503 = _485 * 6.283185482025146484375;
        float _505 = cos(_503);
        float _507 = _481 * 6.283185482025146484375;
        float _509 = cos(_507);
        float _511 = _269 * _449;
        float _513 = _271 * _449;
        float _515 = fma(_423, _459, _511);
        float _517 = fma(_425, _459, _513);
        float _519 = _493 * 6.283185482025146484375;
        float _521 = cos(_519);
        float _523 = _491 * _505;
        float _525 = _493 * 6.283185482025146484375;
        float _527 = sin(_525);
        float _529 = _505 * _509;
        float _531 = _501 * _509;
        float _533 = _505 * _521;
        float _535 = _501 * _491;
        float _537 = _521 * _509;
        float _539 = _491 * _521;
        float _541 = _501 * _521;
        float _543 = _501 * _527;
        float _545 = -_523;
        float _547 = fma(_509, _543, _545);
        float _549 = fma(_491, _543, _529);
        float _551 = fma(_527, _529, _535);
        float _553 = -_531;
        float _555 = fma(_527, _523, _553);
        _429 = _495;
        _557 = _527;
        _559 = _537;
        _431 = _479;
        _561 = _541;
        _563 = _539;
        _565 = _547;
        _567 = _549;
        _433 = _497;
        _569 = _551;
        _571 = _555;
        _573 = _533;
        _575 = as_type<int>(_487);
        _577 = as_type<int>(_515);
        _579 = as_type<int>(_517);
        _435 = _531;
        _437 = _529;
        _581 = _543;
        _583 = true;
    }
    else
    {
        float _585 = _411 * 0.15915493667125701904296875;
        float _587 = _409 * 0.15915493667125701904296875;
        float _589 = _415 * 0.15915493667125701904296875;
        float _591 = _585 * 6.283185482025146484375;
        float _593 = cos(_591);
        float _595 = _587 * 6.283185482025146484375;
        float _597 = sin(_595);
        float _599 = _587 * 6.283185482025146484375;
        float _601 = cos(_599);
        float _603 = _589 * 6.283185482025146484375;
        float _605 = cos(_603);
        float _607 = _597 * _593;
        float _609 = _585 * 6.283185482025146484375;
        float _611 = sin(_609);
        float _613 = _593 * _601;
        float _615 = _589 * 6.283185482025146484375;
        float _617 = sin(_615);
        float _619 = _593 * _605;
        float _621 = _605 * _601;
        float _623 = _597 * _605;
        float _625 = _611 * _597;
        float _627 = _611 * _601;
        float _629 = _611 * _605;
        float _631 = _611 * _617;
        float _633 = -_607;
        float _635 = fma(_601, _631, _633);
        float _637 = fma(_597, _631, _613);
        float _639 = fma(_617, _613, _625);
        float _641 = -_627;
        float _643 = fma(_617, _607, _641);
        _557 = _617;
        _559 = _621;
        _561 = _629;
        _563 = _623;
        _565 = _635;
        _567 = _637;
        _569 = _639;
        _571 = _643;
        _573 = _619;
        _575 = as_type<int>(_417);
        _577 = as_type<int>(_423);
        _579 = as_type<int>(_425);
        _387 = _627;
        _581 = _607;
    }
    _583 = false;
    float _645 = _429;
    float _647 = _557;
    float _649 = _559;
    float _651 = _431;
    float _653 = _561;
    float _655 = _563;
    float _657 = _565;
    float _659 = _567;
    float _661 = _433;
    float _663 = _569;
    float _665 = _571;
    float _667 = _573;
    int _669 = _575;
    int _671 = _577;
    int _673 = _579;
    float _675 = _435;
    float _677 = _437;
    float _679 = _387;
    float _681 = _581;
    float _683 = _645 * _647;
    float _685 = _645 * _649;
    float _687 = _651 * _653;
    float _689 = _645 * _655;
    float _691 = _651 * _657;
    float _693 = _651 * _659;
    int _695 = _68 * 48;
    float _697 = _661 * _663;
    float _699 = _661 * _665;
    float _701 = _661 * _667;
    float _703 = -_683;
    float _705 = _703 + (-0.0);
    bool _707 = _68 != 0;
    uint _709 = uint(int(uint(_695) >> uint(2)));
    _39[int(_709)] = as_type<uint>(_685);
    int _711 = _695 + 4;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    _39[int(_713)] = as_type<uint>(_691);
    int _715 = _695 + 8;
    uint _717 = uint(int(uint(_715) >> uint(2)));
    _39[int(_717)] = as_type<uint>(_697);
    int _719 = _695 + 12;
    uint _721 = uint(int(uint(_719) >> uint(2)));
    _39[int(_721)] = uint(_669);
    int _723 = _68 * 112;
    int _725 = _695 + 16;
    int _727 = _695 + 16;
    uint _729 = uint(int(uint(_727) >> uint(2)));
    _39[int(_729)] = as_type<uint>(_689);
    int _731 = _695 + 20;
    uint _733 = uint(int(uint(_731) >> uint(2)));
    _39[int(_733)] = as_type<uint>(_693);
    int _735 = _695 + 24;
    uint _737 = uint(int(uint(_735) >> uint(2)));
    _39[int(_737)] = as_type<uint>(_699);
    int _739 = _695 + 28;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    _39[int(_741)] = uint(_671);
    int _743 = _695 + 32;
    int _745 = _695 + 32;
    uint _747 = uint(int(uint(_745) >> uint(2)));
    _39[int(_747)] = as_type<uint>(_705);
    int _749 = _695 + 36;
    uint _751 = uint(int(uint(_749) >> uint(2)));
    _39[int(_751)] = as_type<uint>(_687);
    int _753 = _695 + 40;
    uint _755 = uint(int(uint(_753) >> uint(2)));
    _39[int(_755)] = as_type<uint>(_701);
    int _757 = _695 + 44;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    _39[int(_759)] = uint(_673);
    float _761 = _651;
    float _763 = _661;
    float _765 = _645;
    float _767 = _677;
    float _769 = _679;
    float _771 = _681;
    float _773 = _675;
    float _775 = _689;
    float _777 = _693;
    float _779 = _699;
    float _781 = as_type<float>(_671);
    if (!_707)
    {
        _761 = _685;
    }
    float _783 = _761;
    float _785 = _783;
    if (!_707)
    {
        _763 = _691;
    }
    float _787 = _763;
    float _789 = _787;
    if (!_707)
    {
        _439 = _697;
    }
    float _791 = _439;
    float _793 = _791;
    if (!_707)
    {
        _765 = as_type<float>(_669);
    }
    float _795 = _765;
    float _797 = _795;
    if (!_707)
    {
        _767 = _687;
    }
    float _799 = _767;
    float _801 = _799;
    if (!_707)
    {
        _769 = _701;
    }
    float _803 = _769;
    float _805 = _803;
    if (!_707)
    {
        _771 = as_type<float>(_673);
    }
    float _807 = _771;
    float _809 = _807;
    if (!_707)
    {
        _773 = _705;
    }
    float _811 = _773;
    bool _813 = !_707;
    float _815 = _811;
    if (!_813)
    {
        bool _817 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _819 = !_817;
        if (!_819)
        {
            uint _821 = uint(int(uint(_723) >> uint(2)));
            uint _823 = uint(int(uint(int(_821)) >> uint(2)));
            int _825 = int(_821) & 3;
            float _827 = (*spvDescriptorSet0.cp_c6)._m0[int(_823)][_825];
            int _829 = as_type<int>(_827) * 48;
            int _831 = 0;
            bool _833;
            float _933;
            float _935;
            float _943;
            float _955;
            float _957;
            float _971;
            float _981;
            float _983;
            float _987;
            float _989;
            float _991;
            float _993;
            do
            {
                int _835 = _831;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _837 = uint(int(uint(_829) >> uint(2)));
                float _839 = as_type<float>(_39[int(_837)]);
                int _841 = _829 + 4;
                uint _843 = uint(int(uint(_841) >> uint(2)));
                float _845 = as_type<float>(_39[int(_843)]);
                int _847 = _829 + 8;
                uint _849 = uint(int(uint(_847) >> uint(2)));
                float _851 = as_type<float>(_39[int(_849)]);
                int _853 = _829 + 12;
                uint _855 = uint(int(uint(_853) >> uint(2)));
                float _857 = as_type<float>(_39[int(_855)]);
                int _859 = _835 + 1;
                int _861 = _829 + 16;
                uint _863 = uint(int(uint(_861) >> uint(2)));
                float _865 = as_type<float>(_39[int(_863)]);
                int _867 = _829 + 20;
                uint _869 = uint(int(uint(_867) >> uint(2)));
                float _871 = as_type<float>(_39[int(_869)]);
                int _873 = _829 + 24;
                uint _875 = uint(int(uint(_873) >> uint(2)));
                float _877 = as_type<float>(_39[int(_875)]);
                int _879 = _829 + 28;
                uint _881 = uint(int(uint(_879) >> uint(2)));
                float _883 = as_type<float>(_39[int(_881)]);
                bool _885 = uint(_859) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _887 = _829 + 32;
                uint _889 = uint(int(uint(_887) >> uint(2)));
                float _891 = as_type<float>(_39[int(_889)]);
                int _893 = _829 + 36;
                uint _895 = uint(int(uint(_893) >> uint(2)));
                float _897 = as_type<float>(_39[int(_895)]);
                int _899 = _829 + 40;
                uint _901 = uint(int(uint(_899) >> uint(2)));
                float _903 = as_type<float>(_39[int(_901)]);
                int _905 = _829 + 44;
                uint _907 = uint(int(uint(_905) >> uint(2)));
                float _909 = as_type<float>(_39[int(_907)]);
                float _911 = _845 * as_type<float>(_671);
                float _913 = _689 * _845;
                float _915 = _693 * _845;
                float _917 = _699 * _845;
                float _919 = fma(_839, as_type<float>(_669), _911);
                float _921 = fma(_685, _839, _913);
                float _923 = fma(_691, _839, _915);
                float _925 = fma(_697, _839, _917);
                float _927 = fma(_851, as_type<float>(_673), _919);
                float _929 = _871 * as_type<float>(_671);
                float _931 = -_683;
                _933 = fma(_931, _851, _921);
                _935 = fma(_687, _851, _923);
                float _937 = _689 * _871;
                float _939 = _693 * _871;
                float _941 = fma(_865, as_type<float>(_669), _929);
                _943 = _857 + _927;
                float _945 = fma(_685, _865, _937);
                float _947 = fma(_691, _865, _939);
                float _949 = fma(_877, as_type<float>(_673), _941);
                float _951 = _897 * as_type<float>(_671);
                float _953 = -_683;
                _955 = fma(_953, _877, _945);
                _957 = fma(_687, _877, _947);
                float _959 = _699 * _871;
                float _961 = _689 * _897;
                float _963 = _693 * _897;
                float _965 = _699 * _897;
                float _967 = fma(_891, as_type<float>(_669), _951);
                float _969 = fma(_697, _865, _959);
                _971 = _883 + _949;
                float _973 = fma(_685, _891, _961);
                float _975 = fma(_691, _891, _963);
                float _977 = fma(_697, _891, _965);
                float _979 = fma(_903, as_type<float>(_673), _967);
                _981 = fma(_701, _877, _969);
                _983 = fma(_701, _851, _925);
                float _985 = -_683;
                _987 = fma(_985, _903, _973);
                _989 = fma(_687, _903, _975);
                _991 = fma(_701, _903, _977);
                _993 = _909 + _979;
                uint _995 = uint(int(uint(_695) >> uint(2)));
                _39[int(_995)] = as_type<uint>(_933);
                int _997 = _695 + 4;
                uint _999 = uint(int(uint(_997) >> uint(2)));
                _39[int(_999)] = as_type<uint>(_935);
                int _1001 = _695 + 8;
                uint _1003 = uint(int(uint(_1001) >> uint(2)));
                _39[int(_1003)] = as_type<uint>(_983);
                int _1005 = _695 + 12;
                uint _1007 = uint(int(uint(_1005) >> uint(2)));
                _39[int(_1007)] = as_type<uint>(_943);
                int _1009 = _695 + 16;
                uint _1011 = uint(int(uint(_1009) >> uint(2)));
                _39[int(_1011)] = as_type<uint>(_955);
                int _1013 = _695 + 20;
                uint _1015 = uint(int(uint(_1013) >> uint(2)));
                _39[int(_1015)] = as_type<uint>(_957);
                int _1017 = _695 + 24;
                uint _1019 = uint(int(uint(_1017) >> uint(2)));
                _39[int(_1019)] = as_type<uint>(_981);
                int _1021 = _695 + 28;
                uint _1023 = uint(int(uint(_1021) >> uint(2)));
                _39[int(_1023)] = as_type<uint>(_971);
                int _1025 = _695 + 32;
                uint _1027 = uint(int(uint(_1025) >> uint(2)));
                _39[int(_1027)] = as_type<uint>(_987);
                int _1029 = _695 + 36;
                uint _1031 = uint(int(uint(_1029) >> uint(2)));
                _39[int(_1031)] = as_type<uint>(_989);
                int _1033 = _695 + 40;
                uint _1035 = uint(int(uint(_1033) >> uint(2)));
                _39[int(_1035)] = as_type<uint>(_991);
                int _1037 = _695 + 44;
                uint _1039 = uint(int(uint(_1037) >> uint(2)));
                _39[int(_1039)] = as_type<uint>(_993);
                _833 = !_885;
                _831 = _859;
            } while (_833);
            _785 = _933;
            _789 = _935;
            _793 = _983;
            _797 = _943;
            _775 = _955;
            _777 = _957;
            _779 = _981;
            _781 = _971;
            _815 = _987;
            _801 = _989;
            _805 = _991;
            _809 = _993;
            _1041 = true;
        }
        else
        {
            _785 = 0.0;
            _789 = 0.0;
            _793 = 0.0;
            _797 = 0.0;
            _775 = 0.0;
            _777 = 0.0;
            _779 = 0.0;
            _781 = 0.0;
            _815 = 0.0;
            _801 = 0.0;
            _805 = 0.0;
            _809 = 0.0;
        }
    }
    _1041 = false;
    float _1043 = _785;
    float _1045 = _789;
    float _1047 = _793;
    float _1049 = _797;
    float _1051 = _775;
    float _1053 = _777;
    float _1055 = _779;
    float _1057 = _781;
    float _1059 = _815;
    float _1061 = _801;
    float _1063 = _805;
    float _1065 = _809;
    int _1067 = _723 + 80;
    uint _1069 = uint(int(uint(_1067) >> uint(2)));
    uint _1071 = uint(int(uint(int(_1069)) >> uint(2)));
    int _1073 = int(_1069) & 3;
    float _1075 = (*spvDescriptorSet0.cp_c6)._m0[int(_1071)][_1073];
    int _1077 = int(_1069) + 1;
    uint _1079 = uint(int(uint(_1077) >> uint(2)));
    int _1081 = _1077 & 3;
    float _1083 = (*spvDescriptorSet0.cp_c6)._m0[int(_1079)][_1081];
    bool _1085 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1087 = _723 + 64;
    uint _1089 = uint(int(uint(_1087) >> uint(2)));
    uint _1091 = uint(int(uint(int(_1089)) >> uint(2)));
    int _1093 = int(_1089) & 3;
    float _1095 = (*spvDescriptorSet0.cp_c6)._m0[int(_1091)][_1093];
    int _1097 = int(_1089) + 1;
    uint _1099 = uint(int(uint(_1097) >> uint(2)));
    int _1101 = _1097 & 3;
    float _1103 = (*spvDescriptorSet0.cp_c6)._m0[int(_1099)][_1101];
    int _1105 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1107 = _1105 + _68;
    int _1109 = _723 + 88;
    uint _1111 = uint(int(uint(_1109) >> uint(2)));
    uint _1113 = uint(int(uint(int(_1111)) >> uint(2)));
    int _1115 = int(_1111) & 3;
    float _1117 = (*spvDescriptorSet0.cp_c6)._m0[int(_1113)][_1115];
    int _1119 = int(_1111) + 1;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    int _1123 = _1119 & 3;
    float _1125 = (*spvDescriptorSet0.cp_c6)._m0[int(_1121)][_1123];
    int _1127 = _723 + 72;
    uint _1129 = uint(int(uint(_1127) >> uint(2)));
    uint _1131 = uint(int(uint(int(_1129)) >> uint(2)));
    int _1133 = int(_1129) & 3;
    float _1135 = (*spvDescriptorSet0.cp_c6)._m0[int(_1131)][_1133];
    int _1137 = int(_1129) + 1;
    uint _1139 = uint(int(uint(_1137) >> uint(2)));
    int _1141 = _1137 & 3;
    float _1143 = (*spvDescriptorSet0.cp_c6)._m0[int(_1139)][_1141];
    int _1145 = _723 + 96;
    uint _1147 = uint(int(uint(_1145) >> uint(2)));
    uint _1149 = uint(int(uint(int(_1147)) >> uint(2)));
    int _1151 = int(_1147) & 3;
    float _1153 = (*spvDescriptorSet0.cp_c6)._m0[int(_1149)][_1151];
    int _1155 = int(_1147) + 1;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    int _1159 = _1155 & 3;
    float _1161 = (*spvDescriptorSet0.cp_c6)._m0[int(_1157)][_1159];
    int _1163 = _723 + 104;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    uint _1167 = uint(int(uint(int(_1165)) >> uint(2)));
    int _1169 = int(_1165) & 3;
    float _1171 = (*spvDescriptorSet0.cp_c6)._m0[int(_1167)][_1169];
    int _1173 = int(_1165) + 1;
    uint _1175 = uint(int(uint(_1173) >> uint(2)));
    int _1177 = _1173 & 3;
    float _1179 = (*spvDescriptorSet0.cp_c6)._m0[int(_1175)][_1177];
    int _1181 = _723 + 16;
    uint _1183 = uint(int(uint(_1181) >> uint(2)));
    uint _1185 = uint(int(uint(int(_1183)) >> uint(2)));
    int _1187 = int(_1183) & 3;
    float _1189 = (*spvDescriptorSet0.cp_c6)._m0[int(_1185)][_1187];
    int _1191 = int(_1183) + 1;
    uint _1193 = uint(int(uint(_1191) >> uint(2)));
    int _1195 = _1191 & 3;
    float _1197 = (*spvDescriptorSet0.cp_c6)._m0[int(_1193)][_1195];
    if (!_1085)
    {
        uint _1199 = uint(int(uint(_695) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1199)] = as_type<uint>(_1043);
        int _1201 = _695 + 4;
        uint _1203 = uint(int(uint(_1201) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1203)] = as_type<uint>(_1045);
        int _1205 = _695 + 8;
        uint _1207 = uint(int(uint(_1205) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1207)] = as_type<uint>(_1047);
        int _1209 = _695 + 12;
        uint _1211 = uint(int(uint(_1209) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1211)] = as_type<uint>(_1049);
        uint _1213 = uint(int(uint(_725) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1213)] = as_type<uint>(_1051);
        int _1215 = _725 + 4;
        uint _1217 = uint(int(uint(_1215) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1217)] = as_type<uint>(_1053);
        int _1219 = _725 + 8;
        uint _1221 = uint(int(uint(_1219) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1221)] = as_type<uint>(_1055);
        int _1223 = _725 + 12;
        uint _1225 = uint(int(uint(_1223) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1225)] = as_type<uint>(_1057);
        uint _1227 = uint(int(uint(_743) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1227)] = as_type<uint>(_1059);
        int _1229 = _743 + 4;
        uint _1231 = uint(int(uint(_1229) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1231)] = as_type<uint>(_1061);
        int _1233 = _743 + 8;
        uint _1235 = uint(int(uint(_1233) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1235)] = as_type<uint>(_1063);
        int _1237 = _743 + 12;
        uint _1239 = uint(int(uint(_1237) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1239)] = as_type<uint>(_1065);
    }
    float _1241 = _1053 * _1075;
    float _1243 = _1061 * _1075;
    int _1245 = _723 + 32;
    uint _1247 = uint(int(uint(_1245) >> uint(2)));
    uint _1249 = uint(int(uint(int(_1247)) >> uint(2)));
    int _1251 = int(_1247) & 3;
    float _1253 = (*spvDescriptorSet0.cp_c6)._m0[int(_1249)][_1251];
    int _1255 = int(_1247) + 1;
    uint _1257 = uint(int(uint(_1255) >> uint(2)));
    int _1259 = _1255 & 3;
    float _1261 = (*spvDescriptorSet0.cp_c6)._m0[int(_1257)][_1259];
    float _1263 = _1045 * _1075;
    float _1265 = fma(_1051, _1095, _1241);
    float _1267 = fma(_1059, _1095, _1243);
    float _1269 = _1045 * _1083;
    float _1271 = _1053 * _1083;
    float _1273 = _1061 * _1083;
    float _1275 = _1045 * _1125;
    int _1277 = _723 + 48;
    uint _1279 = uint(int(uint(_1277) >> uint(2)));
    uint _1281 = uint(int(uint(int(_1279)) >> uint(2)));
    int _1283 = int(_1279) & 3;
    float _1285 = (*spvDescriptorSet0.cp_c6)._m0[int(_1281)][_1283];
    int _1287 = int(_1279) + 1;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    int _1291 = _1287 & 3;
    float _1293 = (*spvDescriptorSet0.cp_c6)._m0[int(_1289)][_1291];
    float _1295 = fma(_1043, _1103, _1269);
    float _1297 = fma(_1051, _1103, _1271);
    float _1299 = fma(_1059, _1103, _1273);
    float _1301 = _1045 * _1117;
    float _1303 = _1061 * _1117;
    float _1305 = _1053 * _1117;
    float _1307 = _1053 * _1125;
    float _1309 = _1061 * _1125;
    float _1311 = fma(_1043, _1095, _1263);
    int _1313 = _723 + 24;
    uint _1315 = uint(int(uint(_1313) >> uint(2)));
    uint _1317 = uint(int(uint(int(_1315)) >> uint(2)));
    int _1319 = int(_1315) & 3;
    float _1321 = (*spvDescriptorSet0.cp_c6)._m0[int(_1317)][_1319];
    int _1323 = int(_1315) + 1;
    uint _1325 = uint(int(uint(_1323) >> uint(2)));
    int _1327 = _1323 & 3;
    float _1329 = (*spvDescriptorSet0.cp_c6)._m0[int(_1325)][_1327];
    float _1331 = fma(_1043, _1135, _1301);
    float _1333 = fma(_1043, _1143, _1275);
    float _1335 = fma(_1051, _1135, _1305);
    float _1337 = fma(_1051, _1143, _1307);
    float _1339 = fma(_1059, _1135, _1303);
    float _1341 = fma(_1059, _1143, _1309);
    float _1343 = fma(_1047, _1161, _1295);
    int _1345 = _723 + 40;
    uint _1347 = uint(int(uint(_1345) >> uint(2)));
    uint _1349 = uint(int(uint(int(_1347)) >> uint(2)));
    int _1351 = int(_1347) & 3;
    float _1353 = (*spvDescriptorSet0.cp_c6)._m0[int(_1349)][_1351];
    int _1355 = int(_1347) + 1;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    int _1359 = _1355 & 3;
    float _1361 = (*spvDescriptorSet0.cp_c6)._m0[int(_1357)][_1359];
    float _1363 = fma(_1055, _1179, _1337);
    float _1365 = fma(_1055, _1153, _1265);
    float _1367 = fma(_1055, _1161, _1297);
    float _1369 = fma(_1047, _1179, _1333);
    float _1371 = fma(_1055, _1171, _1335);
    float _1373 = _1363 + _1057;
    float _1375 = fma(_1063, _1179, _1341);
    int _1377 = _723 + 56;
    uint _1379 = uint(int(uint(_1377) >> uint(2)));
    uint _1381 = uint(int(uint(int(_1379)) >> uint(2)));
    int _1383 = int(_1379) & 3;
    float _1385 = (*spvDescriptorSet0.cp_c6)._m0[int(_1381)][_1383];
    int _1387 = int(_1379) + 1;
    uint _1389 = uint(int(uint(_1387) >> uint(2)));
    int _1391 = _1387 & 3;
    float _1393 = (*spvDescriptorSet0.cp_c6)._m0[int(_1389)][_1391];
    float _1395 = _1369 + _1049;
    float _1397 = _1373 * _1197;
    float _1399 = fma(_1063, _1153, _1267);
    float _1401 = fma(_1063, _1161, _1299);
    float _1403 = fma(_1063, _1171, _1339);
    float _1405 = _1375 + _1065;
    float _1407 = _1367 * _1197;
    float _1409 = fma(_1047, _1153, _1311);
    float _1411 = fma(_1047, _1171, _1331);
    float _1413 = _1365 * _1197;
    float _1415 = _1371 * _1197;
    float _1417 = fma(_1395, _1189, _1397);
    int _1419 = _1107 * 48;
    float _1421 = _1373 * _1261;
    float _1423 = _1367 * _1261;
    float _1425 = _1365 * _1261;
    float _1427 = _1371 * _1261;
    float _1429 = fma(_1395, _1253, _1421);
    float _1431 = fma(_1409, _1189, _1413);
    float _1433 = fma(_1343, _1189, _1407);
    float _1435 = fma(_1411, _1189, _1415);
    float _1437 = _1373 * _1293;
    float _1439 = _1367 * _1293;
    float _1441 = _1365 * _1293;
    float _1443 = _1371 * _1293;
    float _1445 = fma(_1395, _1285, _1437);
    float _1447 = fma(_1343, _1285, _1439);
    float _1449 = fma(_1409, _1253, _1425);
    float _1451 = fma(_1343, _1253, _1423);
    float _1453 = fma(_1411, _1253, _1427);
    float _1455 = fma(_1409, _1285, _1441);
    float _1457 = fma(_1405, _1321, _1417);
    float _1459 = fma(_1411, _1285, _1443);
    float _1461 = fma(_1399, _1321, _1431);
    float _1463 = fma(_1401, _1321, _1433);
    float _1465 = fma(_1403, _1321, _1435);
    float _1467 = _1457 + _1329;
    int _1469 = _1419 + 32;
    float _1471 = fma(_1405, _1353, _1429);
    float _1473 = fma(_1399, _1353, _1449);
    float _1475 = fma(_1401, _1353, _1451);
    float _1477 = fma(_1403, _1353, _1453);
    float _1479 = _1471 + _1361;
    float _1481 = fma(_1405, _1385, _1445);
    float _1483 = fma(_1401, _1385, _1447);
    int _1485 = _1419 + 16;
    float _1487 = fma(_1399, _1385, _1455);
    float _1489 = fma(_1403, _1385, _1459);
    float _1491 = _1481 + _1393;
    int _1493 = _1419 + 48;
    uint _1495 = uint(int(uint(_1485) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1495)] = as_type<uint>(_1461);
    int _1497 = _1485 + 4;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1499)] = as_type<uint>(_1463);
    int _1501 = _1485 + 8;
    uint _1503 = uint(int(uint(_1501) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1503)] = as_type<uint>(_1465);
    int _1505 = _1485 + 12;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1507)] = as_type<uint>(_1467);
    uint _1509 = uint(int(uint(_1469) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1509)] = as_type<uint>(_1473);
    int _1511 = _1469 + 4;
    uint _1513 = uint(int(uint(_1511) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1513)] = as_type<uint>(_1475);
    int _1515 = _1469 + 8;
    uint _1517 = uint(int(uint(_1515) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1517)] = as_type<uint>(_1477);
    int _1519 = _1469 + 12;
    uint _1521 = uint(int(uint(_1519) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1521)] = as_type<uint>(_1479);
    uint _1523 = uint(int(uint(_1493) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1523)] = as_type<uint>(_1487);
    int _1525 = _1493 + 4;
    uint _1527 = uint(int(uint(_1525) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1527)] = as_type<uint>(_1483);
    int _1529 = _1493 + 8;
    uint _1531 = uint(int(uint(_1529) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1531)] = as_type<uint>(_1489);
    int _1533 = _1493 + 12;
    uint _1535 = uint(int(uint(_1533) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1535)] = as_type<uint>(_1491);
}

