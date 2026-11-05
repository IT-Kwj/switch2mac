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
    texture2d_array<float> cp_t_tcb_A [[id(6)]];
    sampler cp_t_tcb_ASmplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_8 [[id(8)]];
    sampler cp_t_tcb_8Smplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _4045, thread const int& _4046, constant _10& support_buffer)
{
    int _4049 = 1 + _4046;
    float _4051 = support_buffer._m5[_4049].x;
    bool _4053 = _4051 == 1.0;
    if (_4053)
    {
        return _4045;
    }
    float _4055 = float(_4045);
    float _4057 = _4055 * _4051;
    int _4059 = int(_4057);
    return _4059;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1167 = false;
    bool _711 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_70)
    {
        return;
    }
    int _72 = _66 & 31;
    bool _74 = _72 == 0;
    bool _76 = uint(_72) < 32u;
    int _78 = 32 - _72;
    int _80 = _72 - 32;
    int _82 = 1 << _72;
    uint _85 = uint(int(uint(0) >> uint(_78)));
    int _87 = _82 | int(_85);
    int _89 = _74 ? 1 : _87;
    bool _91 = uint(_80) < 32u;
    int _93 = 0 << _80;
    int _95 = _91 ? _93 : 0;
    float _97 = _76 ? as_type<float>(_89) : as_type<float>(_95);
    int _99 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _101 = _99 + 36;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.cp_c5)._m0[int(_105)][_107];
    int _111 = _99 + 32;
    uint _113 = uint(int(uint(_111) >> uint(2)));
    uint _115 = uint(int(uint(int(_113)) >> uint(2)));
    int _117 = int(_113) & 3;
    float _119 = (*spvDescriptorSet0.cp_c5)._m0[int(_115)][_117];
    int _121 = as_type<int>(_97) & as_type<int>(_109);
    bool _123 = _121 != 0;
    int _125 = as_type<int>(_97) & as_type<int>(_119);
    bool _127 = _125 != 0;
    int _129 = 0;
    float _131 = _97;
    float _133 = _119;
    float _135 = _109;
    if (_123)
    {
        int _137 = _99 + 8;
        uint _139 = uint(int(uint(_137) >> uint(2)));
        uint _141 = uint(int(uint(int(_139)) >> uint(2)));
        int _143 = int(_139) & 3;
        float _145 = (*spvDescriptorSet0.cp_c5)._m0[int(_141)][_143];
        _129 = as_type<int>(_145);
    }
    int _147 = _129;
    float _149 = 0.0;
    if (_123)
    {
        _149 = 1.4012984643248170709237295832899e-45;
    }
    float _151 = _149;
    float _153 = 0.0;
    if (_123)
    {
        _153 = 2.8025969286496341418474591665798e-45;
    }
    float _155 = _153;
    int _157 = 0;
    if (_127)
    {
        uint _159 = uint(int(uint(_99) >> uint(2)));
        uint _161 = uint(int(uint(int(_159)) >> uint(2)));
        int _163 = int(_159) & 3;
        float _165 = (*spvDescriptorSet0.cp_c5)._m0[int(_161)][_163];
        _157 = as_type<int>(_165);
    }
    int _167 = _157;
    if (_127)
    {
        _131 = 1.4012984643248170709237295832899e-45;
    }
    float _169 = _131;
    float _171 = _151;
    float _173 = as_type<float>(_66);
    float _175 = 0.0;
    float _177 = as_type<float>(_147);
    if (_123)
    {
        int _179 = _66;
        int _181 = 0;
        int _183 = _56(_179, _181, (*spvDescriptorSet0.support_buffer));
        int _185 = _147;
        int _187 = 0;
        int _189 = _56(_185, _187, (*spvDescriptorSet0.support_buffer));
        int3 _1822 = int3(_183, _189, as_type<int>(_151));
        float3 _193 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1822.xy), uint(_1822.z), 0).xyz;
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
    if (_123)
    {
        int _213 = _66;
        int _215 = 0;
        int _217 = _56(_213, _215, (*spvDescriptorSet0.support_buffer));
        int _219 = _147;
        int _221 = 0;
        int _223 = _56(_219, _221, (*spvDescriptorSet0.support_buffer));
        int3 _1848 = int3(_217, _223, 0);
        float3 _225 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1848.xy), uint(_1848.z), 0).xyz;
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
    if (_123)
    {
        int _245 = _66;
        int _247 = 0;
        int _249 = _56(_245, _247, (*spvDescriptorSet0.support_buffer));
        int _251 = _147;
        int _253 = 0;
        int _255 = _56(_251, _253, (*spvDescriptorSet0.support_buffer));
        int3 _1877 = int3(_249, _255, as_type<int>(_155));
        float3 _257 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1877.xy), uint(_1877.z), 0).xyz;
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
    float _273 = as_type<float>(_66);
    float _275 = 0.0;
    if (_127)
    {
        int _277 = _66;
        int _279 = 1;
        int _281 = _56(_277, _279, (*spvDescriptorSet0.support_buffer));
        int _283 = _167;
        int _285 = 1;
        int _287 = _56(_283, _285, (*spvDescriptorSet0.support_buffer));
        int3 _1905 = int3(_281, _287, 0);
        float3 _289 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1905.xy), uint(_1905.z), 0).xyz;
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
    float _305 = 0.0;
    float _307 = _169;
    if (_127)
    {
        int _309 = _66;
        int _311 = 1;
        int _313 = _56(_309, _311, (*spvDescriptorSet0.support_buffer));
        int _315 = _167;
        int _317 = 1;
        int _319 = _56(_315, _317, (*spvDescriptorSet0.support_buffer));
        int3 _1934 = int3(_313, _319, as_type<int>(_169));
        float3 _321 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1934.xy), uint(_1934.z), 0).xyz;
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
    if (!_127)
    {
        _335 = 0.0;
    }
    float _337 = _335;
    float _339 = 0.0;
    float _341 = _337;
    if (!_127)
    {
        _133 = 0.0;
        _339 = 0.0;
    }
    float _343 = _133;
    float _345 = _339;
    float _347 = 0.0;
    float _349 = _343;
    float _351 = _345;
    if (!_127)
    {
        _347 = 0.0;
    }
    float _353 = _347;
    float _355 = _353;
    if (!_127)
    {
        _135 = 0.0;
    }
    float _357 = _135;
    float _359 = 0.0;
    float _361 = _357;
    if (!_127)
    {
        _177 = 0.0;
        _359 = 0.0;
    }
    float _363 = _177;
    float _365 = _359;
    float _367 = 0.0;
    float _369 = _363;
    float _371 = _365;
    if (!_127)
    {
        _367 = 0.0;
    }
    float _373 = _367;
    float _375 = 0.0;
    float _377 = _373;
    if (!_127)
    {
        _375 = 0.0;
    }
    float _379 = _375;
    bool _381 = !_127;
    float _383 = _379;
    if (!_381)
    {
        int _385 = _66;
        int _387 = 1;
        int _389 = _56(_385, _387, (*spvDescriptorSet0.support_buffer));
        int _391 = _167;
        int _393 = 1;
        int _395 = _56(_391, _393, (*spvDescriptorSet0.support_buffer));
        int3 _2009 = int3(_389, _395, 2);
        float3 _397 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2009.xy), uint(_2009.z), 0).xyz;
        float _399 = _397.x;
        float _401 = _397.y;
        float _403 = _397.z;
        _383 = _329;
        _349 = _331;
        _351 = _333;
        _341 = _297;
        _377 = _403;
        _369 = _401;
        _361 = _301;
        _371 = _399;
        _355 = _299;
    }
    float _405 = _383;
    float _407 = _349;
    float _409 = _351;
    float _411 = _341;
    float _413 = _377;
    float _415 = _369;
    float _417 = _361;
    float _419 = _371;
    float _421 = _355;
    bool _423 = !_123;
    float _425 = _411;
    int _427 = as_type<int>(_415);
    int _429 = as_type<int>(_413);
    float _677;
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
    int _699;
    float _701;
    float _703;
    float _705;
    float _707;
    float _709;
    if (!_423)
    {
        float _431 = _405 * 0.15915493667125701904296875;
        float _433 = _407 * 0.15915493667125701904296875;
        float _435 = _409 * 0.15915493667125701904296875;
        float _437 = _203 * 0.15915493667125701904296875;
        float _439 = _431 * 6.283185482025146484375;
        float _441 = cos(_439);
        float _443 = _205 * 0.15915493667125701904296875;
        float _445 = _201 * 0.15915493667125701904296875;
        int _447 = _99 + 20;
        uint _449 = uint(int(uint(_447) >> uint(2)));
        uint _451 = uint(int(uint(int(_449)) >> uint(2)));
        int _453 = int(_449) & 3;
        float _455 = (*spvDescriptorSet0.cp_c5)._m0[int(_451)][_453];
        float _457 = _433 * 6.283185482025146484375;
        float _459 = cos(_457);
        int _461 = _99 + 28;
        uint _463 = uint(int(uint(_461) >> uint(2)));
        uint _465 = uint(int(uint(int(_463)) >> uint(2)));
        int _467 = int(_463) & 3;
        float _469 = (*spvDescriptorSet0.cp_c5)._m0[int(_465)][_467];
        float _471 = _435 * 6.283185482025146484375;
        float _473 = sin(_471);
        float _475 = _435 * 6.283185482025146484375;
        float _477 = cos(_475);
        float _479 = _441 * _459;
        float _481 = _431 * 6.283185482025146484375;
        float _483 = sin(_481);
        float _485 = _473 * _459;
        float _487 = _235 * _469;
        float _489 = _237 * _469;
        float _491 = _233 * _469;
        float _493 = _269 * _469;
        float _495 = _433 * 6.283185482025146484375;
        float _497 = sin(_495);
        float _499 = _441 * _477;
        float _501 = _473 * _441;
        float _503 = fma(_411, _455, _491);
        float _505 = fma(_413, _455, _493);
        float _507 = _437 * 6.283185482025146484375;
        float _509 = sin(_507);
        float _511 = _459 * _477;
        float _513 = _483 * _459;
        float _515 = _437 * 6.283185482025146484375;
        float _517 = cos(_515);
        float _519 = _483 * _497;
        float _521 = _443 * 6.283185482025146484375;
        float _523 = sin(_521);
        float _525 = _483 * _477;
        float _527 = -_501;
        float _529 = fma(_477, _519, _527);
        float _531 = fma(_473, _519, _499);
        float _533 = -_525;
        float _535 = fma(_497, _501, _533);
        float _537 = _443 * 6.283185482025146484375;
        float _539 = cos(_537);
        float _541 = _445 * 6.283185482025146484375;
        float _543 = cos(_541);
        float _545 = _483 * _473;
        float _547 = _523 * _517;
        float _549 = fma(_497, _499, _545);
        float _551 = _445 * 6.283185482025146484375;
        float _553 = sin(_551);
        float _555 = _517 * _539;
        float _557 = _555 * _469;
        float _559 = _543 * _539;
        float _561 = _523 * _543;
        float _563 = _543 * _517;
        float _565 = fma(_511, _455, _557);
        float _567 = _553 * _509;
        float _569 = _553 * _523;
        float _571 = _553 * _539;
        float _573 = _553 * _517;
        float _575 = -_561;
        float _577 = fma(_539, _567, _575);
        float _579 = fma(_523, _567, _559);
        float _581 = fma(_509, _559, _569);
        float _583 = _497 * _455;
        float _585 = -_571;
        float _587 = fma(_509, _561, _585);
        float _589 = _547 * _469;
        float _591 = _573 * _469;
        float _593 = -_509;
        float _595 = -_583;
        float _597 = fma(_593, _469, _595);
        float _599 = _577 * _469;
        float _601 = _579 * _469;
        float _603 = _581 * _469;
        float _605 = fma(_485, _455, _589);
        float _607 = fma(_529, _455, _599);
        float _609 = _587 * _469;
        float _611 = fma(_513, _455, _591);
        float _613 = fma(_531, _455, _601);
        float _615 = fma(_549, _455, _603);
        float _617 = fma(_535, _455, _609);
        float _619 = _605 * _605;
        float _621 = _563 * _469;
        float _623 = _613 * _613;
        float _625 = _617 * _617;
        float _627 = fma(_565, _565, _619);
        float _629 = fma(_479, _455, _621);
        float _631 = fma(_607, _607, _623);
        float _633 = fma(_615, _615, _625);
        float _635 = fma(_597, _597, _627);
        float _637 = _267 * _469;
        float _639 = fma(_611, _611, _631);
        float _641 = fma(_629, _629, _633);
        float _643 = rsqrt(_635);
        float _645 = _265 * _469;
        float _647 = fma(_415, _455, _637);
        float _649 = fma(_417, _455, _489);
        float _651 = fma(_419, _455, _645);
        float _653 = rsqrt(_641);
        float _655 = fma(_421, _455, _487);
        float _657 = rsqrt(_639);
        float _659 = _565 * _643;
        float _661 = _605 * _643;
        float _663 = _597 * _643;
        float _665 = _615 * _653;
        float _667 = _617 * _653;
        float _669 = _629 * _653;
        float _671 = _607 * _657;
        float _673 = _613 * _657;
        float _675 = _611 * _657;
        _425 = _503;
        _677 = _659;
        _679 = _661;
        _681 = _663;
        _683 = _655;
        _685 = _671;
        _687 = _673;
        _689 = _675;
        _691 = _649;
        _693 = _665;
        _695 = _667;
        _697 = _669;
        _699 = as_type<int>(_651);
        _427 = as_type<int>(_647);
        _429 = as_type<int>(_505);
        _701 = _629;
        _703 = _611;
        _705 = _653;
        _707 = _657;
        _709 = _645;
        _711 = true;
    }
    else
    {
        float _713 = _405 * 0.15915493667125701904296875;
        float _715 = _409 * 0.15915493667125701904296875;
        float _717 = _407 * 0.15915493667125701904296875;
        float _719 = _713 * 6.283185482025146484375;
        float _721 = cos(_719);
        float _723 = _715 * 6.283185482025146484375;
        float _725 = sin(_723);
        float _727 = _715 * 6.283185482025146484375;
        float _729 = cos(_727);
        float _731 = _717 * 6.283185482025146484375;
        float _733 = cos(_731);
        float _735 = _725 * _721;
        float _737 = _713 * 6.283185482025146484375;
        float _739 = sin(_737);
        float _741 = _721 * _729;
        float _743 = _717 * 6.283185482025146484375;
        float _745 = sin(_743);
        float _747 = _721 * _733;
        float _749 = _725 * _733;
        float _751 = _733 * _729;
        float _753 = _739 * _725;
        float _755 = _739 * _729;
        float _757 = _739 * _733;
        float _759 = _739 * _745;
        float _761 = -_755;
        float _763 = fma(_745, _735, _761);
        float _765 = -_745;
        float _767 = _765 + (-0.0);
        float _769 = -_735;
        float _771 = fma(_729, _759, _769);
        float _773 = fma(_725, _759, _741);
        float _775 = fma(_745, _741, _753);
        _677 = _751;
        _679 = _749;
        _681 = _767;
        _683 = _421;
        _685 = _771;
        _687 = _773;
        _689 = _757;
        _691 = _417;
        _693 = _775;
        _695 = _763;
        _697 = _747;
        _699 = as_type<int>(_419);
        _701 = _745;
        _703 = _733;
        _705 = _741;
        _707 = _729;
        _709 = _735;
    }
    _711 = false;
    float _777 = _425;
    float _779 = _677;
    float _781 = _679;
    float _783 = _681;
    float _785 = _683;
    float _787 = _685;
    float _789 = _687;
    float _791 = _689;
    float _793 = _691;
    float _795 = _693;
    float _797 = _695;
    float _799 = _697;
    int _801 = _699;
    int _803 = _427;
    int _805 = _429;
    float _807 = _701;
    float _809 = _703;
    float _811 = _705;
    float _813 = _707;
    float _815 = _709;
    float _817 = _777 * _779;
    float _819 = _777 * _781;
    float _821 = _777 * _783;
    float _823 = _785 * _787;
    float _825 = _785 * _789;
    float _827 = _785 * _791;
    int _829 = _66 * 48;
    float _831 = _793 * _795;
    float _833 = _793 * _797;
    float _835 = _793 * _799;
    bool _837 = _66 != 0;
    uint _839 = uint(int(uint(_829) >> uint(2)));
    _37[int(_839)] = as_type<uint>(_817);
    int _841 = _829 + 4;
    uint _843 = uint(int(uint(_841) >> uint(2)));
    _37[int(_843)] = as_type<uint>(_823);
    int _845 = _829 + 8;
    uint _847 = uint(int(uint(_845) >> uint(2)));
    _37[int(_847)] = as_type<uint>(_831);
    int _849 = _829 + 12;
    uint _851 = uint(int(uint(_849) >> uint(2)));
    _37[int(_851)] = uint(_801);
    int _853 = _66 * 112;
    int _855 = _829 + 16;
    uint _857 = uint(int(uint(_855) >> uint(2)));
    _37[int(_857)] = as_type<uint>(_819);
    int _859 = _829 + 20;
    uint _861 = uint(int(uint(_859) >> uint(2)));
    _37[int(_861)] = as_type<uint>(_825);
    int _863 = _829 + 24;
    uint _865 = uint(int(uint(_863) >> uint(2)));
    _37[int(_865)] = as_type<uint>(_833);
    int _867 = _829 + 28;
    uint _869 = uint(int(uint(_867) >> uint(2)));
    _37[int(_869)] = uint(_803);
    int _871 = _829 + 32;
    uint _873 = uint(int(uint(_871) >> uint(2)));
    _37[int(_873)] = as_type<uint>(_821);
    int _875 = _829 + 36;
    uint _877 = uint(int(uint(_875) >> uint(2)));
    _37[int(_877)] = as_type<uint>(_827);
    int _879 = _829 + 40;
    uint _881 = uint(int(uint(_879) >> uint(2)));
    _37[int(_881)] = as_type<uint>(_835);
    int _883 = _829 + 44;
    uint _885 = uint(int(uint(_883) >> uint(2)));
    _37[int(_885)] = uint(_805);
    float _887 = _815;
    float _889 = _813;
    float _891 = _811;
    float _893 = _809;
    float _895 = _777;
    float _897 = _807;
    float _899 = _793;
    float _901 = _785;
    float _903 = _797;
    float _905 = _827;
    float _907 = _835;
    float _909 = as_type<float>(_805);
    if (!_837)
    {
        _887 = _817;
    }
    float _911 = _887;
    float _913 = _911;
    if (!_837)
    {
        _889 = _823;
    }
    float _915 = _889;
    float _917 = _915;
    if (!_837)
    {
        _891 = _831;
    }
    float _919 = _891;
    float _921 = _919;
    if (!_837)
    {
        _893 = as_type<float>(_801);
    }
    float _923 = _893;
    float _925 = _923;
    if (!_837)
    {
        _895 = _819;
    }
    float _927 = _895;
    float _929 = _927;
    if (!_837)
    {
        _897 = _825;
    }
    float _931 = _897;
    float _933 = _931;
    if (!_837)
    {
        _899 = _833;
    }
    float _935 = _899;
    float _937 = _935;
    if (!_837)
    {
        _901 = as_type<float>(_803);
    }
    float _939 = _901;
    float _941 = _939;
    if (!_837)
    {
        _903 = _821;
    }
    float _943 = _903;
    bool _945 = !_837;
    float _947 = _943;
    if (!_945)
    {
        bool _949 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _951 = !_949;
        if (!_951)
        {
            uint _953 = uint(int(uint(_853) >> uint(2)));
            uint _955 = uint(int(uint(int(_953)) >> uint(2)));
            int _957 = int(_953) & 3;
            float _959 = (*spvDescriptorSet0.cp_c6)._m0[int(_955)][_957];
            int _961 = as_type<int>(_959) * 48;
            int _963 = 0;
            bool _965;
            float _1061;
            float _1065;
            float _1069;
            float _1073;
            float _1087;
            float _1089;
            float _1101;
            float _1111;
            float _1113;
            float _1115;
            float _1117;
            float _1119;
            do
            {
                int _967 = _963;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _969 = uint(int(uint(_961) >> uint(2)));
                float _971 = as_type<float>(_37[int(_969)]);
                int _973 = _961 + 4;
                uint _975 = uint(int(uint(_973) >> uint(2)));
                float _977 = as_type<float>(_37[int(_975)]);
                int _979 = _961 + 8;
                uint _981 = uint(int(uint(_979) >> uint(2)));
                float _983 = as_type<float>(_37[int(_981)]);
                int _985 = _961 + 12;
                uint _987 = uint(int(uint(_985) >> uint(2)));
                float _989 = as_type<float>(_37[int(_987)]);
                int _991 = _967 + 1;
                int _993 = _961 + 16;
                uint _995 = uint(int(uint(_993) >> uint(2)));
                float _997 = as_type<float>(_37[int(_995)]);
                int _999 = _961 + 20;
                uint _1001 = uint(int(uint(_999) >> uint(2)));
                float _1003 = as_type<float>(_37[int(_1001)]);
                int _1005 = _961 + 24;
                uint _1007 = uint(int(uint(_1005) >> uint(2)));
                float _1009 = as_type<float>(_37[int(_1007)]);
                int _1011 = _961 + 28;
                uint _1013 = uint(int(uint(_1011) >> uint(2)));
                float _1015 = as_type<float>(_37[int(_1013)]);
                bool _1017 = uint(_991) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1019 = _961 + 32;
                uint _1021 = uint(int(uint(_1019) >> uint(2)));
                float _1023 = as_type<float>(_37[int(_1021)]);
                int _1025 = _961 + 36;
                uint _1027 = uint(int(uint(_1025) >> uint(2)));
                float _1029 = as_type<float>(_37[int(_1027)]);
                int _1031 = _961 + 40;
                uint _1033 = uint(int(uint(_1031) >> uint(2)));
                float _1035 = as_type<float>(_37[int(_1033)]);
                int _1037 = _961 + 44;
                uint _1039 = uint(int(uint(_1037) >> uint(2)));
                float _1041 = as_type<float>(_37[int(_1039)]);
                float _1043 = _977 * as_type<float>(_803);
                float _1045 = _819 * _977;
                float _1047 = _825 * _977;
                float _1049 = _833 * _977;
                float _1051 = fma(_971, as_type<float>(_801), _1043);
                float _1053 = fma(_817, _971, _1045);
                float _1055 = fma(_823, _971, _1047);
                float _1057 = fma(_831, _971, _1049);
                float _1059 = fma(_983, as_type<float>(_805), _1051);
                _1061 = fma(_821, _983, _1053);
                float _1063 = _819 * _1003;
                _1065 = fma(_835, _983, _1057);
                float _1067 = _1003 * as_type<float>(_803);
                _1069 = _989 + _1059;
                float _1071 = _825 * _1003;
                _1073 = fma(_827, _983, _1055);
                float _1075 = fma(_997, as_type<float>(_801), _1067);
                float _1077 = fma(_817, _997, _1063);
                float _1079 = fma(_823, _997, _1071);
                float _1081 = _833 * _1003;
                float _1083 = fma(_1009, as_type<float>(_805), _1075);
                float _1085 = _1029 * as_type<float>(_803);
                _1087 = fma(_821, _1009, _1077);
                _1089 = fma(_827, _1009, _1079);
                float _1091 = _819 * _1029;
                float _1093 = _825 * _1029;
                float _1095 = _833 * _1029;
                float _1097 = fma(_1023, as_type<float>(_801), _1085);
                float _1099 = fma(_831, _997, _1081);
                _1101 = _1015 + _1083;
                float _1103 = fma(_817, _1023, _1091);
                float _1105 = fma(_823, _1023, _1093);
                float _1107 = fma(_831, _1023, _1095);
                float _1109 = fma(_1035, as_type<float>(_805), _1097);
                _1111 = fma(_835, _1009, _1099);
                _1113 = fma(_821, _1035, _1103);
                _1115 = fma(_827, _1035, _1105);
                _1117 = fma(_835, _1035, _1107);
                _1119 = _1041 + _1109;
                uint _1121 = uint(int(uint(_829) >> uint(2)));
                _37[int(_1121)] = as_type<uint>(_1061);
                int _1123 = _829 + 4;
                uint _1125 = uint(int(uint(_1123) >> uint(2)));
                _37[int(_1125)] = as_type<uint>(_1073);
                int _1127 = _829 + 8;
                uint _1129 = uint(int(uint(_1127) >> uint(2)));
                _37[int(_1129)] = as_type<uint>(_1065);
                int _1131 = _829 + 12;
                uint _1133 = uint(int(uint(_1131) >> uint(2)));
                _37[int(_1133)] = as_type<uint>(_1069);
                int _1135 = _829 + 16;
                uint _1137 = uint(int(uint(_1135) >> uint(2)));
                _37[int(_1137)] = as_type<uint>(_1087);
                int _1139 = _829 + 20;
                uint _1141 = uint(int(uint(_1139) >> uint(2)));
                _37[int(_1141)] = as_type<uint>(_1089);
                int _1143 = _829 + 24;
                uint _1145 = uint(int(uint(_1143) >> uint(2)));
                _37[int(_1145)] = as_type<uint>(_1111);
                int _1147 = _829 + 28;
                uint _1149 = uint(int(uint(_1147) >> uint(2)));
                _37[int(_1149)] = as_type<uint>(_1101);
                int _1151 = _829 + 32;
                uint _1153 = uint(int(uint(_1151) >> uint(2)));
                _37[int(_1153)] = as_type<uint>(_1113);
                int _1155 = _829 + 36;
                uint _1157 = uint(int(uint(_1155) >> uint(2)));
                _37[int(_1157)] = as_type<uint>(_1115);
                int _1159 = _829 + 40;
                uint _1161 = uint(int(uint(_1159) >> uint(2)));
                _37[int(_1161)] = as_type<uint>(_1117);
                int _1163 = _829 + 44;
                uint _1165 = uint(int(uint(_1163) >> uint(2)));
                _37[int(_1165)] = as_type<uint>(_1119);
                _965 = !_1017;
                _963 = _991;
            } while (_965);
            _905 = _1115;
            _917 = _1073;
            _933 = _1089;
            _947 = _1113;
            _913 = _1061;
            _929 = _1087;
            _937 = _1111;
            _907 = _1117;
            _921 = _1065;
            _941 = _1101;
            _925 = _1069;
            _909 = _1119;
            _1167 = true;
        }
        else
        {
            _905 = 0.0;
            _917 = 0.0;
            _933 = 0.0;
            _947 = 0.0;
            _913 = 0.0;
            _929 = 0.0;
            _937 = 0.0;
            _907 = 0.0;
            _921 = 0.0;
            _941 = 0.0;
            _925 = 0.0;
            _909 = 0.0;
        }
    }
    _1167 = false;
    float _1169 = _905;
    float _1171 = _917;
    float _1173 = _933;
    float _1175 = _947;
    float _1177 = _913;
    float _1179 = _929;
    float _1181 = _937;
    float _1183 = _907;
    float _1185 = _921;
    float _1187 = _941;
    float _1189 = _925;
    float _1191 = _909;
    int _1193 = _853 + 80;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    uint _1197 = uint(int(uint(int(_1195)) >> uint(2)));
    int _1199 = int(_1195) & 3;
    float _1201 = (*spvDescriptorSet0.cp_c6)._m0[int(_1197)][_1199];
    int _1203 = int(_1195) + 1;
    uint _1205 = uint(int(uint(_1203) >> uint(2)));
    int _1207 = _1203 & 3;
    float _1209 = (*spvDescriptorSet0.cp_c6)._m0[int(_1205)][_1207];
    int _1211 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1213 = _1211 + _66;
    int _1215 = _853 + 64;
    uint _1217 = uint(int(uint(_1215) >> uint(2)));
    uint _1219 = uint(int(uint(int(_1217)) >> uint(2)));
    int _1221 = int(_1217) & 3;
    float _1223 = (*spvDescriptorSet0.cp_c6)._m0[int(_1219)][_1221];
    int _1225 = int(_1217) + 1;
    uint _1227 = uint(int(uint(_1225) >> uint(2)));
    int _1229 = _1225 & 3;
    float _1231 = (*spvDescriptorSet0.cp_c6)._m0[int(_1227)][_1229];
    int _1233 = _1213 * 48;
    int _1235 = _853 + 88;
    uint _1237 = uint(int(uint(_1235) >> uint(2)));
    uint _1239 = uint(int(uint(int(_1237)) >> uint(2)));
    int _1241 = int(_1237) & 3;
    float _1243 = (*spvDescriptorSet0.cp_c6)._m0[int(_1239)][_1241];
    int _1245 = int(_1237) + 1;
    uint _1247 = uint(int(uint(_1245) >> uint(2)));
    int _1249 = _1245 & 3;
    float _1251 = (*spvDescriptorSet0.cp_c6)._m0[int(_1247)][_1249];
    int _1253 = _853 + 72;
    uint _1255 = uint(int(uint(_1253) >> uint(2)));
    uint _1257 = uint(int(uint(int(_1255)) >> uint(2)));
    int _1259 = int(_1255) & 3;
    float _1261 = (*spvDescriptorSet0.cp_c6)._m0[int(_1257)][_1259];
    int _1263 = int(_1255) + 1;
    uint _1265 = uint(int(uint(_1263) >> uint(2)));
    int _1267 = _1263 & 3;
    float _1269 = (*spvDescriptorSet0.cp_c6)._m0[int(_1265)][_1267];
    int _1271 = _853 + 96;
    uint _1273 = uint(int(uint(_1271) >> uint(2)));
    uint _1275 = uint(int(uint(int(_1273)) >> uint(2)));
    int _1277 = int(_1273) & 3;
    float _1279 = (*spvDescriptorSet0.cp_c6)._m0[int(_1275)][_1277];
    int _1281 = int(_1273) + 1;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    int _1285 = _1281 & 3;
    float _1287 = (*spvDescriptorSet0.cp_c6)._m0[int(_1283)][_1285];
    int _1289 = _853 + 104;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    uint _1293 = uint(int(uint(int(_1291)) >> uint(2)));
    int _1295 = int(_1291) & 3;
    float _1297 = (*spvDescriptorSet0.cp_c6)._m0[int(_1293)][_1295];
    int _1299 = int(_1291) + 1;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    int _1303 = _1299 & 3;
    float _1305 = (*spvDescriptorSet0.cp_c6)._m0[int(_1301)][_1303];
    float _1307 = _1169 * _1201;
    int _1309 = _853 + 16;
    uint _1311 = uint(int(uint(_1309) >> uint(2)));
    uint _1313 = uint(int(uint(int(_1311)) >> uint(2)));
    int _1315 = int(_1311) & 3;
    float _1317 = (*spvDescriptorSet0.cp_c6)._m0[int(_1313)][_1315];
    int _1319 = int(_1311) + 1;
    uint _1321 = uint(int(uint(_1319) >> uint(2)));
    int _1323 = _1319 & 3;
    float _1325 = (*spvDescriptorSet0.cp_c6)._m0[int(_1321)][_1323];
    float _1327 = _1171 * _1201;
    float _1329 = _1173 * _1201;
    float _1331 = _1173 * _1209;
    float _1333 = fma(_1175, _1223, _1307);
    float _1335 = _1169 * _1209;
    int _1337 = _853 + 32;
    uint _1339 = uint(int(uint(_1337) >> uint(2)));
    uint _1341 = uint(int(uint(int(_1339)) >> uint(2)));
    int _1343 = int(_1339) & 3;
    float _1345 = (*spvDescriptorSet0.cp_c6)._m0[int(_1341)][_1343];
    int _1347 = int(_1339) + 1;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    int _1351 = _1347 & 3;
    float _1353 = (*spvDescriptorSet0.cp_c6)._m0[int(_1349)][_1351];
    float _1355 = fma(_1177, _1223, _1327);
    float _1357 = fma(_1179, _1223, _1329);
    float _1359 = fma(_1179, _1231, _1331);
    float _1361 = _1171 * _1209;
    float _1363 = fma(_1175, _1231, _1335);
    float _1365 = _1171 * _1243;
    float _1367 = _1173 * _1243;
    int _1369 = _853 + 48;
    uint _1371 = uint(int(uint(_1369) >> uint(2)));
    uint _1373 = uint(int(uint(int(_1371)) >> uint(2)));
    int _1375 = int(_1371) & 3;
    float _1377 = (*spvDescriptorSet0.cp_c6)._m0[int(_1373)][_1375];
    int _1379 = int(_1371) + 1;
    uint _1381 = uint(int(uint(_1379) >> uint(2)));
    int _1383 = _1379 & 3;
    float _1385 = (*spvDescriptorSet0.cp_c6)._m0[int(_1381)][_1383];
    float _1387 = _1171 * _1251;
    float _1389 = _1173 * _1251;
    float _1391 = _1169 * _1243;
    float _1393 = _1169 * _1251;
    float _1395 = fma(_1177, _1231, _1361);
    float _1397 = fma(_1179, _1261, _1367);
    float _1399 = fma(_1179, _1269, _1389);
    int _1401 = _853 + 24;
    uint _1403 = uint(int(uint(_1401) >> uint(2)));
    uint _1405 = uint(int(uint(int(_1403)) >> uint(2)));
    int _1407 = int(_1403) & 3;
    float _1409 = (*spvDescriptorSet0.cp_c6)._m0[int(_1405)][_1407];
    int _1411 = int(_1403) + 1;
    uint _1413 = uint(int(uint(_1411) >> uint(2)));
    int _1415 = _1411 & 3;
    float _1417 = (*spvDescriptorSet0.cp_c6)._m0[int(_1413)][_1415];
    float _1419 = fma(_1177, _1261, _1365);
    float _1421 = fma(_1177, _1269, _1387);
    float _1423 = fma(_1175, _1261, _1391);
    float _1425 = fma(_1175, _1269, _1393);
    float _1427 = fma(_1181, _1279, _1357);
    float _1429 = fma(_1181, _1287, _1359);
    int _1431 = _853 + 40;
    uint _1433 = uint(int(uint(_1431) >> uint(2)));
    uint _1435 = uint(int(uint(int(_1433)) >> uint(2)));
    int _1437 = int(_1433) & 3;
    float _1439 = (*spvDescriptorSet0.cp_c6)._m0[int(_1435)][_1437];
    int _1441 = int(_1433) + 1;
    uint _1443 = uint(int(uint(_1441) >> uint(2)));
    int _1445 = _1441 & 3;
    float _1447 = (*spvDescriptorSet0.cp_c6)._m0[int(_1443)][_1445];
    float _1449 = fma(_1183, _1279, _1333);
    float _1451 = fma(_1185, _1279, _1355);
    float _1453 = fma(_1185, _1287, _1395);
    float _1455 = fma(_1183, _1287, _1363);
    float _1457 = fma(_1181, _1297, _1397);
    float _1459 = fma(_1181, _1305, _1399);
    int _1461 = _853 + 56;
    uint _1463 = uint(int(uint(_1461) >> uint(2)));
    uint _1465 = uint(int(uint(int(_1463)) >> uint(2)));
    int _1467 = int(_1463) & 3;
    float _1469 = (*spvDescriptorSet0.cp_c6)._m0[int(_1465)][_1467];
    int _1471 = int(_1463) + 1;
    uint _1473 = uint(int(uint(_1471) >> uint(2)));
    int _1475 = _1471 & 3;
    float _1477 = (*spvDescriptorSet0.cp_c6)._m0[int(_1473)][_1475];
    float _1479 = fma(_1185, _1297, _1419);
    float _1481 = fma(_1185, _1305, _1421);
    float _1483 = _1459 + _1187;
    float _1485 = fma(_1183, _1305, _1425);
    float _1487 = fma(_1183, _1297, _1423);
    float _1489 = _1481 + _1189;
    float _1491 = _1483 * _1325;
    float _1493 = _1485 + _1191;
    float _1495 = _1427 * _1325;
    float _1497 = _1429 * _1325;
    float _1499 = fma(_1489, _1317, _1491);
    float _1501 = _1457 * _1325;
    float _1503 = fma(_1451, _1317, _1495);
    float _1505 = fma(_1453, _1317, _1497);
    float _1507 = _1427 * _1353;
    float _1509 = _1483 * _1353;
    float _1511 = _1429 * _1353;
    float _1513 = _1457 * _1353;
    float _1515 = fma(_1451, _1345, _1507);
    float _1517 = fma(_1489, _1345, _1509);
    float _1519 = fma(_1479, _1317, _1501);
    float _1521 = fma(_1479, _1345, _1513);
    float _1523 = _1427 * _1385;
    float _1525 = _1483 * _1385;
    float _1527 = _1429 * _1385;
    float _1529 = _1457 * _1385;
    float _1531 = fma(_1451, _1377, _1523);
    float _1533 = fma(_1489, _1377, _1525);
    float _1535 = fma(_1453, _1377, _1527);
    float _1537 = fma(_1479, _1377, _1529);
    float _1539 = fma(_1493, _1409, _1499);
    float _1541 = fma(_1453, _1345, _1511);
    float _1543 = fma(_1455, _1409, _1505);
    float _1545 = fma(_1449, _1409, _1503);
    float _1547 = _1539 + _1417;
    float _1549 = fma(_1487, _1409, _1519);
    float _1551 = fma(_1493, _1439, _1517);
    float _1553 = fma(_1449, _1439, _1515);
    float _1555 = fma(_1487, _1439, _1521);
    float _1557 = fma(_1455, _1439, _1541);
    float _1559 = _1551 + _1447;
    float _1561 = fma(_1493, _1469, _1533);
    float _1563 = fma(_1449, _1469, _1531);
    float _1565 = fma(_1455, _1469, _1535);
    float _1567 = fma(_1487, _1469, _1537);
    int _1569 = _1233 + 16;
    float _1571 = _1561 + _1477;
    int _1573 = _1233 + 32;
    int _1575 = _1233 + 48;
    uint _1577 = uint(int(uint(_1569) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1577)] = as_type<uint>(_1545);
    int _1579 = _1569 + 4;
    uint _1581 = uint(int(uint(_1579) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1581)] = as_type<uint>(_1543);
    int _1583 = _1569 + 8;
    uint _1585 = uint(int(uint(_1583) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1585)] = as_type<uint>(_1549);
    int _1587 = _1569 + 12;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1589)] = as_type<uint>(_1547);
    uint _1591 = uint(int(uint(_1573) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1591)] = as_type<uint>(_1553);
    int _1593 = _1573 + 4;
    uint _1595 = uint(int(uint(_1593) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1595)] = as_type<uint>(_1557);
    int _1597 = _1573 + 8;
    uint _1599 = uint(int(uint(_1597) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1599)] = as_type<uint>(_1555);
    int _1601 = _1573 + 12;
    uint _1603 = uint(int(uint(_1601) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1603)] = as_type<uint>(_1559);
    uint _1605 = uint(int(uint(_1575) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1605)] = as_type<uint>(_1563);
    int _1607 = _1575 + 4;
    uint _1609 = uint(int(uint(_1607) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1609)] = as_type<uint>(_1565);
    int _1611 = _1575 + 8;
    uint _1613 = uint(int(uint(_1611) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1613)] = as_type<uint>(_1567);
    int _1615 = _1575 + 12;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1617)] = as_type<uint>(_1571);
}

