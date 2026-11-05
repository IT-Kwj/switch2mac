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
int _58(thread const int& _4009, thread const int& _4010, constant _10& support_buffer)
{
    int _4013 = 1 + _4010;
    float _4015 = support_buffer._m5[_4013].x;
    bool _4017 = _4015 == 1.0;
    if (_4017)
    {
        return _4009;
    }
    float _4019 = float(_4009);
    float _4021 = _4019 * _4015;
    int _4023 = int(_4021);
    return _4023;
}

static inline __attribute__((always_inline))
void _56(thread const int& _3701, thread const int& _3702, thread const int& _3703, thread const int& _3704, thread int& _3705, thread int& _3706, thread int& _3707, thread int& _3708, thread int& _3709, thread int& _3710)
{
    float _3713 = as_type<float>(_3701) + 0.0;
    bool _3715 = _3713 != 0.0;
    bool _3717 = isnan(_3713);
    bool _3719 = _3715 || _3717;
    bool _3721 = isnan(0.0);
    bool _3723 = _3719 || _3721;
    int _3725 = _3702;
    int _3727 = _3703;
    int _3729 = 0;
    int _3731 = _3723 ? (-1) : 0;
    if (!_3723)
    {
        float _3733 = as_type<float>(_3701) * 1.0;
        _3725 = as_type<int>(_3733);
    }
    int _3735 = _3725;
    bool _3737 = !_3723;
    int _3739 = _3735;
    int _3741 = _3735;
    if (!_3737)
    {
        float _3743 = as_type<float>(_3701) + 0.0;
        bool _3745 = _3743 >= 0.0;
        bool _3747 = isnan(_3743);
        bool _3749 = _3745 || _3747;
        bool _3751 = isnan(0.0);
        bool _3753 = _3749 || _3751;
        _3731 = _3753 ? (-1) : 0;
        if (!_3753)
        {
            _3739 = 2147483647;
        }
        int _3755 = _3739;
        bool _3757 = !_3753;
        int _3759 = _3755;
        _3741 = _3755;
        if (!_3757)
        {
            float _3761 = as_type<float>(_3701) + 0.0;
            bool _3763 = _3761 > as_type<float>(0x7f800000u /* inf */);
            bool _3765 = isnan(_3761);
            bool _3767 = _3763 || _3765;
            bool _3769 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3771 = _3767 || _3769;
            _3729 = 2139095040;
            _3731 = _3771 ? (-1) : 0;
            if (_3771)
            {
                float _3773 = as_type<float>(_3701) + 1.0;
                _3759 = as_type<int>(_3773);
            }
            int _3775 = _3759;
            int _3777 = _3775;
            _3741 = _3775;
            if (!_3771)
            {
                float _3779 = 0.0 + as_type<float>(_3701);
                bool _3781 = _3779 != as_type<float>(0x7f800000u /* inf */);
                bool _3783 = isnan(_3779);
                bool _3785 = _3781 || _3783;
                bool _3787 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3789 = _3785 || _3787;
                _3731 = _3789 ? (-1) : 0;
                if (!_3789)
                {
                    _3777 = _3701;
                }
                int _3791 = _3777;
                bool _3793 = !_3789;
                _3741 = _3791;
                if (!_3793)
                {
                    float _3795 = as_type<float>(_3701) * 18446744073709551616.0;
                    float _3797 = rsqrt(_3795);
                    float _3799 = _3795 * _3797;
                    float _3801 = _3797 * 0.5;
                    float _3803 = -_3799;
                    float _3805 = 0.0 + _3803;
                    float _3807 = fma(_3801, _3805, 0.5);
                    float _3809 = fma(_3799, _3807, _3799);
                    float _3811 = -_3809;
                    float _3813 = 0.0 + _3811;
                    float _3815 = fma(_3809, _3813, _3795);
                    float _3817 = fma(_3801, _3815, _3809);
                    float _3819 = _3817 * 2.3283064365386962890625e-10;
                    _3741 = as_type<int>(_3819);
                    _3727 = as_type<int>(_3809);
                    _3729 = as_type<int>(_3805);
                }
            }
        }
    }
    int _3821 = _3741;
    int _3823 = _3727;
    int _3825 = _3729;
    int _3827 = _3731;
    _3705 = _3704;
    _3706 = 0;
    _3707 = _3821;
    _3708 = _3823;
    _3709 = _3825;
    _3710 = _3827;
}

