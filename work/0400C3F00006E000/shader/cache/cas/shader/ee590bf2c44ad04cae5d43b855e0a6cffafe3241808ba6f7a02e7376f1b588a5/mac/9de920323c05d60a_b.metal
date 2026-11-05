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
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _4466, thread const int& _4467, constant _10& support_buffer)
{
    int _4470 = 1 + _4467;
    float _4472 = support_buffer._m5[_4470].x;
    bool _4474 = _4472 == 1.0;
    if (_4474)
    {
        return _4466;
    }
    float _4476 = float(_4466);
    float _4478 = _4476 * _4472;
    int _4480 = int(_4478);
    return _4480;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1342 = false;
    bool _916 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    float _72 = _62;
    if (_70)
    {
        return;
    }
    int _74 = _66 & 31;
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
    int _103 = _101 + 32;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = as_type<int>(_99) & as_type<int>(_111);
    bool _115 = _113 != 0;
    float _117 = 0.0;
    float _119 = 0.0;
    float _121 = _99;
    if (!_115)
    {
        _117 = 0.0;
        _119 = 0.0;
    }
    float _123 = _117;
    float _125 = _119;
    float _127 = 0.0;
    float _129 = 0.0;
    float _131 = _123;
    float _133 = _125;
    if (!_115)
    {
        _127 = 0.0;
        _129 = 0.0;
    }
    float _135 = _127;
    float _137 = _129;
    float _139 = 0.0;
    float _141 = _135;
    float _143 = _137;
    if (!_115)
    {
        _139 = 0.0;
    }
    float _145 = _139;
    float _147 = 0.0;
    float _149 = _145;
    if (!_115)
    {
        _147 = 0.0;
    }
    float _151 = _147;
    float _153 = 0.0;
    float _155 = _151;
    if (!_115)
    {
        _153 = 0.0;
    }
    float _157 = _153;
    float _159 = 0.0;
    float _161 = _157;
    if (!_115)
    {
        _159 = 0.0;
    }
    float _163 = _159;
    float _165 = 0.0;
    float _167 = _163;
    if (!_115)
    {
        _165 = 0.0;
    }
    float _169 = _165;
    float _171 = _169;
    if (!_115)
    {
        _72 = 0.0;
    }
    float _173 = _72;
    bool _175 = !_115;
    float _177 = _173;
    if (!_175)
    {
        uint _179 = uint(int(uint(_101) >> uint(2)));
        uint _181 = uint(int(uint(int(_179)) >> uint(2)));
        int _183 = int(_179) & 3;
        float _185 = (*spvDescriptorSet0.cp_c5)._m0[int(_181)][_183];
        int _187 = int(_179) + 1;
        uint _189 = uint(int(uint(_187) >> uint(2)));
        int _191 = _187 & 3;
        float _193 = (*spvDescriptorSet0.cp_c5)._m0[int(_189)][_191];
        int _195 = _66;
        int _197 = 0;
        int _199 = _56(_195, _197, (*spvDescriptorSet0.support_buffer));
        int _201 = as_type<int>(_185);
        int _203 = 0;
        int _205 = _56(_201, _203, (*spvDescriptorSet0.support_buffer));
        int3 _1989 = int3(_199, _205, 1);
        float4 _208 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1989.xy), uint(_1989.z), 0).xyzw;
        float _210 = _208.x;
        float _212 = _208.y;
        float _214 = _208.z;
        float _216 = _208.w;
        int _218 = _66;
        int _220 = 0;
        int _222 = _56(_218, _220, (*spvDescriptorSet0.support_buffer));
        int _224 = as_type<int>(_193);
        int _226 = 0;
        int _228 = _56(_224, _226, (*spvDescriptorSet0.support_buffer));
        int3 _2009 = int3(_222, _228, 1);
        float4 _230 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2009.xy), uint(_2009.z), 0).xyzw;
        float _232 = _230.x;
        float _234 = _230.y;
        float _236 = _230.z;
        float _238 = _230.w;
        int _240 = _66;
        int _242 = 0;
        int _244 = _56(_240, _242, (*spvDescriptorSet0.support_buffer));
        int _246 = as_type<int>(_185);
        int _248 = 0;
        int _250 = _56(_246, _248, (*spvDescriptorSet0.support_buffer));
        int3 _2029 = int3(_244, _250, 0);
        float3 _254 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2029.xy), uint(_2029.z), 0).xyz;
        float _256 = _254.x;
        float _258 = _254.y;
        float _260 = _254.z;
        int _262 = _66;
        int _264 = 0;
        int _266 = _56(_262, _264, (*spvDescriptorSet0.support_buffer));
        int _268 = as_type<int>(_193);
        int _270 = 0;
        int _272 = _56(_268, _270, (*spvDescriptorSet0.support_buffer));
        int3 _2047 = int3(_266, _272, 0);
        float3 _274 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2047.xy), uint(_2047.z), 0).xyz;
        float _276 = _274.x;
        float _278 = _274.y;
        float _280 = _274.z;
        int _282 = _66;
        int _284 = 0;
        int _286 = _56(_282, _284, (*spvDescriptorSet0.support_buffer));
        int _288 = as_type<int>(_185);
        int _290 = 0;
        int _292 = _56(_288, _290, (*spvDescriptorSet0.support_buffer));
        int3 _2065 = int3(_286, _292, 2);
        float3 _294 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2065.xy), uint(_2065.z), 0).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        int _302 = _66;
        int _304 = 0;
        int _306 = _56(_302, _304, (*spvDescriptorSet0.support_buffer));
        int _308 = as_type<int>(_193);
        int _310 = 0;
        int _312 = _56(_308, _310, (*spvDescriptorSet0.support_buffer));
        int3 _2083 = int3(_306, _312, 2);
        float3 _314 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2083.xy), uint(_2083.z), 0).xyz;
        float _316 = _314.x;
        float _318 = _314.y;
        float _320 = _314.z;
        int _322 = _101 + 16;
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
    int _414 = _101 + 36;
    uint _416 = uint(int(uint(_414) >> uint(2)));
    uint _418 = uint(int(uint(int(_416)) >> uint(2)));
    int _420 = int(_416) & 3;
    float _422 = (*spvDescriptorSet0.cp_c5)._m0[int(_418)][_420];
    int _424 = as_type<int>(_99) & as_type<int>(_422);
    bool _426 = _424 != 0;
    bool _428 = !_426;
    float _430 = _402;
    int _432 = as_type<int>(_404);
    int _434 = as_type<int>(_406);
    float _436 = _408;
    float _438 = _400;
    float _440 = _410;
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
    float _908;
    int _910;
    float _912;
    float _914;
    if (!_428)
    {
        int _442 = _101 + 8;
        uint _444 = uint(int(uint(_442) >> uint(2)));
        uint _446 = uint(int(uint(int(_444)) >> uint(2)));
        int _448 = int(_444) & 3;
        float _450 = (*spvDescriptorSet0.cp_c5)._m0[int(_446)][_448];
        int _452 = int(_444) + 1;
        uint _454 = uint(int(uint(_452) >> uint(2)));
        int _456 = _452 & 3;
        float _458 = (*spvDescriptorSet0.cp_c5)._m0[int(_454)][_456];
        int _460 = _66;
        int _462 = 1;
        int _464 = _56(_460, _462, (*spvDescriptorSet0.support_buffer));
        int _466 = as_type<int>(_450);
        int _468 = 1;
        int _470 = _56(_466, _468, (*spvDescriptorSet0.support_buffer));
        int3 _2303 = int3(_464, _470, 1);
        float3 _472 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2303.xy), uint(_2303.z), 0).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        int _480 = _66;
        int _482 = 1;
        int _484 = _56(_480, _482, (*spvDescriptorSet0.support_buffer));
        int _486 = as_type<int>(_458);
        int _488 = 1;
        int _490 = _56(_486, _488, (*spvDescriptorSet0.support_buffer));
        int3 _2321 = int3(_484, _490, 1);
        float3 _492 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2321.xy), uint(_2321.z), 0).xyz;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        int _500 = _66;
        int _502 = 1;
        int _504 = _56(_500, _502, (*spvDescriptorSet0.support_buffer));
        int _506 = as_type<int>(_450);
        int _508 = 1;
        int _510 = _56(_506, _508, (*spvDescriptorSet0.support_buffer));
        int3 _2339 = int3(_504, _510, 0);
        float3 _512 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2339.xy), uint(_2339.z), 0).xyz;
        float _514 = _512.x;
        float _516 = _512.y;
        float _518 = _512.z;
        int _520 = _66;
        int _522 = 1;
        int _524 = _56(_520, _522, (*spvDescriptorSet0.support_buffer));
        int _526 = as_type<int>(_458);
        int _528 = 1;
        int _530 = _56(_526, _528, (*spvDescriptorSet0.support_buffer));
        int3 _2357 = int3(_524, _530, 0);
        float3 _532 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2357.xy), uint(_2357.z), 0).xyz;
        float _534 = _532.x;
        float _536 = _532.y;
        float _538 = _532.z;
        int _540 = _66;
        int _542 = 1;
        int _544 = _56(_540, _542, (*spvDescriptorSet0.support_buffer));
        int _546 = as_type<int>(_450);
        int _548 = 1;
        int _550 = _56(_546, _548, (*spvDescriptorSet0.support_buffer));
        int3 _2375 = int3(_544, _550, 2);
        float3 _552 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2375.xy), uint(_2375.z), 0).xyz;
        float _554 = _552.x;
        float _556 = _552.y;
        float _558 = _552.z;
        int _560 = _66;
        int _562 = 1;
        int _564 = _56(_560, _562, (*spvDescriptorSet0.support_buffer));
        int _566 = as_type<int>(_458);
        int _568 = 1;
        int _570 = _56(_566, _568, (*spvDescriptorSet0.support_buffer));
        int3 _2393 = int3(_564, _570, 2);
        float3 _572 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2393.xy), uint(_2393.z), 0).xyz;
        float _574 = _572.x;
        float _576 = _572.y;
        float _578 = _572.z;
        float _580 = _394 * 0.15915493667125701904296875;
        float _582 = _396 * 0.15915493667125701904296875;
        float _584 = _398 * 0.15915493667125701904296875;
        int _586 = _101 + 24;
        uint _588 = uint(int(uint(_586) >> uint(2)));
        uint _590 = uint(int(uint(int(_588)) >> uint(2)));
        int _592 = int(_588) & 3;
        float _594 = (*spvDescriptorSet0.cp_c5)._m0[int(_590)][_592];
        int _596 = int(_588) + 1;
        uint _598 = uint(int(uint(_596) >> uint(2)));
        int _600 = _596 & 3;
        float _602 = (*spvDescriptorSet0.cp_c5)._m0[int(_598)][_600];
        float _604 = _580 * 6.283185482025146484375;
        float _606 = cos(_604);
        int _608 = _101 + 20;
        uint _610 = uint(int(uint(_608) >> uint(2)));
        uint _612 = uint(int(uint(int(_610)) >> uint(2)));
        int _614 = int(_610) & 3;
        float _616 = (*spvDescriptorSet0.cp_c5)._m0[int(_612)][_614];
        float _618 = _582 * 6.283185482025146484375;
        float _620 = sin(_618);
        float _622 = _582 * 6.283185482025146484375;
        float _624 = cos(_622);
        float _626 = _584 * 6.283185482025146484375;
        float _628 = cos(_626);
        float _630 = _620 * _606;
        float _632 = _580 * 6.283185482025146484375;
        float _634 = sin(_632);
        float _636 = _606 * _624;
        float _638 = _584 * 6.283185482025146484375;
        float _640 = sin(_638);
        float _642 = _606 * _628;
        float _644 = _628 * _624;
        float _646 = _620 * _628;
        float _648 = _634 * _628;
        float _650 = _634 * _620;
        float _652 = _634 * _624;
        float _654 = _634 * _640;
        float _656 = fma(_640, _636, _650);
        float _658 = -_652;
        float _660 = fma(_640, _630, _658);
        float _662 = -_630;
        float _664 = fma(_624, _654, _662);
        float _666 = fma(_620, _654, _636);
        float _668 = -_476;
        float _670 = _668 + _496;
        float _672 = -_478;
        float _674 = _672 + _498;
        float _676 = -_518;
        float _678 = _676 + _538;
        float _680 = fma(_670, _594, _476);
        float _682 = -_474;
        float _684 = _682 + _494;
        float _686 = fma(_674, _594, _478);
        float _688 = -_558;
        float _690 = _688 + _578;
        float _692 = _680 * 0.15915493667125701904296875;
        float _694 = fma(_684, _594, _474);
        float _696 = _686 * 0.15915493667125701904296875;
        float _698 = fma(_678, _594, _518);
        float _700 = _692 * 6.283185482025146484375;
        float _702 = cos(_700);
        float _704 = _694 * 0.15915493667125701904296875;
        float _706 = fma(_690, _594, _558);
        float _708 = _698 * _602;
        float _710 = _696 * 6.283185482025146484375;
        float _712 = sin(_710);
        float _714 = _696 * 6.283185482025146484375;
        float _716 = cos(_714);
        float _718 = _704 * 6.283185482025146484375;
        float _720 = cos(_718);
        float _722 = _712 * _702;
        float _724 = _692 * 6.283185482025146484375;
        float _726 = sin(_724);
        float _728 = _702 * _716;
        float _730 = _728 * _602;
        float _732 = _704 * 6.283185482025146484375;
        float _734 = sin(_732);
        float _736 = _720 * _716;
        float _738 = _712 * _720;
        float _740 = _720 * _702;
        float _742 = fma(_644, _616, _730);
        float _744 = _734 * _726;
        float _746 = _734 * _702;
        float _748 = _734 * _712;
        float _750 = _734 * _716;
        float _752 = _640 * _616;
        float _754 = -_738;
        float _756 = fma(_716, _744, _754);
        float _758 = _722 * _602;
        float _760 = fma(_712, _744, _736);
        float _762 = -_726;
        float _764 = -_752;
        float _766 = fma(_762, _602, _764);
        float _768 = _756 * _602;
        float _770 = -_750;
        float _772 = fma(_726, _738, _770);
        float _774 = fma(_646, _616, _758);
        float _776 = _760 * _602;
        float _778 = fma(_726, _736, _748);
        float _780 = fma(_664, _616, _768);
        float _782 = _774 * _774;
        float _784 = _772 * _602;
        float _786 = fma(_666, _616, _776);
        float _788 = _778 * _602;
        float _790 = fma(_742, _742, _782);
        float _792 = fma(_660, _616, _784);
        float _794 = _746 * _602;
        float _796 = fma(_656, _616, _788);
        float _798 = fma(_766, _766, _790);
        float _800 = _740 * _602;
        float _802 = _792 * _792;
        float _804 = _786 * _786;
        float _806 = fma(_648, _616, _794);
        float _808 = fma(_642, _616, _800);
        float _810 = fma(_796, _796, _802);
        float _812 = rsqrt(_798);
        float _814 = fma(_780, _780, _804);
        float _816 = -_514;
        float _818 = _816 + _534;
        float _820 = fma(_808, _808, _810);
        float _822 = -_516;
        float _824 = _822 + _536;
        float _826 = fma(_806, _806, _814);
        float _828 = -_556;
        float _830 = _828 + _576;
        float _832 = fma(_818, _594, _514);
        float _834 = fma(_824, _594, _516);
        float _836 = rsqrt(_820);
        float _838 = fma(_830, _594, _556);
        float _840 = _832 * _602;
        float _842 = fma(_400, _616, _708);
        float _844 = _838 * _602;
        float _846 = fma(_402, _616, _840);
        float _848 = _774 * _812;
        float _850 = rsqrt(_826);
        float _852 = -_554;
        float _854 = _852 + _574;
        float _856 = _742 * _812;
        float _858 = _766 * _812;
        float _860 = fma(_404, _616, _844);
        float _862 = fma(_854, _594, _554);
        float _864 = _706 * _602;
        float _866 = _792 * _836;
        float _868 = _834 * _602;
        float _870 = _862 * _602;
        float _872 = _808 * _836;
        float _874 = fma(_406, _616, _864);
        float _876 = fma(_408, _616, _868);
        float _878 = fma(_410, _616, _870);
        float _880 = _780 * _850;
        float _882 = _786 * _850;
        float _884 = _806 * _850;
        float _886 = _796 * _836;
        _430 = _846;
        _888 = _856;
        _890 = _848;
        _892 = _858;
        _894 = _876;
        _896 = _880;
        _898 = _882;
        _900 = _884;
        _902 = _842;
        _904 = _886;
        _906 = _866;
        _908 = _872;
        _910 = as_type<int>(_878);
        _432 = as_type<int>(_860);
        _434 = as_type<int>(_874);
        _912 = _864;
        _121 = _844;
        _914 = _812;
        _916 = true;
    }
    else
    {
        float _918 = _394 * 2.0;
        float _920 = _396 * _412;
        float _922 = _398 * _412;
        float _924 = _398 * _398;
        float _926 = -_920;
        float _928 = fma(_918, _398, _926);
        float _930 = fma(_918, _398, _920);
        float _932 = _394 * _412;
        float _934 = _394 * _394;
        float _936 = fma(_918, _396, _922);
        float _938 = -_922;
        float _940 = fma(_918, _396, _938);
        float _942 = _398 * 2.0;
        float _944 = _396 * _396;
        float _946 = fma(_924, -2.0, 1.0);
        float _948 = fma(_934, -2.0, 1.0);
        float _950 = -_932;
        float _952 = fma(_942, _396, _950);
        float _954 = fma(_942, _396, _932);
        float _956 = fma(_944, -2.0, _946);
        float _958 = fma(_944, -2.0, _948);
        float _960 = fma(_924, -2.0, _948);
        _888 = _956;
        _890 = _930;
        _892 = _940;
        _894 = _408;
        _896 = _928;
        _898 = _958;
        _900 = _954;
        _902 = _400;
        _904 = _936;
        _906 = _952;
        _908 = _960;
        _910 = as_type<int>(_410);
        _912 = _942;
        _914 = 2.0;
    }
    _916 = false;
    float _962 = _430;
    float _964 = _888;
    float _966 = _890;
    float _968 = _892;
    float _970 = _894;
    float _972 = _896;
    float _974 = _898;
    float _976 = _900;
    float _978 = _902;
    float _980 = _904;
    float _982 = _906;
    float _984 = _908;
    int _986 = _910;
    int _988 = _432;
    int _990 = _434;
    float _992 = _912;
    float _994 = _121;
    float _996 = _914;
    float _998 = _962 * _964;
    float _1000 = _962 * _966;
    float _1002 = _962 * _968;
    float _1004 = _970 * _972;
    float _1006 = _970 * _974;
    float _1008 = _970 * _976;
    int _1010 = _66 * 48;
    float _1012 = _978 * _980;
    float _1014 = _978 * _982;
    float _1016 = _978 * _984;
    bool _1018 = _66 != 0;
    uint _1020 = uint(int(uint(_1010) >> uint(2)));
    _37[int(_1020)] = as_type<uint>(_998);
    int _1022 = _1010 + 4;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    _37[int(_1024)] = as_type<uint>(_1004);
    int _1026 = _1010 + 8;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    _37[int(_1028)] = as_type<uint>(_1012);
    int _1030 = _1010 + 12;
    uint _1032 = uint(int(uint(_1030) >> uint(2)));
    _37[int(_1032)] = uint(_986);
    int _1034 = _66 * 112;
    int _1036 = _1010 + 16;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    _37[int(_1038)] = as_type<uint>(_1000);
    int _1040 = _1010 + 20;
    uint _1042 = uint(int(uint(_1040) >> uint(2)));
    _37[int(_1042)] = as_type<uint>(_1006);
    int _1044 = _1010 + 24;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    _37[int(_1046)] = as_type<uint>(_1014);
    int _1048 = _1010 + 28;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    _37[int(_1050)] = uint(_988);
    int _1052 = _1010 + 32;
    uint _1054 = uint(int(uint(_1052) >> uint(2)));
    _37[int(_1054)] = as_type<uint>(_1002);
    int _1056 = _1010 + 36;
    uint _1058 = uint(int(uint(_1056) >> uint(2)));
    _37[int(_1058)] = as_type<uint>(_1008);
    int _1060 = _1010 + 40;
    uint _1062 = uint(int(uint(_1060) >> uint(2)));
    _37[int(_1062)] = as_type<uint>(_1016);
    int _1064 = _1010 + 44;
    uint _1066 = uint(int(uint(_1064) >> uint(2)));
    _37[int(_1066)] = uint(_990);
    float _1068 = _996;
    float _1070 = _994;
    float _1072 = _962;
    float _1074 = _978;
    float _1076 = _992;
    float _1078 = _970;
    float _1080 = _1008;
    float _1082 = _1016;
    float _1084 = as_type<float>(_990);
    if (!_1018)
    {
        _1068 = _998;
    }
    float _1086 = _1068;
    float _1088 = _1086;
    if (!_1018)
    {
        _1070 = _1004;
    }
    float _1090 = _1070;
    float _1092 = _1090;
    if (!_1018)
    {
        _436 = _1012;
    }
    float _1094 = _436;
    float _1096 = _1094;
    if (!_1018)
    {
        _438 = as_type<float>(_986);
    }
    float _1098 = _438;
    float _1100 = _1098;
    if (!_1018)
    {
        _1072 = _1000;
    }
    float _1102 = _1072;
    float _1104 = _1102;
    if (!_1018)
    {
        _440 = _1006;
    }
    float _1106 = _440;
    float _1108 = _1106;
    if (!_1018)
    {
        _1074 = _1014;
    }
    float _1110 = _1074;
    float _1112 = _1110;
    if (!_1018)
    {
        _1076 = as_type<float>(_988);
    }
    float _1114 = _1076;
    float _1116 = _1114;
    if (!_1018)
    {
        _1078 = _1002;
    }
    float _1118 = _1078;
    bool _1120 = !_1018;
    float _1122 = _1118;
    if (!_1120)
    {
        bool _1124 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1126 = !_1124;
        if (!_1126)
        {
            uint _1128 = uint(int(uint(_1034) >> uint(2)));
            uint _1130 = uint(int(uint(int(_1128)) >> uint(2)));
            int _1132 = int(_1128) & 3;
            float _1134 = (*spvDescriptorSet0.cp_c6)._m0[int(_1130)][_1132];
            int _1136 = as_type<int>(_1134) * 48;
            int _1138 = 0;
            bool _1140;
            float _1236;
            float _1240;
            float _1244;
            float _1248;
            float _1262;
            float _1264;
            float _1276;
            float _1286;
            float _1288;
            float _1290;
            float _1292;
            float _1294;
            do
            {
                int _1142 = _1138;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1144 = uint(int(uint(_1136) >> uint(2)));
                float _1146 = as_type<float>(_37[int(_1144)]);
                int _1148 = _1136 + 4;
                uint _1150 = uint(int(uint(_1148) >> uint(2)));
                float _1152 = as_type<float>(_37[int(_1150)]);
                int _1154 = _1136 + 8;
                uint _1156 = uint(int(uint(_1154) >> uint(2)));
                float _1158 = as_type<float>(_37[int(_1156)]);
                int _1160 = _1136 + 12;
                uint _1162 = uint(int(uint(_1160) >> uint(2)));
                float _1164 = as_type<float>(_37[int(_1162)]);
                int _1166 = _1142 + 1;
                int _1168 = _1136 + 16;
                uint _1170 = uint(int(uint(_1168) >> uint(2)));
                float _1172 = as_type<float>(_37[int(_1170)]);
                int _1174 = _1136 + 20;
                uint _1176 = uint(int(uint(_1174) >> uint(2)));
                float _1178 = as_type<float>(_37[int(_1176)]);
                int _1180 = _1136 + 24;
                uint _1182 = uint(int(uint(_1180) >> uint(2)));
                float _1184 = as_type<float>(_37[int(_1182)]);
                int _1186 = _1136 + 28;
                uint _1188 = uint(int(uint(_1186) >> uint(2)));
                float _1190 = as_type<float>(_37[int(_1188)]);
                bool _1192 = uint(_1166) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1194 = _1136 + 32;
                uint _1196 = uint(int(uint(_1194) >> uint(2)));
                float _1198 = as_type<float>(_37[int(_1196)]);
                int _1200 = _1136 + 36;
                uint _1202 = uint(int(uint(_1200) >> uint(2)));
                float _1204 = as_type<float>(_37[int(_1202)]);
                int _1206 = _1136 + 40;
                uint _1208 = uint(int(uint(_1206) >> uint(2)));
                float _1210 = as_type<float>(_37[int(_1208)]);
                int _1212 = _1136 + 44;
                uint _1214 = uint(int(uint(_1212) >> uint(2)));
                float _1216 = as_type<float>(_37[int(_1214)]);
                float _1218 = _1152 * as_type<float>(_988);
                float _1220 = _1000 * _1152;
                float _1222 = _1006 * _1152;
                float _1224 = _1014 * _1152;
                float _1226 = fma(_1146, as_type<float>(_986), _1218);
                float _1228 = fma(_998, _1146, _1220);
                float _1230 = fma(_1004, _1146, _1222);
                float _1232 = fma(_1012, _1146, _1224);
                float _1234 = fma(_1158, as_type<float>(_990), _1226);
                _1236 = fma(_1002, _1158, _1228);
                float _1238 = _1000 * _1178;
                _1240 = fma(_1016, _1158, _1232);
                float _1242 = _1178 * as_type<float>(_988);
                _1244 = _1164 + _1234;
                float _1246 = _1006 * _1178;
                _1248 = fma(_1008, _1158, _1230);
                float _1250 = fma(_1172, as_type<float>(_986), _1242);
                float _1252 = fma(_998, _1172, _1238);
                float _1254 = fma(_1004, _1172, _1246);
                float _1256 = _1014 * _1178;
                float _1258 = fma(_1184, as_type<float>(_990), _1250);
                float _1260 = _1204 * as_type<float>(_988);
                _1262 = fma(_1002, _1184, _1252);
                _1264 = fma(_1008, _1184, _1254);
                float _1266 = _1000 * _1204;
                float _1268 = _1006 * _1204;
                float _1270 = _1014 * _1204;
                float _1272 = fma(_1198, as_type<float>(_986), _1260);
                float _1274 = fma(_1012, _1172, _1256);
                _1276 = _1190 + _1258;
                float _1278 = fma(_998, _1198, _1266);
                float _1280 = fma(_1004, _1198, _1268);
                float _1282 = fma(_1012, _1198, _1270);
                float _1284 = fma(_1210, as_type<float>(_990), _1272);
                _1286 = fma(_1016, _1184, _1274);
                _1288 = fma(_1002, _1210, _1278);
                _1290 = fma(_1008, _1210, _1280);
                _1292 = fma(_1016, _1210, _1282);
                _1294 = _1216 + _1284;
                uint _1296 = uint(int(uint(_1010) >> uint(2)));
                _37[int(_1296)] = as_type<uint>(_1236);
                int _1298 = _1010 + 4;
                uint _1300 = uint(int(uint(_1298) >> uint(2)));
                _37[int(_1300)] = as_type<uint>(_1248);
                int _1302 = _1010 + 8;
                uint _1304 = uint(int(uint(_1302) >> uint(2)));
                _37[int(_1304)] = as_type<uint>(_1240);
                int _1306 = _1010 + 12;
                uint _1308 = uint(int(uint(_1306) >> uint(2)));
                _37[int(_1308)] = as_type<uint>(_1244);
                int _1310 = _1010 + 16;
                uint _1312 = uint(int(uint(_1310) >> uint(2)));
                _37[int(_1312)] = as_type<uint>(_1262);
                int _1314 = _1010 + 20;
                uint _1316 = uint(int(uint(_1314) >> uint(2)));
                _37[int(_1316)] = as_type<uint>(_1264);
                int _1318 = _1010 + 24;
                uint _1320 = uint(int(uint(_1318) >> uint(2)));
                _37[int(_1320)] = as_type<uint>(_1286);
                int _1322 = _1010 + 28;
                uint _1324 = uint(int(uint(_1322) >> uint(2)));
                _37[int(_1324)] = as_type<uint>(_1276);
                int _1326 = _1010 + 32;
                uint _1328 = uint(int(uint(_1326) >> uint(2)));
                _37[int(_1328)] = as_type<uint>(_1288);
                int _1330 = _1010 + 36;
                uint _1332 = uint(int(uint(_1330) >> uint(2)));
                _37[int(_1332)] = as_type<uint>(_1290);
                int _1334 = _1010 + 40;
                uint _1336 = uint(int(uint(_1334) >> uint(2)));
                _37[int(_1336)] = as_type<uint>(_1292);
                int _1338 = _1010 + 44;
                uint _1340 = uint(int(uint(_1338) >> uint(2)));
                _37[int(_1340)] = as_type<uint>(_1294);
                _1140 = !_1192;
                _1138 = _1166;
            } while (_1140);
            _1080 = _1290;
            _1092 = _1248;
            _1108 = _1264;
            _1122 = _1288;
            _1088 = _1236;
            _1104 = _1262;
            _1112 = _1286;
            _1082 = _1292;
            _1096 = _1240;
            _1116 = _1276;
            _1100 = _1244;
            _1084 = _1294;
            _1342 = true;
        }
        else
        {
            _1080 = 0.0;
            _1092 = 0.0;
            _1108 = 0.0;
            _1122 = 0.0;
            _1088 = 0.0;
            _1104 = 0.0;
            _1112 = 0.0;
            _1082 = 0.0;
            _1096 = 0.0;
            _1116 = 0.0;
            _1100 = 0.0;
            _1084 = 0.0;
        }
    }
    _1342 = false;
    float _1344 = _1080;
    float _1346 = _1092;
    float _1348 = _1108;
    float _1350 = _1122;
    float _1352 = _1088;
    float _1354 = _1104;
    float _1356 = _1112;
    float _1358 = _1082;
    float _1360 = _1096;
    float _1362 = _1116;
    float _1364 = _1100;
    float _1366 = _1084;
    int _1368 = _1034 + 80;
    uint _1370 = uint(int(uint(_1368) >> uint(2)));
    uint _1372 = uint(int(uint(int(_1370)) >> uint(2)));
    int _1374 = int(_1370) & 3;
    float _1376 = (*spvDescriptorSet0.cp_c6)._m0[int(_1372)][_1374];
    int _1378 = int(_1370) + 1;
    uint _1380 = uint(int(uint(_1378) >> uint(2)));
    int _1382 = _1378 & 3;
    float _1384 = (*spvDescriptorSet0.cp_c6)._m0[int(_1380)][_1382];
    int _1386 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1388 = _1386 + _66;
    int _1390 = _1034 + 64;
    uint _1392 = uint(int(uint(_1390) >> uint(2)));
    uint _1394 = uint(int(uint(int(_1392)) >> uint(2)));
    int _1396 = int(_1392) & 3;
    float _1398 = (*spvDescriptorSet0.cp_c6)._m0[int(_1394)][_1396];
    int _1400 = int(_1392) + 1;
    uint _1402 = uint(int(uint(_1400) >> uint(2)));
    int _1404 = _1400 & 3;
    float _1406 = (*spvDescriptorSet0.cp_c6)._m0[int(_1402)][_1404];
    int _1408 = _1388 * 48;
    int _1410 = _1034 + 88;
    uint _1412 = uint(int(uint(_1410) >> uint(2)));
    uint _1414 = uint(int(uint(int(_1412)) >> uint(2)));
    int _1416 = int(_1412) & 3;
    float _1418 = (*spvDescriptorSet0.cp_c6)._m0[int(_1414)][_1416];
    int _1420 = int(_1412) + 1;
    uint _1422 = uint(int(uint(_1420) >> uint(2)));
    int _1424 = _1420 & 3;
    float _1426 = (*spvDescriptorSet0.cp_c6)._m0[int(_1422)][_1424];
    int _1428 = _1034 + 72;
    uint _1430 = uint(int(uint(_1428) >> uint(2)));
    uint _1432 = uint(int(uint(int(_1430)) >> uint(2)));
    int _1434 = int(_1430) & 3;
    float _1436 = (*spvDescriptorSet0.cp_c6)._m0[int(_1432)][_1434];
    int _1438 = int(_1430) + 1;
    uint _1440 = uint(int(uint(_1438) >> uint(2)));
    int _1442 = _1438 & 3;
    float _1444 = (*spvDescriptorSet0.cp_c6)._m0[int(_1440)][_1442];
    int _1446 = _1034 + 96;
    uint _1448 = uint(int(uint(_1446) >> uint(2)));
    uint _1450 = uint(int(uint(int(_1448)) >> uint(2)));
    int _1452 = int(_1448) & 3;
    float _1454 = (*spvDescriptorSet0.cp_c6)._m0[int(_1450)][_1452];
    int _1456 = int(_1448) + 1;
    uint _1458 = uint(int(uint(_1456) >> uint(2)));
    int _1460 = _1456 & 3;
    float _1462 = (*spvDescriptorSet0.cp_c6)._m0[int(_1458)][_1460];
    int _1464 = _1034 + 104;
    uint _1466 = uint(int(uint(_1464) >> uint(2)));
    uint _1468 = uint(int(uint(int(_1466)) >> uint(2)));
    int _1470 = int(_1466) & 3;
    float _1472 = (*spvDescriptorSet0.cp_c6)._m0[int(_1468)][_1470];
    int _1474 = int(_1466) + 1;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    int _1478 = _1474 & 3;
    float _1480 = (*spvDescriptorSet0.cp_c6)._m0[int(_1476)][_1478];
    float _1482 = _1344 * _1376;
    int _1484 = _1034 + 16;
    uint _1486 = uint(int(uint(_1484) >> uint(2)));
    uint _1488 = uint(int(uint(int(_1486)) >> uint(2)));
    int _1490 = int(_1486) & 3;
    float _1492 = (*spvDescriptorSet0.cp_c6)._m0[int(_1488)][_1490];
    int _1494 = int(_1486) + 1;
    uint _1496 = uint(int(uint(_1494) >> uint(2)));
    int _1498 = _1494 & 3;
    float _1500 = (*spvDescriptorSet0.cp_c6)._m0[int(_1496)][_1498];
    float _1502 = _1346 * _1376;
    float _1504 = _1348 * _1376;
    float _1506 = _1348 * _1384;
    float _1508 = fma(_1350, _1398, _1482);
    float _1510 = _1344 * _1384;
    int _1512 = _1034 + 32;
    uint _1514 = uint(int(uint(_1512) >> uint(2)));
    uint _1516 = uint(int(uint(int(_1514)) >> uint(2)));
    int _1518 = int(_1514) & 3;
    float _1520 = (*spvDescriptorSet0.cp_c6)._m0[int(_1516)][_1518];
    int _1522 = int(_1514) + 1;
    uint _1524 = uint(int(uint(_1522) >> uint(2)));
    int _1526 = _1522 & 3;
    float _1528 = (*spvDescriptorSet0.cp_c6)._m0[int(_1524)][_1526];
    float _1530 = fma(_1352, _1398, _1502);
    float _1532 = fma(_1354, _1398, _1504);
    float _1534 = fma(_1354, _1406, _1506);
    float _1536 = _1346 * _1384;
    float _1538 = fma(_1350, _1406, _1510);
    float _1540 = _1346 * _1418;
    float _1542 = _1348 * _1418;
    int _1544 = _1034 + 48;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    uint _1548 = uint(int(uint(int(_1546)) >> uint(2)));
    int _1550 = int(_1546) & 3;
    float _1552 = (*spvDescriptorSet0.cp_c6)._m0[int(_1548)][_1550];
    int _1554 = int(_1546) + 1;
    uint _1556 = uint(int(uint(_1554) >> uint(2)));
    int _1558 = _1554 & 3;
    float _1560 = (*spvDescriptorSet0.cp_c6)._m0[int(_1556)][_1558];
    float _1562 = _1346 * _1426;
    float _1564 = _1348 * _1426;
    float _1566 = _1344 * _1418;
    float _1568 = _1344 * _1426;
    float _1570 = fma(_1352, _1406, _1536);
    float _1572 = fma(_1354, _1436, _1542);
    float _1574 = fma(_1354, _1444, _1564);
    int _1576 = _1034 + 24;
    uint _1578 = uint(int(uint(_1576) >> uint(2)));
    uint _1580 = uint(int(uint(int(_1578)) >> uint(2)));
    int _1582 = int(_1578) & 3;
    float _1584 = (*spvDescriptorSet0.cp_c6)._m0[int(_1580)][_1582];
    int _1586 = int(_1578) + 1;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    int _1590 = _1586 & 3;
    float _1592 = (*spvDescriptorSet0.cp_c6)._m0[int(_1588)][_1590];
    float _1594 = fma(_1352, _1436, _1540);
    float _1596 = fma(_1352, _1444, _1562);
    float _1598 = fma(_1350, _1436, _1566);
    float _1600 = fma(_1350, _1444, _1568);
    float _1602 = fma(_1356, _1454, _1532);
    float _1604 = fma(_1356, _1462, _1534);
    int _1606 = _1034 + 40;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    uint _1610 = uint(int(uint(int(_1608)) >> uint(2)));
    int _1612 = int(_1608) & 3;
    float _1614 = (*spvDescriptorSet0.cp_c6)._m0[int(_1610)][_1612];
    int _1616 = int(_1608) + 1;
    uint _1618 = uint(int(uint(_1616) >> uint(2)));
    int _1620 = _1616 & 3;
    float _1622 = (*spvDescriptorSet0.cp_c6)._m0[int(_1618)][_1620];
    float _1624 = fma(_1358, _1454, _1508);
    float _1626 = fma(_1360, _1454, _1530);
    float _1628 = fma(_1360, _1462, _1570);
    float _1630 = fma(_1358, _1462, _1538);
    float _1632 = fma(_1356, _1472, _1572);
    float _1634 = fma(_1356, _1480, _1574);
    int _1636 = _1034 + 56;
    uint _1638 = uint(int(uint(_1636) >> uint(2)));
    uint _1640 = uint(int(uint(int(_1638)) >> uint(2)));
    int _1642 = int(_1638) & 3;
    float _1644 = (*spvDescriptorSet0.cp_c6)._m0[int(_1640)][_1642];
    int _1646 = int(_1638) + 1;
    uint _1648 = uint(int(uint(_1646) >> uint(2)));
    int _1650 = _1646 & 3;
    float _1652 = (*spvDescriptorSet0.cp_c6)._m0[int(_1648)][_1650];
    float _1654 = fma(_1360, _1472, _1594);
    float _1656 = fma(_1360, _1480, _1596);
    float _1658 = _1634 + _1362;
    float _1660 = fma(_1358, _1480, _1600);
    float _1662 = fma(_1358, _1472, _1598);
    float _1664 = _1656 + _1364;
    float _1666 = _1658 * _1500;
    float _1668 = _1660 + _1366;
    float _1670 = _1602 * _1500;
    float _1672 = _1604 * _1500;
    float _1674 = fma(_1664, _1492, _1666);
    float _1676 = _1632 * _1500;
    float _1678 = fma(_1626, _1492, _1670);
    float _1680 = fma(_1628, _1492, _1672);
    float _1682 = _1602 * _1528;
    float _1684 = _1658 * _1528;
    float _1686 = _1604 * _1528;
    float _1688 = _1632 * _1528;
    float _1690 = fma(_1626, _1520, _1682);
    float _1692 = fma(_1664, _1520, _1684);
    float _1694 = fma(_1654, _1492, _1676);
    float _1696 = fma(_1654, _1520, _1688);
    float _1698 = _1602 * _1560;
    float _1700 = _1658 * _1560;
    float _1702 = _1604 * _1560;
    float _1704 = _1632 * _1560;
    float _1706 = fma(_1626, _1552, _1698);
    float _1708 = fma(_1664, _1552, _1700);
    float _1710 = fma(_1628, _1552, _1702);
    float _1712 = fma(_1654, _1552, _1704);
    float _1714 = fma(_1668, _1584, _1674);
    float _1716 = fma(_1628, _1520, _1686);
    float _1718 = fma(_1630, _1584, _1680);
    float _1720 = fma(_1624, _1584, _1678);
    float _1722 = _1714 + _1592;
    float _1724 = fma(_1662, _1584, _1694);
    float _1726 = fma(_1668, _1614, _1692);
    float _1728 = fma(_1624, _1614, _1690);
    float _1730 = fma(_1662, _1614, _1696);
    float _1732 = fma(_1630, _1614, _1716);
    float _1734 = _1726 + _1622;
    float _1736 = fma(_1668, _1644, _1708);
    float _1738 = fma(_1624, _1644, _1706);
    float _1740 = fma(_1630, _1644, _1710);
    float _1742 = fma(_1662, _1644, _1712);
    int _1744 = _1408 + 16;
    float _1746 = _1736 + _1652;
    int _1748 = _1408 + 32;
    int _1750 = _1408 + 48;
    uint _1752 = uint(int(uint(_1744) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1752)] = as_type<uint>(_1720);
    int _1754 = _1744 + 4;
    uint _1756 = uint(int(uint(_1754) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1756)] = as_type<uint>(_1718);
    int _1758 = _1744 + 8;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1760)] = as_type<uint>(_1724);
    int _1762 = _1744 + 12;
    uint _1764 = uint(int(uint(_1762) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1764)] = as_type<uint>(_1722);
    uint _1766 = uint(int(uint(_1748) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1766)] = as_type<uint>(_1728);
    int _1768 = _1748 + 4;
    uint _1770 = uint(int(uint(_1768) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1770)] = as_type<uint>(_1732);
    int _1772 = _1748 + 8;
    uint _1774 = uint(int(uint(_1772) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1774)] = as_type<uint>(_1730);
    int _1776 = _1748 + 12;
    uint _1778 = uint(int(uint(_1776) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1778)] = as_type<uint>(_1734);
    uint _1780 = uint(int(uint(_1750) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1780)] = as_type<uint>(_1738);
    int _1782 = _1750 + 4;
    uint _1784 = uint(int(uint(_1782) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1784)] = as_type<uint>(_1740);
    int _1786 = _1750 + 8;
    uint _1788 = uint(int(uint(_1786) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1788)] = as_type<uint>(_1742);
    int _1790 = _1750 + 12;
    uint _1792 = uint(int(uint(_1790) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1792)] = as_type<uint>(_1746);
}

