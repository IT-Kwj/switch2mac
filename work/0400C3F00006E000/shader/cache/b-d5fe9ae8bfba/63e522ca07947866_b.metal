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
int _58(thread const int& _4650, thread const int& _4651, constant _10& support_buffer)
{
    int _4654 = 1 + _4651;
    float _4656 = support_buffer._m5[_4654].x;
    bool _4658 = _4656 == 1.0;
    if (_4658)
    {
        return _4650;
    }
    float _4660 = float(_4650);
    float _4662 = _4660 * _4656;
    int _4664 = int(_4662);
    return _4664;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1348 = false;
    bool _910 = false;
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
    float _129 = _123;
    float _131 = _125;
    if (!_117)
    {
        _127 = 0.0;
    }
    float _133 = _127;
    float _135 = 0.0;
    float _137 = 0.0;
    float _139 = _133;
    if (!_117)
    {
        _135 = 0.0;
        _137 = 0.0;
    }
    float _141 = _135;
    float _143 = _137;
    float _145 = 0.0;
    float _147 = 0.0;
    float _149 = _143;
    float _151 = _141;
    if (!_117)
    {
        _145 = 0.0;
        _147 = 0.0;
    }
    float _153 = _145;
    float _155 = _147;
    float _157 = 0.0;
    float _159 = _153;
    float _161 = _155;
    if (!_117)
    {
        _157 = 0.0;
    }
    float _163 = _157;
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
        int3 _2031 = int3(_199, _205, 1);
        float4 _208 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2031.xy), uint(_2031.z), 0).xyzw;
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
        int3 _2051 = int3(_222, _228, 1);
        float4 _230 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2051.xy), uint(_2051.z), 0).xyzw;
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
        int3 _2071 = int3(_244, _250, 0);
        float3 _254 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2071.xy), uint(_2071.z), 0).xyz;
        float _256 = _254.x;
        float _258 = _254.y;
        float _260 = _254.z;
        int _262 = _68;
        int _264 = 0;
        int _266 = _58(_262, _264, (*spvDescriptorSet0.support_buffer));
        int _268 = as_type<int>(_193);
        int _270 = 0;
        int _272 = _58(_268, _270, (*spvDescriptorSet0.support_buffer));
        int3 _2089 = int3(_266, _272, 0);
        float3 _274 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2089.xy), uint(_2089.z), 0).xyz;
        float _276 = _274.x;
        float _278 = _274.y;
        float _280 = _274.z;
        int _282 = _68;
        int _284 = 0;
        int _286 = _58(_282, _284, (*spvDescriptorSet0.support_buffer));
        int _288 = as_type<int>(_185);
        int _290 = 0;
        int _292 = _58(_288, _290, (*spvDescriptorSet0.support_buffer));
        int3 _2107 = int3(_286, _292, 2);
        float3 _294 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2107.xy), uint(_2107.z), 0).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        int _302 = _68;
        int _304 = 0;
        int _306 = _58(_302, _304, (*spvDescriptorSet0.support_buffer));
        int _308 = as_type<int>(_193);
        int _310 = 0;
        int _312 = _58(_308, _310, (*spvDescriptorSet0.support_buffer));
        int3 _2125 = int3(_306, _312, 2);
        float3 _314 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2125.xy), uint(_2125.z), 0).xyz;
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
        float _348 = -_260;
        float _350 = _348 + _280;
        float _352 = -_256;
        float _354 = _352 + _276;
        float _356 = fma(_342, _330, _214);
        float _358 = fma(_346, _330, _216);
        float _360 = -_258;
        float _362 = _360 + _278;
        float _364 = -_296;
        float _366 = _364 + _316;
        float _368 = -_298;
        float _370 = _368 + _318;
        float _372 = -_300;
        float _374 = _372 + _320;
        float _376 = fma(_350, _330, _260);
        float _378 = fma(_334, _330, _210);
        float _380 = fma(_338, _330, _212);
        float _382 = fma(_354, _330, _256);
        float _384 = fma(_362, _330, _258);
        float _386 = fma(_366, _330, _296);
        float _388 = fma(_370, _330, _298);
        float _390 = fma(_374, _330, _300);
        float _392 = _358 * 2.0;
        _129 = _378;
        _171 = _356;
        _167 = _380;
        _159 = _390;
        _131 = _382;
        _139 = _384;
        _161 = _388;
        _149 = _376;
        _151 = _386;
        _177 = _392;
    }
    float _394 = _129;
    float _396 = _171;
    float _398 = _167;
    float _400 = _159;
    float _402 = _131;
    float _404 = _139;
    float _406 = _161;
    float _408 = _149;
    float _410 = _151;
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
    float _432 = _400;
    float _434 = _406;
    float _882;
    float _884;
    float _886;
    float _888;
    float _890;
    float _892;
    float _894;
    float _896;
    float _898;
    float _900;
    float _902;
    int _904;
    int _906;
    int _908;
    if (!_428)
    {
        int _436 = _103 + 8;
        uint _438 = uint(int(uint(_436) >> uint(2)));
        uint _440 = uint(int(uint(int(_438)) >> uint(2)));
        int _442 = int(_438) & 3;
        float _444 = (*spvDescriptorSet0.cp_c5)._m0[int(_440)][_442];
        int _446 = int(_438) + 1;
        uint _448 = uint(int(uint(_446) >> uint(2)));
        int _450 = _446 & 3;
        float _452 = (*spvDescriptorSet0.cp_c5)._m0[int(_448)][_450];
        int _454 = _68;
        int _456 = 1;
        int _458 = _58(_454, _456, (*spvDescriptorSet0.support_buffer));
        int _460 = as_type<int>(_444);
        int _462 = 1;
        int _464 = _58(_460, _462, (*spvDescriptorSet0.support_buffer));
        int3 _2339 = int3(_458, _464, 1);
        float3 _466 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2339.xy), uint(_2339.z), 0).xyz;
        float _468 = _466.x;
        float _470 = _466.y;
        float _472 = _466.z;
        int _474 = _68;
        int _476 = 1;
        int _478 = _58(_474, _476, (*spvDescriptorSet0.support_buffer));
        int _480 = as_type<int>(_452);
        int _482 = 1;
        int _484 = _58(_480, _482, (*spvDescriptorSet0.support_buffer));
        int3 _2357 = int3(_478, _484, 1);
        float3 _486 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2357.xy), uint(_2357.z), 0).xyz;
        float _488 = _486.x;
        float _490 = _486.y;
        float _492 = _486.z;
        int _494 = _68;
        int _496 = 1;
        int _498 = _58(_494, _496, (*spvDescriptorSet0.support_buffer));
        int _500 = as_type<int>(_444);
        int _502 = 1;
        int _504 = _58(_500, _502, (*spvDescriptorSet0.support_buffer));
        int3 _2375 = int3(_498, _504, 0);
        float3 _506 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2375.xy), uint(_2375.z), 0).xyz;
        float _508 = _506.x;
        float _510 = _506.y;
        float _512 = _506.z;
        int _514 = _68;
        int _516 = 1;
        int _518 = _58(_514, _516, (*spvDescriptorSet0.support_buffer));
        int _520 = as_type<int>(_452);
        int _522 = 1;
        int _524 = _58(_520, _522, (*spvDescriptorSet0.support_buffer));
        int3 _2393 = int3(_518, _524, 0);
        float3 _526 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2393.xy), uint(_2393.z), 0).xyz;
        float _528 = _526.x;
        float _530 = _526.y;
        float _532 = _526.z;
        int _534 = _68;
        int _536 = 1;
        int _538 = _58(_534, _536, (*spvDescriptorSet0.support_buffer));
        int _540 = as_type<int>(_444);
        int _542 = 1;
        int _544 = _58(_540, _542, (*spvDescriptorSet0.support_buffer));
        int3 _2411 = int3(_538, _544, 2);
        float3 _546 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2411.xy), uint(_2411.z), 0).xyz;
        float _548 = _546.x;
        float _550 = _546.y;
        float _552 = _546.z;
        int _554 = _68;
        int _556 = 1;
        int _558 = _58(_554, _556, (*spvDescriptorSet0.support_buffer));
        int _560 = as_type<int>(_452);
        int _562 = 1;
        int _564 = _58(_560, _562, (*spvDescriptorSet0.support_buffer));
        int3 _2429 = int3(_558, _564, 2);
        float3 _566 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2429.xy), uint(_2429.z), 0).xyz;
        float _568 = _566.x;
        float _570 = _566.y;
        float _572 = _566.z;
        float _574 = _394 * 0.15915493667125701904296875;
        float _576 = _396 * 0.15915493667125701904296875;
        float _578 = _398 * 0.15915493667125701904296875;
        int _580 = _103 + 24;
        uint _582 = uint(int(uint(_580) >> uint(2)));
        uint _584 = uint(int(uint(int(_582)) >> uint(2)));
        int _586 = int(_582) & 3;
        float _588 = (*spvDescriptorSet0.cp_c5)._m0[int(_584)][_586];
        int _590 = int(_582) + 1;
        uint _592 = uint(int(uint(_590) >> uint(2)));
        int _594 = _590 & 3;
        float _596 = (*spvDescriptorSet0.cp_c5)._m0[int(_592)][_594];
        float _598 = _574 * 6.283185482025146484375;
        float _600 = cos(_598);
        int _602 = _103 + 20;
        uint _604 = uint(int(uint(_602) >> uint(2)));
        uint _606 = uint(int(uint(int(_604)) >> uint(2)));
        int _608 = int(_604) & 3;
        float _610 = (*spvDescriptorSet0.cp_c5)._m0[int(_606)][_608];
        float _612 = _576 * 6.283185482025146484375;
        float _614 = sin(_612);
        float _616 = _576 * 6.283185482025146484375;
        float _618 = cos(_616);
        float _620 = _578 * 6.283185482025146484375;
        float _622 = cos(_620);
        float _624 = _574 * 6.283185482025146484375;
        float _626 = sin(_624);
        float _628 = _600 * _618;
        float _630 = _578 * 6.283185482025146484375;
        float _632 = sin(_630);
        float _634 = _614 * _600;
        float _636 = _600 * _622;
        float _638 = _622 * _618;
        float _640 = _614 * _622;
        float _642 = _626 * _622;
        float _644 = _626 * _614;
        float _646 = _626 * _618;
        float _648 = _626 * _632;
        float _650 = fma(_632, _628, _644);
        float _652 = -_646;
        float _654 = fma(_632, _634, _652);
        float _656 = -_634;
        float _658 = fma(_618, _648, _656);
        float _660 = fma(_614, _648, _628);
        float _662 = -_470;
        float _664 = _662 + _490;
        float _666 = -_472;
        float _668 = _666 + _492;
        float _670 = -_512;
        float _672 = _670 + _532;
        float _674 = fma(_664, _588, _470);
        float _676 = -_468;
        float _678 = _676 + _488;
        float _680 = fma(_668, _588, _472);
        float _682 = -_552;
        float _684 = _682 + _572;
        float _686 = _674 * 0.15915493667125701904296875;
        float _688 = fma(_678, _588, _468);
        float _690 = _680 * 0.15915493667125701904296875;
        float _692 = fma(_672, _588, _512);
        float _694 = _686 * 6.283185482025146484375;
        float _696 = cos(_694);
        float _698 = _688 * 0.15915493667125701904296875;
        float _700 = fma(_684, _588, _552);
        float _702 = _700 * _596;
        float _704 = _690 * 6.283185482025146484375;
        float _706 = sin(_704);
        float _708 = _690 * 6.283185482025146484375;
        float _710 = cos(_708);
        float _712 = _698 * 6.283185482025146484375;
        float _714 = cos(_712);
        float _716 = _686 * 6.283185482025146484375;
        float _718 = sin(_716);
        float _720 = _696 * _710;
        float _722 = _698 * 6.283185482025146484375;
        float _724 = sin(_722);
        float _726 = _714 * _710;
        float _728 = _706 * _714;
        float _730 = _714 * _696;
        float _732 = _706 * _696;
        float _734 = _730 * _596;
        float _736 = fma(_636, _610, _734);
        float _738 = _724 * _718;
        float _740 = _724 * _696;
        float _742 = _724 * _706;
        float _744 = _724 * _710;
        float _746 = _632 * _610;
        float _748 = -_728;
        float _750 = fma(_710, _738, _748);
        float _752 = fma(_706, _738, _726);
        float _754 = fma(_718, _726, _742);
        float _756 = -_718;
        float _758 = -_746;
        float _760 = fma(_756, _596, _758);
        float _762 = _720 * _596;
        float _764 = _750 * _596;
        float _766 = -_744;
        float _768 = fma(_718, _728, _766);
        float _770 = _752 * _596;
        float _772 = _732 * _596;
        float _774 = fma(_658, _610, _764);
        float _776 = _768 * _596;
        float _778 = fma(_660, _610, _770);
        float _780 = fma(_640, _610, _772);
        float _782 = fma(_638, _610, _762);
        float _784 = _740 * _596;
        float _786 = _754 * _596;
        float _788 = _778 * _778;
        float _790 = fma(_654, _610, _776);
        float _792 = _780 * _780;
        float _794 = fma(_642, _610, _784);
        float _796 = fma(_650, _610, _786);
        float _798 = fma(_774, _774, _788);
        float _800 = _790 * _790;
        float _802 = fma(_782, _782, _792);
        float _804 = -_508;
        float _806 = _804 + _528;
        float _808 = fma(_794, _794, _798);
        float _810 = fma(_796, _796, _800);
        float _812 = fma(_760, _760, _802);
        float _814 = -_510;
        float _816 = _814 + _530;
        float _818 = fma(_806, _588, _508);
        float _820 = fma(_736, _736, _810);
        float _822 = rsqrt(_812);
        float _824 = fma(_816, _588, _510);
        float _826 = _818 * _596;
        float _828 = fma(_400, _610, _702);
        float _830 = fma(_402, _610, _826);
        float _832 = rsqrt(_808);
        float _834 = rsqrt(_820);
        float _836 = _780 * _822;
        float _838 = _782 * _822;
        float _840 = _760 * _822;
        float _842 = _824 * _596;
        float _844 = _778 * _832;
        float _846 = _794 * _832;
        float _848 = _774 * _832;
        float _850 = -_550;
        float _852 = _850 + _570;
        float _854 = fma(_404, _610, _842);
        float _856 = fma(_852, _588, _550);
        float _858 = _790 * _834;
        float _860 = _796 * _834;
        float _862 = _736 * _834;
        float _864 = -_548;
        float _866 = _864 + _568;
        float _868 = _856 * _596;
        float _870 = fma(_866, _588, _548);
        float _872 = _692 * _596;
        float _874 = fma(_406, _610, _868);
        float _876 = _870 * _596;
        float _878 = fma(_408, _610, _872);
        float _880 = fma(_410, _610, _876);
        _430 = _830;
        _882 = _838;
        _884 = _836;
        _886 = _840;
        _888 = _854;
        _890 = _848;
        _892 = _844;
        _894 = _846;
        _896 = _878;
        _898 = _860;
        _900 = _858;
        _902 = _862;
        _904 = as_type<int>(_880);
        _906 = as_type<int>(_874);
        _908 = as_type<int>(_828);
        _910 = true;
    }
    else
    {
        float _912 = _394 * 2.0;
        float _914 = _396 * _412;
        float _916 = _398 * _412;
        float _918 = -_914;
        float _920 = fma(_912, _398, _918);
        float _922 = fma(_912, _398, _914);
        float _924 = _394 * _412;
        float _926 = _394 * _394;
        float _928 = fma(_912, _396, _916);
        float _930 = -_916;
        float _932 = fma(_912, _396, _930);
        float _934 = _398 * _398;
        float _936 = _398 * 2.0;
        float _938 = _396 * _396;
        float _940 = fma(_926, -2.0, 1.0);
        float _942 = fma(_934, -2.0, 1.0);
        float _944 = -_924;
        float _946 = fma(_936, _396, _944);
        float _948 = fma(_936, _396, _924);
        float _950 = fma(_938, -2.0, _940);
        float _952 = fma(_934, -2.0, _940);
        float _954 = fma(_938, -2.0, _942);
        _882 = _954;
        _884 = _922;
        _886 = _932;
        _888 = _404;
        _890 = _920;
        _892 = _950;
        _894 = _948;
        _896 = _408;
        _898 = _928;
        _900 = _946;
        _902 = _952;
        _904 = as_type<int>(_410);
        _906 = as_type<int>(_406);
        _908 = as_type<int>(_400);
    }
    _910 = false;
    float _956 = _430;
    float _958 = _882;
    float _960 = _884;
    float _962 = _886;
    float _964 = _888;
    float _966 = _890;
    float _968 = _892;
    float _970 = _894;
    float _972 = _896;
    float _974 = _898;
    float _976 = _900;
    float _978 = _902;
    int _980 = _904;
    int _982 = _906;
    int _984 = _908;
    float _986 = _956 * _958;
    float _988 = _956 * _960;
    float _990 = _956 * _962;
    float _992 = _964 * _966;
    float _994 = _964 * _968;
    float _996 = _964 * _970;
    int _998 = _68 * 48;
    float _1000 = _972 * _974;
    float _1002 = _972 * _976;
    float _1004 = _972 * _978;
    bool _1006 = _68 != 0;
    uint _1008 = uint(int(uint(_998) >> uint(2)));
    _39[int(_1008)] = as_type<uint>(_986);
    int _1010 = _998 + 4;
    uint _1012 = uint(int(uint(_1010) >> uint(2)));
    _39[int(_1012)] = as_type<uint>(_992);
    int _1014 = _998 + 8;
    uint _1016 = uint(int(uint(_1014) >> uint(2)));
    _39[int(_1016)] = as_type<uint>(_1000);
    int _1018 = _998 + 12;
    uint _1020 = uint(int(uint(_1018) >> uint(2)));
    _39[int(_1020)] = uint(_980);
    int _1022 = _68 * 112;
    int _1024 = _998 + 16;
    int _1026 = _998 + 16;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    _39[int(_1028)] = as_type<uint>(_988);
    int _1030 = _998 + 20;
    uint _1032 = uint(int(uint(_1030) >> uint(2)));
    _39[int(_1032)] = as_type<uint>(_994);
    int _1034 = _998 + 24;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    _39[int(_1036)] = as_type<uint>(_1002);
    int _1038 = _998 + 28;
    uint _1040 = uint(int(uint(_1038) >> uint(2)));
    _39[int(_1040)] = uint(_982);
    int _1042 = _998 + 32;
    int _1044 = _998 + 32;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    _39[int(_1046)] = as_type<uint>(_990);
    int _1048 = _998 + 36;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    _39[int(_1050)] = as_type<uint>(_996);
    int _1052 = _998 + 40;
    uint _1054 = uint(int(uint(_1052) >> uint(2)));
    _39[int(_1054)] = as_type<uint>(_1004);
    int _1056 = _998 + 44;
    uint _1058 = uint(int(uint(_1056) >> uint(2)));
    _39[int(_1058)] = uint(_984);
    float _1060 = _956;
    float _1062 = _964;
    float _1064 = _960;
    float _1066 = _974;
    float _1068 = _966;
    float _1070 = _958;
    float _1072 = _970;
    float _1074 = _962;
    float _1076 = _976;
    float _1078 = _968;
    if (!_1006)
    {
        _1060 = _986;
    }
    float _1080 = _1060;
    float _1082 = _1080;
    if (!_1006)
    {
        _1062 = _992;
    }
    float _1084 = _1062;
    float _1086 = _1084;
    if (!_1006)
    {
        _432 = _1000;
    }
    float _1088 = _432;
    float _1090 = _1088;
    if (!_1006)
    {
        _434 = as_type<float>(_980);
    }
    float _1092 = _434;
    float _1094 = _1092;
    if (!_1006)
    {
        _1064 = _988;
    }
    float _1096 = _1064;
    float _1098 = _1096;
    if (!_1006)
    {
        _1066 = _994;
    }
    float _1100 = _1066;
    float _1102 = _1100;
    if (!_1006)
    {
        _1068 = _1002;
    }
    float _1104 = _1068;
    float _1106 = _1104;
    if (!_1006)
    {
        _1070 = as_type<float>(_982);
    }
    float _1108 = _1070;
    float _1110 = _1108;
    if (!_1006)
    {
        _1072 = _990;
    }
    float _1112 = _1072;
    float _1114 = _1112;
    if (!_1006)
    {
        _1074 = _996;
    }
    float _1116 = _1074;
    float _1118 = _1116;
    if (!_1006)
    {
        _1076 = _1004;
    }
    float _1120 = _1076;
    float _1122 = _1120;
    if (!_1006)
    {
        _1078 = as_type<float>(_984);
    }
    float _1124 = _1078;
    bool _1126 = !_1006;
    float _1128 = _1124;
    if (!_1126)
    {
        bool _1130 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1132 = !_1130;
        if (!_1132)
        {
            uint _1134 = uint(int(uint(_1022) >> uint(2)));
            uint _1136 = uint(int(uint(int(_1134)) >> uint(2)));
            int _1138 = int(_1134) & 3;
            float _1140 = (*spvDescriptorSet0.cp_c6)._m0[int(_1136)][_1138];
            int _1142 = as_type<int>(_1140) * 48;
            int _1144 = 0;
            bool _1146;
            float _1244;
            float _1246;
            float _1254;
            float _1264;
            float _1266;
            float _1278;
            float _1290;
            float _1292;
            float _1294;
            float _1296;
            float _1298;
            float _1300;
            do
            {
                int _1148 = _1144;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1150 = uint(int(uint(_1142) >> uint(2)));
                float _1152 = as_type<float>(_39[int(_1150)]);
                int _1154 = _1142 + 4;
                uint _1156 = uint(int(uint(_1154) >> uint(2)));
                float _1158 = as_type<float>(_39[int(_1156)]);
                int _1160 = _1142 + 8;
                uint _1162 = uint(int(uint(_1160) >> uint(2)));
                float _1164 = as_type<float>(_39[int(_1162)]);
                int _1166 = _1142 + 12;
                uint _1168 = uint(int(uint(_1166) >> uint(2)));
                float _1170 = as_type<float>(_39[int(_1168)]);
                int _1172 = _1148 + 1;
                int _1174 = _1142 + 16;
                uint _1176 = uint(int(uint(_1174) >> uint(2)));
                float _1178 = as_type<float>(_39[int(_1176)]);
                int _1180 = _1142 + 20;
                uint _1182 = uint(int(uint(_1180) >> uint(2)));
                float _1184 = as_type<float>(_39[int(_1182)]);
                int _1186 = _1142 + 24;
                uint _1188 = uint(int(uint(_1186) >> uint(2)));
                float _1190 = as_type<float>(_39[int(_1188)]);
                int _1192 = _1142 + 28;
                uint _1194 = uint(int(uint(_1192) >> uint(2)));
                float _1196 = as_type<float>(_39[int(_1194)]);
                bool _1198 = uint(_1172) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1200 = _1142 + 32;
                uint _1202 = uint(int(uint(_1200) >> uint(2)));
                float _1204 = as_type<float>(_39[int(_1202)]);
                int _1206 = _1142 + 36;
                uint _1208 = uint(int(uint(_1206) >> uint(2)));
                float _1210 = as_type<float>(_39[int(_1208)]);
                int _1212 = _1142 + 40;
                uint _1214 = uint(int(uint(_1212) >> uint(2)));
                float _1216 = as_type<float>(_39[int(_1214)]);
                int _1218 = _1142 + 44;
                uint _1220 = uint(int(uint(_1218) >> uint(2)));
                float _1222 = as_type<float>(_39[int(_1220)]);
                float _1224 = _1158 * as_type<float>(_982);
                float _1226 = _988 * _1158;
                float _1228 = _994 * _1158;
                float _1230 = _1002 * _1158;
                float _1232 = fma(_1152, as_type<float>(_980), _1224);
                float _1234 = fma(_986, _1152, _1226);
                float _1236 = fma(_992, _1152, _1228);
                float _1238 = fma(_1000, _1152, _1230);
                float _1240 = fma(_1164, as_type<float>(_984), _1232);
                float _1242 = _1184 * as_type<float>(_982);
                _1244 = fma(_990, _1164, _1234);
                _1246 = fma(_996, _1164, _1236);
                float _1248 = _988 * _1184;
                float _1250 = _994 * _1184;
                float _1252 = fma(_1178, as_type<float>(_980), _1242);
                _1254 = _1170 + _1240;
                float _1256 = fma(_986, _1178, _1248);
                float _1258 = fma(_992, _1178, _1250);
                float _1260 = fma(_1190, as_type<float>(_984), _1252);
                float _1262 = _1210 * as_type<float>(_982);
                _1264 = fma(_990, _1190, _1256);
                _1266 = fma(_996, _1190, _1258);
                float _1268 = _988 * _1210;
                float _1270 = _994 * _1210;
                float _1272 = _1002 * _1184;
                float _1274 = _1002 * _1210;
                float _1276 = fma(_1204, as_type<float>(_980), _1262);
                _1278 = _1196 + _1260;
                float _1280 = fma(_1000, _1178, _1272);
                float _1282 = fma(_986, _1204, _1268);
                float _1284 = fma(_992, _1204, _1270);
                float _1286 = fma(_1000, _1204, _1274);
                float _1288 = fma(_1216, as_type<float>(_984), _1276);
                _1290 = fma(_1004, _1164, _1238);
                _1292 = fma(_1004, _1190, _1280);
                _1294 = fma(_990, _1216, _1282);
                _1296 = fma(_996, _1216, _1284);
                _1298 = fma(_1004, _1216, _1286);
                _1300 = _1222 + _1288;
                uint _1302 = uint(int(uint(_998) >> uint(2)));
                _39[int(_1302)] = as_type<uint>(_1244);
                int _1304 = _998 + 4;
                uint _1306 = uint(int(uint(_1304) >> uint(2)));
                _39[int(_1306)] = as_type<uint>(_1246);
                int _1308 = _998 + 8;
                uint _1310 = uint(int(uint(_1308) >> uint(2)));
                _39[int(_1310)] = as_type<uint>(_1290);
                int _1312 = _998 + 12;
                uint _1314 = uint(int(uint(_1312) >> uint(2)));
                _39[int(_1314)] = as_type<uint>(_1254);
                int _1316 = _998 + 16;
                uint _1318 = uint(int(uint(_1316) >> uint(2)));
                _39[int(_1318)] = as_type<uint>(_1264);
                int _1320 = _998 + 20;
                uint _1322 = uint(int(uint(_1320) >> uint(2)));
                _39[int(_1322)] = as_type<uint>(_1266);
                int _1324 = _998 + 24;
                uint _1326 = uint(int(uint(_1324) >> uint(2)));
                _39[int(_1326)] = as_type<uint>(_1292);
                int _1328 = _998 + 28;
                uint _1330 = uint(int(uint(_1328) >> uint(2)));
                _39[int(_1330)] = as_type<uint>(_1278);
                int _1332 = _998 + 32;
                uint _1334 = uint(int(uint(_1332) >> uint(2)));
                _39[int(_1334)] = as_type<uint>(_1294);
                int _1336 = _998 + 36;
                uint _1338 = uint(int(uint(_1336) >> uint(2)));
                _39[int(_1338)] = as_type<uint>(_1296);
                int _1340 = _998 + 40;
                uint _1342 = uint(int(uint(_1340) >> uint(2)));
                _39[int(_1342)] = as_type<uint>(_1298);
                int _1344 = _998 + 44;
                uint _1346 = uint(int(uint(_1344) >> uint(2)));
                _39[int(_1346)] = as_type<uint>(_1300);
                _1146 = !_1198;
                _1144 = _1172;
            } while (_1146);
            _1082 = _1244;
            _1086 = _1246;
            _1090 = _1290;
            _1094 = _1254;
            _1098 = _1264;
            _1102 = _1266;
            _1106 = _1292;
            _1110 = _1278;
            _1114 = _1294;
            _1118 = _1296;
            _1122 = _1298;
            _1128 = _1300;
            _1348 = true;
        }
        else
        {
            _1082 = 0.0;
            _1086 = 0.0;
            _1090 = 0.0;
            _1094 = 0.0;
            _1098 = 0.0;
            _1102 = 0.0;
            _1106 = 0.0;
            _1110 = 0.0;
            _1114 = 0.0;
            _1118 = 0.0;
            _1122 = 0.0;
            _1128 = 0.0;
        }
    }
    _1348 = false;
    float _1350 = _1082;
    float _1352 = _1086;
    float _1354 = _1090;
    float _1356 = _1094;
    float _1358 = _1098;
    float _1360 = _1102;
    float _1362 = _1106;
    float _1364 = _1110;
    float _1366 = _1114;
    float _1368 = _1118;
    float _1370 = _1122;
    float _1372 = _1128;
    int _1374 = _1022 + 80;
    uint _1376 = uint(int(uint(_1374) >> uint(2)));
    uint _1378 = uint(int(uint(int(_1376)) >> uint(2)));
    int _1380 = int(_1376) & 3;
    float _1382 = (*spvDescriptorSet0.cp_c6)._m0[int(_1378)][_1380];
    int _1384 = int(_1376) + 1;
    uint _1386 = uint(int(uint(_1384) >> uint(2)));
    int _1388 = _1384 & 3;
    float _1390 = (*spvDescriptorSet0.cp_c6)._m0[int(_1386)][_1388];
    bool _1392 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1394 = _1022 + 64;
    uint _1396 = uint(int(uint(_1394) >> uint(2)));
    uint _1398 = uint(int(uint(int(_1396)) >> uint(2)));
    int _1400 = int(_1396) & 3;
    float _1402 = (*spvDescriptorSet0.cp_c6)._m0[int(_1398)][_1400];
    int _1404 = int(_1396) + 1;
    uint _1406 = uint(int(uint(_1404) >> uint(2)));
    int _1408 = _1404 & 3;
    float _1410 = (*spvDescriptorSet0.cp_c6)._m0[int(_1406)][_1408];
    int _1412 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1414 = _1412 + _68;
    int _1416 = _1022 + 88;
    uint _1418 = uint(int(uint(_1416) >> uint(2)));
    uint _1420 = uint(int(uint(int(_1418)) >> uint(2)));
    int _1422 = int(_1418) & 3;
    float _1424 = (*spvDescriptorSet0.cp_c6)._m0[int(_1420)][_1422];
    int _1426 = int(_1418) + 1;
    uint _1428 = uint(int(uint(_1426) >> uint(2)));
    int _1430 = _1426 & 3;
    float _1432 = (*spvDescriptorSet0.cp_c6)._m0[int(_1428)][_1430];
    int _1434 = _1022 + 72;
    uint _1436 = uint(int(uint(_1434) >> uint(2)));
    uint _1438 = uint(int(uint(int(_1436)) >> uint(2)));
    int _1440 = int(_1436) & 3;
    float _1442 = (*spvDescriptorSet0.cp_c6)._m0[int(_1438)][_1440];
    int _1444 = int(_1436) + 1;
    uint _1446 = uint(int(uint(_1444) >> uint(2)));
    int _1448 = _1444 & 3;
    float _1450 = (*spvDescriptorSet0.cp_c6)._m0[int(_1446)][_1448];
    int _1452 = _1022 + 96;
    uint _1454 = uint(int(uint(_1452) >> uint(2)));
    uint _1456 = uint(int(uint(int(_1454)) >> uint(2)));
    int _1458 = int(_1454) & 3;
    float _1460 = (*spvDescriptorSet0.cp_c6)._m0[int(_1456)][_1458];
    int _1462 = int(_1454) + 1;
    uint _1464 = uint(int(uint(_1462) >> uint(2)));
    int _1466 = _1462 & 3;
    float _1468 = (*spvDescriptorSet0.cp_c6)._m0[int(_1464)][_1466];
    int _1470 = _1022 + 104;
    uint _1472 = uint(int(uint(_1470) >> uint(2)));
    uint _1474 = uint(int(uint(int(_1472)) >> uint(2)));
    int _1476 = int(_1472) & 3;
    float _1478 = (*spvDescriptorSet0.cp_c6)._m0[int(_1474)][_1476];
    int _1480 = int(_1472) + 1;
    uint _1482 = uint(int(uint(_1480) >> uint(2)));
    int _1484 = _1480 & 3;
    float _1486 = (*spvDescriptorSet0.cp_c6)._m0[int(_1482)][_1484];
    int _1488 = _1022 + 16;
    uint _1490 = uint(int(uint(_1488) >> uint(2)));
    uint _1492 = uint(int(uint(int(_1490)) >> uint(2)));
    int _1494 = int(_1490) & 3;
    float _1496 = (*spvDescriptorSet0.cp_c6)._m0[int(_1492)][_1494];
    int _1498 = int(_1490) + 1;
    uint _1500 = uint(int(uint(_1498) >> uint(2)));
    int _1502 = _1498 & 3;
    float _1504 = (*spvDescriptorSet0.cp_c6)._m0[int(_1500)][_1502];
    if (!_1392)
    {
        uint _1506 = uint(int(uint(_998) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1506)] = as_type<uint>(_1350);
        int _1508 = _998 + 4;
        uint _1510 = uint(int(uint(_1508) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1510)] = as_type<uint>(_1352);
        int _1512 = _998 + 8;
        uint _1514 = uint(int(uint(_1512) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1514)] = as_type<uint>(_1354);
        int _1516 = _998 + 12;
        uint _1518 = uint(int(uint(_1516) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1518)] = as_type<uint>(_1356);
        uint _1520 = uint(int(uint(_1024) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1520)] = as_type<uint>(_1358);
        int _1522 = _1024 + 4;
        uint _1524 = uint(int(uint(_1522) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1524)] = as_type<uint>(_1360);
        int _1526 = _1024 + 8;
        uint _1528 = uint(int(uint(_1526) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1528)] = as_type<uint>(_1362);
        int _1530 = _1024 + 12;
        uint _1532 = uint(int(uint(_1530) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1532)] = as_type<uint>(_1364);
        uint _1534 = uint(int(uint(_1042) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1534)] = as_type<uint>(_1366);
        int _1536 = _1042 + 4;
        uint _1538 = uint(int(uint(_1536) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1538)] = as_type<uint>(_1368);
        int _1540 = _1042 + 8;
        uint _1542 = uint(int(uint(_1540) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1542)] = as_type<uint>(_1370);
        int _1544 = _1042 + 12;
        uint _1546 = uint(int(uint(_1544) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1546)] = as_type<uint>(_1372);
    }
    float _1548 = _1360 * _1382;
    float _1550 = _1368 * _1382;
    int _1552 = _1022 + 32;
    uint _1554 = uint(int(uint(_1552) >> uint(2)));
    uint _1556 = uint(int(uint(int(_1554)) >> uint(2)));
    int _1558 = int(_1554) & 3;
    float _1560 = (*spvDescriptorSet0.cp_c6)._m0[int(_1556)][_1558];
    int _1562 = int(_1554) + 1;
    uint _1564 = uint(int(uint(_1562) >> uint(2)));
    int _1566 = _1562 & 3;
    float _1568 = (*spvDescriptorSet0.cp_c6)._m0[int(_1564)][_1566];
    float _1570 = _1352 * _1382;
    float _1572 = fma(_1358, _1402, _1548);
    float _1574 = fma(_1366, _1402, _1550);
    float _1576 = _1352 * _1390;
    float _1578 = _1360 * _1390;
    float _1580 = _1368 * _1390;
    float _1582 = _1352 * _1432;
    int _1584 = _1022 + 48;
    uint _1586 = uint(int(uint(_1584) >> uint(2)));
    uint _1588 = uint(int(uint(int(_1586)) >> uint(2)));
    int _1590 = int(_1586) & 3;
    float _1592 = (*spvDescriptorSet0.cp_c6)._m0[int(_1588)][_1590];
    int _1594 = int(_1586) + 1;
    uint _1596 = uint(int(uint(_1594) >> uint(2)));
    int _1598 = _1594 & 3;
    float _1600 = (*spvDescriptorSet0.cp_c6)._m0[int(_1596)][_1598];
    float _1602 = fma(_1350, _1410, _1576);
    float _1604 = _1352 * _1424;
    float _1606 = fma(_1358, _1410, _1578);
    float _1608 = fma(_1366, _1410, _1580);
    float _1610 = _1360 * _1424;
    float _1612 = _1360 * _1432;
    float _1614 = _1368 * _1424;
    float _1616 = _1368 * _1432;
    int _1618 = _1022 + 24;
    uint _1620 = uint(int(uint(_1618) >> uint(2)));
    uint _1622 = uint(int(uint(int(_1620)) >> uint(2)));
    int _1624 = int(_1620) & 3;
    float _1626 = (*spvDescriptorSet0.cp_c6)._m0[int(_1622)][_1624];
    int _1628 = int(_1620) + 1;
    uint _1630 = uint(int(uint(_1628) >> uint(2)));
    int _1632 = _1628 & 3;
    float _1634 = (*spvDescriptorSet0.cp_c6)._m0[int(_1630)][_1632];
    float _1636 = fma(_1350, _1442, _1604);
    float _1638 = fma(_1350, _1450, _1582);
    float _1640 = fma(_1358, _1442, _1610);
    float _1642 = fma(_1358, _1450, _1612);
    float _1644 = fma(_1366, _1442, _1614);
    float _1646 = fma(_1366, _1450, _1616);
    float _1648 = fma(_1354, _1468, _1602);
    int _1650 = _1022 + 40;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    uint _1654 = uint(int(uint(int(_1652)) >> uint(2)));
    int _1656 = int(_1652) & 3;
    float _1658 = (*spvDescriptorSet0.cp_c6)._m0[int(_1654)][_1656];
    int _1660 = int(_1652) + 1;
    uint _1662 = uint(int(uint(_1660) >> uint(2)));
    int _1664 = _1660 & 3;
    float _1666 = (*spvDescriptorSet0.cp_c6)._m0[int(_1662)][_1664];
    float _1668 = fma(_1362, _1460, _1572);
    float _1670 = fma(_1362, _1468, _1606);
    float _1672 = fma(_1362, _1478, _1640);
    float _1674 = fma(_1362, _1486, _1642);
    float _1676 = fma(_1350, _1402, _1570);
    float _1678 = fma(_1354, _1486, _1638);
    float _1680 = fma(_1370, _1486, _1646);
    int _1682 = _1022 + 56;
    uint _1684 = uint(int(uint(_1682) >> uint(2)));
    uint _1686 = uint(int(uint(int(_1684)) >> uint(2)));
    int _1688 = int(_1684) & 3;
    float _1690 = (*spvDescriptorSet0.cp_c6)._m0[int(_1686)][_1688];
    int _1692 = int(_1684) + 1;
    uint _1694 = uint(int(uint(_1692) >> uint(2)));
    int _1696 = _1692 & 3;
    float _1698 = (*spvDescriptorSet0.cp_c6)._m0[int(_1694)][_1696];
    float _1700 = _1674 + _1364;
    float _1702 = fma(_1354, _1460, _1676);
    float _1704 = fma(_1354, _1478, _1636);
    float _1706 = _1678 + _1356;
    float _1708 = _1672 * _1504;
    float _1710 = _1700 * _1504;
    float _1712 = _1680 + _1372;
    float _1714 = fma(_1370, _1460, _1574);
    float _1716 = fma(_1370, _1468, _1608);
    float _1718 = fma(_1370, _1478, _1644);
    float _1720 = _1670 * _1504;
    float _1722 = _1668 * _1504;
    float _1724 = fma(_1704, _1496, _1708);
    float _1726 = fma(_1706, _1496, _1710);
    float _1728 = _1700 * _1568;
    float _1730 = _1668 * _1568;
    float _1732 = _1670 * _1568;
    float _1734 = _1672 * _1568;
    float _1736 = fma(_1706, _1560, _1728);
    float _1738 = fma(_1648, _1496, _1720);
    int _1740 = _1414 * 48;
    float _1742 = fma(_1702, _1496, _1722);
    float _1744 = _1700 * _1600;
    float _1746 = _1668 * _1600;
    float _1748 = _1670 * _1600;
    float _1750 = _1672 * _1600;
    float _1752 = fma(_1706, _1592, _1744);
    float _1754 = fma(_1702, _1560, _1730);
    float _1756 = fma(_1648, _1560, _1732);
    float _1758 = fma(_1704, _1560, _1734);
    float _1760 = fma(_1702, _1592, _1746);
    float _1762 = fma(_1712, _1626, _1726);
    float _1764 = fma(_1648, _1592, _1748);
    float _1766 = fma(_1704, _1592, _1750);
    float _1768 = fma(_1716, _1626, _1738);
    float _1770 = fma(_1714, _1626, _1742);
    float _1772 = fma(_1718, _1626, _1724);
    float _1774 = _1762 + _1634;
    int _1776 = _1740 + 16;
    float _1778 = fma(_1712, _1658, _1736);
    float _1780 = fma(_1714, _1658, _1754);
    float _1782 = fma(_1716, _1658, _1756);
    float _1784 = fma(_1718, _1658, _1758);
    float _1786 = _1778 + _1666;
    int _1788 = _1740 + 32;
    int _1790 = _1740 + 48;
    float _1792 = fma(_1712, _1690, _1752);
    float _1794 = fma(_1714, _1690, _1760);
    float _1796 = fma(_1716, _1690, _1764);
    float _1798 = fma(_1718, _1690, _1766);
    float _1800 = _1792 + _1698;
    uint _1802 = uint(int(uint(_1776) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1802)] = as_type<uint>(_1770);
    int _1804 = _1776 + 4;
    uint _1806 = uint(int(uint(_1804) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1806)] = as_type<uint>(_1768);
    int _1808 = _1776 + 8;
    uint _1810 = uint(int(uint(_1808) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1810)] = as_type<uint>(_1772);
    int _1812 = _1776 + 12;
    uint _1814 = uint(int(uint(_1812) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1814)] = as_type<uint>(_1774);
    uint _1816 = uint(int(uint(_1788) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1816)] = as_type<uint>(_1780);
    int _1818 = _1788 + 4;
    uint _1820 = uint(int(uint(_1818) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1820)] = as_type<uint>(_1782);
    int _1822 = _1788 + 8;
    uint _1824 = uint(int(uint(_1822) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1824)] = as_type<uint>(_1784);
    int _1826 = _1788 + 12;
    uint _1828 = uint(int(uint(_1826) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1828)] = as_type<uint>(_1786);
    uint _1830 = uint(int(uint(_1790) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1830)] = as_type<uint>(_1794);
    int _1832 = _1790 + 4;
    uint _1834 = uint(int(uint(_1832) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1834)] = as_type<uint>(_1796);
    int _1836 = _1790 + 8;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1838)] = as_type<uint>(_1798);
    int _1840 = _1790 + 12;
    uint _1842 = uint(int(uint(_1840) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1842)] = as_type<uint>(_1800);
}

