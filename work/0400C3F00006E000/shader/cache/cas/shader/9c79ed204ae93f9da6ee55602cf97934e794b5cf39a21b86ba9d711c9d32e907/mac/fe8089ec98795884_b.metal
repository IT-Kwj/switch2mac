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
int _58(thread const int& _4340, thread const int& _4341, constant _10& support_buffer)
{
    int _4344 = 1 + _4341;
    float _4346 = support_buffer._m5[_4344].x;
    bool _4348 = _4346 == 1.0;
    if (_4348)
    {
        return _4340;
    }
    float _4350 = float(_4340);
    float _4352 = _4350 * _4346;
    int _4354 = int(_4352);
    return _4354;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1222 = false;
    bool _786 = false;
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
    float _149 = 0.0;
    float _151 = _145;
    if (!_117)
    {
        _147 = 0.0;
        _149 = 0.0;
    }
    float _153 = _147;
    float _155 = _149;
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
        int3 _1905 = int3(_199, _205, 1);
        float4 _208 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1905.xy), uint(_1905.z), 0).xyzw;
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
        int3 _1925 = int3(_222, _228, 1);
        float4 _230 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1925.xy), uint(_1925.z), 0).xyzw;
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
        int3 _1945 = int3(_244, _250, 0);
        float3 _254 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1945.xy), uint(_1945.z), 0).xyz;
        float _256 = _254.x;
        float _258 = _254.y;
        float _260 = _254.z;
        int _262 = _68;
        int _264 = 0;
        int _266 = _58(_262, _264, (*spvDescriptorSet0.support_buffer));
        int _268 = as_type<int>(_193);
        int _270 = 0;
        int _272 = _58(_268, _270, (*spvDescriptorSet0.support_buffer));
        int3 _1963 = int3(_266, _272, 0);
        float3 _274 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1963.xy), uint(_1963.z), 0).xyz;
        float _276 = _274.x;
        float _278 = _274.y;
        float _280 = _274.z;
        int _282 = _68;
        int _284 = 0;
        int _286 = _58(_282, _284, (*spvDescriptorSet0.support_buffer));
        int _288 = as_type<int>(_185);
        int _290 = 0;
        int _292 = _58(_288, _290, (*spvDescriptorSet0.support_buffer));
        int3 _1981 = int3(_286, _292, 2);
        float3 _294 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1981.xy), uint(_1981.z), 0).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        int _302 = _68;
        int _304 = 0;
        int _306 = _58(_302, _304, (*spvDescriptorSet0.support_buffer));
        int _308 = as_type<int>(_193);
        int _310 = 0;
        int _312 = _58(_308, _310, (*spvDescriptorSet0.support_buffer));
        int3 _1999 = int3(_306, _312, 2);
        float3 _314 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1999.xy), uint(_1999.z), 0).xyz;
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
        float _340 = -_216;
        float _342 = _340 + _238;
        float _344 = -_256;
        float _346 = _344 + _276;
        float _348 = -_214;
        float _350 = _348 + _236;
        float _352 = fma(_338, _330, _212);
        float _354 = -_258;
        float _356 = _354 + _278;
        float _358 = fma(_342, _330, _216);
        float _360 = -_260;
        float _362 = _360 + _280;
        float _364 = -_296;
        float _366 = _364 + _316;
        float _368 = -_298;
        float _370 = _368 + _318;
        float _372 = -_300;
        float _374 = _372 + _320;
        float _376 = fma(_346, _330, _256);
        float _378 = fma(_334, _330, _210);
        float _380 = fma(_350, _330, _214);
        float _382 = fma(_356, _330, _258);
        float _384 = fma(_362, _330, _260);
        float _386 = fma(_366, _330, _296);
        float _388 = fma(_370, _330, _298);
        float _390 = fma(_374, _330, _300);
        float _392 = _358 * 2.0;
        _171 = _380;
        _131 = _378;
        _167 = _352;
        _133 = _376;
        _141 = _390;
        _151 = _384;
        _143 = _382;
        _159 = _386;
        _161 = _388;
        _177 = _392;
    }
    float _394 = _171;
    float _396 = _131;
    float _398 = _167;
    float _400 = _133;
    float _402 = _141;
    float _404 = _151;
    float _406 = _143;
    float _408 = _159;
    float _410 = _161;
    float _412 = _177;
    int _414 = _103 + 36;
    uint _416 = uint(int(uint(_414) >> uint(2)));
    uint _418 = uint(int(uint(int(_416)) >> uint(2)));
    int _420 = int(_416) & 3;
    float _422 = (*spvDescriptorSet0.cp_c5)._m0[int(_418)][_420];
    int _424 = _101 & as_type<int>(_422);
    bool _426 = _424 != 0;
    bool _428 = !_426;
    float _430 = _400;
    float _432 = _406;
    float _434 = _402;
    float _436 = _410;
    float _438 = _408;
    float _760;
    float _762;
    float _764;
    float _766;
    float _768;
    float _770;
    float _772;
    float _774;
    float _776;
    float _778;
    int _780;
    int _782;
    int _784;
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
        int3 _2215 = int3(_462, _468, 1);
        float3 _470 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2215.xy), uint(_2215.z), 0).xyz;
        float _472 = _470.x;
        float _474 = _470.y;
        float _476 = _470.z;
        int _478 = _68;
        int _480 = 1;
        int _482 = _58(_478, _480, (*spvDescriptorSet0.support_buffer));
        int _484 = as_type<int>(_456);
        int _486 = 1;
        int _488 = _58(_484, _486, (*spvDescriptorSet0.support_buffer));
        int3 _2233 = int3(_482, _488, 1);
        float3 _490 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2233.xy), uint(_2233.z), 0).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        int _498 = _68;
        int _500 = 1;
        int _502 = _58(_498, _500, (*spvDescriptorSet0.support_buffer));
        int _504 = as_type<int>(_448);
        int _506 = 1;
        int _508 = _58(_504, _506, (*spvDescriptorSet0.support_buffer));
        int3 _2251 = int3(_502, _508, 0);
        float3 _510 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2251.xy), uint(_2251.z), 0).xyz;
        float _512 = _510.x;
        float _514 = _510.y;
        float _516 = _510.z;
        int _518 = _68;
        int _520 = 1;
        int _522 = _58(_518, _520, (*spvDescriptorSet0.support_buffer));
        int _524 = as_type<int>(_456);
        int _526 = 1;
        int _528 = _58(_524, _526, (*spvDescriptorSet0.support_buffer));
        int3 _2269 = int3(_522, _528, 0);
        float3 _530 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2269.xy), uint(_2269.z), 0).xyz;
        float _532 = _530.x;
        float _534 = _530.y;
        float _536 = _530.z;
        int _538 = _68;
        int _540 = 1;
        int _542 = _58(_538, _540, (*spvDescriptorSet0.support_buffer));
        int _544 = as_type<int>(_448);
        int _546 = 1;
        int _548 = _58(_544, _546, (*spvDescriptorSet0.support_buffer));
        int3 _2287 = int3(_542, _548, 2);
        float3 _550 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2287.xy), uint(_2287.z), 0).xyz;
        float _552 = _550.x;
        float _554 = _550.y;
        float _556 = _550.z;
        int _558 = _68;
        int _560 = 1;
        int _562 = _58(_558, _560, (*spvDescriptorSet0.support_buffer));
        int _564 = as_type<int>(_456);
        int _566 = 1;
        int _568 = _58(_564, _566, (*spvDescriptorSet0.support_buffer));
        int3 _2305 = int3(_562, _568, 2);
        float3 _570 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2305.xy), uint(_2305.z), 0).xyz;
        float _572 = _570.x;
        float _574 = _570.y;
        float _576 = _570.z;
        int _578 = _103 + 24;
        uint _580 = uint(int(uint(_578) >> uint(2)));
        uint _582 = uint(int(uint(int(_580)) >> uint(2)));
        int _584 = int(_580) & 3;
        float _586 = (*spvDescriptorSet0.cp_c5)._m0[int(_582)][_584];
        int _588 = int(_580) + 1;
        uint _590 = uint(int(uint(_588) >> uint(2)));
        int _592 = _588 & 3;
        float _594 = (*spvDescriptorSet0.cp_c5)._m0[int(_590)][_592];
        int _596 = _103 + 20;
        uint _598 = uint(int(uint(_596) >> uint(2)));
        uint _600 = uint(int(uint(int(_598)) >> uint(2)));
        int _602 = int(_598) & 3;
        float _604 = (*spvDescriptorSet0.cp_c5)._m0[int(_600)][_602];
        float _606 = -_476;
        float _608 = _606 + _496;
        float _610 = -_472;
        float _612 = _610 + _492;
        float _614 = fma(_608, _586, _476);
        float _616 = fma(_612, _586, _472);
        float _618 = _614 * _594;
        float _620 = _616 * _594;
        float _622 = fma(_394, _604, _618);
        float _624 = -_474;
        float _626 = _624 + _494;
        float _628 = fma(_396, _604, _620);
        float _630 = _622 * 0.15915493667125701904296875;
        float _632 = fma(_626, _586, _474);
        float _634 = _628 * 0.15915493667125701904296875;
        float _636 = _630 * 6.283185482025146484375;
        float _638 = sin(_636);
        float _640 = _632 * _594;
        float _642 = fma(_398, _604, _640);
        float _644 = _634 * 6.283185482025146484375;
        float _646 = sin(_644);
        float _648 = _642 * 0.15915493667125701904296875;
        float _650 = _634 * 6.283185482025146484375;
        float _652 = cos(_650);
        float _654 = _630 * 6.283185482025146484375;
        float _656 = cos(_654);
        float _658 = -_512;
        float _660 = _658 + _532;
        float _662 = _646 * _638;
        float _664 = -_516;
        float _666 = _664 + _536;
        float _668 = -_556;
        float _670 = _668 + _576;
        float _672 = fma(_660, _586, _512);
        float _674 = fma(_666, _586, _516);
        float _676 = _648 * 6.283185482025146484375;
        float _678 = sin(_676);
        float _680 = _638 * _652;
        float _682 = _672 * _594;
        float _684 = fma(_670, _586, _556);
        float _686 = fma(_400, _604, _682);
        float _688 = _684 * _594;
        float _690 = _648 * 6.283185482025146484375;
        float _692 = cos(_690);
        float _694 = _652 * _656;
        float _696 = fma(_402, _604, _688);
        float _698 = _646 * _678;
        float _700 = -_680;
        float _702 = fma(_656, _698, _700);
        float _704 = _652 * _692;
        float _706 = _692 * _656;
        float _708 = _638 * _692;
        float _710 = _646 * _692;
        float _712 = _646 * _656;
        float _714 = fma(_638, _698, _694);
        float _716 = fma(_678, _694, _662);
        float _718 = -_514;
        float _720 = _718 + _534;
        float _722 = -_552;
        float _724 = _722 + _572;
        float _726 = -_554;
        float _728 = _726 + _574;
        float _730 = -_712;
        float _732 = fma(_678, _680, _730);
        float _734 = fma(_720, _586, _514);
        float _736 = fma(_724, _586, _552);
        float _738 = fma(_728, _586, _554);
        float _740 = _674 * _594;
        float _742 = _734 * _594;
        float _744 = _736 * _594;
        float _746 = _738 * _594;
        float _748 = fma(_404, _604, _740);
        float _750 = fma(_406, _604, _742);
        float _752 = fma(_408, _604, _744);
        float _754 = fma(_410, _604, _746);
        float _756 = -_678;
        float _758 = _756 + (-0.0);
        _430 = _686;
        _760 = _758;
        _762 = _706;
        _764 = _708;
        _432 = _750;
        _766 = _702;
        _768 = _714;
        _770 = _710;
        _772 = _748;
        _774 = _716;
        _776 = _732;
        _778 = _704;
        _780 = as_type<int>(_752);
        _782 = as_type<int>(_754);
        _784 = as_type<int>(_696);
        _786 = true;
    }
    else
    {
        float _788 = _396 * 2.0;
        float _790 = _394 * _412;
        float _792 = _398 * _412;
        float _794 = _396 * _412;
        float _796 = -_790;
        float _798 = fma(_788, _398, _796);
        float _800 = fma(_788, _398, _790);
        float _802 = fma(_788, _394, _792);
        float _804 = -_792;
        float _806 = fma(_788, _394, _804);
        float _808 = _398 * _398;
        float _810 = _396 * _396;
        float _812 = _398 * 2.0;
        float _814 = _394 * _394;
        float _816 = fma(_808, -2.0, 1.0);
        float _818 = fma(_810, -2.0, 1.0);
        float _820 = -_794;
        float _822 = fma(_812, _394, _820);
        float _824 = fma(_812, _394, _794);
        float _826 = fma(_814, -2.0, _816);
        float _828 = fma(_814, -2.0, _818);
        float _830 = fma(_808, -2.0, _818);
        _760 = _806;
        _762 = _826;
        _764 = _800;
        _766 = _798;
        _768 = _828;
        _770 = _824;
        _772 = _404;
        _774 = _802;
        _776 = _822;
        _778 = _830;
        _780 = as_type<int>(_408);
        _782 = as_type<int>(_410);
        _784 = as_type<int>(_402);
    }
    _786 = false;
    float _832 = _430;
    float _834 = _760;
    float _836 = _762;
    float _838 = _764;
    float _840 = _432;
    float _842 = _766;
    float _844 = _768;
    float _846 = _770;
    float _848 = _772;
    float _850 = _774;
    float _852 = _776;
    float _854 = _778;
    int _856 = _780;
    int _858 = _782;
    int _860 = _784;
    float _862 = _832 * _834;
    float _864 = _832 * _836;
    float _866 = _832 * _838;
    float _868 = _840 * _842;
    float _870 = _840 * _844;
    float _872 = _840 * _846;
    int _874 = _68 * 48;
    float _876 = _848 * _850;
    float _878 = _848 * _852;
    float _880 = _848 * _854;
    bool _882 = _68 != 0;
    uint _884 = uint(int(uint(_874) >> uint(2)));
    _39[int(_884)] = as_type<uint>(_864);
    int _886 = _874 + 4;
    uint _888 = uint(int(uint(_886) >> uint(2)));
    _39[int(_888)] = as_type<uint>(_868);
    int _890 = _874 + 8;
    uint _892 = uint(int(uint(_890) >> uint(2)));
    _39[int(_892)] = as_type<uint>(_876);
    int _894 = _874 + 12;
    uint _896 = uint(int(uint(_894) >> uint(2)));
    _39[int(_896)] = uint(_856);
    int _898 = _68 * 112;
    int _900 = _874 + 16;
    int _902 = _874 + 16;
    uint _904 = uint(int(uint(_902) >> uint(2)));
    _39[int(_904)] = as_type<uint>(_866);
    int _906 = _874 + 20;
    uint _908 = uint(int(uint(_906) >> uint(2)));
    _39[int(_908)] = as_type<uint>(_870);
    int _910 = _874 + 24;
    uint _912 = uint(int(uint(_910) >> uint(2)));
    _39[int(_912)] = as_type<uint>(_878);
    int _914 = _874 + 28;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    _39[int(_916)] = uint(_858);
    int _918 = _874 + 32;
    int _920 = _874 + 32;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    _39[int(_922)] = as_type<uint>(_862);
    int _924 = _874 + 36;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    _39[int(_926)] = as_type<uint>(_872);
    int _928 = _874 + 40;
    uint _930 = uint(int(uint(_928) >> uint(2)));
    _39[int(_930)] = as_type<uint>(_880);
    int _932 = _874 + 44;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    _39[int(_934)] = uint(_860);
    float _936 = _840;
    float _938 = _842;
    float _940 = _836;
    float _942 = _832;
    float _944 = _848;
    float _946 = _852;
    float _948 = _844;
    float _950 = _838;
    float _952 = _850;
    if (!_882)
    {
        _434 = _864;
    }
    float _954 = _434;
    float _956 = _954;
    if (!_882)
    {
        _936 = _868;
    }
    float _958 = _936;
    float _960 = _958;
    if (!_882)
    {
        _436 = _876;
    }
    float _962 = _436;
    float _964 = _962;
    if (!_882)
    {
        _438 = as_type<float>(_856);
    }
    float _966 = _438;
    float _968 = _966;
    if (!_882)
    {
        _938 = _866;
    }
    float _970 = _938;
    float _972 = _970;
    if (!_882)
    {
        _940 = _870;
    }
    float _974 = _940;
    float _976 = _974;
    if (!_882)
    {
        _942 = _878;
    }
    float _978 = _942;
    float _980 = _978;
    if (!_882)
    {
        _944 = as_type<float>(_858);
    }
    float _982 = _944;
    float _984 = _982;
    if (!_882)
    {
        _946 = _862;
    }
    float _986 = _946;
    float _988 = _986;
    if (!_882)
    {
        _948 = _872;
    }
    float _990 = _948;
    float _992 = _990;
    if (!_882)
    {
        _950 = _880;
    }
    float _994 = _950;
    float _996 = _994;
    if (!_882)
    {
        _952 = as_type<float>(_860);
    }
    float _998 = _952;
    bool _1000 = !_882;
    float _1002 = _998;
    if (!_1000)
    {
        bool _1004 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1006 = !_1004;
        if (!_1006)
        {
            uint _1008 = uint(int(uint(_898) >> uint(2)));
            uint _1010 = uint(int(uint(int(_1008)) >> uint(2)));
            int _1012 = int(_1008) & 3;
            float _1014 = (*spvDescriptorSet0.cp_c6)._m0[int(_1010)][_1012];
            int _1016 = as_type<int>(_1014) * 48;
            int _1018 = 0;
            bool _1020;
            float _1118;
            float _1120;
            float _1128;
            float _1138;
            float _1140;
            float _1152;
            float _1164;
            float _1166;
            float _1168;
            float _1170;
            float _1172;
            float _1174;
            do
            {
                int _1022 = _1018;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1024 = uint(int(uint(_1016) >> uint(2)));
                float _1026 = as_type<float>(_39[int(_1024)]);
                int _1028 = _1016 + 4;
                uint _1030 = uint(int(uint(_1028) >> uint(2)));
                float _1032 = as_type<float>(_39[int(_1030)]);
                int _1034 = _1016 + 8;
                uint _1036 = uint(int(uint(_1034) >> uint(2)));
                float _1038 = as_type<float>(_39[int(_1036)]);
                int _1040 = _1016 + 12;
                uint _1042 = uint(int(uint(_1040) >> uint(2)));
                float _1044 = as_type<float>(_39[int(_1042)]);
                int _1046 = _1022 + 1;
                int _1048 = _1016 + 16;
                uint _1050 = uint(int(uint(_1048) >> uint(2)));
                float _1052 = as_type<float>(_39[int(_1050)]);
                int _1054 = _1016 + 20;
                uint _1056 = uint(int(uint(_1054) >> uint(2)));
                float _1058 = as_type<float>(_39[int(_1056)]);
                int _1060 = _1016 + 24;
                uint _1062 = uint(int(uint(_1060) >> uint(2)));
                float _1064 = as_type<float>(_39[int(_1062)]);
                int _1066 = _1016 + 28;
                uint _1068 = uint(int(uint(_1066) >> uint(2)));
                float _1070 = as_type<float>(_39[int(_1068)]);
                bool _1072 = uint(_1046) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1074 = _1016 + 32;
                uint _1076 = uint(int(uint(_1074) >> uint(2)));
                float _1078 = as_type<float>(_39[int(_1076)]);
                int _1080 = _1016 + 36;
                uint _1082 = uint(int(uint(_1080) >> uint(2)));
                float _1084 = as_type<float>(_39[int(_1082)]);
                int _1086 = _1016 + 40;
                uint _1088 = uint(int(uint(_1086) >> uint(2)));
                float _1090 = as_type<float>(_39[int(_1088)]);
                int _1092 = _1016 + 44;
                uint _1094 = uint(int(uint(_1092) >> uint(2)));
                float _1096 = as_type<float>(_39[int(_1094)]);
                float _1098 = _1032 * as_type<float>(_858);
                float _1100 = _866 * _1032;
                float _1102 = _870 * _1032;
                float _1104 = _878 * _1032;
                float _1106 = fma(_1026, as_type<float>(_856), _1098);
                float _1108 = fma(_864, _1026, _1100);
                float _1110 = fma(_868, _1026, _1102);
                float _1112 = fma(_876, _1026, _1104);
                float _1114 = fma(_1038, as_type<float>(_860), _1106);
                float _1116 = _1058 * as_type<float>(_858);
                _1118 = fma(_862, _1038, _1108);
                _1120 = fma(_872, _1038, _1110);
                float _1122 = _866 * _1058;
                float _1124 = _870 * _1058;
                float _1126 = fma(_1052, as_type<float>(_856), _1116);
                _1128 = _1044 + _1114;
                float _1130 = fma(_864, _1052, _1122);
                float _1132 = fma(_868, _1052, _1124);
                float _1134 = fma(_1064, as_type<float>(_860), _1126);
                float _1136 = _1084 * as_type<float>(_858);
                _1138 = fma(_862, _1064, _1130);
                _1140 = fma(_872, _1064, _1132);
                float _1142 = _866 * _1084;
                float _1144 = _870 * _1084;
                float _1146 = _878 * _1058;
                float _1148 = _878 * _1084;
                float _1150 = fma(_1078, as_type<float>(_856), _1136);
                _1152 = _1070 + _1134;
                float _1154 = fma(_876, _1052, _1146);
                float _1156 = fma(_864, _1078, _1142);
                float _1158 = fma(_868, _1078, _1144);
                float _1160 = fma(_876, _1078, _1148);
                float _1162 = fma(_1090, as_type<float>(_860), _1150);
                _1164 = fma(_880, _1038, _1112);
                _1166 = fma(_880, _1064, _1154);
                _1168 = fma(_862, _1090, _1156);
                _1170 = fma(_872, _1090, _1158);
                _1172 = fma(_880, _1090, _1160);
                _1174 = _1096 + _1162;
                uint _1176 = uint(int(uint(_874) >> uint(2)));
                _39[int(_1176)] = as_type<uint>(_1118);
                int _1178 = _874 + 4;
                uint _1180 = uint(int(uint(_1178) >> uint(2)));
                _39[int(_1180)] = as_type<uint>(_1120);
                int _1182 = _874 + 8;
                uint _1184 = uint(int(uint(_1182) >> uint(2)));
                _39[int(_1184)] = as_type<uint>(_1164);
                int _1186 = _874 + 12;
                uint _1188 = uint(int(uint(_1186) >> uint(2)));
                _39[int(_1188)] = as_type<uint>(_1128);
                int _1190 = _874 + 16;
                uint _1192 = uint(int(uint(_1190) >> uint(2)));
                _39[int(_1192)] = as_type<uint>(_1138);
                int _1194 = _874 + 20;
                uint _1196 = uint(int(uint(_1194) >> uint(2)));
                _39[int(_1196)] = as_type<uint>(_1140);
                int _1198 = _874 + 24;
                uint _1200 = uint(int(uint(_1198) >> uint(2)));
                _39[int(_1200)] = as_type<uint>(_1166);
                int _1202 = _874 + 28;
                uint _1204 = uint(int(uint(_1202) >> uint(2)));
                _39[int(_1204)] = as_type<uint>(_1152);
                int _1206 = _874 + 32;
                uint _1208 = uint(int(uint(_1206) >> uint(2)));
                _39[int(_1208)] = as_type<uint>(_1168);
                int _1210 = _874 + 36;
                uint _1212 = uint(int(uint(_1210) >> uint(2)));
                _39[int(_1212)] = as_type<uint>(_1170);
                int _1214 = _874 + 40;
                uint _1216 = uint(int(uint(_1214) >> uint(2)));
                _39[int(_1216)] = as_type<uint>(_1172);
                int _1218 = _874 + 44;
                uint _1220 = uint(int(uint(_1218) >> uint(2)));
                _39[int(_1220)] = as_type<uint>(_1174);
                _1020 = !_1072;
                _1018 = _1046;
            } while (_1020);
            _956 = _1118;
            _960 = _1120;
            _964 = _1164;
            _968 = _1128;
            _972 = _1138;
            _976 = _1140;
            _980 = _1166;
            _984 = _1152;
            _988 = _1168;
            _992 = _1170;
            _996 = _1172;
            _1002 = _1174;
            _1222 = true;
        }
        else
        {
            _956 = 0.0;
            _960 = 0.0;
            _964 = 0.0;
            _968 = 0.0;
            _972 = 0.0;
            _976 = 0.0;
            _980 = 0.0;
            _984 = 0.0;
            _988 = 0.0;
            _992 = 0.0;
            _996 = 0.0;
            _1002 = 0.0;
        }
    }
    _1222 = false;
    float _1224 = _956;
    float _1226 = _960;
    float _1228 = _964;
    float _1230 = _968;
    float _1232 = _972;
    float _1234 = _976;
    float _1236 = _980;
    float _1238 = _984;
    float _1240 = _988;
    float _1242 = _992;
    float _1244 = _996;
    float _1246 = _1002;
    int _1248 = _898 + 80;
    uint _1250 = uint(int(uint(_1248) >> uint(2)));
    uint _1252 = uint(int(uint(int(_1250)) >> uint(2)));
    int _1254 = int(_1250) & 3;
    float _1256 = (*spvDescriptorSet0.cp_c6)._m0[int(_1252)][_1254];
    int _1258 = int(_1250) + 1;
    uint _1260 = uint(int(uint(_1258) >> uint(2)));
    int _1262 = _1258 & 3;
    float _1264 = (*spvDescriptorSet0.cp_c6)._m0[int(_1260)][_1262];
    bool _1266 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1268 = _898 + 64;
    uint _1270 = uint(int(uint(_1268) >> uint(2)));
    uint _1272 = uint(int(uint(int(_1270)) >> uint(2)));
    int _1274 = int(_1270) & 3;
    float _1276 = (*spvDescriptorSet0.cp_c6)._m0[int(_1272)][_1274];
    int _1278 = int(_1270) + 1;
    uint _1280 = uint(int(uint(_1278) >> uint(2)));
    int _1282 = _1278 & 3;
    float _1284 = (*spvDescriptorSet0.cp_c6)._m0[int(_1280)][_1282];
    int _1286 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1288 = _1286 + _68;
    int _1290 = _898 + 88;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    uint _1294 = uint(int(uint(int(_1292)) >> uint(2)));
    int _1296 = int(_1292) & 3;
    float _1298 = (*spvDescriptorSet0.cp_c6)._m0[int(_1294)][_1296];
    int _1300 = int(_1292) + 1;
    uint _1302 = uint(int(uint(_1300) >> uint(2)));
    int _1304 = _1300 & 3;
    float _1306 = (*spvDescriptorSet0.cp_c6)._m0[int(_1302)][_1304];
    int _1308 = _898 + 72;
    uint _1310 = uint(int(uint(_1308) >> uint(2)));
    uint _1312 = uint(int(uint(int(_1310)) >> uint(2)));
    int _1314 = int(_1310) & 3;
    float _1316 = (*spvDescriptorSet0.cp_c6)._m0[int(_1312)][_1314];
    int _1318 = int(_1310) + 1;
    uint _1320 = uint(int(uint(_1318) >> uint(2)));
    int _1322 = _1318 & 3;
    float _1324 = (*spvDescriptorSet0.cp_c6)._m0[int(_1320)][_1322];
    int _1326 = _898 + 96;
    uint _1328 = uint(int(uint(_1326) >> uint(2)));
    uint _1330 = uint(int(uint(int(_1328)) >> uint(2)));
    int _1332 = int(_1328) & 3;
    float _1334 = (*spvDescriptorSet0.cp_c6)._m0[int(_1330)][_1332];
    int _1336 = int(_1328) + 1;
    uint _1338 = uint(int(uint(_1336) >> uint(2)));
    int _1340 = _1336 & 3;
    float _1342 = (*spvDescriptorSet0.cp_c6)._m0[int(_1338)][_1340];
    int _1344 = _898 + 104;
    uint _1346 = uint(int(uint(_1344) >> uint(2)));
    uint _1348 = uint(int(uint(int(_1346)) >> uint(2)));
    int _1350 = int(_1346) & 3;
    float _1352 = (*spvDescriptorSet0.cp_c6)._m0[int(_1348)][_1350];
    int _1354 = int(_1346) + 1;
    uint _1356 = uint(int(uint(_1354) >> uint(2)));
    int _1358 = _1354 & 3;
    float _1360 = (*spvDescriptorSet0.cp_c6)._m0[int(_1356)][_1358];
    int _1362 = _898 + 16;
    uint _1364 = uint(int(uint(_1362) >> uint(2)));
    uint _1366 = uint(int(uint(int(_1364)) >> uint(2)));
    int _1368 = int(_1364) & 3;
    float _1370 = (*spvDescriptorSet0.cp_c6)._m0[int(_1366)][_1368];
    int _1372 = int(_1364) + 1;
    uint _1374 = uint(int(uint(_1372) >> uint(2)));
    int _1376 = _1372 & 3;
    float _1378 = (*spvDescriptorSet0.cp_c6)._m0[int(_1374)][_1376];
    if (!_1266)
    {
        uint _1380 = uint(int(uint(_874) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1380)] = as_type<uint>(_1224);
        int _1382 = _874 + 4;
        uint _1384 = uint(int(uint(_1382) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1384)] = as_type<uint>(_1226);
        int _1386 = _874 + 8;
        uint _1388 = uint(int(uint(_1386) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1388)] = as_type<uint>(_1228);
        int _1390 = _874 + 12;
        uint _1392 = uint(int(uint(_1390) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1392)] = as_type<uint>(_1230);
        uint _1394 = uint(int(uint(_900) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1394)] = as_type<uint>(_1232);
        int _1396 = _900 + 4;
        uint _1398 = uint(int(uint(_1396) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1398)] = as_type<uint>(_1234);
        int _1400 = _900 + 8;
        uint _1402 = uint(int(uint(_1400) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1402)] = as_type<uint>(_1236);
        int _1404 = _900 + 12;
        uint _1406 = uint(int(uint(_1404) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1406)] = as_type<uint>(_1238);
        uint _1408 = uint(int(uint(_918) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1408)] = as_type<uint>(_1240);
        int _1410 = _918 + 4;
        uint _1412 = uint(int(uint(_1410) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1412)] = as_type<uint>(_1242);
        int _1414 = _918 + 8;
        uint _1416 = uint(int(uint(_1414) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1416)] = as_type<uint>(_1244);
        int _1418 = _918 + 12;
        uint _1420 = uint(int(uint(_1418) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1420)] = as_type<uint>(_1246);
    }
    float _1422 = _1234 * _1256;
    float _1424 = _1242 * _1256;
    int _1426 = _898 + 32;
    uint _1428 = uint(int(uint(_1426) >> uint(2)));
    uint _1430 = uint(int(uint(int(_1428)) >> uint(2)));
    int _1432 = int(_1428) & 3;
    float _1434 = (*spvDescriptorSet0.cp_c6)._m0[int(_1430)][_1432];
    int _1436 = int(_1428) + 1;
    uint _1438 = uint(int(uint(_1436) >> uint(2)));
    int _1440 = _1436 & 3;
    float _1442 = (*spvDescriptorSet0.cp_c6)._m0[int(_1438)][_1440];
    float _1444 = _1226 * _1256;
    float _1446 = fma(_1232, _1276, _1422);
    float _1448 = fma(_1240, _1276, _1424);
    float _1450 = _1226 * _1264;
    float _1452 = _1234 * _1264;
    float _1454 = _1242 * _1264;
    float _1456 = _1226 * _1306;
    int _1458 = _898 + 48;
    uint _1460 = uint(int(uint(_1458) >> uint(2)));
    uint _1462 = uint(int(uint(int(_1460)) >> uint(2)));
    int _1464 = int(_1460) & 3;
    float _1466 = (*spvDescriptorSet0.cp_c6)._m0[int(_1462)][_1464];
    int _1468 = int(_1460) + 1;
    uint _1470 = uint(int(uint(_1468) >> uint(2)));
    int _1472 = _1468 & 3;
    float _1474 = (*spvDescriptorSet0.cp_c6)._m0[int(_1470)][_1472];
    float _1476 = fma(_1224, _1284, _1450);
    float _1478 = _1226 * _1298;
    float _1480 = fma(_1232, _1284, _1452);
    float _1482 = fma(_1240, _1284, _1454);
    float _1484 = _1234 * _1298;
    float _1486 = _1234 * _1306;
    float _1488 = _1242 * _1298;
    float _1490 = _1242 * _1306;
    int _1492 = _898 + 24;
    uint _1494 = uint(int(uint(_1492) >> uint(2)));
    uint _1496 = uint(int(uint(int(_1494)) >> uint(2)));
    int _1498 = int(_1494) & 3;
    float _1500 = (*spvDescriptorSet0.cp_c6)._m0[int(_1496)][_1498];
    int _1502 = int(_1494) + 1;
    uint _1504 = uint(int(uint(_1502) >> uint(2)));
    int _1506 = _1502 & 3;
    float _1508 = (*spvDescriptorSet0.cp_c6)._m0[int(_1504)][_1506];
    float _1510 = fma(_1224, _1316, _1478);
    float _1512 = fma(_1224, _1324, _1456);
    float _1514 = fma(_1232, _1316, _1484);
    float _1516 = fma(_1232, _1324, _1486);
    float _1518 = fma(_1240, _1316, _1488);
    float _1520 = fma(_1240, _1324, _1490);
    float _1522 = fma(_1228, _1342, _1476);
    int _1524 = _898 + 40;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    uint _1528 = uint(int(uint(int(_1526)) >> uint(2)));
    int _1530 = int(_1526) & 3;
    float _1532 = (*spvDescriptorSet0.cp_c6)._m0[int(_1528)][_1530];
    int _1534 = int(_1526) + 1;
    uint _1536 = uint(int(uint(_1534) >> uint(2)));
    int _1538 = _1534 & 3;
    float _1540 = (*spvDescriptorSet0.cp_c6)._m0[int(_1536)][_1538];
    float _1542 = fma(_1236, _1334, _1446);
    float _1544 = fma(_1236, _1342, _1480);
    float _1546 = fma(_1236, _1352, _1514);
    float _1548 = fma(_1236, _1360, _1516);
    float _1550 = fma(_1224, _1276, _1444);
    float _1552 = fma(_1228, _1360, _1512);
    float _1554 = fma(_1244, _1360, _1520);
    int _1556 = _898 + 56;
    uint _1558 = uint(int(uint(_1556) >> uint(2)));
    uint _1560 = uint(int(uint(int(_1558)) >> uint(2)));
    int _1562 = int(_1558) & 3;
    float _1564 = (*spvDescriptorSet0.cp_c6)._m0[int(_1560)][_1562];
    int _1566 = int(_1558) + 1;
    uint _1568 = uint(int(uint(_1566) >> uint(2)));
    int _1570 = _1566 & 3;
    float _1572 = (*spvDescriptorSet0.cp_c6)._m0[int(_1568)][_1570];
    float _1574 = _1548 + _1238;
    float _1576 = fma(_1228, _1334, _1550);
    float _1578 = fma(_1228, _1352, _1510);
    float _1580 = _1552 + _1230;
    float _1582 = _1546 * _1378;
    float _1584 = _1574 * _1378;
    float _1586 = _1554 + _1246;
    float _1588 = fma(_1244, _1334, _1448);
    float _1590 = fma(_1244, _1342, _1482);
    float _1592 = fma(_1244, _1352, _1518);
    float _1594 = _1544 * _1378;
    float _1596 = _1542 * _1378;
    float _1598 = fma(_1578, _1370, _1582);
    float _1600 = fma(_1580, _1370, _1584);
    float _1602 = _1574 * _1442;
    float _1604 = _1542 * _1442;
    float _1606 = _1544 * _1442;
    float _1608 = _1546 * _1442;
    float _1610 = fma(_1580, _1434, _1602);
    float _1612 = fma(_1522, _1370, _1594);
    int _1614 = _1288 * 48;
    float _1616 = fma(_1576, _1370, _1596);
    float _1618 = _1574 * _1474;
    float _1620 = _1542 * _1474;
    float _1622 = _1544 * _1474;
    float _1624 = _1546 * _1474;
    float _1626 = fma(_1580, _1466, _1618);
    float _1628 = fma(_1576, _1434, _1604);
    float _1630 = fma(_1522, _1434, _1606);
    float _1632 = fma(_1578, _1434, _1608);
    float _1634 = fma(_1576, _1466, _1620);
    float _1636 = fma(_1586, _1500, _1600);
    float _1638 = fma(_1522, _1466, _1622);
    float _1640 = fma(_1578, _1466, _1624);
    float _1642 = fma(_1590, _1500, _1612);
    float _1644 = fma(_1588, _1500, _1616);
    float _1646 = fma(_1592, _1500, _1598);
    float _1648 = _1636 + _1508;
    int _1650 = _1614 + 16;
    float _1652 = fma(_1586, _1532, _1610);
    float _1654 = fma(_1588, _1532, _1628);
    float _1656 = fma(_1590, _1532, _1630);
    float _1658 = fma(_1592, _1532, _1632);
    float _1660 = _1652 + _1540;
    int _1662 = _1614 + 32;
    int _1664 = _1614 + 48;
    float _1666 = fma(_1586, _1564, _1626);
    float _1668 = fma(_1588, _1564, _1634);
    float _1670 = fma(_1590, _1564, _1638);
    float _1672 = fma(_1592, _1564, _1640);
    float _1674 = _1666 + _1572;
    uint _1676 = uint(int(uint(_1650) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1676)] = as_type<uint>(_1644);
    int _1678 = _1650 + 4;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1680)] = as_type<uint>(_1642);
    int _1682 = _1650 + 8;
    uint _1684 = uint(int(uint(_1682) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1684)] = as_type<uint>(_1646);
    int _1686 = _1650 + 12;
    uint _1688 = uint(int(uint(_1686) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1688)] = as_type<uint>(_1648);
    uint _1690 = uint(int(uint(_1662) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1690)] = as_type<uint>(_1654);
    int _1692 = _1662 + 4;
    uint _1694 = uint(int(uint(_1692) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1694)] = as_type<uint>(_1656);
    int _1696 = _1662 + 8;
    uint _1698 = uint(int(uint(_1696) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1698)] = as_type<uint>(_1658);
    int _1700 = _1662 + 12;
    uint _1702 = uint(int(uint(_1700) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1702)] = as_type<uint>(_1660);
    uint _1704 = uint(int(uint(_1664) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1704)] = as_type<uint>(_1668);
    int _1706 = _1664 + 4;
    uint _1708 = uint(int(uint(_1706) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1708)] = as_type<uint>(_1670);
    int _1710 = _1664 + 8;
    uint _1712 = uint(int(uint(_1710) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1712)] = as_type<uint>(_1672);
    int _1714 = _1664 + 12;
    uint _1716 = uint(int(uint(_1714) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1716)] = as_type<uint>(_1674);
}

