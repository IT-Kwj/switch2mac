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
int _60(thread const int& _3903, thread const int& _3904, constant _10& support_buffer)
{
    int _3907 = 1 + _3904;
    float _3909 = support_buffer._m5[_3907].x;
    bool _3911 = _3909 == 1.0;
    if (_3911)
    {
        return _3903;
    }
    float _3913 = float(_3903);
    float _3915 = _3913 * _3909;
    int _3917 = int(_3915);
    return _3917;
}

static inline __attribute__((always_inline))
void _58(thread const int& _3591, thread const int& _3592, thread const int& _3593, thread const int& _3594, thread int& _3595, thread int& _3596, thread int& _3597, thread int& _3598, thread int& _3599, thread int& _3600)
{
    float _3603 = as_type<float>(_3592) + 0.0;
    bool _3605 = _3603 != 0.0;
    bool _3607 = isnan(_3603);
    bool _3609 = _3605 || _3607;
    bool _3611 = isnan(0.0);
    bool _3613 = _3609 || _3611;
    int _3615 = as_type<int>(_3603);
    int _3617 = _3592;
    int _3619 = _3594;
    int _3621 = _3613 ? (-1) : 0;
    if (!_3613)
    {
        float _3623 = as_type<float>(_3592) * 1.0;
        _3615 = as_type<int>(_3623);
    }
    int _3625 = _3615;
    bool _3627 = !_3613;
    int _3629 = _3625;
    if (!_3627)
    {
        float _3631 = as_type<float>(_3592) + 0.0;
        bool _3633 = _3631 >= 0.0;
        bool _3635 = isnan(_3631);
        bool _3637 = _3633 || _3635;
        bool _3639 = isnan(0.0);
        bool _3641 = _3637 || _3639;
        int _3643 = as_type<int>(_3631);
        _3621 = _3641 ? (-1) : 0;
        if (!_3641)
        {
            _3643 = 2147483647;
        }
        int _3645 = _3643;
        bool _3647 = !_3641;
        _3629 = _3645;
        if (!_3647)
        {
            float _3649 = as_type<float>(_3592) + 0.0;
            bool _3651 = _3649 > as_type<float>(0x7f800000u /* inf */);
            bool _3653 = isnan(_3649);
            bool _3655 = _3651 || _3653;
            bool _3657 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3659 = _3655 || _3657;
            int _3661 = as_type<int>(_3649);
            _3621 = _3659 ? (-1) : 0;
            if (_3659)
            {
                float _3663 = as_type<float>(_3592) + 1.0;
                _3661 = as_type<int>(_3663);
            }
            int _3665 = _3661;
            _3629 = _3665;
            if (!_3659)
            {
                float _3667 = 0.0 + as_type<float>(_3592);
                bool _3669 = _3667 != as_type<float>(0x7f800000u /* inf */);
                bool _3671 = isnan(_3667);
                bool _3673 = _3669 || _3671;
                bool _3675 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3677 = _3673 || _3675;
                int _3679 = as_type<int>(_3667);
                _3621 = _3677 ? (-1) : 0;
                if (!_3677)
                {
                    _3679 = _3592;
                }
                int _3681 = _3679;
                bool _3683 = !_3677;
                _3629 = _3681;
                if (!_3683)
                {
                    float _3685 = as_type<float>(_3592) * 18446744073709551616.0;
                    float _3687 = rsqrt(_3685);
                    float _3689 = _3685 * _3687;
                    float _3691 = _3687 * 0.5;
                    float _3693 = -_3689;
                    float _3695 = 0.0 + _3693;
                    float _3697 = fma(_3691, _3695, 0.5);
                    float _3699 = fma(_3689, _3697, _3689);
                    float _3701 = -_3699;
                    float _3703 = 0.0 + _3701;
                    float _3705 = fma(_3699, _3703, _3685);
                    float _3707 = fma(_3691, _3705, _3699);
                    float _3709 = _3707 * 2.3283064365386962890625e-10;
                    _3629 = as_type<int>(_3709);
                    _3617 = as_type<int>(_3685);
                    _3619 = as_type<int>(_3699);
                }
            }
        }
    }
    int _3711 = _3629;
    int _3713 = _3617;
    int _3715 = _3619;
    int _3717 = _3621;
    _3595 = _3711;
    _3596 = _3593;
    _3597 = 0;
    _3598 = _3713;
    _3599 = _3715;
    _3600 = _3717;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _930 = false;
    bool _268 = false;
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
    int3 _1458 = int3(_101, _107, 1);
    float4 _110 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1458.xy), uint(_1458.z), 0).xyzw;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float _118 = _110.w;
    int _120 = _70;
    int _122 = 1;
    int _124 = _60(_120, _122, (*spvDescriptorSet0.support_buffer));
    int _126 = as_type<int>(_95);
    int _128 = 1;
    int _130 = _60(_126, _128, (*spvDescriptorSet0.support_buffer));
    int3 _1478 = int3(_124, _130, 1);
    float4 _132 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1478.xy), uint(_1478.z), 0).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    int _142 = _70;
    int _144 = 0;
    int _146 = _60(_142, _144, (*spvDescriptorSet0.support_buffer));
    int _148 = as_type<int>(_85);
    int _150 = 0;
    int _152 = _60(_148, _150, (*spvDescriptorSet0.support_buffer));
    int3 _1498 = int3(_146, _152, 0);
    float3 _156 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1498.xy), uint(_1498.z), 0).xyz;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    int _164 = _70;
    int _166 = 0;
    int _168 = _60(_164, _166, (*spvDescriptorSet0.support_buffer));
    int _170 = as_type<int>(_85);
    int _172 = 0;
    int _174 = _60(_170, _172, (*spvDescriptorSet0.support_buffer));
    int3 _1516 = int3(_168, _174, 2);
    float3 _176 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1516.xy), uint(_1516.z), 0).xyz;
    float _178 = _176.x;
    float _180 = _176.y;
    float _182 = _176.z;
    float _184 = _114 * _136;
    float _186 = fma(_112, _134, _184);
    float _188 = fma(_116, _138, _186);
    float _190 = fma(_118, _140, _188);
    float _192 = precise::max(_190, -1.0);
    float _194 = precise::min(_192, 1.0);
    bool _196 = _194 >= 0.0;
    bool _198 = isnan(_194);
    bool _200 = _196 || _198;
    bool _202 = isnan(0.0);
    bool _204 = _200 || _202;
    bool _206 = !_204;
    float _208 = -_194;
    float _210 = _206 ? _208 : _194;
    float _212 = abs(_210);
    float _214 = -_212;
    float _216 = _214 + 1.0;
    float _218 = abs(_210);
    float _220 = fma(_218, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _222 = as_type<int>(_216) + (-218103808);
    float _224 = abs(_210);
    float _226 = fma(_224, _220, -0.212114393711090087890625);
    bool _228 = uint(_222) >= 1920991232u;
    float _230 = abs(_210);
    float _232 = fma(_230, _226, 1.570728778839111328125);
    bool _234 = _210 < 0.0;
    float _236 = float(_234);
    bool _238 = !_228;
    float _240 = _180;
    float _242 = _178;
    float _264;
    float _266;
    if (!_238)
    {
        int _244 = as_type<int>(_210);
        int _246 = as_type<int>(_216);
        int _248 = 640;
        int _250 = 0;
        int _252;
        int _254;
        int _256;
        int _258;
        int _260;
        int _262;
        _58(_244, _246, _248, _250, _252, _254, _256, _258, _260, _262);
        _264 = as_type<float>(_252);
        _266 = as_type<float>(_254);
        _268 = true;
    }
    else
    {
        float _270 = rsqrt(_216);
        float _272 = _216 * _270;
        float _274 = _270 * 0.5;
        float _276 = -_272;
        float _278 = 0.0 + _276;
        float _280 = fma(_274, _278, 0.5);
        float _282 = fma(_272, _280, _272);
        float _284 = -_282;
        float _286 = 0.0 + _284;
        float _288 = fma(_282, _286, _216);
        float _290 = fma(_274, _288, _282);
        _264 = _290;
        _266 = _278;
    }
    _268 = false;
    float _292 = _264;
    float _294 = _266;
    int _296 = _76 + 8;
    uint _298 = uint(int(uint(_296) >> uint(2)));
    uint _300 = uint(int(uint(int(_298)) >> uint(2)));
    int _302 = int(_298) & 3;
    float _304 = (*spvDescriptorSet0.cp_c5)._m0[int(_300)][_302];
    int _306 = _70;
    int _308 = 1;
    int _310 = _60(_306, _308, (*spvDescriptorSet0.support_buffer));
    int _312 = as_type<int>(_304);
    int _314 = 1;
    int _316 = _60(_312, _314, (*spvDescriptorSet0.support_buffer));
    int3 _1684 = int3(_310, _316, 0);
    float3 _318 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1684.xy), uint(_1684.z), 0).xyz;
    float _320 = _318.x;
    float _322 = _318.y;
    float _324 = _318.z;
    int _326 = _70;
    int _328 = 1;
    int _330 = _60(_326, _328, (*spvDescriptorSet0.support_buffer));
    int _332 = as_type<int>(_304);
    int _334 = 1;
    int _336 = _60(_332, _334, (*spvDescriptorSet0.support_buffer));
    int3 _1702 = int3(_330, _336, 2);
    float3 _338 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1702.xy), uint(_1702.z), 0).xyz;
    float _340 = _338.x;
    float _342 = _338.y;
    float _344 = _338.z;
    float _346 = _232 * _292;
    float _348 = _236 * 2.0;
    float _350 = -_348;
    float _352 = fma(_346, _350, _346);
    float _354 = fma(_236, 3.1415927410125732421875, _352);
    float _356 = _354 * 0.15915493667125701904296875;
    float _358 = _356 * 6.283185482025146484375;
    float _360 = sin(_358);
    float _362 = abs(_360);
    bool _364 = _362 >= 0.001000000047497451305389404296875;
    bool _366 = isnan(_362);
    bool _368 = _364 || _366;
    bool _370 = isnan(0.001000000047497451305389404296875);
    bool _372 = _368 || _370;
    float _374 = 0.0;
    float _376 = _294;
    float _378 = _346;
    if (!_372)
    {
        int _380 = _76 + 28;
        uint _382 = uint(int(uint(_380) >> uint(2)));
        uint _384 = uint(int(uint(int(_382)) >> uint(2)));
        int _386 = int(_382) & 3;
        float _388 = (*spvDescriptorSet0.cp_c5)._m0[int(_384)][_386];
        _374 = _388;
    }
    float _390 = _374;
    float _392 = _390;
    if (!_372)
    {
        float _394 = -_390;
        float _396 = _394 + 1.0;
        _376 = _396;
    }
    float _398 = _376;
    float _400 = _398;
    if (!_372)
    {
        _378 = _390;
    }
    float _402 = _378;
    bool _404 = !_372;
    float _406 = _402;
    if (!_404)
    {
        int _408 = _76 + 28;
        uint _410 = uint(int(uint(_408) >> uint(2)));
        uint _412 = uint(int(uint(int(_410)) >> uint(2)));
        int _414 = int(_410) & 3;
        float _416 = (*spvDescriptorSet0.cp_c5)._m0[int(_412)][_414];
        float _418 = 1.0 / _360;
        float _420 = _354 * _416;
        float _422 = _420 * 0.15915493667125701904296875;
        float _424 = -_420;
        float _426 = _354 + _424;
        float _428 = _426 * 0.15915493667125701904296875;
        float _430 = _422 * 6.283185482025146484375;
        float _432 = sin(_430);
        float _434 = _428 * 6.283185482025146484375;
        float _436 = sin(_434);
        float _438 = _432 * _418;
        float _440 = _436 * _418;
        _406 = _438;
        _392 = _416;
        _400 = _440;
    }
    float _442 = _406;
    float _444 = _392;
    float _446 = _400;
    bool _448 = !_204;
    float _450 = -_442;
    float _452 = _448 ? _450 : _442;
    float _454 = _324 * _444;
    float _456 = _344 * _444;
    bool _458 = _70 != 0;
    int _460 = _70 * 112;
    float _462 = _140 * _452;
    float _464 = _134 * _452;
    int _466 = _76 + 20;
    uint _468 = uint(int(uint(_466) >> uint(2)));
    uint _470 = uint(int(uint(int(_468)) >> uint(2)));
    int _472 = int(_468) & 3;
    float _474 = (*spvDescriptorSet0.cp_c5)._m0[int(_470)][_472];
    float _476 = _136 * _452;
    float _478 = _138 * _452;
    float _480 = fma(_118, _446, _462);
    float _482 = fma(_112, _446, _464);
    float _484 = fma(_114, _446, _476);
    float _486 = fma(_116, _446, _478);
    float _488 = _480 * 2.0;
    float _490 = _482 * 2.0;
    float _492 = _484 * 2.0;
    float _494 = _486 * _488;
    float _496 = _484 * _488;
    float _498 = _482 * _488;
    float _500 = _482 * _482;
    float _502 = -_494;
    float _504 = fma(_484, _490, _502);
    float _506 = fma(_484, _490, _494);
    float _508 = _484 * _484;
    float _510 = fma(_486, _490, _496);
    float _512 = -_496;
    float _514 = fma(_486, _490, _512);
    float _516 = -_498;
    float _518 = fma(_486, _492, _516);
    float _520 = fma(_486, _492, _498);
    float _522 = _486 * _486;
    float _524 = _320 * _444;
    float _526 = fma(_508, -2.0, 1.0);
    float _528 = fma(_500, -2.0, 1.0);
    float _530 = _322 * _444;
    float _532 = fma(_158, _474, _524);
    float _534 = fma(_522, -2.0, _526);
    float _536 = fma(_522, -2.0, _528);
    float _538 = fma(_160, _474, _530);
    float _540 = fma(_508, -2.0, _528);
    float _542 = fma(_162, _474, _454);
    float _544 = _506 * _532;
    float _546 = _534 * _532;
    float _548 = _514 * _532;
    float _550 = _536 * _538;
    float _552 = _504 * _538;
    float _554 = _520 * _538;
    float _556 = _340 * _444;
    float _558 = _342 * _444;
    float _560 = _510 * _542;
    float _562 = _518 * _542;
    float _564 = _540 * _542;
    float _566 = fma(_178, _474, _556);
    float _568 = fma(_180, _474, _558);
    int _570 = _70 * 48;
    float _572 = fma(_182, _474, _456);
    float _574 = _540;
    float _576 = _520;
    float _578 = (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _580 = _550;
    float _582 = _554;
    float _584 = _544;
    float _586 = _548;
    float _588 = _562;
    float _590 = _560;
    float _592 = _564;
    if (!_458)
    {
        _574 = _566;
    }
    float _594 = _574;
    uint _596 = uint(int(uint(_570) >> uint(2)));
    _39[int(_596)] = as_type<uint>(_546);
    int _598 = _570 + 4;
    uint _600 = uint(int(uint(_598) >> uint(2)));
    _39[int(_600)] = as_type<uint>(_552);
    int _602 = _570 + 8;
    uint _604 = uint(int(uint(_602) >> uint(2)));
    _39[int(_604)] = as_type<uint>(_560);
    int _606 = _570 + 12;
    uint _608 = uint(int(uint(_606) >> uint(2)));
    _39[int(_608)] = as_type<uint>(_566);
    bool _610 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _612 = _594;
    if (!_458)
    {
        _576 = _568;
    }
    float _614 = _576;
    int _616 = _570 + 16;
    uint _618 = uint(int(uint(_616) >> uint(2)));
    _39[int(_618)] = as_type<uint>(_544);
    int _620 = _570 + 20;
    uint _622 = uint(int(uint(_620) >> uint(2)));
    _39[int(_622)] = as_type<uint>(_550);
    int _624 = _570 + 24;
    uint _626 = uint(int(uint(_624) >> uint(2)));
    _39[int(_626)] = as_type<uint>(_562);
    int _628 = _570 + 28;
    uint _630 = uint(int(uint(_628) >> uint(2)));
    _39[int(_630)] = as_type<uint>(_568);
    float _632 = _614;
    if (!_458)
    {
        _578 = _572;
    }
    float _634 = _578;
    float _636 = _634;
    if (!_458)
    {
        _240 = _546;
    }
    float _638 = _240;
    int _640 = _570 + 32;
    uint _642 = uint(int(uint(_640) >> uint(2)));
    _39[int(_642)] = as_type<uint>(_548);
    int _644 = _570 + 36;
    uint _646 = uint(int(uint(_644) >> uint(2)));
    _39[int(_646)] = as_type<uint>(_554);
    int _648 = _570 + 40;
    uint _650 = uint(int(uint(_648) >> uint(2)));
    _39[int(_650)] = as_type<uint>(_564);
    int _652 = _570 + 44;
    uint _654 = uint(int(uint(_652) >> uint(2)));
    _39[int(_654)] = as_type<uint>(_572);
    float _656 = _638;
    if (!_458)
    {
        _242 = _552;
    }
    float _658 = _242;
    float _660 = _658;
    if (!_610)
    {
        int _662 = _70 * 48;
        int _664 = _662 + 16;
        uint _666 = uint(int(uint(_662) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_666)] = as_type<uint>(_546);
        int _668 = _662 + 4;
        uint _670 = uint(int(uint(_668) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_670)] = as_type<uint>(_552);
        int _672 = _662 + 8;
        uint _674 = uint(int(uint(_672) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_674)] = as_type<uint>(_560);
        int _676 = _662 + 12;
        uint _678 = uint(int(uint(_676) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_678)] = as_type<uint>(_566);
        int _680 = _662 + 32;
        uint _682 = uint(int(uint(_664) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_682)] = as_type<uint>(_544);
        int _684 = _664 + 4;
        uint _686 = uint(int(uint(_684) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_686)] = as_type<uint>(_550);
        int _688 = _664 + 8;
        uint _690 = uint(int(uint(_688) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_690)] = as_type<uint>(_562);
        int _692 = _664 + 12;
        uint _694 = uint(int(uint(_692) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_694)] = as_type<uint>(_568);
        uint _696 = uint(int(uint(_680) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_696)] = as_type<uint>(_548);
        int _698 = _680 + 4;
        uint _700 = uint(int(uint(_698) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_700)] = as_type<uint>(_554);
        int _702 = _680 + 8;
        uint _704 = uint(int(uint(_702) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_704)] = as_type<uint>(_564);
        int _706 = _680 + 12;
        uint _708 = uint(int(uint(_706) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_708)] = as_type<uint>(_572);
    }
    bool _710 = !_458;
    if (!_710)
    {
        bool _712 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _714 = !_712;
        if (!_714)
        {
            uint _716 = uint(int(uint(_460) >> uint(2)));
            uint _718 = uint(int(uint(int(_716)) >> uint(2)));
            int _720 = int(_716) & 3;
            float _722 = (*spvDescriptorSet0.cp_c6)._m0[int(_718)][_720];
            int _724 = as_type<int>(_722) * 48;
            int _726 = 0;
            bool _728;
            float _824;
            float _826;
            float _828;
            float _848;
            float _850;
            float _854;
            float _870;
            float _874;
            float _876;
            float _878;
            float _880;
            float _882;
            do
            {
                int _730 = _726;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _732 = uint(int(uint(_724) >> uint(2)));
                float _734 = as_type<float>(_39[int(_732)]);
                int _736 = _724 + 4;
                uint _738 = uint(int(uint(_736) >> uint(2)));
                float _740 = as_type<float>(_39[int(_738)]);
                int _742 = _724 + 8;
                uint _744 = uint(int(uint(_742) >> uint(2)));
                float _746 = as_type<float>(_39[int(_744)]);
                int _748 = _724 + 12;
                uint _750 = uint(int(uint(_748) >> uint(2)));
                float _752 = as_type<float>(_39[int(_750)]);
                int _754 = _730 + 1;
                int _756 = _724 + 16;
                uint _758 = uint(int(uint(_756) >> uint(2)));
                float _760 = as_type<float>(_39[int(_758)]);
                int _762 = _724 + 20;
                uint _764 = uint(int(uint(_762) >> uint(2)));
                float _766 = as_type<float>(_39[int(_764)]);
                int _768 = _724 + 24;
                uint _770 = uint(int(uint(_768) >> uint(2)));
                float _772 = as_type<float>(_39[int(_770)]);
                int _774 = _724 + 28;
                uint _776 = uint(int(uint(_774) >> uint(2)));
                float _778 = as_type<float>(_39[int(_776)]);
                bool _780 = uint(_754) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _782 = _724 + 32;
                uint _784 = uint(int(uint(_782) >> uint(2)));
                float _786 = as_type<float>(_39[int(_784)]);
                int _788 = _724 + 36;
                uint _790 = uint(int(uint(_788) >> uint(2)));
                float _792 = as_type<float>(_39[int(_790)]);
                int _794 = _724 + 40;
                uint _796 = uint(int(uint(_794) >> uint(2)));
                float _798 = as_type<float>(_39[int(_796)]);
                int _800 = _724 + 44;
                uint _802 = uint(int(uint(_800) >> uint(2)));
                float _804 = as_type<float>(_39[int(_802)]);
                float _806 = _568 * _740;
                float _808 = _544 * _740;
                float _810 = _550 * _740;
                float _812 = _562 * _740;
                float _814 = fma(_566, _734, _806);
                float _816 = fma(_546, _734, _808);
                float _818 = fma(_552, _734, _810);
                float _820 = fma(_560, _734, _812);
                float _822 = fma(_572, _746, _814);
                _824 = fma(_548, _746, _816);
                _826 = fma(_554, _746, _818);
                _828 = fma(_564, _746, _820);
                float _830 = _568 * _766;
                float _832 = _544 * _766;
                float _834 = _550 * _766;
                float _836 = _562 * _766;
                float _838 = fma(_566, _760, _830);
                float _840 = fma(_546, _760, _832);
                float _842 = fma(_552, _760, _834);
                float _844 = fma(_560, _760, _836);
                float _846 = fma(_572, _772, _838);
                _848 = fma(_548, _772, _840);
                _850 = fma(_554, _772, _842);
                float _852 = _544 * _792;
                _854 = _778 + _846;
                float _856 = _568 * _792;
                float _858 = _550 * _792;
                float _860 = _562 * _792;
                float _862 = fma(_546, _786, _852);
                float _864 = fma(_566, _786, _856);
                float _866 = fma(_552, _786, _858);
                float _868 = fma(_560, _786, _860);
                _870 = fma(_564, _772, _844);
                float _872 = fma(_572, _798, _864);
                _874 = _752 + _822;
                _876 = fma(_548, _798, _862);
                _878 = fma(_554, _798, _866);
                _880 = fma(_564, _798, _868);
                _882 = _804 + _872;
                uint _884 = uint(int(uint(_570) >> uint(2)));
                _39[int(_884)] = as_type<uint>(_824);
                int _886 = _570 + 4;
                uint _888 = uint(int(uint(_886) >> uint(2)));
                _39[int(_888)] = as_type<uint>(_826);
                int _890 = _570 + 8;
                uint _892 = uint(int(uint(_890) >> uint(2)));
                _39[int(_892)] = as_type<uint>(_828);
                int _894 = _570 + 12;
                uint _896 = uint(int(uint(_894) >> uint(2)));
                _39[int(_896)] = as_type<uint>(_874);
                int _898 = _570 + 16;
                uint _900 = uint(int(uint(_898) >> uint(2)));
                _39[int(_900)] = as_type<uint>(_848);
                int _902 = _570 + 20;
                uint _904 = uint(int(uint(_902) >> uint(2)));
                _39[int(_904)] = as_type<uint>(_850);
                int _906 = _570 + 24;
                uint _908 = uint(int(uint(_906) >> uint(2)));
                _39[int(_908)] = as_type<uint>(_870);
                int _910 = _570 + 28;
                uint _912 = uint(int(uint(_910) >> uint(2)));
                _39[int(_912)] = as_type<uint>(_854);
                int _914 = _570 + 32;
                uint _916 = uint(int(uint(_914) >> uint(2)));
                _39[int(_916)] = as_type<uint>(_876);
                int _918 = _570 + 36;
                uint _920 = uint(int(uint(_918) >> uint(2)));
                _39[int(_920)] = as_type<uint>(_878);
                int _922 = _570 + 40;
                uint _924 = uint(int(uint(_922) >> uint(2)));
                _39[int(_924)] = as_type<uint>(_880);
                int _926 = _570 + 44;
                uint _928 = uint(int(uint(_926) >> uint(2)));
                _39[int(_928)] = as_type<uint>(_882);
                _728 = !_780;
                _726 = _754;
            } while (_728);
            _660 = _826;
            _580 = _850;
            _582 = _878;
            _656 = _824;
            _584 = _848;
            _586 = _876;
            _588 = _870;
            _590 = _828;
            _632 = _854;
            _592 = _880;
            _612 = _874;
            _636 = _882;
            _930 = true;
        }
        else
        {
            _660 = 0.0;
            _580 = 0.0;
            _582 = 0.0;
            _656 = 0.0;
            _584 = 0.0;
            _586 = 0.0;
            _588 = 0.0;
            _590 = 0.0;
            _632 = 0.0;
            _592 = 0.0;
            _612 = 0.0;
            _636 = 0.0;
        }
    }
    _930 = false;
    float _932 = _660;
    float _934 = _580;
    float _936 = _582;
    float _938 = _656;
    float _940 = _584;
    float _942 = _586;
    float _944 = _588;
    float _946 = _590;
    float _948 = _632;
    float _950 = _592;
    float _952 = _612;
    float _954 = _636;
    int _956 = _460 + 80;
    uint _958 = uint(int(uint(_956) >> uint(2)));
    uint _960 = uint(int(uint(int(_958)) >> uint(2)));
    int _962 = int(_958) & 3;
    float _964 = (*spvDescriptorSet0.cp_c6)._m0[int(_960)][_962];
    int _966 = int(_958) + 1;
    uint _968 = uint(int(uint(_966) >> uint(2)));
    int _970 = _966 & 3;
    float _972 = (*spvDescriptorSet0.cp_c6)._m0[int(_968)][_970];
    int _974 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _976 = _974 + _70;
    int _978 = _460 + 64;
    uint _980 = uint(int(uint(_978) >> uint(2)));
    uint _982 = uint(int(uint(int(_980)) >> uint(2)));
    int _984 = int(_980) & 3;
    float _986 = (*spvDescriptorSet0.cp_c6)._m0[int(_982)][_984];
    int _988 = int(_980) + 1;
    uint _990 = uint(int(uint(_988) >> uint(2)));
    int _992 = _988 & 3;
    float _994 = (*spvDescriptorSet0.cp_c6)._m0[int(_990)][_992];
    int _996 = _976 * 48;
    int _998 = _460 + 88;
    uint _1000 = uint(int(uint(_998) >> uint(2)));
    uint _1002 = uint(int(uint(int(_1000)) >> uint(2)));
    int _1004 = int(_1000) & 3;
    float _1006 = (*spvDescriptorSet0.cp_c6)._m0[int(_1002)][_1004];
    int _1008 = int(_1000) + 1;
    uint _1010 = uint(int(uint(_1008) >> uint(2)));
    int _1012 = _1008 & 3;
    float _1014 = (*spvDescriptorSet0.cp_c6)._m0[int(_1010)][_1012];
    int _1016 = _460 + 72;
    uint _1018 = uint(int(uint(_1016) >> uint(2)));
    uint _1020 = uint(int(uint(int(_1018)) >> uint(2)));
    int _1022 = int(_1018) & 3;
    float _1024 = (*spvDescriptorSet0.cp_c6)._m0[int(_1020)][_1022];
    int _1026 = int(_1018) + 1;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    int _1030 = _1026 & 3;
    float _1032 = (*spvDescriptorSet0.cp_c6)._m0[int(_1028)][_1030];
    int _1034 = _460 + 104;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    uint _1038 = uint(int(uint(int(_1036)) >> uint(2)));
    int _1040 = int(_1036) & 3;
    float _1042 = (*spvDescriptorSet0.cp_c6)._m0[int(_1038)][_1040];
    int _1044 = int(_1036) + 1;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    int _1048 = _1044 & 3;
    float _1050 = (*spvDescriptorSet0.cp_c6)._m0[int(_1046)][_1048];
    int _1052 = _460 + 96;
    uint _1054 = uint(int(uint(_1052) >> uint(2)));
    uint _1056 = uint(int(uint(int(_1054)) >> uint(2)));
    int _1058 = int(_1054) & 3;
    float _1060 = (*spvDescriptorSet0.cp_c6)._m0[int(_1056)][_1058];
    int _1062 = int(_1054) + 1;
    uint _1064 = uint(int(uint(_1062) >> uint(2)));
    int _1066 = _1062 & 3;
    float _1068 = (*spvDescriptorSet0.cp_c6)._m0[int(_1064)][_1066];
    float _1070 = _932 * _964;
    float _1072 = _934 * _964;
    float _1074 = _936 * _972;
    int _1076 = _460 + 16;
    uint _1078 = uint(int(uint(_1076) >> uint(2)));
    uint _1080 = uint(int(uint(int(_1078)) >> uint(2)));
    int _1082 = int(_1078) & 3;
    float _1084 = (*spvDescriptorSet0.cp_c6)._m0[int(_1080)][_1082];
    int _1086 = int(_1078) + 1;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    int _1090 = _1086 & 3;
    float _1092 = (*spvDescriptorSet0.cp_c6)._m0[int(_1088)][_1090];
    float _1094 = _936 * _964;
    float _1096 = fma(_938, _986, _1070);
    float _1098 = fma(_940, _986, _1072);
    float _1100 = _932 * _972;
    int _1102 = _460 + 32;
    uint _1104 = uint(int(uint(_1102) >> uint(2)));
    uint _1106 = uint(int(uint(int(_1104)) >> uint(2)));
    int _1108 = int(_1104) & 3;
    float _1110 = (*spvDescriptorSet0.cp_c6)._m0[int(_1106)][_1108];
    int _1112 = int(_1104) + 1;
    uint _1114 = uint(int(uint(_1112) >> uint(2)));
    int _1116 = _1112 & 3;
    float _1118 = (*spvDescriptorSet0.cp_c6)._m0[int(_1114)][_1116];
    float _1120 = _934 * _972;
    float _1122 = fma(_942, _994, _1074);
    float _1124 = fma(_942, _986, _1094);
    float _1126 = fma(_938, _994, _1100);
    float _1128 = _932 * _1006;
    float _1130 = _932 * _1014;
    float _1132 = _934 * _1006;
    int _1134 = _460 + 48;
    uint _1136 = uint(int(uint(_1134) >> uint(2)));
    uint _1138 = uint(int(uint(int(_1136)) >> uint(2)));
    int _1140 = int(_1136) & 3;
    float _1142 = (*spvDescriptorSet0.cp_c6)._m0[int(_1138)][_1140];
    int _1144 = int(_1136) + 1;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    int _1148 = _1144 & 3;
    float _1150 = (*spvDescriptorSet0.cp_c6)._m0[int(_1146)][_1148];
    float _1152 = _934 * _1014;
    float _1154 = _936 * _1006;
    float _1156 = _936 * _1014;
    float _1158 = fma(_940, _994, _1120);
    float _1160 = fma(_938, _1024, _1128);
    float _1162 = fma(_938, _1032, _1130);
    float _1164 = fma(_940, _1024, _1132);
    int _1166 = _460 + 24;
    uint _1168 = uint(int(uint(_1166) >> uint(2)));
    uint _1170 = uint(int(uint(int(_1168)) >> uint(2)));
    int _1172 = int(_1168) & 3;
    float _1174 = (*spvDescriptorSet0.cp_c6)._m0[int(_1170)][_1172];
    int _1176 = int(_1168) + 1;
    uint _1178 = uint(int(uint(_1176) >> uint(2)));
    int _1180 = _1176 & 3;
    float _1182 = (*spvDescriptorSet0.cp_c6)._m0[int(_1178)][_1180];
    float _1184 = fma(_940, _1032, _1152);
    float _1186 = fma(_942, _1024, _1154);
    float _1188 = fma(_942, _1032, _1156);
    float _1190 = fma(_944, _1050, _1184);
    float _1192 = fma(_946, _1050, _1162);
    float _1194 = fma(_946, _1042, _1160);
    int _1196 = _460 + 40;
    uint _1198 = uint(int(uint(_1196) >> uint(2)));
    uint _1200 = uint(int(uint(int(_1198)) >> uint(2)));
    int _1202 = int(_1198) & 3;
    float _1204 = (*spvDescriptorSet0.cp_c6)._m0[int(_1200)][_1202];
    int _1206 = int(_1198) + 1;
    uint _1208 = uint(int(uint(_1206) >> uint(2)));
    int _1210 = _1206 & 3;
    float _1212 = (*spvDescriptorSet0.cp_c6)._m0[int(_1208)][_1210];
    float _1214 = _1190 + _948;
    float _1216 = fma(_950, _1050, _1188);
    float _1218 = fma(_950, _1042, _1186);
    float _1220 = _1192 + _952;
    float _1222 = fma(_946, _1060, _1096);
    float _1224 = fma(_944, _1060, _1098);
    float _1226 = fma(_946, _1068, _1126);
    int _1228 = _460 + 56;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.cp_c6)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.cp_c6)._m0[int(_1240)][_1242];
    float _1246 = fma(_950, _1060, _1124);
    float _1248 = fma(_950, _1068, _1122);
    float _1250 = fma(_944, _1042, _1164);
    float _1252 = fma(_944, _1068, _1158);
    float _1254 = _1216 + _954;
    int _1256 = _996 + 32;
    float _1258 = _1214 * _1092;
    float _1260 = _1250 * _1092;
    float _1262 = _1224 * _1092;
    float _1264 = _1252 * _1092;
    float _1266 = fma(_1220, _1084, _1258);
    float _1268 = fma(_1194, _1084, _1260);
    float _1270 = fma(_1222, _1084, _1262);
    float _1272 = fma(_1226, _1084, _1264);
    float _1274 = _1214 * _1118;
    float _1276 = _1224 * _1118;
    float _1278 = _1252 * _1118;
    float _1280 = _1250 * _1118;
    float _1282 = fma(_1220, _1110, _1274);
    float _1284 = fma(_1222, _1110, _1276);
    float _1286 = fma(_1226, _1110, _1278);
    float _1288 = fma(_1194, _1110, _1280);
    float _1290 = _1214 * _1150;
    float _1292 = _1224 * _1150;
    float _1294 = _1252 * _1150;
    float _1296 = _1250 * _1150;
    float _1298 = fma(_1220, _1142, _1290);
    float _1300 = fma(_1222, _1142, _1292);
    float _1302 = fma(_1226, _1142, _1294);
    float _1304 = fma(_1194, _1142, _1296);
    float _1306 = fma(_1254, _1174, _1266);
    float _1308 = fma(_1218, _1174, _1268);
    float _1310 = fma(_1246, _1174, _1270);
    float _1312 = fma(_1248, _1174, _1272);
    float _1314 = _1306 + _1182;
    int _1316 = _996 + 16;
    int _1318 = _996 + 48;
    float _1320 = fma(_1254, _1204, _1282);
    float _1322 = fma(_1246, _1204, _1284);
    float _1324 = fma(_1248, _1204, _1286);
    float _1326 = fma(_1218, _1204, _1288);
    float _1328 = _1320 + _1212;
    uint _1330 = uint(int(uint(_1316) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1330)] = as_type<uint>(_1310);
    int _1332 = _1316 + 4;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1334)] = as_type<uint>(_1312);
    int _1336 = _1316 + 8;
    uint _1338 = uint(int(uint(_1336) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1338)] = as_type<uint>(_1308);
    int _1340 = _1316 + 12;
    uint _1342 = uint(int(uint(_1340) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1342)] = as_type<uint>(_1314);
    float _1344 = fma(_1254, _1236, _1298);
    float _1346 = fma(_1246, _1236, _1300);
    float _1348 = fma(_1248, _1236, _1302);
    float _1350 = fma(_1218, _1236, _1304);
    float _1352 = _1344 + _1244;
    uint _1354 = uint(int(uint(_1256) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1354)] = as_type<uint>(_1322);
    int _1356 = _1256 + 4;
    uint _1358 = uint(int(uint(_1356) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1358)] = as_type<uint>(_1324);
    int _1360 = _1256 + 8;
    uint _1362 = uint(int(uint(_1360) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1362)] = as_type<uint>(_1326);
    int _1364 = _1256 + 12;
    uint _1366 = uint(int(uint(_1364) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1366)] = as_type<uint>(_1328);
    uint _1368 = uint(int(uint(_1318) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1368)] = as_type<uint>(_1346);
    int _1370 = _1318 + 4;
    uint _1372 = uint(int(uint(_1370) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1372)] = as_type<uint>(_1348);
    int _1374 = _1318 + 8;
    uint _1376 = uint(int(uint(_1374) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1376)] = as_type<uint>(_1350);
    int _1378 = _1318 + 12;
    uint _1380 = uint(int(uint(_1378) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1380)] = as_type<uint>(_1352);
}

