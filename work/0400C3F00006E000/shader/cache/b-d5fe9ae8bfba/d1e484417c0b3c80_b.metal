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
int _56(thread const int& _3943, thread const int& _3944, constant _10& support_buffer)
{
    int _3947 = 1 + _3944;
    float _3949 = support_buffer._m5[_3947].x;
    bool _3951 = _3949 == 1.0;
    if (_3951)
    {
        return _3943;
    }
    float _3953 = float(_3943);
    float _3955 = _3953 * _3949;
    int _3957 = int(_3955);
    return _3957;
}

static inline __attribute__((always_inline))
int _58(thread const int& _3979, thread const int& _3980, thread const int& _3981, thread int& _3982, thread uint& gl_SubgroupInvocationID)
{
    int _3985 = _3981 & 31;
    uint _3987 = uint(int(uint(_3981) >> uint(8)));
    int _3989 = int(_3987) & 31;
    float _3991 = as_type<float>(gl_SubgroupInvocationID);
    int _3993 = as_type<int>(_3991) & _3989;
    int _3995 = ~_3989;
    int _3997 = _3985 & _3995;
    int _3999 = _3997 | _3993;
    int _4001 = ~_3989;
    int _4003 = _3980 & _4001;
    int _4005 = _4003 | _3993;
    bool _4007 = uint(_4005) <= uint(_3999);
    _3982 = _4007 ? (-1) : 0;
    float _4009 = spvSubgroupShuffle(as_type<float>(_3979), uint(_4005));
    uint _4011 = uint(_4007 ? as_type<int>(_4009) : _3979);
    return int(_4011);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
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
    float _151 = 0.0;
    if (_125)
    {
        _151 = 2.8025969286496341418474591665798e-45;
    }
    float _153 = _151;
    int _155 = 0;
    if (_129)
    {
        uint _157 = uint(int(uint(_101) >> uint(2)));
        uint _159 = uint(int(uint(int(_157)) >> uint(2)));
        int _161 = int(_157) & 3;
        float _163 = (*spvDescriptorSet0.cp_c5)._m0[int(_159)][_161];
        _155 = as_type<int>(_163);
    }
    int _165 = _155;
    if (_129)
    {
        _133 = 1.4012984643248170709237295832899e-45;
    }
    float _167 = _133;
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
        int3 _1863 = int3(_181, _187, as_type<int>(_149));
        float3 _191 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1863.xy), uint(_1863.z), 0).xyz;
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
        int3 _1891 = int3(_215, _221, 0);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1891.xy), uint(_1891.z), 0).xyz;
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
    float _237 = _153;
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
        int3 _1922 = int3(_247, _253, as_type<int>(_153));
        float3 _255 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1922.xy), uint(_1922.z), 0).xyz;
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
        int _281 = _165;
        int _283 = 1;
        int _285 = _56(_281, _283, (*spvDescriptorSet0.support_buffer));
        int3 _1950 = int3(_279, _285, 0);
        float3 _287 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1950.xy), uint(_1950.z), 0).xyz;
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
        int _313 = _165;
        int _315 = 1;
        int _317 = _56(_313, _315, (*spvDescriptorSet0.support_buffer));
        int3 _1979 = int3(_311, _317, as_type<int>(_167));
        float3 _319 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1979.xy), uint(_1979.z), 0).xyz;
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
    float _335 = 0.0;
    if (!_129)
    {
        _333 = 0.0;
        _335 = 0.0;
    }
    float _337 = _333;
    float _339 = _335;
    float _341 = 0.0;
    float _343 = _337;
    float _345 = _339;
    if (!_129)
    {
        _341 = 0.0;
    }
    float _347 = _341;
    float _349 = 0.0;
    float _351 = 0.0;
    float _353 = _347;
    if (!_129)
    {
        _349 = 0.0;
        _351 = 0.0;
    }
    float _355 = _349;
    float _357 = _351;
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
        int _393 = _165;
        int _395 = 1;
        int _397 = _56(_393, _395, (*spvDescriptorSet0.support_buffer));
        int3 _2050 = int3(_391, _397, 2);
        float3 _399 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2050.xy), uint(_2050.z), 0).xyz;
        float _401 = _399.x;
        float _403 = _399.y;
        float _405 = _399.z;
        _369 = _327;
        _361 = _329;
        _385 = _331;
        _363 = _405;
        _343 = _295;
        _353 = _299;
        _345 = _297;
        _377 = _401;
        _379 = _403;
    }
    float _407 = _369;
    float _409 = _361;
    float _411 = _385;
    float _413 = _363;
    float _415 = _343;
    float _417 = _353;
    float _419 = _345;
    float _421 = _377;
    float _423 = _379;
    bool _425 = !_125;
    float _427 = _415;
    float _429 = _413;
    float _431 = _423;
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
        float _433 = _407 * 0.15915493667125701904296875;
        float _435 = _409 * 0.15915493667125701904296875;
        float _437 = _411 * 0.15915493667125701904296875;
        float _439 = _201 * 0.15915493667125701904296875;
        float _441 = _433 * 6.283185482025146484375;
        float _443 = cos(_441);
        float _445 = _203 * 0.15915493667125701904296875;
        float _447 = _199 * 0.15915493667125701904296875;
        int _449 = _101 + 28;
        uint _451 = uint(int(uint(_449) >> uint(2)));
        uint _453 = uint(int(uint(int(_451)) >> uint(2)));
        int _455 = int(_451) & 3;
        float _457 = (*spvDescriptorSet0.cp_c5)._m0[int(_453)][_455];
        float _459 = _435 * 6.283185482025146484375;
        float _461 = cos(_459);
        float _463 = _437 * 6.283185482025146484375;
        float _465 = sin(_463);
        float _467 = _437 * 6.283185482025146484375;
        float _469 = cos(_467);
        float _471 = _235 * _457;
        float _473 = _267 * _457;
        float _475 = _231 * _457;
        float _477 = _233 * _457;
        float _479 = _433 * 6.283185482025146484375;
        float _481 = sin(_479);
        float _483 = _465 * _443;
        float _485 = _465 * _461;
        float _487 = _435 * 6.283185482025146484375;
        float _489 = sin(_487);
        int _491 = _101 + 20;
        uint _493 = uint(int(uint(_491) >> uint(2)));
        uint _495 = uint(int(uint(int(_493)) >> uint(2)));
        int _497 = int(_493) & 3;
        float _499 = (*spvDescriptorSet0.cp_c5)._m0[int(_495)][_497];
        float _501 = _461 * _469;
        float _503 = _439 * 6.283185482025146484375;
        float _505 = cos(_503);
        float _507 = _443 * _469;
        float _509 = _481 * _469;
        float _511 = _445 * 6.283185482025146484375;
        float _513 = sin(_511);
        float _515 = _481 * _489;
        float _517 = -_509;
        float _519 = fma(_489, _483, _517);
        float _521 = -_483;
        float _523 = fma(_469, _515, _521);
        float _525 = _445 * 6.283185482025146484375;
        float _527 = cos(_525);
        float _529 = fma(_413, _499, _473);
        float _531 = fma(_415, _499, _475);
        float _533 = _447 * 6.283185482025146484375;
        float _535 = cos(_533);
        float _537 = _513 * _505;
        float _539 = _447 * 6.283185482025146484375;
        float _541 = sin(_539);
        float _543 = _439 * 6.283185482025146484375;
        float _545 = sin(_543);
        float _547 = _535 * _505;
        float _549 = _547 * _457;
        float _551 = _541 * _505;
        float _553 = _443 * _461;
        float _555 = _481 * _465;
        float _557 = _481 * _461;
        float _559 = fma(_465, _515, _507);
        float _561 = _513 * _535;
        float _563 = fma(_489, _507, _555);
        float _565 = _505 * _527;
        float _567 = _535 * _527;
        float _569 = _541 * _545;
        float _571 = _541 * _527;
        float _573 = _541 * _513;
        float _575 = _565 * _457;
        float _577 = fma(_513, _569, _567);
        float _579 = -_571;
        float _581 = fma(_545, _561, _579);
        float _583 = -_561;
        float _585 = fma(_527, _569, _583);
        float _587 = _537 * _457;
        float _589 = fma(_545, _567, _573);
        float _591 = _577 * _457;
        float _593 = _581 * _457;
        float _595 = _551 * _457;
        float _597 = fma(_485, _499, _587);
        float _599 = _585 * _457;
        float _601 = _589 * _457;
        float _603 = fma(_559, _499, _591);
        float _605 = fma(_519, _499, _593);
        float _607 = fma(_501, _499, _575);
        float _609 = _489 * _499;
        float _611 = fma(_557, _499, _595);
        float _613 = _597 * _597;
        float _615 = fma(_523, _499, _599);
        float _617 = fma(_563, _499, _601);
        float _619 = _603 * _603;
        float _621 = _605 * _605;
        float _623 = -_545;
        float _625 = -_609;
        float _627 = fma(_623, _457, _625);
        float _629 = fma(_607, _607, _613);
        float _631 = fma(_615, _615, _619);
        float _633 = fma(_553, _499, _549);
        float _635 = fma(_617, _617, _621);
        float _637 = fma(_627, _627, _629);
        float _639 = fma(_611, _611, _631);
        float _641 = _263 * _457;
        float _643 = fma(_633, _633, _635);
        float _645 = _265 * _457;
        float _647 = fma(_417, _499, _471);
        float _649 = rsqrt(_637);
        float _651 = fma(_419, _499, _477);
        float _653 = fma(_421, _499, _641);
        float _655 = fma(_423, _499, _645);
        float _657 = rsqrt(_639);
        float _659 = rsqrt(_643);
        float _661 = _627 * _649;
        float _663 = _607 * _649;
        float _665 = _597 * _649;
        float _667 = _615 * _657;
        float _669 = _603 * _657;
        float _671 = _611 * _657;
        float _673 = _617 * _659;
        float _675 = _605 * _659;
        float _677 = _633 * _659;
        _427 = _531;
        _679 = _663;
        _681 = _665;
        _683 = _661;
        _685 = _647;
        _687 = _675;
        _689 = _651;
        _691 = _667;
        _693 = _669;
        _695 = _671;
        _697 = _673;
        _699 = _677;
        _429 = _529;
        _431 = _655;
        _701 = _653;
        _703 = true;
    }
    else
    {
        float _705 = _407 * 0.15915493667125701904296875;
        float _707 = _411 * 0.15915493667125701904296875;
        float _709 = _409 * 0.15915493667125701904296875;
        float _711 = _705 * 6.283185482025146484375;
        float _713 = sin(_711);
        float _715 = _705 * 6.283185482025146484375;
        float _717 = cos(_715);
        float _719 = _707 * 6.283185482025146484375;
        float _721 = sin(_719);
        float _723 = _707 * 6.283185482025146484375;
        float _725 = cos(_723);
        float _727 = _709 * 6.283185482025146484375;
        float _729 = sin(_727);
        float _731 = _721 * _717;
        float _733 = _713 * _721;
        float _735 = _709 * 6.283185482025146484375;
        float _737 = cos(_735);
        float _739 = _717 * _725;
        float _741 = _713 * _725;
        float _743 = _713 * _729;
        float _745 = fma(_729, _739, _733);
        float _747 = fma(_721, _743, _739);
        float _749 = -_729;
        float _751 = _749 + (-0.0);
        float _753 = _717 * _737;
        float _755 = _737 * _725;
        float _757 = _721 * _737;
        float _759 = _713 * _737;
        float _761 = -_731;
        float _763 = fma(_725, _743, _761);
        float _765 = -_741;
        float _767 = fma(_729, _731, _765);
        _679 = _755;
        _681 = _757;
        _683 = _751;
        _685 = _417;
        _687 = _767;
        _689 = _419;
        _691 = _763;
        _693 = _747;
        _695 = _759;
        _697 = _745;
        _699 = _753;
        _701 = _421;
    }
    _703 = false;
    float _769 = _427;
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
    float _793 = _429;
    float _795 = _431;
    float _797 = _701;
    bool _799 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _801 = _769 * _771;
    float _803 = _769 * _773;
    float _805 = _769 * _775;
    float _807 = _777 * _779;
    float _809 = _781 * _783;
    float _811 = _781 * _785;
    float _813 = _781 * _787;
    float _815 = _777 * _789;
    float _817 = _777 * _791;
    int _819 = _68 * 112;
    bool _821 = !_799;
    float _823 = _801;
    float _825 = _809;
    float _827 = _815;
    float _829 = _797;
    float _831 = _803;
    float _833 = _811;
    float _835 = _807;
    float _837 = _795;
    float _839 = _805;
    float _841 = _813;
    float _843 = _817;
    float _845 = _793;
    if (!_821)
    {
        int _847 = 0;
        float _849 = _801;
        float _851 = _809;
        float _853 = _815;
        float _855 = _797;
        float _857 = _803;
        float _859 = _811;
        float _861 = _807;
        float _863 = _795;
        float _865 = _805;
        float _867 = _813;
        float _869 = _817;
        float _871 = _793;
        bool _873;
        int _921;
        int _931;
        int _941;
        int _951;
        int _961;
        int _971;
        int _981;
        int _991;
        int _1001;
        int _1011;
        int _1021;
        int _1031;
        float _1139;
        float _1141;
        float _1143;
        int _1145;
        float _1147;
        int _1149;
        int _1151;
        int _1153;
        int _1155;
        float _1157;
        float _1159;
        float _1161;
        do
        {
            int _875 = _847;
            float _877 = _849;
            float _879 = _851;
            float _881 = _853;
            int _883 = as_type<int>(_855);
            float _885 = _857;
            int _887 = as_type<int>(_859);
            int _889 = as_type<int>(_861);
            int _891 = as_type<int>(_863);
            int _893 = as_type<int>(_865);
            float _895 = _867;
            float _897 = _869;
            float _899 = _871;
            uint _901 = uint(int(uint(_819) >> uint(2)));
            uint _903 = uint(int(uint(int(_901)) >> uint(2)));
            int _905 = int(_901) & 3;
            float _907 = (*spvDescriptorSet0.cp_c6)._m0[int(_903)][_905];
            bool _909 = _68 != 0;
            int _911 = _875 + 1;
            bool _913 = uint(_911) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _915 = as_type<int>(_877);
            int _917 = as_type<int>(_907);
            int _919 = 31;
            int _2694 = _58(_915, _917, _919, _921, gl_SubgroupInvocationID);
            int _923 = _2694;
            int _925 = as_type<int>(_879);
            int _927 = as_type<int>(_907);
            int _929 = 31;
            int _2699 = _58(_925, _927, _929, _931, gl_SubgroupInvocationID);
            int _933 = _2699;
            int _935 = as_type<int>(_881);
            int _937 = as_type<int>(_907);
            int _939 = 31;
            int _2704 = _58(_935, _937, _939, _941, gl_SubgroupInvocationID);
            int _943 = _2704;
            int _945 = _883;
            int _947 = as_type<int>(_907);
            int _949 = 31;
            int _2708 = _58(_945, _947, _949, _951, gl_SubgroupInvocationID);
            int _953 = _2708;
            int _955 = as_type<int>(_885);
            int _957 = as_type<int>(_907);
            int _959 = 31;
            int _2713 = _58(_955, _957, _959, _961, gl_SubgroupInvocationID);
            int _963 = _2713;
            int _965 = _887;
            int _967 = as_type<int>(_907);
            int _969 = 31;
            int _2717 = _58(_965, _967, _969, _971, gl_SubgroupInvocationID);
            int _973 = _2717;
            int _975 = _889;
            int _977 = as_type<int>(_907);
            int _979 = 31;
            int _2721 = _58(_975, _977, _979, _981, gl_SubgroupInvocationID);
            int _983 = _2721;
            int _985 = _891;
            int _987 = as_type<int>(_907);
            int _989 = 31;
            int _2725 = _58(_985, _987, _989, _991, gl_SubgroupInvocationID);
            int _993 = _2725;
            int _995 = _893;
            int _997 = as_type<int>(_907);
            int _999 = 31;
            int _2729 = _58(_995, _997, _999, _1001, gl_SubgroupInvocationID);
            int _1003 = _2729;
            int _1005 = as_type<int>(_895);
            int _1007 = as_type<int>(_907);
            int _1009 = 31;
            int _2734 = _58(_1005, _1007, _1009, _1011, gl_SubgroupInvocationID);
            int _1013 = _2734;
            int _1015 = as_type<int>(_897);
            int _1017 = as_type<int>(_907);
            int _1019 = 31;
            int _2739 = _58(_1015, _1017, _1019, _1021, gl_SubgroupInvocationID);
            int _1023 = _2739;
            int _1025 = as_type<int>(_899);
            int _1027 = as_type<int>(_907);
            int _1029 = 31;
            int _2744 = _58(_1025, _1027, _1029, _1031, gl_SubgroupInvocationID);
            int _1033 = _2744;
            bool _1035 = !_909;
            _847 = _911;
            float _1037 = _877;
            float _1039 = _879;
            float _1041 = _881;
            int _1043 = _883;
            float _1045 = _885;
            int _1047 = _887;
            int _1049 = _889;
            int _1051 = _891;
            int _1053 = _893;
            float _1055 = _895;
            float _1057 = _897;
            float _1059 = _899;
            if (!_1035)
            {
                float _1061 = as_type<float>(_933) * _795;
                float _1063 = _803 * as_type<float>(_933);
                float _1065 = _811 * as_type<float>(_933);
                float _1067 = _807 * as_type<float>(_933);
                float _1069 = fma(as_type<float>(_923), _797, _1061);
                float _1071 = _803 * as_type<float>(_973);
                float _1073 = _811 * as_type<float>(_973);
                float _1075 = _807 * as_type<float>(_973);
                float _1077 = as_type<float>(_973) * _795;
                float _1079 = fma(_801, as_type<float>(_923), _1063);
                float _1081 = fma(_809, as_type<float>(_923), _1065);
                float _1083 = fma(_815, as_type<float>(_923), _1067);
                float _1085 = fma(_801, as_type<float>(_963), _1071);
                float _1087 = fma(_809, as_type<float>(_963), _1073);
                float _1089 = fma(_815, as_type<float>(_963), _1075);
                float _1091 = _803 * as_type<float>(_1013);
                float _1093 = as_type<float>(_1013) * _795;
                float _1095 = fma(as_type<float>(_963), _797, _1077);
                float _1097 = _807 * as_type<float>(_1013);
                float _1099 = _811 * as_type<float>(_1013);
                float _1101 = fma(_801, as_type<float>(_1003), _1091);
                float _1103 = fma(as_type<float>(_1003), _797, _1093);
                float _1105 = fma(_815, as_type<float>(_1003), _1097);
                float _1107 = fma(_817, as_type<float>(_943), _1083);
                float _1109 = fma(_809, as_type<float>(_1003), _1099);
                float _1111 = fma(_805, as_type<float>(_943), _1079);
                float _1113 = fma(_813, as_type<float>(_943), _1081);
                float _1115 = fma(_813, as_type<float>(_983), _1087);
                float _1117 = fma(as_type<float>(_943), _793, _1069);
                float _1119 = fma(_805, as_type<float>(_983), _1085);
                float _1121 = fma(_817, as_type<float>(_983), _1089);
                float _1123 = fma(as_type<float>(_983), _793, _1095);
                float _1125 = fma(as_type<float>(_1023), _793, _1103);
                float _1127 = fma(_813, as_type<float>(_1023), _1109);
                float _1129 = fma(_805, as_type<float>(_1023), _1101);
                float _1131 = fma(_817, as_type<float>(_1023), _1105);
                float _1133 = as_type<float>(_953) + _1117;
                float _1135 = as_type<float>(_993) + _1123;
                float _1137 = as_type<float>(_1033) + _1125;
                _1037 = _1111;
                _1039 = _1113;
                _1041 = _1107;
                _1043 = as_type<int>(_1133);
                _1045 = _1119;
                _1047 = as_type<int>(_1115);
                _1049 = as_type<int>(_1121);
                _1051 = as_type<int>(_1135);
                _1053 = as_type<int>(_1129);
                _1055 = _1127;
                _1057 = _1131;
                _1059 = _1137;
            }
            _1139 = _1037;
            _1141 = _1039;
            _1143 = _1041;
            _1145 = _1043;
            _1147 = _1045;
            _1149 = _1047;
            _1151 = _1049;
            _1153 = _1051;
            _1155 = _1053;
            _1157 = _1055;
            _1159 = _1057;
            _1161 = _1059;
            _873 = !_913;
            _849 = _1139;
            _851 = _1141;
            _853 = _1143;
            _855 = as_type<float>(_1145);
            _857 = _1147;
            _859 = as_type<float>(_1149);
            _861 = as_type<float>(_1151);
            _863 = as_type<float>(_1153);
            _865 = as_type<float>(_1155);
            _867 = _1157;
            _869 = _1159;
            _871 = _1161;
        } while (_873);
        _823 = _1139;
        _825 = _1141;
        _827 = _1143;
        _829 = as_type<float>(_1145);
        _831 = _1147;
        _833 = as_type<float>(_1149);
        _835 = as_type<float>(_1151);
        _837 = as_type<float>(_1153);
        _839 = as_type<float>(_1155);
        _841 = _1157;
        _843 = _1159;
        _845 = _1161;
    }
    float _1163 = _823;
    float _1165 = _825;
    float _1167 = _827;
    float _1169 = _829;
    float _1171 = _831;
    float _1173 = _833;
    float _1175 = _835;
    float _1177 = _837;
    float _1179 = _839;
    float _1181 = _841;
    float _1183 = _843;
    float _1185 = _845;
    int _1187 = _819 + 80;
    uint _1189 = uint(int(uint(_1187) >> uint(2)));
    uint _1191 = uint(int(uint(int(_1189)) >> uint(2)));
    int _1193 = int(_1189) & 3;
    float _1195 = (*spvDescriptorSet0.cp_c6)._m0[int(_1191)][_1193];
    int _1197 = int(_1189) + 1;
    uint _1199 = uint(int(uint(_1197) >> uint(2)));
    int _1201 = _1197 & 3;
    float _1203 = (*spvDescriptorSet0.cp_c6)._m0[int(_1199)][_1201];
    bool _1205 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1207 = _819 + 64;
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
    int _1229 = _819 + 88;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    uint _1233 = uint(int(uint(int(_1231)) >> uint(2)));
    int _1235 = int(_1231) & 3;
    float _1237 = (*spvDescriptorSet0.cp_c6)._m0[int(_1233)][_1235];
    int _1239 = int(_1231) + 1;
    uint _1241 = uint(int(uint(_1239) >> uint(2)));
    int _1243 = _1239 & 3;
    float _1245 = (*spvDescriptorSet0.cp_c6)._m0[int(_1241)][_1243];
    int _1247 = _819 + 72;
    uint _1249 = uint(int(uint(_1247) >> uint(2)));
    uint _1251 = uint(int(uint(int(_1249)) >> uint(2)));
    int _1253 = int(_1249) & 3;
    float _1255 = (*spvDescriptorSet0.cp_c6)._m0[int(_1251)][_1253];
    int _1257 = int(_1249) + 1;
    uint _1259 = uint(int(uint(_1257) >> uint(2)));
    int _1261 = _1257 & 3;
    float _1263 = (*spvDescriptorSet0.cp_c6)._m0[int(_1259)][_1261];
    int _1265 = _819 + 96;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    uint _1269 = uint(int(uint(int(_1267)) >> uint(2)));
    int _1271 = int(_1267) & 3;
    float _1273 = (*spvDescriptorSet0.cp_c6)._m0[int(_1269)][_1271];
    int _1275 = int(_1267) + 1;
    uint _1277 = uint(int(uint(_1275) >> uint(2)));
    int _1279 = _1275 & 3;
    float _1281 = (*spvDescriptorSet0.cp_c6)._m0[int(_1277)][_1279];
    int _1283 = _819 + 104;
    uint _1285 = uint(int(uint(_1283) >> uint(2)));
    uint _1287 = uint(int(uint(int(_1285)) >> uint(2)));
    int _1289 = int(_1285) & 3;
    float _1291 = (*spvDescriptorSet0.cp_c6)._m0[int(_1287)][_1289];
    int _1293 = int(_1285) + 1;
    uint _1295 = uint(int(uint(_1293) >> uint(2)));
    int _1297 = _1293 & 3;
    float _1299 = (*spvDescriptorSet0.cp_c6)._m0[int(_1295)][_1297];
    int _1301 = _819 + 16;
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
        int _1319 = _68 * 48;
        int _1321 = _1319 + 16;
        uint _1323 = uint(int(uint(_1319) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1323)] = as_type<uint>(_1163);
        int _1325 = _1319 + 4;
        uint _1327 = uint(int(uint(_1325) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1327)] = as_type<uint>(_1165);
        int _1329 = _1319 + 8;
        uint _1331 = uint(int(uint(_1329) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1331)] = as_type<uint>(_1167);
        int _1333 = _1319 + 12;
        uint _1335 = uint(int(uint(_1333) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1335)] = as_type<uint>(_1169);
        int _1337 = _1319 + 32;
        uint _1339 = uint(int(uint(_1321) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1339)] = as_type<uint>(_1171);
        int _1341 = _1321 + 4;
        uint _1343 = uint(int(uint(_1341) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1343)] = as_type<uint>(_1173);
        int _1345 = _1321 + 8;
        uint _1347 = uint(int(uint(_1345) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1347)] = as_type<uint>(_1175);
        int _1349 = _1321 + 12;
        uint _1351 = uint(int(uint(_1349) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1351)] = as_type<uint>(_1177);
        uint _1353 = uint(int(uint(_1337) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1353)] = as_type<uint>(_1179);
        int _1355 = _1337 + 4;
        uint _1357 = uint(int(uint(_1355) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1357)] = as_type<uint>(_1181);
        int _1359 = _1337 + 8;
        uint _1361 = uint(int(uint(_1359) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1361)] = as_type<uint>(_1183);
        int _1363 = _1337 + 12;
        uint _1365 = uint(int(uint(_1363) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1365)] = as_type<uint>(_1185);
    }
    float _1367 = _1181 * _1195;
    float _1369 = _1165 * _1195;
    float _1371 = _1173 * _1195;
    int _1373 = _819 + 32;
    uint _1375 = uint(int(uint(_1373) >> uint(2)));
    uint _1377 = uint(int(uint(int(_1375)) >> uint(2)));
    int _1379 = int(_1375) & 3;
    float _1381 = (*spvDescriptorSet0.cp_c6)._m0[int(_1377)][_1379];
    int _1383 = int(_1375) + 1;
    uint _1385 = uint(int(uint(_1383) >> uint(2)));
    int _1387 = _1383 & 3;
    float _1389 = (*spvDescriptorSet0.cp_c6)._m0[int(_1385)][_1387];
    float _1391 = fma(_1179, _1215, _1367);
    float _1393 = _1165 * _1203;
    float _1395 = fma(_1163, _1215, _1369);
    float _1397 = fma(_1171, _1215, _1371);
    float _1399 = _1173 * _1203;
    float _1401 = fma(_1163, _1223, _1393);
    float _1403 = _1165 * _1237;
    float _1405 = _1165 * _1245;
    float _1407 = _1181 * _1203;
    int _1409 = _819 + 48;
    uint _1411 = uint(int(uint(_1409) >> uint(2)));
    uint _1413 = uint(int(uint(int(_1411)) >> uint(2)));
    int _1415 = int(_1411) & 3;
    float _1417 = (*spvDescriptorSet0.cp_c6)._m0[int(_1413)][_1415];
    int _1419 = int(_1411) + 1;
    uint _1421 = uint(int(uint(_1419) >> uint(2)));
    int _1423 = _1419 & 3;
    float _1425 = (*spvDescriptorSet0.cp_c6)._m0[int(_1421)][_1423];
    float _1427 = _1173 * _1237;
    float _1429 = _1173 * _1245;
    float _1431 = fma(_1171, _1223, _1399);
    float _1433 = fma(_1179, _1223, _1407);
    float _1435 = _1181 * _1237;
    float _1437 = _1181 * _1245;
    float _1439 = fma(_1163, _1255, _1403);
    float _1441 = fma(_1163, _1263, _1405);
    float _1443 = fma(_1171, _1255, _1427);
    int _1445 = _819 + 24;
    uint _1447 = uint(int(uint(_1445) >> uint(2)));
    uint _1449 = uint(int(uint(int(_1447)) >> uint(2)));
    int _1451 = int(_1447) & 3;
    float _1453 = (*spvDescriptorSet0.cp_c6)._m0[int(_1449)][_1451];
    int _1455 = int(_1447) + 1;
    uint _1457 = uint(int(uint(_1455) >> uint(2)));
    int _1459 = _1455 & 3;
    float _1461 = (*spvDescriptorSet0.cp_c6)._m0[int(_1457)][_1459];
    float _1463 = fma(_1171, _1263, _1429);
    float _1465 = fma(_1179, _1263, _1437);
    float _1467 = fma(_1179, _1255, _1435);
    float _1469 = fma(_1167, _1273, _1395);
    float _1471 = fma(_1175, _1299, _1463);
    float _1473 = fma(_1175, _1273, _1397);
    float _1475 = fma(_1183, _1273, _1391);
    int _1477 = _819 + 40;
    uint _1479 = uint(int(uint(_1477) >> uint(2)));
    uint _1481 = uint(int(uint(int(_1479)) >> uint(2)));
    int _1483 = int(_1479) & 3;
    float _1485 = (*spvDescriptorSet0.cp_c6)._m0[int(_1481)][_1483];
    int _1487 = int(_1479) + 1;
    uint _1489 = uint(int(uint(_1487) >> uint(2)));
    int _1491 = _1487 & 3;
    float _1493 = (*spvDescriptorSet0.cp_c6)._m0[int(_1489)][_1491];
    float _1495 = fma(_1167, _1281, _1401);
    float _1497 = fma(_1167, _1291, _1439);
    float _1499 = fma(_1167, _1299, _1441);
    float _1501 = fma(_1175, _1281, _1431);
    float _1503 = fma(_1175, _1291, _1443);
    float _1505 = fma(_1183, _1299, _1465);
    float _1507 = _1471 + _1177;
    int _1509 = _819 + 56;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    uint _1513 = uint(int(uint(int(_1511)) >> uint(2)));
    int _1515 = int(_1511) & 3;
    float _1517 = (*spvDescriptorSet0.cp_c6)._m0[int(_1513)][_1515];
    int _1519 = int(_1511) + 1;
    uint _1521 = uint(int(uint(_1519) >> uint(2)));
    int _1523 = _1519 & 3;
    float _1525 = (*spvDescriptorSet0.cp_c6)._m0[int(_1521)][_1523];
    float _1527 = fma(_1183, _1281, _1433);
    float _1529 = fma(_1183, _1291, _1467);
    float _1531 = _1505 + _1185;
    float _1533 = _1499 + _1169;
    float _1535 = _1473 * _1317;
    float _1537 = _1501 * _1317;
    float _1539 = _1503 * _1317;
    float _1541 = _1507 * _1317;
    float _1543 = fma(_1469, _1309, _1535);
    float _1545 = fma(_1495, _1309, _1537);
    float _1547 = fma(_1497, _1309, _1539);
    float _1549 = fma(_1533, _1309, _1541);
    float _1551 = _1507 * _1389;
    float _1553 = _1473 * _1389;
    float _1555 = _1501 * _1389;
    float _1557 = _1503 * _1389;
    float _1559 = fma(_1533, _1381, _1551);
    float _1561 = fma(_1469, _1381, _1553);
    float _1563 = fma(_1495, _1381, _1555);
    float _1565 = fma(_1497, _1381, _1557);
    int _1567 = _1227 * 48;
    float _1569 = _1507 * _1425;
    float _1571 = _1473 * _1425;
    float _1573 = _1501 * _1425;
    float _1575 = _1503 * _1425;
    float _1577 = fma(_1533, _1417, _1569);
    float _1579 = fma(_1469, _1417, _1571);
    float _1581 = fma(_1495, _1417, _1573);
    float _1583 = fma(_1497, _1417, _1575);
    float _1585 = fma(_1531, _1453, _1549);
    float _1587 = fma(_1527, _1453, _1545);
    float _1589 = fma(_1475, _1453, _1543);
    float _1591 = fma(_1529, _1453, _1547);
    float _1593 = _1585 + _1461;
    float _1595 = fma(_1531, _1485, _1559);
    float _1597 = fma(_1475, _1485, _1561);
    float _1599 = fma(_1527, _1485, _1563);
    float _1601 = fma(_1529, _1485, _1565);
    float _1603 = _1595 + _1493;
    int _1605 = _1567 + 16;
    int _1607 = _1567 + 32;
    float _1609 = fma(_1531, _1517, _1577);
    float _1611 = fma(_1475, _1517, _1579);
    float _1613 = fma(_1527, _1517, _1581);
    float _1615 = fma(_1529, _1517, _1583);
    float _1617 = _1609 + _1525;
    int _1619 = _1567 + 48;
    uint _1621 = uint(int(uint(_1605) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1621)] = as_type<uint>(_1589);
    int _1623 = _1605 + 4;
    uint _1625 = uint(int(uint(_1623) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1625)] = as_type<uint>(_1587);
    int _1627 = _1605 + 8;
    uint _1629 = uint(int(uint(_1627) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1629)] = as_type<uint>(_1591);
    int _1631 = _1605 + 12;
    uint _1633 = uint(int(uint(_1631) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1633)] = as_type<uint>(_1593);
    uint _1635 = uint(int(uint(_1607) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1635)] = as_type<uint>(_1597);
    int _1637 = _1607 + 4;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1639)] = as_type<uint>(_1599);
    int _1641 = _1607 + 8;
    uint _1643 = uint(int(uint(_1641) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1643)] = as_type<uint>(_1601);
    int _1645 = _1607 + 12;
    uint _1647 = uint(int(uint(_1645) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1647)] = as_type<uint>(_1603);
    uint _1649 = uint(int(uint(_1619) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1649)] = as_type<uint>(_1611);
    int _1651 = _1619 + 4;
    uint _1653 = uint(int(uint(_1651) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1653)] = as_type<uint>(_1613);
    int _1655 = _1619 + 8;
    uint _1657 = uint(int(uint(_1655) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1657)] = as_type<uint>(_1615);
    int _1659 = _1619 + 12;
    uint _1661 = uint(int(uint(_1659) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1661)] = as_type<uint>(_1617);
}

