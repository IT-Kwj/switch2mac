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
int _56(thread const int& _3731, thread const int& _3732, constant _10& support_buffer)
{
    int _3735 = 1 + _3732;
    float _3737 = support_buffer._m5[_3735].x;
    bool _3739 = _3737 == 1.0;
    if (_3739)
    {
        return _3731;
    }
    float _3741 = float(_3731);
    float _3743 = _3741 * _3737;
    int _3745 = int(_3743);
    return _3745;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1039 = false;
    bool _581 = false;
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
    if (_123)
    {
        int _135 = _99 + 8;
        uint _137 = uint(int(uint(_135) >> uint(2)));
        uint _139 = uint(int(uint(int(_137)) >> uint(2)));
        int _141 = int(_137) & 3;
        float _143 = (*spvDescriptorSet0.cp_c5)._m0[int(_139)][_141];
        _129 = as_type<int>(_143);
    }
    int _145 = _129;
    float _147 = 0.0;
    if (_123)
    {
        _147 = 1.4012984643248170709237295832899e-45;
    }
    float _149 = _147;
    float _151 = 0.0;
    if (_123)
    {
        _151 = 2.8025969286496341418474591665798e-45;
    }
    float _153 = _151;
    int _155 = 0;
    if (_127)
    {
        uint _157 = uint(int(uint(_99) >> uint(2)));
        uint _159 = uint(int(uint(int(_157)) >> uint(2)));
        int _161 = int(_157) & 3;
        float _163 = (*spvDescriptorSet0.cp_c5)._m0[int(_159)][_161];
        _155 = as_type<int>(_163);
    }
    int _165 = _155;
    float _167 = 0.0;
    if (_127)
    {
        _167 = 1.4012984643248170709237295832899e-45;
    }
    float _169 = _167;
    float _171 = _149;
    float _173 = as_type<float>(_66);
    float _175 = 0.0;
    float _177 = as_type<float>(_145);
    if (_123)
    {
        int _179 = _66;
        int _181 = 0;
        int _183 = _56(_179, _181, (*spvDescriptorSet0.support_buffer));
        int _185 = _145;
        int _187 = 0;
        int _189 = _56(_185, _187, (*spvDescriptorSet0.support_buffer));
        int3 _1693 = int3(_183, _189, as_type<int>(_149));
        float3 _193 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1693.xy), uint(_1693.z), 0).xyz;
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
    float _209 = as_type<float>(_66);
    float _211 = 0.0;
    if (_123)
    {
        int _213 = _66;
        int _215 = 0;
        int _217 = _56(_213, _215, (*spvDescriptorSet0.support_buffer));
        int _219 = _145;
        int _221 = 0;
        int _223 = _56(_219, _221, (*spvDescriptorSet0.support_buffer));
        int3 _1721 = int3(_217, _223, 0);
        float3 _225 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1721.xy), uint(_1721.z), 0).xyz;
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
    float _239 = _153;
    float _241 = as_type<float>(_66);
    float _243 = 0.0;
    if (_123)
    {
        int _245 = _66;
        int _247 = 0;
        int _249 = _56(_245, _247, (*spvDescriptorSet0.support_buffer));
        int _251 = _145;
        int _253 = 0;
        int _255 = _56(_251, _253, (*spvDescriptorSet0.support_buffer));
        int3 _1752 = int3(_249, _255, as_type<int>(_153));
        float3 _257 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1752.xy), uint(_1752.z), 0).xyz;
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
        int _283 = _165;
        int _285 = 1;
        int _287 = _56(_283, _285, (*spvDescriptorSet0.support_buffer));
        int3 _1780 = int3(_281, _287, 0);
        float3 _289 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1780.xy), uint(_1780.z), 0).xyz;
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
    float _305 = _109;
    float _307 = _169;
    if (_127)
    {
        int _309 = _66;
        int _311 = 1;
        int _313 = _56(_309, _311, (*spvDescriptorSet0.support_buffer));
        int _315 = _165;
        int _317 = 1;
        int _319 = _56(_315, _317, (*spvDescriptorSet0.support_buffer));
        int3 _1810 = int3(_313, _319, as_type<int>(_169));
        float3 _321 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1810.xy), uint(_1810.z), 0).xyz;
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
    float _341 = 0.0;
    float _343 = _337;
    if (!_127)
    {
        _339 = 0.0;
        _341 = 0.0;
    }
    float _345 = _339;
    float _347 = _341;
    float _349 = 0.0;
    float _351 = _345;
    float _353 = _347;
    if (!_127)
    {
        _349 = 0.0;
    }
    float _355 = _349;
    float _357 = _355;
    if (!_127)
    {
        _131 = 0.0;
        _133 = 0.0;
    }
    float _359 = _131;
    float _361 = _133;
    float _363 = 0.0;
    float _365 = _359;
    float _367 = _361;
    if (!_127)
    {
        _363 = 0.0;
    }
    float _369 = _363;
    float _371 = 0.0;
    float _373 = _369;
    if (!_127)
    {
        _371 = 0.0;
        _177 = 0.0;
    }
    float _375 = _371;
    float _377 = _177;
    bool _379 = !_127;
    float _381 = _375;
    float _383 = _377;
    float _385 = _201;
    if (!_379)
    {
        int _387 = _66;
        int _389 = 1;
        int _391 = _56(_387, _389, (*spvDescriptorSet0.support_buffer));
        int _393 = _165;
        int _395 = 1;
        int _397 = _56(_393, _395, (*spvDescriptorSet0.support_buffer));
        int3 _1882 = int3(_391, _397, 2);
        float3 _399 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1882.xy), uint(_1882.z), 0).xyz;
        float _401 = _399.x;
        float _403 = _399.y;
        float _405 = _399.z;
        _365 = _333;
        _373 = _329;
        _351 = _299;
        _367 = _331;
        _353 = _301;
        _343 = _297;
        _381 = _401;
        _357 = _405;
        _383 = _403;
    }
    float _407 = _365;
    float _409 = _373;
    float _411 = _351;
    float _413 = _367;
    float _415 = _353;
    float _417 = _343;
    float _419 = _381;
    float _421 = _357;
    float _423 = _383;
    bool _425 = !_123;
    float _427 = _417;
    float _429 = _411;
    float _431 = _415;
    int _433 = as_type<int>(_421);
    float _435 = _423;
    float _437 = _419;
    float _555;
    float _557;
    float _559;
    float _561;
    float _563;
    float _565;
    float _567;
    float _569;
    float _571;
    int _573;
    int _575;
    float _577;
    float _579;
    if (!_425)
    {
        int _439 = _99 + 28;
        uint _441 = uint(int(uint(_439) >> uint(2)));
        uint _443 = uint(int(uint(int(_441)) >> uint(2)));
        int _445 = int(_441) & 3;
        float _447 = (*spvDescriptorSet0.cp_c5)._m0[int(_443)][_445];
        int _449 = _99 + 20;
        uint _451 = uint(int(uint(_449) >> uint(2)));
        uint _453 = uint(int(uint(int(_451)) >> uint(2)));
        int _455 = int(_451) & 3;
        float _457 = (*spvDescriptorSet0.cp_c5)._m0[int(_453)][_455];
        float _459 = _205 * _447;
        float _461 = _201 * _447;
        float _463 = _235 * _447;
        float _465 = _237 * _447;
        float _467 = _233 * _447;
        float _469 = _265 * _447;
        float _471 = _269 * _447;
        float _473 = fma(_407, _457, _459);
        float _475 = _203 * _447;
        float _477 = fma(_409, _457, _461);
        float _479 = fma(_411, _457, _463);
        float _481 = _473 * 0.15915493667125701904296875;
        float _483 = fma(_413, _457, _475);
        float _485 = _477 * 0.15915493667125701904296875;
        float _487 = fma(_415, _457, _465);
        float _489 = _481 * 6.283185482025146484375;
        float _491 = sin(_489);
        float _493 = _483 * 0.15915493667125701904296875;
        float _495 = fma(_417, _457, _467);
        float _497 = fma(_419, _457, _469);
        float _499 = fma(_421, _457, _471);
        float _501 = _485 * 6.283185482025146484375;
        float _503 = sin(_501);
        float _505 = _485 * 6.283185482025146484375;
        float _507 = cos(_505);
        float _509 = _481 * 6.283185482025146484375;
        float _511 = cos(_509);
        float _513 = _267 * _447;
        float _515 = fma(_423, _457, _513);
        float _517 = _493 * 6.283185482025146484375;
        float _519 = cos(_517);
        float _521 = _491 * _507;
        float _523 = _493 * 6.283185482025146484375;
        float _525 = sin(_523);
        float _527 = _507 * _511;
        float _529 = _507 * _519;
        float _531 = _519 * _511;
        float _533 = _491 * _519;
        float _535 = _503 * _519;
        float _537 = _503 * _491;
        float _539 = _503 * _511;
        float _541 = _503 * _525;
        float _543 = -_539;
        float _545 = fma(_525, _521, _543);
        float _547 = fma(_491, _541, _527);
        float _549 = -_521;
        float _551 = fma(_511, _541, _549);
        float _553 = fma(_525, _527, _537);
        _427 = _495;
        _555 = _525;
        _557 = _531;
        _559 = _533;
        _429 = _479;
        _561 = _551;
        _563 = _547;
        _565 = _535;
        _431 = _487;
        _567 = _553;
        _569 = _545;
        _571 = _529;
        _573 = as_type<int>(_497);
        _575 = as_type<int>(_515);
        _433 = as_type<int>(_499);
        _577 = _471;
        _435 = _527;
        _579 = _541;
        _581 = true;
    }
    else
    {
        float _583 = _409 * 0.15915493667125701904296875;
        float _585 = _407 * 0.15915493667125701904296875;
        float _587 = _413 * 0.15915493667125701904296875;
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
        _561 = _637;
        _563 = _639;
        _565 = _623;
        _567 = _641;
        _569 = _633;
        _571 = _617;
        _573 = as_type<int>(_419);
        _575 = as_type<int>(_423);
        _577 = _587;
        _385 = _585;
        _579 = _605;
    }
    _581 = false;
    float _643 = _427;
    float _645 = _555;
    float _647 = _557;
    float _649 = _559;
    float _651 = _429;
    float _653 = _561;
    float _655 = _563;
    float _657 = _565;
    float _659 = _431;
    float _661 = _567;
    float _663 = _569;
    float _665 = _571;
    int _667 = _573;
    int _669 = _575;
    int _671 = _433;
    float _673 = _577;
    float _675 = _435;
    float _677 = _385;
    float _679 = _579;
    float _681 = _643 * _645;
    float _683 = _643 * _647;
    float _685 = _643 * _649;
    float _687 = _651 * _653;
    float _689 = _651 * _655;
    float _691 = _651 * _657;
    int _693 = _66 * 48;
    float _695 = _659 * _661;
    float _697 = _659 * _663;
    float _699 = _659 * _665;
    float _701 = -_681;
    float _703 = _701 + (-0.0);
    bool _705 = _66 != 0;
    uint _707 = uint(int(uint(_693) >> uint(2)));
    _37[int(_707)] = as_type<uint>(_683);
    int _709 = _693 + 4;
    uint _711 = uint(int(uint(_709) >> uint(2)));
    _37[int(_711)] = as_type<uint>(_687);
    int _713 = _693 + 8;
    uint _715 = uint(int(uint(_713) >> uint(2)));
    _37[int(_715)] = as_type<uint>(_695);
    int _717 = _693 + 12;
    uint _719 = uint(int(uint(_717) >> uint(2)));
    _37[int(_719)] = uint(_667);
    int _721 = _66 * 112;
    int _723 = _693 + 16;
    uint _725 = uint(int(uint(_723) >> uint(2)));
    _37[int(_725)] = as_type<uint>(_685);
    int _727 = _693 + 20;
    uint _729 = uint(int(uint(_727) >> uint(2)));
    _37[int(_729)] = as_type<uint>(_689);
    int _731 = _693 + 24;
    uint _733 = uint(int(uint(_731) >> uint(2)));
    _37[int(_733)] = as_type<uint>(_697);
    int _735 = _693 + 28;
    uint _737 = uint(int(uint(_735) >> uint(2)));
    _37[int(_737)] = uint(_669);
    int _739 = _693 + 32;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    _37[int(_741)] = as_type<uint>(_703);
    int _743 = _693 + 36;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    _37[int(_745)] = as_type<uint>(_691);
    int _747 = _693 + 40;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    _37[int(_749)] = as_type<uint>(_699);
    int _751 = _693 + 44;
    uint _753 = uint(int(uint(_751) >> uint(2)));
    _37[int(_753)] = uint(_671);
    float _755 = _679;
    float _757 = _677;
    float _759 = _675;
    float _761 = _643;
    float _763 = _673;
    float _765 = _659;
    float _767 = _651;
    float _769 = _647;
    float _771 = _703;
    float _773 = _699;
    float _775 = as_type<float>(_671);
    if (!_705)
    {
        _755 = _683;
    }
    float _777 = _755;
    float _779 = _777;
    if (!_705)
    {
        _757 = _687;
    }
    float _781 = _757;
    float _783 = _781;
    if (!_705)
    {
        _759 = _695;
    }
    float _785 = _759;
    float _787 = _785;
    if (!_705)
    {
        _437 = as_type<float>(_667);
    }
    float _789 = _437;
    float _791 = _789;
    if (!_705)
    {
        _761 = _685;
    }
    float _793 = _761;
    float _795 = _793;
    if (!_705)
    {
        _763 = _689;
    }
    float _797 = _763;
    float _799 = _797;
    if (!_705)
    {
        _765 = _697;
    }
    float _801 = _765;
    float _803 = _801;
    if (!_705)
    {
        _767 = as_type<float>(_669);
    }
    float _805 = _767;
    float _807 = _805;
    if (!_705)
    {
        _769 = _691;
    }
    float _809 = _769;
    bool _811 = !_705;
    float _813 = _809;
    if (!_811)
    {
        bool _815 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _817 = !_815;
        if (!_817)
        {
            uint _819 = uint(int(uint(_721) >> uint(2)));
            uint _821 = uint(int(uint(int(_819)) >> uint(2)));
            int _823 = int(_819) & 3;
            float _825 = (*spvDescriptorSet0.cp_c6)._m0[int(_821)][_823];
            int _827 = as_type<int>(_825) * 48;
            int _829 = 0;
            bool _831;
            float _929;
            float _931;
            float _933;
            float _941;
            float _957;
            float _959;
            float _971;
            float _981;
            float _985;
            float _987;
            float _989;
            float _991;
            do
            {
                int _833 = _829;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _835 = uint(int(uint(_827) >> uint(2)));
                float _837 = as_type<float>(_37[int(_835)]);
                int _839 = _827 + 4;
                uint _841 = uint(int(uint(_839) >> uint(2)));
                float _843 = as_type<float>(_37[int(_841)]);
                int _845 = _827 + 8;
                uint _847 = uint(int(uint(_845) >> uint(2)));
                float _849 = as_type<float>(_37[int(_847)]);
                int _851 = _827 + 12;
                uint _853 = uint(int(uint(_851) >> uint(2)));
                float _855 = as_type<float>(_37[int(_853)]);
                int _857 = _833 + 1;
                int _859 = _827 + 16;
                uint _861 = uint(int(uint(_859) >> uint(2)));
                float _863 = as_type<float>(_37[int(_861)]);
                int _865 = _827 + 20;
                uint _867 = uint(int(uint(_865) >> uint(2)));
                float _869 = as_type<float>(_37[int(_867)]);
                int _871 = _827 + 24;
                uint _873 = uint(int(uint(_871) >> uint(2)));
                float _875 = as_type<float>(_37[int(_873)]);
                int _877 = _827 + 28;
                uint _879 = uint(int(uint(_877) >> uint(2)));
                float _881 = as_type<float>(_37[int(_879)]);
                bool _883 = uint(_857) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _885 = _827 + 32;
                uint _887 = uint(int(uint(_885) >> uint(2)));
                float _889 = as_type<float>(_37[int(_887)]);
                int _891 = _827 + 36;
                uint _893 = uint(int(uint(_891) >> uint(2)));
                float _895 = as_type<float>(_37[int(_893)]);
                int _897 = _827 + 40;
                uint _899 = uint(int(uint(_897) >> uint(2)));
                float _901 = as_type<float>(_37[int(_899)]);
                int _903 = _827 + 44;
                uint _905 = uint(int(uint(_903) >> uint(2)));
                float _907 = as_type<float>(_37[int(_905)]);
                float _909 = _843 * as_type<float>(_669);
                float _911 = _685 * _843;
                float _913 = _689 * _843;
                float _915 = _697 * _843;
                float _917 = fma(_837, as_type<float>(_667), _909);
                float _919 = fma(_683, _837, _911);
                float _921 = fma(_687, _837, _913);
                float _923 = fma(_695, _837, _915);
                float _925 = fma(_849, as_type<float>(_671), _917);
                float _927 = -_681;
                _929 = fma(_927, _849, _919);
                _931 = fma(_691, _849, _921);
                _933 = fma(_699, _849, _923);
                float _935 = _869 * as_type<float>(_669);
                float _937 = _685 * _869;
                float _939 = _689 * _869;
                _941 = _855 + _925;
                float _943 = fma(_863, as_type<float>(_667), _935);
                float _945 = fma(_683, _863, _937);
                float _947 = fma(_687, _863, _939);
                float _949 = _697 * _869;
                float _951 = fma(_875, as_type<float>(_671), _943);
                float _953 = _895 * as_type<float>(_669);
                float _955 = -_681;
                _957 = fma(_955, _875, _945);
                _959 = fma(_691, _875, _947);
                float _961 = _685 * _895;
                float _963 = _689 * _895;
                float _965 = _697 * _895;
                float _967 = fma(_889, as_type<float>(_667), _953);
                float _969 = fma(_695, _863, _949);
                _971 = _881 + _951;
                float _973 = fma(_683, _889, _961);
                float _975 = fma(_687, _889, _963);
                float _977 = fma(_695, _889, _965);
                float _979 = fma(_901, as_type<float>(_671), _967);
                _981 = fma(_699, _875, _969);
                float _983 = -_681;
                _985 = fma(_983, _901, _973);
                _987 = fma(_691, _901, _975);
                _989 = fma(_699, _901, _977);
                _991 = _907 + _979;
                uint _993 = uint(int(uint(_693) >> uint(2)));
                _37[int(_993)] = as_type<uint>(_929);
                int _995 = _693 + 4;
                uint _997 = uint(int(uint(_995) >> uint(2)));
                _37[int(_997)] = as_type<uint>(_931);
                int _999 = _693 + 8;
                uint _1001 = uint(int(uint(_999) >> uint(2)));
                _37[int(_1001)] = as_type<uint>(_933);
                int _1003 = _693 + 12;
                uint _1005 = uint(int(uint(_1003) >> uint(2)));
                _37[int(_1005)] = as_type<uint>(_941);
                int _1007 = _693 + 16;
                uint _1009 = uint(int(uint(_1007) >> uint(2)));
                _37[int(_1009)] = as_type<uint>(_957);
                int _1011 = _693 + 20;
                uint _1013 = uint(int(uint(_1011) >> uint(2)));
                _37[int(_1013)] = as_type<uint>(_959);
                int _1015 = _693 + 24;
                uint _1017 = uint(int(uint(_1015) >> uint(2)));
                _37[int(_1017)] = as_type<uint>(_981);
                int _1019 = _693 + 28;
                uint _1021 = uint(int(uint(_1019) >> uint(2)));
                _37[int(_1021)] = as_type<uint>(_971);
                int _1023 = _693 + 32;
                uint _1025 = uint(int(uint(_1023) >> uint(2)));
                _37[int(_1025)] = as_type<uint>(_985);
                int _1027 = _693 + 36;
                uint _1029 = uint(int(uint(_1027) >> uint(2)));
                _37[int(_1029)] = as_type<uint>(_987);
                int _1031 = _693 + 40;
                uint _1033 = uint(int(uint(_1031) >> uint(2)));
                _37[int(_1033)] = as_type<uint>(_989);
                int _1035 = _693 + 44;
                uint _1037 = uint(int(uint(_1035) >> uint(2)));
                _37[int(_1037)] = as_type<uint>(_991);
                _831 = !_883;
                _829 = _857;
            } while (_831);
            _813 = _987;
            _783 = _931;
            _799 = _959;
            _771 = _985;
            _779 = _929;
            _795 = _957;
            _803 = _981;
            _773 = _989;
            _787 = _933;
            _807 = _971;
            _791 = _941;
            _775 = _991;
            _1039 = true;
        }
        else
        {
            _813 = 0.0;
            _783 = 0.0;
            _799 = 0.0;
            _771 = 0.0;
            _779 = 0.0;
            _795 = 0.0;
            _803 = 0.0;
            _773 = 0.0;
            _787 = 0.0;
            _807 = 0.0;
            _791 = 0.0;
            _775 = 0.0;
        }
    }
    _1039 = false;
    float _1041 = _813;
    float _1043 = _783;
    float _1045 = _799;
    float _1047 = _771;
    float _1049 = _779;
    float _1051 = _795;
    float _1053 = _803;
    float _1055 = _773;
    float _1057 = _787;
    float _1059 = _807;
    float _1061 = _791;
    float _1063 = _775;
    int _1065 = _721 + 80;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    uint _1069 = uint(int(uint(int(_1067)) >> uint(2)));
    int _1071 = int(_1067) & 3;
    float _1073 = (*spvDescriptorSet0.cp_c6)._m0[int(_1069)][_1071];
    int _1075 = int(_1067) + 1;
    uint _1077 = uint(int(uint(_1075) >> uint(2)));
    int _1079 = _1075 & 3;
    float _1081 = (*spvDescriptorSet0.cp_c6)._m0[int(_1077)][_1079];
    int _1083 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1085 = _1083 + _66;
    int _1087 = _721 + 64;
    uint _1089 = uint(int(uint(_1087) >> uint(2)));
    uint _1091 = uint(int(uint(int(_1089)) >> uint(2)));
    int _1093 = int(_1089) & 3;
    float _1095 = (*spvDescriptorSet0.cp_c6)._m0[int(_1091)][_1093];
    int _1097 = int(_1089) + 1;
    uint _1099 = uint(int(uint(_1097) >> uint(2)));
    int _1101 = _1097 & 3;
    float _1103 = (*spvDescriptorSet0.cp_c6)._m0[int(_1099)][_1101];
    int _1105 = _1085 * 48;
    int _1107 = _721 + 88;
    uint _1109 = uint(int(uint(_1107) >> uint(2)));
    uint _1111 = uint(int(uint(int(_1109)) >> uint(2)));
    int _1113 = int(_1109) & 3;
    float _1115 = (*spvDescriptorSet0.cp_c6)._m0[int(_1111)][_1113];
    int _1117 = int(_1109) + 1;
    uint _1119 = uint(int(uint(_1117) >> uint(2)));
    int _1121 = _1117 & 3;
    float _1123 = (*spvDescriptorSet0.cp_c6)._m0[int(_1119)][_1121];
    int _1125 = _721 + 72;
    uint _1127 = uint(int(uint(_1125) >> uint(2)));
    uint _1129 = uint(int(uint(int(_1127)) >> uint(2)));
    int _1131 = int(_1127) & 3;
    float _1133 = (*spvDescriptorSet0.cp_c6)._m0[int(_1129)][_1131];
    int _1135 = int(_1127) + 1;
    uint _1137 = uint(int(uint(_1135) >> uint(2)));
    int _1139 = _1135 & 3;
    float _1141 = (*spvDescriptorSet0.cp_c6)._m0[int(_1137)][_1139];
    int _1143 = _721 + 96;
    uint _1145 = uint(int(uint(_1143) >> uint(2)));
    uint _1147 = uint(int(uint(int(_1145)) >> uint(2)));
    int _1149 = int(_1145) & 3;
    float _1151 = (*spvDescriptorSet0.cp_c6)._m0[int(_1147)][_1149];
    int _1153 = int(_1145) + 1;
    uint _1155 = uint(int(uint(_1153) >> uint(2)));
    int _1157 = _1153 & 3;
    float _1159 = (*spvDescriptorSet0.cp_c6)._m0[int(_1155)][_1157];
    int _1161 = _721 + 104;
    uint _1163 = uint(int(uint(_1161) >> uint(2)));
    uint _1165 = uint(int(uint(int(_1163)) >> uint(2)));
    int _1167 = int(_1163) & 3;
    float _1169 = (*spvDescriptorSet0.cp_c6)._m0[int(_1165)][_1167];
    int _1171 = int(_1163) + 1;
    uint _1173 = uint(int(uint(_1171) >> uint(2)));
    int _1175 = _1171 & 3;
    float _1177 = (*spvDescriptorSet0.cp_c6)._m0[int(_1173)][_1175];
    float _1179 = _1041 * _1073;
    int _1181 = _721 + 32;
    uint _1183 = uint(int(uint(_1181) >> uint(2)));
    uint _1185 = uint(int(uint(int(_1183)) >> uint(2)));
    int _1187 = int(_1183) & 3;
    float _1189 = (*spvDescriptorSet0.cp_c6)._m0[int(_1185)][_1187];
    int _1191 = int(_1183) + 1;
    uint _1193 = uint(int(uint(_1191) >> uint(2)));
    int _1195 = _1191 & 3;
    float _1197 = (*spvDescriptorSet0.cp_c6)._m0[int(_1193)][_1195];
    float _1199 = _1043 * _1073;
    float _1201 = _1045 * _1073;
    float _1203 = _1045 * _1081;
    float _1205 = fma(_1047, _1095, _1179);
    float _1207 = _1041 * _1081;
    int _1209 = _721 + 16;
    uint _1211 = uint(int(uint(_1209) >> uint(2)));
    uint _1213 = uint(int(uint(int(_1211)) >> uint(2)));
    int _1215 = int(_1211) & 3;
    float _1217 = (*spvDescriptorSet0.cp_c6)._m0[int(_1213)][_1215];
    int _1219 = int(_1211) + 1;
    uint _1221 = uint(int(uint(_1219) >> uint(2)));
    int _1223 = _1219 & 3;
    float _1225 = (*spvDescriptorSet0.cp_c6)._m0[int(_1221)][_1223];
    float _1227 = fma(_1049, _1095, _1199);
    float _1229 = fma(_1051, _1095, _1201);
    float _1231 = fma(_1051, _1103, _1203);
    float _1233 = fma(_1047, _1103, _1207);
    float _1235 = _1043 * _1081;
    float _1237 = _1045 * _1115;
    float _1239 = _1043 * _1115;
    int _1241 = _721 + 48;
    uint _1243 = uint(int(uint(_1241) >> uint(2)));
    uint _1245 = uint(int(uint(int(_1243)) >> uint(2)));
    int _1247 = int(_1243) & 3;
    float _1249 = (*spvDescriptorSet0.cp_c6)._m0[int(_1245)][_1247];
    int _1251 = int(_1243) + 1;
    uint _1253 = uint(int(uint(_1251) >> uint(2)));
    int _1255 = _1251 & 3;
    float _1257 = (*spvDescriptorSet0.cp_c6)._m0[int(_1253)][_1255];
    float _1259 = _1045 * _1123;
    float _1261 = _1041 * _1115;
    float _1263 = _1043 * _1123;
    float _1265 = _1041 * _1123;
    float _1267 = fma(_1049, _1103, _1235);
    float _1269 = fma(_1051, _1133, _1237);
    float _1271 = fma(_1051, _1141, _1259);
    int _1273 = _721 + 24;
    uint _1275 = uint(int(uint(_1273) >> uint(2)));
    uint _1277 = uint(int(uint(int(_1275)) >> uint(2)));
    int _1279 = int(_1275) & 3;
    float _1281 = (*spvDescriptorSet0.cp_c6)._m0[int(_1277)][_1279];
    int _1283 = int(_1275) + 1;
    uint _1285 = uint(int(uint(_1283) >> uint(2)));
    int _1287 = _1283 & 3;
    float _1289 = (*spvDescriptorSet0.cp_c6)._m0[int(_1285)][_1287];
    float _1291 = fma(_1049, _1133, _1239);
    float _1293 = fma(_1049, _1141, _1263);
    float _1295 = fma(_1047, _1133, _1261);
    float _1297 = fma(_1047, _1141, _1265);
    float _1299 = fma(_1053, _1151, _1229);
    float _1301 = fma(_1053, _1159, _1231);
    int _1303 = _721 + 40;
    uint _1305 = uint(int(uint(_1303) >> uint(2)));
    uint _1307 = uint(int(uint(int(_1305)) >> uint(2)));
    int _1309 = int(_1305) & 3;
    float _1311 = (*spvDescriptorSet0.cp_c6)._m0[int(_1307)][_1309];
    int _1313 = int(_1305) + 1;
    uint _1315 = uint(int(uint(_1313) >> uint(2)));
    int _1317 = _1313 & 3;
    float _1319 = (*spvDescriptorSet0.cp_c6)._m0[int(_1315)][_1317];
    float _1321 = fma(_1055, _1151, _1205);
    float _1323 = fma(_1057, _1151, _1227);
    float _1325 = fma(_1057, _1159, _1267);
    float _1327 = fma(_1055, _1159, _1233);
    float _1329 = fma(_1053, _1169, _1269);
    float _1331 = fma(_1053, _1177, _1271);
    int _1333 = _721 + 56;
    uint _1335 = uint(int(uint(_1333) >> uint(2)));
    uint _1337 = uint(int(uint(int(_1335)) >> uint(2)));
    int _1339 = int(_1335) & 3;
    float _1341 = (*spvDescriptorSet0.cp_c6)._m0[int(_1337)][_1339];
    int _1343 = int(_1335) + 1;
    uint _1345 = uint(int(uint(_1343) >> uint(2)));
    int _1347 = _1343 & 3;
    float _1349 = (*spvDescriptorSet0.cp_c6)._m0[int(_1345)][_1347];
    float _1351 = fma(_1057, _1169, _1291);
    float _1353 = fma(_1057, _1177, _1293);
    float _1355 = _1331 + _1059;
    float _1357 = fma(_1055, _1177, _1297);
    float _1359 = fma(_1055, _1169, _1295);
    float _1361 = _1353 + _1061;
    float _1363 = _1329 * _1197;
    float _1365 = _1355 * _1197;
    float _1367 = _1357 + _1063;
    float _1369 = _1299 * _1197;
    float _1371 = fma(_1351, _1189, _1363);
    float _1373 = _1301 * _1197;
    float _1375 = fma(_1361, _1189, _1365);
    float _1377 = fma(_1323, _1189, _1369);
    float _1379 = _1355 * _1225;
    float _1381 = _1301 * _1225;
    float _1383 = _1329 * _1225;
    float _1385 = _1299 * _1225;
    float _1387 = fma(_1361, _1217, _1379);
    float _1389 = fma(_1325, _1217, _1381);
    float _1391 = fma(_1351, _1217, _1383);
    float _1393 = fma(_1323, _1217, _1385);
    float _1395 = _1355 * _1257;
    float _1397 = _1299 * _1257;
    float _1399 = _1301 * _1257;
    float _1401 = _1329 * _1257;
    float _1403 = fma(_1361, _1249, _1395);
    float _1405 = fma(_1325, _1189, _1373);
    float _1407 = fma(_1323, _1249, _1397);
    float _1409 = fma(_1325, _1249, _1399);
    float _1411 = fma(_1367, _1281, _1387);
    float _1413 = fma(_1351, _1249, _1401);
    float _1415 = fma(_1327, _1281, _1389);
    float _1417 = fma(_1359, _1281, _1391);
    float _1419 = fma(_1321, _1281, _1393);
    float _1421 = _1411 + _1289;
    int _1423 = _1105 + 16;
    float _1425 = fma(_1367, _1311, _1375);
    float _1427 = fma(_1321, _1311, _1377);
    float _1429 = fma(_1327, _1311, _1405);
    float _1431 = fma(_1359, _1311, _1371);
    float _1433 = _1425 + _1319;
    int _1435 = _1105 + 32;
    uint _1437 = uint(int(uint(_1423) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1437)] = as_type<uint>(_1419);
    int _1439 = _1423 + 4;
    uint _1441 = uint(int(uint(_1439) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1441)] = as_type<uint>(_1415);
    int _1443 = _1423 + 8;
    uint _1445 = uint(int(uint(_1443) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1445)] = as_type<uint>(_1417);
    int _1447 = _1423 + 12;
    uint _1449 = uint(int(uint(_1447) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1449)] = as_type<uint>(_1421);
    int _1451 = _1105 + 48;
    float _1453 = fma(_1367, _1341, _1403);
    float _1455 = fma(_1321, _1341, _1407);
    float _1457 = fma(_1327, _1341, _1409);
    float _1459 = fma(_1359, _1341, _1413);
    float _1461 = _1453 + _1349;
    uint _1463 = uint(int(uint(_1435) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1463)] = as_type<uint>(_1427);
    int _1465 = _1435 + 4;
    uint _1467 = uint(int(uint(_1465) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1467)] = as_type<uint>(_1429);
    int _1469 = _1435 + 8;
    uint _1471 = uint(int(uint(_1469) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1471)] = as_type<uint>(_1431);
    int _1473 = _1435 + 12;
    uint _1475 = uint(int(uint(_1473) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1475)] = as_type<uint>(_1433);
    uint _1477 = uint(int(uint(_1451) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1477)] = as_type<uint>(_1455);
    int _1479 = _1451 + 4;
    uint _1481 = uint(int(uint(_1479) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1481)] = as_type<uint>(_1457);
    int _1483 = _1451 + 8;
    uint _1485 = uint(int(uint(_1483) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1485)] = as_type<uint>(_1459);
    int _1487 = _1451 + 12;
    uint _1489 = uint(int(uint(_1487) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1489)] = as_type<uint>(_1461);
}

