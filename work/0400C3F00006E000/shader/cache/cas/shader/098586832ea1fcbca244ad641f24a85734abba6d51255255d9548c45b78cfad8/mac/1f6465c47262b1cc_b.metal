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
int _56(thread const int& _3663, thread const int& _3664, constant _10& support_buffer)
{
    int _3667 = 1 + _3664;
    float _3669 = support_buffer._m5[_3667].x;
    bool _3671 = _3669 == 1.0;
    if (_3671)
    {
        return _3663;
    }
    float _3673 = float(_3663);
    float _3675 = _3673 * _3669;
    int _3677 = int(_3675);
    return _3677;
}

static inline __attribute__((always_inline))
int _58(thread const int& _3699, thread const int& _3700, thread const int& _3701, thread int& _3702, thread uint& gl_SubgroupInvocationID)
{
    int _3705 = _3701 & 31;
    uint _3707 = uint(int(uint(_3701) >> uint(8)));
    int _3709 = int(_3707) & 31;
    float _3711 = as_type<float>(gl_SubgroupInvocationID);
    int _3713 = as_type<int>(_3711) & _3709;
    int _3715 = ~_3709;
    int _3717 = _3705 & _3715;
    int _3719 = _3717 | _3713;
    int _3721 = ~_3709;
    int _3723 = _3700 & _3721;
    int _3725 = _3723 | _3713;
    bool _3727 = uint(_3725) <= uint(_3719);
    _3702 = _3727 ? (-1) : 0;
    float _3729 = spvSubgroupShuffle(as_type<float>(_3699), uint(_3725));
    uint _3731 = uint(_3727 ? as_type<int>(_3729) : _3699);
    return int(_3731);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1093 = false;
    bool _573 = false;
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
    int _99 = _78 ? _91 : _97;
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
    int _123 = _99 & as_type<int>(_111);
    bool _125 = _123 != 0;
    int _127 = _99 & as_type<int>(_121);
    bool _129 = _127 != 0;
    int _131 = as_type<int>(_111);
    if (_125)
    {
        int _133 = _101 + 8;
        uint _135 = uint(int(uint(_133) >> uint(2)));
        uint _137 = uint(int(uint(int(_135)) >> uint(2)));
        int _139 = int(_135) & 3;
        float _141 = (*spvDescriptorSet0.cp_c5)._m0[int(_137)][_139];
        _131 = as_type<int>(_141);
    }
    int _143 = _131;
    float _145 = 0.0;
    if (_125)
    {
        _145 = 1.4012984643248170709237295832899e-45;
    }
    float _147 = _145;
    float _149 = 0.0;
    if (_125)
    {
        _149 = 2.8025969286496341418474591665798e-45;
    }
    float _151 = _149;
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
    float _169 = _147;
    float _171 = as_type<float>(_68);
    float _173 = 0.0;
    float _175 = as_type<float>(_143);
    if (_125)
    {
        int _177 = _68;
        int _179 = 0;
        int _181 = _56(_177, _179, (*spvDescriptorSet0.support_buffer));
        int _183 = _143;
        int _185 = 0;
        int _187 = _56(_183, _185, (*spvDescriptorSet0.support_buffer));
        int3 _1746 = int3(_181, _187, as_type<int>(_147));
        float3 _191 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1746.xy), uint(_1746.z), 0).xyz;
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
        int _217 = _143;
        int _219 = 0;
        int _221 = _56(_217, _219, (*spvDescriptorSet0.support_buffer));
        int3 _1774 = int3(_215, _221, 0);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1774.xy), uint(_1774.z), 0).xyz;
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
        int _249 = _143;
        int _251 = 0;
        int _253 = _56(_249, _251, (*spvDescriptorSet0.support_buffer));
        int3 _1805 = int3(_247, _253, as_type<int>(_151));
        float3 _255 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1805.xy), uint(_1805.z), 0).xyz;
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
        int3 _1833 = int3(_279, _285, 0);
        float3 _287 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1833.xy), uint(_1833.z), 0).xyz;
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
        int3 _1862 = int3(_311, _317, as_type<int>(_167));
        float3 _319 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1862.xy), uint(_1862.z), 0).xyz;
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
    float _343 = 0.0;
    float _345 = _337;
    float _347 = _339;
    if (!_129)
    {
        _341 = 0.0;
        _343 = 0.0;
    }
    float _349 = _341;
    float _351 = _343;
    float _353 = 0.0;
    float _355 = _351;
    float _357 = _349;
    if (!_129)
    {
        _353 = 0.0;
    }
    float _359 = _353;
    float _361 = 0.0;
    float _363 = 0.0;
    float _365 = _359;
    if (!_129)
    {
        _361 = 0.0;
        _363 = 0.0;
    }
    float _367 = _361;
    float _369 = _363;
    float _371 = 0.0;
    float _373 = _367;
    float _375 = _369;
    if (!_129)
    {
        _175 = 0.0;
        _371 = 0.0;
    }
    float _377 = _175;
    float _379 = _371;
    bool _381 = !_129;
    float _383 = _377;
    float _385 = _379;
    if (!_381)
    {
        int _387 = _68;
        int _389 = 1;
        int _391 = _56(_387, _389, (*spvDescriptorSet0.support_buffer));
        int _393 = _163;
        int _395 = 1;
        int _397 = _56(_393, _395, (*spvDescriptorSet0.support_buffer));
        int3 _1929 = int3(_391, _397, 2);
        float3 _399 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1929.xy), uint(_1929.z), 0).xyz;
        float _401 = _399.x;
        float _403 = _399.y;
        float _405 = _399.z;
        _365 = _327;
        _373 = _331;
        _375 = _329;
        _345 = _297;
        _347 = _295;
        _383 = _403;
        _355 = _299;
        _385 = _401;
        _357 = _405;
    }
    float _407 = _365;
    float _409 = _373;
    float _411 = _375;
    float _413 = _345;
    float _415 = _347;
    float _417 = _383;
    float _419 = _355;
    float _421 = _385;
    float _423 = _357;
    bool _425 = !_125;
    float _427 = _419;
    float _429 = _415;
    float _431 = _413;
    float _433 = _417;
    float _435 = _423;
    float _553;
    float _555;
    float _557;
    float _559;
    float _561;
    float _563;
    float _565;
    float _567;
    float _569;
    float _571;
    if (!_425)
    {
        int _437 = _101 + 28;
        uint _439 = uint(int(uint(_437) >> uint(2)));
        uint _441 = uint(int(uint(int(_439)) >> uint(2)));
        int _443 = int(_439) & 3;
        float _445 = (*spvDescriptorSet0.cp_c5)._m0[int(_441)][_443];
        int _447 = _101 + 20;
        uint _449 = uint(int(uint(_447) >> uint(2)));
        uint _451 = uint(int(uint(int(_449)) >> uint(2)));
        int _453 = int(_449) & 3;
        float _455 = (*spvDescriptorSet0.cp_c5)._m0[int(_451)][_453];
        float _457 = _199 * _445;
        float _459 = _203 * _445;
        float _461 = _201 * _445;
        float _463 = _233 * _445;
        float _465 = _231 * _445;
        float _467 = fma(_407, _455, _457);
        float _469 = fma(_409, _455, _459);
        float _471 = fma(_411, _455, _461);
        float _473 = _263 * _445;
        float _475 = _467 * 0.15915493667125701904296875;
        float _477 = _469 * 0.15915493667125701904296875;
        float _479 = _471 * 0.15915493667125701904296875;
        float _481 = _265 * _445;
        float _483 = _475 * 6.283185482025146484375;
        float _485 = sin(_483);
        float _487 = _235 * _445;
        float _489 = fma(_413, _455, _463);
        float _491 = fma(_415, _455, _465);
        float _493 = fma(_417, _455, _481);
        float _495 = fma(_419, _455, _487);
        float _497 = _267 * _445;
        float _499 = fma(_421, _455, _473);
        float _501 = _475 * 6.283185482025146484375;
        float _503 = cos(_501);
        float _505 = fma(_423, _455, _497);
        float _507 = _477 * 6.283185482025146484375;
        float _509 = sin(_507);
        float _511 = _479 * 6.283185482025146484375;
        float _513 = sin(_511);
        float _515 = _477 * 6.283185482025146484375;
        float _517 = cos(_515);
        float _519 = _479 * 6.283185482025146484375;
        float _521 = cos(_519);
        float _523 = _509 * _503;
        float _525 = _485 * _513;
        float _527 = _503 * _517;
        float _529 = -_523;
        float _531 = fma(_517, _525, _529);
        float _533 = fma(_509, _525, _527);
        float _535 = _503 * _521;
        float _537 = _521 * _517;
        float _539 = _509 * _521;
        float _541 = _485 * _521;
        float _543 = _485 * _509;
        float _545 = _485 * _517;
        float _547 = fma(_513, _527, _543);
        float _549 = -_545;
        float _551 = fma(_513, _523, _549);
        _427 = _495;
        _553 = _547;
        _429 = _491;
        _555 = _513;
        _557 = _537;
        _559 = _551;
        _561 = _539;
        _431 = _489;
        _563 = _531;
        _565 = _533;
        _567 = _541;
        _569 = _535;
        _571 = _499;
        _433 = _493;
        _435 = _505;
        _573 = true;
    }
    else
    {
        float _575 = _407 * 0.15915493667125701904296875;
        float _577 = _409 * 0.15915493667125701904296875;
        float _579 = _411 * 0.15915493667125701904296875;
        float _581 = _575 * 6.283185482025146484375;
        float _583 = sin(_581);
        float _585 = _575 * 6.283185482025146484375;
        float _587 = cos(_585);
        float _589 = _577 * 6.283185482025146484375;
        float _591 = sin(_589);
        float _593 = _577 * 6.283185482025146484375;
        float _595 = cos(_593);
        float _597 = _579 * 6.283185482025146484375;
        float _599 = cos(_597);
        float _601 = _591 * _587;
        float _603 = _583 * _591;
        float _605 = _579 * 6.283185482025146484375;
        float _607 = sin(_605);
        float _609 = _587 * _595;
        float _611 = _587 * _599;
        float _613 = _599 * _595;
        float _615 = _591 * _599;
        float _617 = _583 * _599;
        float _619 = _583 * _595;
        float _621 = _583 * _607;
        float _623 = -_619;
        float _625 = fma(_607, _601, _623);
        float _627 = fma(_591, _621, _609);
        float _629 = fma(_607, _609, _603);
        float _631 = -_601;
        float _633 = fma(_595, _621, _631);
        _553 = _629;
        _555 = _607;
        _557 = _613;
        _559 = _625;
        _561 = _615;
        _563 = _633;
        _565 = _627;
        _567 = _617;
        _569 = _611;
        _571 = _421;
    }
    _573 = false;
    float _635 = _427;
    float _637 = _553;
    float _639 = _429;
    float _641 = _555;
    float _643 = _557;
    float _645 = _559;
    float _647 = _561;
    float _649 = _431;
    float _651 = _563;
    float _653 = _565;
    float _655 = _567;
    float _657 = _569;
    float _659 = _571;
    float _661 = _433;
    float _663 = _435;
    float _665 = _635 * _637;
    float _667 = _639 * _641;
    bool _669 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _671 = _639 * _643;
    bool _673 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _675 = _635 * _645;
    float _677 = _639 * _647;
    float _679 = _649 * _651;
    float _681 = _649 * _653;
    float _683 = _649 * _655;
    float _685 = _635 * _657;
    float _687 = _665;
    float _689 = _659;
    if (!_673)
    {
        int _691 = _68 * 48;
        float _693 = -_667;
        float _695 = _693 + (-0.0);
        int _697 = _691 + 16;
        uint _699 = uint(int(uint(_691) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_699)] = as_type<uint>(_671);
        int _701 = _691 + 4;
        uint _703 = uint(int(uint(_701) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_703)] = as_type<uint>(_679);
        int _705 = _691 + 8;
        uint _707 = uint(int(uint(_705) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_707)] = as_type<uint>(_665);
        int _709 = _691 + 12;
        uint _711 = uint(int(uint(_709) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_711)] = as_type<uint>(_659);
        int _713 = _691 + 32;
        uint _715 = uint(int(uint(_697) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_715)] = as_type<uint>(_677);
        int _717 = _697 + 4;
        uint _719 = uint(int(uint(_717) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_719)] = as_type<uint>(_681);
        int _721 = _697 + 8;
        uint _723 = uint(int(uint(_721) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_723)] = as_type<uint>(_675);
        int _725 = _697 + 12;
        uint _727 = uint(int(uint(_725) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_727)] = as_type<uint>(_661);
        uint _729 = uint(int(uint(_713) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_729)] = as_type<uint>(_695);
        int _731 = _713 + 4;
        uint _733 = uint(int(uint(_731) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_733)] = as_type<uint>(_683);
        int _735 = _713 + 8;
        uint _737 = uint(int(uint(_735) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_737)] = as_type<uint>(_685);
        int _739 = _713 + 12;
        uint _741 = uint(int(uint(_739) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_741)] = as_type<uint>(_663);
    }
    int _743 = _68 * 112;
    bool _745 = !_669;
    float _1073;
    float _1075;
    float _1077;
    float _1079;
    float _1081;
    float _1083;
    float _1085;
    float _1087;
    float _1089;
    float _1091;
    if (!_745)
    {
        float _747 = -_667;
        float _749 = _747 + (-0.0);
        int _751 = 0;
        float _753 = _671;
        float _755 = _679;
        float _757 = _665;
        float _759 = _659;
        float _761 = _677;
        float _763 = _681;
        float _765 = _675;
        float _767 = _661;
        float _769 = _749;
        float _771 = _683;
        float _773 = _685;
        float _775 = _663;
        bool _777;
        int _825;
        int _835;
        int _845;
        int _855;
        int _865;
        int _875;
        int _885;
        int _895;
        int _905;
        int _915;
        int _925;
        int _935;
        float _1049;
        float _1053;
        int _1055;
        int _1059;
        int _1061;
        int _1063;
        int _1067;
        int _1069;
        int _1071;
        do
        {
            int _779 = _751;
            float _781 = _753;
            int _783 = as_type<int>(_755);
            float _785 = _757;
            int _787 = as_type<int>(_759);
            int _789 = as_type<int>(_761);
            int _791 = as_type<int>(_763);
            int _793 = as_type<int>(_765);
            int _795 = as_type<int>(_767);
            int _797 = as_type<int>(_769);
            int _799 = as_type<int>(_771);
            int _801 = as_type<int>(_773);
            int _803 = as_type<int>(_775);
            uint _805 = uint(int(uint(_743) >> uint(2)));
            uint _807 = uint(int(uint(int(_805)) >> uint(2)));
            int _809 = int(_805) & 3;
            float _811 = (*spvDescriptorSet0.cp_c6)._m0[int(_807)][_809];
            bool _813 = _68 != 0;
            int _815 = _779 + 1;
            bool _817 = uint(_815) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _819 = as_type<int>(_781);
            int _821 = as_type<int>(_811);
            int _823 = 31;
            int _2518 = _58(_819, _821, _823, _825, gl_SubgroupInvocationID);
            int _827 = _2518;
            int _829 = _783;
            int _831 = as_type<int>(_811);
            int _833 = 31;
            int _2522 = _58(_829, _831, _833, _835, gl_SubgroupInvocationID);
            int _837 = _2522;
            int _839 = as_type<int>(_785);
            int _841 = as_type<int>(_811);
            int _843 = 31;
            int _2527 = _58(_839, _841, _843, _845, gl_SubgroupInvocationID);
            int _847 = _2527;
            int _849 = _787;
            int _851 = as_type<int>(_811);
            int _853 = 31;
            int _2531 = _58(_849, _851, _853, _855, gl_SubgroupInvocationID);
            int _857 = _2531;
            int _859 = _789;
            int _861 = as_type<int>(_811);
            int _863 = 31;
            int _2535 = _58(_859, _861, _863, _865, gl_SubgroupInvocationID);
            int _867 = _2535;
            int _869 = _791;
            int _871 = as_type<int>(_811);
            int _873 = 31;
            int _2539 = _58(_869, _871, _873, _875, gl_SubgroupInvocationID);
            int _877 = _2539;
            int _879 = _793;
            int _881 = as_type<int>(_811);
            int _883 = 31;
            int _2543 = _58(_879, _881, _883, _885, gl_SubgroupInvocationID);
            int _887 = _2543;
            int _889 = _795;
            int _891 = as_type<int>(_811);
            int _893 = 31;
            int _2547 = _58(_889, _891, _893, _895, gl_SubgroupInvocationID);
            int _897 = _2547;
            int _899 = _797;
            int _901 = as_type<int>(_811);
            int _903 = 31;
            int _2551 = _58(_899, _901, _903, _905, gl_SubgroupInvocationID);
            int _907 = _2551;
            int _909 = _799;
            int _911 = as_type<int>(_811);
            int _913 = 31;
            int _2555 = _58(_909, _911, _913, _915, gl_SubgroupInvocationID);
            int _917 = _2555;
            int _919 = _801;
            int _921 = as_type<int>(_811);
            int _923 = 31;
            int _2559 = _58(_919, _921, _923, _925, gl_SubgroupInvocationID);
            int _927 = _2559;
            int _929 = _803;
            int _931 = as_type<int>(_811);
            int _933 = 31;
            int _2563 = _58(_929, _931, _933, _935, gl_SubgroupInvocationID);
            int _937 = _2563;
            bool _939 = !_813;
            _751 = _815;
            float _941 = _781;
            int _943 = _783;
            float _945 = _785;
            int _947 = _787;
            int _949 = _789;
            int _951 = _791;
            int _953 = _793;
            int _955 = _795;
            int _957 = _797;
            int _959 = _799;
            int _961 = _801;
            int _963 = _803;
            if (!_939)
            {
                float _965 = as_type<float>(_837) * _661;
                float _967 = _677 * as_type<float>(_837);
                float _969 = _681 * as_type<float>(_837);
                float _971 = _675 * as_type<float>(_837);
                float _973 = as_type<float>(_877) * _661;
                float _975 = _677 * as_type<float>(_877);
                float _977 = fma(as_type<float>(_827), _659, _965);
                float _979 = fma(_671, as_type<float>(_827), _967);
                float _981 = fma(_679, as_type<float>(_827), _969);
                float _983 = fma(_665, as_type<float>(_827), _971);
                float _985 = _681 * as_type<float>(_877);
                float _987 = _675 * as_type<float>(_877);
                float _989 = fma(as_type<float>(_867), _659, _973);
                float _991 = as_type<float>(_917) * _661;
                float _993 = fma(_671, as_type<float>(_867), _975);
                float _995 = _681 * as_type<float>(_917);
                float _997 = _677 * as_type<float>(_917);
                float _999 = fma(_679, as_type<float>(_867), _985);
                float _1001 = fma(_665, as_type<float>(_867), _987);
                float _1003 = _675 * as_type<float>(_917);
                float _1005 = fma(as_type<float>(_907), _659, _991);
                float _1007 = fma(_679, as_type<float>(_907), _995);
                float _1009 = fma(_671, as_type<float>(_907), _997);
                float _1011 = fma(_683, as_type<float>(_847), _981);
                float _1013 = fma(_685, as_type<float>(_847), _983);
                float _1015 = -_667;
                float _1017 = fma(_1015, as_type<float>(_847), _979);
                float _1019 = -_667;
                float _1021 = fma(_1019, as_type<float>(_887), _993);
                float _1023 = fma(_683, as_type<float>(_887), _999);
                float _1025 = fma(_685, as_type<float>(_887), _1001);
                float _1027 = fma(_665, as_type<float>(_907), _1003);
                float _1029 = fma(as_type<float>(_847), _663, _977);
                float _1031 = fma(as_type<float>(_887), _663, _989);
                float _1033 = fma(as_type<float>(_927), _663, _1005);
                float _1035 = fma(_683, as_type<float>(_927), _1007);
                float _1037 = -_667;
                float _1039 = fma(_1037, as_type<float>(_927), _1009);
                float _1041 = fma(_685, as_type<float>(_927), _1027);
                float _1043 = as_type<float>(_857) + _1029;
                float _1045 = as_type<float>(_897) + _1031;
                float _1047 = as_type<float>(_937) + _1033;
                _941 = _1017;
                _943 = as_type<int>(_1011);
                _945 = _1013;
                _947 = as_type<int>(_1043);
                _949 = as_type<int>(_1021);
                _951 = as_type<int>(_1023);
                _953 = as_type<int>(_1025);
                _955 = as_type<int>(_1045);
                _957 = as_type<int>(_1039);
                _959 = as_type<int>(_1035);
                _961 = as_type<int>(_1041);
                _963 = as_type<int>(_1047);
            }
            _1049 = _941;
            int _1051 = _943;
            _1053 = _945;
            _1055 = _947;
            int _1057 = _949;
            _1059 = _951;
            _1061 = _953;
            _1063 = _955;
            int _1065 = _957;
            _1067 = _959;
            _1069 = _961;
            _1071 = _963;
            _777 = !_817;
            _753 = _1049;
            _755 = as_type<float>(_1051);
            _757 = _1053;
            _759 = as_type<float>(_1055);
            _761 = as_type<float>(_1057);
            _763 = as_type<float>(_1059);
            _765 = as_type<float>(_1061);
            _767 = as_type<float>(_1063);
            _769 = as_type<float>(_1065);
            _771 = as_type<float>(_1067);
            _773 = as_type<float>(_1069);
            _775 = as_type<float>(_1071);
            _1073 = as_type<float>(_1051);
            _1075 = as_type<float>(_1057);
            _1077 = as_type<float>(_1065);
        } while (_777);
        _1079 = as_type<float>(_1059);
        _1081 = as_type<float>(_1067);
        _1083 = _1049;
        _687 = _1053;
        _1085 = as_type<float>(_1061);
        _1087 = as_type<float>(_1069);
        _1089 = as_type<float>(_1063);
        _1091 = as_type<float>(_1071);
        _689 = as_type<float>(_1055);
        _1093 = true;
    }
    else
    {
        float _1095 = -_667;
        float _1097 = _1095 + (-0.0);
        _1073 = _679;
        _1079 = _681;
        _1081 = _683;
        _1083 = _671;
        _1075 = _677;
        _1077 = _1097;
        _1085 = _675;
        _1087 = _685;
        _1089 = _661;
        _1091 = _663;
    }
    _1093 = false;
    float _1099 = _1073;
    float _1101 = _1079;
    float _1103 = _1081;
    float _1105 = _1083;
    float _1107 = _1075;
    float _1109 = _1077;
    float _1111 = _687;
    float _1113 = _1085;
    float _1115 = _1087;
    float _1117 = _1089;
    float _1119 = _1091;
    float _1121 = _689;
    int _1123 = _743 + 80;
    uint _1125 = uint(int(uint(_1123) >> uint(2)));
    uint _1127 = uint(int(uint(int(_1125)) >> uint(2)));
    int _1129 = int(_1125) & 3;
    float _1131 = (*spvDescriptorSet0.cp_c6)._m0[int(_1127)][_1129];
    int _1133 = int(_1125) + 1;
    uint _1135 = uint(int(uint(_1133) >> uint(2)));
    int _1137 = _1133 & 3;
    float _1139 = (*spvDescriptorSet0.cp_c6)._m0[int(_1135)][_1137];
    int _1141 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1143 = _1141 + _68;
    int _1145 = _743 + 64;
    uint _1147 = uint(int(uint(_1145) >> uint(2)));
    uint _1149 = uint(int(uint(int(_1147)) >> uint(2)));
    int _1151 = int(_1147) & 3;
    float _1153 = (*spvDescriptorSet0.cp_c6)._m0[int(_1149)][_1151];
    int _1155 = int(_1147) + 1;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    int _1159 = _1155 & 3;
    float _1161 = (*spvDescriptorSet0.cp_c6)._m0[int(_1157)][_1159];
    int _1163 = _743 + 88;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    uint _1167 = uint(int(uint(int(_1165)) >> uint(2)));
    int _1169 = int(_1165) & 3;
    float _1171 = (*spvDescriptorSet0.cp_c6)._m0[int(_1167)][_1169];
    int _1173 = int(_1165) + 1;
    uint _1175 = uint(int(uint(_1173) >> uint(2)));
    int _1177 = _1173 & 3;
    float _1179 = (*spvDescriptorSet0.cp_c6)._m0[int(_1175)][_1177];
    int _1181 = _743 + 72;
    uint _1183 = uint(int(uint(_1181) >> uint(2)));
    uint _1185 = uint(int(uint(int(_1183)) >> uint(2)));
    int _1187 = int(_1183) & 3;
    float _1189 = (*spvDescriptorSet0.cp_c6)._m0[int(_1185)][_1187];
    int _1191 = int(_1183) + 1;
    uint _1193 = uint(int(uint(_1191) >> uint(2)));
    int _1195 = _1191 & 3;
    float _1197 = (*spvDescriptorSet0.cp_c6)._m0[int(_1193)][_1195];
    int _1199 = _743 + 96;
    uint _1201 = uint(int(uint(_1199) >> uint(2)));
    uint _1203 = uint(int(uint(int(_1201)) >> uint(2)));
    int _1205 = int(_1201) & 3;
    float _1207 = (*spvDescriptorSet0.cp_c6)._m0[int(_1203)][_1205];
    int _1209 = int(_1201) + 1;
    uint _1211 = uint(int(uint(_1209) >> uint(2)));
    int _1213 = _1209 & 3;
    float _1215 = (*spvDescriptorSet0.cp_c6)._m0[int(_1211)][_1213];
    int _1217 = _743 + 104;
    uint _1219 = uint(int(uint(_1217) >> uint(2)));
    uint _1221 = uint(int(uint(int(_1219)) >> uint(2)));
    int _1223 = int(_1219) & 3;
    float _1225 = (*spvDescriptorSet0.cp_c6)._m0[int(_1221)][_1223];
    int _1227 = int(_1219) + 1;
    uint _1229 = uint(int(uint(_1227) >> uint(2)));
    int _1231 = _1227 & 3;
    float _1233 = (*spvDescriptorSet0.cp_c6)._m0[int(_1229)][_1231];
    float _1235 = _1099 * _1131;
    float _1237 = _1101 * _1131;
    float _1239 = _1103 * _1131;
    int _1241 = _743 + 16;
    uint _1243 = uint(int(uint(_1241) >> uint(2)));
    uint _1245 = uint(int(uint(int(_1243)) >> uint(2)));
    int _1247 = int(_1243) & 3;
    float _1249 = (*spvDescriptorSet0.cp_c6)._m0[int(_1245)][_1247];
    int _1251 = int(_1243) + 1;
    uint _1253 = uint(int(uint(_1251) >> uint(2)));
    int _1255 = _1251 & 3;
    float _1257 = (*spvDescriptorSet0.cp_c6)._m0[int(_1253)][_1255];
    float _1259 = _1099 * _1139;
    float _1261 = _1103 * _1139;
    float _1263 = fma(_1105, _1153, _1235);
    float _1265 = fma(_1107, _1153, _1237);
    float _1267 = fma(_1109, _1153, _1239);
    float _1269 = _1101 * _1139;
    int _1271 = _743 + 32;
    uint _1273 = uint(int(uint(_1271) >> uint(2)));
    uint _1275 = uint(int(uint(int(_1273)) >> uint(2)));
    int _1277 = int(_1273) & 3;
    float _1279 = (*spvDescriptorSet0.cp_c6)._m0[int(_1275)][_1277];
    int _1281 = int(_1273) + 1;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    int _1285 = _1281 & 3;
    float _1287 = (*spvDescriptorSet0.cp_c6)._m0[int(_1283)][_1285];
    float _1289 = fma(_1105, _1161, _1259);
    float _1291 = fma(_1109, _1161, _1261);
    float _1293 = fma(_1107, _1161, _1269);
    float _1295 = _1099 * _1171;
    float _1297 = _1101 * _1171;
    float _1299 = _1099 * _1179;
    float _1301 = _1101 * _1179;
    int _1303 = _743 + 48;
    uint _1305 = uint(int(uint(_1303) >> uint(2)));
    uint _1307 = uint(int(uint(int(_1305)) >> uint(2)));
    int _1309 = int(_1305) & 3;
    float _1311 = (*spvDescriptorSet0.cp_c6)._m0[int(_1307)][_1309];
    int _1313 = int(_1305) + 1;
    uint _1315 = uint(int(uint(_1313) >> uint(2)));
    int _1317 = _1313 & 3;
    float _1319 = (*spvDescriptorSet0.cp_c6)._m0[int(_1315)][_1317];
    float _1321 = _1103 * _1171;
    float _1323 = _1103 * _1179;
    float _1325 = fma(_1105, _1189, _1295);
    float _1327 = fma(_1107, _1189, _1297);
    float _1329 = fma(_1105, _1197, _1299);
    float _1331 = fma(_1107, _1197, _1301);
    int _1333 = _743 + 24;
    uint _1335 = uint(int(uint(_1333) >> uint(2)));
    uint _1337 = uint(int(uint(int(_1335)) >> uint(2)));
    int _1339 = int(_1335) & 3;
    float _1341 = (*spvDescriptorSet0.cp_c6)._m0[int(_1337)][_1339];
    int _1343 = int(_1335) + 1;
    uint _1345 = uint(int(uint(_1343) >> uint(2)));
    int _1347 = _1343 & 3;
    float _1349 = (*spvDescriptorSet0.cp_c6)._m0[int(_1345)][_1347];
    float _1351 = fma(_1109, _1189, _1321);
    float _1353 = fma(_1109, _1197, _1323);
    float _1355 = fma(_1111, _1207, _1263);
    float _1357 = fma(_1113, _1207, _1265);
    float _1359 = fma(_1115, _1207, _1267);
    float _1361 = fma(_1113, _1215, _1293);
    int _1363 = _743 + 40;
    uint _1365 = uint(int(uint(_1363) >> uint(2)));
    uint _1367 = uint(int(uint(int(_1365)) >> uint(2)));
    int _1369 = int(_1365) & 3;
    float _1371 = (*spvDescriptorSet0.cp_c6)._m0[int(_1367)][_1369];
    int _1373 = int(_1365) + 1;
    uint _1375 = uint(int(uint(_1373) >> uint(2)));
    int _1377 = _1373 & 3;
    float _1379 = (*spvDescriptorSet0.cp_c6)._m0[int(_1375)][_1377];
    float _1381 = fma(_1111, _1215, _1289);
    float _1383 = fma(_1115, _1215, _1291);
    float _1385 = fma(_1113, _1233, _1331);
    float _1387 = fma(_1115, _1233, _1353);
    float _1389 = fma(_1111, _1233, _1329);
    float _1391 = fma(_1113, _1225, _1327);
    int _1393 = _743 + 56;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    uint _1397 = uint(int(uint(int(_1395)) >> uint(2)));
    int _1399 = int(_1395) & 3;
    float _1401 = (*spvDescriptorSet0.cp_c6)._m0[int(_1397)][_1399];
    int _1403 = int(_1395) + 1;
    uint _1405 = uint(int(uint(_1403) >> uint(2)));
    int _1407 = _1403 & 3;
    float _1409 = (*spvDescriptorSet0.cp_c6)._m0[int(_1405)][_1407];
    float _1411 = _1385 + _1117;
    float _1413 = fma(_1111, _1225, _1325);
    float _1415 = fma(_1115, _1225, _1351);
    float _1417 = _1387 + _1119;
    float _1419 = _1389 + _1121;
    float _1421 = _1357 * _1257;
    float _1423 = _1361 * _1257;
    float _1425 = _1391 * _1257;
    float _1427 = _1411 * _1257;
    float _1429 = fma(_1355, _1249, _1421);
    float _1431 = fma(_1381, _1249, _1423);
    float _1433 = fma(_1413, _1249, _1425);
    float _1435 = fma(_1419, _1249, _1427);
    float _1437 = _1357 * _1287;
    float _1439 = _1361 * _1287;
    float _1441 = _1391 * _1287;
    float _1443 = _1411 * _1287;
    float _1445 = fma(_1355, _1279, _1437);
    float _1447 = fma(_1381, _1279, _1439);
    float _1449 = fma(_1413, _1279, _1441);
    float _1451 = fma(_1419, _1279, _1443);
    float _1453 = _1357 * _1319;
    float _1455 = _1361 * _1319;
    float _1457 = _1391 * _1319;
    float _1459 = _1411 * _1319;
    float _1461 = fma(_1355, _1311, _1453);
    float _1463 = fma(_1381, _1311, _1455);
    float _1465 = fma(_1413, _1311, _1457);
    float _1467 = fma(_1419, _1311, _1459);
    int _1469 = _1143 * 48;
    float _1471 = fma(_1417, _1341, _1435);
    float _1473 = fma(_1359, _1341, _1429);
    float _1475 = fma(_1383, _1341, _1431);
    float _1477 = fma(_1415, _1341, _1433);
    float _1479 = _1471 + _1349;
    int _1481 = _1469 + 16;
    float _1483 = fma(_1417, _1371, _1451);
    float _1485 = fma(_1359, _1371, _1445);
    float _1487 = fma(_1383, _1371, _1447);
    float _1489 = fma(_1415, _1371, _1449);
    float _1491 = _1483 + _1379;
    int _1493 = _1469 + 32;
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
    int _1509 = _1469 + 48;
    float _1511 = fma(_1417, _1401, _1467);
    float _1513 = fma(_1359, _1401, _1461);
    float _1515 = fma(_1383, _1401, _1463);
    float _1517 = fma(_1415, _1401, _1465);
    float _1519 = _1511 + _1409;
    uint _1521 = uint(int(uint(_1493) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1521)] = as_type<uint>(_1485);
    int _1523 = _1493 + 4;
    uint _1525 = uint(int(uint(_1523) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1525)] = as_type<uint>(_1487);
    int _1527 = _1493 + 8;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1529)] = as_type<uint>(_1489);
    int _1531 = _1493 + 12;
    uint _1533 = uint(int(uint(_1531) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1533)] = as_type<uint>(_1491);
    uint _1535 = uint(int(uint(_1509) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1535)] = as_type<uint>(_1513);
    int _1537 = _1509 + 4;
    uint _1539 = uint(int(uint(_1537) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1539)] = as_type<uint>(_1515);
    int _1541 = _1509 + 8;
    uint _1543 = uint(int(uint(_1541) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1543)] = as_type<uint>(_1517);
    int _1545 = _1509 + 12;
    uint _1547 = uint(int(uint(_1545) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1547)] = as_type<uint>(_1519);
}

