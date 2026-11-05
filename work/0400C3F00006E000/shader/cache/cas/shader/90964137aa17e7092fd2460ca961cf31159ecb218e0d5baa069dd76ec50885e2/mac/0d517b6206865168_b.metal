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
int _60(thread const int& _3932, thread const int& _3933, constant _10& support_buffer)
{
    int _3936 = 1 + _3933;
    float _3938 = support_buffer._m5[_3936].x;
    bool _3940 = _3938 == 1.0;
    if (_3940)
    {
        return _3932;
    }
    float _3942 = float(_3932);
    float _3944 = _3942 * _3938;
    int _3946 = int(_3944);
    return _3946;
}

static inline __attribute__((always_inline))
void _58(thread const int& _3620, thread const int& _3621, thread const int& _3622, thread const int& _3623, thread int& _3624, thread int& _3625, thread int& _3626, thread int& _3627, thread int& _3628, thread int& _3629)
{
    float _3632 = as_type<float>(_3621) + 0.0;
    bool _3634 = _3632 != 0.0;
    bool _3636 = isnan(_3632);
    bool _3638 = _3634 || _3636;
    bool _3640 = isnan(0.0);
    bool _3642 = _3638 || _3640;
    int _3644 = as_type<int>(_3632);
    int _3646 = _3621;
    int _3648 = _3623;
    int _3650 = _3642 ? (-1) : 0;
    if (!_3642)
    {
        float _3652 = as_type<float>(_3621) * 1.0;
        _3644 = as_type<int>(_3652);
    }
    int _3654 = _3644;
    bool _3656 = !_3642;
    int _3658 = _3654;
    if (!_3656)
    {
        float _3660 = as_type<float>(_3621) + 0.0;
        bool _3662 = _3660 >= 0.0;
        bool _3664 = isnan(_3660);
        bool _3666 = _3662 || _3664;
        bool _3668 = isnan(0.0);
        bool _3670 = _3666 || _3668;
        int _3672 = as_type<int>(_3660);
        _3650 = _3670 ? (-1) : 0;
        if (!_3670)
        {
            _3672 = 2147483647;
        }
        int _3674 = _3672;
        bool _3676 = !_3670;
        _3658 = _3674;
        if (!_3676)
        {
            float _3678 = as_type<float>(_3621) + 0.0;
            bool _3680 = _3678 > as_type<float>(0x7f800000u /* inf */);
            bool _3682 = isnan(_3678);
            bool _3684 = _3680 || _3682;
            bool _3686 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _3688 = _3684 || _3686;
            int _3690 = as_type<int>(_3678);
            _3650 = _3688 ? (-1) : 0;
            if (_3688)
            {
                float _3692 = as_type<float>(_3621) + 1.0;
                _3690 = as_type<int>(_3692);
            }
            int _3694 = _3690;
            _3658 = _3694;
            if (!_3688)
            {
                float _3696 = 0.0 + as_type<float>(_3621);
                bool _3698 = _3696 != as_type<float>(0x7f800000u /* inf */);
                bool _3700 = isnan(_3696);
                bool _3702 = _3698 || _3700;
                bool _3704 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _3706 = _3702 || _3704;
                int _3708 = as_type<int>(_3696);
                _3650 = _3706 ? (-1) : 0;
                if (!_3706)
                {
                    _3708 = _3621;
                }
                int _3710 = _3708;
                bool _3712 = !_3706;
                _3658 = _3710;
                if (!_3712)
                {
                    float _3714 = as_type<float>(_3621) * 18446744073709551616.0;
                    float _3716 = rsqrt(_3714);
                    float _3718 = _3714 * _3716;
                    float _3720 = _3716 * 0.5;
                    float _3722 = -_3718;
                    float _3724 = 0.0 + _3722;
                    float _3726 = fma(_3720, _3724, 0.5);
                    float _3728 = fma(_3718, _3726, _3718);
                    float _3730 = -_3728;
                    float _3732 = 0.0 + _3730;
                    float _3734 = fma(_3728, _3732, _3714);
                    float _3736 = fma(_3720, _3734, _3728);
                    float _3738 = _3736 * 2.3283064365386962890625e-10;
                    _3658 = as_type<int>(_3738);
                    _3646 = as_type<int>(_3714);
                    _3648 = as_type<int>(_3728);
                }
            }
        }
    }
    int _3740 = _3658;
    int _3742 = _3646;
    int _3744 = _3648;
    int _3746 = _3650;
    _3624 = _3740;
    _3625 = _3622;
    _3626 = 0;
    _3627 = _3742;
    _3628 = _3744;
    _3629 = _3746;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _896 = false;
    bool _270 = false;
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
    int3 _1468 = int3(_101, _107, 1);
    float4 _110 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1468.xy), uint(_1468.z), 0).xyzw;
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
    int3 _1488 = int3(_124, _130, 1);
    float4 _132 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1488.xy), uint(_1488.z), 0).xyzw;
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
    int3 _1508 = int3(_146, _152, 0);
    float3 _156 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1508.xy), uint(_1508.z), 0).xyz;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    int _164 = _70;
    int _166 = 0;
    int _168 = _60(_164, _166, (*spvDescriptorSet0.support_buffer));
    int _170 = as_type<int>(_85);
    int _172 = 0;
    int _174 = _60(_170, _172, (*spvDescriptorSet0.support_buffer));
    int3 _1526 = int3(_168, _174, 2);
    float3 _176 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1526.xy), uint(_1526.z), 0).xyz;
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
    float _240 = _178;
    float _242 = _180;
    float _244 = _182;
    float _266;
    float _268;
    if (!_238)
    {
        int _246 = as_type<int>(_210);
        int _248 = as_type<int>(_216);
        int _250 = 640;
        int _252 = 0;
        int _254;
        int _256;
        int _258;
        int _260;
        int _262;
        int _264;
        _58(_246, _248, _250, _252, _254, _256, _258, _260, _262, _264);
        _266 = as_type<float>(_254);
        _268 = as_type<float>(_256);
        _270 = true;
    }
    else
    {
        float _272 = rsqrt(_216);
        float _274 = _216 * _272;
        float _276 = _272 * 0.5;
        float _278 = -_274;
        float _280 = 0.0 + _278;
        float _282 = fma(_276, _280, 0.5);
        float _284 = fma(_274, _282, _274);
        float _286 = -_284;
        float _288 = 0.0 + _286;
        float _290 = fma(_284, _288, _216);
        float _292 = fma(_276, _290, _284);
        _266 = _292;
        _268 = _280;
    }
    _270 = false;
    float _294 = _266;
    float _296 = _268;
    int _298 = _76 + 8;
    uint _300 = uint(int(uint(_298) >> uint(2)));
    uint _302 = uint(int(uint(int(_300)) >> uint(2)));
    int _304 = int(_300) & 3;
    float _306 = (*spvDescriptorSet0.cp_c5)._m0[int(_302)][_304];
    int _308 = _70;
    int _310 = 1;
    int _312 = _60(_308, _310, (*spvDescriptorSet0.support_buffer));
    int _314 = as_type<int>(_306);
    int _316 = 1;
    int _318 = _60(_314, _316, (*spvDescriptorSet0.support_buffer));
    int3 _1695 = int3(_312, _318, 0);
    float3 _320 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1695.xy), uint(_1695.z), 0).xyz;
    float _322 = _320.x;
    float _324 = _320.y;
    float _326 = _320.z;
    int _328 = _70;
    int _330 = 1;
    int _332 = _60(_328, _330, (*spvDescriptorSet0.support_buffer));
    int _334 = as_type<int>(_306);
    int _336 = 1;
    int _338 = _60(_334, _336, (*spvDescriptorSet0.support_buffer));
    int3 _1713 = int3(_332, _338, 2);
    float3 _340 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1713.xy), uint(_1713.z), 0).xyz;
    float _342 = _340.x;
    float _344 = _340.y;
    float _346 = _340.z;
    float _348 = _232 * _294;
    float _350 = _236 * 2.0;
    float _352 = -_350;
    float _354 = fma(_348, _352, _348);
    float _356 = fma(_236, 3.1415927410125732421875, _354);
    float _358 = _356 * 0.15915493667125701904296875;
    float _360 = _358 * 6.283185482025146484375;
    float _362 = sin(_360);
    float _364 = abs(_362);
    bool _366 = _364 >= 0.001000000047497451305389404296875;
    bool _368 = isnan(_364);
    bool _370 = _366 || _368;
    bool _372 = isnan(0.001000000047497451305389404296875);
    bool _374 = _370 || _372;
    float _376 = _232;
    float _378 = _296;
    float _380 = _354;
    if (!_374)
    {
        int _382 = _76 + 28;
        uint _384 = uint(int(uint(_382) >> uint(2)));
        uint _386 = uint(int(uint(int(_384)) >> uint(2)));
        int _388 = int(_384) & 3;
        float _390 = (*spvDescriptorSet0.cp_c5)._m0[int(_386)][_388];
        _376 = _390;
    }
    float _392 = _376;
    float _394 = _392;
    if (!_374)
    {
        float _396 = -_392;
        float _398 = _396 + 1.0;
        _378 = _398;
    }
    float _400 = _378;
    float _402 = _400;
    if (!_374)
    {
        _380 = _392;
    }
    float _404 = _380;
    bool _406 = !_374;
    float _408 = _404;
    if (!_406)
    {
        int _410 = _76 + 28;
        uint _412 = uint(int(uint(_410) >> uint(2)));
        uint _414 = uint(int(uint(int(_412)) >> uint(2)));
        int _416 = int(_412) & 3;
        float _418 = (*spvDescriptorSet0.cp_c5)._m0[int(_414)][_416];
        float _420 = 1.0 / _362;
        float _422 = _356 * _418;
        float _424 = _422 * 0.15915493667125701904296875;
        float _426 = -_422;
        float _428 = _356 + _426;
        float _430 = _428 * 0.15915493667125701904296875;
        float _432 = _424 * 6.283185482025146484375;
        float _434 = sin(_432);
        float _436 = _430 * 6.283185482025146484375;
        float _438 = sin(_436);
        float _440 = _434 * _420;
        float _442 = _438 * _420;
        _408 = _440;
        _394 = _418;
        _402 = _442;
    }
    float _444 = _408;
    float _446 = _394;
    float _448 = _402;
    bool _450 = !_204;
    float _452 = -_444;
    float _454 = _450 ? _452 : _444;
    float _456 = _326 * _446;
    float _458 = _346 * _446;
    bool _460 = _70 != 0;
    float _462 = _140 * _454;
    float _464 = _134 * _454;
    int _466 = _76 + 20;
    uint _468 = uint(int(uint(_466) >> uint(2)));
    uint _470 = uint(int(uint(int(_468)) >> uint(2)));
    int _472 = int(_468) & 3;
    float _474 = (*spvDescriptorSet0.cp_c5)._m0[int(_470)][_472];
    float _476 = _138 * _454;
    float _478 = fma(_118, _448, _462);
    float _480 = _136 * _454;
    float _482 = fma(_112, _448, _464);
    float _484 = fma(_116, _448, _476);
    float _486 = _478 * 2.0;
    float _488 = fma(_114, _448, _480);
    float _490 = _482 * 2.0;
    float _492 = _484 * _486;
    float _494 = _488 * _486;
    float _496 = _488 * 2.0;
    float _498 = _482 * _486;
    float _500 = -_492;
    float _502 = fma(_488, _490, _500);
    float _504 = fma(_488, _490, _492);
    float _506 = fma(_484, _490, _494);
    float _508 = -_494;
    float _510 = fma(_484, _490, _508);
    float _512 = _488 * _488;
    float _514 = -_498;
    float _516 = fma(_484, _496, _514);
    float _518 = _482 * _482;
    float _520 = fma(_484, _496, _498);
    float _522 = _322 * _446;
    float _524 = _484 * _484;
    float _526 = fma(_512, -2.0, 1.0);
    float _528 = fma(_518, -2.0, 1.0);
    float _530 = _324 * _446;
    float _532 = fma(_158, _474, _522);
    float _534 = fma(_524, -2.0, _526);
    float _536 = fma(_524, -2.0, _528);
    float _538 = fma(_160, _474, _530);
    float _540 = _504 * _532;
    float _542 = fma(_512, -2.0, _528);
    float _544 = fma(_162, _474, _456);
    float _546 = _534 * _532;
    float _548 = _342 * _446;
    float _550 = _344 * _446;
    float _552 = _510 * _532;
    float _554 = _502 * _538;
    float _556 = _536 * _538;
    float _558 = _520 * _538;
    float _560 = _506 * _544;
    float _562 = _542 * _544;
    float _564 = _516 * _544;
    float _566 = fma(_178, _474, _548);
    int _568 = _70 * 48;
    float _570 = fma(_180, _474, _550);
    float _572 = fma(_182, _474, _458);
    int _574 = _70 * 112;
    float _576 = _474;
    float _578 = _536;
    float _580 = _512;
    float _582 = _502;
    float _584 = _510;
    float _586 = _540;
    float _588 = _556;
    float _590 = _564;
    float _592 = _570;
    if (!_460)
    {
        _576 = _566;
    }
    float _594 = _576;
    uint _596 = uint(int(uint(_568) >> uint(2)));
    _39[int(_596)] = as_type<uint>(_546);
    int _598 = _568 + 4;
    uint _600 = uint(int(uint(_598) >> uint(2)));
    _39[int(_600)] = as_type<uint>(_554);
    int _602 = _568 + 8;
    uint _604 = uint(int(uint(_602) >> uint(2)));
    _39[int(_604)] = as_type<uint>(_560);
    int _606 = _568 + 12;
    uint _608 = uint(int(uint(_606) >> uint(2)));
    _39[int(_608)] = as_type<uint>(_566);
    int _610 = _568 + 16;
    int _612 = _568 + 32;
    int _614 = _568 + 16;
    uint _616 = uint(int(uint(_614) >> uint(2)));
    _39[int(_616)] = as_type<uint>(_540);
    int _618 = _568 + 20;
    uint _620 = uint(int(uint(_618) >> uint(2)));
    _39[int(_620)] = as_type<uint>(_556);
    int _622 = _568 + 24;
    uint _624 = uint(int(uint(_622) >> uint(2)));
    _39[int(_624)] = as_type<uint>(_564);
    int _626 = _568 + 28;
    uint _628 = uint(int(uint(_626) >> uint(2)));
    _39[int(_628)] = as_type<uint>(_570);
    float _630 = _594;
    if (!_460)
    {
        _578 = _572;
    }
    float _632 = _578;
    float _634 = _632;
    if (!_460)
    {
        _580 = _546;
    }
    float _636 = _580;
    int _638 = _568 + 32;
    uint _640 = uint(int(uint(_638) >> uint(2)));
    _39[int(_640)] = as_type<uint>(_552);
    int _642 = _568 + 36;
    uint _644 = uint(int(uint(_642) >> uint(2)));
    _39[int(_644)] = as_type<uint>(_558);
    int _646 = _568 + 40;
    uint _648 = uint(int(uint(_646) >> uint(2)));
    _39[int(_648)] = as_type<uint>(_562);
    int _650 = _568 + 44;
    uint _652 = uint(int(uint(_650) >> uint(2)));
    _39[int(_652)] = as_type<uint>(_572);
    float _654 = _636;
    if (!_460)
    {
        _582 = _554;
    }
    float _656 = _582;
    float _658 = _656;
    if (!_460)
    {
        _584 = _560;
    }
    float _660 = _584;
    float _662 = _660;
    if (!_460)
    {
        _240 = _552;
    }
    float _664 = _240;
    float _666 = _664;
    if (!_460)
    {
        _242 = _558;
    }
    float _668 = _242;
    float _670 = _668;
    if (!_460)
    {
        _244 = _562;
    }
    float _672 = _244;
    bool _674 = !_460;
    float _676 = _672;
    if (!_674)
    {
        bool _678 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _680 = !_678;
        if (!_680)
        {
            uint _682 = uint(int(uint(_574) >> uint(2)));
            uint _684 = uint(int(uint(int(_682)) >> uint(2)));
            int _686 = int(_682) & 3;
            float _688 = (*spvDescriptorSet0.cp_c6)._m0[int(_684)][_686];
            int _690 = as_type<int>(_688) * 48;
            int _692 = 0;
            bool _694;
            float _790;
            float _792;
            float _810;
            float _812;
            float _816;
            float _836;
            float _838;
            float _840;
            float _842;
            float _844;
            float _846;
            float _848;
            do
            {
                int _696 = _692;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _698 = uint(int(uint(_690) >> uint(2)));
                float _700 = as_type<float>(_39[int(_698)]);
                int _702 = _690 + 4;
                uint _704 = uint(int(uint(_702) >> uint(2)));
                float _706 = as_type<float>(_39[int(_704)]);
                int _708 = _690 + 8;
                uint _710 = uint(int(uint(_708) >> uint(2)));
                float _712 = as_type<float>(_39[int(_710)]);
                int _714 = _690 + 12;
                uint _716 = uint(int(uint(_714) >> uint(2)));
                float _718 = as_type<float>(_39[int(_716)]);
                int _720 = _696 + 1;
                int _722 = _690 + 16;
                uint _724 = uint(int(uint(_722) >> uint(2)));
                float _726 = as_type<float>(_39[int(_724)]);
                int _728 = _690 + 20;
                uint _730 = uint(int(uint(_728) >> uint(2)));
                float _732 = as_type<float>(_39[int(_730)]);
                int _734 = _690 + 24;
                uint _736 = uint(int(uint(_734) >> uint(2)));
                float _738 = as_type<float>(_39[int(_736)]);
                int _740 = _690 + 28;
                uint _742 = uint(int(uint(_740) >> uint(2)));
                float _744 = as_type<float>(_39[int(_742)]);
                bool _746 = uint(_720) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _748 = _690 + 32;
                uint _750 = uint(int(uint(_748) >> uint(2)));
                float _752 = as_type<float>(_39[int(_750)]);
                int _754 = _690 + 36;
                uint _756 = uint(int(uint(_754) >> uint(2)));
                float _758 = as_type<float>(_39[int(_756)]);
                int _760 = _690 + 40;
                uint _762 = uint(int(uint(_760) >> uint(2)));
                float _764 = as_type<float>(_39[int(_762)]);
                int _766 = _690 + 44;
                uint _768 = uint(int(uint(_766) >> uint(2)));
                float _770 = as_type<float>(_39[int(_768)]);
                float _772 = _570 * _706;
                float _774 = _540 * _706;
                float _776 = _556 * _706;
                float _778 = _564 * _706;
                float _780 = fma(_566, _700, _772);
                float _782 = fma(_546, _700, _774);
                float _784 = fma(_554, _700, _776);
                float _786 = fma(_560, _700, _778);
                float _788 = _570 * _732;
                _790 = fma(_552, _712, _782);
                _792 = fma(_558, _712, _784);
                float _794 = _540 * _732;
                float _796 = fma(_566, _726, _788);
                float _798 = _556 * _732;
                float _800 = _564 * _732;
                float _802 = fma(_546, _726, _794);
                float _804 = fma(_572, _738, _796);
                float _806 = fma(_554, _726, _798);
                float _808 = fma(_560, _726, _800);
                _810 = fma(_552, _738, _802);
                _812 = _744 + _804;
                float _814 = _570 * _758;
                _816 = fma(_558, _738, _806);
                float _818 = _540 * _758;
                float _820 = _556 * _758;
                float _822 = _564 * _758;
                float _824 = fma(_566, _752, _814);
                float _826 = fma(_572, _712, _780);
                float _828 = fma(_546, _752, _818);
                float _830 = fma(_554, _752, _820);
                float _832 = fma(_560, _752, _822);
                float _834 = fma(_572, _764, _824);
                _836 = fma(_562, _738, _808);
                _838 = fma(_562, _712, _786);
                _840 = _718 + _826;
                _842 = fma(_552, _764, _828);
                _844 = fma(_558, _764, _830);
                _846 = fma(_562, _764, _832);
                _848 = _770 + _834;
                uint _850 = uint(int(uint(_568) >> uint(2)));
                _39[int(_850)] = as_type<uint>(_790);
                int _852 = _568 + 4;
                uint _854 = uint(int(uint(_852) >> uint(2)));
                _39[int(_854)] = as_type<uint>(_792);
                int _856 = _568 + 8;
                uint _858 = uint(int(uint(_856) >> uint(2)));
                _39[int(_858)] = as_type<uint>(_838);
                int _860 = _568 + 12;
                uint _862 = uint(int(uint(_860) >> uint(2)));
                _39[int(_862)] = as_type<uint>(_840);
                int _864 = _568 + 16;
                uint _866 = uint(int(uint(_864) >> uint(2)));
                _39[int(_866)] = as_type<uint>(_810);
                int _868 = _568 + 20;
                uint _870 = uint(int(uint(_868) >> uint(2)));
                _39[int(_870)] = as_type<uint>(_816);
                int _872 = _568 + 24;
                uint _874 = uint(int(uint(_872) >> uint(2)));
                _39[int(_874)] = as_type<uint>(_836);
                int _876 = _568 + 28;
                uint _878 = uint(int(uint(_876) >> uint(2)));
                _39[int(_878)] = as_type<uint>(_812);
                int _880 = _568 + 32;
                uint _882 = uint(int(uint(_880) >> uint(2)));
                _39[int(_882)] = as_type<uint>(_842);
                int _884 = _568 + 36;
                uint _886 = uint(int(uint(_884) >> uint(2)));
                _39[int(_886)] = as_type<uint>(_844);
                int _888 = _568 + 40;
                uint _890 = uint(int(uint(_888) >> uint(2)));
                _39[int(_890)] = as_type<uint>(_846);
                int _892 = _568 + 44;
                uint _894 = uint(int(uint(_892) >> uint(2)));
                _39[int(_894)] = as_type<uint>(_848);
                _694 = !_746;
                _692 = _720;
            } while (_694);
            _654 = _790;
            _658 = _792;
            _662 = _838;
            _630 = _840;
            _586 = _810;
            _588 = _816;
            _590 = _836;
            _592 = _812;
            _666 = _842;
            _670 = _844;
            _676 = _846;
            _634 = _848;
            _896 = true;
        }
        else
        {
            _654 = 0.0;
            _658 = 0.0;
            _662 = 0.0;
            _630 = 0.0;
            _586 = 0.0;
            _588 = 0.0;
            _590 = 0.0;
            _592 = 0.0;
            _666 = 0.0;
            _670 = 0.0;
            _676 = 0.0;
            _634 = 0.0;
        }
    }
    _896 = false;
    float _898 = _654;
    float _900 = _658;
    float _902 = _662;
    float _904 = _630;
    float _906 = _586;
    float _908 = _588;
    float _910 = _590;
    float _912 = _592;
    float _914 = _666;
    float _916 = _670;
    float _918 = _676;
    float _920 = _634;
    int _922 = _574 + 80;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    uint _926 = uint(int(uint(int(_924)) >> uint(2)));
    int _928 = int(_924) & 3;
    float _930 = (*spvDescriptorSet0.cp_c6)._m0[int(_926)][_928];
    int _932 = int(_924) + 1;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    int _936 = _932 & 3;
    float _938 = (*spvDescriptorSet0.cp_c6)._m0[int(_934)][_936];
    bool _940 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _942 = _574 + 64;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    uint _946 = uint(int(uint(int(_944)) >> uint(2)));
    int _948 = int(_944) & 3;
    float _950 = (*spvDescriptorSet0.cp_c6)._m0[int(_946)][_948];
    int _952 = int(_944) + 1;
    uint _954 = uint(int(uint(_952) >> uint(2)));
    int _956 = _952 & 3;
    float _958 = (*spvDescriptorSet0.cp_c6)._m0[int(_954)][_956];
    int _960 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _962 = _960 + _70;
    int _964 = _574 + 88;
    uint _966 = uint(int(uint(_964) >> uint(2)));
    uint _968 = uint(int(uint(int(_966)) >> uint(2)));
    int _970 = int(_966) & 3;
    float _972 = (*spvDescriptorSet0.cp_c6)._m0[int(_968)][_970];
    int _974 = int(_966) + 1;
    uint _976 = uint(int(uint(_974) >> uint(2)));
    int _978 = _974 & 3;
    float _980 = (*spvDescriptorSet0.cp_c6)._m0[int(_976)][_978];
    int _982 = _574 + 72;
    uint _984 = uint(int(uint(_982) >> uint(2)));
    uint _986 = uint(int(uint(int(_984)) >> uint(2)));
    int _988 = int(_984) & 3;
    float _990 = (*spvDescriptorSet0.cp_c6)._m0[int(_986)][_988];
    int _992 = int(_984) + 1;
    uint _994 = uint(int(uint(_992) >> uint(2)));
    int _996 = _992 & 3;
    float _998 = (*spvDescriptorSet0.cp_c6)._m0[int(_994)][_996];
    int _1000 = _574 + 96;
    uint _1002 = uint(int(uint(_1000) >> uint(2)));
    uint _1004 = uint(int(uint(int(_1002)) >> uint(2)));
    int _1006 = int(_1002) & 3;
    float _1008 = (*spvDescriptorSet0.cp_c6)._m0[int(_1004)][_1006];
    int _1010 = int(_1002) + 1;
    uint _1012 = uint(int(uint(_1010) >> uint(2)));
    int _1014 = _1010 & 3;
    float _1016 = (*spvDescriptorSet0.cp_c6)._m0[int(_1012)][_1014];
    int _1018 = _574 + 104;
    uint _1020 = uint(int(uint(_1018) >> uint(2)));
    uint _1022 = uint(int(uint(int(_1020)) >> uint(2)));
    int _1024 = int(_1020) & 3;
    float _1026 = (*spvDescriptorSet0.cp_c6)._m0[int(_1022)][_1024];
    int _1028 = int(_1020) + 1;
    uint _1030 = uint(int(uint(_1028) >> uint(2)));
    int _1032 = _1028 & 3;
    float _1034 = (*spvDescriptorSet0.cp_c6)._m0[int(_1030)][_1032];
    int _1036 = _574 + 16;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    uint _1040 = uint(int(uint(int(_1038)) >> uint(2)));
    int _1042 = int(_1038) & 3;
    float _1044 = (*spvDescriptorSet0.cp_c6)._m0[int(_1040)][_1042];
    int _1046 = int(_1038) + 1;
    uint _1048 = uint(int(uint(_1046) >> uint(2)));
    int _1050 = _1046 & 3;
    float _1052 = (*spvDescriptorSet0.cp_c6)._m0[int(_1048)][_1050];
    if (!_940)
    {
        uint _1054 = uint(int(uint(_568) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1054)] = as_type<uint>(_898);
        int _1056 = _568 + 4;
        uint _1058 = uint(int(uint(_1056) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1058)] = as_type<uint>(_900);
        int _1060 = _568 + 8;
        uint _1062 = uint(int(uint(_1060) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1062)] = as_type<uint>(_902);
        int _1064 = _568 + 12;
        uint _1066 = uint(int(uint(_1064) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1066)] = as_type<uint>(_904);
        uint _1068 = uint(int(uint(_610) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1068)] = as_type<uint>(_906);
        int _1070 = _610 + 4;
        uint _1072 = uint(int(uint(_1070) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1072)] = as_type<uint>(_908);
        int _1074 = _610 + 8;
        uint _1076 = uint(int(uint(_1074) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1076)] = as_type<uint>(_910);
        int _1078 = _610 + 12;
        uint _1080 = uint(int(uint(_1078) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1080)] = as_type<uint>(_912);
        uint _1082 = uint(int(uint(_612) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1082)] = as_type<uint>(_914);
        int _1084 = _612 + 4;
        uint _1086 = uint(int(uint(_1084) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1086)] = as_type<uint>(_916);
        int _1088 = _612 + 8;
        uint _1090 = uint(int(uint(_1088) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1090)] = as_type<uint>(_918);
        int _1092 = _612 + 12;
        uint _1094 = uint(int(uint(_1092) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1094)] = as_type<uint>(_920);
    }
    float _1096 = _908 * _930;
    float _1098 = _916 * _930;
    int _1100 = _574 + 32;
    uint _1102 = uint(int(uint(_1100) >> uint(2)));
    uint _1104 = uint(int(uint(int(_1102)) >> uint(2)));
    int _1106 = int(_1102) & 3;
    float _1108 = (*spvDescriptorSet0.cp_c6)._m0[int(_1104)][_1106];
    int _1110 = int(_1102) + 1;
    uint _1112 = uint(int(uint(_1110) >> uint(2)));
    int _1114 = _1110 & 3;
    float _1116 = (*spvDescriptorSet0.cp_c6)._m0[int(_1112)][_1114];
    float _1118 = _900 * _930;
    float _1120 = fma(_906, _950, _1096);
    float _1122 = fma(_914, _950, _1098);
    float _1124 = _900 * _938;
    float _1126 = _908 * _938;
    float _1128 = _916 * _938;
    float _1130 = _900 * _980;
    int _1132 = _574 + 48;
    uint _1134 = uint(int(uint(_1132) >> uint(2)));
    uint _1136 = uint(int(uint(int(_1134)) >> uint(2)));
    int _1138 = int(_1134) & 3;
    float _1140 = (*spvDescriptorSet0.cp_c6)._m0[int(_1136)][_1138];
    int _1142 = int(_1134) + 1;
    uint _1144 = uint(int(uint(_1142) >> uint(2)));
    int _1146 = _1142 & 3;
    float _1148 = (*spvDescriptorSet0.cp_c6)._m0[int(_1144)][_1146];
    float _1150 = fma(_898, _958, _1124);
    float _1152 = fma(_906, _958, _1126);
    float _1154 = fma(_914, _958, _1128);
    float _1156 = _900 * _972;
    float _1158 = _908 * _972;
    float _1160 = _908 * _980;
    float _1162 = _916 * _972;
    float _1164 = _916 * _980;
    int _1166 = _574 + 24;
    uint _1168 = uint(int(uint(_1166) >> uint(2)));
    uint _1170 = uint(int(uint(int(_1168)) >> uint(2)));
    int _1172 = int(_1168) & 3;
    float _1174 = (*spvDescriptorSet0.cp_c6)._m0[int(_1170)][_1172];
    int _1176 = int(_1168) + 1;
    uint _1178 = uint(int(uint(_1176) >> uint(2)));
    int _1180 = _1176 & 3;
    float _1182 = (*spvDescriptorSet0.cp_c6)._m0[int(_1178)][_1180];
    float _1184 = fma(_898, _990, _1156);
    float _1186 = fma(_898, _998, _1130);
    float _1188 = fma(_906, _990, _1158);
    float _1190 = fma(_906, _998, _1160);
    float _1192 = fma(_914, _990, _1162);
    float _1194 = fma(_914, _998, _1164);
    float _1196 = fma(_902, _1016, _1150);
    int _1198 = _574 + 40;
    uint _1200 = uint(int(uint(_1198) >> uint(2)));
    uint _1202 = uint(int(uint(int(_1200)) >> uint(2)));
    int _1204 = int(_1200) & 3;
    float _1206 = (*spvDescriptorSet0.cp_c6)._m0[int(_1202)][_1204];
    int _1208 = int(_1200) + 1;
    uint _1210 = uint(int(uint(_1208) >> uint(2)));
    int _1212 = _1208 & 3;
    float _1214 = (*spvDescriptorSet0.cp_c6)._m0[int(_1210)][_1212];
    float _1216 = fma(_910, _1008, _1120);
    float _1218 = fma(_910, _1016, _1152);
    float _1220 = fma(_910, _1026, _1188);
    float _1222 = fma(_910, _1034, _1190);
    float _1224 = fma(_902, _1034, _1186);
    float _1226 = fma(_918, _1034, _1194);
    float _1228 = fma(_898, _950, _1118);
    int _1230 = _574 + 56;
    uint _1232 = uint(int(uint(_1230) >> uint(2)));
    uint _1234 = uint(int(uint(int(_1232)) >> uint(2)));
    int _1236 = int(_1232) & 3;
    float _1238 = (*spvDescriptorSet0.cp_c6)._m0[int(_1234)][_1236];
    int _1240 = int(_1232) + 1;
    uint _1242 = uint(int(uint(_1240) >> uint(2)));
    int _1244 = _1240 & 3;
    float _1246 = (*spvDescriptorSet0.cp_c6)._m0[int(_1242)][_1244];
    float _1248 = _1222 + _912;
    float _1250 = _1224 + _904;
    float _1252 = _1226 + _920;
    float _1254 = fma(_902, _1008, _1228);
    float _1256 = _1248 * _1052;
    float _1258 = fma(_918, _1008, _1122);
    float _1260 = fma(_918, _1016, _1154);
    float _1262 = fma(_902, _1026, _1184);
    float _1264 = fma(_918, _1026, _1192);
    float _1266 = _1218 * _1052;
    float _1268 = _1216 * _1052;
    float _1270 = _1220 * _1052;
    float _1272 = fma(_1250, _1044, _1256);
    float _1274 = fma(_1196, _1044, _1266);
    float _1276 = _1248 * _1116;
    float _1278 = _1216 * _1116;
    float _1280 = _1218 * _1116;
    float _1282 = _1220 * _1116;
    float _1284 = fma(_1250, _1108, _1276);
    int _1286 = _962 * 48;
    float _1288 = fma(_1254, _1044, _1268);
    float _1290 = fma(_1262, _1044, _1270);
    float _1292 = _1248 * _1148;
    float _1294 = _1218 * _1148;
    float _1296 = _1216 * _1148;
    float _1298 = _1220 * _1148;
    float _1300 = fma(_1250, _1140, _1292);
    float _1302 = fma(_1254, _1108, _1278);
    float _1304 = fma(_1196, _1108, _1280);
    float _1306 = fma(_1262, _1108, _1282);
    float _1308 = fma(_1196, _1140, _1294);
    float _1310 = fma(_1252, _1174, _1272);
    float _1312 = fma(_1254, _1140, _1296);
    float _1314 = fma(_1262, _1140, _1298);
    float _1316 = fma(_1260, _1174, _1274);
    float _1318 = fma(_1258, _1174, _1288);
    float _1320 = fma(_1264, _1174, _1290);
    float _1322 = _1310 + _1182;
    int _1324 = _1286 + 16;
    float _1326 = fma(_1252, _1206, _1284);
    float _1328 = fma(_1258, _1206, _1302);
    float _1330 = fma(_1260, _1206, _1304);
    float _1332 = fma(_1264, _1206, _1306);
    float _1334 = _1326 + _1214;
    int _1336 = _1286 + 32;
    int _1338 = _1286 + 48;
    float _1340 = fma(_1252, _1238, _1300);
    float _1342 = fma(_1260, _1238, _1308);
    float _1344 = fma(_1258, _1238, _1312);
    float _1346 = fma(_1264, _1238, _1314);
    float _1348 = _1340 + _1246;
    uint _1350 = uint(int(uint(_1324) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1350)] = as_type<uint>(_1318);
    int _1352 = _1324 + 4;
    uint _1354 = uint(int(uint(_1352) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1354)] = as_type<uint>(_1316);
    int _1356 = _1324 + 8;
    uint _1358 = uint(int(uint(_1356) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1358)] = as_type<uint>(_1320);
    int _1360 = _1324 + 12;
    uint _1362 = uint(int(uint(_1360) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1362)] = as_type<uint>(_1322);
    uint _1364 = uint(int(uint(_1336) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1364)] = as_type<uint>(_1328);
    int _1366 = _1336 + 4;
    uint _1368 = uint(int(uint(_1366) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1368)] = as_type<uint>(_1330);
    int _1370 = _1336 + 8;
    uint _1372 = uint(int(uint(_1370) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1372)] = as_type<uint>(_1332);
    int _1374 = _1336 + 12;
    uint _1376 = uint(int(uint(_1374) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1376)] = as_type<uint>(_1334);
    uint _1378 = uint(int(uint(_1338) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1378)] = as_type<uint>(_1344);
    int _1380 = _1338 + 4;
    uint _1382 = uint(int(uint(_1380) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1382)] = as_type<uint>(_1342);
    int _1384 = _1338 + 8;
    uint _1386 = uint(int(uint(_1384) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1386)] = as_type<uint>(_1346);
    int _1388 = _1338 + 12;
    uint _1390 = uint(int(uint(_1388) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1390)] = as_type<uint>(_1348);
}

