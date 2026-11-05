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
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_A [[id(9)]];
    sampler cp_t_tcb_ASmplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _3988, thread const int& _3989, constant _10& support_buffer)
{
    int _3992 = 1 + _3989;
    float _3994 = support_buffer._m5[_3992].x;
    bool _3996 = _3994 == 1.0;
    if (_3996)
    {
        return _3988;
    }
    float _3998 = float(_3988);
    float _4000 = _3998 * _3994;
    int _4002 = int(_4000);
    return _4002;
}

static inline __attribute__((always_inline))
void _56(thread const int& _3680, thread const int& _3681, thread const int& _3682, thread const int& _3683, thread int& _3684, thread int& _3685, thread int& _3686, thread int& _3687, thread int& _3688, thread int& _3689)
{
    float _3692 = as_type<float>(_3680) + 0.0;
    bool _3694 = _3692 != 0.0;
    bool _3696 = isnan(_3692);
    bool _3698 = _3694 || _3696;
    bool _3700 = isnan(0.0);
    bool _3702 = _3698 || _3700;
    int _3704 = _3681;
    int _3706 = _3682;
    int _3708 = 0;
    int _3710 = _3702 ? (-1) : 0;
    if (!_3702)
    {
        float _3712 = as_type<float>(_3680) * 1.0;
        _3704 = as_type<int>(_3712);
    }
    int _3714 = _3704;
    bool _3716 = !_3702;
    int _3718 = _3714;
    int _3720 = _3714;
    if (!_3716)
    {
        float _3722 = as_type<float>(_3680) + 0.0;
        bool _3724 = _3722 >= 0.0;
        bool _3726 = isnan(_3722);
        bool _3728 = _3724 || _3726;
        bool _3730 = isnan(0.0);
        bool _3732 = _3728 || _3730;
        _3710 = _3732 ? (-1) : 0;
        if (!_3732)
        {
            _3718 = 2147483647;
        }
        int _3734 = _3718;
        bool _3736 = !_3732;
        int _3738 = _3734;
        _3720 = _3734;
        if (!_3736)
        {
            float _3740 = as_type<float>(_3680) + 0.0;
            bool _3742 = _3740 > as_type<float>(0x7f800000u /* inf */);
            bool _3744 = isnan(_3740);
            bool _3746 = _3742 || _3744;
            bool _3748 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3750 = _3746 || _3748;
            _3708 = 2139095040;
            _3710 = _3750 ? (-1) : 0;
            if (_3750)
            {
                float _3752 = as_type<float>(_3680) + 1.0;
                _3738 = as_type<int>(_3752);
            }
            int _3754 = _3738;
            int _3756 = _3754;
            _3720 = _3754;
            if (!_3750)
            {
                float _3758 = 0.0 + as_type<float>(_3680);
                bool _3760 = _3758 != as_type<float>(0x7f800000u /* inf */);
                bool _3762 = isnan(_3758);
                bool _3764 = _3760 || _3762;
                bool _3766 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3768 = _3764 || _3766;
                _3710 = _3768 ? (-1) : 0;
                if (!_3768)
                {
                    _3756 = _3680;
                }
                int _3770 = _3756;
                bool _3772 = !_3768;
                _3720 = _3770;
                if (!_3772)
                {
                    float _3774 = as_type<float>(_3680) * 18446744073709551616.0;
                    float _3776 = rsqrt(_3774);
                    float _3778 = _3774 * _3776;
                    float _3780 = _3776 * 0.5;
                    float _3782 = -_3778;
                    float _3784 = 0.0 + _3782;
                    float _3786 = fma(_3780, _3784, 0.5);
                    float _3788 = fma(_3778, _3786, _3778);
                    float _3790 = -_3788;
                    float _3792 = 0.0 + _3790;
                    float _3794 = fma(_3788, _3792, _3774);
                    float _3796 = fma(_3780, _3794, _3788);
                    float _3798 = _3796 * 2.3283064365386962890625e-10;
                    _3720 = as_type<int>(_3798);
                    _3706 = as_type<int>(_3788);
                    _3708 = as_type<int>(_3784);
                }
            }
        }
    }
    int _3800 = _3720;
    int _3802 = _3706;
    int _3804 = _3708;
    int _3806 = _3710;
    _3684 = _3683;
    _3685 = 0;
    _3686 = _3800;
    _3687 = _3802;
    _3688 = _3804;
    _3689 = _3806;
}