static inline __attribute__((always_inline))
int _60(thread const int& _4044, thread const int& _4045, thread const int& _4046, thread int& _4047, thread uint& gl_SubgroupInvocationID)
{
    int _4050 = _4046 & 31;
    uint _4052 = uint(int(uint(_4046) >> uint(8)));
    int _4054 = int(_4052) & 31;
    float _4056 = as_type<float>(gl_SubgroupInvocationID);
    int _4058 = as_type<int>(_4056) & _4054;
    int _4060 = ~_4054;
    int _4062 = _4050 & _4060;
    int _4064 = _4062 | _4058;
    int _4066 = ~_4054;
    int _4068 = _4045 & _4066;
    int _4070 = _4068 | _4058;
    bool _4072 = uint(_4070) <= uint(_4064);
    _4047 = _4072 ? (-1) : 0;
    float _4074 = spvSubgroupShuffle(as_type<float>(_4044), uint(_4070));
    uint _4076 = uint(_4072 ? as_type<int>(_4074) : _4044);
    return int(_4076);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1079 = false;
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
    float _579 = _439 * _559;
    bool _581 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _583 = _309 * _567;
    float _585 = _291 * _567;
    float _587 = _303 * _567;
    float _589 = _281 * _567;
    float _591 = fma(_307, _561, _583);
    float _593 = fma(_285, _561, _585);
    float _595 = fma(_297, _561, _587);
    float _597 = fma(_271, _561, _589);
    float _599 = _591 * 2.0;
    float _601 = _593 * 2.0;
    float _603 = _593 * _593;
    float _605 = _597 * _597;
    float _607 = _595 * _599;
    float _609 = _593 * _599;
    float _611 = _597 * _599;
    float _613 = _597 * 2.0;
    float _615 = -_607;
    float _617 = fma(_597, _601, _615);
    float _619 = fma(_597, _601, _607);
    float _621 = _595 * _595;
    float _623 = fma(_603, -2.0, 1.0);
    float _625 = fma(_605, -2.0, 1.0);
    float _627 = fma(_595, _601, _611);
    float _629 = -_611;
    float _631 = fma(_595, _601, _629);
    float _633 = -_609;
    float _635 = fma(_595, _613, _633);
    float _637 = fma(_595, _613, _609);
    float _639 = fma(_621, -2.0, _625);
    float _641 = fma(_621, -2.0, _623);
    float _643 = fma(_605, -2.0, _623);
    float _645 = _435 * _559;
    bool _647 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _649 = _437 * _559;
    float _651 = fma(_157, _577, _579);
    float _653 = fma(_153, _577, _645);
    float _655 = fma(_155, _577, _649);
    float _657 = _627 * _651;
    float _659 = _639 * _653;
    float _661 = _619 * _653;
    float _663 = _617 * _655;
    float _665 = _641 * _655;
    float _667 = _637 * _655;
    float _669 = _455 * _559;
    float _671 = _457 * _559;
    float _673 = _459 * _559;
    float _675 = _631 * _653;
    float _677 = _635 * _651;
    float _679 = _643 * _651;
    float _681 = fma(_173, _577, _669);
    float _683 = fma(_175, _577, _671);
    float _685 = fma(_177, _577, _673);
    float _687 = _657;
    float _689 = _681;
    if (!_647)
    {
        int _691 = _70 * 48;
        int _693 = _691 + 16;
        uint _695 = uint(int(uint(_691) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_695)] = as_type<uint>(_659);
        int _697 = _691 + 4;
        uint _699 = uint(int(uint(_697) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_699)] = as_type<uint>(_663);
        int _701 = _691 + 8;
        uint _703 = uint(int(uint(_701) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_703)] = as_type<uint>(_657);
        int _705 = _691 + 12;
        uint _707 = uint(int(uint(_705) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_707)] = as_type<uint>(_681);
        int _709 = _691 + 32;
        uint _711 = uint(int(uint(_693) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_711)] = as_type<uint>(_661);
        int _713 = _693 + 4;
        uint _715 = uint(int(uint(_713) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_715)] = as_type<uint>(_665);
        int _717 = _693 + 8;
        uint _719 = uint(int(uint(_717) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_719)] = as_type<uint>(_677);
        int _721 = _693 + 12;
        uint _723 = uint(int(uint(_721) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_723)] = as_type<uint>(_683);
        uint _725 = uint(int(uint(_709) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_725)] = as_type<uint>(_675);
        int _727 = _709 + 4;
        uint _729 = uint(int(uint(_727) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_729)] = as_type<uint>(_667);
        int _731 = _709 + 8;
        uint _733 = uint(int(uint(_731) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_733)] = as_type<uint>(_679);
        int _735 = _709 + 12;
        uint _737 = uint(int(uint(_735) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_737)] = as_type<uint>(_685);
    }
    int _739 = _70 * 112;
    bool _741 = !_581;
    float _1059;
    float _1061;
    float _1063;
    float _1065;
    float _1067;
    float _1069;
    float _1071;
    float _1073;
    float _1075;
    float _1077;
    if (!_741)
    {
        int _743 = 0;
        float _745 = _659;
        float _747 = _663;
        float _749 = _657;
        float _751 = _681;
        float _753 = _661;
        float _755 = _665;
        float _757 = _677;
        float _759 = _683;
        float _761 = _675;
        float _763 = _667;
        float _765 = _679;
        float _767 = _685;
        bool _769;
        int _817;
        int _827;
        int _837;
        int _847;
        int _857;
        int _867;
        int _877;
        int _887;
        int _897;
        int _907;
        int _917;
        int _927;
        int _1035;
        int _1039;
        int _1041;
        int _1045;
        int _1047;
        int _1049;
        int _1053;
        int _1055;
        int _1057;
        do
        {
            int _771 = _743;
            int _773 = as_type<int>(_745);
            int _775 = as_type<int>(_747);
            int _777 = as_type<int>(_749);
            int _779 = as_type<int>(_751);
            int _781 = as_type<int>(_753);
            int _783 = as_type<int>(_755);
            int _785 = as_type<int>(_757);
            int _787 = as_type<int>(_759);
            int _789 = as_type<int>(_761);
            int _791 = as_type<int>(_763);
            int _793 = as_type<int>(_765);
            int _795 = as_type<int>(_767);
            uint _797 = uint(int(uint(_739) >> uint(2)));
            uint _799 = uint(int(uint(int(_797)) >> uint(2)));
            int _801 = int(_797) & 3;
            float _803 = (*spvDescriptorSet0.cp_c6)._m0[int(_799)][_801];
            bool _805 = _70 != 0;
            int _807 = _771 + 1;
            bool _809 = uint(_807) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _811 = _773;
            int _813 = as_type<int>(_803);
            int _815 = 31;
            int _2561 = _60(_811, _813, _815, _817, gl_SubgroupInvocationID);
            int _819 = _2561;
            int _821 = _775;
            int _823 = as_type<int>(_803);
            int _825 = 31;
            int _2565 = _60(_821, _823, _825, _827, gl_SubgroupInvocationID);
            int _829 = _2565;
            int _831 = _777;
            int _833 = as_type<int>(_803);
            int _835 = 31;
            int _2569 = _60(_831, _833, _835, _837, gl_SubgroupInvocationID);
            int _839 = _2569;
            int _841 = _779;
            int _843 = as_type<int>(_803);
            int _845 = 31;
            int _2573 = _60(_841, _843, _845, _847, gl_SubgroupInvocationID);
            int _849 = _2573;
            int _851 = _781;
            int _853 = as_type<int>(_803);
            int _855 = 31;
            int _2577 = _60(_851, _853, _855, _857, gl_SubgroupInvocationID);
            int _859 = _2577;
            int _861 = _783;
            int _863 = as_type<int>(_803);
            int _865 = 31;
            int _2581 = _60(_861, _863, _865, _867, gl_SubgroupInvocationID);
            int _869 = _2581;
            int _871 = _785;
            int _873 = as_type<int>(_803);
            int _875 = 31;
            int _2585 = _60(_871, _873, _875, _877, gl_SubgroupInvocationID);
            int _879 = _2585;
            int _881 = _787;
            int _883 = as_type<int>(_803);
            int _885 = 31;
            int _2589 = _60(_881, _883, _885, _887, gl_SubgroupInvocationID);
            int _889 = _2589;
            int _891 = _789;
            int _893 = as_type<int>(_803);
            int _895 = 31;
            int _2593 = _60(_891, _893, _895, _897, gl_SubgroupInvocationID);
            int _899 = _2593;
            int _901 = _791;
            int _903 = as_type<int>(_803);
            int _905 = 31;
            int _2597 = _60(_901, _903, _905, _907, gl_SubgroupInvocationID);
            int _909 = _2597;
            int _911 = _793;
            int _913 = as_type<int>(_803);
            int _915 = 31;
            int _2601 = _60(_911, _913, _915, _917, gl_SubgroupInvocationID);
            int _919 = _2601;
            int _921 = _795;
            int _923 = as_type<int>(_803);
            int _925 = 31;
            int _2605 = _60(_921, _923, _925, _927, gl_SubgroupInvocationID);
            int _929 = _2605;
            bool _931 = !_805;
            _743 = _807;
            int _933 = _773;
            int _935 = _775;
            int _937 = _777;
            int _939 = _779;
            int _941 = _781;
            int _943 = _783;
            int _945 = _785;
            int _947 = _787;
            int _949 = _789;
            int _951 = _791;
            int _953 = _793;
            int _955 = _795;
            if (!_931)
            {
                float _957 = _683 * as_type<float>(_869);
                float _959 = _665 * as_type<float>(_869);
                float _961 = _677 * as_type<float>(_869);
                float _963 = _665 * as_type<float>(_829);
                float _965 = _661 * as_type<float>(_829);
                float _967 = _677 * as_type<float>(_829);
                float _969 = _683 * as_type<float>(_829);
                float _971 = fma(_681, as_type<float>(_859), _957);
                float _973 = fma(_663, as_type<float>(_859), _959);
                float _975 = _683 * as_type<float>(_909);
                float _977 = fma(_657, as_type<float>(_859), _961);
                float _979 = _665 * as_type<float>(_909);
                float _981 = fma(_663, as_type<float>(_819), _963);
                float _983 = _661 * as_type<float>(_869);
                float _985 = _661 * as_type<float>(_909);
                float _987 = fma(_659, as_type<float>(_819), _965);
                float _989 = fma(_657, as_type<float>(_819), _967);
                float _991 = fma(_681, as_type<float>(_819), _969);
                float _993 = _677 * as_type<float>(_909);
                float _995 = fma(_681, as_type<float>(_899), _975);
                float _997 = fma(_663, as_type<float>(_899), _979);
                float _999 = fma(_659, as_type<float>(_859), _983);
                float _1001 = fma(_659, as_type<float>(_899), _985);
                float _1003 = fma(_667, as_type<float>(_839), _981);
                float _1005 = fma(_675, as_type<float>(_839), _987);
                float _1007 = fma(_679, as_type<float>(_839), _989);
                float _1009 = fma(_679, as_type<float>(_879), _977);
                float _1011 = fma(_657, as_type<float>(_899), _993);
                float _1013 = fma(_685, as_type<float>(_839), _991);
                float _1015 = fma(_685, as_type<float>(_879), _971);
                float _1017 = fma(_685, as_type<float>(_919), _995);
                float _1019 = fma(_675, as_type<float>(_879), _999);
                float _1021 = fma(_667, as_type<float>(_879), _973);
                float _1023 = fma(_675, as_type<float>(_919), _1001);
                float _1025 = fma(_667, as_type<float>(_919), _997);
                float _1027 = fma(_679, as_type<float>(_919), _1011);
                float _1029 = as_type<float>(_849) + _1013;
                float _1031 = as_type<float>(_889) + _1015;
                float _1033 = as_type<float>(_929) + _1017;
                _933 = as_type<int>(_1005);
                _935 = as_type<int>(_1003);
                _937 = as_type<int>(_1007);
                _939 = as_type<int>(_1029);
                _941 = as_type<int>(_1019);
                _943 = as_type<int>(_1021);
                _945 = as_type<int>(_1009);
                _947 = as_type<int>(_1031);
                _949 = as_type<int>(_1023);
                _951 = as_type<int>(_1025);
                _953 = as_type<int>(_1027);
                _955 = as_type<int>(_1033);
            }
            _1035 = _933;
            int _1037 = _935;
            _1039 = _937;
            _1041 = _939;
            int _1043 = _941;
            _1045 = _943;
            _1047 = _945;
            _1049 = _947;
            int _1051 = _949;
            _1053 = _951;
            _1055 = _953;
            _1057 = _955;
            _769 = !_809;
            _745 = as_type<float>(_1035);
            _747 = as_type<float>(_1037);
            _749 = as_type<float>(_1039);
            _751 = as_type<float>(_1041);
            _753 = as_type<float>(_1043);
            _755 = as_type<float>(_1045);
            _757 = as_type<float>(_1047);
            _759 = as_type<float>(_1049);
            _761 = as_type<float>(_1051);
            _763 = as_type<float>(_1053);
            _765 = as_type<float>(_1055);
            _767 = as_type<float>(_1057);
            _1059 = as_type<float>(_1037);
            _1061 = as_type<float>(_1043);
            _1063 = as_type<float>(_1051);
        } while (_769);
        _1065 = as_type<float>(_1045);
        _1067 = as_type<float>(_1053);
        _1069 = as_type<float>(_1035);
        _687 = as_type<float>(_1039);
        _1071 = as_type<float>(_1047);
        _1073 = as_type<float>(_1055);
        _1075 = as_type<float>(_1049);
        _1077 = as_type<float>(_1057);
        _689 = as_type<float>(_1041);
        _1079 = true;
    }
    else
    {
        _1059 = _663;
        _1065 = _665;
        _1067 = _667;
        _1069 = _659;
        _1061 = _661;
        _1063 = _675;
        _1071 = _677;
        _1073 = _679;
        _1075 = _683;
        _1077 = _685;
    }
    _1079 = false;
    float _1081 = _1059;
    float _1083 = _1065;
    float _1085 = _1067;
    float _1087 = _1069;
    float _1089 = _1061;
    float _1091 = _1063;
    float _1093 = _687;
    float _1095 = _1071;
    float _1097 = _1073;
    float _1099 = _1075;
    float _1101 = _1077;
    float _1103 = _689;
    int _1105 = _739 + 80;
    uint _1107 = uint(int(uint(_1105) >> uint(2)));
    uint _1109 = uint(int(uint(int(_1107)) >> uint(2)));
    int _1111 = int(_1107) & 3;
    float _1113 = (*spvDescriptorSet0.cp_c6)._m0[int(_1109)][_1111];
    int _1115 = int(_1107) + 1;
    uint _1117 = uint(int(uint(_1115) >> uint(2)));
    int _1119 = _1115 & 3;
    float _1121 = (*spvDescriptorSet0.cp_c6)._m0[int(_1117)][_1119];
    int _1123 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1125 = _1123 + _70;
    int _1127 = _739 + 64;
    uint _1129 = uint(int(uint(_1127) >> uint(2)));
    uint _1131 = uint(int(uint(int(_1129)) >> uint(2)));
    int _1133 = int(_1129) & 3;
    float _1135 = (*spvDescriptorSet0.cp_c6)._m0[int(_1131)][_1133];
    int _1137 = int(_1129) + 1;
    uint _1139 = uint(int(uint(_1137) >> uint(2)));
    int _1141 = _1137 & 3;
    float _1143 = (*spvDescriptorSet0.cp_c6)._m0[int(_1139)][_1141];
    int _1145 = _1125 * 48;
    int _1147 = _739 + 88;
    uint _1149 = uint(int(uint(_1147) >> uint(2)));
    uint _1151 = uint(int(uint(int(_1149)) >> uint(2)));
    int _1153 = int(_1149) & 3;
    float _1155 = (*spvDescriptorSet0.cp_c6)._m0[int(_1151)][_1153];
    int _1157 = int(_1149) + 1;
    uint _1159 = uint(int(uint(_1157) >> uint(2)));
    int _1161 = _1157 & 3;
    float _1163 = (*spvDescriptorSet0.cp_c6)._m0[int(_1159)][_1161];
    int _1165 = _739 + 72;
    uint _1167 = uint(int(uint(_1165) >> uint(2)));
    uint _1169 = uint(int(uint(int(_1167)) >> uint(2)));
    int _1171 = int(_1167) & 3;
    float _1173 = (*spvDescriptorSet0.cp_c6)._m0[int(_1169)][_1171];
    int _1175 = int(_1167) + 1;
    uint _1177 = uint(int(uint(_1175) >> uint(2)));
    int _1179 = _1175 & 3;
    float _1181 = (*spvDescriptorSet0.cp_c6)._m0[int(_1177)][_1179];
    int _1183 = _739 + 96;
    uint _1185 = uint(int(uint(_1183) >> uint(2)));
    uint _1187 = uint(int(uint(int(_1185)) >> uint(2)));
    int _1189 = int(_1185) & 3;
    float _1191 = (*spvDescriptorSet0.cp_c6)._m0[int(_1187)][_1189];
    int _1193 = int(_1185) + 1;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    int _1197 = _1193 & 3;
    float _1199 = (*spvDescriptorSet0.cp_c6)._m0[int(_1195)][_1197];
    int _1201 = _739 + 104;
    uint _1203 = uint(int(uint(_1201) >> uint(2)));
    uint _1205 = uint(int(uint(int(_1203)) >> uint(2)));
    int _1207 = int(_1203) & 3;
    float _1209 = (*spvDescriptorSet0.cp_c6)._m0[int(_1205)][_1207];
    int _1211 = int(_1203) + 1;
    uint _1213 = uint(int(uint(_1211) >> uint(2)));
    int _1215 = _1211 & 3;
    float _1217 = (*spvDescriptorSet0.cp_c6)._m0[int(_1213)][_1215];
    float _1219 = _1081 * _1113;
    float _1221 = _1083 * _1113;
    float _1223 = _1085 * _1113;
    float _1225 = _1081 * _1121;
    float _1227 = _1085 * _1121;
    int _1229 = _739 + 16;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    uint _1233 = uint(int(uint(int(_1231)) >> uint(2)));
    int _1235 = int(_1231) & 3;
    float _1237 = (*spvDescriptorSet0.cp_c6)._m0[int(_1233)][_1235];
    int _1239 = int(_1231) + 1;
    uint _1241 = uint(int(uint(_1239) >> uint(2)));
    int _1243 = _1239 & 3;
    float _1245 = (*spvDescriptorSet0.cp_c6)._m0[int(_1241)][_1243];
    float _1247 = fma(_1087, _1135, _1219);
    float _1249 = fma(_1089, _1135, _1221);
    float _1251 = fma(_1091, _1135, _1223);
    float _1253 = _1083 * _1121;
    float _1255 = fma(_1087, _1143, _1225);
    int _1257 = _739 + 32;
    uint _1259 = uint(int(uint(_1257) >> uint(2)));
    uint _1261 = uint(int(uint(int(_1259)) >> uint(2)));
    int _1263 = int(_1259) & 3;
    float _1265 = (*spvDescriptorSet0.cp_c6)._m0[int(_1261)][_1263];
    int _1267 = int(_1259) + 1;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    int _1271 = _1267 & 3;
    float _1273 = (*spvDescriptorSet0.cp_c6)._m0[int(_1269)][_1271];
    float _1275 = fma(_1091, _1143, _1227);
    float _1277 = fma(_1089, _1143, _1253);
    float _1279 = _1081 * _1155;
    float _1281 = _1083 * _1155;
    float _1283 = _1081 * _1163;
    float _1285 = _1083 * _1163;
    float _1287 = _1085 * _1155;
    int _1289 = _739 + 48;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    uint _1293 = uint(int(uint(int(_1291)) >> uint(2)));
    int _1295 = int(_1291) & 3;
    float _1297 = (*spvDescriptorSet0.cp_c6)._m0[int(_1293)][_1295];
    int _1299 = int(_1291) + 1;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    int _1303 = _1299 & 3;
    float _1305 = (*spvDescriptorSet0.cp_c6)._m0[int(_1301)][_1303];
    float _1307 = _1085 * _1163;
    float _1309 = fma(_1087, _1173, _1279);
    float _1311 = fma(_1089, _1173, _1281);
    float _1313 = fma(_1087, _1181, _1283);
    float _1315 = fma(_1089, _1181, _1285);
    float _1317 = fma(_1091, _1173, _1287);
    int _1319 = _739 + 24;
    uint _1321 = uint(int(uint(_1319) >> uint(2)));
    uint _1323 = uint(int(uint(int(_1321)) >> uint(2)));
    int _1325 = int(_1321) & 3;
    float _1327 = (*spvDescriptorSet0.cp_c6)._m0[int(_1323)][_1325];
    int _1329 = int(_1321) + 1;
    uint _1331 = uint(int(uint(_1329) >> uint(2)));
    int _1333 = _1329 & 3;
    float _1335 = (*spvDescriptorSet0.cp_c6)._m0[int(_1331)][_1333];
    float _1337 = fma(_1091, _1181, _1307);
    float _1339 = fma(_1093, _1191, _1247);
    float _1341 = fma(_1093, _1199, _1255);
    float _1343 = fma(_1095, _1191, _1249);
    float _1345 = fma(_1095, _1199, _1277);
    float _1347 = fma(_1097, _1191, _1251);
    int _1349 = _739 + 40;
    uint _1351 = uint(int(uint(_1349) >> uint(2)));
    uint _1353 = uint(int(uint(int(_1351)) >> uint(2)));
    int _1355 = int(_1351) & 3;
    float _1357 = (*spvDescriptorSet0.cp_c6)._m0[int(_1353)][_1355];
    int _1359 = int(_1351) + 1;
    uint _1361 = uint(int(uint(_1359) >> uint(2)));
    int _1363 = _1359 & 3;
    float _1365 = (*spvDescriptorSet0.cp_c6)._m0[int(_1361)][_1363];
    float _1367 = fma(_1097, _1199, _1275);
    float _1369 = fma(_1093, _1209, _1309);
    float _1371 = fma(_1095, _1217, _1315);
    float _1373 = fma(_1093, _1217, _1313);
    float _1375 = fma(_1097, _1217, _1337);
    float _1377 = fma(_1095, _1209, _1311);
    int _1379 = _739 + 56;
    uint _1381 = uint(int(uint(_1379) >> uint(2)));
    uint _1383 = uint(int(uint(int(_1381)) >> uint(2)));
    int _1385 = int(_1381) & 3;
    float _1387 = (*spvDescriptorSet0.cp_c6)._m0[int(_1383)][_1385];
    int _1389 = int(_1381) + 1;
    uint _1391 = uint(int(uint(_1389) >> uint(2)));
    int _1393 = _1389 & 3;
    float _1395 = (*spvDescriptorSet0.cp_c6)._m0[int(_1391)][_1393];
    float _1397 = _1371 + _1099;
    float _1399 = fma(_1097, _1209, _1317);
    float _1401 = _1375 + _1101;
    float _1403 = _1373 + _1103;
    float _1405 = _1343 * _1245;
    float _1407 = _1345 * _1245;
    float _1409 = _1377 * _1245;
    float _1411 = _1397 * _1245;
    float _1413 = fma(_1339, _1237, _1405);
    float _1415 = fma(_1341, _1237, _1407);
    float _1417 = fma(_1369, _1237, _1409);
    float _1419 = fma(_1403, _1237, _1411);
    float _1421 = _1397 * _1273;
    float _1423 = _1343 * _1273;
    float _1425 = _1345 * _1273;
    float _1427 = _1377 * _1273;
    float _1429 = fma(_1403, _1265, _1421);
    float _1431 = fma(_1339, _1265, _1423);
    float _1433 = fma(_1341, _1265, _1425);
    float _1435 = fma(_1369, _1265, _1427);
    float _1437 = _1397 * _1305;
    float _1439 = _1343 * _1305;
    float _1441 = _1345 * _1305;
    float _1443 = _1377 * _1305;
    float _1445 = fma(_1403, _1297, _1437);
    float _1447 = fma(_1339, _1297, _1439);
    float _1449 = fma(_1341, _1297, _1441);
    float _1451 = fma(_1369, _1297, _1443);
    float _1453 = fma(_1401, _1327, _1419);
    float _1455 = fma(_1347, _1327, _1413);
    float _1457 = fma(_1367, _1327, _1415);
    float _1459 = fma(_1399, _1327, _1417);
    float _1461 = _1453 + _1335;
    float _1463 = fma(_1401, _1357, _1429);
    float _1465 = fma(_1347, _1357, _1431);
    float _1467 = fma(_1367, _1357, _1433);
    int _1469 = _1145 + 16;
    float _1471 = fma(_1399, _1357, _1435);
    float _1473 = _1463 + _1365;
    int _1475 = _1145 + 32;
    float _1477 = fma(_1401, _1387, _1445);
    float _1479 = fma(_1347, _1387, _1447);
    float _1481 = fma(_1367, _1387, _1449);
    float _1483 = fma(_1399, _1387, _1451);
    float _1485 = _1477 + _1395;
    int _1487 = _1145 + 48;
    uint _1489 = uint(int(uint(_1469) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1489)] = as_type<uint>(_1455);
    int _1491 = _1469 + 4;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1493)] = as_type<uint>(_1457);
    int _1495 = _1469 + 8;
    uint _1497 = uint(int(uint(_1495) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1497)] = as_type<uint>(_1459);
    int _1499 = _1469 + 12;
    uint _1501 = uint(int(uint(_1499) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1501)] = as_type<uint>(_1461);
    uint _1503 = uint(int(uint(_1475) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1503)] = as_type<uint>(_1465);
    int _1505 = _1475 + 4;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1507)] = as_type<uint>(_1467);
    int _1509 = _1475 + 8;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1511)] = as_type<uint>(_1471);
    int _1513 = _1475 + 12;
    uint _1515 = uint(int(uint(_1513) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1515)] = as_type<uint>(_1473);
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

