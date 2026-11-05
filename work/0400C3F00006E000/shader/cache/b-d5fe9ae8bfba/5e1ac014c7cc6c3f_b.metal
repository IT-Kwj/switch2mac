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
int _60(thread const int& _4185, thread const int& _4186, constant _10& support_buffer)
{
    int _4189 = 1 + _4186;
    float _4191 = support_buffer._m5[_4189].x;
    bool _4193 = _4191 == 1.0;
    if (_4193)
    {
        return _4185;
    }
    float _4195 = float(_4185);
    float _4197 = _4195 * _4191;
    int _4199 = int(_4197);
    return _4199;
}

static inline __attribute__((always_inline))
void _58(thread const int& _3873, thread const int& _3874, thread const int& _3875, thread const int& _3876, thread int& _3877, thread int& _3878, thread int& _3879, thread int& _3880, thread int& _3881, thread int& _3882)
{
    float _3885 = as_type<float>(_3874) + 0.0;
    bool _3887 = _3885 != 0.0;
    bool _3889 = isnan(_3885);
    bool _3891 = _3887 || _3889;
    bool _3893 = isnan(0.0);
    bool _3895 = _3891 || _3893;
    int _3897 = as_type<int>(_3885);
    int _3899 = _3874;
    int _3901 = _3876;
    int _3903 = _3895 ? (-1) : 0;
    if (!_3895)
    {
        float _3905 = as_type<float>(_3874) * 1.0;
        _3897 = as_type<int>(_3905);
    }
    int _3907 = _3897;
    bool _3909 = !_3895;
    int _3911 = _3907;
    if (!_3909)
    {
        float _3913 = as_type<float>(_3874) + 0.0;
        bool _3915 = _3913 >= 0.0;
        bool _3917 = isnan(_3913);
        bool _3919 = _3915 || _3917;
        bool _3921 = isnan(0.0);
        bool _3923 = _3919 || _3921;
        int _3925 = as_type<int>(_3913);
        _3903 = _3923 ? (-1) : 0;
        if (!_3923)
        {
            _3925 = 2147483647;
        }
        int _3927 = _3925;
        bool _3929 = !_3923;
        _3911 = _3927;
        if (!_3929)
        {
            float _3931 = as_type<float>(_3874) + 0.0;
            bool _3933 = _3931 > as_type<float>(0x7f800000u /* inf */);
            bool _3935 = isnan(_3931);
            bool _3937 = _3933 || _3935;
            bool _3939 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3941 = _3937 || _3939;
            int _3943 = as_type<int>(_3931);
            _3903 = _3941 ? (-1) : 0;
            if (_3941)
            {
                float _3945 = as_type<float>(_3874) + 1.0;
                _3943 = as_type<int>(_3945);
            }
            int _3947 = _3943;
            _3911 = _3947;
            if (!_3941)
            {
                float _3949 = 0.0 + as_type<float>(_3874);
                bool _3951 = _3949 != as_type<float>(0x7f800000u /* inf */);
                bool _3953 = isnan(_3949);
                bool _3955 = _3951 || _3953;
                bool _3957 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3959 = _3955 || _3957;
                int _3961 = as_type<int>(_3949);
                _3903 = _3959 ? (-1) : 0;
                if (!_3959)
                {
                    _3961 = _3874;
                }
                int _3963 = _3961;
                bool _3965 = !_3959;
                _3911 = _3963;
                if (!_3965)
                {
                    float _3967 = as_type<float>(_3874) * 18446744073709551616.0;
                    float _3969 = rsqrt(_3967);
                    float _3971 = _3967 * _3969;
                    float _3973 = _3969 * 0.5;
                    float _3975 = -_3971;
                    float _3977 = 0.0 + _3975;
                    float _3979 = fma(_3973, _3977, 0.5);
                    float _3981 = fma(_3971, _3979, _3971);
                    float _3983 = -_3981;
                    float _3985 = 0.0 + _3983;
                    float _3987 = fma(_3981, _3985, _3967);
                    float _3989 = fma(_3973, _3987, _3981);
                    float _3991 = _3989 * 2.3283064365386962890625e-10;
                    _3911 = as_type<int>(_3991);
                    _3899 = as_type<int>(_3967);
                    _3901 = as_type<int>(_3981);
                }
            }
        }
    }
    int _3993 = _3911;
    int _3995 = _3899;
    int _3997 = _3901;
    int _3999 = _3903;
    _3877 = _3993;
    _3878 = _3875;
    _3879 = 0;
    _3880 = _3995;
    _3881 = _3997;
    _3882 = _3999;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1053 = false;
    bool _391 = false;
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
    int3 _1581 = int3(_101, _107, 1);
    float3 _111 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1581.xy), uint(_1581.z), 0).xyz;
    float _113 = _111.x;
    float _115 = _111.y;
    float _117 = _111.z;
    int _119 = _70;
    int _121 = 1;
    int _123 = _60(_119, _121, (*spvDescriptorSet0.support_buffer));
    int _125 = as_type<int>(_95);
    int _127 = 1;
    int _129 = _60(_125, _127, (*spvDescriptorSet0.support_buffer));
    int3 _1599 = int3(_123, _129, 1);
    float3 _131 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1599.xy), uint(_1599.z), 0).xyz;
    float _133 = _131.x;
    float _135 = _131.y;
    float _137 = _131.z;
    int _139 = _70;
    int _141 = 0;
    int _143 = _60(_139, _141, (*spvDescriptorSet0.support_buffer));
    int _145 = as_type<int>(_85);
    int _147 = 0;
    int _149 = _60(_145, _147, (*spvDescriptorSet0.support_buffer));
    int3 _1617 = int3(_143, _149, 0);
    float3 _151 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1617.xy), uint(_1617.z), 0).xyz;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = _151.z;
    int _159 = _70;
    int _161 = 0;
    int _163 = _60(_159, _161, (*spvDescriptorSet0.support_buffer));
    int _165 = as_type<int>(_85);
    int _167 = 0;
    int _169 = _60(_165, _167, (*spvDescriptorSet0.support_buffer));
    int3 _1635 = int3(_163, _169, 2);
    float3 _171 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1635.xy), uint(_1635.z), 0).xyz;
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
    float _195 = _133 * 0.5;
    float _197 = _185 * 6.283185482025146484375;
    float _199 = cos(_197);
    float _201 = _191 * 0.15915493667125701904296875;
    float _203 = _193 * 0.15915493667125701904296875;
    float _205 = _195 * 0.15915493667125701904296875;
    float _207 = _187 * 6.283185482025146484375;
    float _209 = cos(_207);
    float _211 = _187 * 6.283185482025146484375;
    float _213 = sin(_211);
    float _215 = _185 * 6.283185482025146484375;
    float _217 = sin(_215);
    float _219 = _199 * _209;
    float _221 = _201 * 6.283185482025146484375;
    float _223 = sin(_221);
    float _225 = _199 * _213;
    float _227 = _203 * 6.283185482025146484375;
    float _229 = sin(_227);
    float _231 = _217 * _213;
    float _233 = _209 * _217;
    float _235 = _203 * 6.283185482025146484375;
    float _237 = cos(_235);
    float _239 = _201 * 6.283185482025146484375;
    float _241 = cos(_239);
    float _243 = _223 * _229;
    float _245 = _189 * 6.283185482025146484375;
    float _247 = sin(_245);
    float _249 = _237 * _223;
    float _251 = _205 * 6.283185482025146484375;
    float _253 = sin(_251);
    float _255 = _241 * _237;
    float _257 = _241 * _229;
    float _259 = _189 * 6.283185482025146484375;
    float _261 = cos(_259);
    float _263 = _247 * _233;
    float _265 = _247 * _231;
    float _267 = _205 * 6.283185482025146484375;
    float _269 = cos(_267);
    float _271 = _253 * _249;
    float _273 = _261 * _231;
    float _275 = fma(_261, _225, _263);
    float _277 = _247 * _225;
    float _279 = fma(_261, _219, _265);
    float _281 = -_273;
    float _283 = fma(_247, _219, _281);
    float _285 = -_277;
    float _287 = fma(_261, _233, _285);
    float _289 = _269 * _243;
    float _291 = fma(_269, _257, _271);
    float _293 = _253 * _257;
    float _295 = -_289;
    float _297 = fma(_253, _255, _295);
    float _299 = _275 * _291;
    float _301 = _253 * _243;
    float _303 = -_293;
    float _305 = fma(_269, _249, _303);
    float _307 = fma(_283, _297, _299);
    float _309 = fma(_269, _255, _301);
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
    float _363 = _175;
    float _365 = _173;
    float _387;
    float _389;
    if (!_361)
    {
        int _367 = as_type<int>(_333);
        int _369 = as_type<int>(_343);
        int _371 = 1408;
        int _373 = as_type<int>(_301);
        int _375;
        int _377;
        int _379;
        int _381;
        int _383;
        int _385;
        _58(_367, _369, _371, _373, _375, _377, _379, _381, _383, _385);
        _387 = as_type<float>(_375);
        _389 = as_type<float>(_377);
        _391 = true;
    }
    else
    {
        float _393 = rsqrt(_343);
        float _395 = _343 * _393;
        float _397 = _393 * 0.5;
        float _399 = -_395;
        float _401 = 0.0 + _399;
        float _403 = fma(_397, _401, 0.5);
        float _405 = fma(_395, _403, _395);
        float _407 = -_405;
        float _409 = 0.0 + _407;
        float _411 = fma(_405, _409, _343);
        float _413 = fma(_397, _411, _405);
        _387 = _413;
        _389 = _401;
    }
    _391 = false;
    float _415 = _387;
    float _417 = _389;
    int _419 = _76 + 8;
    uint _421 = uint(int(uint(_419) >> uint(2)));
    uint _423 = uint(int(uint(int(_421)) >> uint(2)));
    int _425 = int(_421) & 3;
    float _427 = (*spvDescriptorSet0.cp_c5)._m0[int(_423)][_425];
    int _429 = _70;
    int _431 = 1;
    int _433 = _60(_429, _431, (*spvDescriptorSet0.support_buffer));
    int _435 = as_type<int>(_427);
    int _437 = 1;
    int _439 = _60(_435, _437, (*spvDescriptorSet0.support_buffer));
    int3 _1967 = int3(_433, _439, 0);
    float3 _441 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1967.xy), uint(_1967.z), 0).xyz;
    float _443 = _441.x;
    float _445 = _441.y;
    float _447 = _441.z;
    int _449 = _70;
    int _451 = 1;
    int _453 = _60(_449, _451, (*spvDescriptorSet0.support_buffer));
    int _455 = as_type<int>(_427);
    int _457 = 1;
    int _459 = _60(_455, _457, (*spvDescriptorSet0.support_buffer));
    int3 _1985 = int3(_453, _459, 2);
    float3 _461 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1985.xy), uint(_1985.z), 0).xyz;
    float _463 = _461.x;
    float _465 = _461.y;
    float _467 = _461.z;
    float _469 = _359 * _415;
    float _471 = _337 * 2.0;
    float _473 = -_471;
    float _475 = fma(_469, _473, _469);
    float _477 = fma(_337, 3.1415927410125732421875, _475);
    float _479 = _477 * 0.15915493667125701904296875;
    float _481 = _479 * 6.283185482025146484375;
    float _483 = sin(_481);
    float _485 = abs(_483);
    bool _487 = _485 >= 0.001000000047497451305389404296875;
    bool _489 = isnan(_485);
    bool _491 = _487 || _489;
    bool _493 = isnan(0.001000000047497451305389404296875);
    bool _495 = _491 || _493;
    float _497 = _293;
    float _499 = _417;
    float _501 = _469;
    if (!_495)
    {
        int _503 = _76 + 28;
        uint _505 = uint(int(uint(_503) >> uint(2)));
        uint _507 = uint(int(uint(int(_505)) >> uint(2)));
        int _509 = int(_505) & 3;
        float _511 = (*spvDescriptorSet0.cp_c5)._m0[int(_507)][_509];
        _497 = _511;
    }
    float _513 = _497;
    float _515 = _513;
    if (!_495)
    {
        float _517 = -_513;
        float _519 = _517 + 1.0;
        _499 = _519;
    }
    float _521 = _499;
    float _523 = _521;
    if (!_495)
    {
        _501 = _513;
    }
    float _525 = _501;
    bool _527 = !_495;
    float _529 = _525;
    if (!_527)
    {
        int _531 = _76 + 28;
        uint _533 = uint(int(uint(_531) >> uint(2)));
        uint _535 = uint(int(uint(int(_533)) >> uint(2)));
        int _537 = int(_533) & 3;
        float _539 = (*spvDescriptorSet0.cp_c5)._m0[int(_535)][_537];
        float _541 = 1.0 / _483;
        float _543 = _477 * _539;
        float _545 = _543 * 0.15915493667125701904296875;
        float _547 = -_543;
        float _549 = _477 + _547;
        float _551 = _549 * 0.15915493667125701904296875;
        float _553 = _545 * 6.283185482025146484375;
        float _555 = sin(_553);
        float _557 = _551 * 6.283185482025146484375;
        float _559 = sin(_557);
        float _561 = _555 * _541;
        float _563 = _559 * _541;
        _529 = _561;
        _523 = _563;
        _515 = _539;
    }
    float _565 = _529;
    float _567 = _523;
    float _569 = _515;
    bool _571 = !_327;
    float _573 = -_565;
    float _575 = _571 ? _573 : _565;
    int _577 = _76 + 20;
    uint _579 = uint(int(uint(_577) >> uint(2)));
    uint _581 = uint(int(uint(int(_579)) >> uint(2)));
    int _583 = int(_579) & 3;
    float _585 = (*spvDescriptorSet0.cp_c5)._m0[int(_581)][_583];
    bool _587 = _70 != 0;
    float _589 = _309 * _575;
    float _591 = _305 * _575;
    float _593 = _297 * _575;
    float _595 = _291 * _575;
    float _597 = fma(_279, _567, _589);
    float _599 = fma(_287, _567, _591);
    float _601 = fma(_283, _567, _593);
    float _603 = fma(_275, _567, _595);
    float _605 = _597 * 2.0;
    float _607 = _601 * 2.0;
    float _609 = _603 * 2.0;
    float _611 = _601 * _605;
    float _613 = _599 * _605;
    float _615 = _603 * _605;
    float _617 = _601 * _601;
    float _619 = -_611;
    float _621 = fma(_599, _609, _619);
    float _623 = -_613;
    float _625 = fma(_603, _607, _623);
    float _627 = fma(_599, _609, _611);
    float _629 = fma(_603, _607, _613);
    float _631 = fma(_599, _607, _615);
    float _633 = -_615;
    float _635 = fma(_599, _607, _633);
    float _637 = _603 * _603;
    float _639 = _443 * _569;
    float _641 = _599 * _599;
    float _643 = fma(_637, -2.0, 1.0);
    float _645 = fma(_153, _585, _639);
    float _647 = _445 * _569;
    float _649 = _447 * _569;
    float _651 = fma(_641, -2.0, _643);
    float _653 = fma(_617, -2.0, 1.0);
    float _655 = fma(_155, _585, _647);
    float _657 = fma(_157, _585, _649);
    float _659 = _629 * _645;
    float _661 = _651 * _645;
    float _663 = _627 * _655;
    float _665 = _463 * _569;
    float _667 = fma(_641, -2.0, _653);
    float _669 = fma(_637, -2.0, _653);
    float _671 = _465 * _569;
    float _673 = _467 * _569;
    float _675 = _625 * _655;
    float _677 = _631 * _657;
    float _679 = _621 * _657;
    float _681 = fma(_173, _585, _665);
    float _683 = _635 * _645;
    float _685 = _667 * _655;
    float _687 = _669 * _657;
    float _689 = fma(_175, _585, _671);
    int _691 = _70 * 48;
    float _693 = fma(_177, _585, _673);
    int _695 = _70 * 112;
    float _697 = (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _699 = _657;
    float _701 = _673;
    float _703 = _685;
    float _705 = _663;
    float _707 = _659;
    float _709 = _683;
    float _711 = _679;
    float _713 = _677;
    float _715 = _687;
    if (!_587)
    {
        _363 = _681;
    }
    float _717 = _363;
    uint _719 = uint(int(uint(_691) >> uint(2)));
    _39[int(_719)] = as_type<uint>(_661);
    int _721 = _691 + 4;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    _39[int(_723)] = as_type<uint>(_675);
    int _725 = _691 + 8;
    uint _727 = uint(int(uint(_725) >> uint(2)));
    _39[int(_727)] = as_type<uint>(_677);
    int _729 = _691 + 12;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    _39[int(_731)] = as_type<uint>(_681);
    bool _733 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _735 = _717;
    if (!_587)
    {
        _365 = _689;
    }
    float _737 = _365;
    int _739 = _691 + 16;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    _39[int(_741)] = as_type<uint>(_659);
    int _743 = _691 + 20;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    _39[int(_745)] = as_type<uint>(_685);
    int _747 = _691 + 24;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    _39[int(_749)] = as_type<uint>(_679);
    int _751 = _691 + 28;
    uint _753 = uint(int(uint(_751) >> uint(2)));
    _39[int(_753)] = as_type<uint>(_689);
    float _755 = _737;
    if (!_587)
    {
        _697 = _693;
    }
    float _757 = _697;
    float _759 = _757;
    if (!_587)
    {
        _699 = _661;
    }
    float _761 = _699;
    int _763 = _691 + 32;
    uint _765 = uint(int(uint(_763) >> uint(2)));
    _39[int(_765)] = as_type<uint>(_683);
    int _767 = _691 + 36;
    uint _769 = uint(int(uint(_767) >> uint(2)));
    _39[int(_769)] = as_type<uint>(_663);
    int _771 = _691 + 40;
    uint _773 = uint(int(uint(_771) >> uint(2)));
    _39[int(_773)] = as_type<uint>(_687);
    int _775 = _691 + 44;
    uint _777 = uint(int(uint(_775) >> uint(2)));
    _39[int(_777)] = as_type<uint>(_693);
    float _779 = _761;
    if (!_587)
    {
        _701 = _675;
    }
    float _781 = _701;
    float _783 = _781;
    if (!_733)
    {
        int _785 = _70 * 48;
        int _787 = _785 + 16;
        uint _789 = uint(int(uint(_785) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_789)] = as_type<uint>(_661);
        int _791 = _785 + 4;
        uint _793 = uint(int(uint(_791) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_793)] = as_type<uint>(_675);
        int _795 = _785 + 8;
        uint _797 = uint(int(uint(_795) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_797)] = as_type<uint>(_677);
        int _799 = _785 + 12;
        uint _801 = uint(int(uint(_799) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_801)] = as_type<uint>(_681);
        int _803 = _785 + 32;
        uint _805 = uint(int(uint(_787) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_805)] = as_type<uint>(_659);
        int _807 = _787 + 4;
        uint _809 = uint(int(uint(_807) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_809)] = as_type<uint>(_685);
        int _811 = _787 + 8;
        uint _813 = uint(int(uint(_811) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_813)] = as_type<uint>(_679);
        int _815 = _787 + 12;
        uint _817 = uint(int(uint(_815) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_817)] = as_type<uint>(_689);
        uint _819 = uint(int(uint(_803) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_819)] = as_type<uint>(_683);
        int _821 = _803 + 4;
        uint _823 = uint(int(uint(_821) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_823)] = as_type<uint>(_663);
        int _825 = _803 + 8;
        uint _827 = uint(int(uint(_825) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_827)] = as_type<uint>(_687);
        int _829 = _803 + 12;
        uint _831 = uint(int(uint(_829) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_831)] = as_type<uint>(_693);
    }
    bool _833 = !_587;
    if (!_833)
    {
        bool _835 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _837 = !_835;
        if (!_837)
        {
            uint _839 = uint(int(uint(_695) >> uint(2)));
            uint _841 = uint(int(uint(int(_839)) >> uint(2)));
            int _843 = int(_839) & 3;
            float _845 = (*spvDescriptorSet0.cp_c6)._m0[int(_841)][_843];
            int _847 = as_type<int>(_845) * 48;
            int _849 = 0;
            bool _851;
            float _947;
            float _949;
            float _951;
            float _971;
            float _973;
            float _977;
            float _993;
            float _997;
            float _999;
            float _1001;
            float _1003;
            float _1005;
            do
            {
                int _853 = _849;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _855 = uint(int(uint(_847) >> uint(2)));
                float _857 = as_type<float>(_39[int(_855)]);
                int _859 = _847 + 4;
                uint _861 = uint(int(uint(_859) >> uint(2)));
                float _863 = as_type<float>(_39[int(_861)]);
                int _865 = _847 + 8;
                uint _867 = uint(int(uint(_865) >> uint(2)));
                float _869 = as_type<float>(_39[int(_867)]);
                int _871 = _847 + 12;
                uint _873 = uint(int(uint(_871) >> uint(2)));
                float _875 = as_type<float>(_39[int(_873)]);
                int _877 = _853 + 1;
                int _879 = _847 + 16;
                uint _881 = uint(int(uint(_879) >> uint(2)));
                float _883 = as_type<float>(_39[int(_881)]);
                int _885 = _847 + 20;
                uint _887 = uint(int(uint(_885) >> uint(2)));
                float _889 = as_type<float>(_39[int(_887)]);
                int _891 = _847 + 24;
                uint _893 = uint(int(uint(_891) >> uint(2)));
                float _895 = as_type<float>(_39[int(_893)]);
                int _897 = _847 + 28;
                uint _899 = uint(int(uint(_897) >> uint(2)));
                float _901 = as_type<float>(_39[int(_899)]);
                bool _903 = uint(_877) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _905 = _847 + 32;
                uint _907 = uint(int(uint(_905) >> uint(2)));
                float _909 = as_type<float>(_39[int(_907)]);
                int _911 = _847 + 36;
                uint _913 = uint(int(uint(_911) >> uint(2)));
                float _915 = as_type<float>(_39[int(_913)]);
                int _917 = _847 + 40;
                uint _919 = uint(int(uint(_917) >> uint(2)));
                float _921 = as_type<float>(_39[int(_919)]);
                int _923 = _847 + 44;
                uint _925 = uint(int(uint(_923) >> uint(2)));
                float _927 = as_type<float>(_39[int(_925)]);
                float _929 = _689 * _863;
                float _931 = _659 * _863;
                float _933 = _685 * _863;
                float _935 = _679 * _863;
                float _937 = fma(_681, _857, _929);
                float _939 = fma(_661, _857, _931);
                float _941 = fma(_675, _857, _933);
                float _943 = fma(_677, _857, _935);
                float _945 = fma(_693, _869, _937);
                _947 = fma(_683, _869, _939);
                _949 = fma(_663, _869, _941);
                _951 = fma(_687, _869, _943);
                float _953 = _689 * _889;
                float _955 = _659 * _889;
                float _957 = _685 * _889;
                float _959 = _679 * _889;
                float _961 = fma(_681, _883, _953);
                float _963 = fma(_661, _883, _955);
                float _965 = fma(_675, _883, _957);
                float _967 = fma(_677, _883, _959);
                float _969 = fma(_693, _895, _961);
                _971 = fma(_683, _895, _963);
                _973 = fma(_663, _895, _965);
                float _975 = _659 * _915;
                _977 = _901 + _969;
                float _979 = _689 * _915;
                float _981 = _685 * _915;
                float _983 = _679 * _915;
                float _985 = fma(_661, _909, _975);
                float _987 = fma(_681, _909, _979);
                float _989 = fma(_675, _909, _981);
                float _991 = fma(_677, _909, _983);
                _993 = fma(_687, _895, _967);
                float _995 = fma(_693, _921, _987);
                _997 = _875 + _945;
                _999 = fma(_683, _921, _985);
                _1001 = fma(_663, _921, _989);
                _1003 = fma(_687, _921, _991);
                _1005 = _927 + _995;
                uint _1007 = uint(int(uint(_691) >> uint(2)));
                _39[int(_1007)] = as_type<uint>(_947);
                int _1009 = _691 + 4;
                uint _1011 = uint(int(uint(_1009) >> uint(2)));
                _39[int(_1011)] = as_type<uint>(_949);
                int _1013 = _691 + 8;
                uint _1015 = uint(int(uint(_1013) >> uint(2)));
                _39[int(_1015)] = as_type<uint>(_951);
                int _1017 = _691 + 12;
                uint _1019 = uint(int(uint(_1017) >> uint(2)));
                _39[int(_1019)] = as_type<uint>(_997);
                int _1021 = _691 + 16;
                uint _1023 = uint(int(uint(_1021) >> uint(2)));
                _39[int(_1023)] = as_type<uint>(_971);
                int _1025 = _691 + 20;
                uint _1027 = uint(int(uint(_1025) >> uint(2)));
                _39[int(_1027)] = as_type<uint>(_973);
                int _1029 = _691 + 24;
                uint _1031 = uint(int(uint(_1029) >> uint(2)));
                _39[int(_1031)] = as_type<uint>(_993);
                int _1033 = _691 + 28;
                uint _1035 = uint(int(uint(_1033) >> uint(2)));
                _39[int(_1035)] = as_type<uint>(_977);
                int _1037 = _691 + 32;
                uint _1039 = uint(int(uint(_1037) >> uint(2)));
                _39[int(_1039)] = as_type<uint>(_999);
                int _1041 = _691 + 36;
                uint _1043 = uint(int(uint(_1041) >> uint(2)));
                _39[int(_1043)] = as_type<uint>(_1001);
                int _1045 = _691 + 40;
                uint _1047 = uint(int(uint(_1045) >> uint(2)));
                _39[int(_1047)] = as_type<uint>(_1003);
                int _1049 = _691 + 44;
                uint _1051 = uint(int(uint(_1049) >> uint(2)));
                _39[int(_1051)] = as_type<uint>(_1005);
                _851 = !_903;
                _849 = _877;
            } while (_851);
            _783 = _949;
            _703 = _973;
            _705 = _1001;
            _779 = _947;
            _707 = _971;
            _709 = _999;
            _711 = _993;
            _713 = _951;
            _755 = _977;
            _715 = _1003;
            _735 = _997;
            _759 = _1005;
            _1053 = true;
        }
        else
        {
            _783 = 0.0;
            _703 = 0.0;
            _705 = 0.0;
            _779 = 0.0;
            _707 = 0.0;
            _709 = 0.0;
            _711 = 0.0;
            _713 = 0.0;
            _755 = 0.0;
            _715 = 0.0;
            _735 = 0.0;
            _759 = 0.0;
        }
    }
    _1053 = false;
    float _1055 = _783;
    float _1057 = _703;
    float _1059 = _705;
    float _1061 = _779;
    float _1063 = _707;
    float _1065 = _709;
    float _1067 = _711;
    float _1069 = _713;
    float _1071 = _755;
    float _1073 = _715;
    float _1075 = _735;
    float _1077 = _759;
    int _1079 = _695 + 80;
    uint _1081 = uint(int(uint(_1079) >> uint(2)));
    uint _1083 = uint(int(uint(int(_1081)) >> uint(2)));
    int _1085 = int(_1081) & 3;
    float _1087 = (*spvDescriptorSet0.cp_c6)._m0[int(_1083)][_1085];
    int _1089 = int(_1081) + 1;
    uint _1091 = uint(int(uint(_1089) >> uint(2)));
    int _1093 = _1089 & 3;
    float _1095 = (*spvDescriptorSet0.cp_c6)._m0[int(_1091)][_1093];
    int _1097 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1099 = _1097 + _70;
    int _1101 = _695 + 64;
    uint _1103 = uint(int(uint(_1101) >> uint(2)));
    uint _1105 = uint(int(uint(int(_1103)) >> uint(2)));
    int _1107 = int(_1103) & 3;
    float _1109 = (*spvDescriptorSet0.cp_c6)._m0[int(_1105)][_1107];
    int _1111 = int(_1103) + 1;
    uint _1113 = uint(int(uint(_1111) >> uint(2)));
    int _1115 = _1111 & 3;
    float _1117 = (*spvDescriptorSet0.cp_c6)._m0[int(_1113)][_1115];
    int _1119 = _1099 * 48;
    int _1121 = _695 + 88;
    uint _1123 = uint(int(uint(_1121) >> uint(2)));
    uint _1125 = uint(int(uint(int(_1123)) >> uint(2)));
    int _1127 = int(_1123) & 3;
    float _1129 = (*spvDescriptorSet0.cp_c6)._m0[int(_1125)][_1127];
    int _1131 = int(_1123) + 1;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    int _1135 = _1131 & 3;
    float _1137 = (*spvDescriptorSet0.cp_c6)._m0[int(_1133)][_1135];
    int _1139 = _695 + 72;
    uint _1141 = uint(int(uint(_1139) >> uint(2)));
    uint _1143 = uint(int(uint(int(_1141)) >> uint(2)));
    int _1145 = int(_1141) & 3;
    float _1147 = (*spvDescriptorSet0.cp_c6)._m0[int(_1143)][_1145];
    int _1149 = int(_1141) + 1;
    uint _1151 = uint(int(uint(_1149) >> uint(2)));
    int _1153 = _1149 & 3;
    float _1155 = (*spvDescriptorSet0.cp_c6)._m0[int(_1151)][_1153];
    int _1157 = _695 + 104;
    uint _1159 = uint(int(uint(_1157) >> uint(2)));
    uint _1161 = uint(int(uint(int(_1159)) >> uint(2)));
    int _1163 = int(_1159) & 3;
    float _1165 = (*spvDescriptorSet0.cp_c6)._m0[int(_1161)][_1163];
    int _1167 = int(_1159) + 1;
    uint _1169 = uint(int(uint(_1167) >> uint(2)));
    int _1171 = _1167 & 3;
    float _1173 = (*spvDescriptorSet0.cp_c6)._m0[int(_1169)][_1171];
    int _1175 = _695 + 96;
    uint _1177 = uint(int(uint(_1175) >> uint(2)));
    uint _1179 = uint(int(uint(int(_1177)) >> uint(2)));
    int _1181 = int(_1177) & 3;
    float _1183 = (*spvDescriptorSet0.cp_c6)._m0[int(_1179)][_1181];
    int _1185 = int(_1177) + 1;
    uint _1187 = uint(int(uint(_1185) >> uint(2)));
    int _1189 = _1185 & 3;
    float _1191 = (*spvDescriptorSet0.cp_c6)._m0[int(_1187)][_1189];
    float _1193 = _1055 * _1087;
    float _1195 = _1057 * _1087;
    float _1197 = _1059 * _1095;
    int _1199 = _695 + 16;
    uint _1201 = uint(int(uint(_1199) >> uint(2)));
    uint _1203 = uint(int(uint(int(_1201)) >> uint(2)));
    int _1205 = int(_1201) & 3;
    float _1207 = (*spvDescriptorSet0.cp_c6)._m0[int(_1203)][_1205];
    int _1209 = int(_1201) + 1;
    uint _1211 = uint(int(uint(_1209) >> uint(2)));
    int _1213 = _1209 & 3;
    float _1215 = (*spvDescriptorSet0.cp_c6)._m0[int(_1211)][_1213];
    float _1217 = _1059 * _1087;
    float _1219 = fma(_1061, _1109, _1193);
    float _1221 = fma(_1063, _1109, _1195);
    float _1223 = _1055 * _1095;
    int _1225 = _695 + 32;
    uint _1227 = uint(int(uint(_1225) >> uint(2)));
    uint _1229 = uint(int(uint(int(_1227)) >> uint(2)));
    int _1231 = int(_1227) & 3;
    float _1233 = (*spvDescriptorSet0.cp_c6)._m0[int(_1229)][_1231];
    int _1235 = int(_1227) + 1;
    uint _1237 = uint(int(uint(_1235) >> uint(2)));
    int _1239 = _1235 & 3;
    float _1241 = (*spvDescriptorSet0.cp_c6)._m0[int(_1237)][_1239];
    float _1243 = _1057 * _1095;
    float _1245 = fma(_1065, _1117, _1197);
    float _1247 = fma(_1065, _1109, _1217);
    float _1249 = fma(_1061, _1117, _1223);
    float _1251 = _1055 * _1129;
    float _1253 = _1055 * _1137;
    float _1255 = _1057 * _1129;
    int _1257 = _695 + 48;
    uint _1259 = uint(int(uint(_1257) >> uint(2)));
    uint _1261 = uint(int(uint(int(_1259)) >> uint(2)));
    int _1263 = int(_1259) & 3;
    float _1265 = (*spvDescriptorSet0.cp_c6)._m0[int(_1261)][_1263];
    int _1267 = int(_1259) + 1;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    int _1271 = _1267 & 3;
    float _1273 = (*spvDescriptorSet0.cp_c6)._m0[int(_1269)][_1271];
    float _1275 = _1057 * _1137;
    float _1277 = _1059 * _1129;
    float _1279 = _1059 * _1137;
    float _1281 = fma(_1063, _1117, _1243);
    float _1283 = fma(_1061, _1147, _1251);
    float _1285 = fma(_1061, _1155, _1253);
    float _1287 = fma(_1063, _1147, _1255);
    int _1289 = _695 + 24;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    uint _1293 = uint(int(uint(int(_1291)) >> uint(2)));
    int _1295 = int(_1291) & 3;
    float _1297 = (*spvDescriptorSet0.cp_c6)._m0[int(_1293)][_1295];
    int _1299 = int(_1291) + 1;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    int _1303 = _1299 & 3;
    float _1305 = (*spvDescriptorSet0.cp_c6)._m0[int(_1301)][_1303];
    float _1307 = fma(_1063, _1155, _1275);
    float _1309 = fma(_1065, _1147, _1277);
    float _1311 = fma(_1065, _1155, _1279);
    float _1313 = fma(_1067, _1173, _1307);
    float _1315 = fma(_1069, _1173, _1285);
    float _1317 = fma(_1069, _1165, _1283);
    int _1319 = _695 + 40;
    uint _1321 = uint(int(uint(_1319) >> uint(2)));
    uint _1323 = uint(int(uint(int(_1321)) >> uint(2)));
    int _1325 = int(_1321) & 3;
    float _1327 = (*spvDescriptorSet0.cp_c6)._m0[int(_1323)][_1325];
    int _1329 = int(_1321) + 1;
    uint _1331 = uint(int(uint(_1329) >> uint(2)));
    int _1333 = _1329 & 3;
    float _1335 = (*spvDescriptorSet0.cp_c6)._m0[int(_1331)][_1333];
    float _1337 = _1313 + _1071;
    float _1339 = fma(_1073, _1173, _1311);
    float _1341 = fma(_1073, _1165, _1309);
    float _1343 = _1315 + _1075;
    float _1345 = fma(_1069, _1183, _1219);
    float _1347 = fma(_1067, _1183, _1221);
    float _1349 = fma(_1069, _1191, _1249);
    int _1351 = _695 + 56;
    uint _1353 = uint(int(uint(_1351) >> uint(2)));
    uint _1355 = uint(int(uint(int(_1353)) >> uint(2)));
    int _1357 = int(_1353) & 3;
    float _1359 = (*spvDescriptorSet0.cp_c6)._m0[int(_1355)][_1357];
    int _1361 = int(_1353) + 1;
    uint _1363 = uint(int(uint(_1361) >> uint(2)));
    int _1365 = _1361 & 3;
    float _1367 = (*spvDescriptorSet0.cp_c6)._m0[int(_1363)][_1365];
    float _1369 = fma(_1073, _1183, _1247);
    float _1371 = fma(_1073, _1191, _1245);
    float _1373 = fma(_1067, _1165, _1287);
    float _1375 = fma(_1067, _1191, _1281);
    float _1377 = _1339 + _1077;
    int _1379 = _1119 + 32;
    float _1381 = _1337 * _1215;
    float _1383 = _1373 * _1215;
    float _1385 = _1347 * _1215;
    float _1387 = _1375 * _1215;
    float _1389 = fma(_1343, _1207, _1381);
    float _1391 = fma(_1317, _1207, _1383);
    float _1393 = fma(_1345, _1207, _1385);
    float _1395 = fma(_1349, _1207, _1387);
    float _1397 = _1337 * _1241;
    float _1399 = _1347 * _1241;
    float _1401 = _1375 * _1241;
    float _1403 = _1373 * _1241;
    float _1405 = fma(_1343, _1233, _1397);
    float _1407 = fma(_1345, _1233, _1399);
    float _1409 = fma(_1349, _1233, _1401);
    float _1411 = fma(_1317, _1233, _1403);
    float _1413 = _1337 * _1273;
    float _1415 = _1347 * _1273;
    float _1417 = _1375 * _1273;
    float _1419 = _1373 * _1273;
    float _1421 = fma(_1343, _1265, _1413);
    float _1423 = fma(_1345, _1265, _1415);
    float _1425 = fma(_1349, _1265, _1417);
    float _1427 = fma(_1317, _1265, _1419);
    float _1429 = fma(_1377, _1297, _1389);
    float _1431 = fma(_1341, _1297, _1391);
    float _1433 = fma(_1369, _1297, _1393);
    float _1435 = fma(_1371, _1297, _1395);
    float _1437 = _1429 + _1305;
    int _1439 = _1119 + 16;
    int _1441 = _1119 + 48;
    float _1443 = fma(_1377, _1327, _1405);
    float _1445 = fma(_1369, _1327, _1407);
    float _1447 = fma(_1371, _1327, _1409);
    float _1449 = fma(_1341, _1327, _1411);
    float _1451 = _1443 + _1335;
    uint _1453 = uint(int(uint(_1439) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1453)] = as_type<uint>(_1433);
    int _1455 = _1439 + 4;
    uint _1457 = uint(int(uint(_1455) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1457)] = as_type<uint>(_1435);
    int _1459 = _1439 + 8;
    uint _1461 = uint(int(uint(_1459) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1461)] = as_type<uint>(_1431);
    int _1463 = _1439 + 12;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1465)] = as_type<uint>(_1437);
    float _1467 = fma(_1377, _1359, _1421);
    float _1469 = fma(_1369, _1359, _1423);
    float _1471 = fma(_1371, _1359, _1425);
    float _1473 = fma(_1341, _1359, _1427);
    float _1475 = _1467 + _1367;
    uint _1477 = uint(int(uint(_1379) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1477)] = as_type<uint>(_1445);
    int _1479 = _1379 + 4;
    uint _1481 = uint(int(uint(_1479) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1481)] = as_type<uint>(_1447);
    int _1483 = _1379 + 8;
    uint _1485 = uint(int(uint(_1483) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1485)] = as_type<uint>(_1449);
    int _1487 = _1379 + 12;
    uint _1489 = uint(int(uint(_1487) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1489)] = as_type<uint>(_1451);
    uint _1491 = uint(int(uint(_1441) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1491)] = as_type<uint>(_1469);
    int _1493 = _1441 + 4;
    uint _1495 = uint(int(uint(_1493) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1495)] = as_type<uint>(_1471);
    int _1497 = _1441 + 8;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1499)] = as_type<uint>(_1473);
    int _1501 = _1441 + 12;
    uint _1503 = uint(int(uint(_1501) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1503)] = as_type<uint>(_1475);
}