static inline __attribute__((always_inline))
int _60(thread const int& _4023, thread const int& _4024, thread const int& _4025, thread int& _4026, thread uint& gl_SubgroupInvocationID)
{
    int _4029 = _4025 & 31;
    uint _4031 = uint(int(uint(_4025) >> uint(8)));
    int _4033 = int(_4031) & 31;
    float _4035 = as_type<float>(gl_SubgroupInvocationID);
    int _4037 = as_type<int>(_4035) & _4033;
    int _4039 = ~_4033;
    int _4041 = _4029 & _4039;
    int _4043 = _4041 | _4037;
    int _4045 = ~_4033;
    int _4047 = _4024 & _4045;
    int _4049 = _4047 | _4037;
    bool _4051 = uint(_4049) <= uint(_4043);
    _4026 = _4051 ? (-1) : 0;
    float _4053 = spvSubgroupShuffle(as_type<float>(_4023), uint(_4049));
    uint _4055 = uint(_4051 ? as_type<int>(_4053) : _4023);
    return int(_4055);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1029 = false;
    bool _385 = false;
    float _64 = as_type<float>(gl_WorkGroupID.x);
    float _66 = as_type<float>(gl_LocalInvocationID.x);
    int _68 = as_type<int>(_64) << 6;
    int _70 = _68 + as_type<int>(_66);
    bool _74 = uint(_70) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_74)
    {
        return;
    }
    int _76 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _79 = uint(int(uint(_76) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.cp_c5)._m0[int(_81)][_83];
    int _87 = _76 + 8;
    uint _89 = uint(int(uint(_87) >> uint(2)));
    uint _91 = uint(int(uint(int(_89)) >> uint(2)));
    int _93 = int(_89) & 3;
    float _95 = (*spvDescriptorSet0.cp_c5)._m0[int(_91)][_93];
    int _97 = _70;
    int _99 = 0;
    int _101 = _58(_97, _99, (*spvDescriptorSet0.support_buffer));
    int _103 = as_type<int>(_85);
    int _105 = 0;
    int _107 = _58(_103, _105, (*spvDescriptorSet0.support_buffer));
    int3 _1606 = int3(_101, _107, 1);
    float3 _111 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1606.xy), uint(_1606.z), 0).xyz;
    float _113 = _111.x;
    float _115 = _111.y;
    float _117 = _111.z;
    int _119 = _70;
    int _121 = 1;
    int _123 = _58(_119, _121, (*spvDescriptorSet0.support_buffer));
    int _125 = as_type<int>(_95);
    int _127 = 1;
    int _129 = _58(_125, _127, (*spvDescriptorSet0.support_buffer));
    int3 _1624 = int3(_123, _129, 1);
    float3 _131 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1624.xy), uint(_1624.z), 0).xyz;
    float _133 = _131.x;
    float _135 = _131.y;
    float _137 = _131.z;
    int _139 = _70;
    int _141 = 0;
    int _143 = _58(_139, _141, (*spvDescriptorSet0.support_buffer));
    int _145 = as_type<int>(_85);
    int _147 = 0;
    int _149 = _58(_145, _147, (*spvDescriptorSet0.support_buffer));
    int3 _1642 = int3(_143, _149, 0);
    float3 _151 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1642.xy), uint(_1642.z), 0).xyz;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = _151.z;
    int _159 = _70;
    int _161 = 0;
    int _163 = _58(_159, _161, (*spvDescriptorSet0.support_buffer));
    int _165 = as_type<int>(_85);
    int _167 = 0;
    int _169 = _58(_165, _167, (*spvDescriptorSet0.support_buffer));
    int3 _1660 = int3(_163, _169, 2);
    float3 _171 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1660.xy), uint(_1660.z), 0).xyz;
    float _173 = _171.x;
    float _175 = _171.y;
    float _177 = _171.z;
    float _179 = _117 * 0.5;
    float _181 = _115 * 0.5;
    float _183 = _113 * 0.5;
    float _185 = _179 * 0.15915493667125701904296875;
    float _187 = _181 * 0.15915493667125701904296875;
    float _189 = _183 * 0.15915493667125701904296875;
    float _191 = _137 * 0.5;
    float _193 = _135 * 0.5;
    float _195 = _185 * 6.283185482025146484375;
    float _197 = cos(_195);
    float _199 = _133 * 0.5;
    float _201 = _191 * 0.15915493667125701904296875;
    float _203 = _193 * 0.15915493667125701904296875;
    float _205 = _199 * 0.15915493667125701904296875;
    float _207 = _187 * 6.283185482025146484375;
    float _209 = cos(_207);
    float _211 = _187 * 6.283185482025146484375;
    float _213 = sin(_211);
    float _215 = _185 * 6.283185482025146484375;
    float _217 = sin(_215);
    float _219 = _201 * 6.283185482025146484375;
    float _221 = cos(_219);
    float _223 = _197 * _209;
    float _225 = _197 * _213;
    float _227 = _203 * 6.283185482025146484375;
    float _229 = cos(_227);
    float _231 = _217 * _213;
    float _233 = _209 * _217;
    float _235 = _201 * 6.283185482025146484375;
    float _237 = sin(_235);
    float _239 = _189 * 6.283185482025146484375;
    float _241 = sin(_239);
    float _243 = _221 * _229;
    float _245 = _203 * 6.283185482025146484375;
    float _247 = sin(_245);
    float _249 = _229 * _237;
    float _251 = _205 * 6.283185482025146484375;
    float _253 = sin(_251);
    float _255 = _189 * 6.283185482025146484375;
    float _257 = cos(_255);
    float _259 = _221 * _247;
    float _261 = _237 * _247;
    float _263 = _241 * _231;
    float _265 = _205 * 6.283185482025146484375;
    float _267 = cos(_265);
    float _269 = _241 * _233;
    float _271 = fma(_257, _225, _269);
    float _273 = _253 * _249;
    float _275 = _257 * _231;
    float _277 = _241 * _225;
    float _279 = _267 * _261;
    float _281 = fma(_267, _259, _273);
    float _283 = -_275;
    float _285 = fma(_241, _223, _283);
    float _287 = _253 * _259;
    float _289 = -_279;
    float _291 = fma(_253, _243, _289);
    float _293 = _271 * _281;
    float _295 = -_277;
    float _297 = fma(_257, _233, _295);
    float _299 = _253 * _261;
    float _301 = -_287;
    float _303 = fma(_267, _249, _301);
    float _305 = fma(_285, _291, _293);
    float _307 = fma(_257, _223, _263);
    float _309 = fma(_267, _243, _299);
    float _311 = fma(_297, _303, _305);
    float _313 = fma(_307, _309, _311);
    float _315 = precise::max(_313, -1.0);
    float _317 = precise::min(_315, 1.0);
    bool _319 = _317 >= 0.0;
    bool _321 = isnan(_317);
    bool _323 = _319 || _321;
    bool _325 = isnan(0.0);
    bool _327 = _323 || _325;
    bool _329 = !_327;
    float _331 = -_317;
    float _333 = _329 ? _331 : _317;
    float _335 = abs(_333);
    float _337 = -_335;
    float _339 = _337 + 1.0;
    float _341 = abs(_333);
    float _343 = fma(_341, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _345 = as_type<int>(_339) + (-218103808);
    float _347 = abs(_333);
    float _349 = fma(_347, _343, -0.212114393711090087890625);
    bool _351 = uint(_345) >= 1920991232u;
    float _353 = abs(_333);
    float _355 = fma(_353, _349, 1.570728778839111328125);
    bool _357 = _333 < 0.0;
    float _359 = float(_357);
    bool _361 = !_351;
    float _383;
    if (!_361)
    {
        int _363 = as_type<int>(_339);
        int _365 = _345;
        int _367 = as_type<int>(_223);
        int _369 = 1408;
        int _371;
        int _373;
        int _375;
        int _377;
        int _379;
        int _381;
        _56(_363, _365, _367, _369, _371, _373, _375, _377, _379, _381);
        _383 = as_type<float>(_375);
        _385 = true;
    }
    else
    {
        float _387 = rsqrt(_339);
        float _389 = _339 * _387;
        float _391 = _387 * 0.5;
        float _393 = -_389;
        float _395 = 0.0 + _393;
        float _397 = fma(_391, _395, 0.5);
        float _399 = fma(_389, _397, _389);
        float _401 = -_399;
        float _403 = 0.0 + _401;
        float _405 = fma(_399, _403, _339);
        float _407 = fma(_391, _405, _399);
        _383 = _407;
    }
    _385 = false;
    float _409 = _383;
    int _411 = _76 + 8;
    uint _413 = uint(int(uint(_411) >> uint(2)));
    uint _415 = uint(int(uint(int(_413)) >> uint(2)));
    int _417 = int(_413) & 3;
    float _419 = (*spvDescriptorSet0.cp_c5)._m0[int(_415)][_417];
    int _421 = _70;
    int _423 = 1;
    int _425 = _58(_421, _423, (*spvDescriptorSet0.support_buffer));
    int _427 = as_type<int>(_419);
    int _429 = 1;
    int _431 = _58(_427, _429, (*spvDescriptorSet0.support_buffer));
    int3 _1985 = int3(_425, _431, 0);
    float3 _433 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1985.xy), uint(_1985.z), 0).xyz;
    float _435 = _433.x;
    float _437 = _433.y;
    float _439 = _433.z;
    int _441 = _70;
    int _443 = 1;
    int _445 = _58(_441, _443, (*spvDescriptorSet0.support_buffer));
    int _447 = as_type<int>(_419);
    int _449 = 1;
    int _451 = _58(_447, _449, (*spvDescriptorSet0.support_buffer));
    int3 _2003 = int3(_445, _451, 2);
    float3 _453 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2003.xy), uint(_2003.z), 0).xyz;
    float _455 = _453.x;
    float _457 = _453.y;
    float _459 = _453.z;
    float _461 = _355 * _409;
    float _463 = _359 * 2.0;
    float _465 = -_463;
    float _467 = fma(_461, _465, _461);
    float _469 = fma(_359, 3.1415927410125732421875, _467);
    float _471 = _469 * 0.15915493667125701904296875;
    float _473 = _471 * 6.283185482025146484375;
    float _475 = sin(_473);
    float _477 = abs(_475);
    bool _479 = _477 >= 0.001000000047497451305389404296875;
    bool _481 = isnan(_477);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.001000000047497451305389404296875);
    bool _487 = _483 || _485;
    float _489 = _359;
    float _491 = _467;
    float _493 = _461;
    if (!_487)
    {
        int _495 = _76 + 28;
        uint _497 = uint(int(uint(_495) >> uint(2)));
        uint _499 = uint(int(uint(int(_497)) >> uint(2)));
        int _501 = int(_497) & 3;
        float _503 = (*spvDescriptorSet0.cp_c5)._m0[int(_499)][_501];
        _489 = _503;
    }
    float _505 = _489;
    float _507 = _505;
    if (!_487)
    {
        float _509 = -_505;
        float _511 = _509 + 1.0;
        _491 = _511;
    }
    float _513 = _491;
    float _515 = _513;
    if (!_487)
    {
        _493 = _505;
    }
    float _517 = _493;
    bool _519 = !_487;
    float _521 = _517;
    if (!_519)
    {
        int _523 = _76 + 28;
        uint _525 = uint(int(uint(_523) >> uint(2)));
        uint _527 = uint(int(uint(int(_525)) >> uint(2)));
        int _529 = int(_525) & 3;
        float _531 = (*spvDescriptorSet0.cp_c5)._m0[int(_527)][_529];
        float _533 = 1.0 / _475;
        float _535 = _469 * _531;
        float _537 = _535 * 0.15915493667125701904296875;
        float _539 = -_535;
        float _541 = _469 + _539;
        float _543 = _541 * 0.15915493667125701904296875;
        float _545 = _537 * 6.283185482025146484375;
        float _547 = sin(_545);
        float _549 = _543 * 6.283185482025146484375;
        float _551 = sin(_549);
        float _553 = _547 * _533;
        float _555 = _551 * _533;
        _521 = _553;
        _507 = _531;
        _515 = _555;
    }
    float _557 = _521;
    float _559 = _507;
    float _561 = _515;
    bool _563 = !_327;
    float _565 = -_557;
    float _567 = _563 ? _565 : _557;
    int _569 = _76 + 20;
    uint _571 = uint(int(uint(_569) >> uint(2)));
    uint _573 = uint(int(uint(int(_571)) >> uint(2)));
    int _575 = int(_571) & 3;
    float _577 = (*spvDescriptorSet0.cp_c5)._m0[int(_573)][_575];
    float _579 = _435 * _559;
    bool _581 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _583 = _439 * _559;
    float _585 = _309 * _567;
    float _587 = _303 * _567;
    float _589 = _291 * _567;
    float _591 = _281 * _567;
    float _593 = fma(_307, _561, _585);
    float _595 = fma(_297, _561, _587);
    float _597 = fma(_285, _561, _589);
    float _599 = fma(_271, _561, _591);
    float _601 = _593 * 2.0;
    float _603 = _597 * 2.0;
    float _605 = _599 * 2.0;
    float _607 = _595 * _601;
    float _609 = _599 * _601;
    float _611 = _597 * _601;
    float _613 = _597 * _597;
    float _615 = -_607;
    float _617 = fma(_599, _603, _615);
    float _619 = fma(_599, _603, _607);
    float _621 = fma(_595, _603, _609);
    float _623 = -_609;
    float _625 = fma(_595, _603, _623);
    float _627 = -_611;
    float _629 = fma(_595, _605, _627);
    float _631 = fma(_595, _605, _611);
    float _633 = _599 * _599;
    float _635 = _595 * _595;
    float _637 = fma(_153, _577, _579);
    float _639 = _437 * _559;
    float _641 = fma(_633, -2.0, 1.0);
    float _643 = fma(_613, -2.0, 1.0);
    float _645 = fma(_157, _577, _583);
    float _647 = _455 * _559;
    float _649 = fma(_635, -2.0, _641);
    float _651 = fma(_635, -2.0, _643);
    float _653 = fma(_633, -2.0, _643);
    float _655 = fma(_155, _577, _639);
    float _657 = _649 * _637;
    float _659 = _457 * _559;
    float _661 = _459 * _559;
    float _663 = _651 * _655;
    float _665 = _619 * _637;
    float _667 = _617 * _655;
    float _669 = _631 * _655;
    float _671 = fma(_175, _577, _659);
    float _673 = _625 * _637;
    float _675 = _621 * _645;
    float _677 = _629 * _645;
    float _679 = _653 * _645;
    float _681 = fma(_173, _577, _647);
    float _683 = fma(_177, _577, _661);
    int _685 = _70 * 112;
    bool _687 = !_581;
    float _689 = _657;
    float _691 = _667;
    float _693 = _665;
    float _695 = _663;
    float _697 = _677;
    float _699 = _673;
    float _701 = _669;
    float _703 = _679;
    float _705 = _683;
    float _1023;
    float _1025;
    float _1027;
    if (!_687)
    {
        int _707 = 0;
        float _709 = _657;
        float _711 = _667;
        float _713 = _675;
        float _715 = _681;
        float _717 = _665;
        float _719 = _663;
        float _721 = _677;
        float _723 = _671;
        float _725 = _673;
        float _727 = _669;
        float _729 = _679;
        float _731 = _683;
        bool _733;
        int _781;
        int _791;
        int _801;
        int _811;
        int _821;
        int _831;
        int _841;
        int _851;
        int _861;
        int _871;
        int _881;
        int _891;
        float _999;
        float _1001;
        float _1003;
        int _1005;
        float _1007;
        int _1009;
        int _1011;
        int _1013;
        int _1015;
        float _1017;
        float _1019;
        float _1021;
        do
        {
            int _735 = _707;
            float _737 = _709;
            float _739 = _711;
            float _741 = _713;
            int _743 = as_type<int>(_715);
            float _745 = _717;
            int _747 = as_type<int>(_719);
            int _749 = as_type<int>(_721);
            int _751 = as_type<int>(_723);
            int _753 = as_type<int>(_725);
            float _755 = _727;
            float _757 = _729;
            float _759 = _731;
            uint _761 = uint(int(uint(_685) >> uint(2)));
            uint _763 = uint(int(uint(int(_761)) >> uint(2)));
            int _765 = int(_761) & 3;
            float _767 = (*spvDescriptorSet0.cp_c6)._m0[int(_763)][_765];
            bool _769 = _70 != 0;
            int _771 = _735 + 1;
            bool _773 = uint(_771) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _775 = as_type<int>(_737);
            int _777 = as_type<int>(_767);
            int _779 = 31;
            int _2426 = _60(_775, _777, _779, _781, gl_SubgroupInvocationID);
            int _783 = _2426;
            int _785 = as_type<int>(_739);
            int _787 = as_type<int>(_767);
            int _789 = 31;
            int _2431 = _60(_785, _787, _789, _791, gl_SubgroupInvocationID);
            int _793 = _2431;
            int _795 = as_type<int>(_741);
            int _797 = as_type<int>(_767);
            int _799 = 31;
            int _2436 = _60(_795, _797, _799, _801, gl_SubgroupInvocationID);
            int _803 = _2436;
            int _805 = _743;
            int _807 = as_type<int>(_767);
            int _809 = 31;
            int _2440 = _60(_805, _807, _809, _811, gl_SubgroupInvocationID);
            int _813 = _2440;
            int _815 = as_type<int>(_745);
            int _817 = as_type<int>(_767);
            int _819 = 31;
            int _2445 = _60(_815, _817, _819, _821, gl_SubgroupInvocationID);
            int _823 = _2445;
            int _825 = _747;
            int _827 = as_type<int>(_767);
            int _829 = 31;
            int _2449 = _60(_825, _827, _829, _831, gl_SubgroupInvocationID);
            int _833 = _2449;
            int _835 = _749;
            int _837 = as_type<int>(_767);
            int _839 = 31;
            int _2453 = _60(_835, _837, _839, _841, gl_SubgroupInvocationID);
            int _843 = _2453;
            int _845 = _751;
            int _847 = as_type<int>(_767);
            int _849 = 31;
            int _2457 = _60(_845, _847, _849, _851, gl_SubgroupInvocationID);
            int _853 = _2457;
            int _855 = _753;
            int _857 = as_type<int>(_767);
            int _859 = 31;
            int _2461 = _60(_855, _857, _859, _861, gl_SubgroupInvocationID);
            int _863 = _2461;
            int _865 = as_type<int>(_755);
            int _867 = as_type<int>(_767);
            int _869 = 31;
            int _2466 = _60(_865, _867, _869, _871, gl_SubgroupInvocationID);
            int _873 = _2466;
            int _875 = as_type<int>(_757);
            int _877 = as_type<int>(_767);
            int _879 = 31;
            int _2471 = _60(_875, _877, _879, _881, gl_SubgroupInvocationID);
            int _883 = _2471;
            int _885 = as_type<int>(_759);
            int _887 = as_type<int>(_767);
            int _889 = 31;
            int _2476 = _60(_885, _887, _889, _891, gl_SubgroupInvocationID);
            int _893 = _2476;
            bool _895 = !_769;
            _707 = _771;
            float _897 = _737;
            float _899 = _739;
            float _901 = _741;
            int _903 = _743;
            float _905 = _745;
            int _907 = _747;
            int _909 = _749;
            int _911 = _751;
            int _913 = _753;
            float _915 = _755;
            float _917 = _757;
            float _919 = _759;
            if (!_895)
            {
                float _921 = _677 * as_type<float>(_793);
                float _923 = _671 * as_type<float>(_793);
                float _925 = _663 * as_type<float>(_833);
                float _927 = _677 * as_type<float>(_833);
                float _929 = fma(_675, as_type<float>(_783), _921);
                float _931 = fma(_681, as_type<float>(_783), _923);
                float _933 = _665 * as_type<float>(_833);
                float _935 = _671 * as_type<float>(_833);
                float _937 = _665 * as_type<float>(_793);
                float _939 = _663 * as_type<float>(_793);
                float _941 = fma(_657, as_type<float>(_823), _933);
                float _943 = fma(_667, as_type<float>(_823), _925);
                float _945 = fma(_675, as_type<float>(_823), _927);
                float _947 = fma(_681, as_type<float>(_823), _935);
                float _949 = _665 * as_type<float>(_873);
                float _951 = _677 * as_type<float>(_873);
                float _953 = _671 * as_type<float>(_873);
                float _955 = fma(_657, as_type<float>(_783), _937);
                float _957 = fma(_667, as_type<float>(_783), _939);
                float _959 = _663 * as_type<float>(_873);
                float _961 = fma(_657, as_type<float>(_863), _949);
                float _963 = fma(_675, as_type<float>(_863), _951);
                float _965 = fma(_681, as_type<float>(_863), _953);
                float _967 = fma(_673, as_type<float>(_803), _955);
                float _969 = fma(_669, as_type<float>(_803), _957);
                float _971 = fma(_679, as_type<float>(_803), _929);
                float _973 = fma(_683, as_type<float>(_803), _931);
                float _975 = fma(_679, as_type<float>(_843), _945);
                float _977 = fma(_667, as_type<float>(_863), _959);
                float _979 = fma(_683, as_type<float>(_843), _947);
                float _981 = fma(_683, as_type<float>(_883), _965);
                float _983 = fma(_673, as_type<float>(_843), _941);
                float _985 = fma(_669, as_type<float>(_843), _943);
                float _987 = fma(_673, as_type<float>(_883), _961);
                float _989 = fma(_669, as_type<float>(_883), _977);
                float _991 = fma(_679, as_type<float>(_883), _963);
                float _993 = as_type<float>(_813) + _973;
                float _995 = as_type<float>(_853) + _979;
                float _997 = as_type<float>(_893) + _981;
                _897 = _967;
                _899 = _969;
                _901 = _971;
                _903 = as_type<int>(_993);
                _905 = _983;
                _907 = as_type<int>(_985);
                _909 = as_type<int>(_975);
                _911 = as_type<int>(_995);
                _913 = as_type<int>(_987);
                _915 = _989;
                _917 = _991;
                _919 = _997;
            }
            _999 = _897;
            _1001 = _899;
            _1003 = _901;
            _1005 = _903;
            _1007 = _905;
            _1009 = _907;
            _1011 = _909;
            _1013 = _911;
            _1015 = _913;
            _1017 = _915;
            _1019 = _917;
            _1021 = _919;
            _733 = !_773;
            _709 = _999;
            _711 = _1001;
            _713 = _1003;
            _715 = as_type<float>(_1005);
            _717 = _1007;
            _719 = as_type<float>(_1009);
            _721 = as_type<float>(_1011);
            _723 = as_type<float>(_1013);
            _725 = as_type<float>(_1015);
            _727 = _1017;
            _729 = _1019;
            _731 = _1021;
        } while (_733);
        _689 = _999;
        _691 = _1001;
        _1023 = _1003;
        _1025 = as_type<float>(_1005);
        _693 = _1007;
        _695 = as_type<float>(_1009);
        _697 = as_type<float>(_1011);
        _1027 = as_type<float>(_1013);
        _699 = as_type<float>(_1015);
        _701 = _1017;
        _703 = _1019;
        _705 = _1021;
        _1029 = true;
    }
    else
    {
        _1023 = _675;
        _1025 = _681;
        _1027 = _671;
    }
    _1029 = false;
    float _1031 = _689;
    float _1033 = _691;
    float _1035 = _1023;
    float _1037 = _1025;
    float _1039 = _693;
    float _1041 = _695;
    float _1043 = _697;
    float _1045 = _1027;
    float _1047 = _699;
    float _1049 = _701;
    float _1051 = _703;
    float _1053 = _705;
    int _1055 = _685 + 80;
    uint _1057 = uint(int(uint(_1055) >> uint(2)));
    uint _1059 = uint(int(uint(int(_1057)) >> uint(2)));
    int _1061 = int(_1057) & 3;
    float _1063 = (*spvDescriptorSet0.cp_c6)._m0[int(_1059)][_1061];
    int _1065 = int(_1057) + 1;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    int _1069 = _1065 & 3;
    float _1071 = (*spvDescriptorSet0.cp_c6)._m0[int(_1067)][_1069];
    bool _1073 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1075 = _685 + 64;
    uint _1077 = uint(int(uint(_1075) >> uint(2)));
    uint _1079 = uint(int(uint(int(_1077)) >> uint(2)));
    int _1081 = int(_1077) & 3;
    float _1083 = (*spvDescriptorSet0.cp_c6)._m0[int(_1079)][_1081];
    int _1085 = int(_1077) + 1;
    uint _1087 = uint(int(uint(_1085) >> uint(2)));
    int _1089 = _1085 & 3;
    float _1091 = (*spvDescriptorSet0.cp_c6)._m0[int(_1087)][_1089];
    int _1093 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1095 = _1093 + _70;
    int _1097 = _685 + 88;
    uint _1099 = uint(int(uint(_1097) >> uint(2)));
    uint _1101 = uint(int(uint(int(_1099)) >> uint(2)));
    int _1103 = int(_1099) & 3;
    float _1105 = (*spvDescriptorSet0.cp_c6)._m0[int(_1101)][_1103];
    int _1107 = int(_1099) + 1;
    uint _1109 = uint(int(uint(_1107) >> uint(2)));
    int _1111 = _1107 & 3;
    float _1113 = (*spvDescriptorSet0.cp_c6)._m0[int(_1109)][_1111];
    int _1115 = _685 + 72;
    uint _1117 = uint(int(uint(_1115) >> uint(2)));
    uint _1119 = uint(int(uint(int(_1117)) >> uint(2)));
    int _1121 = int(_1117) & 3;
    float _1123 = (*spvDescriptorSet0.cp_c6)._m0[int(_1119)][_1121];
    int _1125 = int(_1117) + 1;
    uint _1127 = uint(int(uint(_1125) >> uint(2)));
    int _1129 = _1125 & 3;
    float _1131 = (*spvDescriptorSet0.cp_c6)._m0[int(_1127)][_1129];
    int _1133 = _685 + 96;
    uint _1135 = uint(int(uint(_1133) >> uint(2)));
    uint _1137 = uint(int(uint(int(_1135)) >> uint(2)));
    int _1139 = int(_1135) & 3;
    float _1141 = (*spvDescriptorSet0.cp_c6)._m0[int(_1137)][_1139];
    int _1143 = int(_1135) + 1;
    uint _1145 = uint(int(uint(_1143) >> uint(2)));
    int _1147 = _1143 & 3;
    float _1149 = (*spvDescriptorSet0.cp_c6)._m0[int(_1145)][_1147];
    int _1151 = _685 + 104;
    uint _1153 = uint(int(uint(_1151) >> uint(2)));
    uint _1155 = uint(int(uint(int(_1153)) >> uint(2)));
    int _1157 = int(_1153) & 3;
    float _1159 = (*spvDescriptorSet0.cp_c6)._m0[int(_1155)][_1157];
    int _1161 = int(_1153) + 1;
    uint _1163 = uint(int(uint(_1161) >> uint(2)));
    int _1165 = _1161 & 3;
    float _1167 = (*spvDescriptorSet0.cp_c6)._m0[int(_1163)][_1165];
    int _1169 = _685 + 16;
    uint _1171 = uint(int(uint(_1169) >> uint(2)));
    uint _1173 = uint(int(uint(int(_1171)) >> uint(2)));
    int _1175 = int(_1171) & 3;
    float _1177 = (*spvDescriptorSet0.cp_c6)._m0[int(_1173)][_1175];
    int _1179 = int(_1171) + 1;
    uint _1181 = uint(int(uint(_1179) >> uint(2)));
    int _1183 = _1179 & 3;
    float _1185 = (*spvDescriptorSet0.cp_c6)._m0[int(_1181)][_1183];
    if (!_1073)
    {
        int _1187 = _70 * 48;
        int _1189 = _1187 + 16;
        uint _1191 = uint(int(uint(_1187) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1191)] = as_type<uint>(_1031);
        int _1193 = _1187 + 4;
        uint _1195 = uint(int(uint(_1193) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1195)] = as_type<uint>(_1033);
        int _1197 = _1187 + 8;
        uint _1199 = uint(int(uint(_1197) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1199)] = as_type<uint>(_1035);
        int _1201 = _1187 + 12;
        uint _1203 = uint(int(uint(_1201) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1203)] = as_type<uint>(_1037);
        int _1205 = _1187 + 32;
        uint _1207 = uint(int(uint(_1189) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1207)] = as_type<uint>(_1039);
        int _1209 = _1189 + 4;
        uint _1211 = uint(int(uint(_1209) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1211)] = as_type<uint>(_1041);
        int _1213 = _1189 + 8;
        uint _1215 = uint(int(uint(_1213) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1215)] = as_type<uint>(_1043);
        int _1217 = _1189 + 12;
        uint _1219 = uint(int(uint(_1217) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1219)] = as_type<uint>(_1045);
        uint _1221 = uint(int(uint(_1205) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1221)] = as_type<uint>(_1047);
        int _1223 = _1205 + 4;
        uint _1225 = uint(int(uint(_1223) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1225)] = as_type<uint>(_1049);
        int _1227 = _1205 + 8;
        uint _1229 = uint(int(uint(_1227) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1229)] = as_type<uint>(_1051);
        int _1231 = _1205 + 12;
        uint _1233 = uint(int(uint(_1231) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1233)] = as_type<uint>(_1053);
    }
    float _1235 = _1049 * _1063;
    float _1237 = _1033 * _1063;
    float _1239 = _1041 * _1063;
    int _1241 = _685 + 32;
    uint _1243 = uint(int(uint(_1241) >> uint(2)));
    uint _1245 = uint(int(uint(int(_1243)) >> uint(2)));
    int _1247 = int(_1243) & 3;
    float _1249 = (*spvDescriptorSet0.cp_c6)._m0[int(_1245)][_1247];
    int _1251 = int(_1243) + 1;
    uint _1253 = uint(int(uint(_1251) >> uint(2)));
    int _1255 = _1251 & 3;
    float _1257 = (*spvDescriptorSet0.cp_c6)._m0[int(_1253)][_1255];
    float _1259 = fma(_1047, _1083, _1235);
    float _1261 = _1033 * _1071;
    float _1263 = fma(_1031, _1083, _1237);
    float _1265 = fma(_1039, _1083, _1239);
    float _1267 = _1041 * _1071;
    float _1269 = fma(_1031, _1091, _1261);
    float _1271 = _1033 * _1105;
    float _1273 = _1033 * _1113;
    float _1275 = _1049 * _1071;
    int _1277 = _685 + 48;
    uint _1279 = uint(int(uint(_1277) >> uint(2)));
    uint _1281 = uint(int(uint(int(_1279)) >> uint(2)));
    int _1283 = int(_1279) & 3;
    float _1285 = (*spvDescriptorSet0.cp_c6)._m0[int(_1281)][_1283];
    int _1287 = int(_1279) + 1;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    int _1291 = _1287 & 3;
    float _1293 = (*spvDescriptorSet0.cp_c6)._m0[int(_1289)][_1291];
    float _1295 = _1041 * _1105;
    float _1297 = _1041 * _1113;
    float _1299 = fma(_1039, _1091, _1267);
    float _1301 = fma(_1047, _1091, _1275);
    float _1303 = _1049 * _1105;
    float _1305 = _1049 * _1113;
    float _1307 = fma(_1031, _1123, _1271);
    float _1309 = fma(_1031, _1131, _1273);
    float _1311 = fma(_1039, _1123, _1295);
    int _1313 = _685 + 24;
    uint _1315 = uint(int(uint(_1313) >> uint(2)));
    uint _1317 = uint(int(uint(int(_1315)) >> uint(2)));
    int _1319 = int(_1315) & 3;
    float _1321 = (*spvDescriptorSet0.cp_c6)._m0[int(_1317)][_1319];
    int _1323 = int(_1315) + 1;
    uint _1325 = uint(int(uint(_1323) >> uint(2)));
    int _1327 = _1323 & 3;
    float _1329 = (*spvDescriptorSet0.cp_c6)._m0[int(_1325)][_1327];
    float _1331 = fma(_1039, _1131, _1297);
    float _1333 = fma(_1047, _1131, _1305);
    float _1335 = fma(_1047, _1123, _1303);
    float _1337 = fma(_1035, _1141, _1263);
    float _1339 = fma(_1043, _1167, _1331);
    float _1341 = fma(_1043, _1141, _1265);
    float _1343 = fma(_1051, _1141, _1259);
    int _1345 = _685 + 40;
    uint _1347 = uint(int(uint(_1345) >> uint(2)));
    uint _1349 = uint(int(uint(int(_1347)) >> uint(2)));
    int _1351 = int(_1347) & 3;
    float _1353 = (*spvDescriptorSet0.cp_c6)._m0[int(_1349)][_1351];
    int _1355 = int(_1347) + 1;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    int _1359 = _1355 & 3;
    float _1361 = (*spvDescriptorSet0.cp_c6)._m0[int(_1357)][_1359];
    float _1363 = fma(_1035, _1149, _1269);
    float _1365 = fma(_1035, _1159, _1307);
    float _1367 = fma(_1035, _1167, _1309);
    float _1369 = fma(_1043, _1149, _1299);
    float _1371 = fma(_1043, _1159, _1311);
    float _1373 = fma(_1051, _1167, _1333);
    float _1375 = _1339 + _1045;
    int _1377 = _685 + 56;
    uint _1379 = uint(int(uint(_1377) >> uint(2)));
    uint _1381 = uint(int(uint(int(_1379)) >> uint(2)));
    int _1383 = int(_1379) & 3;
    float _1385 = (*spvDescriptorSet0.cp_c6)._m0[int(_1381)][_1383];
    int _1387 = int(_1379) + 1;
    uint _1389 = uint(int(uint(_1387) >> uint(2)));
    int _1391 = _1387 & 3;
    float _1393 = (*spvDescriptorSet0.cp_c6)._m0[int(_1389)][_1391];
    float _1395 = fma(_1051, _1149, _1301);
    float _1397 = fma(_1051, _1159, _1335);
    float _1399 = _1373 + _1053;
    float _1401 = _1367 + _1037;
    float _1403 = _1341 * _1185;
    float _1405 = _1369 * _1185;
    float _1407 = _1371 * _1185;
    float _1409 = _1375 * _1185;
    float _1411 = fma(_1337, _1177, _1403);
    float _1413 = fma(_1363, _1177, _1405);
    float _1415 = fma(_1365, _1177, _1407);
    float _1417 = fma(_1401, _1177, _1409);
    float _1419 = _1375 * _1257;
    float _1421 = _1341 * _1257;
    float _1423 = _1369 * _1257;
    float _1425 = _1371 * _1257;
    float _1427 = fma(_1401, _1249, _1419);
    float _1429 = fma(_1337, _1249, _1421);
    float _1431 = fma(_1363, _1249, _1423);
    float _1433 = fma(_1365, _1249, _1425);
    int _1435 = _1095 * 48;
    float _1437 = _1375 * _1293;
    float _1439 = _1341 * _1293;
    float _1441 = _1369 * _1293;
    float _1443 = _1371 * _1293;
    float _1445 = fma(_1401, _1285, _1437);
    float _1447 = fma(_1337, _1285, _1439);
    float _1449 = fma(_1363, _1285, _1441);
    float _1451 = fma(_1365, _1285, _1443);
    float _1453 = fma(_1399, _1321, _1417);
    float _1455 = fma(_1395, _1321, _1413);
    float _1457 = fma(_1343, _1321, _1411);
    float _1459 = fma(_1397, _1321, _1415);
    float _1461 = _1453 + _1329;
    float _1463 = fma(_1399, _1353, _1427);
    float _1465 = fma(_1343, _1353, _1429);
    float _1467 = fma(_1395, _1353, _1431);
    float _1469 = fma(_1397, _1353, _1433);
    float _1471 = _1463 + _1361;
    int _1473 = _1435 + 16;
    int _1475 = _1435 + 32;
    float _1477 = fma(_1399, _1385, _1445);
    float _1479 = fma(_1343, _1385, _1447);
    float _1481 = fma(_1395, _1385, _1449);
    float _1483 = fma(_1397, _1385, _1451);
    float _1485 = _1477 + _1393;
    int _1487 = _1435 + 48;
    uint _1489 = uint(int(uint(_1473) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1489)] = as_type<uint>(_1457);
    int _1491 = _1473 + 4;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1493)] = as_type<uint>(_1455);
    int _1495 = _1473 + 8;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1497)] = as_type<uint>(_1459);
    int _1499 = _1473 + 12;
    uint _1501 = uint(int(uint(_1499) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1501)] = as_type<uint>(_1461);
    uint _1503 = uint(int(uint(_1475) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1503)] = as_type<uint>(_1465);
    int _1505 = _1475 + 4;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1507)] = as_type<uint>(_1467);
    int _1509 = _1475 + 8;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1511)] = as_type<uint>(_1469);
    int _1513 = _1475 + 12;
    uint _1515 = uint(int(uint(_1513) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1515)] = as_type<uint>(_1471);
    uint _1517 = uint(int(uint(_1487) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1517)] = as_type<uint>(_1479);
    int _1519 = _1487 + 4;
    uint _1521 = uint(int(uint(_1519) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1521)] = as_type<uint>(_1481);
    int _1523 = _1487 + 8;
    uint _1525 = uint(int(uint(_1523) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1525)] = as_type<uint>(_1483);
    int _1527 = _1487 + 12;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1529)] = as_type<uint>(_1485);
}

