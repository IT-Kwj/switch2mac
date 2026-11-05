#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T>
inline T spvSubgroupShuffle(T value, ushort lane)
{
    return simd_shuffle(value, lane);
}

template<>
inline bool spvSubgroupShuffle(bool value, ushort lane)
{
    return !!simd_shuffle((ushort)value, lane);
}

template<uint N>
inline vec<bool, N> spvSubgroupShuffle(vec<bool, N> value, ushort lane)
{
    return (vec<bool, N>)simd_shuffle((vec<ushort, N>)value, lane);
}

template<>
inline ulong spvSubgroupShuffle(ulong value, ushort lane)
{
    return as_type<ulong>(spvSubgroupShuffle(as_type<uint2>(value), lane));
}

template<>
inline ulong2 spvSubgroupShuffle(ulong2 value, ushort lane)
{
    return ulong2(spvSubgroupShuffle(value.x, lane), spvSubgroupShuffle(value.y, lane));
}

inline ulong3 spvSubgroupShuffle(ulong3 value, ushort lane)
{
    return ulong3(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.z, lane));
}

inline ulong4 spvSubgroupShuffle(ulong4 value, ushort lane)
{
    return ulong4(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.zw, lane));
}

template<uint N>
inline vec<long, N> spvSubgroupShuffle(vec<long, N> value, ushort lane)
{
    return vec<long, N>(spvSubgroupShuffle(vec<ulong, N>(value), lane));
}

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
int _56(thread const int& _3967, thread const int& _3968, constant _10& support_buffer)
{
    int _3971 = 1 + _3968;
    float _3973 = support_buffer._m5[_3971].x;
    bool _3975 = _3973 == 1.0;
    if (_3975)
    {
        return _3967;
    }
    float _3977 = float(_3967);
    float _3979 = _3977 * _3973;
    int _3981 = int(_3979);
    return _3981;
}

