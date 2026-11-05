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
int _58(thread const int& _3902, thread const int& _3903, constant _10& support_buffer)
{
    int _3906 = 1 + _3903;
    float _3908 = support_buffer._m5[_3906].x;
    bool _3910 = _3908 == 1.0;
    if (_3910)
    {
        return _3902;
    }
    float _3912 = float(_3902);
    float _3914 = _3912 * _3908;
    int _3916 = int(_3914);
    return _3916;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1095 = false;
    bool _581 = false;
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
    float _133 = _111;
    float _135 = _99;
    float _137 = _121;
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
    float _171 = 0.0;
    if (_129)
    {
        _171 = 1.4012984643248170709237295832899e-45;
    }
    float _173 = _171;
    float _175 = _153;
    float _177 = as_type<float>(_68);
    float _179 = 0.0;
    float _181 = as_type<float>(_149);
    if (_125)
    {
        int _183 = _68;
        int _185 = 0;
        int _187 = _58(_183, _185, (*spvDescriptorSet0.support_buffer));
        int _189 = _149;
        int _191 = 0;
        int _193 = _58(_189, _191, (*spvDescriptorSet0.support_buffer));
        int3 _1750 = int3(_187, _193, as_type<int>(_153));
        float3 _197 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1750.xy), uint(_1750.z), 0).xyz;
        float _199 = _197.x;
        float _201 = _197.y;
        float _203 = _197.z;
        _175 = _199;
        _177 = _201;
        _179 = _203;
    }
    float _205 = _175;
    float _207 = _177;
    float _209 = _179;
    float _211 = 0.0;
    float _213 = as_type<float>(_68);
    float _215 = 0.0;
    if (_125)
    {
        int _217 = _68;
        int _219 = 0;
        int _221 = _58(_217, _219, (*spvDescriptorSet0.support_buffer));
        int _223 = _149;
        int _225 = 0;
        int _227 = _58(_223, _225, (*spvDescriptorSet0.support_buffer));
        int3 _1778 = int3(_221, _227, 0);
        float3 _229 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1778.xy), uint(_1778.z), 0).xyz;
        float _231 = _229.x;
        float _233 = _229.y;
        float _235 = _229.z;
        _211 = _231;
        _213 = _233;
        _215 = _235;
    }
    float _237 = _211;
    float _239 = _213;
    float _241 = _215;
    float _243 = 0.0;
    float _245 = 0.0;
    float _247 = _157;
    if (_125)
    {
        int _249 = _68;
        int _251 = 0;
        int _253 = _58(_249, _251, (*spvDescriptorSet0.support_buffer));
        int _255 = _149;
        int _257 = 0;
        int _259 = _58(_255, _257, (*spvDescriptorSet0.support_buffer));
        int3 _1807 = int3(_253, _259, as_type<int>(_157));
        float3 _261 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1807.xy), uint(_1807.z), 0).xyz;
        float _263 = _261.x;
        float _265 = _261.y;
        float _267 = _261.z;
        _243 = _263;
        _245 = _265;
        _247 = _267;
    }
    float _269 = _243;
    float _271 = _245;
    float _273 = _247;
    float _275 = 0.0;
    float _277 = as_type<float>(_68);
    float _279 = 0.0;
    if (_129)
    {
        int _281 = _68;
        int _283 = 1;
        int _285 = _58(_281, _283, (*spvDescriptorSet0.support_buffer));
        int _287 = _169;
        int _289 = 1;
        int _291 = _58(_287, _289, (*spvDescriptorSet0.support_buffer));
        int3 _1835 = int3(_285, _291, 0);
        float3 _293 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1835.xy), uint(_1835.z), 0).xyz;
        float _295 = _293.x;
        float _297 = _293.y;
        float _299 = _293.z;
        _275 = _295;
        _277 = _297;
        _279 = _299;
    }
    float _301 = _275;
    float _303 = _277;
    float _305 = _279;
    float _307 = 0.0;
    float _309 = 0.0;
    float _311 = _173;
    if (_129)
    {
        int _313 = _68;
        int _315 = 1;
        int _317 = _58(_313, _315, (*spvDescriptorSet0.support_buffer));
        int _319 = _169;
        int _321 = 1;
        int _323 = _58(_319, _321, (*spvDescriptorSet0.support_buffer));
        int3 _1864 = int3(_317, _323, as_type<int>(_173));
        float3 _325 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1864.xy), uint(_1864.z), 0).xyz;
        float _327 = _325.x;
        float _329 = _325.y;
        float _331 = _325.z;
        _307 = _327;
        _309 = _329;
        _311 = _331;
    }
    float _333 = _307;
    float _335 = _309;
    float _337 = _311;
    float _339 = 0.0;
    if (!_129)
    {
        _339 = 0.0;
    }
    float _341 = _339;
    float _343 = 0.0;
    float _345 = _341;
    if (!_129)
    {
        _343 = 0.0;
        _133 = 0.0;
    }
    float _347 = _343;
    float _349 = _133;
    float _351 = 0.0;
    float _353 = _347;
    float _355 = _349;
    if (!_129)
    {
        _351 = 0.0;
    }
    float _357 = _351;
    float _359 = _357;
    if (!_129)
    {
        _135 = 0.0;
        _137 = 0.0;
    }
    float _361 = _135;
    float _363 = _137;
    float _365 = 0.0;
    float _367 = _361;
    float _369 = _363;
    if (!_129)
    {
        _365 = 0.0;
    }
    float _371 = _365;
    float _373 = 0.0;
    float _375 = _371;
    if (!_129)
    {
        _373 = 0.0;
        _181 = 0.0;
    }
    float _377 = _373;
    float _379 = _181;
    bool _381 = !_129;
    float _383 = _377;
    float _385 = _379;
    float _387 = _205;
    if (!_381)
    {
        int _389 = _68;
        int _391 = 1;
        int _393 = _58(_389, _391, (*spvDescriptorSet0.support_buffer));
        int _395 = _169;
        int _397 = 1;
        int _399 = _58(_395, _397, (*spvDescriptorSet0.support_buffer));
        int3 _1936 = int3(_393, _399, 2);
        float3 _401 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1936.xy), uint(_1936.z), 0).xyz;
        float _403 = _401.x;
        float _405 = _401.y;
        float _407 = _401.z;
        _353 = _333;
        _355 = _303;
        _345 = _301;
        _359 = _305;
        _375 = _407;
        _367 = _337;
        _369 = _335;
        _383 = _403;
        _385 = _405;
    }
    float _409 = _353;
    float _411 = _355;
    float _413 = _345;
    float _415 = _359;
    float _417 = _375;
    float _419 = _367;
    float _421 = _369;
    float _423 = _383;
    float _425 = _385;
    bool _427 = !_125;
    float _429 = _413;
    float _431 = _415;
    float _433 = _417;
    float _435 = _425;
    float _437 = _423;
    float _555;
    float _557;
    float _559;
    float _561;
    float _563;
    float _565;
    float _567;
    float _569;
    float _571;
    float _573;
    float _575;
    float _577;
    float _579;
    if (!_427)
    {
        int _439 = _101 + 28;
        uint _441 = uint(int(uint(_439) >> uint(2)));
        uint _443 = uint(int(uint(int(_441)) >> uint(2)));
        int _445 = int(_441) & 3;
        float _447 = (*spvDescriptorSet0.cp_c5)._m0[int(_443)][_445];
        int _449 = _101 + 20;
        uint _451 = uint(int(uint(_449) >> uint(2)));
        uint _453 = uint(int(uint(int(_451)) >> uint(2)));
        int _455 = int(_451) & 3;
        float _457 = (*spvDescriptorSet0.cp_c5)._m0[int(_453)][_455];
        float _459 = _205 * _447;
        float _461 = _271 * _447;
        float _463 = _239 * _447;
        float _465 = _237 * _447;
        float _467 = _241 * _447;
        float _469 = _273 * _447;
        float _471 = fma(_409, _457, _459);
        float _473 = fma(_411, _457, _463);
        float _475 = fma(_413, _457, _465);
        float _477 = fma(_415, _457, _467);
        float _479 = _471 * 0.15915493667125701904296875;
        float _481 = _209 * _447;
        float _483 = fma(_417, _457, _469);
        float _485 = _479 * 6.283185482025146484375;
        float _487 = sin(_485);
        float _489 = fma(_419, _457, _481);
        float _491 = _207 * _447;
        float _493 = _489 * 0.15915493667125701904296875;
        float _495 = fma(_421, _457, _491);
        float _497 = _269 * _447;
        float _499 = _479 * 6.283185482025146484375;
        float _501 = cos(_499);
        float _503 = _495 * 0.15915493667125701904296875;
        float _505 = fma(_423, _457, _497);
        float _507 = _493 * 6.283185482025146484375;
        float _509 = sin(_507);
        float _511 = fma(_425, _457, _461);
        float _513 = _493 * 6.283185482025146484375;
        float _515 = cos(_513);
        float _517 = _503 * 6.283185482025146484375;
        float _519 = cos(_517);
        float _521 = _509 * _501;
        float _523 = _487 * _509;
        float _525 = _503 * 6.283185482025146484375;
        float _527 = sin(_525);
        float _529 = _501 * _515;
        float _531 = _501 * _519;
        float _533 = _519 * _515;
        float _535 = _509 * _519;
        float _537 = _487 * _519;
        float _539 = _487 * _515;
        float _541 = _487 * _527;
        float _543 = -_539;
        float _545 = fma(_527, _521, _543);
        float _547 = -_521;
        float _549 = fma(_515, _541, _547);
        float _551 = fma(_509, _541, _529);
        float _553 = fma(_527, _529, _523);
        _429 = _475;
        _555 = _527;
        _557 = _533;
        _559 = _535;
        _561 = _473;
        _563 = _549;
        _565 = _551;
        _567 = _537;
        _431 = _477;
        _569 = _553;
        _571 = _545;
        _573 = _531;
        _575 = _505;
        _577 = _511;
        _433 = _483;
        _579 = _467;
        _435 = _529;
        _581 = true;
    }
    else
    {
        float _583 = _409 * 0.15915493667125701904296875;
        float _585 = _419 * 0.15915493667125701904296875;
        float _587 = _421 * 0.15915493667125701904296875;
        float _589 = _583 * 6.283185482025146484375;
        float _591 = cos(_589);
        float _593 = _585 * 6.283185482025146484375;
        float _595 = sin(_593);
        float _597 = _585 * 6.283185482025146484375;
        float _599 = cos(_597);
        float _601 = _587 * 6.283185482025146484375;
        float _603 = cos(_601);
        float _605 = _595 * _591;
        float _607 = _583 * 6.283185482025146484375;
        float _609 = sin(_607);
        float _611 = _591 * _599;
        float _613 = _587 * 6.283185482025146484375;
        float _615 = sin(_613);
        float _617 = _591 * _603;
        float _619 = _603 * _599;
        float _621 = _595 * _603;
        float _623 = _609 * _603;
        float _625 = _609 * _595;
        float _627 = _609 * _599;
        float _629 = _609 * _615;
        float _631 = -_627;
        float _633 = fma(_615, _605, _631);
        float _635 = -_605;
        float _637 = fma(_599, _629, _635);
        float _639 = fma(_595, _629, _611);
        float _641 = fma(_615, _611, _625);
        _555 = _615;
        _557 = _619;
        _559 = _621;
        _561 = _411;
        _563 = _637;
        _565 = _639;
        _567 = _623;
        _569 = _641;
        _571 = _633;
        _573 = _617;
        _575 = _423;
        _577 = _425;
        _579 = _585;
    }
    _581 = false;
    float _643 = _429;
    float _645 = _555;
    float _647 = _557;
    float _649 = _559;
    float _651 = _561;
    float _653 = _563;
    float _655 = _565;
    float _657 = _567;
    float _659 = _431;
    float _661 = _569;
    float _663 = _571;
    float _665 = _573;
    float _667 = _575;
    float _669 = _577;
    float _671 = _433;
    float _673 = _579;
    float _675 = _435;
    float _677 = _643 * _645;
    float _679 = _643 * _647;
    float _681 = _643 * _649;
    bool _683 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _685 = _651 * _653;
    bool _687 = _68 != 0;
    float _689 = _651 * _655;
    float _691 = _651 * _657;
    int _693 = _68 * 48;
    float _695 = _659 * _661;
    float _697 = _659 * _663;
    float _699 = -_677;
    float _701 = _699 + (-0.0);
    float _703 = _659 * _665;
    float _705 = _651;
    float _707 = _659;
    float _709 = (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _711 = _675;
    float _713 = _643;
    float _715 = _673;
    float _717 = _691;
    float _719 = _703;
    float _721 = _671;
    if (!_683)
    {
        int _723 = _68 * 48;
        float _725 = -_677;
        float _727 = _725 + (-0.0);
        int _729 = _723 + 16;
        uint _731 = uint(int(uint(_723) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_731)] = as_type<uint>(_679);
        int _733 = _723 + 4;
        uint _735 = uint(int(uint(_733) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_735)] = as_type<uint>(_685);
        int _737 = _723 + 8;
        uint _739 = uint(int(uint(_737) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_739)] = as_type<uint>(_695);
        int _741 = _723 + 12;
        uint _743 = uint(int(uint(_741) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_743)] = as_type<uint>(_667);
        int _745 = _723 + 32;
        uint _747 = uint(int(uint(_729) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_747)] = as_type<uint>(_681);
        int _749 = _729 + 4;
        uint _751 = uint(int(uint(_749) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_751)] = as_type<uint>(_689);
        int _753 = _729 + 8;
        uint _755 = uint(int(uint(_753) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_755)] = as_type<uint>(_697);
        int _757 = _729 + 12;
        uint _759 = uint(int(uint(_757) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_759)] = as_type<uint>(_669);
        uint _761 = uint(int(uint(_745) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_761)] = as_type<uint>(_727);
        int _763 = _745 + 4;
        uint _765 = uint(int(uint(_763) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_765)] = as_type<uint>(_691);
        int _767 = _745 + 8;
        uint _769 = uint(int(uint(_767) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_769)] = as_type<uint>(_703);
        int _771 = _745 + 12;
        uint _773 = uint(int(uint(_771) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_773)] = as_type<uint>(_671);
        _705 = as_type<float>(_723);
        _707 = as_type<float>(_745);
        _709 = as_type<float>(_729);
    }
    float _775 = _705;
    float _777 = _707;
    float _779 = _709;
    uint _781 = uint(int(uint(_693) >> uint(2)));
    _39[int(_781)] = as_type<uint>(_679);
    int _783 = _693 + 4;
    uint _785 = uint(int(uint(_783) >> uint(2)));
    _39[int(_785)] = as_type<uint>(_685);
    int _787 = _693 + 8;
    uint _789 = uint(int(uint(_787) >> uint(2)));
    _39[int(_789)] = as_type<uint>(_695);
    int _791 = _693 + 12;
    uint _793 = uint(int(uint(_791) >> uint(2)));
    _39[int(_793)] = as_type<uint>(_667);
    int _795 = _68 * 112;
    int _797 = _693 + 16;
    uint _799 = uint(int(uint(_797) >> uint(2)));
    _39[int(_799)] = as_type<uint>(_681);
    int _801 = _693 + 20;
    uint _803 = uint(int(uint(_801) >> uint(2)));
    _39[int(_803)] = as_type<uint>(_689);
    int _805 = _693 + 24;
    uint _807 = uint(int(uint(_805) >> uint(2)));
    _39[int(_807)] = as_type<uint>(_697);
    int _809 = _693 + 28;
    uint _811 = uint(int(uint(_809) >> uint(2)));
    _39[int(_811)] = as_type<uint>(_669);
    float _813 = _777;
    float _815 = _779;
    float _817 = _775;
    if (!_687)
    {
        _387 = _679;
    }
    float _819 = _387;
    float _821 = _819;
    if (!_687)
    {
        _711 = _685;
    }
    float _823 = _711;
    int _825 = _693 + 32;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    _39[int(_827)] = as_type<uint>(_701);
    int _829 = _693 + 36;
    uint _831 = uint(int(uint(_829) >> uint(2)));
    _39[int(_831)] = as_type<uint>(_691);
    int _833 = _693 + 40;
    uint _835 = uint(int(uint(_833) >> uint(2)));
    _39[int(_835)] = as_type<uint>(_703);
    int _837 = _693 + 44;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    _39[int(_839)] = as_type<uint>(_671);
    float _841 = _823;
    if (!_687)
    {
        _437 = _695;
    }
    float _843 = _437;
    float _845 = _843;
    if (!_687)
    {
        _713 = _667;
    }
    float _847 = _713;
    float _849 = _847;
    if (!_687)
    {
        _715 = _681;
    }
    float _851 = _715;
    float _853 = _851;
    if (!_687)
    {
        _813 = _689;
    }
    float _855 = _813;
    float _857 = _855;
    if (!_687)
    {
        _815 = _697;
    }
    float _859 = _815;
    float _861 = _859;
    if (!_687)
    {
        _817 = _669;
    }
    float _863 = _817;
    float _865 = _863;
    bool _867 = !_687;
    float _869 = _701;
    if (!_867)
    {
        bool _871 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _873 = !_871;
        if (!_873)
        {
            uint _875 = uint(int(uint(_795) >> uint(2)));
            uint _877 = uint(int(uint(int(_875)) >> uint(2)));
            int _879 = int(_875) & 3;
            float _881 = (*spvDescriptorSet0.cp_c6)._m0[int(_877)][_879];
            int _883 = as_type<int>(_881) * 48;
            int _885 = 0;
            bool _887;
            float _985;
            float _987;
            float _989;
            float _997;
            float _1013;
            float _1015;
            float _1027;
            float _1037;
            float _1041;
            float _1043;
            float _1045;
            float _1047;
            do
            {
                int _889 = _885;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _891 = uint(int(uint(_883) >> uint(2)));
                float _893 = as_type<float>(_39[int(_891)]);
                int _895 = _883 + 4;
                uint _897 = uint(int(uint(_895) >> uint(2)));
                float _899 = as_type<float>(_39[int(_897)]);
                int _901 = _883 + 8;
                uint _903 = uint(int(uint(_901) >> uint(2)));
                float _905 = as_type<float>(_39[int(_903)]);
                int _907 = _883 + 12;
                uint _909 = uint(int(uint(_907) >> uint(2)));
                float _911 = as_type<float>(_39[int(_909)]);
                int _913 = _889 + 1;
                int _915 = _883 + 16;
                uint _917 = uint(int(uint(_915) >> uint(2)));
                float _919 = as_type<float>(_39[int(_917)]);
                int _921 = _883 + 20;
                uint _923 = uint(int(uint(_921) >> uint(2)));
                float _925 = as_type<float>(_39[int(_923)]);
                int _927 = _883 + 24;
                uint _929 = uint(int(uint(_927) >> uint(2)));
                float _931 = as_type<float>(_39[int(_929)]);
                int _933 = _883 + 28;
                uint _935 = uint(int(uint(_933) >> uint(2)));
                float _937 = as_type<float>(_39[int(_935)]);
                bool _939 = uint(_913) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _941 = _883 + 32;
                uint _943 = uint(int(uint(_941) >> uint(2)));
                float _945 = as_type<float>(_39[int(_943)]);
                int _947 = _883 + 36;
                uint _949 = uint(int(uint(_947) >> uint(2)));
                float _951 = as_type<float>(_39[int(_949)]);
                int _953 = _883 + 40;
                uint _955 = uint(int(uint(_953) >> uint(2)));
                float _957 = as_type<float>(_39[int(_955)]);
                int _959 = _883 + 44;
                uint _961 = uint(int(uint(_959) >> uint(2)));
                float _963 = as_type<float>(_39[int(_961)]);
                float _965 = _899 * _669;
                float _967 = _681 * _899;
                float _969 = _689 * _899;
                float _971 = _697 * _899;
                float _973 = fma(_893, _667, _965);
                float _975 = fma(_679, _893, _967);
                float _977 = fma(_685, _893, _969);
                float _979 = fma(_695, _893, _971);
                float _981 = fma(_905, _671, _973);
                float _983 = -_677;
                _985 = fma(_983, _905, _975);
                _987 = fma(_691, _905, _977);
                _989 = fma(_703, _905, _979);
                float _991 = _925 * _669;
                float _993 = _681 * _925;
                float _995 = _689 * _925;
                _997 = _911 + _981;
                float _999 = fma(_919, _667, _991);
                float _1001 = fma(_679, _919, _993);
                float _1003 = fma(_685, _919, _995);
                float _1005 = _697 * _925;
                float _1007 = fma(_931, _671, _999);
                float _1009 = _951 * _669;
                float _1011 = -_677;
                _1013 = fma(_1011, _931, _1001);
                _1015 = fma(_691, _931, _1003);
                float _1017 = _681 * _951;
                float _1019 = _689 * _951;
                float _1021 = _697 * _951;
                float _1023 = fma(_945, _667, _1009);
                float _1025 = fma(_695, _919, _1005);
                _1027 = _937 + _1007;
                float _1029 = fma(_679, _945, _1017);
                float _1031 = fma(_685, _945, _1019);
                float _1033 = fma(_695, _945, _1021);
                float _1035 = fma(_957, _671, _1023);
                _1037 = fma(_703, _931, _1025);
                float _1039 = -_677;
                _1041 = fma(_1039, _957, _1029);
                _1043 = fma(_691, _957, _1031);
                _1045 = fma(_703, _957, _1033);
                _1047 = _963 + _1035;
                uint _1049 = uint(int(uint(_693) >> uint(2)));
                _39[int(_1049)] = as_type<uint>(_985);
                int _1051 = _693 + 4;
                uint _1053 = uint(int(uint(_1051) >> uint(2)));
                _39[int(_1053)] = as_type<uint>(_987);
                int _1055 = _693 + 8;
                uint _1057 = uint(int(uint(_1055) >> uint(2)));
                _39[int(_1057)] = as_type<uint>(_989);
                int _1059 = _693 + 12;
                uint _1061 = uint(int(uint(_1059) >> uint(2)));
                _39[int(_1061)] = as_type<uint>(_997);
                int _1063 = _693 + 16;
                uint _1065 = uint(int(uint(_1063) >> uint(2)));
                _39[int(_1065)] = as_type<uint>(_1013);
                int _1067 = _693 + 20;
                uint _1069 = uint(int(uint(_1067) >> uint(2)));
                _39[int(_1069)] = as_type<uint>(_1015);
                int _1071 = _693 + 24;
                uint _1073 = uint(int(uint(_1071) >> uint(2)));
                _39[int(_1073)] = as_type<uint>(_1037);
                int _1075 = _693 + 28;
                uint _1077 = uint(int(uint(_1075) >> uint(2)));
                _39[int(_1077)] = as_type<uint>(_1027);
                int _1079 = _693 + 32;
                uint _1081 = uint(int(uint(_1079) >> uint(2)));
                _39[int(_1081)] = as_type<uint>(_1041);
                int _1083 = _693 + 36;
                uint _1085 = uint(int(uint(_1083) >> uint(2)));
                _39[int(_1085)] = as_type<uint>(_1043);
                int _1087 = _693 + 40;
                uint _1089 = uint(int(uint(_1087) >> uint(2)));
                _39[int(_1089)] = as_type<uint>(_1045);
                int _1091 = _693 + 44;
                uint _1093 = uint(int(uint(_1091) >> uint(2)));
                _39[int(_1093)] = as_type<uint>(_1047);
                _887 = !_939;
                _885 = _913;
            } while (_887);
            _857 = _1015;
            _717 = _1043;
            _841 = _987;
            _853 = _1013;
            _869 = _1041;
            _821 = _985;
            _861 = _1037;
            _845 = _989;
            _719 = _1045;
            _865 = _1027;
            _849 = _997;
            _721 = _1047;
            _1095 = true;
        }
        else
        {
            _857 = 0.0;
            _717 = 0.0;
            _841 = 0.0;
            _853 = 0.0;
            _869 = 0.0;
            _821 = 0.0;
            _861 = 0.0;
            _845 = 0.0;
            _719 = 0.0;
            _865 = 0.0;
            _849 = 0.0;
            _721 = 0.0;
        }
    }
    _1095 = false;
    float _1097 = _857;
    float _1099 = _717;
    float _1101 = _841;
    float _1103 = _853;
    float _1105 = _869;
    float _1107 = _821;
    float _1109 = _861;
    float _1111 = _845;
    float _1113 = _719;
    float _1115 = _865;
    float _1117 = _849;
    float _1119 = _721;
    int _1121 = _795 + 80;
    uint _1123 = uint(int(uint(_1121) >> uint(2)));
    uint _1125 = uint(int(uint(int(_1123)) >> uint(2)));
    int _1127 = int(_1123) & 3;
    float _1129 = (*spvDescriptorSet0.cp_c6)._m0[int(_1125)][_1127];
    int _1131 = int(_1123) + 1;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    int _1135 = _1131 & 3;
    float _1137 = (*spvDescriptorSet0.cp_c6)._m0[int(_1133)][_1135];
    int _1139 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1141 = _1139 + _68;
    int _1143 = _795 + 64;
    uint _1145 = uint(int(uint(_1143) >> uint(2)));
    uint _1147 = uint(int(uint(int(_1145)) >> uint(2)));
    int _1149 = int(_1145) & 3;
    float _1151 = (*spvDescriptorSet0.cp_c6)._m0[int(_1147)][_1149];
    int _1153 = int(_1145) + 1;
    uint _1155 = uint(int(uint(_1153) >> uint(2)));
    int _1157 = _1153 & 3;
    float _1159 = (*spvDescriptorSet0.cp_c6)._m0[int(_1155)][_1157];
    int _1161 = _1141 * 48;
    int _1163 = _795 + 88;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    uint _1167 = uint(int(uint(int(_1165)) >> uint(2)));
    int _1169 = int(_1165) & 3;
    float _1171 = (*spvDescriptorSet0.cp_c6)._m0[int(_1167)][_1169];
    int _1173 = int(_1165) + 1;
    uint _1175 = uint(int(uint(_1173) >> uint(2)));
    int _1177 = _1173 & 3;
    float _1179 = (*spvDescriptorSet0.cp_c6)._m0[int(_1175)][_1177];
    int _1181 = _795 + 72;
    uint _1183 = uint(int(uint(_1181) >> uint(2)));
    uint _1185 = uint(int(uint(int(_1183)) >> uint(2)));
    int _1187 = int(_1183) & 3;
    float _1189 = (*spvDescriptorSet0.cp_c6)._m0[int(_1185)][_1187];
    int _1191 = int(_1183) + 1;
    uint _1193 = uint(int(uint(_1191) >> uint(2)));
    int _1195 = _1191 & 3;
    float _1197 = (*spvDescriptorSet0.cp_c6)._m0[int(_1193)][_1195];
    int _1199 = _795 + 104;
    uint _1201 = uint(int(uint(_1199) >> uint(2)));
    uint _1203 = uint(int(uint(int(_1201)) >> uint(2)));
    int _1205 = int(_1201) & 3;
    float _1207 = (*spvDescriptorSet0.cp_c6)._m0[int(_1203)][_1205];
    int _1209 = int(_1201) + 1;
    uint _1211 = uint(int(uint(_1209) >> uint(2)));
    int _1213 = _1209 & 3;
    float _1215 = (*spvDescriptorSet0.cp_c6)._m0[int(_1211)][_1213];
    int _1217 = _795 + 96;
    uint _1219 = uint(int(uint(_1217) >> uint(2)));
    uint _1221 = uint(int(uint(int(_1219)) >> uint(2)));
    int _1223 = int(_1219) & 3;
    float _1225 = (*spvDescriptorSet0.cp_c6)._m0[int(_1221)][_1223];
    int _1227 = int(_1219) + 1;
    uint _1229 = uint(int(uint(_1227) >> uint(2)));
    int _1231 = _1227 & 3;
    float _1233 = (*spvDescriptorSet0.cp_c6)._m0[int(_1229)][_1231];
    float _1235 = _1097 * _1129;
    float _1237 = _1099 * _1129;
    float _1239 = _1099 * _1137;
    int _1241 = _795 + 16;
    uint _1243 = uint(int(uint(_1241) >> uint(2)));
    uint _1245 = uint(int(uint(int(_1243)) >> uint(2)));
    int _1247 = int(_1243) & 3;
    float _1249 = (*spvDescriptorSet0.cp_c6)._m0[int(_1245)][_1247];
    int _1251 = int(_1243) + 1;
    uint _1253 = uint(int(uint(_1251) >> uint(2)));
    int _1255 = _1251 & 3;
    float _1257 = (*spvDescriptorSet0.cp_c6)._m0[int(_1253)][_1255];
    float _1259 = _1101 * _1129;
    float _1261 = fma(_1103, _1151, _1235);
    float _1263 = _1101 * _1137;
    float _1265 = fma(_1105, _1151, _1237);
    int _1267 = _795 + 32;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    uint _1271 = uint(int(uint(int(_1269)) >> uint(2)));
    int _1273 = int(_1269) & 3;
    float _1275 = (*spvDescriptorSet0.cp_c6)._m0[int(_1271)][_1273];
    int _1277 = int(_1269) + 1;
    uint _1279 = uint(int(uint(_1277) >> uint(2)));
    int _1281 = _1277 & 3;
    float _1283 = (*spvDescriptorSet0.cp_c6)._m0[int(_1279)][_1281];
    float _1285 = _1097 * _1137;
    float _1287 = fma(_1107, _1159, _1263);
    float _1289 = fma(_1105, _1159, _1239);
    float _1291 = fma(_1107, _1151, _1259);
    float _1293 = _1101 * _1171;
    float _1295 = _1101 * _1179;
    float _1297 = _1097 * _1171;
    int _1299 = _795 + 48;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    uint _1303 = uint(int(uint(int(_1301)) >> uint(2)));
    int _1305 = int(_1301) & 3;
    float _1307 = (*spvDescriptorSet0.cp_c6)._m0[int(_1303)][_1305];
    int _1309 = int(_1301) + 1;
    uint _1311 = uint(int(uint(_1309) >> uint(2)));
    int _1313 = _1309 & 3;
    float _1315 = (*spvDescriptorSet0.cp_c6)._m0[int(_1311)][_1313];
    float _1317 = _1099 * _1171;
    float _1319 = _1097 * _1179;
    float _1321 = _1099 * _1179;
    float _1323 = fma(_1103, _1159, _1285);
    float _1325 = fma(_1107, _1189, _1293);
    float _1327 = fma(_1107, _1197, _1295);
    float _1329 = fma(_1103, _1189, _1297);
    int _1331 = _795 + 24;
    uint _1333 = uint(int(uint(_1331) >> uint(2)));
    uint _1335 = uint(int(uint(int(_1333)) >> uint(2)));
    int _1337 = int(_1333) & 3;
    float _1339 = (*spvDescriptorSet0.cp_c6)._m0[int(_1335)][_1337];
    int _1341 = int(_1333) + 1;
    uint _1343 = uint(int(uint(_1341) >> uint(2)));
    int _1345 = _1341 & 3;
    float _1347 = (*spvDescriptorSet0.cp_c6)._m0[int(_1343)][_1345];
    float _1349 = fma(_1103, _1197, _1319);
    float _1351 = fma(_1105, _1189, _1317);
    float _1353 = fma(_1105, _1197, _1321);
    float _1355 = fma(_1109, _1215, _1349);
    float _1357 = fma(_1111, _1215, _1327);
    float _1359 = fma(_1113, _1215, _1353);
    int _1361 = _795 + 40;
    uint _1363 = uint(int(uint(_1361) >> uint(2)));
    uint _1365 = uint(int(uint(int(_1363)) >> uint(2)));
    int _1367 = int(_1363) & 3;
    float _1369 = (*spvDescriptorSet0.cp_c6)._m0[int(_1365)][_1367];
    int _1371 = int(_1363) + 1;
    uint _1373 = uint(int(uint(_1371) >> uint(2)));
    int _1375 = _1371 & 3;
    float _1377 = (*spvDescriptorSet0.cp_c6)._m0[int(_1373)][_1375];
    float _1379 = _1355 + _1115;
    float _1381 = fma(_1111, _1207, _1325);
    float _1383 = fma(_1113, _1207, _1351);
    float _1385 = _1357 + _1117;
    float _1387 = fma(_1111, _1233, _1287);
    float _1389 = fma(_1109, _1225, _1261);
    float _1391 = fma(_1109, _1233, _1323);
    int _1393 = _795 + 56;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    uint _1397 = uint(int(uint(int(_1395)) >> uint(2)));
    int _1399 = int(_1395) & 3;
    float _1401 = (*spvDescriptorSet0.cp_c6)._m0[int(_1397)][_1399];
    int _1403 = int(_1395) + 1;
    uint _1405 = uint(int(uint(_1403) >> uint(2)));
    int _1407 = _1403 & 3;
    float _1409 = (*spvDescriptorSet0.cp_c6)._m0[int(_1405)][_1407];
    float _1411 = fma(_1109, _1207, _1329);
    float _1413 = fma(_1111, _1225, _1291);
    float _1415 = fma(_1113, _1225, _1265);
    float _1417 = fma(_1113, _1233, _1289);
    float _1419 = _1359 + _1119;
    int _1421 = _1161 + 32;
    float _1423 = _1389 * _1257;
    float _1425 = _1391 * _1257;
    float _1427 = _1411 * _1257;
    float _1429 = _1379 * _1257;
    float _1431 = fma(_1413, _1249, _1423);
    float _1433 = fma(_1387, _1249, _1425);
    float _1435 = fma(_1381, _1249, _1427);
    float _1437 = fma(_1385, _1249, _1429);
    float _1439 = _1389 * _1283;
    float _1441 = _1391 * _1283;
    float _1443 = _1411 * _1283;
    float _1445 = _1379 * _1283;
    float _1447 = fma(_1413, _1275, _1439);
    float _1449 = fma(_1387, _1275, _1441);
    float _1451 = fma(_1381, _1275, _1443);
    float _1453 = fma(_1385, _1275, _1445);
    float _1455 = _1389 * _1315;
    float _1457 = _1391 * _1315;
    float _1459 = _1411 * _1315;
    float _1461 = _1379 * _1315;
    float _1463 = fma(_1413, _1307, _1455);
    float _1465 = fma(_1387, _1307, _1457);
    float _1467 = fma(_1381, _1307, _1459);
    float _1469 = fma(_1385, _1307, _1461);
    float _1471 = fma(_1419, _1339, _1437);
    float _1473 = fma(_1415, _1339, _1431);
    float _1475 = fma(_1417, _1339, _1433);
    float _1477 = fma(_1383, _1339, _1435);
    float _1479 = _1471 + _1347;
    int _1481 = _1161 + 16;
    int _1483 = _1161 + 48;
    float _1485 = fma(_1419, _1369, _1453);
    float _1487 = fma(_1415, _1369, _1447);
    float _1489 = fma(_1417, _1369, _1449);
    float _1491 = fma(_1383, _1369, _1451);
    float _1493 = _1485 + _1377;
    uint _1495 = uint(int(uint(_1481) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1495)] = as_type<uint>(_1473);
    int _1497 = _1481 + 4;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1499)] = as_type<uint>(_1475);
    int _1501 = _1481 + 8;
    uint _1503 = uint(int(uint(_1501) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1503)] = as_type<uint>(_1477);
    int _1505 = _1481 + 12;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1507)] = as_type<uint>(_1479);
    float _1509 = fma(_1419, _1401, _1469);
    float _1511 = fma(_1417, _1401, _1465);
    float _1513 = fma(_1415, _1401, _1463);
    float _1515 = fma(_1383, _1401, _1467);
    float _1517 = _1509 + _1409;
    uint _1519 = uint(int(uint(_1421) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1519)] = as_type<uint>(_1487);
    int _1521 = _1421 + 4;
    uint _1523 = uint(int(uint(_1521) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1523)] = as_type<uint>(_1489);
    int _1525 = _1421 + 8;
    uint _1527 = uint(int(uint(_1525) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1527)] = as_type<uint>(_1491);
    int _1529 = _1421 + 12;
    uint _1531 = uint(int(uint(_1529) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1531)] = as_type<uint>(_1493);
    uint _1533 = uint(int(uint(_1483) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1533)] = as_type<uint>(_1513);
    int _1535 = _1483 + 4;
    uint _1537 = uint(int(uint(_1535) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1537)] = as_type<uint>(_1511);
    int _1539 = _1483 + 8;
    uint _1541 = uint(int(uint(_1539) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1541)] = as_type<uint>(_1515);
    int _1543 = _1483 + 12;
    uint _1545 = uint(int(uint(_1543) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1545)] = as_type<uint>(_1517);
}

