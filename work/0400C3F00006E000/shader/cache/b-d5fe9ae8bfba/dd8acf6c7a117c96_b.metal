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
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_A [[id(9)]];
    sampler cp_t_tcb_ASmplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _60(thread const int& _4213, thread const int& _4214, constant _10& support_buffer)
{
    int _4217 = 1 + _4214;
    float _4219 = support_buffer._m5[_4217].x;
    bool _4221 = _4219 == 1.0;
    if (_4221)
    {
        return _4213;
    }
    float _4223 = float(_4213);
    float _4225 = _4223 * _4219;
    int _4227 = int(_4225);
    return _4227;
}

static inline __attribute__((always_inline))
void _58(thread const int& _3901, thread const int& _3902, thread const int& _3903, thread const int& _3904, thread int& _3905, thread int& _3906, thread int& _3907, thread int& _3908, thread int& _3909, thread int& _3910)
{
    float _3913 = as_type<float>(_3902) + 0.0;
    bool _3915 = _3913 != 0.0;
    bool _3917 = isnan(_3913);
    bool _3919 = _3915 || _3917;
    bool _3921 = isnan(0.0);
    bool _3923 = _3919 || _3921;
    int _3925 = as_type<int>(_3913);
    int _3927 = _3902;
    int _3929 = _3903;
    int _3931 = _3923 ? (-1) : 0;
    if (!_3923)
    {
        float _3933 = as_type<float>(_3902) * 1.0;
        _3925 = as_type<int>(_3933);
    }
    int _3935 = _3925;
    bool _3937 = !_3923;
    int _3939 = _3935;
    if (!_3937)
    {
        float _3941 = as_type<float>(_3902) + 0.0;
        bool _3943 = _3941 >= 0.0;
        bool _3945 = isnan(_3941);
        bool _3947 = _3943 || _3945;
        bool _3949 = isnan(0.0);
        bool _3951 = _3947 || _3949;
        int _3953 = as_type<int>(_3941);
        _3931 = _3951 ? (-1) : 0;
        if (!_3951)
        {
            _3953 = 2147483647;
        }
        int _3955 = _3953;
        bool _3957 = !_3951;
        _3939 = _3955;
        if (!_3957)
        {
            float _3959 = as_type<float>(_3902) + 0.0;
            bool _3961 = _3959 > as_type<float>(0x7f800000u /* inf */);
            bool _3963 = isnan(_3959);
            bool _3965 = _3961 || _3963;
            bool _3967 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3969 = _3965 || _3967;
            int _3971 = as_type<int>(_3959);
            _3931 = _3969 ? (-1) : 0;
            if (_3969)
            {
                float _3973 = as_type<float>(_3902) + 1.0;
                _3971 = as_type<int>(_3973);
            }
            int _3975 = _3971;
            _3939 = _3975;
            if (!_3969)
            {
                float _3977 = 0.0 + as_type<float>(_3902);
                bool _3979 = _3977 != as_type<float>(0x7f800000u /* inf */);
                bool _3981 = isnan(_3977);
                bool _3983 = _3979 || _3981;
                bool _3985 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3987 = _3983 || _3985;
                int _3989 = as_type<int>(_3977);
                _3931 = _3987 ? (-1) : 0;
                if (!_3987)
                {
                    _3989 = _3902;
                }
                int _3991 = _3989;
                bool _3993 = !_3987;
                _3939 = _3991;
                if (!_3993)
                {
                    float _3995 = as_type<float>(_3902) * 18446744073709551616.0;
                    float _3997 = rsqrt(_3995);
                    float _3999 = _3995 * _3997;
                    float _4001 = _3997 * 0.5;
                    float _4003 = -_3999;
                    float _4005 = 0.0 + _4003;
                    float _4007 = fma(_4001, _4005, 0.5);
                    float _4009 = fma(_3999, _4007, _3999);
                    float _4011 = -_4009;
                    float _4013 = 0.0 + _4011;
                    float _4015 = fma(_4009, _4013, _3995);
                    float _4017 = fma(_4001, _4015, _4009);
                    float _4019 = _4017 * 2.3283064365386962890625e-10;
                    _3939 = as_type<int>(_4019);
                    _3927 = as_type<int>(_3995);
                    _3929 = as_type<int>(_4009);
                }
            }
        }
    }
    int _4021 = _3939;
    int _4023 = _3927;
    int _4025 = _3929;
    int _4027 = _3931;
    _3905 = _4021;
    _3906 = _3904;
    _3907 = 0;
    _3908 = _4023;
    _3909 = _4025;
    _3910 = _4027;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1019 = false;
    bool _389 = false;
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
    int _101 = _60(_97, _99, (*spvDescriptorSet0.support_buffer));
    int _103 = as_type<int>(_85);
    int _105 = 0;
    int _107 = _60(_103, _105, (*spvDescriptorSet0.support_buffer));
    int3 _1591 = int3(_101, _107, 1);
    float3 _111 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1591.xy), uint(_1591.z), 0).xyz;
    float _113 = _111.x;
    float _115 = _111.y;
    float _117 = _111.z;
    int _119 = _70;
    int _121 = 1;
    int _123 = _60(_119, _121, (*spvDescriptorSet0.support_buffer));
    int _125 = as_type<int>(_95);
    int _127 = 1;
    int _129 = _60(_125, _127, (*spvDescriptorSet0.support_buffer));
    int3 _1609 = int3(_123, _129, 1);
    float3 _131 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1609.xy), uint(_1609.z), 0).xyz;
    float _133 = _131.x;
    float _135 = _131.y;
    float _137 = _131.z;
    int _139 = _70;
    int _141 = 0;
    int _143 = _60(_139, _141, (*spvDescriptorSet0.support_buffer));
    int _145 = as_type<int>(_85);
    int _147 = 0;
    int _149 = _60(_145, _147, (*spvDescriptorSet0.support_buffer));
    int3 _1627 = int3(_143, _149, 0);
    float3 _151 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1627.xy), uint(_1627.z), 0).xyz;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = _151.z;
    int _159 = _70;
    int _161 = 0;
    int _163 = _60(_159, _161, (*spvDescriptorSet0.support_buffer));
    int _165 = as_type<int>(_85);
    int _167 = 0;
    int _169 = _60(_165, _167, (*spvDescriptorSet0.support_buffer));
    int3 _1645 = int3(_163, _169, 2);
    float3 _171 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1645.xy), uint(_1645.z), 0).xyz;
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
    float _219 = _197 * _209;
    float _221 = _201 * 6.283185482025146484375;
    float _223 = cos(_221);
    float _225 = _197 * _213;
    float _227 = _203 * 6.283185482025146484375;
    float _229 = sin(_227);
    float _231 = _217 * _213;
    float _233 = _209 * _217;
    float _235 = _201 * 6.283185482025146484375;
    float _237 = sin(_235);
    float _239 = _203 * 6.283185482025146484375;
    float _241 = cos(_239);
    float _243 = _223 * _229;
    float _245 = _189 * 6.283185482025146484375;
    float _247 = sin(_245);
    float _249 = _237 * _229;
    float _251 = _205 * 6.283185482025146484375;
    float _253 = sin(_251);
    float _255 = _241 * _237;
    float _257 = _223 * _241;
    float _259 = _189 * 6.283185482025146484375;
    float _261 = cos(_259);
    float _263 = _247 * _233;
    float _265 = _247 * _231;
    float _267 = _205 * 6.283185482025146484375;
    float _269 = cos(_267);
    float _271 = _253 * _255;
    float _273 = _261 * _231;
    float _275 = fma(_261, _225, _263);
    float _277 = _247 * _225;
    float _279 = fma(_261, _219, _265);
    float _281 = -_273;
    float _283 = fma(_247, _219, _281);
    float _285 = -_277;
    float _287 = fma(_261, _233, _285);
    float _289 = _269 * _249;
    float _291 = fma(_269, _243, _271);
    float _293 = _253 * _243;
    float _295 = -_289;
    float _297 = fma(_253, _257, _295);
    float _299 = _275 * _291;
    float _301 = _253 * _249;
    float _303 = -_293;
    float _305 = fma(_269, _255, _303);
    float _307 = fma(_283, _297, _299);
    float _309 = fma(_269, _257, _301);
    float _311 = fma(_287, _305, _307);
    float _313 = fma(_279, _309, _311);
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
    bool _335 = _333 < 0.0;
    float _337 = float(_335);
    float _339 = abs(_333);
    float _341 = -_339;
    float _343 = _341 + 1.0;
    float _345 = abs(_333);
    float _347 = fma(_345, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _349 = as_type<int>(_343) + (-218103808);
    float _351 = abs(_333);
    float _353 = fma(_351, _347, -0.212114393711090087890625);
    bool _355 = uint(_349) >= 1920991232u;
    float _357 = abs(_333);
    float _359 = fma(_357, _353, 1.570728778839111328125);
    bool _361 = !_355;
    float _363 = _177;
    float _385;
    float _387;
    if (!_361)
    {
        int _365 = as_type<int>(_333);
        int _367 = as_type<int>(_343);
        int _369 = as_type<int>(_301);
        int _371 = 1408;
        int _373;
        int _375;
        int _377;
        int _379;
        int _381;
        int _383;
        _58(_365, _367, _369, _371, _373, _375, _377, _379, _381, _383);
        _385 = as_type<float>(_373);
        _387 = as_type<float>(_375);
        _389 = true;
    }
    else
    {
        float _391 = rsqrt(_343);
        float _393 = _343 * _391;
        float _395 = _391 * 0.5;
        float _397 = -_393;
        float _399 = 0.0 + _397;
        float _401 = fma(_395, _399, 0.5);
        float _403 = fma(_393, _401, _393);
        float _405 = -_403;
        float _407 = 0.0 + _405;
        float _409 = fma(_403, _407, _343);
        float _411 = fma(_395, _409, _403);
        _385 = _411;
        _387 = _399;
    }
    _389 = false;
    float _413 = _385;
    float _415 = _387;
    int _417 = _76 + 8;
    uint _419 = uint(int(uint(_417) >> uint(2)));
    uint _421 = uint(int(uint(int(_419)) >> uint(2)));
    int _423 = int(_419) & 3;
    float _425 = (*spvDescriptorSet0.cp_c5)._m0[int(_421)][_423];
    int _427 = _70;
    int _429 = 1;
    int _431 = _60(_427, _429, (*spvDescriptorSet0.support_buffer));
    int _433 = as_type<int>(_425);
    int _435 = 1;
    int _437 = _60(_433, _435, (*spvDescriptorSet0.support_buffer));
    int3 _1976 = int3(_431, _437, 0);
    float3 _439 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1976.xy), uint(_1976.z), 0).xyz;
    float _441 = _439.x;
    float _443 = _439.y;
    float _445 = _439.z;
    int _447 = _70;
    int _449 = 1;
    int _451 = _60(_447, _449, (*spvDescriptorSet0.support_buffer));
    int _453 = as_type<int>(_425);
    int _455 = 1;
    int _457 = _60(_453, _455, (*spvDescriptorSet0.support_buffer));
    int3 _1994 = int3(_451, _457, 2);
    float3 _459 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1994.xy), uint(_1994.z), 0).xyz;
    float _461 = _459.x;
    float _463 = _459.y;
    float _465 = _459.z;
    float _467 = _359 * _413;
    float _469 = _337 * 2.0;
    float _471 = -_469;
    float _473 = fma(_467, _471, _467);
    float _475 = fma(_337, 3.1415927410125732421875, _473);
    float _477 = _475 * 0.15915493667125701904296875;
    float _479 = _477 * 6.283185482025146484375;
    float _481 = sin(_479);
    float _483 = abs(_481);
    bool _485 = _483 >= 0.001000000047497451305389404296875;
    bool _487 = isnan(_483);
    bool _489 = _485 || _487;
    bool _491 = isnan(0.001000000047497451305389404296875);
    bool _493 = _489 || _491;
    float _495 = _205;
    float _497 = _415;
    float _499 = _473;
    if (!_493)
    {
        int _501 = _76 + 28;
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
    float _529 = _445;
    if (!_525)
    {
        int _531 = _76 + 28;
        uint _533 = uint(int(uint(_531) >> uint(2)));
        uint _535 = uint(int(uint(int(_533)) >> uint(2)));
        int _537 = int(_533) & 3;
        float _539 = (*spvDescriptorSet0.cp_c5)._m0[int(_535)][_537];
        float _541 = 1.0 / _481;
        float _543 = _475 * _539;
        float _545 = _543 * 0.15915493667125701904296875;
        float _547 = -_543;
        float _549 = _475 + _547;
        float _551 = _549 * 0.15915493667125701904296875;
        float _553 = _545 * 6.283185482025146484375;
        float _555 = sin(_553);
        float _557 = _551 * 6.283185482025146484375;
        float _559 = sin(_557);
        float _561 = _555 * _541;
        float _563 = _559 * _541;
        _527 = _561;
        _513 = _539;
        _521 = _563;
    }
    float _565 = _527;
    float _567 = _513;
    float _569 = _521;
    bool _571 = !_327;
    float _573 = -_565;
    float _575 = _571 ? _573 : _565;
    int _577 = _76 + 20;
    uint _579 = uint(int(uint(_577) >> uint(2)));
    uint _581 = uint(int(uint(int(_579)) >> uint(2)));
    int _583 = int(_579) & 3;
    float _585 = (*spvDescriptorSet0.cp_c5)._m0[int(_581)][_583];
    float _587 = _465 * _567;
    bool _589 = _70 != 0;
    float _591 = _309 * _575;
    float _593 = _305 * _575;
    float _595 = _297 * _575;
    float _597 = _291 * _575;
    float _599 = fma(_279, _569, _591);
    float _601 = fma(_287, _569, _593);
    float _603 = fma(_283, _569, _595);
    float _605 = fma(_275, _569, _597);
    float _607 = _599 * 2.0;
    float _609 = _441 * _567;
    float _611 = _603 * 2.0;
    float _613 = _605 * 2.0;
    float _615 = _603 * _607;
    float _617 = _601 * _607;
    float _619 = _605 * _607;
    float _621 = _603 * _603;
    float _623 = -_615;
    float _625 = fma(_601, _613, _623);
    float _627 = -_617;
    float _629 = fma(_605, _611, _627);
    float _631 = fma(_601, _613, _615);
    float _633 = fma(_605, _611, _617);
    float _635 = _605 * _605;
    float _637 = fma(_601, _611, _619);
    float _639 = -_619;
    float _641 = fma(_601, _611, _639);
    float _643 = _601 * _601;
    float _645 = fma(_635, -2.0, 1.0);
    float _647 = fma(_621, -2.0, 1.0);
    float _649 = fma(_153, _585, _609);
    float _651 = _443 * _567;
    float _653 = fma(_643, -2.0, _645);
    float _655 = _445 * _567;
    float _657 = fma(_643, -2.0, _647);
    float _659 = fma(_155, _585, _651);
    float _661 = _653 * _649;
    float _663 = fma(_157, _585, _655);
    float _665 = _461 * _567;
    float _667 = _631 * _659;
    float _669 = fma(_635, -2.0, _647);
    float _671 = _463 * _567;
    float _673 = _637 * _663;
    float _675 = _633 * _649;
    float _677 = _641 * _649;
    float _679 = _629 * _659;
    float _681 = fma(_173, _585, _665);
    float _683 = _657 * _659;
    float _685 = _625 * _663;
    float _687 = _669 * _663;
    int _689 = _70 * 48;
    float _691 = fma(_175, _585, _671);
    float _693 = fma(_177, _585, _587);
    int _695 = _70 * 112;
    float _697 = _659;
    float _699 = _641;
    float _701 = _663;
    float _703 = _657;
    float _705 = _633;
    float _707 = _625;
    float _709 = _675;
    float _711 = _683;
    float _713 = _685;
    float _715 = _691;
    if (!_589)
    {
        _697 = _681;
    }
    float _717 = _697;
    uint _719 = uint(int(uint(_689) >> uint(2)));
    _39[int(_719)] = as_type<uint>(_661);
    int _721 = _689 + 4;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    _39[int(_723)] = as_type<uint>(_679);
    int _725 = _689 + 8;
    uint _727 = uint(int(uint(_725) >> uint(2)));
    _39[int(_727)] = as_type<uint>(_673);
    int _729 = _689 + 12;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    _39[int(_731)] = as_type<uint>(_681);
    int _733 = _689 + 16;
    int _735 = _689 + 32;
    int _737 = _689 + 16;
    uint _739 = uint(int(uint(_737) >> uint(2)));
    _39[int(_739)] = as_type<uint>(_675);
    int _741 = _689 + 20;
    uint _743 = uint(int(uint(_741) >> uint(2)));
    _39[int(_743)] = as_type<uint>(_683);
    int _745 = _689 + 24;
    uint _747 = uint(int(uint(_745) >> uint(2)));
    _39[int(_747)] = as_type<uint>(_685);
    int _749 = _689 + 28;
    uint _751 = uint(int(uint(_749) >> uint(2)));
    _39[int(_751)] = as_type<uint>(_691);
    float _753 = _717;
    if (!_589)
    {
        _699 = _693;
    }
    float _755 = _699;
    float _757 = _755;
    if (!_589)
    {
        _529 = _661;
    }
    float _759 = _529;
    int _761 = _689 + 32;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    _39[int(_763)] = as_type<uint>(_677);
    int _765 = _689 + 36;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    _39[int(_767)] = as_type<uint>(_667);
    int _769 = _689 + 40;
    uint _771 = uint(int(uint(_769) >> uint(2)));
    _39[int(_771)] = as_type<uint>(_687);
    int _773 = _689 + 44;
    uint _775 = uint(int(uint(_773) >> uint(2)));
    _39[int(_775)] = as_type<uint>(_693);
    float _777 = _759;
    if (!_589)
    {
        _701 = _679;
    }
    float _779 = _701;
    float _781 = _779;
    if (!_589)
    {
        _703 = _673;
    }
    float _783 = _703;
    float _785 = _783;
    if (!_589)
    {
        _363 = _677;
    }
    float _787 = _363;
    float _789 = _787;
    if (!_589)
    {
        _705 = _667;
    }
    float _791 = _705;
    float _793 = _791;
    if (!_589)
    {
        _707 = _687;
    }
    float _795 = _707;
    bool _797 = !_589;
    float _799 = _795;
    if (!_797)
    {
        bool _801 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _803 = !_801;
        if (!_803)
        {
            uint _805 = uint(int(uint(_695) >> uint(2)));
            uint _807 = uint(int(uint(int(_805)) >> uint(2)));
            int _809 = int(_805) & 3;
            float _811 = (*spvDescriptorSet0.cp_c6)._m0[int(_807)][_809];
            int _813 = as_type<int>(_811) * 48;
            int _815 = 0;
            bool _817;
            float _913;
            float _915;
            float _933;
            float _935;
            float _939;
            float _959;
            float _961;
            float _963;
            float _965;
            float _967;
            float _969;
            float _971;
            do
            {
                int _819 = _815;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _821 = uint(int(uint(_813) >> uint(2)));
                float _823 = as_type<float>(_39[int(_821)]);
                int _825 = _813 + 4;
                uint _827 = uint(int(uint(_825) >> uint(2)));
                float _829 = as_type<float>(_39[int(_827)]);
                int _831 = _813 + 8;
                uint _833 = uint(int(uint(_831) >> uint(2)));
                float _835 = as_type<float>(_39[int(_833)]);
                int _837 = _813 + 12;
                uint _839 = uint(int(uint(_837) >> uint(2)));
                float _841 = as_type<float>(_39[int(_839)]);
                int _843 = _819 + 1;
                int _845 = _813 + 16;
                uint _847 = uint(int(uint(_845) >> uint(2)));
                float _849 = as_type<float>(_39[int(_847)]);
                int _851 = _813 + 20;
                uint _853 = uint(int(uint(_851) >> uint(2)));
                float _855 = as_type<float>(_39[int(_853)]);
                int _857 = _813 + 24;
                uint _859 = uint(int(uint(_857) >> uint(2)));
                float _861 = as_type<float>(_39[int(_859)]);
                int _863 = _813 + 28;
                uint _865 = uint(int(uint(_863) >> uint(2)));
                float _867 = as_type<float>(_39[int(_865)]);
                bool _869 = uint(_843) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _871 = _813 + 32;
                uint _873 = uint(int(uint(_871) >> uint(2)));
                float _875 = as_type<float>(_39[int(_873)]);
                int _877 = _813 + 36;
                uint _879 = uint(int(uint(_877) >> uint(2)));
                float _881 = as_type<float>(_39[int(_879)]);
                int _883 = _813 + 40;
                uint _885 = uint(int(uint(_883) >> uint(2)));
                float _887 = as_type<float>(_39[int(_885)]);
                int _889 = _813 + 44;
                uint _891 = uint(int(uint(_889) >> uint(2)));
                float _893 = as_type<float>(_39[int(_891)]);
                float _895 = _691 * _829;
                float _897 = _675 * _829;
                float _899 = _683 * _829;
                float _901 = _685 * _829;
                float _903 = fma(_681, _823, _895);
                float _905 = fma(_661, _823, _897);
                float _907 = fma(_679, _823, _899);
                float _909 = fma(_673, _823, _901);
                float _911 = _691 * _855;
                _913 = fma(_677, _835, _905);
                _915 = fma(_667, _835, _907);
                float _917 = _675 * _855;
                float _919 = fma(_681, _849, _911);
                float _921 = _683 * _855;
                float _923 = _685 * _855;
                float _925 = fma(_661, _849, _917);
                float _927 = fma(_693, _861, _919);
                float _929 = fma(_679, _849, _921);
                float _931 = fma(_673, _849, _923);
                _933 = fma(_677, _861, _925);
                _935 = _867 + _927;
                float _937 = _691 * _881;
                _939 = fma(_667, _861, _929);
                float _941 = _675 * _881;
                float _943 = _683 * _881;
                float _945 = _685 * _881;
                float _947 = fma(_681, _875, _937);
                float _949 = fma(_693, _835, _903);
                float _951 = fma(_661, _875, _941);
                float _953 = fma(_679, _875, _943);
                float _955 = fma(_673, _875, _945);
                float _957 = fma(_693, _887, _947);
                _959 = fma(_687, _861, _931);
                _961 = fma(_687, _835, _909);
                _963 = _841 + _949;
                _965 = fma(_677, _887, _951);
                _967 = fma(_667, _887, _953);
                _969 = fma(_687, _887, _955);
                _971 = _893 + _957;
                uint _973 = uint(int(uint(_689) >> uint(2)));
                _39[int(_973)] = as_type<uint>(_913);
                int _975 = _689 + 4;
                uint _977 = uint(int(uint(_975) >> uint(2)));
                _39[int(_977)] = as_type<uint>(_915);
                int _979 = _689 + 8;
                uint _981 = uint(int(uint(_979) >> uint(2)));
                _39[int(_981)] = as_type<uint>(_961);
                int _983 = _689 + 12;
                uint _985 = uint(int(uint(_983) >> uint(2)));
                _39[int(_985)] = as_type<uint>(_963);
                int _987 = _689 + 16;
                uint _989 = uint(int(uint(_987) >> uint(2)));
                _39[int(_989)] = as_type<uint>(_933);
                int _991 = _689 + 20;
                uint _993 = uint(int(uint(_991) >> uint(2)));
                _39[int(_993)] = as_type<uint>(_939);
                int _995 = _689 + 24;
                uint _997 = uint(int(uint(_995) >> uint(2)));
                _39[int(_997)] = as_type<uint>(_959);
                int _999 = _689 + 28;
                uint _1001 = uint(int(uint(_999) >> uint(2)));
                _39[int(_1001)] = as_type<uint>(_935);
                int _1003 = _689 + 32;
                uint _1005 = uint(int(uint(_1003) >> uint(2)));
                _39[int(_1005)] = as_type<uint>(_965);
                int _1007 = _689 + 36;
                uint _1009 = uint(int(uint(_1007) >> uint(2)));
                _39[int(_1009)] = as_type<uint>(_967);
                int _1011 = _689 + 40;
                uint _1013 = uint(int(uint(_1011) >> uint(2)));
                _39[int(_1013)] = as_type<uint>(_969);
                int _1015 = _689 + 44;
                uint _1017 = uint(int(uint(_1015) >> uint(2)));
                _39[int(_1017)] = as_type<uint>(_971);
                _817 = !_869;
                _815 = _843;
            } while (_817);
            _777 = _913;
            _781 = _915;
            _785 = _961;
            _753 = _963;
            _709 = _933;
            _711 = _939;
            _713 = _959;
            _715 = _935;
            _789 = _965;
            _793 = _967;
            _799 = _969;
            _757 = _971;
            _1019 = true;
        }
        else
        {
            _777 = 0.0;
            _781 = 0.0;
            _785 = 0.0;
            _753 = 0.0;
            _709 = 0.0;
            _711 = 0.0;
            _713 = 0.0;
            _715 = 0.0;
            _789 = 0.0;
            _793 = 0.0;
            _799 = 0.0;
            _757 = 0.0;
        }
    }
    _1019 = false;
    float _1021 = _777;
    float _1023 = _781;
    float _1025 = _785;
    float _1027 = _753;
    float _1029 = _709;
    float _1031 = _711;
    float _1033 = _713;
    float _1035 = _715;
    float _1037 = _789;
    float _1039 = _793;
    float _1041 = _799;
    float _1043 = _757;
    int _1045 = _695 + 80;
    uint _1047 = uint(int(uint(_1045) >> uint(2)));
    uint _1049 = uint(int(uint(int(_1047)) >> uint(2)));
    int _1051 = int(_1047) & 3;
    float _1053 = (*spvDescriptorSet0.cp_c6)._m0[int(_1049)][_1051];
    int _1055 = int(_1047) + 1;
    uint _1057 = uint(int(uint(_1055) >> uint(2)));
    int _1059 = _1055 & 3;
    float _1061 = (*spvDescriptorSet0.cp_c6)._m0[int(_1057)][_1059];
    bool _1063 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1065 = _695 + 64;
    uint _1067 = uint(int(uint(_1065) >> uint(2)));
    uint _1069 = uint(int(uint(int(_1067)) >> uint(2)));
    int _1071 = int(_1067) & 3;
    float _1073 = (*spvDescriptorSet0.cp_c6)._m0[int(_1069)][_1071];
    int _1075 = int(_1067) + 1;
    uint _1077 = uint(int(uint(_1075) >> uint(2)));
    int _1079 = _1075 & 3;
    float _1081 = (*spvDescriptorSet0.cp_c6)._m0[int(_1077)][_1079];
    int _1083 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1085 = _1083 + _70;
    int _1087 = _695 + 88;
    uint _1089 = uint(int(uint(_1087) >> uint(2)));
    uint _1091 = uint(int(uint(int(_1089)) >> uint(2)));
    int _1093 = int(_1089) & 3;
    float _1095 = (*spvDescriptorSet0.cp_c6)._m0[int(_1091)][_1093];
    int _1097 = int(_1089) + 1;
    uint _1099 = uint(int(uint(_1097) >> uint(2)));
    int _1101 = _1097 & 3;
    float _1103 = (*spvDescriptorSet0.cp_c6)._m0[int(_1099)][_1101];
    int _1105 = _695 + 72;
    uint _1107 = uint(int(uint(_1105) >> uint(2)));
    uint _1109 = uint(int(uint(int(_1107)) >> uint(2)));
    int _1111 = int(_1107) & 3;
    float _1113 = (*spvDescriptorSet0.cp_c6)._m0[int(_1109)][_1111];
    int _1115 = int(_1107) + 1;
    uint _1117 = uint(int(uint(_1115) >> uint(2)));
    int _1119 = _1115 & 3;
    float _1121 = (*spvDescriptorSet0.cp_c6)._m0[int(_1117)][_1119];
    int _1123 = _695 + 96;
    uint _1125 = uint(int(uint(_1123) >> uint(2)));
    uint _1127 = uint(int(uint(int(_1125)) >> uint(2)));
    int _1129 = int(_1125) & 3;
    float _1131 = (*spvDescriptorSet0.cp_c6)._m0[int(_1127)][_1129];
    int _1133 = int(_1125) + 1;
    uint _1135 = uint(int(uint(_1133) >> uint(2)));
    int _1137 = _1133 & 3;
    float _1139 = (*spvDescriptorSet0.cp_c6)._m0[int(_1135)][_1137];
    int _1141 = _695 + 104;
    uint _1143 = uint(int(uint(_1141) >> uint(2)));
    uint _1145 = uint(int(uint(int(_1143)) >> uint(2)));
    int _1147 = int(_1143) & 3;
    float _1149 = (*spvDescriptorSet0.cp_c6)._m0[int(_1145)][_1147];
    int _1151 = int(_1143) + 1;
    uint _1153 = uint(int(uint(_1151) >> uint(2)));
    int _1155 = _1151 & 3;
    float _1157 = (*spvDescriptorSet0.cp_c6)._m0[int(_1153)][_1155];
    int _1159 = _695 + 16;
    uint _1161 = uint(int(uint(_1159) >> uint(2)));
    uint _1163 = uint(int(uint(int(_1161)) >> uint(2)));
    int _1165 = int(_1161) & 3;
    float _1167 = (*spvDescriptorSet0.cp_c6)._m0[int(_1163)][_1165];
    int _1169 = int(_1161) + 1;
    uint _1171 = uint(int(uint(_1169) >> uint(2)));
    int _1173 = _1169 & 3;
    float _1175 = (*spvDescriptorSet0.cp_c6)._m0[int(_1171)][_1173];
    if (!_1063)
    {
        uint _1177 = uint(int(uint(_689) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1177)] = as_type<uint>(_1021);
        int _1179 = _689 + 4;
        uint _1181 = uint(int(uint(_1179) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1181)] = as_type<uint>(_1023);
        int _1183 = _689 + 8;
        uint _1185 = uint(int(uint(_1183) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1185)] = as_type<uint>(_1025);
        int _1187 = _689 + 12;
        uint _1189 = uint(int(uint(_1187) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1189)] = as_type<uint>(_1027);
        uint _1191 = uint(int(uint(_733) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1191)] = as_type<uint>(_1029);
        int _1193 = _733 + 4;
        uint _1195 = uint(int(uint(_1193) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1195)] = as_type<uint>(_1031);
        int _1197 = _733 + 8;
        uint _1199 = uint(int(uint(_1197) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1199)] = as_type<uint>(_1033);
        int _1201 = _733 + 12;
        uint _1203 = uint(int(uint(_1201) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1203)] = as_type<uint>(_1035);
        uint _1205 = uint(int(uint(_735) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1205)] = as_type<uint>(_1037);
        int _1207 = _735 + 4;
        uint _1209 = uint(int(uint(_1207) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1209)] = as_type<uint>(_1039);
        int _1211 = _735 + 8;
        uint _1213 = uint(int(uint(_1211) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1213)] = as_type<uint>(_1041);
        int _1215 = _735 + 12;
        uint _1217 = uint(int(uint(_1215) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1217)] = as_type<uint>(_1043);
    }
    float _1219 = _1031 * _1053;
    float _1221 = _1039 * _1053;
    int _1223 = _695 + 32;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    uint _1227 = uint(int(uint(int(_1225)) >> uint(2)));
    int _1229 = int(_1225) & 3;
    float _1231 = (*spvDescriptorSet0.cp_c6)._m0[int(_1227)][_1229];
    int _1233 = int(_1225) + 1;
    uint _1235 = uint(int(uint(_1233) >> uint(2)));
    int _1237 = _1233 & 3;
    float _1239 = (*spvDescriptorSet0.cp_c6)._m0[int(_1235)][_1237];
    float _1241 = _1023 * _1053;
    float _1243 = fma(_1029, _1073, _1219);
    float _1245 = fma(_1037, _1073, _1221);
    float _1247 = _1023 * _1061;
    float _1249 = _1031 * _1061;
    float _1251 = _1039 * _1061;
    float _1253 = _1023 * _1103;
    int _1255 = _695 + 48;
    uint _1257 = uint(int(uint(_1255) >> uint(2)));
    uint _1259 = uint(int(uint(int(_1257)) >> uint(2)));
    int _1261 = int(_1257) & 3;
    float _1263 = (*spvDescriptorSet0.cp_c6)._m0[int(_1259)][_1261];
    int _1265 = int(_1257) + 1;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    int _1269 = _1265 & 3;
    float _1271 = (*spvDescriptorSet0.cp_c6)._m0[int(_1267)][_1269];
    float _1273 = fma(_1021, _1081, _1247);
    float _1275 = fma(_1029, _1081, _1249);
    float _1277 = fma(_1037, _1081, _1251);
    float _1279 = _1023 * _1095;
    float _1281 = _1031 * _1095;
    float _1283 = _1031 * _1103;
    float _1285 = _1039 * _1095;
    float _1287 = _1039 * _1103;
    int _1289 = _695 + 24;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    uint _1293 = uint(int(uint(int(_1291)) >> uint(2)));
    int _1295 = int(_1291) & 3;
    float _1297 = (*spvDescriptorSet0.cp_c6)._m0[int(_1293)][_1295];
    int _1299 = int(_1291) + 1;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    int _1303 = _1299 & 3;
    float _1305 = (*spvDescriptorSet0.cp_c6)._m0[int(_1301)][_1303];
    float _1307 = fma(_1021, _1113, _1279);
    float _1309 = fma(_1021, _1121, _1253);
    float _1311 = fma(_1029, _1113, _1281);
    float _1313 = fma(_1029, _1121, _1283);
    float _1315 = fma(_1037, _1113, _1285);
    float _1317 = fma(_1037, _1121, _1287);
    float _1319 = fma(_1025, _1139, _1273);
    int _1321 = _695 + 40;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    uint _1325 = uint(int(uint(int(_1323)) >> uint(2)));
    int _1327 = int(_1323) & 3;
    float _1329 = (*spvDescriptorSet0.cp_c6)._m0[int(_1325)][_1327];
    int _1331 = int(_1323) + 1;
    uint _1333 = uint(int(uint(_1331) >> uint(2)));
    int _1335 = _1331 & 3;
    float _1337 = (*spvDescriptorSet0.cp_c6)._m0[int(_1333)][_1335];
    float _1339 = fma(_1033, _1131, _1243);
    float _1341 = fma(_1033, _1139, _1275);
    float _1343 = fma(_1033, _1149, _1311);
    float _1345 = fma(_1033, _1157, _1313);
    float _1347 = fma(_1025, _1157, _1309);
    float _1349 = fma(_1041, _1157, _1317);
    float _1351 = fma(_1021, _1073, _1241);
    int _1353 = _695 + 56;
    uint _1355 = uint(int(uint(_1353) >> uint(2)));
    uint _1357 = uint(int(uint(int(_1355)) >> uint(2)));
    int _1359 = int(_1355) & 3;
    float _1361 = (*spvDescriptorSet0.cp_c6)._m0[int(_1357)][_1359];
    int _1363 = int(_1355) + 1;
    uint _1365 = uint(int(uint(_1363) >> uint(2)));
    int _1367 = _1363 & 3;
    float _1369 = (*spvDescriptorSet0.cp_c6)._m0[int(_1365)][_1367];
    float _1371 = _1345 + _1035;
    float _1373 = _1347 + _1027;
    float _1375 = _1349 + _1043;
    float _1377 = fma(_1025, _1131, _1351);
    float _1379 = _1371 * _1175;
    float _1381 = fma(_1041, _1131, _1245);
    float _1383 = fma(_1041, _1139, _1277);
    float _1385 = fma(_1025, _1149, _1307);
    float _1387 = fma(_1041, _1149, _1315);
    float _1389 = _1341 * _1175;
    float _1391 = _1339 * _1175;
    float _1393 = _1343 * _1175;
    float _1395 = fma(_1373, _1167, _1379);
    float _1397 = fma(_1319, _1167, _1389);
    float _1399 = _1371 * _1239;
    float _1401 = _1339 * _1239;
    float _1403 = _1341 * _1239;
    float _1405 = _1343 * _1239;
    float _1407 = fma(_1373, _1231, _1399);
    int _1409 = _1085 * 48;
    float _1411 = fma(_1377, _1167, _1391);
    float _1413 = fma(_1385, _1167, _1393);
    float _1415 = _1371 * _1271;
    float _1417 = _1341 * _1271;
    float _1419 = _1339 * _1271;
    float _1421 = _1343 * _1271;
    float _1423 = fma(_1373, _1263, _1415);
    float _1425 = fma(_1377, _1231, _1401);
    float _1427 = fma(_1319, _1231, _1403);
    float _1429 = fma(_1385, _1231, _1405);
    float _1431 = fma(_1319, _1263, _1417);
    float _1433 = fma(_1375, _1297, _1395);
    float _1435 = fma(_1377, _1263, _1419);
    float _1437 = fma(_1385, _1263, _1421);
    float _1439 = fma(_1383, _1297, _1397);
    float _1441 = fma(_1381, _1297, _1411);
    float _1443 = fma(_1387, _1297, _1413);
    float _1445 = _1433 + _1305;
    int _1447 = _1409 + 16;
    float _1449 = fma(_1375, _1329, _1407);
    float _1451 = fma(_1381, _1329, _1425);
    float _1453 = fma(_1383, _1329, _1427);
    float _1455 = fma(_1387, _1329, _1429);
    float _1457 = _1449 + _1337;
    int _1459 = _1409 + 32;
    int _1461 = _1409 + 48;
    float _1463 = fma(_1375, _1361, _1423);
    float _1465 = fma(_1383, _1361, _1431);
    float _1467 = fma(_1381, _1361, _1435);
    float _1469 = fma(_1387, _1361, _1437);
    float _1471 = _1463 + _1369;
    uint _1473 = uint(int(uint(_1447) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1473)] = as_type<uint>(_1441);
    int _1475 = _1447 + 4;
    uint _1477 = uint(int(uint(_1475) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1477)] = as_type<uint>(_1439);
    int _1479 = _1447 + 8;
    uint _1481 = uint(int(uint(_1479) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1481)] = as_type<uint>(_1443);
    int _1483 = _1447 + 12;
    uint _1485 = uint(int(uint(_1483) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1485)] = as_type<uint>(_1445);
    uint _1487 = uint(int(uint(_1459) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1487)] = as_type<uint>(_1451);
    int _1489 = _1459 + 4;
    uint _1491 = uint(int(uint(_1489) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1491)] = as_type<uint>(_1453);
    int _1493 = _1459 + 8;
    uint _1495 = uint(int(uint(_1493) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1495)] = as_type<uint>(_1455);
    int _1497 = _1459 + 12;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1499)] = as_type<uint>(_1457);
    uint _1501 = uint(int(uint(_1461) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1501)] = as_type<uint>(_1467);
    int _1503 = _1461 + 4;
    uint _1505 = uint(int(uint(_1503) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1505)] = as_type<uint>(_1465);
    int _1507 = _1461 + 8;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1509)] = as_type<uint>(_1469);
    int _1511 = _1461 + 12;
    uint _1513 = uint(int(uint(_1511) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1513)] = as_type<uint>(_1471);
}

