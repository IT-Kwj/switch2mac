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
int _58(thread const int& _4283, thread const int& _4284, constant _10& support_buffer)
{
    int _4287 = 1 + _4284;
    float _4289 = support_buffer._m5[_4287].x;
    bool _4291 = _4289 == 1.0;
    if (_4291)
    {
        return _4283;
    }
    float _4293 = float(_4283);
    float _4295 = _4293 * _4289;
    int _4297 = int(_4295);
    return _4297;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1244 = false;
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
    float _147 = _141;
    float _149 = _143;
    if (!_117)
    {
        _145 = 0.0;
    }
    float _151 = _145;
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
        int3 _1887 = int3(_199, _205, 1);
        float4 _208 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1887.xy), uint(_1887.z), 0).xyzw;
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
        int3 _1907 = int3(_222, _228, 1);
        float4 _230 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1907.xy), uint(_1907.z), 0).xyzw;
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
        int3 _1927 = int3(_244, _250, 0);
        float3 _254 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1927.xy), uint(_1927.z), 0).xyz;
        float _256 = _254.x;
        float _258 = _254.y;
        float _260 = _254.z;
        int _262 = _68;
        int _264 = 0;
        int _266 = _58(_262, _264, (*spvDescriptorSet0.support_buffer));
        int _268 = as_type<int>(_193);
        int _270 = 0;
        int _272 = _58(_268, _270, (*spvDescriptorSet0.support_buffer));
        int3 _1945 = int3(_266, _272, 0);
        float3 _274 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1945.xy), uint(_1945.z), 0).xyz;
        float _276 = _274.x;
        float _278 = _274.y;
        float _280 = _274.z;
        int _282 = _68;
        int _284 = 0;
        int _286 = _58(_282, _284, (*spvDescriptorSet0.support_buffer));
        int _288 = as_type<int>(_185);
        int _290 = 0;
        int _292 = _58(_288, _290, (*spvDescriptorSet0.support_buffer));
        int3 _1963 = int3(_286, _292, 2);
        float3 _294 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1963.xy), uint(_1963.z), 0).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        int _302 = _68;
        int _304 = 0;
        int _306 = _58(_302, _304, (*spvDescriptorSet0.support_buffer));
        int _308 = as_type<int>(_193);
        int _310 = 0;
        int _312 = _58(_308, _310, (*spvDescriptorSet0.support_buffer));
        int3 _1981 = int3(_306, _312, 2);
        float3 _314 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1981.xy), uint(_1981.z), 0).xyz;
        float _316 = _314.x;
        float _318 = _314.y;
        float _320 = _314.z;
        int _322 = _103 + 16;
        uint _324 = uint(int(uint(_322) >> uint(2)));
        uint _326 = uint(int(uint(int(_324)) >> uint(2)));
        int _328 = int(_324) & 3;
        float _330 = (*spvDescriptorSet0.cp_c5)._m0[int(_326)][_328];
        float _332 = -_214;
        float _334 = _332 + _236;
        float _336 = -_216;
        float _338 = _336 + _238;
        float _340 = -_256;
        float _342 = _340 + _276;
        float _344 = -_210;
        float _346 = _344 + _232;
        float _348 = -_258;
        float _350 = _348 + _278;
        float _352 = fma(_334, _330, _214);
        float _354 = fma(_338, _330, _216);
        float _356 = -_212;
        float _358 = _356 + _234;
        float _360 = -_260;
        float _362 = _360 + _280;
        float _364 = -_296;
        float _366 = _364 + _316;
        float _368 = -_298;
        float _370 = _368 + _318;
        float _372 = -_300;
        float _374 = _372 + _320;
        float _376 = fma(_346, _330, _210);
        float _378 = fma(_350, _330, _258);
        float _380 = fma(_358, _330, _212);
        float _382 = fma(_342, _330, _256);
        float _384 = fma(_362, _330, _260);
        float _386 = fma(_366, _330, _296);
        float _388 = fma(_370, _330, _298);
        float _390 = fma(_374, _330, _300);
        float _392 = _354 * 2.0;
        _171 = _352;
        _167 = _376;
        _147 = _380;
        _161 = _390;
        _129 = _382;
        _139 = _378;
        _131 = _384;
        _155 = _388;
        _149 = _386;
        _177 = _392;
    }
    float _394 = _171;
    float _396 = _167;
    float _398 = _147;
    float _400 = _161;
    float _402 = _129;
    float _404 = _139;
    float _406 = _131;
    float _408 = _155;
    float _410 = _149;
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
    int _432 = as_type<int>(_408);
    int _434 = as_type<int>(_400);
    float _436 = _404;
    float _438 = _406;
    float _440 = _410;
    float _762;
    float _764;
    float _766;
    float _768;
    float _770;
    float _772;
    float _774;
    float _776;
    float _778;
    float _780;
    float _782;
    int _784;
    if (!_428)
    {
        int _442 = _103 + 8;
        uint _444 = uint(int(uint(_442) >> uint(2)));
        uint _446 = uint(int(uint(int(_444)) >> uint(2)));
        int _448 = int(_444) & 3;
        float _450 = (*spvDescriptorSet0.cp_c5)._m0[int(_446)][_448];
        int _452 = int(_444) + 1;
        uint _454 = uint(int(uint(_452) >> uint(2)));
        int _456 = _452 & 3;
        float _458 = (*spvDescriptorSet0.cp_c5)._m0[int(_454)][_456];
        int _460 = _68;
        int _462 = 1;
        int _464 = _58(_460, _462, (*spvDescriptorSet0.support_buffer));
        int _466 = as_type<int>(_450);
        int _468 = 1;
        int _470 = _58(_466, _468, (*spvDescriptorSet0.support_buffer));
        int3 _2200 = int3(_464, _470, 1);
        float3 _472 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2200.xy), uint(_2200.z), 0).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        int _480 = _68;
        int _482 = 1;
        int _484 = _58(_480, _482, (*spvDescriptorSet0.support_buffer));
        int _486 = as_type<int>(_458);
        int _488 = 1;
        int _490 = _58(_486, _488, (*spvDescriptorSet0.support_buffer));
        int3 _2218 = int3(_484, _490, 1);
        float3 _492 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2218.xy), uint(_2218.z), 0).xyz;
        float _494 = _492.x;
        float _496 = _492.y;
        float _498 = _492.z;
        int _500 = _68;
        int _502 = 1;
        int _504 = _58(_500, _502, (*spvDescriptorSet0.support_buffer));
        int _506 = as_type<int>(_450);
        int _508 = 1;
        int _510 = _58(_506, _508, (*spvDescriptorSet0.support_buffer));
        int3 _2236 = int3(_504, _510, 0);
        float3 _512 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2236.xy), uint(_2236.z), 0).xyz;
        float _514 = _512.x;
        float _516 = _512.y;
        float _518 = _512.z;
        int _520 = _68;
        int _522 = 1;
        int _524 = _58(_520, _522, (*spvDescriptorSet0.support_buffer));
        int _526 = as_type<int>(_458);
        int _528 = 1;
        int _530 = _58(_526, _528, (*spvDescriptorSet0.support_buffer));
        int3 _2254 = int3(_524, _530, 0);
        float3 _532 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2254.xy), uint(_2254.z), 0).xyz;
        float _534 = _532.x;
        float _536 = _532.y;
        float _538 = _532.z;
        int _540 = _68;
        int _542 = 1;
        int _544 = _58(_540, _542, (*spvDescriptorSet0.support_buffer));
        int _546 = as_type<int>(_450);
        int _548 = 1;
        int _550 = _58(_546, _548, (*spvDescriptorSet0.support_buffer));
        int3 _2272 = int3(_544, _550, 2);
        float3 _552 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2272.xy), uint(_2272.z), 0).xyz;
        float _554 = _552.x;
        float _556 = _552.y;
        float _558 = _552.z;
        int _560 = _68;
        int _562 = 1;
        int _564 = _58(_560, _562, (*spvDescriptorSet0.support_buffer));
        int _566 = as_type<int>(_458);
        int _568 = 1;
        int _570 = _58(_566, _568, (*spvDescriptorSet0.support_buffer));
        int3 _2290 = int3(_564, _570, 2);
        float3 _572 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2290.xy), uint(_2290.z), 0).xyz;
        float _574 = _572.x;
        float _576 = _572.y;
        float _578 = _572.z;
        int _580 = _103 + 24;
        uint _582 = uint(int(uint(_580) >> uint(2)));
        uint _584 = uint(int(uint(int(_582)) >> uint(2)));
        int _586 = int(_582) & 3;
        float _588 = (*spvDescriptorSet0.cp_c5)._m0[int(_584)][_586];
        int _590 = int(_582) + 1;
        uint _592 = uint(int(uint(_590) >> uint(2)));
        int _594 = _590 & 3;
        float _596 = (*spvDescriptorSet0.cp_c5)._m0[int(_592)][_594];
        int _598 = _103 + 20;
        uint _600 = uint(int(uint(_598) >> uint(2)));
        uint _602 = uint(int(uint(int(_600)) >> uint(2)));
        int _604 = int(_600) & 3;
        float _606 = (*spvDescriptorSet0.cp_c5)._m0[int(_602)][_604];
        float _608 = -_478;
        float _610 = _608 + _498;
        float _612 = -_474;
        float _614 = _612 + _494;
        float _616 = fma(_610, _588, _478);
        float _618 = fma(_614, _588, _474);
        float _620 = _616 * _596;
        float _622 = _618 * _596;
        float _624 = fma(_394, _606, _620);
        float _626 = -_476;
        float _628 = _626 + _496;
        float _630 = fma(_396, _606, _622);
        float _632 = _624 * 0.15915493667125701904296875;
        float _634 = fma(_628, _588, _476);
        float _636 = _630 * 0.15915493667125701904296875;
        float _638 = _632 * 6.283185482025146484375;
        float _640 = sin(_638);
        float _642 = _634 * _596;
        float _644 = fma(_398, _606, _642);
        float _646 = _636 * 6.283185482025146484375;
        float _648 = sin(_646);
        float _650 = _644 * 0.15915493667125701904296875;
        float _652 = _636 * 6.283185482025146484375;
        float _654 = cos(_652);
        float _656 = _632 * 6.283185482025146484375;
        float _658 = cos(_656);
        float _660 = _650 * 6.283185482025146484375;
        float _662 = sin(_660);
        float _664 = _640 * _654;
        float _666 = -_514;
        float _668 = _666 + _534;
        float _670 = _648 * _640;
        float _672 = -_518;
        float _674 = _672 + _538;
        float _676 = fma(_668, _588, _514);
        float _678 = _650 * 6.283185482025146484375;
        float _680 = cos(_678);
        float _682 = _654 * _658;
        float _684 = _648 * _658;
        float _686 = -_558;
        float _688 = _686 + _578;
        float _690 = fma(_674, _588, _518);
        float _692 = fma(_688, _588, _558);
        float _694 = _648 * _662;
        float _696 = _692 * _596;
        float _698 = fma(_400, _606, _696);
        float _700 = _680 * _658;
        float _702 = _640 * _680;
        float _704 = -_664;
        float _706 = fma(_658, _694, _704);
        float _708 = fma(_640, _694, _682);
        float _710 = -_516;
        float _712 = _710 + _536;
        float _714 = _654 * _680;
        float _716 = _648 * _680;
        float _718 = fma(_662, _682, _670);
        float _720 = fma(_712, _588, _516);
        float _722 = -_684;
        float _724 = fma(_662, _664, _722);
        float _726 = _676 * _596;
        float _728 = -_556;
        float _730 = _728 + _576;
        float _732 = -_554;
        float _734 = _732 + _574;
        float _736 = _720 * _596;
        float _738 = fma(_402, _606, _726);
        float _740 = fma(_730, _588, _556);
        float _742 = fma(_734, _588, _554);
        float _744 = _690 * _596;
        float _746 = fma(_404, _606, _736);
        float _748 = _740 * _596;
        float _750 = _742 * _596;
        float _752 = fma(_406, _606, _744);
        float _754 = fma(_408, _606, _748);
        float _756 = fma(_410, _606, _750);
        float _758 = -_662;
        float _760 = _758 + (-0.0);
        _430 = _738;
        _762 = _700;
        _764 = _702;
        _766 = _760;
        _768 = _746;
        _770 = _706;
        _772 = _708;
        _774 = _716;
        _776 = _752;
        _778 = _718;
        _780 = _724;
        _782 = _714;
        _784 = as_type<int>(_756);
        _432 = as_type<int>(_754);
        _434 = as_type<int>(_698);
        _786 = true;
    }
    else
    {
        float _788 = _396 * 2.0;
        float _790 = _394 * _412;
        float _792 = _398 * _412;
        float _794 = _396 * _412;
        float _796 = _398 * _398;
        float _798 = _396 * _396;
        float _800 = -_790;
        float _802 = fma(_788, _398, _800);
        float _804 = fma(_788, _398, _790);
        float _806 = fma(_788, _394, _792);
        float _808 = -_792;
        float _810 = fma(_788, _394, _808);
        float _812 = _398 * 2.0;
        float _814 = _394 * _394;
        float _816 = fma(_796, -2.0, 1.0);
        float _818 = fma(_798, -2.0, 1.0);
        float _820 = -_794;
        float _822 = fma(_812, _394, _820);
        float _824 = fma(_812, _394, _794);
        float _826 = fma(_814, -2.0, _816);
        float _828 = fma(_814, -2.0, _818);
        float _830 = fma(_796, -2.0, _818);
        _762 = _826;
        _764 = _804;
        _766 = _810;
        _768 = _404;
        _770 = _802;
        _772 = _828;
        _774 = _824;
        _776 = _406;
        _778 = _806;
        _780 = _822;
        _782 = _830;
        _784 = as_type<int>(_410);
    }
    _786 = false;
    float _832 = _430;
    float _834 = _762;
    float _836 = _764;
    float _838 = _766;
    float _840 = _768;
    float _842 = _770;
    float _844 = _772;
    float _846 = _774;
    float _848 = _776;
    float _850 = _778;
    float _852 = _780;
    float _854 = _782;
    int _856 = _784;
    int _858 = _432;
    int _860 = _434;
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
    int _882 = _68 * 112;
    uint _884 = uint(int(uint(_874) >> uint(2)));
    _39[int(_884)] = as_type<uint>(_862);
    int _886 = _874 + 4;
    uint _888 = uint(int(uint(_886) >> uint(2)));
    _39[int(_888)] = as_type<uint>(_868);
    int _890 = _874 + 8;
    uint _892 = uint(int(uint(_890) >> uint(2)));
    _39[int(_892)] = as_type<uint>(_876);
    int _894 = _874 + 12;
    uint _896 = uint(int(uint(_894) >> uint(2)));
    _39[int(_896)] = uint(_856);
    bool _898 = _68 != 0;
    bool _900 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _902 = _874 + 16;
    uint _904 = uint(int(uint(_902) >> uint(2)));
    _39[int(_904)] = as_type<uint>(_864);
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
    uint _920 = uint(int(uint(_918) >> uint(2)));
    _39[int(_920)] = as_type<uint>(_866);
    int _922 = _874 + 36;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    _39[int(_924)] = as_type<uint>(_872);
    int _926 = _874 + 40;
    uint _928 = uint(int(uint(_926) >> uint(2)));
    _39[int(_928)] = as_type<uint>(_880);
    int _930 = _874 + 44;
    uint _932 = uint(int(uint(_930) >> uint(2)));
    _39[int(_932)] = uint(_860);
    float _934 = _832;
    float _936 = _848;
    float _938 = (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _940 = _872;
    float _942 = _866;
    float _944 = _878;
    float _946 = _880;
    float _948 = as_type<float>(_858);
    float _950 = as_type<float>(_860);
    if (!_898)
    {
        _436 = _862;
    }
    float _952 = _436;
    float _954 = _952;
    if (!_898)
    {
        _934 = _868;
    }
    float _956 = _934;
    float _958 = _956;
    if (!_898)
    {
        _438 = _876;
    }
    float _960 = _438;
    float _962 = _960;
    if (!_898)
    {
        _936 = as_type<float>(_856);
    }
    float _964 = _936;
    float _966 = _964;
    if (!_898)
    {
        _440 = _864;
    }
    float _968 = _440;
    float _970 = _968;
    if (!_898)
    {
        _938 = _870;
    }
    float _972 = _938;
    float _974 = _972;
    if (!_900)
    {
        int _976 = _68 * 48;
        int _978 = _976 + 16;
        uint _980 = uint(int(uint(_976) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_980)] = as_type<uint>(_862);
        int _982 = _976 + 4;
        uint _984 = uint(int(uint(_982) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_984)] = as_type<uint>(_868);
        int _986 = _976 + 8;
        uint _988 = uint(int(uint(_986) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_988)] = as_type<uint>(_876);
        int _990 = _976 + 12;
        uint _992 = uint(int(uint(_990) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_992)] = uint(_856);
        int _994 = _976 + 32;
        uint _996 = uint(int(uint(_978) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_996)] = as_type<uint>(_864);
        int _998 = _978 + 4;
        uint _1000 = uint(int(uint(_998) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1000)] = as_type<uint>(_870);
        int _1002 = _978 + 8;
        uint _1004 = uint(int(uint(_1002) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1004)] = as_type<uint>(_878);
        int _1006 = _978 + 12;
        uint _1008 = uint(int(uint(_1006) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1008)] = uint(_858);
        uint _1010 = uint(int(uint(_994) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1010)] = as_type<uint>(_866);
        int _1012 = _994 + 4;
        uint _1014 = uint(int(uint(_1012) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1014)] = as_type<uint>(_872);
        int _1016 = _994 + 8;
        uint _1018 = uint(int(uint(_1016) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1018)] = as_type<uint>(_880);
        int _1020 = _994 + 12;
        uint _1022 = uint(int(uint(_1020) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1022)] = uint(_860);
    }
    bool _1024 = !_898;
    if (!_1024)
    {
        bool _1026 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1028 = !_1026;
        if (!_1028)
        {
            uint _1030 = uint(int(uint(_882) >> uint(2)));
            uint _1032 = uint(int(uint(int(_1030)) >> uint(2)));
            int _1034 = int(_1030) & 3;
            float _1036 = (*spvDescriptorSet0.cp_c6)._m0[int(_1032)][_1034];
            int _1038 = as_type<int>(_1036) * 48;
            int _1040 = 0;
            bool _1042;
            float _1138;
            float _1142;
            float _1146;
            float _1150;
            float _1164;
            float _1166;
            float _1178;
            float _1188;
            float _1190;
            float _1192;
            float _1194;
            float _1196;
            do
            {
                int _1044 = _1040;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1046 = uint(int(uint(_1038) >> uint(2)));
                float _1048 = as_type<float>(_39[int(_1046)]);
                int _1050 = _1038 + 4;
                uint _1052 = uint(int(uint(_1050) >> uint(2)));
                float _1054 = as_type<float>(_39[int(_1052)]);
                int _1056 = _1038 + 8;
                uint _1058 = uint(int(uint(_1056) >> uint(2)));
                float _1060 = as_type<float>(_39[int(_1058)]);
                int _1062 = _1038 + 12;
                uint _1064 = uint(int(uint(_1062) >> uint(2)));
                float _1066 = as_type<float>(_39[int(_1064)]);
                int _1068 = _1044 + 1;
                int _1070 = _1038 + 16;
                uint _1072 = uint(int(uint(_1070) >> uint(2)));
                float _1074 = as_type<float>(_39[int(_1072)]);
                int _1076 = _1038 + 20;
                uint _1078 = uint(int(uint(_1076) >> uint(2)));
                float _1080 = as_type<float>(_39[int(_1078)]);
                int _1082 = _1038 + 24;
                uint _1084 = uint(int(uint(_1082) >> uint(2)));
                float _1086 = as_type<float>(_39[int(_1084)]);
                int _1088 = _1038 + 28;
                uint _1090 = uint(int(uint(_1088) >> uint(2)));
                float _1092 = as_type<float>(_39[int(_1090)]);
                bool _1094 = uint(_1068) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1096 = _1038 + 32;
                uint _1098 = uint(int(uint(_1096) >> uint(2)));
                float _1100 = as_type<float>(_39[int(_1098)]);
                int _1102 = _1038 + 36;
                uint _1104 = uint(int(uint(_1102) >> uint(2)));
                float _1106 = as_type<float>(_39[int(_1104)]);
                int _1108 = _1038 + 40;
                uint _1110 = uint(int(uint(_1108) >> uint(2)));
                float _1112 = as_type<float>(_39[int(_1110)]);
                int _1114 = _1038 + 44;
                uint _1116 = uint(int(uint(_1114) >> uint(2)));
                float _1118 = as_type<float>(_39[int(_1116)]);
                float _1120 = _1054 * as_type<float>(_858);
                float _1122 = _864 * _1054;
                float _1124 = _870 * _1054;
                float _1126 = _878 * _1054;
                float _1128 = fma(_1048, as_type<float>(_856), _1120);
                float _1130 = fma(_862, _1048, _1122);
                float _1132 = fma(_868, _1048, _1124);
                float _1134 = fma(_876, _1048, _1126);
                float _1136 = fma(_1060, as_type<float>(_860), _1128);
                _1138 = fma(_866, _1060, _1130);
                float _1140 = _864 * _1080;
                _1142 = fma(_880, _1060, _1134);
                float _1144 = _1080 * as_type<float>(_858);
                _1146 = _1066 + _1136;
                float _1148 = _870 * _1080;
                _1150 = fma(_872, _1060, _1132);
                float _1152 = fma(_1074, as_type<float>(_856), _1144);
                float _1154 = fma(_862, _1074, _1140);
                float _1156 = fma(_868, _1074, _1148);
                float _1158 = _878 * _1080;
                float _1160 = fma(_1086, as_type<float>(_860), _1152);
                float _1162 = _1106 * as_type<float>(_858);
                _1164 = fma(_866, _1086, _1154);
                _1166 = fma(_872, _1086, _1156);
                float _1168 = _864 * _1106;
                float _1170 = _870 * _1106;
                float _1172 = _878 * _1106;
                float _1174 = fma(_1100, as_type<float>(_856), _1162);
                float _1176 = fma(_876, _1074, _1158);
                _1178 = _1092 + _1160;
                float _1180 = fma(_862, _1100, _1168);
                float _1182 = fma(_868, _1100, _1170);
                float _1184 = fma(_876, _1100, _1172);
                float _1186 = fma(_1112, as_type<float>(_860), _1174);
                _1188 = fma(_880, _1086, _1176);
                _1190 = fma(_866, _1112, _1180);
                _1192 = fma(_872, _1112, _1182);
                _1194 = fma(_880, _1112, _1184);
                _1196 = _1118 + _1186;
                uint _1198 = uint(int(uint(_874) >> uint(2)));
                _39[int(_1198)] = as_type<uint>(_1138);
                int _1200 = _874 + 4;
                uint _1202 = uint(int(uint(_1200) >> uint(2)));
                _39[int(_1202)] = as_type<uint>(_1150);
                int _1204 = _874 + 8;
                uint _1206 = uint(int(uint(_1204) >> uint(2)));
                _39[int(_1206)] = as_type<uint>(_1142);
                int _1208 = _874 + 12;
                uint _1210 = uint(int(uint(_1208) >> uint(2)));
                _39[int(_1210)] = as_type<uint>(_1146);
                int _1212 = _874 + 16;
                uint _1214 = uint(int(uint(_1212) >> uint(2)));
                _39[int(_1214)] = as_type<uint>(_1164);
                int _1216 = _874 + 20;
                uint _1218 = uint(int(uint(_1216) >> uint(2)));
                _39[int(_1218)] = as_type<uint>(_1166);
                int _1220 = _874 + 24;
                uint _1222 = uint(int(uint(_1220) >> uint(2)));
                _39[int(_1222)] = as_type<uint>(_1188);
                int _1224 = _874 + 28;
                uint _1226 = uint(int(uint(_1224) >> uint(2)));
                _39[int(_1226)] = as_type<uint>(_1178);
                int _1228 = _874 + 32;
                uint _1230 = uint(int(uint(_1228) >> uint(2)));
                _39[int(_1230)] = as_type<uint>(_1190);
                int _1232 = _874 + 36;
                uint _1234 = uint(int(uint(_1232) >> uint(2)));
                _39[int(_1234)] = as_type<uint>(_1192);
                int _1236 = _874 + 40;
                uint _1238 = uint(int(uint(_1236) >> uint(2)));
                _39[int(_1238)] = as_type<uint>(_1194);
                int _1240 = _874 + 44;
                uint _1242 = uint(int(uint(_1240) >> uint(2)));
                _39[int(_1242)] = as_type<uint>(_1196);
                _1042 = !_1094;
                _1040 = _1068;
            } while (_1042);
            _974 = _1166;
            _940 = _1192;
            _958 = _1150;
            _970 = _1164;
            _942 = _1190;
            _954 = _1138;
            _944 = _1188;
            _962 = _1142;
            _946 = _1194;
            _948 = _1178;
            _966 = _1146;
            _950 = _1196;
            _1244 = true;
        }
        else
        {
            _974 = 0.0;
            _940 = 0.0;
            _958 = 0.0;
            _970 = 0.0;
            _942 = 0.0;
            _954 = 0.0;
            _944 = 0.0;
            _962 = 0.0;
            _946 = 0.0;
            _948 = 0.0;
            _966 = 0.0;
            _950 = 0.0;
        }
    }
    _1244 = false;
    float _1246 = _974;
    float _1248 = _940;
    float _1250 = _958;
    float _1252 = _970;
    float _1254 = _942;
    float _1256 = _954;
    float _1258 = _944;
    float _1260 = _962;
    float _1262 = _946;
    float _1264 = _948;
    float _1266 = _966;
    float _1268 = _950;
    int _1270 = _882 + 80;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    uint _1274 = uint(int(uint(int(_1272)) >> uint(2)));
    int _1276 = int(_1272) & 3;
    float _1278 = (*spvDescriptorSet0.cp_c6)._m0[int(_1274)][_1276];
    int _1280 = int(_1272) + 1;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    int _1284 = _1280 & 3;
    float _1286 = (*spvDescriptorSet0.cp_c6)._m0[int(_1282)][_1284];
    int _1288 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1290 = _1288 + _68;
    int _1292 = _882 + 64;
    uint _1294 = uint(int(uint(_1292) >> uint(2)));
    uint _1296 = uint(int(uint(int(_1294)) >> uint(2)));
    int _1298 = int(_1294) & 3;
    float _1300 = (*spvDescriptorSet0.cp_c6)._m0[int(_1296)][_1298];
    int _1302 = int(_1294) + 1;
    uint _1304 = uint(int(uint(_1302) >> uint(2)));
    int _1306 = _1302 & 3;
    float _1308 = (*spvDescriptorSet0.cp_c6)._m0[int(_1304)][_1306];
    int _1310 = _1290 * 48;
    int _1312 = _882 + 88;
    uint _1314 = uint(int(uint(_1312) >> uint(2)));
    uint _1316 = uint(int(uint(int(_1314)) >> uint(2)));
    int _1318 = int(_1314) & 3;
    float _1320 = (*spvDescriptorSet0.cp_c6)._m0[int(_1316)][_1318];
    int _1322 = int(_1314) + 1;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    int _1326 = _1322 & 3;
    float _1328 = (*spvDescriptorSet0.cp_c6)._m0[int(_1324)][_1326];
    int _1330 = _882 + 72;
    uint _1332 = uint(int(uint(_1330) >> uint(2)));
    uint _1334 = uint(int(uint(int(_1332)) >> uint(2)));
    int _1336 = int(_1332) & 3;
    float _1338 = (*spvDescriptorSet0.cp_c6)._m0[int(_1334)][_1336];
    int _1340 = int(_1332) + 1;
    uint _1342 = uint(int(uint(_1340) >> uint(2)));
    int _1344 = _1340 & 3;
    float _1346 = (*spvDescriptorSet0.cp_c6)._m0[int(_1342)][_1344];
    int _1348 = _882 + 96;
    uint _1350 = uint(int(uint(_1348) >> uint(2)));
    uint _1352 = uint(int(uint(int(_1350)) >> uint(2)));
    int _1354 = int(_1350) & 3;
    float _1356 = (*spvDescriptorSet0.cp_c6)._m0[int(_1352)][_1354];
    int _1358 = int(_1350) + 1;
    uint _1360 = uint(int(uint(_1358) >> uint(2)));
    int _1362 = _1358 & 3;
    float _1364 = (*spvDescriptorSet0.cp_c6)._m0[int(_1360)][_1362];
    int _1366 = _882 + 104;
    uint _1368 = uint(int(uint(_1366) >> uint(2)));
    uint _1370 = uint(int(uint(int(_1368)) >> uint(2)));
    int _1372 = int(_1368) & 3;
    float _1374 = (*spvDescriptorSet0.cp_c6)._m0[int(_1370)][_1372];
    int _1376 = int(_1368) + 1;
    uint _1378 = uint(int(uint(_1376) >> uint(2)));
    int _1380 = _1376 & 3;
    float _1382 = (*spvDescriptorSet0.cp_c6)._m0[int(_1378)][_1380];
    float _1384 = _1246 * _1278;
    float _1386 = _1248 * _1278;
    int _1388 = _882 + 16;
    uint _1390 = uint(int(uint(_1388) >> uint(2)));
    uint _1392 = uint(int(uint(int(_1390)) >> uint(2)));
    int _1394 = int(_1390) & 3;
    float _1396 = (*spvDescriptorSet0.cp_c6)._m0[int(_1392)][_1394];
    int _1398 = int(_1390) + 1;
    uint _1400 = uint(int(uint(_1398) >> uint(2)));
    int _1402 = _1398 & 3;
    float _1404 = (*spvDescriptorSet0.cp_c6)._m0[int(_1400)][_1402];
    float _1406 = _1250 * _1278;
    float _1408 = fma(_1252, _1300, _1384);
    float _1410 = _1250 * _1286;
    int _1412 = _882 + 32;
    uint _1414 = uint(int(uint(_1412) >> uint(2)));
    uint _1416 = uint(int(uint(int(_1414)) >> uint(2)));
    int _1418 = int(_1414) & 3;
    float _1420 = (*spvDescriptorSet0.cp_c6)._m0[int(_1416)][_1418];
    int _1422 = int(_1414) + 1;
    uint _1424 = uint(int(uint(_1422) >> uint(2)));
    int _1426 = _1422 & 3;
    float _1428 = (*spvDescriptorSet0.cp_c6)._m0[int(_1424)][_1426];
    float _1430 = fma(_1254, _1300, _1386);
    float _1432 = _1246 * _1286;
    float _1434 = fma(_1256, _1308, _1410);
    float _1436 = _1248 * _1286;
    float _1438 = fma(_1256, _1300, _1406);
    float _1440 = _1250 * _1320;
    float _1442 = _1250 * _1328;
    int _1444 = _882 + 48;
    uint _1446 = uint(int(uint(_1444) >> uint(2)));
    uint _1448 = uint(int(uint(int(_1446)) >> uint(2)));
    int _1450 = int(_1446) & 3;
    float _1452 = (*spvDescriptorSet0.cp_c6)._m0[int(_1448)][_1450];
    int _1454 = int(_1446) + 1;
    uint _1456 = uint(int(uint(_1454) >> uint(2)));
    int _1458 = _1454 & 3;
    float _1460 = (*spvDescriptorSet0.cp_c6)._m0[int(_1456)][_1458];
    float _1462 = _1246 * _1320;
    float _1464 = _1246 * _1328;
    float _1466 = _1248 * _1320;
    float _1468 = _1248 * _1328;
    float _1470 = fma(_1252, _1308, _1432);
    float _1472 = fma(_1254, _1308, _1436);
    float _1474 = fma(_1256, _1338, _1440);
    int _1476 = _882 + 24;
    uint _1478 = uint(int(uint(_1476) >> uint(2)));
    uint _1480 = uint(int(uint(int(_1478)) >> uint(2)));
    int _1482 = int(_1478) & 3;
    float _1484 = (*spvDescriptorSet0.cp_c6)._m0[int(_1480)][_1482];
    int _1486 = int(_1478) + 1;
    uint _1488 = uint(int(uint(_1486) >> uint(2)));
    int _1490 = _1486 & 3;
    float _1492 = (*spvDescriptorSet0.cp_c6)._m0[int(_1488)][_1490];
    float _1494 = fma(_1256, _1346, _1442);
    float _1496 = fma(_1252, _1338, _1462);
    float _1498 = fma(_1252, _1346, _1464);
    float _1500 = fma(_1254, _1338, _1466);
    float _1502 = fma(_1254, _1346, _1468);
    float _1504 = fma(_1258, _1356, _1408);
    float _1506 = fma(_1258, _1364, _1470);
    int _1508 = _882 + 40;
    uint _1510 = uint(int(uint(_1508) >> uint(2)));
    uint _1512 = uint(int(uint(int(_1510)) >> uint(2)));
    int _1514 = int(_1510) & 3;
    float _1516 = (*spvDescriptorSet0.cp_c6)._m0[int(_1512)][_1514];
    int _1518 = int(_1510) + 1;
    uint _1520 = uint(int(uint(_1518) >> uint(2)));
    int _1522 = _1518 & 3;
    float _1524 = (*spvDescriptorSet0.cp_c6)._m0[int(_1520)][_1522];
    float _1526 = fma(_1260, _1364, _1434);
    float _1528 = fma(_1262, _1356, _1430);
    float _1530 = fma(_1262, _1364, _1472);
    float _1532 = fma(_1260, _1356, _1438);
    float _1534 = fma(_1258, _1374, _1496);
    float _1536 = fma(_1258, _1382, _1498);
    int _1538 = _882 + 56;
    uint _1540 = uint(int(uint(_1538) >> uint(2)));
    uint _1542 = uint(int(uint(int(_1540)) >> uint(2)));
    int _1544 = int(_1540) & 3;
    float _1546 = (*spvDescriptorSet0.cp_c6)._m0[int(_1542)][_1544];
    int _1548 = int(_1540) + 1;
    uint _1550 = uint(int(uint(_1548) >> uint(2)));
    int _1552 = _1548 & 3;
    float _1554 = (*spvDescriptorSet0.cp_c6)._m0[int(_1550)][_1552];
    float _1556 = fma(_1260, _1382, _1494);
    float _1558 = fma(_1262, _1382, _1502);
    float _1560 = _1536 + _1264;
    float _1562 = fma(_1262, _1374, _1500);
    float _1564 = _1556 + _1266;
    float _1566 = fma(_1260, _1374, _1474);
    float _1568 = _1558 + _1268;
    float _1570 = _1560 * _1404;
    float _1572 = _1506 * _1404;
    float _1574 = _1534 * _1404;
    float _1576 = _1504 * _1404;
    float _1578 = fma(_1564, _1396, _1570);
    float _1580 = fma(_1526, _1396, _1572);
    float _1582 = fma(_1566, _1396, _1574);
    float _1584 = fma(_1532, _1396, _1576);
    float _1586 = _1560 * _1428;
    float _1588 = _1504 * _1428;
    float _1590 = _1506 * _1428;
    float _1592 = _1534 * _1428;
    float _1594 = fma(_1564, _1420, _1586);
    float _1596 = fma(_1532, _1420, _1588);
    float _1598 = fma(_1526, _1420, _1590);
    float _1600 = fma(_1566, _1420, _1592);
    float _1602 = _1560 * _1460;
    float _1604 = _1506 * _1460;
    float _1606 = _1504 * _1460;
    float _1608 = _1534 * _1460;
    float _1610 = fma(_1564, _1452, _1602);
    float _1612 = fma(_1526, _1452, _1604);
    float _1614 = fma(_1532, _1452, _1606);
    float _1616 = fma(_1566, _1452, _1608);
    float _1618 = fma(_1568, _1484, _1578);
    float _1620 = fma(_1530, _1484, _1580);
    float _1622 = fma(_1562, _1484, _1582);
    float _1624 = fma(_1528, _1484, _1584);
    float _1626 = _1618 + _1492;
    int _1628 = _1310 + 16;
    int _1630 = _1310 + 32;
    float _1632 = fma(_1568, _1516, _1594);
    float _1634 = fma(_1528, _1516, _1596);
    float _1636 = fma(_1530, _1516, _1598);
    float _1638 = fma(_1562, _1516, _1600);
    float _1640 = _1632 + _1524;
    int _1642 = _1310 + 48;
    uint _1644 = uint(int(uint(_1628) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1644)] = as_type<uint>(_1624);
    int _1646 = _1628 + 4;
    uint _1648 = uint(int(uint(_1646) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1648)] = as_type<uint>(_1620);
    int _1650 = _1628 + 8;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1652)] = as_type<uint>(_1622);
    int _1654 = _1628 + 12;
    uint _1656 = uint(int(uint(_1654) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1656)] = as_type<uint>(_1626);
    float _1658 = fma(_1568, _1546, _1610);
    float _1660 = fma(_1528, _1546, _1614);
    float _1662 = fma(_1530, _1546, _1612);
    float _1664 = fma(_1562, _1546, _1616);
    float _1666 = _1658 + _1554;
    uint _1668 = uint(int(uint(_1630) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1668)] = as_type<uint>(_1634);
    int _1670 = _1630 + 4;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1672)] = as_type<uint>(_1636);
    int _1674 = _1630 + 8;
    uint _1676 = uint(int(uint(_1674) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1676)] = as_type<uint>(_1638);
    int _1678 = _1630 + 12;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1680)] = as_type<uint>(_1640);
    uint _1682 = uint(int(uint(_1642) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1682)] = as_type<uint>(_1660);
    int _1684 = _1642 + 4;
    uint _1686 = uint(int(uint(_1684) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1686)] = as_type<uint>(_1662);
    int _1688 = _1642 + 8;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1690)] = as_type<uint>(_1664);
    int _1692 = _1642 + 12;
    uint _1694 = uint(int(uint(_1692) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1694)] = as_type<uint>(_1666);
}