static inline __attribute__((always_inline))
int _58(thread const int& _4003, thread const int& _4004, thread const int& _4005, thread int& _4006, thread uint& gl_SubgroupInvocationID)
{
    int _4009 = _4005 & 31;
    uint _4011 = uint(int(uint(_4005) >> uint(8)));
    int _4013 = int(_4011) & 31;
    float _4015 = as_type<float>(gl_SubgroupInvocationID);
    int _4017 = as_type<int>(_4015) & _4013;
    int _4019 = ~_4013;
    int _4021 = _4009 & _4019;
    int _4023 = _4021 | _4017;
    int _4025 = ~_4013;
    int _4027 = _4004 & _4025;
    int _4029 = _4027 | _4017;
    bool _4031 = uint(_4029) <= uint(_4023);
    _4006 = _4031 ? (-1) : 0;
    float _4033 = spvSubgroupShuffle(as_type<float>(_4003), uint(_4029));
    uint _4035 = uint(_4031 ? as_type<int>(_4033) : _4003);
    return int(_4035);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1213 = false;
    bool _703 = false;
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
    if (_125)
    {
        int _135 = _101 + 8;
        uint _137 = uint(int(uint(_135) >> uint(2)));
        uint _139 = uint(int(uint(int(_137)) >> uint(2)));
        int _141 = int(_137) & 3;
        float _143 = (*spvDescriptorSet0.cp_c5)._m0[int(_139)][_141];
        _131 = as_type<int>(_143);
    }
    int _145 = _131;
    float _147 = 0.0;
    if (_125)
    {
        _147 = 1.4012984643248170709237295832899e-45;
    }
    float _149 = _147;
    if (_125)
    {
        _133 = 2.8025969286496341418474591665798e-45;
    }
    float _151 = _133;
    int _153 = 0;
    if (_129)
    {
        uint _155 = uint(int(uint(_101) >> uint(2)));
        uint _157 = uint(int(uint(int(_155)) >> uint(2)));
        int _159 = int(_155) & 3;
        float _161 = (*spvDescriptorSet0.cp_c5)._m0[int(_157)][_159];
        _153 = as_type<int>(_161);
    }
    int _163 = _153;
    float _165 = 0.0;
    if (_129)
    {
        _165 = 1.4012984643248170709237295832899e-45;
    }
    float _167 = _165;
    float _169 = _149;
    float _171 = as_type<float>(_68);
    float _173 = 0.0;
    float _175 = as_type<float>(_145);
    if (_125)
    {
        int _177 = _68;
        int _179 = 0;
        int _181 = _56(_177, _179, (*spvDescriptorSet0.support_buffer));
        int _183 = _145;
        int _185 = 0;
        int _187 = _56(_183, _185, (*spvDescriptorSet0.support_buffer));
        int3 _1865 = int3(_181, _187, as_type<int>(_149));
        float3 _191 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1865.xy), uint(_1865.z), 0).xyz;
        float _193 = _191.x;
        float _195 = _191.y;
        float _197 = _191.z;
        _169 = _193;
        _171 = _195;
        _173 = _197;
    }
    float _199 = _169;
    float _201 = _171;
    float _203 = _173;
    float _205 = 0.0;
    float _207 = as_type<float>(_68);
    float _209 = 0.0;
    if (_125)
    {
        int _211 = _68;
        int _213 = 0;
        int _215 = _56(_211, _213, (*spvDescriptorSet0.support_buffer));
        int _217 = _145;
        int _219 = 0;
        int _221 = _56(_217, _219, (*spvDescriptorSet0.support_buffer));
        int3 _1893 = int3(_215, _221, 0);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1893.xy), uint(_1893.z), 0).xyz;
        float _225 = _223.x;
        float _227 = _223.y;
        float _229 = _223.z;
        _205 = _225;
        _207 = _227;
        _209 = _229;
    }
    float _231 = _205;
    float _233 = _207;
    float _235 = _209;
    float _237 = _151;
    float _239 = as_type<float>(_68);
    float _241 = 0.0;
    if (_125)
    {
        int _243 = _68;
        int _245 = 0;
        int _247 = _56(_243, _245, (*spvDescriptorSet0.support_buffer));
        int _249 = _145;
        int _251 = 0;
        int _253 = _56(_249, _251, (*spvDescriptorSet0.support_buffer));
        int3 _1924 = int3(_247, _253, as_type<int>(_151));
        float3 _255 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1924.xy), uint(_1924.z), 0).xyz;
        float _257 = _255.x;
        float _259 = _255.y;
        float _261 = _255.z;
        _237 = _257;
        _239 = _259;
        _241 = _261;
    }
    float _263 = _237;
    float _265 = _239;
    float _267 = _241;
    float _269 = 0.0;
    float _271 = as_type<float>(_68);
    float _273 = 0.0;
    if (_129)
    {
        int _275 = _68;
        int _277 = 1;
        int _279 = _56(_275, _277, (*spvDescriptorSet0.support_buffer));
        int _281 = _163;
        int _283 = 1;
        int _285 = _56(_281, _283, (*spvDescriptorSet0.support_buffer));
        int3 _1952 = int3(_279, _285, 0);
        float3 _287 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1952.xy), uint(_1952.z), 0).xyz;
        float _289 = _287.x;
        float _291 = _287.y;
        float _293 = _287.z;
        _269 = _289;
        _271 = _291;
        _273 = _293;
    }
    float _295 = _269;
    float _297 = _271;
    float _299 = _273;
    float _301 = 0.0;
    float _303 = 0.0;
    float _305 = _167;
    if (_129)
    {
        int _307 = _68;
        int _309 = 1;
        int _311 = _56(_307, _309, (*spvDescriptorSet0.support_buffer));
        int _313 = _163;
        int _315 = 1;
        int _317 = _56(_313, _315, (*spvDescriptorSet0.support_buffer));
        int3 _1981 = int3(_311, _317, as_type<int>(_167));
        float3 _319 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1981.xy), uint(_1981.z), 0).xyz;
        float _321 = _319.x;
        float _323 = _319.y;
        float _325 = _319.z;
        _301 = _321;
        _303 = _323;
        _305 = _325;
    }
    float _327 = _301;
    float _329 = _303;
    float _331 = _305;
    float _333 = 0.0;
    if (!_129)
    {
        _333 = 0.0;
    }
    float _335 = _333;
    float _337 = 0.0;
    float _339 = 0.0;
    float _341 = _335;
    if (!_129)
    {
        _337 = 0.0;
        _339 = 0.0;
    }
    float _343 = _337;
    float _345 = _339;
    float _347 = 0.0;
    float _349 = 0.0;
    float _351 = _343;
    float _353 = _345;
    if (!_129)
    {
        _347 = 0.0;
        _349 = 0.0;
    }
    float _355 = _347;
    float _357 = _349;
    float _359 = 0.0;
    float _361 = _357;
    float _363 = _355;
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
        _175 = 0.0;
    }
    float _371 = _367;
    float _373 = _175;
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
        int _391 = _56(_387, _389, (*spvDescriptorSet0.support_buffer));
        int _393 = _163;
        int _395 = 1;
        int _397 = _56(_393, _395, (*spvDescriptorSet0.support_buffer));
        int3 _2052 = int3(_391, _397, 2);
        float3 _399 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2052.xy), uint(_2052.z), 0).xyz;
        float _401 = _399.x;
        float _403 = _399.y;
        float _405 = _399.z;
        _369 = _327;
        _361 = _329;
        _385 = _331;
        _351 = _297;
        _377 = _401;
        _379 = _403;
        _363 = _405;
        _341 = _295;
        _353 = _299;
    }
    float _407 = _369;
    float _409 = _361;
    float _411 = _385;
    float _413 = _351;
    float _415 = _377;
    float _417 = _379;
    float _419 = _363;
    float _421 = _341;
    float _423 = _353;
    bool _425 = !_125;
    float _427 = _417;
    float _429 = _419;
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
    float _699;
    float _701;
    if (!_425)
    {
        float _431 = _407 * 0.15915493667125701904296875;
        float _433 = _409 * 0.15915493667125701904296875;
        float _435 = _411 * 0.15915493667125701904296875;
        float _437 = _201 * 0.15915493667125701904296875;
        float _439 = _431 * 6.283185482025146484375;
        float _441 = cos(_439);
        float _443 = _203 * 0.15915493667125701904296875;
        float _445 = _199 * 0.15915493667125701904296875;
        int _447 = _101 + 28;
        uint _449 = uint(int(uint(_447) >> uint(2)));
        uint _451 = uint(int(uint(int(_449)) >> uint(2)));
        int _453 = int(_449) & 3;
        float _455 = (*spvDescriptorSet0.cp_c5)._m0[int(_451)][_453];
        float _457 = _433 * 6.283185482025146484375;
        float _459 = cos(_457);
        float _461 = _435 * 6.283185482025146484375;
        float _463 = sin(_461);
        float _465 = _435 * 6.283185482025146484375;
        float _467 = cos(_465);
        float _469 = _235 * _455;
        float _471 = _431 * 6.283185482025146484375;
        float _473 = sin(_471);
        float _475 = _463 * _441;
        float _477 = _463 * _459;
        float _479 = _433 * 6.283185482025146484375;
        float _481 = sin(_479);
        int _483 = _101 + 20;
        uint _485 = uint(int(uint(_483) >> uint(2)));
        uint _487 = uint(int(uint(int(_485)) >> uint(2)));
        int _489 = int(_485) & 3;
        float _491 = (*spvDescriptorSet0.cp_c5)._m0[int(_487)][_489];
        float _493 = _459 * _467;
        float _495 = _437 * 6.283185482025146484375;
        float _497 = cos(_495);
        float _499 = _441 * _467;
        float _501 = _473 * _467;
        float _503 = _443 * 6.283185482025146484375;
        float _505 = sin(_503);
        float _507 = _473 * _481;
        float _509 = -_501;
        float _511 = fma(_481, _475, _509);
        float _513 = -_475;
        float _515 = fma(_467, _507, _513);
        float _517 = _443 * 6.283185482025146484375;
        float _519 = cos(_517);
        float _521 = _445 * 6.283185482025146484375;
        float _523 = cos(_521);
        float _525 = _505 * _497;
        float _527 = _445 * 6.283185482025146484375;
        float _529 = sin(_527);
        float _531 = _437 * 6.283185482025146484375;
        float _533 = sin(_531);
        float _535 = _523 * _497;
        float _537 = _535 * _455;
        float _539 = _529 * _497;
        float _541 = _441 * _459;
        float _543 = _473 * _463;
        float _545 = _473 * _459;
        float _547 = fma(_463, _507, _499);
        float _549 = _505 * _523;
        float _551 = fma(_481, _499, _543);
        float _553 = _497 * _519;
        float _555 = _523 * _519;
        float _557 = _529 * _533;
        float _559 = _529 * _519;
        float _561 = _529 * _505;
        float _563 = _553 * _455;
        float _565 = fma(_505, _557, _555);
        float _567 = -_559;
        float _569 = fma(_533, _549, _567);
        float _571 = -_549;
        float _573 = fma(_519, _557, _571);
        float _575 = fma(_533, _555, _561);
        float _577 = _565 * _455;
        float _579 = _569 * _455;
        float _581 = _525 * _455;
        float _583 = _573 * _455;
        float _585 = _575 * _455;
        float _587 = fma(_547, _491, _577);
        float _589 = fma(_511, _491, _579);
        float _591 = fma(_477, _491, _581);
        float _593 = _539 * _455;
        float _595 = fma(_493, _491, _563);
        float _597 = fma(_515, _491, _583);
        float _599 = fma(_551, _491, _585);
        float _601 = _587 * _587;
        float _603 = _589 * _589;
        float _605 = _481 * _491;
        float _607 = _591 * _591;
        float _609 = fma(_545, _491, _593);
        float _611 = fma(_597, _597, _601);
        float _613 = fma(_541, _491, _537);
        float _615 = fma(_599, _599, _603);
        float _617 = -_533;
        float _619 = -_605;
        float _621 = fma(_617, _455, _619);
        float _623 = fma(_595, _595, _607);
        float _625 = fma(_609, _609, _611);
        float _627 = fma(_613, _613, _615);
        float _629 = _233 * _455;
        float _631 = fma(_621, _621, _623);
        float _633 = _231 * _455;
        float _635 = _263 * _455;
        float _637 = rsqrt(_625);
        float _639 = _265 * _455;
        float _641 = _267 * _455;
        float _643 = fma(_413, _491, _629);
        float _645 = fma(_415, _491, _635);
        float _647 = fma(_417, _491, _639);
        float _649 = fma(_419, _491, _641);
        float _651 = rsqrt(_631);
        float _653 = rsqrt(_627);
        float _655 = fma(_421, _491, _633);
        float _657 = fma(_423, _491, _469);
        float _659 = _597 * _637;
        float _661 = _587 * _637;
        float _663 = _609 * _637;
        float _665 = _621 * _651;
        float _667 = _595 * _651;
        float _669 = _591 * _651;
        float _671 = _599 * _653;
        float _673 = _589 * _653;
        float _675 = _613 * _653;
        _677 = _643;
        _679 = _661;
        _681 = _655;
        _683 = _667;
        _685 = _669;
        _687 = _665;
        _689 = _659;
        _691 = _663;
        _693 = _657;
        _695 = _671;
        _697 = _673;
        _699 = _675;
        _701 = _645;
        _427 = _647;
        _429 = _649;
        _703 = true;
    }
    else
    {
        float _705 = _407 * 0.15915493667125701904296875;
        float _707 = _411 * 0.15915493667125701904296875;
        float _709 = _409 * 0.15915493667125701904296875;
        float _711 = _705 * 6.283185482025146484375;
        float _713 = cos(_711);
        float _715 = _707 * 6.283185482025146484375;
        float _717 = sin(_715);
        float _719 = _707 * 6.283185482025146484375;
        float _721 = cos(_719);
        float _723 = _709 * 6.283185482025146484375;
        float _725 = cos(_723);
        float _727 = _717 * _713;
        float _729 = _705 * 6.283185482025146484375;
        float _731 = sin(_729);
        float _733 = _713 * _721;
        float _735 = _709 * 6.283185482025146484375;
        float _737 = sin(_735);
        float _739 = _713 * _725;
        float _741 = _725 * _721;
        float _743 = _717 * _725;
        float _745 = _731 * _717;
        float _747 = _731 * _721;
        float _749 = _731 * _725;
        float _751 = _731 * _737;
        float _753 = -_727;
        float _755 = fma(_721, _751, _753);
        float _757 = fma(_717, _751, _733);
        float _759 = fma(_737, _733, _745);
        float _761 = -_747;
        float _763 = fma(_737, _727, _761);
        float _765 = -_737;
        float _767 = _765 + (-0.0);
        _677 = _413;
        _679 = _757;
        _681 = _421;
        _683 = _741;
        _685 = _743;
        _687 = _767;
        _689 = _755;
        _691 = _749;
        _693 = _423;
        _695 = _759;
        _697 = _763;
        _699 = _739;
        _701 = _415;
    }
    _703 = false;
    float _769 = _677;
    float _771 = _679;
    float _773 = _681;
    float _775 = _683;
    float _777 = _685;
    float _779 = _687;
    float _781 = _689;
    float _783 = _691;
    float _785 = _693;
    float _787 = _695;
    float _789 = _697;
    float _791 = _699;
    float _793 = _701;
    float _795 = _427;
    float _797 = _429;
    float _799 = _769 * _771;
    bool _801 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _803 = _773 * _775;
    bool _805 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _807 = _773 * _777;
    float _809 = _773 * _779;
    float _811 = _769 * _781;
    float _813 = _769 * _783;
    float _815 = _785 * _787;
    float _817 = _785 * _789;
    float _819 = _785 * _791;
    if (!_805)
    {
        int _821 = _68 * 48;
        int _823 = _821 + 16;
        uint _825 = uint(int(uint(_821) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_825)] = as_type<uint>(_803);
        int _827 = _821 + 4;
        uint _829 = uint(int(uint(_827) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_829)] = as_type<uint>(_811);
        int _831 = _821 + 8;
        uint _833 = uint(int(uint(_831) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_833)] = as_type<uint>(_815);
        int _835 = _821 + 12;
        uint _837 = uint(int(uint(_835) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_837)] = as_type<uint>(_793);
        int _839 = _821 + 32;
        uint _841 = uint(int(uint(_823) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_841)] = as_type<uint>(_807);
        int _843 = _823 + 4;
        uint _845 = uint(int(uint(_843) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_845)] = as_type<uint>(_799);
        int _847 = _823 + 8;
        uint _849 = uint(int(uint(_847) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_849)] = as_type<uint>(_817);
        int _851 = _823 + 12;
        uint _853 = uint(int(uint(_851) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_853)] = as_type<uint>(_795);
        uint _855 = uint(int(uint(_839) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_855)] = as_type<uint>(_809);
        int _857 = _839 + 4;
        uint _859 = uint(int(uint(_857) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_859)] = as_type<uint>(_813);
        int _861 = _839 + 8;
        uint _863 = uint(int(uint(_861) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_863)] = as_type<uint>(_819);
        int _865 = _839 + 12;
        uint _867 = uint(int(uint(_865) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_867)] = as_type<uint>(_797);
    }
    int _869 = _68 * 112;
    bool _871 = !_801;
    float _1189;
    float _1191;
    float _1193;
    float _1195;
    float _1197;
    float _1199;
    float _1201;
    float _1203;
    float _1205;
    float _1207;
    float _1209;
    float _1211;
    if (!_871)
    {
        int _873 = 0;
        float _875 = _803;
        float _877 = _811;
        float _879 = _815;
        float _881 = _793;
        float _883 = _807;
        float _885 = _799;
        float _887 = _817;
        float _889 = _795;
        float _891 = _809;
        float _893 = _813;
        float _895 = _819;
        float _897 = _797;
        bool _899;
        int _947;
        int _957;
        int _967;
        int _977;
        int _987;
        int _997;
        int _1007;
        int _1017;
        int _1027;
        int _1037;
        int _1047;
        int _1057;
        int _1165;
        int _1169;
        int _1171;
        int _1175;
        int _1177;
        int _1179;
        int _1183;
        int _1185;
        int _1187;
        do
        {
            int _901 = _873;
            int _903 = as_type<int>(_875);
            int _905 = as_type<int>(_877);
            int _907 = as_type<int>(_879);
            int _909 = as_type<int>(_881);
            int _911 = as_type<int>(_883);
            int _913 = as_type<int>(_885);
            int _915 = as_type<int>(_887);
            int _917 = as_type<int>(_889);
            int _919 = as_type<int>(_891);
            int _921 = as_type<int>(_893);
            int _923 = as_type<int>(_895);
            int _925 = as_type<int>(_897);
            uint _927 = uint(int(uint(_869) >> uint(2)));
            uint _929 = uint(int(uint(int(_927)) >> uint(2)));
            int _931 = int(_927) & 3;
            float _933 = (*spvDescriptorSet0.cp_c6)._m0[int(_929)][_931];
            bool _935 = _68 != 0;
            int _937 = _901 + 1;
            bool _939 = uint(_937) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _941 = _903;
            int _943 = as_type<int>(_933);
            int _945 = 31;
            int _2825 = _58(_941, _943, _945, _947, gl_SubgroupInvocationID);
            int _949 = _2825;
            int _951 = _905;
            int _953 = as_type<int>(_933);
            int _955 = 31;
            int _2829 = _58(_951, _953, _955, _957, gl_SubgroupInvocationID);
            int _959 = _2829;
            int _961 = _907;
            int _963 = as_type<int>(_933);
            int _965 = 31;
            int _2833 = _58(_961, _963, _965, _967, gl_SubgroupInvocationID);
            int _969 = _2833;
            int _971 = _909;
            int _973 = as_type<int>(_933);
            int _975 = 31;
            int _2837 = _58(_971, _973, _975, _977, gl_SubgroupInvocationID);
            int _979 = _2837;
            int _981 = _911;
            int _983 = as_type<int>(_933);
            int _985 = 31;
            int _2841 = _58(_981, _983, _985, _987, gl_SubgroupInvocationID);
            int _989 = _2841;
            int _991 = _913;
            int _993 = as_type<int>(_933);
            int _995 = 31;
            int _2845 = _58(_991, _993, _995, _997, gl_SubgroupInvocationID);
            int _999 = _2845;
            int _1001 = _915;
            int _1003 = as_type<int>(_933);
            int _1005 = 31;
            int _2849 = _58(_1001, _1003, _1005, _1007, gl_SubgroupInvocationID);
            int _1009 = _2849;
            int _1011 = _917;
            int _1013 = as_type<int>(_933);
            int _1015 = 31;
            int _2853 = _58(_1011, _1013, _1015, _1017, gl_SubgroupInvocationID);
            int _1019 = _2853;
            int _1021 = _919;
            int _1023 = as_type<int>(_933);
            int _1025 = 31;
            int _2857 = _58(_1021, _1023, _1025, _1027, gl_SubgroupInvocationID);
            int _1029 = _2857;
            int _1031 = _921;
            int _1033 = as_type<int>(_933);
            int _1035 = 31;
            int _2861 = _58(_1031, _1033, _1035, _1037, gl_SubgroupInvocationID);
            int _1039 = _2861;
            int _1041 = _923;
            int _1043 = as_type<int>(_933);
            int _1045 = 31;
            int _2865 = _58(_1041, _1043, _1045, _1047, gl_SubgroupInvocationID);
            int _1049 = _2865;
            int _1051 = _925;
            int _1053 = as_type<int>(_933);
            int _1055 = 31;
            int _2869 = _58(_1051, _1053, _1055, _1057, gl_SubgroupInvocationID);
            int _1059 = _2869;
            bool _1061 = !_935;
            _873 = _937;
            int _1063 = _903;
            int _1065 = _905;
            int _1067 = _907;
            int _1069 = _909;
            int _1071 = _911;
            int _1073 = _913;
            int _1075 = _915;
            int _1077 = _917;
            int _1079 = _919;
            int _1081 = _921;
            int _1083 = _923;
            int _1085 = _925;
            if (!_1061)
            {
                float _1087 = as_type<float>(_959) * _795;
                float _1089 = _807 * as_type<float>(_959);
                float _1091 = _799 * as_type<float>(_959);
                float _1093 = _817 * as_type<float>(_959);
                float _1095 = as_type<float>(_999) * _795;
                float _1097 = _807 * as_type<float>(_999);
                float _1099 = fma(as_type<float>(_949), _793, _1087);
                float _1101 = fma(_803, as_type<float>(_949), _1089);
                float _1103 = fma(_811, as_type<float>(_949), _1091);
                float _1105 = fma(_815, as_type<float>(_949), _1093);
                float _1107 = _799 * as_type<float>(_999);
                float _1109 = _817 * as_type<float>(_999);
                float _1111 = fma(as_type<float>(_989), _793, _1095);
                float _1113 = as_type<float>(_1039) * _795;
                float _1115 = fma(_803, as_type<float>(_989), _1097);
                float _1117 = _799 * as_type<float>(_1039);
                float _1119 = _807 * as_type<float>(_1039);
                float _1121 = fma(_811, as_type<float>(_989), _1107);
                float _1123 = fma(_815, as_type<float>(_989), _1109);
                float _1125 = _817 * as_type<float>(_1039);
                float _1127 = fma(as_type<float>(_1029), _793, _1113);
                float _1129 = fma(_811, as_type<float>(_1029), _1117);
                float _1131 = fma(_803, as_type<float>(_1029), _1119);
                float _1133 = fma(_813, as_type<float>(_969), _1103);
                float _1135 = fma(_819, as_type<float>(_969), _1105);
                float _1137 = fma(_809, as_type<float>(_969), _1101);
                float _1139 = fma(_809, as_type<float>(_1009), _1115);
                float _1141 = fma(_813, as_type<float>(_1009), _1121);
                float _1143 = fma(_819, as_type<float>(_1009), _1123);
                float _1145 = fma(_815, as_type<float>(_1029), _1125);
                float _1147 = fma(as_type<float>(_969), _797, _1099);
                float _1149 = fma(as_type<float>(_1009), _797, _1111);
                float _1151 = fma(as_type<float>(_1049), _797, _1127);
                float _1153 = fma(_813, as_type<float>(_1049), _1129);
                float _1155 = fma(_809, as_type<float>(_1049), _1131);
                float _1157 = fma(_819, as_type<float>(_1049), _1145);
                float _1159 = as_type<float>(_979) + _1147;
                float _1161 = as_type<float>(_1019) + _1149;
                float _1163 = as_type<float>(_1059) + _1151;
                _1063 = as_type<int>(_1137);
                _1065 = as_type<int>(_1133);
                _1067 = as_type<int>(_1135);
                _1069 = as_type<int>(_1159);
                _1071 = as_type<int>(_1139);
                _1073 = as_type<int>(_1141);
                _1075 = as_type<int>(_1143);
                _1077 = as_type<int>(_1161);
                _1079 = as_type<int>(_1155);
                _1081 = as_type<int>(_1153);
                _1083 = as_type<int>(_1157);
                _1085 = as_type<int>(_1163);
            }
            _1165 = _1063;
            int _1167 = _1065;
            _1169 = _1067;
            _1171 = _1069;
            int _1173 = _1071;
            _1175 = _1073;
            _1177 = _1075;
            _1179 = _1077;
            int _1181 = _1079;
            _1183 = _1081;
            _1185 = _1083;
            _1187 = _1085;
            _899 = !_939;
            _875 = as_type<float>(_1165);
            _877 = as_type<float>(_1167);
            _879 = as_type<float>(_1169);
            _881 = as_type<float>(_1171);
            _883 = as_type<float>(_1173);
            _885 = as_type<float>(_1175);
            _887 = as_type<float>(_1177);
            _889 = as_type<float>(_1179);
            _891 = as_type<float>(_1181);
            _893 = as_type<float>(_1183);
            _895 = as_type<float>(_1185);
            _897 = as_type<float>(_1187);
            _1189 = as_type<float>(_1167);
            _1191 = as_type<float>(_1173);
            _1193 = as_type<float>(_1181);
        } while (_899);
        _1195 = as_type<float>(_1175);
        _1197 = as_type<float>(_1183);
        _1199 = as_type<float>(_1165);
        _1201 = as_type<float>(_1169);
        _1203 = as_type<float>(_1177);
        _1205 = as_type<float>(_1185);
        _1207 = as_type<float>(_1179);
        _1209 = as_type<float>(_1187);
        _1211 = as_type<float>(_1171);
        _1213 = true;
    }
    else
    {
        _1189 = _811;
        _1195 = _799;
        _1197 = _813;
        _1199 = _803;
        _1191 = _807;
        _1193 = _809;
        _1201 = _815;
        _1203 = _817;
        _1205 = _819;
        _1207 = _795;
        _1209 = _797;
        _1211 = _793;
    }
    _1213 = false;
    float _1215 = _1189;
    float _1217 = _1195;
    float _1219 = _1197;
    float _1221 = _1199;
    float _1223 = _1191;
    float _1225 = _1193;
    float _1227 = _1201;
    float _1229 = _1203;
    float _1231 = _1205;
    float _1233 = _1207;
    float _1235 = _1209;
    float _1237 = _1211;
    int _1239 = _869 + 80;
    uint _1241 = uint(int(uint(_1239) >> uint(2)));
    uint _1243 = uint(int(uint(int(_1241)) >> uint(2)));
    int _1245 = int(_1241) & 3;
    float _1247 = (*spvDescriptorSet0.cp_c6)._m0[int(_1243)][_1245];
    int _1249 = int(_1241) + 1;
    uint _1251 = uint(int(uint(_1249) >> uint(2)));
    int _1253 = _1249 & 3;
    float _1255 = (*spvDescriptorSet0.cp_c6)._m0[int(_1251)][_1253];
    int _1257 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1259 = _1257 + _68;
    int _1261 = _869 + 64;
    uint _1263 = uint(int(uint(_1261) >> uint(2)));
    uint _1265 = uint(int(uint(int(_1263)) >> uint(2)));
    int _1267 = int(_1263) & 3;
    float _1269 = (*spvDescriptorSet0.cp_c6)._m0[int(_1265)][_1267];
    int _1271 = int(_1263) + 1;
    uint _1273 = uint(int(uint(_1271) >> uint(2)));
    int _1275 = _1271 & 3;
    float _1277 = (*spvDescriptorSet0.cp_c6)._m0[int(_1273)][_1275];
    int _1279 = _1259 * 48;
    int _1281 = _869 + 88;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    uint _1285 = uint(int(uint(int(_1283)) >> uint(2)));
    int _1287 = int(_1283) & 3;
    float _1289 = (*spvDescriptorSet0.cp_c6)._m0[int(_1285)][_1287];
    int _1291 = int(_1283) + 1;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    int _1295 = _1291 & 3;
    float _1297 = (*spvDescriptorSet0.cp_c6)._m0[int(_1293)][_1295];
    int _1299 = _869 + 72;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    uint _1303 = uint(int(uint(int(_1301)) >> uint(2)));
    int _1305 = int(_1301) & 3;
    float _1307 = (*spvDescriptorSet0.cp_c6)._m0[int(_1303)][_1305];
    int _1309 = int(_1301) + 1;
    uint _1311 = uint(int(uint(_1309) >> uint(2)));
    int _1313 = _1309 & 3;
    float _1315 = (*spvDescriptorSet0.cp_c6)._m0[int(_1311)][_1313];
    int _1317 = _869 + 96;
    uint _1319 = uint(int(uint(_1317) >> uint(2)));
    uint _1321 = uint(int(uint(int(_1319)) >> uint(2)));
    int _1323 = int(_1319) & 3;
    float _1325 = (*spvDescriptorSet0.cp_c6)._m0[int(_1321)][_1323];
    int _1327 = int(_1319) + 1;
    uint _1329 = uint(int(uint(_1327) >> uint(2)));
    int _1331 = _1327 & 3;
    float _1333 = (*spvDescriptorSet0.cp_c6)._m0[int(_1329)][_1331];
    int _1335 = _869 + 104;
    uint _1337 = uint(int(uint(_1335) >> uint(2)));
    uint _1339 = uint(int(uint(int(_1337)) >> uint(2)));
    int _1341 = int(_1337) & 3;
    float _1343 = (*spvDescriptorSet0.cp_c6)._m0[int(_1339)][_1341];
    int _1345 = int(_1337) + 1;
    uint _1347 = uint(int(uint(_1345) >> uint(2)));
    int _1349 = _1345 & 3;
    float _1351 = (*spvDescriptorSet0.cp_c6)._m0[int(_1347)][_1349];
    float _1353 = _1215 * _1247;
    float _1355 = _1217 * _1247;
    float _1357 = _1219 * _1247;
    int _1359 = _869 + 16;
    uint _1361 = uint(int(uint(_1359) >> uint(2)));
    uint _1363 = uint(int(uint(int(_1361)) >> uint(2)));
    int _1365 = int(_1361) & 3;
    float _1367 = (*spvDescriptorSet0.cp_c6)._m0[int(_1363)][_1365];
    int _1369 = int(_1361) + 1;
    uint _1371 = uint(int(uint(_1369) >> uint(2)));
    int _1373 = _1369 & 3;
    float _1375 = (*spvDescriptorSet0.cp_c6)._m0[int(_1371)][_1373];
    float _1377 = _1215 * _1255;
    float _1379 = _1219 * _1255;
    float _1381 = fma(_1221, _1269, _1353);
    float _1383 = fma(_1223, _1269, _1355);
    float _1385 = fma(_1225, _1269, _1357);
    float _1387 = _1217 * _1255;
    int _1389 = _869 + 32;
    uint _1391 = uint(int(uint(_1389) >> uint(2)));
    uint _1393 = uint(int(uint(int(_1391)) >> uint(2)));
    int _1395 = int(_1391) & 3;
    float _1397 = (*spvDescriptorSet0.cp_c6)._m0[int(_1393)][_1395];
    int _1399 = int(_1391) + 1;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    int _1403 = _1399 & 3;
    float _1405 = (*spvDescriptorSet0.cp_c6)._m0[int(_1401)][_1403];
    float _1407 = fma(_1221, _1277, _1377);
    float _1409 = fma(_1225, _1277, _1379);
    float _1411 = fma(_1223, _1277, _1387);
    float _1413 = _1215 * _1289;
    float _1415 = _1217 * _1289;
    float _1417 = _1215 * _1297;
    float _1419 = _1217 * _1297;
    int _1421 = _869 + 48;
    uint _1423 = uint(int(uint(_1421) >> uint(2)));
    uint _1425 = uint(int(uint(int(_1423)) >> uint(2)));
    int _1427 = int(_1423) & 3;
    float _1429 = (*spvDescriptorSet0.cp_c6)._m0[int(_1425)][_1427];
    int _1431 = int(_1423) + 1;
    uint _1433 = uint(int(uint(_1431) >> uint(2)));
    int _1435 = _1431 & 3;
    float _1437 = (*spvDescriptorSet0.cp_c6)._m0[int(_1433)][_1435];
    float _1439 = _1219 * _1289;
    float _1441 = _1219 * _1297;
    float _1443 = fma(_1221, _1307, _1413);
    float _1445 = fma(_1223, _1307, _1415);
    float _1447 = fma(_1221, _1315, _1417);
    float _1449 = fma(_1223, _1315, _1419);
    int _1451 = _869 + 24;
    uint _1453 = uint(int(uint(_1451) >> uint(2)));
    uint _1455 = uint(int(uint(int(_1453)) >> uint(2)));
    int _1457 = int(_1453) & 3;
    float _1459 = (*spvDescriptorSet0.cp_c6)._m0[int(_1455)][_1457];
    int _1461 = int(_1453) + 1;
    uint _1463 = uint(int(uint(_1461) >> uint(2)));
    int _1465 = _1461 & 3;
    float _1467 = (*spvDescriptorSet0.cp_c6)._m0[int(_1463)][_1465];
    float _1469 = fma(_1225, _1307, _1439);
    float _1471 = fma(_1225, _1315, _1441);
    float _1473 = fma(_1227, _1325, _1381);
    float _1475 = fma(_1227, _1333, _1407);
    float _1477 = fma(_1229, _1325, _1383);
    float _1479 = fma(_1229, _1333, _1411);
    int _1481 = _869 + 40;
    uint _1483 = uint(int(uint(_1481) >> uint(2)));
    uint _1485 = uint(int(uint(int(_1483)) >> uint(2)));
    int _1487 = int(_1483) & 3;
    float _1489 = (*spvDescriptorSet0.cp_c6)._m0[int(_1485)][_1487];
    int _1491 = int(_1483) + 1;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    int _1495 = _1491 & 3;
    float _1497 = (*spvDescriptorSet0.cp_c6)._m0[int(_1493)][_1495];
    float _1499 = fma(_1231, _1325, _1385);
    float _1501 = fma(_1231, _1333, _1409);
    float _1503 = fma(_1227, _1343, _1443);
    float _1505 = fma(_1229, _1351, _1449);
    float _1507 = fma(_1227, _1351, _1447);
    float _1509 = fma(_1231, _1351, _1471);
    int _1511 = _869 + 56;
    uint _1513 = uint(int(uint(_1511) >> uint(2)));
    uint _1515 = uint(int(uint(int(_1513)) >> uint(2)));
    int _1517 = int(_1513) & 3;
    float _1519 = (*spvDescriptorSet0.cp_c6)._m0[int(_1515)][_1517];
    int _1521 = int(_1513) + 1;
    uint _1523 = uint(int(uint(_1521) >> uint(2)));
    int _1525 = _1521 & 3;
    float _1527 = (*spvDescriptorSet0.cp_c6)._m0[int(_1523)][_1525];
    float _1529 = fma(_1229, _1343, _1445);
    float _1531 = _1505 + _1233;
    float _1533 = fma(_1231, _1343, _1469);
    float _1535 = _1509 + _1235;
    float _1537 = _1507 + _1237;
    float _1539 = _1477 * _1375;
    float _1541 = _1479 * _1375;
    float _1543 = _1529 * _1375;
    float _1545 = _1531 * _1375;
    float _1547 = fma(_1473, _1367, _1539);
    float _1549 = fma(_1475, _1367, _1541);
    float _1551 = fma(_1503, _1367, _1543);
    float _1553 = fma(_1537, _1367, _1545);
    float _1555 = _1531 * _1405;
    float _1557 = _1477 * _1405;
    float _1559 = _1479 * _1405;
    float _1561 = _1529 * _1405;
    float _1563 = fma(_1537, _1397, _1555);
    float _1565 = fma(_1473, _1397, _1557);
    float _1567 = fma(_1475, _1397, _1559);
    float _1569 = fma(_1503, _1397, _1561);
    float _1571 = _1531 * _1437;
    float _1573 = _1477 * _1437;
    float _1575 = _1479 * _1437;
    float _1577 = _1529 * _1437;
    float _1579 = fma(_1537, _1429, _1571);
    float _1581 = fma(_1473, _1429, _1573);
    float _1583 = fma(_1475, _1429, _1575);
    float _1585 = fma(_1503, _1429, _1577);
    float _1587 = fma(_1535, _1459, _1553);
    float _1589 = fma(_1499, _1459, _1547);
    float _1591 = fma(_1501, _1459, _1549);
    float _1593 = fma(_1533, _1459, _1551);
    float _1595 = _1587 + _1467;
    int _1597 = _1279 + 32;
    float _1599 = fma(_1535, _1489, _1563);
    float _1601 = fma(_1499, _1489, _1565);
    float _1603 = fma(_1501, _1489, _1567);
    int _1605 = _1279 + 16;
    float _1607 = fma(_1533, _1489, _1569);
    float _1609 = _1599 + _1497;
    int _1611 = _1279 + 48;
    float _1613 = fma(_1535, _1519, _1579);
    float _1615 = fma(_1499, _1519, _1581);
    float _1617 = fma(_1501, _1519, _1583);
    float _1619 = fma(_1533, _1519, _1585);
    float _1621 = _1613 + _1527;
    uint _1623 = uint(int(uint(_1605) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1623)] = as_type<uint>(_1589);
    int _1625 = _1605 + 4;
    uint _1627 = uint(int(uint(_1625) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1627)] = as_type<uint>(_1591);
    int _1629 = _1605 + 8;
    uint _1631 = uint(int(uint(_1629) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1631)] = as_type<uint>(_1593);
    int _1633 = _1605 + 12;
    uint _1635 = uint(int(uint(_1633) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1635)] = as_type<uint>(_1595);
    uint _1637 = uint(int(uint(_1597) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1637)] = as_type<uint>(_1601);
    int _1639 = _1597 + 4;
    uint _1641 = uint(int(uint(_1639) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1641)] = as_type<uint>(_1603);
    int _1643 = _1597 + 8;
    uint _1645 = uint(int(uint(_1643) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1645)] = as_type<uint>(_1607);
    int _1647 = _1597 + 12;
    uint _1649 = uint(int(uint(_1647) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1649)] = as_type<uint>(_1609);
    uint _1651 = uint(int(uint(_1611) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1651)] = as_type<uint>(_1615);
    int _1653 = _1611 + 4;
    uint _1655 = uint(int(uint(_1653) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1655)] = as_type<uint>(_1617);
    int _1657 = _1611 + 8;
    uint _1659 = uint(int(uint(_1657) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1659)] = as_type<uint>(_1619);
    int _1661 = _1611 + 12;
    uint _1663 = uint(int(uint(_1661) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1663)] = as_type<uint>(_1621);
}

