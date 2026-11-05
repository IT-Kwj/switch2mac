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
int _56(thread const int& _3643, thread const int& _3644, constant _10& support_buffer)
{
    int _3647 = 1 + _3644;
    float _3649 = support_buffer._m5[_3647].x;
    bool _3651 = _3649 == 1.0;
    if (_3651)
    {
        return _3643;
    }
    float _3653 = float(_3643);
    float _3655 = _3653 * _3649;
    int _3657 = int(_3655);
    return _3657;
}

static inline __attribute__((always_inline))
int _58(thread const int& _3679, thread const int& _3680, thread const int& _3681, thread int& _3682, thread uint& gl_SubgroupInvocationID)
{
    int _3685 = _3681 & 31;
    uint _3687 = uint(int(uint(_3681) >> uint(8)));
    int _3689 = int(_3687) & 31;
    float _3691 = as_type<float>(gl_SubgroupInvocationID);
    int _3693 = as_type<int>(_3691) & _3689;
    int _3695 = ~_3689;
    int _3697 = _3685 & _3695;
    int _3699 = _3697 | _3693;
    int _3701 = ~_3689;
    int _3703 = _3680 & _3701;
    int _3705 = _3703 | _3693;
    bool _3707 = uint(_3705) <= uint(_3699);
    _3682 = _3707 ? (-1) : 0;
    float _3709 = spvSubgroupShuffle(as_type<float>(_3679), uint(_3705));
    uint _3711 = uint(_3707 ? as_type<int>(_3709) : _3679);
    return int(_3711);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1039 = false;
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
        int3 _1745 = int3(_181, _187, as_type<int>(_149));
        float3 _191 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1745.xy), uint(_1745.z), 0).xyz;
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
        int3 _1773 = int3(_215, _221, 0);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1773.xy), uint(_1773.z), 0).xyz;
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
        int3 _1804 = int3(_247, _253, as_type<int>(_151));
        float3 _255 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1804.xy), uint(_1804.z), 0).xyz;
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
        int3 _1832 = int3(_279, _285, 0);
        float3 _287 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1832.xy), uint(_1832.z), 0).xyz;
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
        int3 _1861 = int3(_311, _317, as_type<int>(_167));
        float3 _319 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1861.xy), uint(_1861.z), 0).xyz;
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
    float _355 = 0.0;
    float _357 = _349;
    float _359 = _351;
    if (!_129)
    {
        _353 = 0.0;
        _355 = 0.0;
    }
    float _361 = _353;
    float _363 = _355;
    float _365 = 0.0;
    float _367 = _363;
    float _369 = _361;
    if (!_129)
    {
        _365 = 0.0;
    }
    float _371 = _365;
    float _373 = 0.0;
    float _375 = _371;
    if (!_129)
    {
        _175 = 0.0;
        _373 = 0.0;
    }
    float _377 = _175;
    float _379 = _373;
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
        int3 _1928 = int3(_391, _397, 2);
        float3 _399 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1928.xy), uint(_1928.z), 0).xyz;
        float _401 = _399.x;
        float _403 = _399.y;
        float _405 = _399.z;
        _375 = _327;
        _345 = _331;
        _367 = _329;
        _369 = _405;
        _347 = _295;
        _357 = _299;
        _383 = _403;
        _359 = _297;
        _385 = _401;
    }
    float _407 = _375;
    float _409 = _345;
    float _411 = _367;
    float _413 = _369;
    float _415 = _347;
    float _417 = _357;
    float _419 = _383;
    float _421 = _359;
    float _423 = _385;
    bool _425 = !_125;
    float _427 = _417;
    float _429 = _421;
    float _431 = _413;
    float _433 = _419;
    float _551;
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
        int _435 = _101 + 28;
        uint _437 = uint(int(uint(_435) >> uint(2)));
        uint _439 = uint(int(uint(int(_437)) >> uint(2)));
        int _441 = int(_437) & 3;
        float _443 = (*spvDescriptorSet0.cp_c5)._m0[int(_439)][_441];
        int _445 = _101 + 20;
        uint _447 = uint(int(uint(_445) >> uint(2)));
        uint _449 = uint(int(uint(int(_447)) >> uint(2)));
        int _451 = int(_447) & 3;
        float _453 = (*spvDescriptorSet0.cp_c5)._m0[int(_449)][_451];
        float _455 = _199 * _443;
        float _457 = _203 * _443;
        float _459 = _201 * _443;
        float _461 = _231 * _443;
        float _463 = _233 * _443;
        float _465 = _263 * _443;
        float _467 = _265 * _443;
        float _469 = _235 * _443;
        float _471 = fma(_407, _453, _455);
        float _473 = fma(_409, _453, _457);
        float _475 = fma(_411, _453, _459);
        float _477 = _267 * _443;
        float _479 = _471 * 0.15915493667125701904296875;
        float _481 = _473 * 0.15915493667125701904296875;
        float _483 = _475 * 0.15915493667125701904296875;
        float _485 = fma(_413, _453, _477);
        float _487 = _479 * 6.283185482025146484375;
        float _489 = cos(_487);
        float _491 = fma(_415, _453, _461);
        float _493 = fma(_417, _453, _469);
        float _495 = fma(_419, _453, _467);
        float _497 = fma(_421, _453, _463);
        float _499 = fma(_423, _453, _465);
        float _501 = _481 * 6.283185482025146484375;
        float _503 = sin(_501);
        float _505 = _481 * 6.283185482025146484375;
        float _507 = cos(_505);
        float _509 = _483 * 6.283185482025146484375;
        float _511 = cos(_509);
        float _513 = _503 * _489;
        float _515 = _479 * 6.283185482025146484375;
        float _517 = sin(_515);
        float _519 = _489 * _507;
        float _521 = _483 * 6.283185482025146484375;
        float _523 = sin(_521);
        float _525 = _489 * _511;
        float _527 = _511 * _507;
        float _529 = _503 * _511;
        float _531 = _517 * _503;
        float _533 = _517 * _507;
        float _535 = _517 * _511;
        float _537 = _517 * _523;
        float _539 = fma(_523, _519, _531);
        float _541 = -_513;
        float _543 = fma(_507, _537, _541);
        float _545 = fma(_503, _537, _519);
        float _547 = -_533;
        float _549 = fma(_523, _513, _547);
        _551 = _491;
        _553 = _529;
        _427 = _493;
        _555 = _549;
        _557 = _527;
        _559 = _523;
        _429 = _497;
        _561 = _543;
        _563 = _545;
        _565 = _535;
        _567 = _539;
        _569 = _525;
        _431 = _485;
        _433 = _495;
        _571 = _499;
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
        float _593 = _579 * 6.283185482025146484375;
        float _595 = sin(_593);
        float _597 = _577 * 6.283185482025146484375;
        float _599 = cos(_597);
        float _601 = _591 * _587;
        float _603 = _583 * _591;
        float _605 = _579 * 6.283185482025146484375;
        float _607 = cos(_605);
        float _609 = _583 * _595;
        float _611 = _587 * _599;
        float _613 = _587 * _607;
        float _615 = _607 * _599;
        float _617 = _591 * _607;
        float _619 = _583 * _607;
        float _621 = _583 * _599;
        float _623 = -_601;
        float _625 = fma(_599, _609, _623);
        float _627 = fma(_591, _609, _611);
        float _629 = fma(_595, _611, _603);
        float _631 = -_621;
        float _633 = fma(_595, _601, _631);
        _551 = _415;
        _553 = _617;
        _555 = _633;
        _557 = _615;
        _559 = _595;
        _561 = _625;
        _563 = _627;
        _565 = _619;
        _567 = _629;
        _569 = _613;
        _571 = _423;
    }
    _573 = false;
    float _635 = _551;
    float _637 = _553;
    float _639 = _427;
    float _641 = _555;
    float _643 = _557;
    float _645 = _559;
    float _647 = _429;
    float _649 = _561;
    float _651 = _563;
    float _653 = _565;
    float _655 = _567;
    float _657 = _569;
    float _659 = _431;
    float _661 = _433;
    float _663 = _571;
    bool _665 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _667 = _635 * _637;
    float _669 = _639 * _641;
    float _671 = _635 * _643;
    float _673 = _635 * _645;
    float _675 = _647 * _649;
    float _677 = _647 * _651;
    float _679 = _647 * _653;
    float _681 = _639 * _655;
    float _683 = _639 * _657;
    int _685 = _68 * 112;
    bool _687 = !_665;
    float _689 = _671;
    float _691 = _675;
    float _693 = _681;
    float _695 = _663;
    float _697 = _667;
    float _699 = _677;
    float _701 = _669;
    float _703 = _661;
    float _705 = _679;
    float _707 = _683;
    float _709 = _659;
    float _1037;
    if (!_687)
    {
        float _711 = -_673;
        float _713 = _711 + (-0.0);
        int _715 = 0;
        float _717 = _671;
        float _719 = _675;
        float _721 = _681;
        float _723 = _663;
        float _725 = _667;
        float _727 = _677;
        float _729 = _669;
        float _731 = _661;
        float _733 = _713;
        float _735 = _679;
        float _737 = _683;
        float _739 = _659;
        bool _741;
        int _789;
        int _799;
        int _809;
        int _819;
        int _829;
        int _839;
        int _849;
        int _859;
        int _869;
        int _879;
        int _889;
        int _899;
        float _1013;
        float _1015;
        float _1017;
        int _1019;
        float _1021;
        int _1023;
        int _1025;
        int _1027;
        int _1029;
        float _1031;
        float _1033;
        float _1035;
        do
        {
            int _743 = _715;
            float _745 = _717;
            float _747 = _719;
            float _749 = _721;
            int _751 = as_type<int>(_723);
            float _753 = _725;
            int _755 = as_type<int>(_727);
            int _757 = as_type<int>(_729);
            int _759 = as_type<int>(_731);
            int _761 = as_type<int>(_733);
            float _763 = _735;
            float _765 = _737;
            float _767 = _739;
            uint _769 = uint(int(uint(_685) >> uint(2)));
            uint _771 = uint(int(uint(int(_769)) >> uint(2)));
            int _773 = int(_769) & 3;
            float _775 = (*spvDescriptorSet0.cp_c6)._m0[int(_771)][_773];
            bool _777 = _68 != 0;
            int _779 = _743 + 1;
            bool _781 = uint(_779) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _783 = as_type<int>(_745);
            int _785 = as_type<int>(_775);
            int _787 = 31;
            int _2382 = _58(_783, _785, _787, _789, gl_SubgroupInvocationID);
            int _791 = _2382;
            int _793 = as_type<int>(_747);
            int _795 = as_type<int>(_775);
            int _797 = 31;
            int _2387 = _58(_793, _795, _797, _799, gl_SubgroupInvocationID);
            int _801 = _2387;
            int _803 = as_type<int>(_749);
            int _805 = as_type<int>(_775);
            int _807 = 31;
            int _2392 = _58(_803, _805, _807, _809, gl_SubgroupInvocationID);
            int _811 = _2392;
            int _813 = _751;
            int _815 = as_type<int>(_775);
            int _817 = 31;
            int _2396 = _58(_813, _815, _817, _819, gl_SubgroupInvocationID);
            int _821 = _2396;
            int _823 = as_type<int>(_753);
            int _825 = as_type<int>(_775);
            int _827 = 31;
            int _2401 = _58(_823, _825, _827, _829, gl_SubgroupInvocationID);
            int _831 = _2401;
            int _833 = _755;
            int _835 = as_type<int>(_775);
            int _837 = 31;
            int _2405 = _58(_833, _835, _837, _839, gl_SubgroupInvocationID);
            int _841 = _2405;
            int _843 = _757;
            int _845 = as_type<int>(_775);
            int _847 = 31;
            int _2409 = _58(_843, _845, _847, _849, gl_SubgroupInvocationID);
            int _851 = _2409;
            int _853 = _759;
            int _855 = as_type<int>(_775);
            int _857 = 31;
            int _2413 = _58(_853, _855, _857, _859, gl_SubgroupInvocationID);
            int _861 = _2413;
            int _863 = _761;
            int _865 = as_type<int>(_775);
            int _867 = 31;
            int _2417 = _58(_863, _865, _867, _869, gl_SubgroupInvocationID);
            int _871 = _2417;
            int _873 = as_type<int>(_763);
            int _875 = as_type<int>(_775);
            int _877 = 31;
            int _2422 = _58(_873, _875, _877, _879, gl_SubgroupInvocationID);
            int _881 = _2422;
            int _883 = as_type<int>(_765);
            int _885 = as_type<int>(_775);
            int _887 = 31;
            int _2427 = _58(_883, _885, _887, _889, gl_SubgroupInvocationID);
            int _891 = _2427;
            int _893 = as_type<int>(_767);
            int _895 = as_type<int>(_775);
            int _897 = 31;
            int _2432 = _58(_893, _895, _897, _899, gl_SubgroupInvocationID);
            int _901 = _2432;
            bool _903 = !_777;
            _715 = _779;
            float _905 = _745;
            float _907 = _747;
            float _909 = _749;
            int _911 = _751;
            float _913 = _753;
            int _915 = _755;
            int _917 = _757;
            int _919 = _759;
            int _921 = _761;
            float _923 = _763;
            float _925 = _765;
            float _927 = _767;
            if (!_903)
            {
                float _929 = as_type<float>(_801) * _661;
                float _931 = _667 * as_type<float>(_801);
                float _933 = _677 * as_type<float>(_801);
                float _935 = _669 * as_type<float>(_801);
                float _937 = fma(as_type<float>(_791), _663, _929);
                float _939 = _667 * as_type<float>(_841);
                float _941 = _677 * as_type<float>(_841);
                float _943 = _669 * as_type<float>(_841);
                float _945 = as_type<float>(_841) * _661;
                float _947 = fma(_671, as_type<float>(_791), _931);
                float _949 = fma(_675, as_type<float>(_791), _933);
                float _951 = fma(_681, as_type<float>(_791), _935);
                float _953 = fma(_671, as_type<float>(_831), _939);
                float _955 = fma(_675, as_type<float>(_831), _941);
                float _957 = fma(_681, as_type<float>(_831), _943);
                float _959 = _667 * as_type<float>(_881);
                float _961 = as_type<float>(_881) * _661;
                float _963 = fma(as_type<float>(_831), _663, _945);
                float _965 = _669 * as_type<float>(_881);
                float _967 = _677 * as_type<float>(_881);
                float _969 = fma(_671, as_type<float>(_871), _959);
                float _971 = fma(as_type<float>(_871), _663, _961);
                float _973 = fma(_681, as_type<float>(_871), _965);
                float _975 = fma(_683, as_type<float>(_811), _951);
                float _977 = fma(_675, as_type<float>(_871), _967);
                float _979 = -_673;
                float _981 = fma(_979, as_type<float>(_811), _947);
                float _983 = fma(_679, as_type<float>(_811), _949);
                float _985 = fma(_679, as_type<float>(_851), _955);
                float _987 = fma(as_type<float>(_811), _659, _937);
                float _989 = -_673;
                float _991 = fma(_989, as_type<float>(_851), _953);
                float _993 = fma(_683, as_type<float>(_851), _957);
                float _995 = fma(as_type<float>(_851), _659, _963);
                float _997 = fma(as_type<float>(_891), _659, _971);
                float _999 = fma(_679, as_type<float>(_891), _977);
                float _1001 = -_673;
                float _1003 = fma(_1001, as_type<float>(_891), _969);
                float _1005 = fma(_683, as_type<float>(_891), _973);
                float _1007 = as_type<float>(_821) + _987;
                float _1009 = as_type<float>(_861) + _995;
                float _1011 = as_type<float>(_901) + _997;
                _905 = _981;
                _907 = _983;
                _909 = _975;
                _911 = as_type<int>(_1007);
                _913 = _991;
                _915 = as_type<int>(_985);
                _917 = as_type<int>(_993);
                _919 = as_type<int>(_1009);
                _921 = as_type<int>(_1003);
                _923 = _999;
                _925 = _1005;
                _927 = _1011;
            }
            _1013 = _905;
            _1015 = _907;
            _1017 = _909;
            _1019 = _911;
            _1021 = _913;
            _1023 = _915;
            _1025 = _917;
            _1027 = _919;
            _1029 = _921;
            _1031 = _923;
            _1033 = _925;
            _1035 = _927;
            _741 = !_781;
            _717 = _1013;
            _719 = _1015;
            _721 = _1017;
            _723 = as_type<float>(_1019);
            _725 = _1021;
            _727 = as_type<float>(_1023);
            _729 = as_type<float>(_1025);
            _731 = as_type<float>(_1027);
            _733 = as_type<float>(_1029);
            _735 = _1031;
            _737 = _1033;
            _739 = _1035;
        } while (_741);
        _689 = _1013;
        _691 = _1015;
        _693 = _1017;
        _695 = as_type<float>(_1019);
        _697 = _1021;
        _699 = as_type<float>(_1023);
        _701 = as_type<float>(_1025);
        _703 = as_type<float>(_1027);
        _1037 = as_type<float>(_1029);
        _705 = _1031;
        _707 = _1033;
        _709 = _1035;
        _1039 = true;
    }
    else
    {
        float _1041 = -_673;
        float _1043 = _1041 + (-0.0);
        _1037 = _1043;
    }
    _1039 = false;
    float _1045 = _689;
    float _1047 = _691;
    float _1049 = _693;
    float _1051 = _695;
    float _1053 = _697;
    float _1055 = _699;
    float _1057 = _701;
    float _1059 = _703;
    float _1061 = _1037;
    float _1063 = _705;
    float _1065 = _707;
    float _1067 = _709;
    int _1069 = _685 + 80;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    uint _1073 = uint(int(uint(int(_1071)) >> uint(2)));
    int _1075 = int(_1071) & 3;
    float _1077 = (*spvDescriptorSet0.cp_c6)._m0[int(_1073)][_1075];
    int _1079 = int(_1071) + 1;
    uint _1081 = uint(int(uint(_1079) >> uint(2)));
    int _1083 = _1079 & 3;
    float _1085 = (*spvDescriptorSet0.cp_c6)._m0[int(_1081)][_1083];
    bool _1087 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1089 = _685 + 64;
    uint _1091 = uint(int(uint(_1089) >> uint(2)));
    uint _1093 = uint(int(uint(int(_1091)) >> uint(2)));
    int _1095 = int(_1091) & 3;
    float _1097 = (*spvDescriptorSet0.cp_c6)._m0[int(_1093)][_1095];
    int _1099 = int(_1091) + 1;
    uint _1101 = uint(int(uint(_1099) >> uint(2)));
    int _1103 = _1099 & 3;
    float _1105 = (*spvDescriptorSet0.cp_c6)._m0[int(_1101)][_1103];
    int _1107 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1109 = _1107 + _68;
    int _1111 = _685 + 88;
    uint _1113 = uint(int(uint(_1111) >> uint(2)));
    uint _1115 = uint(int(uint(int(_1113)) >> uint(2)));
    int _1117 = int(_1113) & 3;
    float _1119 = (*spvDescriptorSet0.cp_c6)._m0[int(_1115)][_1117];
    int _1121 = int(_1113) + 1;
    uint _1123 = uint(int(uint(_1121) >> uint(2)));
    int _1125 = _1121 & 3;
    float _1127 = (*spvDescriptorSet0.cp_c6)._m0[int(_1123)][_1125];
    int _1129 = _685 + 72;
    uint _1131 = uint(int(uint(_1129) >> uint(2)));
    uint _1133 = uint(int(uint(int(_1131)) >> uint(2)));
    int _1135 = int(_1131) & 3;
    float _1137 = (*spvDescriptorSet0.cp_c6)._m0[int(_1133)][_1135];
    int _1139 = int(_1131) + 1;
    uint _1141 = uint(int(uint(_1139) >> uint(2)));
    int _1143 = _1139 & 3;
    float _1145 = (*spvDescriptorSet0.cp_c6)._m0[int(_1141)][_1143];
    int _1147 = _685 + 96;
    uint _1149 = uint(int(uint(_1147) >> uint(2)));
    uint _1151 = uint(int(uint(int(_1149)) >> uint(2)));
    int _1153 = int(_1149) & 3;
    float _1155 = (*spvDescriptorSet0.cp_c6)._m0[int(_1151)][_1153];
    int _1157 = int(_1149) + 1;
    uint _1159 = uint(int(uint(_1157) >> uint(2)));
    int _1161 = _1157 & 3;
    float _1163 = (*spvDescriptorSet0.cp_c6)._m0[int(_1159)][_1161];
    int _1165 = _685 + 104;
    uint _1167 = uint(int(uint(_1165) >> uint(2)));
    uint _1169 = uint(int(uint(int(_1167)) >> uint(2)));
    int _1171 = int(_1167) & 3;
    float _1173 = (*spvDescriptorSet0.cp_c6)._m0[int(_1169)][_1171];
    int _1175 = int(_1167) + 1;
    uint _1177 = uint(int(uint(_1175) >> uint(2)));
    int _1179 = _1175 & 3;
    float _1181 = (*spvDescriptorSet0.cp_c6)._m0[int(_1177)][_1179];
    int _1183 = _685 + 16;
    uint _1185 = uint(int(uint(_1183) >> uint(2)));
    uint _1187 = uint(int(uint(int(_1185)) >> uint(2)));
    int _1189 = int(_1185) & 3;
    float _1191 = (*spvDescriptorSet0.cp_c6)._m0[int(_1187)][_1189];
    int _1193 = int(_1185) + 1;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    int _1197 = _1193 & 3;
    float _1199 = (*spvDescriptorSet0.cp_c6)._m0[int(_1195)][_1197];
    if (!_1087)
    {
        int _1201 = _68 * 48;
        int _1203 = _1201 + 16;
        uint _1205 = uint(int(uint(_1201) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1205)] = as_type<uint>(_1045);
        int _1207 = _1201 + 4;
        uint _1209 = uint(int(uint(_1207) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1209)] = as_type<uint>(_1047);
        int _1211 = _1201 + 8;
        uint _1213 = uint(int(uint(_1211) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1213)] = as_type<uint>(_1049);
        int _1215 = _1201 + 12;
        uint _1217 = uint(int(uint(_1215) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1217)] = as_type<uint>(_1051);
        int _1219 = _1201 + 32;
        uint _1221 = uint(int(uint(_1203) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1221)] = as_type<uint>(_1053);
        int _1223 = _1203 + 4;
        uint _1225 = uint(int(uint(_1223) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1225)] = as_type<uint>(_1055);
        int _1227 = _1203 + 8;
        uint _1229 = uint(int(uint(_1227) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1229)] = as_type<uint>(_1057);
        int _1231 = _1203 + 12;
        uint _1233 = uint(int(uint(_1231) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1233)] = as_type<uint>(_1059);
        uint _1235 = uint(int(uint(_1219) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1235)] = as_type<uint>(_1061);
        int _1237 = _1219 + 4;
        uint _1239 = uint(int(uint(_1237) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1239)] = as_type<uint>(_1063);
        int _1241 = _1219 + 8;
        uint _1243 = uint(int(uint(_1241) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1243)] = as_type<uint>(_1065);
        int _1245 = _1219 + 12;
        uint _1247 = uint(int(uint(_1245) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1247)] = as_type<uint>(_1067);
    }
    float _1249 = _1063 * _1077;
    float _1251 = _1047 * _1077;
    float _1253 = _1055 * _1077;
    int _1255 = _685 + 32;
    uint _1257 = uint(int(uint(_1255) >> uint(2)));
    uint _1259 = uint(int(uint(int(_1257)) >> uint(2)));
    int _1261 = int(_1257) & 3;
    float _1263 = (*spvDescriptorSet0.cp_c6)._m0[int(_1259)][_1261];
    int _1265 = int(_1257) + 1;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    int _1269 = _1265 & 3;
    float _1271 = (*spvDescriptorSet0.cp_c6)._m0[int(_1267)][_1269];
    float _1273 = fma(_1061, _1097, _1249);
    float _1275 = _1047 * _1085;
    float _1277 = fma(_1045, _1097, _1251);
    float _1279 = fma(_1053, _1097, _1253);
    float _1281 = _1055 * _1085;
    float _1283 = fma(_1045, _1105, _1275);
    float _1285 = _1047 * _1119;
    int _1287 = _685 + 48;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    uint _1291 = uint(int(uint(int(_1289)) >> uint(2)));
    int _1293 = int(_1289) & 3;
    float _1295 = (*spvDescriptorSet0.cp_c6)._m0[int(_1291)][_1293];
    int _1297 = int(_1289) + 1;
    uint _1299 = uint(int(uint(_1297) >> uint(2)));
    int _1301 = _1297 & 3;
    float _1303 = (*spvDescriptorSet0.cp_c6)._m0[int(_1299)][_1301];
    float _1305 = _1047 * _1127;
    float _1307 = _1063 * _1085;
    float _1309 = _1055 * _1119;
    float _1311 = _1055 * _1127;
    float _1313 = _1063 * _1119;
    float _1315 = fma(_1053, _1105, _1281);
    float _1317 = fma(_1061, _1105, _1307);
    float _1319 = _1063 * _1127;
    float _1321 = fma(_1045, _1137, _1285);
    int _1323 = _685 + 24;
    uint _1325 = uint(int(uint(_1323) >> uint(2)));
    uint _1327 = uint(int(uint(int(_1325)) >> uint(2)));
    int _1329 = int(_1325) & 3;
    float _1331 = (*spvDescriptorSet0.cp_c6)._m0[int(_1327)][_1329];
    int _1333 = int(_1325) + 1;
    uint _1335 = uint(int(uint(_1333) >> uint(2)));
    int _1337 = _1333 & 3;
    float _1339 = (*spvDescriptorSet0.cp_c6)._m0[int(_1335)][_1337];
    float _1341 = fma(_1045, _1145, _1305);
    float _1343 = fma(_1053, _1137, _1309);
    float _1345 = fma(_1053, _1145, _1311);
    float _1347 = fma(_1061, _1145, _1319);
    float _1349 = fma(_1061, _1137, _1313);
    float _1351 = fma(_1049, _1155, _1277);
    float _1353 = fma(_1057, _1181, _1345);
    int _1355 = _685 + 40;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    uint _1359 = uint(int(uint(int(_1357)) >> uint(2)));
    int _1361 = int(_1357) & 3;
    float _1363 = (*spvDescriptorSet0.cp_c6)._m0[int(_1359)][_1361];
    int _1365 = int(_1357) + 1;
    uint _1367 = uint(int(uint(_1365) >> uint(2)));
    int _1369 = _1365 & 3;
    float _1371 = (*spvDescriptorSet0.cp_c6)._m0[int(_1367)][_1369];
    float _1373 = fma(_1057, _1155, _1279);
    float _1375 = fma(_1065, _1155, _1273);
    float _1377 = fma(_1049, _1163, _1283);
    float _1379 = fma(_1049, _1173, _1321);
    float _1381 = fma(_1049, _1181, _1341);
    float _1383 = fma(_1057, _1163, _1315);
    float _1385 = fma(_1057, _1173, _1343);
    int _1387 = _685 + 56;
    uint _1389 = uint(int(uint(_1387) >> uint(2)));
    uint _1391 = uint(int(uint(int(_1389)) >> uint(2)));
    int _1393 = int(_1389) & 3;
    float _1395 = (*spvDescriptorSet0.cp_c6)._m0[int(_1391)][_1393];
    int _1397 = int(_1389) + 1;
    uint _1399 = uint(int(uint(_1397) >> uint(2)));
    int _1401 = _1397 & 3;
    float _1403 = (*spvDescriptorSet0.cp_c6)._m0[int(_1399)][_1401];
    float _1405 = fma(_1065, _1181, _1347);
    float _1407 = _1353 + _1059;
    float _1409 = fma(_1065, _1163, _1317);
    float _1411 = fma(_1065, _1173, _1349);
    float _1413 = _1405 + _1067;
    float _1415 = _1381 + _1051;
    float _1417 = _1373 * _1199;
    float _1419 = _1383 * _1199;
    float _1421 = _1385 * _1199;
    float _1423 = _1407 * _1199;
    float _1425 = fma(_1351, _1191, _1417);
    float _1427 = fma(_1377, _1191, _1419);
    float _1429 = fma(_1379, _1191, _1421);
    float _1431 = fma(_1415, _1191, _1423);
    float _1433 = _1373 * _1271;
    float _1435 = _1383 * _1271;
    float _1437 = _1385 * _1271;
    float _1439 = _1407 * _1271;
    float _1441 = fma(_1351, _1263, _1433);
    float _1443 = fma(_1377, _1263, _1435);
    float _1445 = fma(_1379, _1263, _1437);
    float _1447 = _1407 * _1303;
    float _1449 = _1373 * _1303;
    float _1451 = fma(_1415, _1263, _1439);
    float _1453 = _1383 * _1303;
    float _1455 = _1385 * _1303;
    float _1457 = fma(_1415, _1295, _1447);
    int _1459 = _1109 * 48;
    float _1461 = fma(_1351, _1295, _1449);
    float _1463 = fma(_1377, _1295, _1453);
    float _1465 = fma(_1379, _1295, _1455);
    float _1467 = fma(_1413, _1331, _1431);
    float _1469 = fma(_1409, _1331, _1427);
    float _1471 = fma(_1375, _1331, _1425);
    float _1473 = fma(_1411, _1331, _1429);
    float _1475 = _1467 + _1339;
    float _1477 = fma(_1413, _1363, _1451);
    float _1479 = fma(_1375, _1363, _1441);
    float _1481 = fma(_1409, _1363, _1443);
    float _1483 = fma(_1411, _1363, _1445);
    int _1485 = _1459 + 16;
    float _1487 = _1477 + _1371;
    float _1489 = fma(_1413, _1395, _1457);
    float _1491 = fma(_1375, _1395, _1461);
    int _1493 = _1459 + 32;
    float _1495 = fma(_1409, _1395, _1463);
    float _1497 = fma(_1411, _1395, _1465);
    float _1499 = _1489 + _1403;
    int _1501 = _1459 + 48;
    uint _1503 = uint(int(uint(_1485) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1503)] = as_type<uint>(_1471);
    int _1505 = _1485 + 4;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1507)] = as_type<uint>(_1469);
    int _1509 = _1485 + 8;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1511)] = as_type<uint>(_1473);
    int _1513 = _1485 + 12;
    uint _1515 = uint(int(uint(_1513) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1515)] = as_type<uint>(_1475);
    uint _1517 = uint(int(uint(_1493) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1517)] = as_type<uint>(_1479);
    int _1519 = _1493 + 4;
    uint _1521 = uint(int(uint(_1519) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1521)] = as_type<uint>(_1481);
    int _1523 = _1493 + 8;
    uint _1525 = uint(int(uint(_1523) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1525)] = as_type<uint>(_1483);
    int _1527 = _1493 + 12;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1529)] = as_type<uint>(_1487);
    uint _1531 = uint(int(uint(_1501) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1531)] = as_type<uint>(_1491);
    int _1533 = _1501 + 4;
    uint _1535 = uint(int(uint(_1533) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1535)] = as_type<uint>(_1495);
    int _1537 = _1501 + 8;
    uint _1539 = uint(int(uint(_1537) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1539)] = as_type<uint>(_1497);
    int _1541 = _1501 + 12;
    uint _1543 = uint(int(uint(_1541) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1543)] = as_type<uint>(_1499);
}

