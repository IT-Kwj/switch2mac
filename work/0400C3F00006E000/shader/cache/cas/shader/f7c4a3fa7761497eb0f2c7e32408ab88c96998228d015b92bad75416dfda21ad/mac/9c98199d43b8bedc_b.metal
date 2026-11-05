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
int _56(thread const int& _3812, thread const int& _3813, constant _10& support_buffer)
{
    int _3816 = 1 + _3813;
    float _3818 = support_buffer._m5[_3816].x;
    bool _3820 = _3818 == 1.0;
    if (_3820)
    {
        return _3812;
    }
    float _3822 = float(_3812);
    float _3824 = _3822 * _3818;
    int _3826 = int(_3824);
    return _3826;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1051 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_70)
    {
        return;
    }
    int _72 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _75 = uint(int(uint(_72) >> uint(2)));
    uint _77 = uint(int(uint(int(_75)) >> uint(2)));
    int _79 = int(_75) & 3;
    float _81 = (*spvDescriptorSet0.cp_c5)._m0[int(_77)][_79];
    int _83 = int(_75) + 1;
    uint _85 = uint(int(uint(_83) >> uint(2)));
    int _87 = _83 & 3;
    float _89 = (*spvDescriptorSet0.cp_c5)._m0[int(_85)][_87];
    int _91 = _72 + 8;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    uint _95 = uint(int(uint(int(_93)) >> uint(2)));
    int _97 = int(_93) & 3;
    float _99 = (*spvDescriptorSet0.cp_c5)._m0[int(_95)][_97];
    int _101 = int(_93) + 1;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    int _105 = _101 & 3;
    float _107 = (*spvDescriptorSet0.cp_c5)._m0[int(_103)][_105];
    int _109 = _66;
    int _111 = 0;
    int _113 = _56(_109, _111, (*spvDescriptorSet0.support_buffer));
    int _115 = as_type<int>(_81);
    int _117 = 0;
    int _119 = _56(_115, _117, (*spvDescriptorSet0.support_buffer));
    int3 _1605 = int3(_113, _119, 0);
    float3 _123 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1605.xy), uint(_1605.z), 0).xyz;
    float _125 = _123.x;
    float _127 = _123.y;
    float _129 = _123.z;
    int _131 = _66;
    int _133 = 0;
    int _135 = _56(_131, _133, (*spvDescriptorSet0.support_buffer));
    int _137 = as_type<int>(_89);
    int _139 = 0;
    int _141 = _56(_137, _139, (*spvDescriptorSet0.support_buffer));
    int3 _1623 = int3(_135, _141, 0);
    float3 _143 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1623.xy), uint(_1623.z), 0).xyz;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    int _151 = _66;
    int _153 = 1;
    int _155 = _56(_151, _153, (*spvDescriptorSet0.support_buffer));
    int _157 = as_type<int>(_99);
    int _159 = 1;
    int _161 = _56(_157, _159, (*spvDescriptorSet0.support_buffer));
    int3 _1641 = int3(_155, _161, 0);
    float3 _163 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1641.xy), uint(_1641.z), 0).xyz;
    float _165 = _163.x;
    float _167 = _163.y;
    float _169 = _163.z;
    int _171 = _66;
    int _173 = 1;
    int _175 = _56(_171, _173, (*spvDescriptorSet0.support_buffer));
    int _177 = as_type<int>(_107);
    int _179 = 1;
    int _181 = _56(_177, _179, (*spvDescriptorSet0.support_buffer));
    int3 _1659 = int3(_175, _181, 0);
    float3 _183 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1659.xy), uint(_1659.z), 0).xyz;
    float _185 = _183.x;
    float _187 = _183.y;
    float _189 = _183.z;
    int _191 = _66;
    int _193 = 0;
    int _195 = _56(_191, _193, (*spvDescriptorSet0.support_buffer));
    int _197 = as_type<int>(_81);
    int _199 = 0;
    int _201 = _56(_197, _199, (*spvDescriptorSet0.support_buffer));
    int3 _1677 = int3(_195, _201, 1);
    float3 _203 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1677.xy), uint(_1677.z), 0).xyz;
    float _205 = _203.x;
    float _207 = _203.y;
    float _209 = _203.z;
    int _211 = _66;
    int _213 = 0;
    int _215 = _56(_211, _213, (*spvDescriptorSet0.support_buffer));
    int _217 = as_type<int>(_89);
    int _219 = 0;
    int _221 = _56(_217, _219, (*spvDescriptorSet0.support_buffer));
    int3 _1695 = int3(_215, _221, 1);
    float3 _223 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1695.xy), uint(_1695.z), 0).xyz;
    float _225 = _223.x;
    float _227 = _223.y;
    float _229 = _223.z;
    int _231 = _66;
    int _233 = 1;
    int _235 = _56(_231, _233, (*spvDescriptorSet0.support_buffer));
    int _237 = as_type<int>(_99);
    int _239 = 1;
    int _241 = _56(_237, _239, (*spvDescriptorSet0.support_buffer));
    int3 _1713 = int3(_235, _241, 1);
    float3 _243 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1713.xy), uint(_1713.z), 0).xyz;
    float _245 = _243.x;
    float _247 = _243.y;
    float _249 = _243.z;
    int _251 = _66;
    int _253 = 1;
    int _255 = _56(_251, _253, (*spvDescriptorSet0.support_buffer));
    int _257 = as_type<int>(_107);
    int _259 = 1;
    int _261 = _56(_257, _259, (*spvDescriptorSet0.support_buffer));
    int3 _1731 = int3(_255, _261, 1);
    float3 _263 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1731.xy), uint(_1731.z), 0).xyz;
    float _265 = _263.x;
    float _267 = _263.y;
    float _269 = _263.z;
    int _271 = _66;
    int _273 = 0;
    int _275 = _56(_271, _273, (*spvDescriptorSet0.support_buffer));
    int _277 = as_type<int>(_81);
    int _279 = 0;
    int _281 = _56(_277, _279, (*spvDescriptorSet0.support_buffer));
    int3 _1749 = int3(_275, _281, 2);
    float3 _283 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1749.xy), uint(_1749.z), 0).xyz;
    float _285 = _283.x;
    float _287 = _283.y;
    float _289 = _283.z;
    int _291 = _66;
    int _293 = 0;
    int _295 = _56(_291, _293, (*spvDescriptorSet0.support_buffer));
    int _297 = as_type<int>(_89);
    int _299 = 0;
    int _301 = _56(_297, _299, (*spvDescriptorSet0.support_buffer));
    int3 _1767 = int3(_295, _301, 2);
    float3 _303 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1767.xy), uint(_1767.z), 0).xyz;
    float _305 = _303.x;
    float _307 = _303.y;
    float _309 = _303.z;
    int _311 = _66;
    int _313 = 1;
    int _315 = _56(_311, _313, (*spvDescriptorSet0.support_buffer));
    int _317 = as_type<int>(_99);
    int _319 = 1;
    int _321 = _56(_317, _319, (*spvDescriptorSet0.support_buffer));
    int3 _1785 = int3(_315, _321, 2);
    float3 _323 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1785.xy), uint(_1785.z), 0).xyz;
    float _325 = _323.x;
    float _327 = _323.y;
    float _329 = _323.z;
    int _331 = _66;
    int _333 = 1;
    int _335 = _56(_331, _333, (*spvDescriptorSet0.support_buffer));
    int _337 = as_type<int>(_107);
    int _339 = 1;
    int _341 = _56(_337, _339, (*spvDescriptorSet0.support_buffer));
    int3 _1803 = int3(_335, _341, 2);
    float3 _343 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1803.xy), uint(_1803.z), 0).xyz;
    float _345 = _343.x;
    float _347 = _343.y;
    float _349 = _343.z;
    int _351 = _72 + 16;
    uint _353 = uint(int(uint(_351) >> uint(2)));
    uint _355 = uint(int(uint(int(_353)) >> uint(2)));
    int _357 = int(_353) & 3;
    float _359 = (*spvDescriptorSet0.cp_c5)._m0[int(_355)][_357];
    int _361 = int(_353) + 1;
    uint _363 = uint(int(uint(_361) >> uint(2)));
    int _365 = _361 & 3;
    float _367 = (*spvDescriptorSet0.cp_c5)._m0[int(_363)][_365];
    bool _369 = _66 != 0;
    int _371 = _72 + 24;
    uint _373 = uint(int(uint(_371) >> uint(2)));
    uint _375 = uint(int(uint(int(_373)) >> uint(2)));
    int _377 = int(_373) & 3;
    float _379 = (*spvDescriptorSet0.cp_c5)._m0[int(_375)][_377];
    int _381 = int(_373) + 1;
    uint _383 = uint(int(uint(_381) >> uint(2)));
    int _385 = _381 & 3;
    float _387 = (*spvDescriptorSet0.cp_c5)._m0[int(_383)][_385];
    float _389 = -_125;
    float _391 = _389 + _145;
    float _393 = -_127;
    float _395 = _393 + _147;
    float _397 = -_129;
    float _399 = _397 + _149;
    float _401 = fma(_391, _359, _125);
    float _403 = fma(_395, _359, _127);
    float _405 = fma(_399, _359, _129);
    float _407 = -_165;
    float _409 = _407 + _185;
    float _411 = -_167;
    float _413 = _411 + _187;
    float _415 = -_169;
    float _417 = _415 + _189;
    float _419 = -_209;
    float _421 = _419 + _229;
    float _423 = fma(_409, _379, _165);
    float _425 = fma(_413, _379, _167);
    float _427 = fma(_417, _379, _169);
    float _429 = fma(_421, _359, _209);
    float _431 = _423 * _387;
    float _433 = _425 * _387;
    float _435 = _427 * _387;
    float _437 = -_249;
    float _439 = _437 + _269;
    float _441 = fma(_401, _367, _431);
    float _443 = fma(_403, _367, _433);
    float _445 = fma(_405, _367, _435);
    float _447 = -_205;
    float _449 = _447 + _225;
    float _451 = -_207;
    float _453 = _451 + _227;
    float _455 = _429 * 0.15915493667125701904296875;
    float _457 = fma(_439, _379, _249);
    float _459 = fma(_449, _359, _205);
    float _461 = fma(_453, _359, _207);
    float _463 = _455 * 6.283185482025146484375;
    float _465 = cos(_463);
    float _467 = _457 * 0.15915493667125701904296875;
    float _469 = _459 * 0.15915493667125701904296875;
    float _471 = _461 * 0.15915493667125701904296875;
    float _473 = _469 * 6.283185482025146484375;
    float _475 = cos(_473);
    float _477 = _455 * 6.283185482025146484375;
    float _479 = sin(_477);
    float _481 = _471 * 6.283185482025146484375;
    float _483 = cos(_481);
    float _485 = _475 * _465;
    float _487 = _469 * 6.283185482025146484375;
    float _489 = sin(_487);
    float _491 = _479 * _475;
    float _493 = _471 * 6.283185482025146484375;
    float _495 = sin(_493);
    float _497 = _475 * _483;
    float _499 = _483 * _465;
    float _501 = _479 * _483;
    float _503 = _489 * _483;
    float _505 = _489 * _479;
    float _507 = _489 * _465;
    float _509 = _467 * 6.283185482025146484375;
    float _511 = sin(_509);
    float _513 = _489 * _495;
    float _515 = fma(_495, _485, _505);
    float _517 = -_491;
    float _519 = fma(_465, _513, _517);
    float _521 = fma(_479, _513, _485);
    float _523 = -_507;
    float _525 = fma(_495, _491, _523);
    float _527 = -_247;
    float _529 = _527 + _267;
    float _531 = -_245;
    float _533 = _531 + _265;
    float _535 = _467 * 6.283185482025146484375;
    float _537 = cos(_535);
    float _539 = fma(_529, _379, _247);
    float _541 = fma(_533, _379, _245);
    float _543 = _539 * 0.15915493667125701904296875;
    float _545 = _541 * 0.15915493667125701904296875;
    float _547 = _543 * 6.283185482025146484375;
    float _549 = cos(_547);
    float _551 = _545 * 6.283185482025146484375;
    float _553 = cos(_551);
    float _555 = _543 * 6.283185482025146484375;
    float _557 = sin(_555);
    float _559 = _511 * _549;
    float _561 = _549 * _537;
    float _563 = _561 * _387;
    float _565 = _545 * 6.283185482025146484375;
    float _567 = sin(_565);
    float _569 = _553 * _537;
    float _571 = _511 * _553;
    float _573 = _553 * _549;
    float _575 = fma(_499, _367, _563);
    float _577 = _573 * _387;
    float _579 = fma(_497, _367, _577);
    float _581 = _567 * _557;
    float _583 = _567 * _549;
    float _585 = _567 * _511;
    float _587 = _567 * _537;
    float _589 = _495 * _367;
    float _591 = -_571;
    float _593 = fma(_537, _581, _591);
    float _595 = _559 * _387;
    float _597 = fma(_511, _581, _569);
    float _599 = fma(_557, _569, _585);
    float _601 = -_587;
    float _603 = fma(_557, _571, _601);
    float _605 = fma(_501, _367, _595);
    float _607 = _597 * _387;
    float _609 = -_557;
    float _611 = -_589;
    float _613 = fma(_609, _387, _611);
    float _615 = _593 * _387;
    float _617 = _605 * _605;
    float _619 = _599 * _387;
    float _621 = fma(_521, _367, _607);
    float _623 = _603 * _387;
    float _625 = fma(_519, _367, _615);
    float _627 = fma(_575, _575, _617);
    float _629 = fma(_515, _367, _619);
    float _631 = _583 * _387;
    float _633 = _621 * _621;
    float _635 = fma(_525, _367, _623);
    float _637 = fma(_613, _613, _627);
    float _639 = fma(_503, _367, _631);
    float _641 = fma(_625, _625, _633);
    float _643 = _635 * _635;
    float _645 = fma(_639, _639, _641);
    float _647 = fma(_629, _629, _643);
    float _649 = rsqrt(_637);
    float _651 = fma(_579, _579, _647);
    float _653 = -_287;
    float _655 = _653 + _307;
    float _657 = -_285;
    float _659 = _657 + _305;
    float _661 = -_289;
    float _663 = _661 + _309;
    float _665 = rsqrt(_645);
    float _667 = fma(_655, _359, _287);
    float _669 = -_325;
    float _671 = _669 + _345;
    float _673 = -_329;
    float _675 = _673 + _349;
    float _677 = fma(_659, _359, _285);
    float _679 = fma(_663, _359, _289);
    float _681 = fma(_671, _379, _325);
    float _683 = -_327;
    float _685 = _683 + _347;
    float _687 = rsqrt(_651);
    float _689 = _441 * _649;
    float _691 = fma(_675, _379, _329);
    float _693 = fma(_685, _379, _327);
    float _695 = _575 * _689;
    float _697 = _681 * _387;
    float _699 = _605 * _689;
    float _701 = _443 * _665;
    float _703 = _613 * _689;
    float _705 = fma(_677, _367, _697);
    float _707 = _693 * _387;
    float _709 = _691 * _387;
    float _711 = _625 * _701;
    float _713 = _621 * _701;
    float _715 = _639 * _701;
    float _717 = _445 * _687;
    float _719 = fma(_667, _367, _707);
    float _721 = fma(_679, _367, _709);
    float _723 = _613;
    float _725 = _327;
    float _727 = _667;
    float _729 = _639;
    float _731 = _697;
    float _733 = _709;
    float _735 = _605;
    float _737 = _715;
    float _739 = _713;
    if (!_369)
    {
        _723 = _705;
    }
    float _741 = _723;
    float _743 = _635 * _717;
    float _745 = _579 * _717;
    float _747 = _629 * _717;
    int _749 = _66 * 48;
    float _751 = _743;
    float _753 = _747;
    float _755 = _745;
    float _757 = _741;
    if (!_369)
    {
        _725 = _719;
    }
    float _759 = _725;
    int _761 = _66 * 112;
    float _763 = _759;
    if (!_369)
    {
        _727 = _721;
    }
    float _765 = _727;
    uint _767 = uint(int(uint(_749) >> uint(2)));
    _37[int(_767)] = as_type<uint>(_695);
    int _769 = _749 + 4;
    uint _771 = uint(int(uint(_769) >> uint(2)));
    _37[int(_771)] = as_type<uint>(_711);
    int _773 = _749 + 8;
    uint _775 = uint(int(uint(_773) >> uint(2)));
    _37[int(_775)] = as_type<uint>(_747);
    int _777 = _749 + 12;
    uint _779 = uint(int(uint(_777) >> uint(2)));
    _37[int(_779)] = as_type<uint>(_705);
    float _781 = _765;
    if (!_369)
    {
        _729 = _695;
    }
    float _783 = _729;
    float _785 = _783;
    if (!_369)
    {
        _731 = _699;
    }
    float _787 = _731;
    int _789 = _749 + 16;
    uint _791 = uint(int(uint(_789) >> uint(2)));
    _37[int(_791)] = as_type<uint>(_699);
    int _793 = _749 + 20;
    uint _795 = uint(int(uint(_793) >> uint(2)));
    _37[int(_795)] = as_type<uint>(_713);
    int _797 = _749 + 24;
    uint _799 = uint(int(uint(_797) >> uint(2)));
    _37[int(_799)] = as_type<uint>(_743);
    int _801 = _749 + 28;
    uint _803 = uint(int(uint(_801) >> uint(2)));
    _37[int(_803)] = as_type<uint>(_719);
    float _805 = _787;
    if (!_369)
    {
        _733 = _703;
    }
    float _807 = _733;
    float _809 = _807;
    if (!_369)
    {
        _735 = _711;
    }
    float _811 = _735;
    int _813 = _749 + 32;
    uint _815 = uint(int(uint(_813) >> uint(2)));
    _37[int(_815)] = as_type<uint>(_703);
    int _817 = _749 + 36;
    uint _819 = uint(int(uint(_817) >> uint(2)));
    _37[int(_819)] = as_type<uint>(_715);
    int _821 = _749 + 40;
    uint _823 = uint(int(uint(_821) >> uint(2)));
    _37[int(_823)] = as_type<uint>(_745);
    int _825 = _749 + 44;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    _37[int(_827)] = as_type<uint>(_721);
    bool _829 = !_369;
    float _831 = _811;
    if (!_829)
    {
        bool _833 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _835 = !_833;
        if (!_835)
        {
            uint _837 = uint(int(uint(_761) >> uint(2)));
            uint _839 = uint(int(uint(int(_837)) >> uint(2)));
            int _841 = int(_837) & 3;
            float _843 = (*spvDescriptorSet0.cp_c6)._m0[int(_839)][_841];
            int _845 = as_type<int>(_843) * 48;
            int _847 = 0;
            bool _849;
            float _945;
            float _947;
            float _949;
            float _953;
            float _971;
            float _973;
            float _975;
            float _987;
            float _997;
            float _999;
            float _1001;
            float _1003;
            do
            {
                int _851 = _847;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _853 = uint(int(uint(_845) >> uint(2)));
                float _855 = as_type<float>(_37[int(_853)]);
                int _857 = _845 + 4;
                uint _859 = uint(int(uint(_857) >> uint(2)));
                float _861 = as_type<float>(_37[int(_859)]);
                int _863 = _845 + 8;
                uint _865 = uint(int(uint(_863) >> uint(2)));
                float _867 = as_type<float>(_37[int(_865)]);
                int _869 = _845 + 12;
                uint _871 = uint(int(uint(_869) >> uint(2)));
                float _873 = as_type<float>(_37[int(_871)]);
                int _875 = _851 + 1;
                int _877 = _845 + 16;
                uint _879 = uint(int(uint(_877) >> uint(2)));
                float _881 = as_type<float>(_37[int(_879)]);
                int _883 = _845 + 20;
                uint _885 = uint(int(uint(_883) >> uint(2)));
                float _887 = as_type<float>(_37[int(_885)]);
                int _889 = _845 + 24;
                uint _891 = uint(int(uint(_889) >> uint(2)));
                float _893 = as_type<float>(_37[int(_891)]);
                int _895 = _845 + 28;
                uint _897 = uint(int(uint(_895) >> uint(2)));
                float _899 = as_type<float>(_37[int(_897)]);
                bool _901 = uint(_875) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _903 = _845 + 32;
                uint _905 = uint(int(uint(_903) >> uint(2)));
                float _907 = as_type<float>(_37[int(_905)]);
                int _909 = _845 + 36;
                uint _911 = uint(int(uint(_909) >> uint(2)));
                float _913 = as_type<float>(_37[int(_911)]);
                int _915 = _845 + 40;
                uint _917 = uint(int(uint(_915) >> uint(2)));
                float _919 = as_type<float>(_37[int(_917)]);
                int _921 = _845 + 44;
                uint _923 = uint(int(uint(_921) >> uint(2)));
                float _925 = as_type<float>(_37[int(_923)]);
                float _927 = _719 * _861;
                float _929 = _699 * _861;
                float _931 = _713 * _861;
                float _933 = _743 * _861;
                float _935 = fma(_705, _855, _927);
                float _937 = fma(_695, _855, _929);
                float _939 = fma(_711, _855, _931);
                float _941 = fma(_747, _855, _933);
                float _943 = fma(_721, _867, _935);
                _945 = fma(_703, _867, _937);
                _947 = fma(_715, _867, _939);
                _949 = fma(_745, _867, _941);
                float _951 = _719 * _887;
                _953 = _873 + _943;
                float _955 = _699 * _887;
                float _957 = _713 * _887;
                float _959 = fma(_705, _881, _951);
                float _961 = _743 * _887;
                float _963 = fma(_695, _881, _955);
                float _965 = fma(_711, _881, _957);
                float _967 = fma(_721, _893, _959);
                float _969 = fma(_747, _881, _961);
                _971 = fma(_703, _893, _963);
                _973 = fma(_715, _893, _965);
                _975 = _899 + _967;
                float _977 = _719 * _913;
                float _979 = _699 * _913;
                float _981 = _713 * _913;
                float _983 = _743 * _913;
                float _985 = fma(_705, _907, _977);
                _987 = fma(_745, _893, _969);
                float _989 = fma(_695, _907, _979);
                float _991 = fma(_711, _907, _981);
                float _993 = fma(_747, _907, _983);
                float _995 = fma(_721, _919, _985);
                _997 = fma(_703, _919, _989);
                _999 = fma(_715, _919, _991);
                _1001 = fma(_745, _919, _993);
                _1003 = _925 + _995;
                uint _1005 = uint(int(uint(_749) >> uint(2)));
                _37[int(_1005)] = as_type<uint>(_945);
                int _1007 = _749 + 4;
                uint _1009 = uint(int(uint(_1007) >> uint(2)));
                _37[int(_1009)] = as_type<uint>(_947);
                int _1011 = _749 + 8;
                uint _1013 = uint(int(uint(_1011) >> uint(2)));
                _37[int(_1013)] = as_type<uint>(_949);
                int _1015 = _749 + 12;
                uint _1017 = uint(int(uint(_1015) >> uint(2)));
                _37[int(_1017)] = as_type<uint>(_953);
                int _1019 = _749 + 16;
                uint _1021 = uint(int(uint(_1019) >> uint(2)));
                _37[int(_1021)] = as_type<uint>(_971);
                int _1023 = _749 + 20;
                uint _1025 = uint(int(uint(_1023) >> uint(2)));
                _37[int(_1025)] = as_type<uint>(_973);
                int _1027 = _749 + 24;
                uint _1029 = uint(int(uint(_1027) >> uint(2)));
                _37[int(_1029)] = as_type<uint>(_987);
                int _1031 = _749 + 28;
                uint _1033 = uint(int(uint(_1031) >> uint(2)));
                _37[int(_1033)] = as_type<uint>(_975);
                int _1035 = _749 + 32;
                uint _1037 = uint(int(uint(_1035) >> uint(2)));
                _37[int(_1037)] = as_type<uint>(_997);
                int _1039 = _749 + 36;
                uint _1041 = uint(int(uint(_1039) >> uint(2)));
                _37[int(_1041)] = as_type<uint>(_999);
                int _1043 = _749 + 40;
                uint _1045 = uint(int(uint(_1043) >> uint(2)));
                _37[int(_1045)] = as_type<uint>(_1001);
                int _1047 = _749 + 44;
                uint _1049 = uint(int(uint(_1047) >> uint(2)));
                _37[int(_1049)] = as_type<uint>(_1003);
                _849 = !_901;
                _847 = _875;
            } while (_849);
            _831 = _947;
            _737 = _999;
            _739 = _973;
            _785 = _945;
            _809 = _997;
            _805 = _971;
            _751 = _987;
            _753 = _949;
            _755 = _1001;
            _757 = _953;
            _763 = _975;
            _781 = _1003;
            _1051 = true;
        }
        else
        {
            _831 = 0.0;
            _737 = 0.0;
            _739 = 0.0;
            _785 = 0.0;
            _809 = 0.0;
            _805 = 0.0;
            _751 = 0.0;
            _753 = 0.0;
            _755 = 0.0;
            _757 = 0.0;
            _763 = 0.0;
            _781 = 0.0;
        }
    }
    _1051 = false;
    float _1053 = _831;
    float _1055 = _737;
    float _1057 = _739;
    float _1059 = _785;
    float _1061 = _809;
    float _1063 = _805;
    float _1065 = _751;
    float _1067 = _753;
    float _1069 = _755;
    float _1071 = _757;
    float _1073 = _763;
    float _1075 = _781;
    int _1077 = _761 + 80;
    uint _1079 = uint(int(uint(_1077) >> uint(2)));
    uint _1081 = uint(int(uint(int(_1079)) >> uint(2)));
    int _1083 = int(_1079) & 3;
    float _1085 = (*spvDescriptorSet0.cp_c6)._m0[int(_1081)][_1083];
    int _1087 = int(_1079) + 1;
    uint _1089 = uint(int(uint(_1087) >> uint(2)));
    int _1091 = _1087 & 3;
    float _1093 = (*spvDescriptorSet0.cp_c6)._m0[int(_1089)][_1091];
    int _1095 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1097 = _1095 + _66;
    int _1099 = _761 + 64;
    uint _1101 = uint(int(uint(_1099) >> uint(2)));
    uint _1103 = uint(int(uint(int(_1101)) >> uint(2)));
    int _1105 = int(_1101) & 3;
    float _1107 = (*spvDescriptorSet0.cp_c6)._m0[int(_1103)][_1105];
    int _1109 = int(_1101) + 1;
    uint _1111 = uint(int(uint(_1109) >> uint(2)));
    int _1113 = _1109 & 3;
    float _1115 = (*spvDescriptorSet0.cp_c6)._m0[int(_1111)][_1113];
    int _1117 = _1097 * 48;
    int _1119 = _761 + 88;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    uint _1123 = uint(int(uint(int(_1121)) >> uint(2)));
    int _1125 = int(_1121) & 3;
    float _1127 = (*spvDescriptorSet0.cp_c6)._m0[int(_1123)][_1125];
    int _1129 = int(_1121) + 1;
    uint _1131 = uint(int(uint(_1129) >> uint(2)));
    int _1133 = _1129 & 3;
    float _1135 = (*spvDescriptorSet0.cp_c6)._m0[int(_1131)][_1133];
    int _1137 = _761 + 72;
    uint _1139 = uint(int(uint(_1137) >> uint(2)));
    uint _1141 = uint(int(uint(int(_1139)) >> uint(2)));
    int _1143 = int(_1139) & 3;
    float _1145 = (*spvDescriptorSet0.cp_c6)._m0[int(_1141)][_1143];
    int _1147 = int(_1139) + 1;
    uint _1149 = uint(int(uint(_1147) >> uint(2)));
    int _1151 = _1147 & 3;
    float _1153 = (*spvDescriptorSet0.cp_c6)._m0[int(_1149)][_1151];
    int _1155 = _761 + 96;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    uint _1159 = uint(int(uint(int(_1157)) >> uint(2)));
    int _1161 = int(_1157) & 3;
    float _1163 = (*spvDescriptorSet0.cp_c6)._m0[int(_1159)][_1161];
    int _1165 = int(_1157) + 1;
    uint _1167 = uint(int(uint(_1165) >> uint(2)));
    int _1169 = _1165 & 3;
    float _1171 = (*spvDescriptorSet0.cp_c6)._m0[int(_1167)][_1169];
    int _1173 = _761 + 104;
    uint _1175 = uint(int(uint(_1173) >> uint(2)));
    uint _1177 = uint(int(uint(int(_1175)) >> uint(2)));
    int _1179 = int(_1175) & 3;
    float _1181 = (*spvDescriptorSet0.cp_c6)._m0[int(_1177)][_1179];
    int _1183 = int(_1175) + 1;
    uint _1185 = uint(int(uint(_1183) >> uint(2)));
    int _1187 = _1183 & 3;
    float _1189 = (*spvDescriptorSet0.cp_c6)._m0[int(_1185)][_1187];
    float _1191 = _1053 * _1085;
    float _1193 = _1055 * _1085;
    float _1195 = _1055 * _1093;
    int _1197 = _761 + 16;
    uint _1199 = uint(int(uint(_1197) >> uint(2)));
    uint _1201 = uint(int(uint(int(_1199)) >> uint(2)));
    int _1203 = int(_1199) & 3;
    float _1205 = (*spvDescriptorSet0.cp_c6)._m0[int(_1201)][_1203];
    int _1207 = int(_1199) + 1;
    uint _1209 = uint(int(uint(_1207) >> uint(2)));
    int _1211 = _1207 & 3;
    float _1213 = (*spvDescriptorSet0.cp_c6)._m0[int(_1209)][_1211];
    float _1215 = _1057 * _1085;
    float _1217 = fma(_1059, _1107, _1191);
    float _1219 = fma(_1061, _1107, _1193);
    float _1221 = _1053 * _1093;
    int _1223 = _761 + 32;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    uint _1227 = uint(int(uint(int(_1225)) >> uint(2)));
    int _1229 = int(_1225) & 3;
    float _1231 = (*spvDescriptorSet0.cp_c6)._m0[int(_1227)][_1229];
    int _1233 = int(_1225) + 1;
    uint _1235 = uint(int(uint(_1233) >> uint(2)));
    int _1237 = _1233 & 3;
    float _1239 = (*spvDescriptorSet0.cp_c6)._m0[int(_1235)][_1237];
    float _1241 = _1057 * _1093;
    float _1243 = fma(_1061, _1115, _1195);
    float _1245 = fma(_1063, _1107, _1215);
    float _1247 = fma(_1059, _1115, _1221);
    float _1249 = _1053 * _1127;
    float _1251 = _1057 * _1127;
    float _1253 = _1055 * _1127;
    int _1255 = _761 + 48;
    uint _1257 = uint(int(uint(_1255) >> uint(2)));
    uint _1259 = uint(int(uint(int(_1257)) >> uint(2)));
    int _1261 = int(_1257) & 3;
    float _1263 = (*spvDescriptorSet0.cp_c6)._m0[int(_1259)][_1261];
    int _1265 = int(_1257) + 1;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    int _1269 = _1265 & 3;
    float _1271 = (*spvDescriptorSet0.cp_c6)._m0[int(_1267)][_1269];
    float _1273 = _1053 * _1135;
    float _1275 = _1057 * _1135;
    float _1277 = _1055 * _1135;
    float _1279 = fma(_1063, _1115, _1241);
    float _1281 = fma(_1059, _1145, _1249);
    float _1283 = fma(_1059, _1153, _1273);
    float _1285 = fma(_1063, _1145, _1251);
    int _1287 = _761 + 24;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    uint _1291 = uint(int(uint(int(_1289)) >> uint(2)));
    int _1293 = int(_1289) & 3;
    float _1295 = (*spvDescriptorSet0.cp_c6)._m0[int(_1291)][_1293];
    int _1297 = int(_1289) + 1;
    uint _1299 = uint(int(uint(_1297) >> uint(2)));
    int _1301 = _1297 & 3;
    float _1303 = (*spvDescriptorSet0.cp_c6)._m0[int(_1299)][_1301];
    float _1305 = fma(_1063, _1153, _1275);
    float _1307 = fma(_1061, _1145, _1253);
    float _1309 = fma(_1061, _1153, _1277);
    float _1311 = fma(_1065, _1163, _1245);
    float _1313 = fma(_1067, _1163, _1217);
    float _1315 = fma(_1067, _1171, _1247);
    int _1317 = _761 + 40;
    uint _1319 = uint(int(uint(_1317) >> uint(2)));
    uint _1321 = uint(int(uint(int(_1319)) >> uint(2)));
    int _1323 = int(_1319) & 3;
    float _1325 = (*spvDescriptorSet0.cp_c6)._m0[int(_1321)][_1323];
    int _1327 = int(_1319) + 1;
    uint _1329 = uint(int(uint(_1327) >> uint(2)));
    int _1331 = _1327 & 3;
    float _1333 = (*spvDescriptorSet0.cp_c6)._m0[int(_1329)][_1331];
    float _1335 = fma(_1065, _1171, _1279);
    float _1337 = fma(_1069, _1163, _1219);
    float _1339 = fma(_1069, _1171, _1243);
    float _1341 = fma(_1067, _1181, _1281);
    float _1343 = fma(_1067, _1189, _1283);
    float _1345 = fma(_1065, _1181, _1285);
    int _1347 = _761 + 56;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    uint _1351 = uint(int(uint(int(_1349)) >> uint(2)));
    int _1353 = int(_1349) & 3;
    float _1355 = (*spvDescriptorSet0.cp_c6)._m0[int(_1351)][_1353];
    int _1357 = int(_1349) + 1;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    int _1361 = _1357 & 3;
    float _1363 = (*spvDescriptorSet0.cp_c6)._m0[int(_1359)][_1361];
    float _1365 = fma(_1065, _1189, _1305);
    float _1367 = fma(_1069, _1189, _1309);
    float _1369 = fma(_1069, _1181, _1307);
    float _1371 = _1343 + _1071;
    float _1373 = _1365 + _1073;
    float _1375 = _1367 + _1075;
    int _1377 = _1117 + 32;
    float _1379 = _1335 * _1213;
    float _1381 = _1373 * _1213;
    float _1383 = _1311 * _1213;
    float _1385 = _1345 * _1213;
    float _1387 = fma(_1315, _1205, _1379);
    float _1389 = fma(_1371, _1205, _1381);
    float _1391 = fma(_1313, _1205, _1383);
    float _1393 = fma(_1341, _1205, _1385);
    float _1395 = _1373 * _1239;
    float _1397 = _1335 * _1239;
    float _1399 = _1311 * _1239;
    float _1401 = _1345 * _1239;
    float _1403 = fma(_1371, _1231, _1395);
    float _1405 = fma(_1315, _1231, _1397);
    float _1407 = fma(_1313, _1231, _1399);
    float _1409 = fma(_1341, _1231, _1401);
    float _1411 = _1373 * _1271;
    float _1413 = _1311 * _1271;
    float _1415 = _1335 * _1271;
    float _1417 = _1345 * _1271;
    float _1419 = fma(_1371, _1263, _1411);
    float _1421 = fma(_1313, _1263, _1413);
    float _1423 = fma(_1315, _1263, _1415);
    float _1425 = fma(_1341, _1263, _1417);
    float _1427 = fma(_1375, _1295, _1389);
    float _1429 = fma(_1339, _1295, _1387);
    float _1431 = fma(_1337, _1295, _1391);
    float _1433 = fma(_1369, _1295, _1393);
    float _1435 = _1427 + _1303;
    int _1437 = _1117 + 16;
    int _1439 = _1117 + 48;
    float _1441 = fma(_1375, _1325, _1403);
    float _1443 = fma(_1339, _1325, _1405);
    float _1445 = fma(_1337, _1325, _1407);
    float _1447 = fma(_1369, _1325, _1409);
    float _1449 = _1441 + _1333;
    uint _1451 = uint(int(uint(_1437) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1451)] = as_type<uint>(_1431);
    int _1453 = _1437 + 4;
    uint _1455 = uint(int(uint(_1453) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1455)] = as_type<uint>(_1429);
    int _1457 = _1437 + 8;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1459)] = as_type<uint>(_1433);
    int _1461 = _1437 + 12;
    uint _1463 = uint(int(uint(_1461) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1463)] = as_type<uint>(_1435);
    float _1465 = fma(_1375, _1355, _1419);
    float _1467 = fma(_1337, _1355, _1421);
    float _1469 = fma(_1339, _1355, _1423);
    float _1471 = fma(_1369, _1355, _1425);
    float _1473 = _1465 + _1363;
    uint _1475 = uint(int(uint(_1377) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1475)] = as_type<uint>(_1445);
    int _1477 = _1377 + 4;
    uint _1479 = uint(int(uint(_1477) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1479)] = as_type<uint>(_1443);
    int _1481 = _1377 + 8;
    uint _1483 = uint(int(uint(_1481) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1483)] = as_type<uint>(_1447);
    int _1485 = _1377 + 12;
    uint _1487 = uint(int(uint(_1485) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1487)] = as_type<uint>(_1449);
    uint _1489 = uint(int(uint(_1439) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1489)] = as_type<uint>(_1467);
    int _1491 = _1439 + 4;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1493)] = as_type<uint>(_1469);
    int _1495 = _1439 + 8;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1497)] = as_type<uint>(_1471);
    int _1499 = _1439 + 12;
    uint _1501 = uint(int(uint(_1499) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1501)] = as_type<uint>(_1473);
}

