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
    constant _16* cp_c4 [[id(1)]];
    constant _16* cp_c5 [[id(2)]];
    constant _16* cp_c6 [[id(3)]];
    constant _16* cp_c3 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_A [[id(9)]];
    sampler cp_t_tcb_ASmplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _4600, thread const int& _4601, constant _10& support_buffer)
{
    int _4604 = 1 + _4601;
    float _4606 = support_buffer._m5[_4604].x;
    bool _4608 = _4606 == 1.0;
    if (_4608)
    {
        return _4600;
    }
    float _4610 = float(_4600);
    float _4612 = _4610 * _4606;
    int _4614 = int(_4612);
    return _4614;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1374 = false;
    bool _912 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    float _74 = _64;
    if (_72)
    {
        return;
    }
    int _76 = _68 & 31;
    bool _78 = _76 == 0;
    bool _80 = uint(_76) < 32u;
    int _82 = 32 - _76;
    int _84 = _76 - 32;
    int _86 = 1 << _76;
    uint _89 = uint(int(uint(0) >> uint(_82)));
    int _91 = _86 | int(_89);
    int _93 = _78 ? 1 : _91;
    bool _95 = uint(_84) < 32u;
    int _97 = 0 << _84;
    int _99 = _95 ? _97 : 0;
    int _101 = _80 ? _93 : _99;
    int _103 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _105 = _103 + 32;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.cp_c5)._m0[int(_109)][_111];
    int _115 = _101 & as_type<int>(_113);
    bool _117 = _115 != 0;
    float _119 = 0.0;
    float _121 = 0.0;
    if (!_117)
    {
        _119 = 0.0;
        _121 = 0.0;
    }
    float _123 = _119;
    float _125 = _121;
    float _127 = 0.0;
    float _129 = 0.0;
    float _131 = _123;
    float _133 = _125;
    if (!_117)
    {
        _127 = 0.0;
        _129 = 0.0;
    }
    float _135 = _127;
    float _137 = _129;
    float _139 = 0.0;
    float _141 = _135;
    float _143 = _137;
    if (!_117)
    {
        _139 = 0.0;
    }
    float _145 = _139;
    float _147 = 0.0;
    float _149 = _145;
    if (!_117)
    {
        _147 = 0.0;
    }
    float _151 = _147;
    float _153 = 0.0;
    float _155 = _151;
    if (!_117)
    {
        _153 = 0.0;
    }
    float _157 = _153;
    float _159 = 0.0;
    float _161 = _157;
    if (!_117)
    {
        _159 = 0.0;
    }
    float _163 = _159;
    float _165 = 0.0;
    float _167 = _163;
    if (!_117)
    {
        _165 = 0.0;
    }
    float _169 = _165;
    float _171 = _169;
    if (!_117)
    {
        _74 = 0.0;
    }
    float _173 = _74;
    bool _175 = !_117;
    float _177 = _173;
    if (!_175)
    {
        uint _179 = uint(int(uint(_103) >> uint(2)));
        uint _181 = uint(int(uint(int(_179)) >> uint(2)));
        int _183 = int(_179) & 3;
        float _185 = (*spvDescriptorSet0.cp_c5)._m0[int(_181)][_183];
        int _187 = int(_179) + 1;
        uint _189 = uint(int(uint(_187) >> uint(2)));
        int _191 = _187 & 3;
        float _193 = (*spvDescriptorSet0.cp_c5)._m0[int(_189)][_191];
        int _195 = _68;
        int _197 = 0;
        int _199 = _58(_195, _197, (*spvDescriptorSet0.support_buffer));
        int _201 = as_type<int>(_185);
        int _203 = 0;
        int _205 = _58(_201, _203, (*spvDescriptorSet0.support_buffer));
        int3 _2017 = int3(_199, _205, 1);
        float4 _208 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2017.xy), uint(_2017.z), 0).xyzw;
        float _210 = _208.x;
        float _212 = _208.y;
        float _214 = _208.z;
        float _216 = _208.w;
        int _218 = _68;
        int _220 = 0;
        int _222 = _58(_218, _220, (*spvDescriptorSet0.support_buffer));
        int _224 = as_type<int>(_193);
        int _226 = 0;
        int _228 = _58(_224, _226, (*spvDescriptorSet0.support_buffer));
        int3 _2037 = int3(_222, _228, 1);
        float4 _230 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2037.xy), uint(_2037.z), 0).xyzw;
        float _232 = _230.x;
        float _234 = _230.y;
        float _236 = _230.z;
        float _238 = _230.w;
        int _240 = _68;
        int _242 = 0;
        int _244 = _58(_240, _242, (*spvDescriptorSet0.support_buffer));
        int _246 = as_type<int>(_185);
        int _248 = 0;
        int _250 = _58(_246, _248, (*spvDescriptorSet0.support_buffer));
        int3 _2057 = int3(_244, _250, 0);
        float3 _254 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2057.xy), uint(_2057.z), 0).xyz;
        float _256 = _254.x;
        float _258 = _254.y;
        float _260 = _254.z;
        int _262 = _68;
        int _264 = 0;
        int _266 = _58(_262, _264, (*spvDescriptorSet0.support_buffer));
        int _268 = as_type<int>(_193);
        int _270 = 0;
        int _272 = _58(_268, _270, (*spvDescriptorSet0.support_buffer));
        int3 _2075 = int3(_266, _272, 0);
        float3 _274 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2075.xy), uint(_2075.z), 0).xyz;
        float _276 = _274.x;
        float _278 = _274.y;
        float _280 = _274.z;
        int _282 = _68;
        int _284 = 0;
        int _286 = _58(_282, _284, (*spvDescriptorSet0.support_buffer));
        int _288 = as_type<int>(_185);
        int _290 = 0;
        int _292 = _58(_288, _290, (*spvDescriptorSet0.support_buffer));
        int3 _2093 = int3(_286, _292, 2);
        float3 _294 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2093.xy), uint(_2093.z), 0).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        int _302 = _68;
        int _304 = 0;
        int _306 = _58(_302, _304, (*spvDescriptorSet0.support_buffer));
        int _308 = as_type<int>(_193);
        int _310 = 0;
        int _312 = _58(_308, _310, (*spvDescriptorSet0.support_buffer));
        int3 _2111 = int3(_306, _312, 2);
        float3 _314 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2111.xy), uint(_2111.z), 0).xyz;
        float _316 = _314.x;
        float _318 = _314.y;
        float _320 = _314.z;
        int _322 = _103 + 16;
        uint _324 = uint(int(uint(_322) >> uint(2)));
        uint _326 = uint(int(uint(int(_324)) >> uint(2)));
        int _328 = int(_324) & 3;
        float _330 = (*spvDescriptorSet0.cp_c5)._m0[int(_326)][_328];
        float _332 = -_210;
        float _334 = _332 + _232;
        float _336 = -_212;
        float _338 = _336 + _234;
        float _340 = -_214;
        float _342 = _340 + _236;
        float _344 = -_216;
        float _346 = _344 + _238;
        float _348 = -_256;
        float _350 = _348 + _276;
        float _352 = fma(_338, _330, _212);
        float _354 = fma(_342, _330, _214);
        float _356 = fma(_346, _330, _216);
        float _358 = -_258;
        float _360 = _358 + _278;
        float _362 = -_260;
        float _364 = _362 + _280;
        float _366 = -_296;
        float _368 = _366 + _316;
        float _370 = -_298;
        float _372 = _370 + _318;
        float _374 = -_300;
        float _376 = _374 + _320;
        float _378 = fma(_350, _330, _256);
        float _380 = fma(_334, _330, _210);
        float _382 = fma(_360, _330, _258);
        float _384 = fma(_364, _330, _260);
        float _386 = fma(_368, _330, _296);
        float _388 = fma(_372, _330, _298);
        float _390 = fma(_376, _330, _300);
        float _392 = _356 * 2.0;
        _161 = _380;
        _171 = _354;
        _167 = _352;
        _141 = _384;
        _131 = _378;
        _149 = _388;
        _155 = _390;
        _143 = _382;
        _133 = _386;
        _177 = _392;
    }
    float _394 = _161;
    float _396 = _171;
    float _398 = _167;
    float _400 = _141;
    float _402 = _131;
    float _404 = _149;
    float _406 = _155;
    float _408 = _143;
    float _410 = _133;
    float _412 = _177;
    int _414 = _103 + 36;
    uint _416 = uint(int(uint(_414) >> uint(2)));
    uint _418 = uint(int(uint(int(_416)) >> uint(2)));
    int _420 = int(_416) & 3;
    float _422 = (*spvDescriptorSet0.cp_c5)._m0[int(_418)][_420];
    int _424 = _101 & as_type<int>(_422);
    bool _426 = _424 != 0;
    bool _428 = !_426;
    float _430 = _402;
    int _432 = as_type<int>(_404);
    int _434 = as_type<int>(_406);
    float _436 = _400;
    float _438 = _410;
    float _886;
    float _888;
    float _890;
    float _892;
    float _894;
    float _896;
    float _898;
    float _900;
    float _902;
    float _904;
    float _906;
    int _908;
    float _910;
    if (!_428)
    {
        int _440 = _103 + 8;
        uint _442 = uint(int(uint(_440) >> uint(2)));
        uint _444 = uint(int(uint(int(_442)) >> uint(2)));
        int _446 = int(_442) & 3;
        float _448 = (*spvDescriptorSet0.cp_c5)._m0[int(_444)][_446];
        int _450 = int(_442) + 1;
        uint _452 = uint(int(uint(_450) >> uint(2)));
        int _454 = _450 & 3;
        float _456 = (*spvDescriptorSet0.cp_c5)._m0[int(_452)][_454];
        int _458 = _68;
        int _460 = 1;
        int _462 = _58(_458, _460, (*spvDescriptorSet0.support_buffer));
        int _464 = as_type<int>(_448);
        int _466 = 1;
        int _468 = _58(_464, _466, (*spvDescriptorSet0.support_buffer));
        int3 _2329 = int3(_462, _468, 1);
        float3 _470 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2329.xy), uint(_2329.z), 0).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        int _478 = _68;
        int _480 = 1;
        int _482 = _58(_478, _480, (*spvDescriptorSet0.support_buffer));
        int _484 = as_type<int>(_456);
        int _486 = 1;
        int _488 = _58(_484, _486, (*spvDescriptorSet0.support_buffer));
        int3 _2347 = int3(_482, _488, 1);
        float3 _490 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2347.xy), uint(_2347.z), 0).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        int _498 = _68;
        int _500 = 1;
        int _502 = _58(_498, _500, (*spvDescriptorSet0.support_buffer));
        int _504 = as_type<int>(_448);
        int _506 = 1;
        int _508 = _58(_504, _506, (*spvDescriptorSet0.support_buffer));
        int3 _2365 = int3(_502, _508, 0);
        float3 _510 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2365.xy), uint(_2365.z), 0).xyz;
        float _512 = _510.x;
        float _514 = _510.y;
        float _516 = _510.z;
        int _518 = _68;
        int _520 = 1;
        int _522 = _58(_518, _520, (*spvDescriptorSet0.support_buffer));
        int _524 = as_type<int>(_456);
        int _526 = 1;
        int _528 = _58(_524, _526, (*spvDescriptorSet0.support_buffer));
        int3 _2383 = int3(_522, _528, 0);
        float3 _530 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2383.xy), uint(_2383.z), 0).xyz;
        float _532 = _530.x;
        float _534 = _530.y;
        float _536 = _530.z;
        int _538 = _68;
        int _540 = 1;
        int _542 = _58(_538, _540, (*spvDescriptorSet0.support_buffer));
        int _544 = as_type<int>(_448);
        int _546 = 1;
        int _548 = _58(_544, _546, (*spvDescriptorSet0.support_buffer));
        int3 _2401 = int3(_542, _548, 2);
        float3 _550 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2401.xy), uint(_2401.z), 0).xyz;
        float _552 = _550.x;
        float _554 = _550.y;
        float _556 = _550.z;
        int _558 = _68;
        int _560 = 1;
        int _562 = _58(_558, _560, (*spvDescriptorSet0.support_buffer));
        int _564 = as_type<int>(_456);
        int _566 = 1;
        int _568 = _58(_564, _566, (*spvDescriptorSet0.support_buffer));
        int3 _2419 = int3(_562, _568, 2);
        float3 _570 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2419.xy), uint(_2419.z), 0).xyz;
        float _572 = _570.x;
        float _574 = _570.y;
        float _576 = _570.z;
        float _578 = _394 * 0.15915493667125701904296875;
        float _580 = _396 * 0.15915493667125701904296875;
        float _582 = _398 * 0.15915493667125701904296875;
        int _584 = _103 + 24;
        uint _586 = uint(int(uint(_584) >> uint(2)));
        uint _588 = uint(int(uint(int(_586)) >> uint(2)));
        int _590 = int(_586) & 3;
        float _592 = (*spvDescriptorSet0.cp_c5)._m0[int(_588)][_590];
        int _594 = int(_586) + 1;
        uint _596 = uint(int(uint(_594) >> uint(2)));
        int _598 = _594 & 3;
        float _600 = (*spvDescriptorSet0.cp_c5)._m0[int(_596)][_598];
        float _602 = _578 * 6.283185482025146484375;
        float _604 = cos(_602);
        int _606 = _103 + 20;
        uint _608 = uint(int(uint(_606) >> uint(2)));
        uint _610 = uint(int(uint(int(_608)) >> uint(2)));
        int _612 = int(_608) & 3;
        float _614 = (*spvDescriptorSet0.cp_c5)._m0[int(_610)][_612];
        float _616 = _580 * 6.283185482025146484375;
        float _618 = sin(_616);
        float _620 = _580 * 6.283185482025146484375;
        float _622 = cos(_620);
        float _624 = _582 * 6.283185482025146484375;
        float _626 = cos(_624);
        float _628 = _618 * _604;
        float _630 = _578 * 6.283185482025146484375;
        float _632 = sin(_630);
        float _634 = _604 * _622;
        float _636 = _582 * 6.283185482025146484375;
        float _638 = sin(_636);
        float _640 = _604 * _626;
        float _642 = _626 * _622;
        float _644 = _618 * _626;
        float _646 = _632 * _626;
        float _648 = _632 * _618;
        float _650 = _632 * _622;
        float _652 = _632 * _638;
        float _654 = fma(_638, _634, _648);
        float _656 = -_650;
        float _658 = fma(_638, _628, _656);
        float _660 = -_628;
        float _662 = fma(_622, _652, _660);
        float _664 = fma(_618, _652, _634);
        float _666 = -_474;
        float _668 = _666 + _494;
        float _670 = -_476;
        float _672 = _670 + _496;
        float _674 = -_516;
        float _676 = _674 + _536;
        float _678 = fma(_668, _592, _474);
        float _680 = -_472;
        float _682 = _680 + _492;
        float _684 = fma(_672, _592, _476);
        float _686 = -_556;
        float _688 = _686 + _576;
        float _690 = _678 * 0.15915493667125701904296875;
        float _692 = fma(_682, _592, _472);
        float _694 = _684 * 0.15915493667125701904296875;
        float _696 = fma(_676, _592, _516);
        float _698 = _690 * 6.283185482025146484375;
        float _700 = cos(_698);
        float _702 = _692 * 0.15915493667125701904296875;
        float _704 = fma(_688, _592, _556);
        float _706 = _696 * _600;
        float _708 = _694 * 6.283185482025146484375;
        float _710 = sin(_708);
        float _712 = _694 * 6.283185482025146484375;
        float _714 = cos(_712);
        float _716 = _702 * 6.283185482025146484375;
        float _718 = cos(_716);
        float _720 = _710 * _700;
        float _722 = _690 * 6.283185482025146484375;
        float _724 = sin(_722);
        float _726 = _700 * _714;
        float _728 = _726 * _600;
        float _730 = _702 * 6.283185482025146484375;
        float _732 = sin(_730);
        float _734 = _718 * _714;
        float _736 = _710 * _718;
        float _738 = _718 * _700;
        float _740 = fma(_642, _614, _728);
        float _742 = _732 * _724;
        float _744 = _732 * _700;
        float _746 = _732 * _710;
        float _748 = _732 * _714;
        float _750 = _638 * _614;
        float _752 = -_736;
        float _754 = fma(_714, _742, _752);
        float _756 = _720 * _600;
        float _758 = fma(_710, _742, _734);
        float _760 = -_724;
        float _762 = -_750;
        float _764 = fma(_760, _600, _762);
        float _766 = _754 * _600;
        float _768 = -_748;
        float _770 = fma(_724, _736, _768);
        float _772 = fma(_644, _614, _756);
        float _774 = _758 * _600;
        float _776 = fma(_724, _734, _746);
        float _778 = fma(_662, _614, _766);
        float _780 = _772 * _772;
        float _782 = _770 * _600;
        float _784 = fma(_664, _614, _774);
        float _786 = _776 * _600;
        float _788 = fma(_740, _740, _780);
        float _790 = fma(_658, _614, _782);
        float _792 = _744 * _600;
        float _794 = fma(_654, _614, _786);
        float _796 = fma(_764, _764, _788);
        float _798 = _738 * _600;
        float _800 = _790 * _790;
        float _802 = _784 * _784;
        float _804 = fma(_646, _614, _792);
        float _806 = fma(_640, _614, _798);
        float _808 = fma(_794, _794, _800);
        float _810 = rsqrt(_796);
        float _812 = fma(_778, _778, _802);
        float _814 = -_512;
        float _816 = _814 + _532;
        float _818 = fma(_806, _806, _808);
        float _820 = -_514;
        float _822 = _820 + _534;
        float _824 = fma(_804, _804, _812);
        float _826 = -_554;
        float _828 = _826 + _574;
        float _830 = fma(_816, _592, _512);
        float _832 = fma(_822, _592, _514);
        float _834 = rsqrt(_818);
        float _836 = fma(_828, _592, _554);
        float _838 = _830 * _600;
        float _840 = fma(_400, _614, _706);
        float _842 = _836 * _600;
        float _844 = fma(_402, _614, _838);
        float _846 = _772 * _810;
        float _848 = rsqrt(_824);
        float _850 = -_552;
        float _852 = _850 + _572;
        float _854 = _740 * _810;
        float _856 = _764 * _810;
        float _858 = fma(_404, _614, _842);
        float _860 = fma(_852, _592, _552);
        float _862 = _704 * _600;
        float _864 = _790 * _834;
        float _866 = _832 * _600;
        float _868 = _860 * _600;
        float _870 = _806 * _834;
        float _872 = fma(_406, _614, _862);
        float _874 = fma(_408, _614, _866);
        float _876 = fma(_410, _614, _868);
        float _878 = _778 * _848;
        float _880 = _784 * _848;
        float _882 = _804 * _848;
        float _884 = _794 * _834;
        _430 = _844;
        _886 = _854;
        _888 = _846;
        _890 = _856;
        _892 = _874;
        _894 = _878;
        _896 = _880;
        _898 = _882;
        _900 = _840;
        _902 = _884;
        _904 = _864;
        _906 = _870;
        _908 = as_type<int>(_876);
        _432 = as_type<int>(_858);
        _434 = as_type<int>(_872);
        _910 = _862;
        _912 = true;
    }
    else
    {
        float _914 = _394 * 2.0;
        float _916 = _396 * _412;
        float _918 = _398 * _412;
        float _920 = _398 * _398;
        float _922 = -_916;
        float _924 = fma(_914, _398, _922);
        float _926 = fma(_914, _398, _916);
        float _928 = _394 * _412;
        float _930 = _394 * _394;
        float _932 = fma(_914, _396, _918);
        float _934 = -_918;
        float _936 = fma(_914, _396, _934);
        float _938 = _398 * 2.0;
        float _940 = _396 * _396;
        float _942 = fma(_920, -2.0, 1.0);
        float _944 = fma(_930, -2.0, 1.0);
        float _946 = -_928;
        float _948 = fma(_938, _396, _946);
        float _950 = fma(_938, _396, _928);
        float _952 = fma(_940, -2.0, _942);
        float _954 = fma(_940, -2.0, _944);
        float _956 = fma(_920, -2.0, _944);
        _886 = _952;
        _888 = _926;
        _890 = _936;
        _892 = _408;
        _894 = _924;
        _896 = _954;
        _898 = _950;
        _900 = _400;
        _902 = _932;
        _904 = _948;
        _906 = _956;
        _908 = as_type<int>(_410);
        _910 = _938;
    }
    _912 = false;
    float _958 = _430;
    float _960 = _886;
    float _962 = _888;
    float _964 = _890;
    float _966 = _892;
    float _968 = _894;
    float _970 = _896;
    float _972 = _898;
    float _974 = _900;
    float _976 = _902;
    float _978 = _904;
    float _980 = _906;
    int _982 = _908;
    int _984 = _432;
    int _986 = _434;
    float _988 = _910;
    float _990 = _958 * _960;
    float _992 = _958 * _962;
    float _994 = _958 * _964;
    float _996 = _966 * _968;
    float _998 = _966 * _970;
    float _1000 = _966 * _972;
    int _1002 = _68 * 48;
    float _1004 = _974 * _976;
    float _1006 = _974 * _978;
    float _1008 = _974 * _980;
    int _1010 = _68 * 112;
    uint _1012 = uint(int(uint(_1002) >> uint(2)));
    _39[int(_1012)] = as_type<uint>(_990);
    int _1014 = _1002 + 4;
    uint _1016 = uint(int(uint(_1014) >> uint(2)));
    _39[int(_1016)] = as_type<uint>(_996);
    int _1018 = _1002 + 8;
    uint _1020 = uint(int(uint(_1018) >> uint(2)));
    _39[int(_1020)] = as_type<uint>(_1004);
    int _1022 = _1002 + 12;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    _39[int(_1024)] = uint(_982);
    bool _1026 = _68 != 0;
    bool _1028 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1030 = _1002 + 16;
    uint _1032 = uint(int(uint(_1030) >> uint(2)));
    _39[int(_1032)] = as_type<uint>(_992);
    int _1034 = _1002 + 20;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    _39[int(_1036)] = as_type<uint>(_998);
    int _1038 = _1002 + 24;
    uint _1040 = uint(int(uint(_1038) >> uint(2)));
    _39[int(_1040)] = as_type<uint>(_1006);
    int _1042 = _1002 + 28;
    uint _1044 = uint(int(uint(_1042) >> uint(2)));
    _39[int(_1044)] = uint(_984);
    int _1046 = _1002 + 32;
    uint _1048 = uint(int(uint(_1046) >> uint(2)));
    _39[int(_1048)] = as_type<uint>(_994);
    int _1050 = _1002 + 36;
    uint _1052 = uint(int(uint(_1050) >> uint(2)));
    _39[int(_1052)] = as_type<uint>(_1000);
    int _1054 = _1002 + 40;
    uint _1056 = uint(int(uint(_1054) >> uint(2)));
    _39[int(_1056)] = as_type<uint>(_1008);
    int _1058 = _1002 + 44;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    _39[int(_1060)] = uint(_986);
    float _1062 = _958;
    float _1064 = _974;
    float _1066 = _988;
    float _1068 = (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _1070 = _1000;
    float _1072 = _994;
    float _1074 = _1006;
    float _1076 = _1008;
    float _1078 = as_type<float>(_984);
    float _1080 = as_type<float>(_986);
    if (!_1026)
    {
        _436 = _990;
    }
    float _1082 = _436;
    float _1084 = _1082;
    if (!_1026)
    {
        _1062 = _996;
    }
    float _1086 = _1062;
    float _1088 = _1086;
    if (!_1026)
    {
        _438 = _1004;
    }
    float _1090 = _438;
    float _1092 = _1090;
    if (!_1026)
    {
        _1064 = as_type<float>(_982);
    }
    float _1094 = _1064;
    float _1096 = _1094;
    if (!_1026)
    {
        _1066 = _992;
    }
    float _1098 = _1066;
    float _1100 = _1098;
    if (!_1026)
    {
        _1068 = _998;
    }
    float _1102 = _1068;
    float _1104 = _1102;
    if (!_1028)
    {
        int _1106 = _68 * 48;
        int _1108 = _1106 + 16;
        uint _1110 = uint(int(uint(_1106) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1110)] = as_type<uint>(_990);
        int _1112 = _1106 + 4;
        uint _1114 = uint(int(uint(_1112) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1114)] = as_type<uint>(_996);
        int _1116 = _1106 + 8;
        uint _1118 = uint(int(uint(_1116) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1118)] = as_type<uint>(_1004);
        int _1120 = _1106 + 12;
        uint _1122 = uint(int(uint(_1120) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1122)] = uint(_982);
        int _1124 = _1106 + 32;
        uint _1126 = uint(int(uint(_1108) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1126)] = as_type<uint>(_992);
        int _1128 = _1108 + 4;
        uint _1130 = uint(int(uint(_1128) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1130)] = as_type<uint>(_998);
        int _1132 = _1108 + 8;
        uint _1134 = uint(int(uint(_1132) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1134)] = as_type<uint>(_1006);
        int _1136 = _1108 + 12;
        uint _1138 = uint(int(uint(_1136) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1138)] = uint(_984);
        uint _1140 = uint(int(uint(_1124) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1140)] = as_type<uint>(_994);
        int _1142 = _1124 + 4;
        uint _1144 = uint(int(uint(_1142) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1144)] = as_type<uint>(_1000);
        int _1146 = _1124 + 8;
        uint _1148 = uint(int(uint(_1146) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1148)] = as_type<uint>(_1008);
        int _1150 = _1124 + 12;
        uint _1152 = uint(int(uint(_1150) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1152)] = uint(_986);
    }
    bool _1154 = !_1026;
    if (!_1154)
    {
        bool _1156 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1158 = !_1156;
        if (!_1158)
        {
            uint _1160 = uint(int(uint(_1010) >> uint(2)));
            uint _1162 = uint(int(uint(int(_1160)) >> uint(2)));
            int _1164 = int(_1160) & 3;
            float _1166 = (*spvDescriptorSet0.cp_c6)._m0[int(_1162)][_1164];
            int _1168 = as_type<int>(_1166) * 48;
            int _1170 = 0;
            bool _1172;
            float _1268;
            float _1272;
            float _1276;
            float _1280;
            float _1294;
            float _1296;
            float _1308;
            float _1318;
            float _1320;
            float _1322;
            float _1324;
            float _1326;
            do
            {
                int _1174 = _1170;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1176 = uint(int(uint(_1168) >> uint(2)));
                float _1178 = as_type<float>(_39[int(_1176)]);
                int _1180 = _1168 + 4;
                uint _1182 = uint(int(uint(_1180) >> uint(2)));
                float _1184 = as_type<float>(_39[int(_1182)]);
                int _1186 = _1168 + 8;
                uint _1188 = uint(int(uint(_1186) >> uint(2)));
                float _1190 = as_type<float>(_39[int(_1188)]);
                int _1192 = _1168 + 12;
                uint _1194 = uint(int(uint(_1192) >> uint(2)));
                float _1196 = as_type<float>(_39[int(_1194)]);
                int _1198 = _1174 + 1;
                int _1200 = _1168 + 16;
                uint _1202 = uint(int(uint(_1200) >> uint(2)));
                float _1204 = as_type<float>(_39[int(_1202)]);
                int _1206 = _1168 + 20;
                uint _1208 = uint(int(uint(_1206) >> uint(2)));
                float _1210 = as_type<float>(_39[int(_1208)]);
                int _1212 = _1168 + 24;
                uint _1214 = uint(int(uint(_1212) >> uint(2)));
                float _1216 = as_type<float>(_39[int(_1214)]);
                int _1218 = _1168 + 28;
                uint _1220 = uint(int(uint(_1218) >> uint(2)));
                float _1222 = as_type<float>(_39[int(_1220)]);
                bool _1224 = uint(_1198) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1226 = _1168 + 32;
                uint _1228 = uint(int(uint(_1226) >> uint(2)));
                float _1230 = as_type<float>(_39[int(_1228)]);
                int _1232 = _1168 + 36;
                uint _1234 = uint(int(uint(_1232) >> uint(2)));
                float _1236 = as_type<float>(_39[int(_1234)]);
                int _1238 = _1168 + 40;
                uint _1240 = uint(int(uint(_1238) >> uint(2)));
                float _1242 = as_type<float>(_39[int(_1240)]);
                int _1244 = _1168 + 44;
                uint _1246 = uint(int(uint(_1244) >> uint(2)));
                float _1248 = as_type<float>(_39[int(_1246)]);
                float _1250 = _1184 * as_type<float>(_984);
                float _1252 = _992 * _1184;
                float _1254 = _998 * _1184;
                float _1256 = _1006 * _1184;
                float _1258 = fma(_1178, as_type<float>(_982), _1250);
                float _1260 = fma(_990, _1178, _1252);
                float _1262 = fma(_996, _1178, _1254);
                float _1264 = fma(_1004, _1178, _1256);
                float _1266 = fma(_1190, as_type<float>(_986), _1258);
                _1268 = fma(_994, _1190, _1260);
                float _1270 = _992 * _1210;
                _1272 = fma(_1008, _1190, _1264);
                float _1274 = _1210 * as_type<float>(_984);
                _1276 = _1196 + _1266;
                float _1278 = _998 * _1210;
                _1280 = fma(_1000, _1190, _1262);
                float _1282 = fma(_1204, as_type<float>(_982), _1274);
                float _1284 = fma(_990, _1204, _1270);
                float _1286 = fma(_996, _1204, _1278);
                float _1288 = _1006 * _1210;
                float _1290 = fma(_1216, as_type<float>(_986), _1282);
                float _1292 = _1236 * as_type<float>(_984);
                _1294 = fma(_994, _1216, _1284);
                _1296 = fma(_1000, _1216, _1286);
                float _1298 = _992 * _1236;
                float _1300 = _998 * _1236;
                float _1302 = _1006 * _1236;
                float _1304 = fma(_1230, as_type<float>(_982), _1292);
                float _1306 = fma(_1004, _1204, _1288);
                _1308 = _1222 + _1290;
                float _1310 = fma(_990, _1230, _1298);
                float _1312 = fma(_996, _1230, _1300);
                float _1314 = fma(_1004, _1230, _1302);
                float _1316 = fma(_1242, as_type<float>(_986), _1304);
                _1318 = fma(_1008, _1216, _1306);
                _1320 = fma(_994, _1242, _1310);
                _1322 = fma(_1000, _1242, _1312);
                _1324 = fma(_1008, _1242, _1314);
                _1326 = _1248 + _1316;
                uint _1328 = uint(int(uint(_1002) >> uint(2)));
                _39[int(_1328)] = as_type<uint>(_1268);
                int _1330 = _1002 + 4;
                uint _1332 = uint(int(uint(_1330) >> uint(2)));
                _39[int(_1332)] = as_type<uint>(_1280);
                int _1334 = _1002 + 8;
                uint _1336 = uint(int(uint(_1334) >> uint(2)));
                _39[int(_1336)] = as_type<uint>(_1272);
                int _1338 = _1002 + 12;
                uint _1340 = uint(int(uint(_1338) >> uint(2)));
                _39[int(_1340)] = as_type<uint>(_1276);
                int _1342 = _1002 + 16;
                uint _1344 = uint(int(uint(_1342) >> uint(2)));
                _39[int(_1344)] = as_type<uint>(_1294);
                int _1346 = _1002 + 20;
                uint _1348 = uint(int(uint(_1346) >> uint(2)));
                _39[int(_1348)] = as_type<uint>(_1296);
                int _1350 = _1002 + 24;
                uint _1352 = uint(int(uint(_1350) >> uint(2)));
                _39[int(_1352)] = as_type<uint>(_1318);
                int _1354 = _1002 + 28;
                uint _1356 = uint(int(uint(_1354) >> uint(2)));
                _39[int(_1356)] = as_type<uint>(_1308);
                int _1358 = _1002 + 32;
                uint _1360 = uint(int(uint(_1358) >> uint(2)));
                _39[int(_1360)] = as_type<uint>(_1320);
                int _1362 = _1002 + 36;
                uint _1364 = uint(int(uint(_1362) >> uint(2)));
                _39[int(_1364)] = as_type<uint>(_1322);
                int _1366 = _1002 + 40;
                uint _1368 = uint(int(uint(_1366) >> uint(2)));
                _39[int(_1368)] = as_type<uint>(_1324);
                int _1370 = _1002 + 44;
                uint _1372 = uint(int(uint(_1370) >> uint(2)));
                _39[int(_1372)] = as_type<uint>(_1326);
                _1172 = !_1224;
                _1170 = _1198;
            } while (_1172);
            _1104 = _1296;
            _1070 = _1322;
            _1088 = _1280;
            _1100 = _1294;
            _1072 = _1320;
            _1084 = _1268;
            _1074 = _1318;
            _1092 = _1272;
            _1076 = _1324;
            _1078 = _1308;
            _1096 = _1276;
            _1080 = _1326;
            _1374 = true;
        }
        else
        {
            _1104 = 0.0;
            _1070 = 0.0;
            _1088 = 0.0;
            _1100 = 0.0;
            _1072 = 0.0;
            _1084 = 0.0;
            _1074 = 0.0;
            _1092 = 0.0;
            _1076 = 0.0;
            _1078 = 0.0;
            _1096 = 0.0;
            _1080 = 0.0;
        }
    }
    _1374 = false;
    float _1376 = _1104;
    float _1378 = _1070;
    float _1380 = _1088;
    float _1382 = _1100;
    float _1384 = _1072;
    float _1386 = _1084;
    float _1388 = _1074;
    float _1390 = _1092;
    float _1392 = _1076;
    float _1394 = _1078;
    float _1396 = _1096;
    float _1398 = _1080;
    int _1400 = _1010 + 80;
    uint _1402 = uint(int(uint(_1400) >> uint(2)));
    uint _1404 = uint(int(uint(int(_1402)) >> uint(2)));
    int _1406 = int(_1402) & 3;
    float _1408 = (*spvDescriptorSet0.cp_c6)._m0[int(_1404)][_1406];
    int _1410 = int(_1402) + 1;
    uint _1412 = uint(int(uint(_1410) >> uint(2)));
    int _1414 = _1410 & 3;
    float _1416 = (*spvDescriptorSet0.cp_c6)._m0[int(_1412)][_1414];
    int _1418 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1420 = _1418 + _68;
    int _1422 = _1010 + 64;
    uint _1424 = uint(int(uint(_1422) >> uint(2)));
    uint _1426 = uint(int(uint(int(_1424)) >> uint(2)));
    int _1428 = int(_1424) & 3;
    float _1430 = (*spvDescriptorSet0.cp_c6)._m0[int(_1426)][_1428];
    int _1432 = int(_1424) + 1;
    uint _1434 = uint(int(uint(_1432) >> uint(2)));
    int _1436 = _1432 & 3;
    float _1438 = (*spvDescriptorSet0.cp_c6)._m0[int(_1434)][_1436];
    int _1440 = _1420 * 48;
    int _1442 = _1010 + 88;
    uint _1444 = uint(int(uint(_1442) >> uint(2)));
    uint _1446 = uint(int(uint(int(_1444)) >> uint(2)));
    int _1448 = int(_1444) & 3;
    float _1450 = (*spvDescriptorSet0.cp_c6)._m0[int(_1446)][_1448];
    int _1452 = int(_1444) + 1;
    uint _1454 = uint(int(uint(_1452) >> uint(2)));
    int _1456 = _1452 & 3;
    float _1458 = (*spvDescriptorSet0.cp_c6)._m0[int(_1454)][_1456];
    int _1460 = _1010 + 72;
    uint _1462 = uint(int(uint(_1460) >> uint(2)));
    uint _1464 = uint(int(uint(int(_1462)) >> uint(2)));
    int _1466 = int(_1462) & 3;
    float _1468 = (*spvDescriptorSet0.cp_c6)._m0[int(_1464)][_1466];
    int _1470 = int(_1462) + 1;
    uint _1472 = uint(int(uint(_1470) >> uint(2)));
    int _1474 = _1470 & 3;
    float _1476 = (*spvDescriptorSet0.cp_c6)._m0[int(_1472)][_1474];
    int _1478 = _1010 + 96;
    uint _1480 = uint(int(uint(_1478) >> uint(2)));
    uint _1482 = uint(int(uint(int(_1480)) >> uint(2)));
    int _1484 = int(_1480) & 3;
    float _1486 = (*spvDescriptorSet0.cp_c6)._m0[int(_1482)][_1484];
    int _1488 = int(_1480) + 1;
    uint _1490 = uint(int(uint(_1488) >> uint(2)));
    int _1492 = _1488 & 3;
    float _1494 = (*spvDescriptorSet0.cp_c6)._m0[int(_1490)][_1492];
    int _1496 = _1010 + 104;
    uint _1498 = uint(int(uint(_1496) >> uint(2)));
    uint _1500 = uint(int(uint(int(_1498)) >> uint(2)));
    int _1502 = int(_1498) & 3;
    float _1504 = (*spvDescriptorSet0.cp_c6)._m0[int(_1500)][_1502];
    int _1506 = int(_1498) + 1;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    int _1510 = _1506 & 3;
    float _1512 = (*spvDescriptorSet0.cp_c6)._m0[int(_1508)][_1510];
    float _1514 = _1376 * _1408;
    float _1516 = _1378 * _1408;
    int _1518 = _1010 + 16;
    uint _1520 = uint(int(uint(_1518) >> uint(2)));
    uint _1522 = uint(int(uint(int(_1520)) >> uint(2)));
    int _1524 = int(_1520) & 3;
    float _1526 = (*spvDescriptorSet0.cp_c6)._m0[int(_1522)][_1524];
    int _1528 = int(_1520) + 1;
    uint _1530 = uint(int(uint(_1528) >> uint(2)));
    int _1532 = _1528 & 3;
    float _1534 = (*spvDescriptorSet0.cp_c6)._m0[int(_1530)][_1532];
    float _1536 = _1380 * _1408;
    float _1538 = fma(_1382, _1430, _1514);
    float _1540 = _1380 * _1416;
    int _1542 = _1010 + 32;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    uint _1546 = uint(int(uint(int(_1544)) >> uint(2)));
    int _1548 = int(_1544) & 3;
    float _1550 = (*spvDescriptorSet0.cp_c6)._m0[int(_1546)][_1548];
    int _1552 = int(_1544) + 1;
    uint _1554 = uint(int(uint(_1552) >> uint(2)));
    int _1556 = _1552 & 3;
    float _1558 = (*spvDescriptorSet0.cp_c6)._m0[int(_1554)][_1556];
    float _1560 = fma(_1384, _1430, _1516);
    float _1562 = _1376 * _1416;
    float _1564 = fma(_1386, _1438, _1540);
    float _1566 = _1378 * _1416;
    float _1568 = fma(_1386, _1430, _1536);
    float _1570 = _1380 * _1450;
    float _1572 = _1380 * _1458;
    int _1574 = _1010 + 48;
    uint _1576 = uint(int(uint(_1574) >> uint(2)));
    uint _1578 = uint(int(uint(int(_1576)) >> uint(2)));
    int _1580 = int(_1576) & 3;
    float _1582 = (*spvDescriptorSet0.cp_c6)._m0[int(_1578)][_1580];
    int _1584 = int(_1576) + 1;
    uint _1586 = uint(int(uint(_1584) >> uint(2)));
    int _1588 = _1584 & 3;
    float _1590 = (*spvDescriptorSet0.cp_c6)._m0[int(_1586)][_1588];
    float _1592 = _1376 * _1450;
    float _1594 = _1376 * _1458;
    float _1596 = _1378 * _1450;
    float _1598 = _1378 * _1458;
    float _1600 = fma(_1382, _1438, _1562);
    float _1602 = fma(_1384, _1438, _1566);
    float _1604 = fma(_1386, _1468, _1570);
    int _1606 = _1010 + 24;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    uint _1610 = uint(int(uint(int(_1608)) >> uint(2)));
    int _1612 = int(_1608) & 3;
    float _1614 = (*spvDescriptorSet0.cp_c6)._m0[int(_1610)][_1612];
    int _1616 = int(_1608) + 1;
    uint _1618 = uint(int(uint(_1616) >> uint(2)));
    int _1620 = _1616 & 3;
    float _1622 = (*spvDescriptorSet0.cp_c6)._m0[int(_1618)][_1620];
    float _1624 = fma(_1386, _1476, _1572);
    float _1626 = fma(_1382, _1468, _1592);
    float _1628 = fma(_1382, _1476, _1594);
    float _1630 = fma(_1384, _1468, _1596);
    float _1632 = fma(_1384, _1476, _1598);
    float _1634 = fma(_1388, _1486, _1538);
    float _1636 = fma(_1388, _1494, _1600);
    int _1638 = _1010 + 40;
    uint _1640 = uint(int(uint(_1638) >> uint(2)));
    uint _1642 = uint(int(uint(int(_1640)) >> uint(2)));
    int _1644 = int(_1640) & 3;
    float _1646 = (*spvDescriptorSet0.cp_c6)._m0[int(_1642)][_1644];
    int _1648 = int(_1640) + 1;
    uint _1650 = uint(int(uint(_1648) >> uint(2)));
    int _1652 = _1648 & 3;
    float _1654 = (*spvDescriptorSet0.cp_c6)._m0[int(_1650)][_1652];
    float _1656 = fma(_1390, _1494, _1564);
    float _1658 = fma(_1392, _1486, _1560);
    float _1660 = fma(_1392, _1494, _1602);
    float _1662 = fma(_1390, _1486, _1568);
    float _1664 = fma(_1388, _1504, _1626);
    float _1666 = fma(_1388, _1512, _1628);
    int _1668 = _1010 + 56;
    uint _1670 = uint(int(uint(_1668) >> uint(2)));
    uint _1672 = uint(int(uint(int(_1670)) >> uint(2)));
    int _1674 = int(_1670) & 3;
    float _1676 = (*spvDescriptorSet0.cp_c6)._m0[int(_1672)][_1674];
    int _1678 = int(_1670) + 1;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    int _1682 = _1678 & 3;
    float _1684 = (*spvDescriptorSet0.cp_c6)._m0[int(_1680)][_1682];
    float _1686 = fma(_1390, _1512, _1624);
    float _1688 = fma(_1392, _1512, _1632);
    float _1690 = _1666 + _1394;
    float _1692 = fma(_1392, _1504, _1630);
    float _1694 = _1686 + _1396;
    float _1696 = fma(_1390, _1504, _1604);
    float _1698 = _1688 + _1398;
    float _1700 = _1690 * _1534;
    float _1702 = _1636 * _1534;
    float _1704 = _1664 * _1534;
    float _1706 = _1634 * _1534;
    float _1708 = fma(_1694, _1526, _1700);
    float _1710 = fma(_1656, _1526, _1702);
    float _1712 = fma(_1696, _1526, _1704);
    float _1714 = fma(_1662, _1526, _1706);
    float _1716 = _1690 * _1558;
    float _1718 = _1634 * _1558;
    float _1720 = _1636 * _1558;
    float _1722 = _1664 * _1558;
    float _1724 = fma(_1694, _1550, _1716);
    float _1726 = fma(_1662, _1550, _1718);
    float _1728 = fma(_1656, _1550, _1720);
    float _1730 = fma(_1696, _1550, _1722);
    float _1732 = _1690 * _1590;
    float _1734 = _1636 * _1590;
    float _1736 = _1634 * _1590;
    float _1738 = _1664 * _1590;
    float _1740 = fma(_1694, _1582, _1732);
    float _1742 = fma(_1656, _1582, _1734);
    float _1744 = fma(_1662, _1582, _1736);
    float _1746 = fma(_1696, _1582, _1738);
    float _1748 = fma(_1698, _1614, _1708);
    float _1750 = fma(_1660, _1614, _1710);
    float _1752 = fma(_1692, _1614, _1712);
    float _1754 = fma(_1658, _1614, _1714);
    float _1756 = _1748 + _1622;
    int _1758 = _1440 + 16;
    int _1760 = _1440 + 32;
    float _1762 = fma(_1698, _1646, _1724);
    float _1764 = fma(_1658, _1646, _1726);
    float _1766 = fma(_1660, _1646, _1728);
    float _1768 = fma(_1692, _1646, _1730);
    float _1770 = _1762 + _1654;
    int _1772 = _1440 + 48;
    uint _1774 = uint(int(uint(_1758) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1774)] = as_type<uint>(_1754);
    int _1776 = _1758 + 4;
    uint _1778 = uint(int(uint(_1776) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1778)] = as_type<uint>(_1750);
    int _1780 = _1758 + 8;
    uint _1782 = uint(int(uint(_1780) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1782)] = as_type<uint>(_1752);
    int _1784 = _1758 + 12;
    uint _1786 = uint(int(uint(_1784) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1786)] = as_type<uint>(_1756);
    float _1788 = fma(_1698, _1676, _1740);
    float _1790 = fma(_1658, _1676, _1744);
    float _1792 = fma(_1660, _1676, _1742);
    float _1794 = fma(_1692, _1676, _1746);
    float _1796 = _1788 + _1684;
    uint _1798 = uint(int(uint(_1760) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1798)] = as_type<uint>(_1764);
    int _1800 = _1760 + 4;
    uint _1802 = uint(int(uint(_1800) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1802)] = as_type<uint>(_1766);
    int _1804 = _1760 + 8;
    uint _1806 = uint(int(uint(_1804) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1806)] = as_type<uint>(_1768);
    int _1808 = _1760 + 12;
    uint _1810 = uint(int(uint(_1808) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1810)] = as_type<uint>(_1770);
    uint _1812 = uint(int(uint(_1772) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1812)] = as_type<uint>(_1790);
    int _1814 = _1772 + 4;
    uint _1816 = uint(int(uint(_1814) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1816)] = as_type<uint>(_1792);
    int _1818 = _1772 + 8;
    uint _1820 = uint(int(uint(_1818) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1820)] = as_type<uint>(_1794);
    int _1822 = _1772 + 12;
    uint _1824 = uint(int(uint(_1822) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1824)] = as_type<uint>(_1796);
}

