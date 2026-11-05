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
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _4034, thread const int& _4035, constant _10& support_buffer)
{
    int _4038 = 1 + _4035;
    float _4040 = support_buffer._m5[_4038].x;
    bool _4042 = _4040 == 1.0;
    if (_4042)
    {
        return _4034;
    }
    float _4044 = float(_4034);
    float _4046 = _4044 * _4040;
    int _4048 = int(_4046);
    return _4048;
}

static inline __attribute__((always_inline))
void _56(thread const int& _3722, thread const int& _3723, thread const int& _3724, thread const int& _3725, thread int& _3726, thread int& _3727, thread int& _3728, thread int& _3729, thread int& _3730, thread int& _3731)
{
    float _3734 = as_type<float>(_3723) + 0.0;
    bool _3736 = _3734 != 0.0;
    bool _3738 = isnan(_3734);
    bool _3740 = _3736 || _3738;
    bool _3742 = isnan(0.0);
    bool _3744 = _3740 || _3742;
    int _3746 = as_type<int>(_3734);
    int _3748 = _3723;
    int _3750 = _3725;
    int _3752 = _3744 ? (-1) : 0;
    if (!_3744)
    {
        float _3754 = as_type<float>(_3723) * 1.0;
        _3746 = as_type<int>(_3754);
    }
    int _3756 = _3746;
    bool _3758 = !_3744;
    int _3760 = _3756;
    if (!_3758)
    {
        float _3762 = as_type<float>(_3723) + 0.0;
        bool _3764 = _3762 >= 0.0;
        bool _3766 = isnan(_3762);
        bool _3768 = _3764 || _3766;
        bool _3770 = isnan(0.0);
        bool _3772 = _3768 || _3770;
        int _3774 = as_type<int>(_3762);
        _3752 = _3772 ? (-1) : 0;
        if (!_3772)
        {
            _3774 = 2147483647;
        }
        int _3776 = _3774;
        bool _3778 = !_3772;
        _3760 = _3776;
        if (!_3778)
        {
            float _3780 = as_type<float>(_3723) + 0.0;
            bool _3782 = _3780 > as_type<float>(0x7f800000u /* inf */);
            bool _3784 = isnan(_3780);
            bool _3786 = _3782 || _3784;
            bool _3788 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3790 = _3786 || _3788;
            int _3792 = as_type<int>(_3780);
            _3752 = _3790 ? (-1) : 0;
            if (_3790)
            {
                float _3794 = as_type<float>(_3723) + 1.0;
                _3792 = as_type<int>(_3794);
            }
            int _3796 = _3792;
            _3760 = _3796;
            if (!_3790)
            {
                float _3798 = 0.0 + as_type<float>(_3723);
                bool _3800 = _3798 != as_type<float>(0x7f800000u /* inf */);
                bool _3802 = isnan(_3798);
                bool _3804 = _3800 || _3802;
                bool _3806 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3808 = _3804 || _3806;
                int _3810 = as_type<int>(_3798);
                _3752 = _3808 ? (-1) : 0;
                if (!_3808)
                {
                    _3810 = _3723;
                }
                int _3812 = _3810;
                bool _3814 = !_3808;
                _3760 = _3812;
                if (!_3814)
                {
                    float _3816 = as_type<float>(_3723) * 18446744073709551616.0;
                    float _3818 = rsqrt(_3816);
                    float _3820 = _3816 * _3818;
                    float _3822 = _3818 * 0.5;
                    float _3824 = -_3820;
                    float _3826 = 0.0 + _3824;
                    float _3828 = fma(_3822, _3826, 0.5);
                    float _3830 = fma(_3820, _3828, _3820);
                    float _3832 = -_3830;
                    float _3834 = 0.0 + _3832;
                    float _3836 = fma(_3830, _3834, _3816);
                    float _3838 = fma(_3822, _3836, _3830);
                    float _3840 = _3838 * 2.3283064365386962890625e-10;
                    _3760 = as_type<int>(_3840);
                    _3748 = as_type<int>(_3816);
                    _3750 = as_type<int>(_3830);
                }
            }
        }
    }
    int _3842 = _3760;
    int _3844 = _3748;
    int _3846 = _3750;
    int _3848 = _3752;
    _3726 = _3842;
    _3727 = _3724;
    _3728 = 0;
    _3729 = _3844;
    _3730 = _3846;
    _3731 = _3848;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1013 = false;
    bool _389 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_72)
    {
        return;
    }
    int _74 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _77 = uint(int(uint(_74) >> uint(2)));
    uint _79 = uint(int(uint(int(_77)) >> uint(2)));
    int _81 = int(_77) & 3;
    float _83 = (*spvDescriptorSet0.cp_c5)._m0[int(_79)][_81];
    int _85 = _74 + 8;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    uint _89 = uint(int(uint(int(_87)) >> uint(2)));
    int _91 = int(_87) & 3;
    float _93 = (*spvDescriptorSet0.cp_c5)._m0[int(_89)][_91];
    int _95 = _68;
    int _97 = 0;
    int _99 = _58(_95, _97, (*spvDescriptorSet0.support_buffer));
    int _101 = as_type<int>(_83);
    int _103 = 0;
    int _105 = _58(_101, _103, (*spvDescriptorSet0.support_buffer));
    int3 _1541 = int3(_99, _105, 1);
    float3 _109 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1541.xy), uint(_1541.z), 0).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    int _117 = _68;
    int _119 = 1;
    int _121 = _58(_117, _119, (*spvDescriptorSet0.support_buffer));
    int _123 = as_type<int>(_93);
    int _125 = 1;
    int _127 = _58(_123, _125, (*spvDescriptorSet0.support_buffer));
    int3 _1559 = int3(_121, _127, 1);
    float3 _129 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1559.xy), uint(_1559.z), 0).xyz;
    float _131 = _129.x;
    float _133 = _129.y;
    float _135 = _129.z;
    int _137 = _68;
    int _139 = 0;
    int _141 = _58(_137, _139, (*spvDescriptorSet0.support_buffer));
    int _143 = as_type<int>(_83);
    int _145 = 0;
    int _147 = _58(_143, _145, (*spvDescriptorSet0.support_buffer));
    int3 _1577 = int3(_141, _147, 0);
    float3 _149 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1577.xy), uint(_1577.z), 0).xyz;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    int _157 = _68;
    int _159 = 0;
    int _161 = _58(_157, _159, (*spvDescriptorSet0.support_buffer));
    int _163 = as_type<int>(_83);
    int _165 = 0;
    int _167 = _58(_163, _165, (*spvDescriptorSet0.support_buffer));
    int3 _1595 = int3(_161, _167, 2);
    float3 _169 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1595.xy), uint(_1595.z), 0).xyz;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = _169.z;
    float _177 = _115 * 0.5;
    float _179 = _113 * 0.5;
    float _181 = _111 * 0.5;
    float _183 = _177 * 0.15915493667125701904296875;
    float _185 = _179 * 0.15915493667125701904296875;
    float _187 = _181 * 0.15915493667125701904296875;
    float _189 = _135 * 0.5;
    float _191 = _133 * 0.5;
    float _193 = _131 * 0.5;
    float _195 = _183 * 6.283185482025146484375;
    float _197 = cos(_195);
    float _199 = _189 * 0.15915493667125701904296875;
    float _201 = _191 * 0.15915493667125701904296875;
    float _203 = _193 * 0.15915493667125701904296875;
    float _205 = _185 * 6.283185482025146484375;
    float _207 = cos(_205);
    float _209 = _185 * 6.283185482025146484375;
    float _211 = sin(_209);
    float _213 = _183 * 6.283185482025146484375;
    float _215 = sin(_213);
    float _217 = _197 * _207;
    float _219 = _199 * 6.283185482025146484375;
    float _221 = sin(_219);
    float _223 = _197 * _211;
    float _225 = _201 * 6.283185482025146484375;
    float _227 = sin(_225);
    float _229 = _215 * _211;
    float _231 = _207 * _215;
    float _233 = _201 * 6.283185482025146484375;
    float _235 = cos(_233);
    float _237 = _199 * 6.283185482025146484375;
    float _239 = cos(_237);
    float _241 = _221 * _227;
    float _243 = _187 * 6.283185482025146484375;
    float _245 = sin(_243);
    float _247 = _235 * _221;
    float _249 = _203 * 6.283185482025146484375;
    float _251 = sin(_249);
    float _253 = _239 * _235;
    float _255 = _239 * _227;
    float _257 = _187 * 6.283185482025146484375;
    float _259 = cos(_257);
    float _261 = _245 * _231;
    float _263 = _245 * _229;
    float _265 = _203 * 6.283185482025146484375;
    float _267 = cos(_265);
    float _269 = _251 * _247;
    float _271 = _259 * _229;
    float _273 = fma(_259, _223, _261);
    float _275 = _245 * _223;
    float _277 = fma(_259, _217, _263);
    float _279 = -_271;
    float _281 = fma(_245, _217, _279);
    float _283 = -_275;
    float _285 = fma(_259, _231, _283);
    float _287 = _267 * _241;
    float _289 = fma(_267, _255, _269);
    float _291 = _251 * _255;
    float _293 = -_287;
    float _295 = fma(_251, _253, _293);
    float _297 = _273 * _289;
    float _299 = _251 * _241;
    float _301 = -_291;
    float _303 = fma(_267, _247, _301);
    float _305 = fma(_281, _295, _297);
    float _307 = fma(_267, _253, _299);
    float _309 = fma(_285, _303, _305);
    float _311 = fma(_277, _307, _309);
    float _313 = precise::max(_311, -1.0);
    float _315 = precise::min(_313, 1.0);
    bool _317 = _315 >= 0.0;
    bool _319 = isnan(_315);
    bool _321 = _317 || _319;
    bool _323 = isnan(0.0);
    bool _325 = _321 || _323;
    bool _327 = !_325;
    float _329 = -_315;
    float _331 = _327 ? _329 : _315;
    bool _333 = _331 < 0.0;
    float _335 = float(_333);
    float _337 = abs(_331);
    float _339 = -_337;
    float _341 = _339 + 1.0;
    float _343 = abs(_331);
    float _345 = fma(_343, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _347 = as_type<int>(_341) + (-218103808);
    float _349 = abs(_331);
    float _351 = fma(_349, _345, -0.212114393711090087890625);
    bool _353 = uint(_347) >= 1920991232u;
    float _355 = abs(_331);
    float _357 = fma(_355, _351, 1.570728778839111328125);
    bool _359 = !_353;
    float _361 = _171;
    float _363 = _173;
    float _385;
    float _387;
    if (!_359)
    {
        int _365 = as_type<int>(_331);
        int _367 = as_type<int>(_341);
        int _369 = 1408;
        int _371 = as_type<int>(_299);
        int _373;
        int _375;
        int _377;
        int _379;
        int _381;
        int _383;
        _56(_365, _367, _369, _371, _373, _375, _377, _379, _381, _383);
        _385 = as_type<float>(_373);
        _387 = as_type<float>(_375);
        _389 = true;
    }
    else
    {
        float _391 = rsqrt(_341);
        float _393 = _341 * _391;
        float _395 = _391 * 0.5;
        float _397 = -_393;
        float _399 = 0.0 + _397;
        float _401 = fma(_395, _399, 0.5);
        float _403 = fma(_393, _401, _393);
        float _405 = -_403;
        float _407 = 0.0 + _405;
        float _409 = fma(_403, _407, _341);
        float _411 = fma(_395, _409, _403);
        _385 = _411;
        _387 = _399;
    }
    _389 = false;
    float _413 = _385;
    float _415 = _387;
    int _417 = _74 + 8;
    uint _419 = uint(int(uint(_417) >> uint(2)));
    uint _421 = uint(int(uint(int(_419)) >> uint(2)));
    int _423 = int(_419) & 3;
    float _425 = (*spvDescriptorSet0.cp_c5)._m0[int(_421)][_423];
    int _427 = _68;
    int _429 = 1;
    int _431 = _58(_427, _429, (*spvDescriptorSet0.support_buffer));
    int _433 = as_type<int>(_425);
    int _435 = 1;
    int _437 = _58(_433, _435, (*spvDescriptorSet0.support_buffer));
    int3 _1927 = int3(_431, _437, 0);
    float3 _439 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1927.xy), uint(_1927.z), 0).xyz;
    float _441 = _439.x;
    float _443 = _439.y;
    float _445 = _439.z;
    int _447 = _68;
    int _449 = 1;
    int _451 = _58(_447, _449, (*spvDescriptorSet0.support_buffer));
    int _453 = as_type<int>(_425);
    int _455 = 1;
    int _457 = _58(_453, _455, (*spvDescriptorSet0.support_buffer));
    int3 _1945 = int3(_451, _457, 2);
    float3 _459 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1945.xy), uint(_1945.z), 0).xyz;
    float _461 = _459.x;
    float _463 = _459.y;
    float _465 = _459.z;
    float _467 = _357 * _413;
    float _469 = _335 * 2.0;
    float _471 = -_469;
    float _473 = fma(_467, _471, _467);
    float _475 = fma(_335, 3.1415927410125732421875, _473);
    float _477 = _475 * 0.15915493667125701904296875;
    float _479 = _477 * 6.283185482025146484375;
    float _481 = sin(_479);
    float _483 = abs(_481);
    bool _485 = _483 >= 0.001000000047497451305389404296875;
    bool _487 = isnan(_483);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.001000000047497451305389404296875);
    bool _493 = _489 || _491;
    float _495 = _291;
    float _497 = _415;
    float _499 = _467;
    if (!_493)
    {
        int _501 = _74 + 28;
        uint _503 = uint(int(uint(_501) >> uint(2)));
        uint _505 = uint(int(uint(int(_503)) >> uint(2)));
        int _507 = int(_503) & 3;
        float _509 = (*spvDescriptorSet0.cp_c5)._m0[int(_505)][_507];
        _495 = _509;
    }
    float _511 = _495;
    float _513 = _511;
    if (!_493)
    {
        float _515 = -_511;
        float _517 = _515 + 1.0;
        _497 = _517;
    }
    float _519 = _497;
    float _521 = _519;
    if (!_493)
    {
        _499 = _511;
    }
    float _523 = _499;
    bool _525 = !_493;
    float _527 = _523;
    if (!_525)
    {
        int _529 = _74 + 28;
        uint _531 = uint(int(uint(_529) >> uint(2)));
        uint _533 = uint(int(uint(int(_531)) >> uint(2)));
        int _535 = int(_531) & 3;
        float _537 = (*spvDescriptorSet0.cp_c5)._m0[int(_533)][_535];
        float _539 = 1.0 / _481;
        float _541 = _475 * _537;
        float _543 = _541 * 0.15915493667125701904296875;
        float _545 = -_541;
        float _547 = _475 + _545;
        float _549 = _547 * 0.15915493667125701904296875;
        float _551 = _543 * 6.283185482025146484375;
        float _553 = sin(_551);
        float _555 = _549 * 6.283185482025146484375;
        float _557 = sin(_555);
        float _559 = _553 * _539;
        float _561 = _557 * _539;
        _527 = _559;
        _521 = _561;
        _513 = _537;
    }
    float _563 = _527;
    float _565 = _521;
    float _567 = _513;
    bool _569 = !_325;
    float _571 = -_563;
    float _573 = _569 ? _571 : _563;
    int _575 = _74 + 20;
    uint _577 = uint(int(uint(_575) >> uint(2)));
    uint _579 = uint(int(uint(int(_577)) >> uint(2)));
    int _581 = int(_577) & 3;
    float _583 = (*spvDescriptorSet0.cp_c5)._m0[int(_579)][_581];
    bool _585 = _68 != 0;
    float _587 = _307 * _573;
    float _589 = _303 * _573;
    float _591 = _295 * _573;
    float _593 = _289 * _573;
    float _595 = fma(_277, _565, _587);
    float _597 = fma(_285, _565, _589);
    float _599 = fma(_281, _565, _591);
    float _601 = fma(_273, _565, _593);
    float _603 = _595 * 2.0;
    float _605 = _599 * 2.0;
    float _607 = _601 * 2.0;
    float _609 = _599 * _603;
    float _611 = _597 * _603;
    float _613 = _601 * _603;
    float _615 = _599 * _599;
    float _617 = -_609;
    float _619 = fma(_597, _607, _617);
    float _621 = -_611;
    float _623 = fma(_601, _605, _621);
    float _625 = fma(_597, _607, _609);
    float _627 = fma(_601, _605, _611);
    float _629 = fma(_597, _605, _613);
    float _631 = -_613;
    float _633 = fma(_597, _605, _631);
    float _635 = _601 * _601;
    float _637 = _441 * _567;
    float _639 = _597 * _597;
    float _641 = fma(_635, -2.0, 1.0);
    float _643 = fma(_151, _583, _637);
    float _645 = _443 * _567;
    float _647 = _445 * _567;
    float _649 = fma(_639, -2.0, _641);
    float _651 = fma(_615, -2.0, 1.0);
    float _653 = fma(_153, _583, _645);
    float _655 = fma(_155, _583, _647);
    float _657 = _627 * _643;
    float _659 = _649 * _643;
    float _661 = _625 * _653;
    float _663 = _461 * _567;
    float _665 = fma(_639, -2.0, _651);
    float _667 = fma(_635, -2.0, _651);
    float _669 = _463 * _567;
    float _671 = _465 * _567;
    float _673 = _623 * _653;
    float _675 = _629 * _655;
    float _677 = _619 * _655;
    float _679 = fma(_171, _583, _663);
    float _681 = _633 * _643;
    float _683 = _665 * _653;
    float _685 = _667 * _655;
    int _687 = _68 * 48;
    float _689 = fma(_173, _583, _669);
    float _691 = fma(_175, _583, _671);
    int _693 = _68 * 112;
    float _695 = _655;
    float _697 = _669;
    float _699 = _665;
    float _701 = _653;
    float _703 = _643;
    float _705 = _671;
    float _707 = _661;
    float _709 = _681;
    float _711 = _677;
    float _713 = _685;
    if (!_585)
    {
        _695 = _679;
    }
    float _715 = _695;
    uint _717 = uint(int(uint(_687) >> uint(2)));
    _37[int(_717)] = as_type<uint>(_659);
    int _719 = _687 + 4;
    uint _721 = uint(int(uint(_719) >> uint(2)));
    _37[int(_721)] = as_type<uint>(_673);
    int _723 = _687 + 8;
    uint _725 = uint(int(uint(_723) >> uint(2)));
    _37[int(_725)] = as_type<uint>(_675);
    int _727 = _687 + 12;
    uint _729 = uint(int(uint(_727) >> uint(2)));
    _37[int(_729)] = as_type<uint>(_679);
    float _731 = _715;
    if (!_585)
    {
        _361 = _689;
    }
    float _733 = _361;
    float _735 = _733;
    if (!_585)
    {
        _697 = _691;
    }
    float _737 = _697;
    int _739 = _687 + 16;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    _37[int(_741)] = as_type<uint>(_657);
    int _743 = _687 + 20;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    _37[int(_745)] = as_type<uint>(_683);
    int _747 = _687 + 24;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    _37[int(_749)] = as_type<uint>(_677);
    int _751 = _687 + 28;
    uint _753 = uint(int(uint(_751) >> uint(2)));
    _37[int(_753)] = as_type<uint>(_689);
    float _755 = _737;
    if (!_585)
    {
        _699 = _659;
    }
    float _757 = _699;
    float _759 = _757;
    if (!_585)
    {
        _701 = _673;
    }
    float _761 = _701;
    int _763 = _687 + 32;
    uint _765 = uint(int(uint(_763) >> uint(2)));
    _37[int(_765)] = as_type<uint>(_681);
    int _767 = _687 + 36;
    uint _769 = uint(int(uint(_767) >> uint(2)));
    _37[int(_769)] = as_type<uint>(_661);
    int _771 = _687 + 40;
    uint _773 = uint(int(uint(_771) >> uint(2)));
    _37[int(_773)] = as_type<uint>(_685);
    int _775 = _687 + 44;
    uint _777 = uint(int(uint(_775) >> uint(2)));
    _37[int(_777)] = as_type<uint>(_691);
    float _779 = _761;
    if (!_585)
    {
        _703 = _675;
    }
    float _781 = _703;
    float _783 = _781;
    if (!_585)
    {
        _705 = _657;
    }
    float _785 = _705;
    float _787 = _785;
    if (!_585)
    {
        _363 = _683;
    }
    float _789 = _363;
    bool _791 = !_585;
    float _793 = _789;
    if (!_791)
    {
        bool _795 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _797 = !_795;
        if (!_797)
        {
            uint _799 = uint(int(uint(_693) >> uint(2)));
            uint _801 = uint(int(uint(int(_799)) >> uint(2)));
            int _803 = int(_799) & 3;
            float _805 = (*spvDescriptorSet0.cp_c6)._m0[int(_801)][_803];
            int _807 = as_type<int>(_805) * 48;
            int _809 = 0;
            bool _811;
            float _907;
            float _909;
            float _911;
            float _919;
            float _931;
            float _933;
            float _937;
            float _957;
            float _959;
            float _961;
            float _963;
            float _965;
            do
            {
                int _813 = _809;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _815 = uint(int(uint(_807) >> uint(2)));
                float _817 = as_type<float>(_37[int(_815)]);
                int _819 = _807 + 4;
                uint _821 = uint(int(uint(_819) >> uint(2)));
                float _823 = as_type<float>(_37[int(_821)]);
                int _825 = _807 + 8;
                uint _827 = uint(int(uint(_825) >> uint(2)));
                float _829 = as_type<float>(_37[int(_827)]);
                int _831 = _807 + 12;
                uint _833 = uint(int(uint(_831) >> uint(2)));
                float _835 = as_type<float>(_37[int(_833)]);
                int _837 = _813 + 1;
                int _839 = _807 + 16;
                uint _841 = uint(int(uint(_839) >> uint(2)));
                float _843 = as_type<float>(_37[int(_841)]);
                int _845 = _807 + 20;
                uint _847 = uint(int(uint(_845) >> uint(2)));
                float _849 = as_type<float>(_37[int(_847)]);
                int _851 = _807 + 24;
                uint _853 = uint(int(uint(_851) >> uint(2)));
                float _855 = as_type<float>(_37[int(_853)]);
                int _857 = _807 + 28;
                uint _859 = uint(int(uint(_857) >> uint(2)));
                float _861 = as_type<float>(_37[int(_859)]);
                bool _863 = uint(_837) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _865 = _807 + 32;
                uint _867 = uint(int(uint(_865) >> uint(2)));
                float _869 = as_type<float>(_37[int(_867)]);
                int _871 = _807 + 36;
                uint _873 = uint(int(uint(_871) >> uint(2)));
                float _875 = as_type<float>(_37[int(_873)]);
                int _877 = _807 + 40;
                uint _879 = uint(int(uint(_877) >> uint(2)));
                float _881 = as_type<float>(_37[int(_879)]);
                int _883 = _807 + 44;
                uint _885 = uint(int(uint(_883) >> uint(2)));
                float _887 = as_type<float>(_37[int(_885)]);
                float _889 = _689 * _823;
                float _891 = _657 * _823;
                float _893 = _683 * _823;
                float _895 = _677 * _823;
                float _897 = fma(_679, _817, _889);
                float _899 = fma(_659, _817, _891);
                float _901 = fma(_673, _817, _893);
                float _903 = fma(_675, _817, _895);
                float _905 = fma(_691, _829, _897);
                _907 = fma(_681, _829, _899);
                _909 = fma(_661, _829, _901);
                _911 = fma(_685, _829, _903);
                float _913 = _689 * _849;
                float _915 = _657 * _849;
                float _917 = _683 * _849;
                _919 = _835 + _905;
                float _921 = fma(_679, _843, _913);
                float _923 = fma(_659, _843, _915);
                float _925 = fma(_673, _843, _917);
                float _927 = _677 * _849;
                float _929 = fma(_691, _855, _921);
                _931 = fma(_681, _855, _923);
                _933 = fma(_661, _855, _925);
                float _935 = _657 * _875;
                _937 = _861 + _929;
                float _939 = _689 * _875;
                float _941 = _683 * _875;
                float _943 = _677 * _875;
                float _945 = fma(_675, _843, _927);
                float _947 = fma(_679, _869, _939);
                float _949 = fma(_659, _869, _935);
                float _951 = fma(_673, _869, _941);
                float _953 = fma(_675, _869, _943);
                float _955 = fma(_691, _881, _947);
                _957 = fma(_685, _855, _945);
                _959 = fma(_681, _881, _949);
                _961 = fma(_661, _881, _951);
                _963 = fma(_685, _881, _953);
                _965 = _887 + _955;
                uint _967 = uint(int(uint(_687) >> uint(2)));
                _37[int(_967)] = as_type<uint>(_907);
                int _969 = _687 + 4;
                uint _971 = uint(int(uint(_969) >> uint(2)));
                _37[int(_971)] = as_type<uint>(_909);
                int _973 = _687 + 8;
                uint _975 = uint(int(uint(_973) >> uint(2)));
                _37[int(_975)] = as_type<uint>(_911);
                int _977 = _687 + 12;
                uint _979 = uint(int(uint(_977) >> uint(2)));
                _37[int(_979)] = as_type<uint>(_919);
                int _981 = _687 + 16;
                uint _983 = uint(int(uint(_981) >> uint(2)));
                _37[int(_983)] = as_type<uint>(_931);
                int _985 = _687 + 20;
                uint _987 = uint(int(uint(_985) >> uint(2)));
                _37[int(_987)] = as_type<uint>(_933);
                int _989 = _687 + 24;
                uint _991 = uint(int(uint(_989) >> uint(2)));
                _37[int(_991)] = as_type<uint>(_957);
                int _993 = _687 + 28;
                uint _995 = uint(int(uint(_993) >> uint(2)));
                _37[int(_995)] = as_type<uint>(_937);
                int _997 = _687 + 32;
                uint _999 = uint(int(uint(_997) >> uint(2)));
                _37[int(_999)] = as_type<uint>(_959);
                int _1001 = _687 + 36;
                uint _1003 = uint(int(uint(_1001) >> uint(2)));
                _37[int(_1003)] = as_type<uint>(_961);
                int _1005 = _687 + 40;
                uint _1007 = uint(int(uint(_1005) >> uint(2)));
                _37[int(_1007)] = as_type<uint>(_963);
                int _1009 = _687 + 44;
                uint _1011 = uint(int(uint(_1009) >> uint(2)));
                _37[int(_1011)] = as_type<uint>(_965);
                _811 = !_863;
                _809 = _837;
            } while (_811);
            _793 = _933;
            _707 = _961;
            _779 = _909;
            _787 = _931;
            _709 = _959;
            _759 = _907;
            _711 = _957;
            _783 = _911;
            _713 = _963;
            _735 = _937;
            _731 = _919;
            _755 = _965;
            _1013 = true;
        }
        else
        {
            _793 = 0.0;
            _707 = 0.0;
            _779 = 0.0;
            _787 = 0.0;
            _709 = 0.0;
            _759 = 0.0;
            _711 = 0.0;
            _783 = 0.0;
            _713 = 0.0;
            _735 = 0.0;
            _731 = 0.0;
            _755 = 0.0;
        }
    }
    _1013 = false;
    float _1015 = _793;
    float _1017 = _707;
    float _1019 = _779;
    float _1021 = _787;
    float _1023 = _709;
    float _1025 = _759;
    float _1027 = _711;
    float _1029 = _783;
    float _1031 = _713;
    float _1033 = _735;
    float _1035 = _731;
    float _1037 = _755;
    int _1039 = _693 + 80;
    uint _1041 = uint(int(uint(_1039) >> uint(2)));
    uint _1043 = uint(int(uint(int(_1041)) >> uint(2)));
    int _1045 = int(_1041) & 3;
    float _1047 = (*spvDescriptorSet0.cp_c6)._m0[int(_1043)][_1045];
    int _1049 = int(_1041) + 1;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    int _1053 = _1049 & 3;
    float _1055 = (*spvDescriptorSet0.cp_c6)._m0[int(_1051)][_1053];
    int _1057 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1059 = _1057 + _68;
    int _1061 = _693 + 64;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    uint _1065 = uint(int(uint(int(_1063)) >> uint(2)));
    int _1067 = int(_1063) & 3;
    float _1069 = (*spvDescriptorSet0.cp_c6)._m0[int(_1065)][_1067];
    int _1071 = int(_1063) + 1;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    int _1075 = _1071 & 3;
    float _1077 = (*spvDescriptorSet0.cp_c6)._m0[int(_1073)][_1075];
    int _1079 = _1059 * 48;
    int _1081 = _693 + 88;
    uint _1083 = uint(int(uint(_1081) >> uint(2)));
    uint _1085 = uint(int(uint(int(_1083)) >> uint(2)));
    int _1087 = int(_1083) & 3;
    float _1089 = (*spvDescriptorSet0.cp_c6)._m0[int(_1085)][_1087];
    int _1091 = int(_1083) + 1;
    uint _1093 = uint(int(uint(_1091) >> uint(2)));
    int _1095 = _1091 & 3;
    float _1097 = (*spvDescriptorSet0.cp_c6)._m0[int(_1093)][_1095];
    int _1099 = _693 + 72;
    uint _1101 = uint(int(uint(_1099) >> uint(2)));
    uint _1103 = uint(int(uint(int(_1101)) >> uint(2)));
    int _1105 = int(_1101) & 3;
    float _1107 = (*spvDescriptorSet0.cp_c6)._m0[int(_1103)][_1105];
    int _1109 = int(_1101) + 1;
    uint _1111 = uint(int(uint(_1109) >> uint(2)));
    int _1113 = _1109 & 3;
    float _1115 = (*spvDescriptorSet0.cp_c6)._m0[int(_1111)][_1113];
    int _1117 = _693 + 96;
    uint _1119 = uint(int(uint(_1117) >> uint(2)));
    uint _1121 = uint(int(uint(int(_1119)) >> uint(2)));
    int _1123 = int(_1119) & 3;
    float _1125 = (*spvDescriptorSet0.cp_c6)._m0[int(_1121)][_1123];
    int _1127 = int(_1119) + 1;
    uint _1129 = uint(int(uint(_1127) >> uint(2)));
    int _1131 = _1127 & 3;
    float _1133 = (*spvDescriptorSet0.cp_c6)._m0[int(_1129)][_1131];
    int _1135 = _693 + 104;
    uint _1137 = uint(int(uint(_1135) >> uint(2)));
    uint _1139 = uint(int(uint(int(_1137)) >> uint(2)));
    int _1141 = int(_1137) & 3;
    float _1143 = (*spvDescriptorSet0.cp_c6)._m0[int(_1139)][_1141];
    int _1145 = int(_1137) + 1;
    uint _1147 = uint(int(uint(_1145) >> uint(2)));
    int _1149 = _1145 & 3;
    float _1151 = (*spvDescriptorSet0.cp_c6)._m0[int(_1147)][_1149];
    float _1153 = _1015 * _1047;
    float _1155 = _1017 * _1047;
    int _1157 = _693 + 16;
    uint _1159 = uint(int(uint(_1157) >> uint(2)));
    uint _1161 = uint(int(uint(int(_1159)) >> uint(2)));
    int _1163 = int(_1159) & 3;
    float _1165 = (*spvDescriptorSet0.cp_c6)._m0[int(_1161)][_1163];
    int _1167 = int(_1159) + 1;
    uint _1169 = uint(int(uint(_1167) >> uint(2)));
    int _1171 = _1167 & 3;
    float _1173 = (*spvDescriptorSet0.cp_c6)._m0[int(_1169)][_1171];
    float _1175 = _1019 * _1047;
    float _1177 = fma(_1021, _1069, _1153);
    float _1179 = fma(_1023, _1069, _1155);
    float _1181 = _1019 * _1055;
    float _1183 = _1015 * _1055;
    float _1185 = _1017 * _1055;
    int _1187 = _693 + 32;
    uint _1189 = uint(int(uint(_1187) >> uint(2)));
    uint _1191 = uint(int(uint(int(_1189)) >> uint(2)));
    int _1193 = int(_1189) & 3;
    float _1195 = (*spvDescriptorSet0.cp_c6)._m0[int(_1191)][_1193];
    int _1197 = int(_1189) + 1;
    uint _1199 = uint(int(uint(_1197) >> uint(2)));
    int _1201 = _1197 & 3;
    float _1203 = (*spvDescriptorSet0.cp_c6)._m0[int(_1199)][_1201];
    float _1205 = fma(_1025, _1077, _1181);
    float _1207 = fma(_1021, _1077, _1183);
    float _1209 = fma(_1023, _1077, _1185);
    float _1211 = _1019 * _1089;
    float _1213 = _1019 * _1097;
    float _1215 = _1015 * _1089;
    float _1217 = _1017 * _1089;
    int _1219 = _693 + 48;
    uint _1221 = uint(int(uint(_1219) >> uint(2)));
    uint _1223 = uint(int(uint(int(_1221)) >> uint(2)));
    int _1225 = int(_1221) & 3;
    float _1227 = (*spvDescriptorSet0.cp_c6)._m0[int(_1223)][_1225];
    int _1229 = int(_1221) + 1;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    int _1233 = _1229 & 3;
    float _1235 = (*spvDescriptorSet0.cp_c6)._m0[int(_1231)][_1233];
    float _1237 = _1015 * _1097;
    float _1239 = _1017 * _1097;
    float _1241 = fma(_1021, _1107, _1215);
    float _1243 = fma(_1025, _1107, _1211);
    float _1245 = fma(_1025, _1115, _1213);
    float _1247 = fma(_1021, _1115, _1237);
    float _1249 = fma(_1023, _1107, _1217);
    int _1251 = _693 + 24;
    uint _1253 = uint(int(uint(_1251) >> uint(2)));
    uint _1255 = uint(int(uint(int(_1253)) >> uint(2)));
    int _1257 = int(_1253) & 3;
    float _1259 = (*spvDescriptorSet0.cp_c6)._m0[int(_1255)][_1257];
    int _1261 = int(_1253) + 1;
    uint _1263 = uint(int(uint(_1261) >> uint(2)));
    int _1265 = _1261 & 3;
    float _1267 = (*spvDescriptorSet0.cp_c6)._m0[int(_1263)][_1265];
    float _1269 = fma(_1023, _1115, _1239);
    float _1271 = fma(_1025, _1069, _1175);
    float _1273 = fma(_1027, _1125, _1177);
    float _1275 = fma(_1029, _1133, _1205);
    float _1277 = fma(_1027, _1133, _1207);
    float _1279 = fma(_1031, _1125, _1179);
    float _1281 = fma(_1031, _1133, _1209);
    int _1283 = _693 + 40;
    uint _1285 = uint(int(uint(_1283) >> uint(2)));
    uint _1287 = uint(int(uint(int(_1285)) >> uint(2)));
    int _1289 = int(_1285) & 3;
    float _1291 = (*spvDescriptorSet0.cp_c6)._m0[int(_1287)][_1289];
    int _1293 = int(_1285) + 1;
    uint _1295 = uint(int(uint(_1293) >> uint(2)));
    int _1297 = _1293 & 3;
    float _1299 = (*spvDescriptorSet0.cp_c6)._m0[int(_1295)][_1297];
    float _1301 = fma(_1029, _1125, _1271);
    float _1303 = fma(_1027, _1151, _1247);
    float _1305 = fma(_1029, _1151, _1245);
    float _1307 = fma(_1031, _1151, _1269);
    float _1309 = fma(_1031, _1143, _1249);
    float _1311 = _1303 + _1033;
    int _1313 = _693 + 56;
    uint _1315 = uint(int(uint(_1313) >> uint(2)));
    uint _1317 = uint(int(uint(int(_1315)) >> uint(2)));
    int _1319 = int(_1315) & 3;
    float _1321 = (*spvDescriptorSet0.cp_c6)._m0[int(_1317)][_1319];
    int _1323 = int(_1315) + 1;
    uint _1325 = uint(int(uint(_1323) >> uint(2)));
    int _1327 = _1323 & 3;
    float _1329 = (*spvDescriptorSet0.cp_c6)._m0[int(_1325)][_1327];
    float _1331 = fma(_1027, _1143, _1241);
    float _1333 = _1305 + _1035;
    float _1335 = fma(_1029, _1143, _1243);
    float _1337 = _1307 + _1037;
    float _1339 = _1311 * _1173;
    float _1341 = _1277 * _1173;
    float _1343 = _1273 * _1173;
    float _1345 = _1331 * _1173;
    float _1347 = fma(_1333, _1165, _1339);
    float _1349 = fma(_1275, _1165, _1341);
    float _1351 = fma(_1301, _1165, _1343);
    float _1353 = fma(_1335, _1165, _1345);
    float _1355 = _1311 * _1203;
    float _1357 = _1277 * _1203;
    float _1359 = _1273 * _1203;
    float _1361 = _1331 * _1203;
    float _1363 = fma(_1333, _1195, _1355);
    float _1365 = fma(_1275, _1195, _1357);
    float _1367 = fma(_1301, _1195, _1359);
    float _1369 = fma(_1335, _1195, _1361);
    float _1371 = _1311 * _1235;
    float _1373 = _1277 * _1235;
    float _1375 = _1273 * _1235;
    float _1377 = _1331 * _1235;
    float _1379 = fma(_1333, _1227, _1371);
    float _1381 = fma(_1275, _1227, _1373);
    float _1383 = fma(_1301, _1227, _1375);
    float _1385 = fma(_1335, _1227, _1377);
    float _1387 = fma(_1337, _1259, _1347);
    float _1389 = fma(_1281, _1259, _1349);
    float _1391 = fma(_1279, _1259, _1351);
    float _1393 = fma(_1309, _1259, _1353);
    float _1395 = _1387 + _1267;
    float _1397 = fma(_1337, _1291, _1363);
    float _1399 = fma(_1281, _1291, _1365);
    float _1401 = fma(_1279, _1291, _1367);
    float _1403 = fma(_1309, _1291, _1369);
    float _1405 = _1397 + _1299;
    float _1407 = fma(_1337, _1321, _1379);
    float _1409 = fma(_1281, _1321, _1381);
    int _1411 = _1079 + 16;
    float _1413 = fma(_1279, _1321, _1383);
    int _1415 = _1079 + 32;
    float _1417 = fma(_1309, _1321, _1385);
    float _1419 = _1407 + _1329;
    int _1421 = _1079 + 48;
    uint _1423 = uint(int(uint(_1411) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1423)] = as_type<uint>(_1391);
    int _1425 = _1411 + 4;
    uint _1427 = uint(int(uint(_1425) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1427)] = as_type<uint>(_1389);
    int _1429 = _1411 + 8;
    uint _1431 = uint(int(uint(_1429) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1431)] = as_type<uint>(_1393);
    int _1433 = _1411 + 12;
    uint _1435 = uint(int(uint(_1433) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1435)] = as_type<uint>(_1395);
    uint _1437 = uint(int(uint(_1415) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1437)] = as_type<uint>(_1401);
    int _1439 = _1415 + 4;
    uint _1441 = uint(int(uint(_1439) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1441)] = as_type<uint>(_1399);
    int _1443 = _1415 + 8;
    uint _1445 = uint(int(uint(_1443) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1445)] = as_type<uint>(_1403);
    int _1447 = _1415 + 12;
    uint _1449 = uint(int(uint(_1447) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1449)] = as_type<uint>(_1405);
    uint _1451 = uint(int(uint(_1421) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1451)] = as_type<uint>(_1413);
    int _1453 = _1421 + 4;
    uint _1455 = uint(int(uint(_1453) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1455)] = as_type<uint>(_1409);
    int _1457 = _1421 + 8;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1459)] = as_type<uint>(_1417);
    int _1461 = _1421 + 12;
    uint _1463 = uint(int(uint(_1461) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1463)] = as_type<uint>(_1419);
}

