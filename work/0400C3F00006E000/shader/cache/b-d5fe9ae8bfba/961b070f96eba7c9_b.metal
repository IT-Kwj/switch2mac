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
int _56(thread const int& _4158, thread const int& _4159, constant _10& support_buffer)
{
    int _4162 = 1 + _4159;
    float _4164 = support_buffer._m5[_4162].x;
    bool _4166 = _4164 == 1.0;
    if (_4166)
    {
        return _4158;
    }
    float _4168 = float(_4158);
    float _4170 = _4168 * _4164;
    int _4172 = int(_4170);
    return _4172;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1220 = false;
    bool _794 = false;
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
    int _99 = _78 ? _91 : _97;
    int _101 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _103 = _101 + 32;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = _99 & as_type<int>(_111);
    bool _115 = _113 != 0;
    float _117 = 0.0;
    float _119 = 0.0;
    if (!_115)
    {
        _117 = 0.0;
        _119 = 0.0;
    }
    float _121 = _117;
    float _123 = _119;
    float _125 = 0.0;
    float _127 = _121;
    float _129 = _123;
    if (!_115)
    {
        _125 = 0.0;
    }
    float _131 = _125;
    float _133 = 0.0;
    float _135 = 0.0;
    float _137 = _131;
    if (!_115)
    {
        _133 = 0.0;
        _135 = 0.0;
    }
    float _139 = _133;
    float _141 = _135;
    float _143 = 0.0;
    float _145 = _139;
    float _147 = _141;
    if (!_115)
    {
        _143 = 0.0;
    }
    float _149 = _143;
    float _151 = 0.0;
    float _153 = _149;
    if (!_115)
    {
        _151 = 0.0;
    }
    float _155 = _151;
    float _157 = 0.0;
    float _159 = _155;
    if (!_115)
    {
        _157 = 0.0;
    }
    float _161 = _157;
    float _163 = 0.0;
    float _165 = _161;
    if (!_115)
    {
        _163 = 0.0;
    }
    float _167 = _163;
    float _169 = _167;
    if (!_115)
    {
        _72 = 0.0;
    }
    float _171 = _72;
    bool _173 = !_115;
    float _175 = _171;
    float _177 = 0.0;
    if (!_173)
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
        int3 _1863 = int3(_199, _205, 1);
        float4 _208 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1863.xy), uint(_1863.z), 0).xyzw;
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
        int3 _1883 = int3(_222, _228, 1);
        float4 _230 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1883.xy), uint(_1883.z), 0).xyzw;
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
        int3 _1903 = int3(_244, _250, 0);
        float3 _254 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1903.xy), uint(_1903.z), 0).xyz;
        float _256 = _254.x;
        float _258 = _254.y;
        float _260 = _254.z;
        int _262 = _66;
        int _264 = 0;
        int _266 = _56(_262, _264, (*spvDescriptorSet0.support_buffer));
        int _268 = as_type<int>(_193);
        int _270 = 0;
        int _272 = _56(_268, _270, (*spvDescriptorSet0.support_buffer));
        int3 _1921 = int3(_266, _272, 0);
        float3 _274 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1921.xy), uint(_1921.z), 0).xyz;
        float _276 = _274.x;
        float _278 = _274.y;
        float _280 = _274.z;
        int _282 = _66;
        int _284 = 0;
        int _286 = _56(_282, _284, (*spvDescriptorSet0.support_buffer));
        int _288 = as_type<int>(_185);
        int _290 = 0;
        int _292 = _56(_288, _290, (*spvDescriptorSet0.support_buffer));
        int3 _1939 = int3(_286, _292, 2);
        float3 _294 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1939.xy), uint(_1939.z), 0).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        int _302 = _66;
        int _304 = 0;
        int _306 = _56(_302, _304, (*spvDescriptorSet0.support_buffer));
        int _308 = as_type<int>(_193);
        int _310 = 0;
        int _312 = _56(_308, _310, (*spvDescriptorSet0.support_buffer));
        int3 _1957 = int3(_306, _312, 2);
        float3 _314 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1957.xy), uint(_1957.z), 0).xyz;
        float _316 = _314.x;
        float _318 = _314.y;
        float _320 = _314.z;
        int _322 = _101 + 16;
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
        _169 = _352;
        _165 = _376;
        _145 = _380;
        _159 = _390;
        _127 = _382;
        _137 = _378;
        _129 = _384;
        _153 = _388;
        _147 = _386;
        _175 = _392;
        _177 = _362;
    }
    float _394 = _169;
    float _396 = _165;
    float _398 = _145;
    float _400 = _159;
    float _402 = _127;
    float _404 = _137;
    float _406 = _129;
    float _408 = _153;
    float _410 = _147;
    float _412 = _175;
    float _414 = _177;
    int _416 = _101 + 36;
    uint _418 = uint(int(uint(_416) >> uint(2)));
    uint _420 = uint(int(uint(int(_418)) >> uint(2)));
    int _422 = int(_418) & 3;
    float _424 = (*spvDescriptorSet0.cp_c5)._m0[int(_420)][_422];
    int _426 = _99 & as_type<int>(_424);
    bool _428 = _426 != 0;
    bool _430 = !_428;
    float _432 = _402;
    int _434 = as_type<int>(_408);
    int _436 = as_type<int>(_400);
    float _438 = _414;
    float _440 = _404;
    float _442 = _406;
    float _444 = _410;
    float _766;
    float _768;
    float _770;
    float _772;
    float _774;
    float _776;
    float _778;
    float _780;
    float _782;
    float _784;
    float _786;
    int _788;
    float _790;
    float _792;
    if (!_430)
    {
        int _446 = _101 + 8;
        uint _448 = uint(int(uint(_446) >> uint(2)));
        uint _450 = uint(int(uint(int(_448)) >> uint(2)));
        int _452 = int(_448) & 3;
        float _454 = (*spvDescriptorSet0.cp_c5)._m0[int(_450)][_452];
        int _456 = int(_448) + 1;
        uint _458 = uint(int(uint(_456) >> uint(2)));
        int _460 = _456 & 3;
        float _462 = (*spvDescriptorSet0.cp_c5)._m0[int(_458)][_460];
        int _464 = _66;
        int _466 = 1;
        int _468 = _56(_464, _466, (*spvDescriptorSet0.support_buffer));
        int _470 = as_type<int>(_454);
        int _472 = 1;
        int _474 = _56(_470, _472, (*spvDescriptorSet0.support_buffer));
        int3 _2179 = int3(_468, _474, 1);
        float3 _476 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2179.xy), uint(_2179.z), 0).xyz;
        float _478 = _476.x;
        float _480 = _476.y;
        float _482 = _476.z;
        int _484 = _66;
        int _486 = 1;
        int _488 = _56(_484, _486, (*spvDescriptorSet0.support_buffer));
        int _490 = as_type<int>(_462);
        int _492 = 1;
        int _494 = _56(_490, _492, (*spvDescriptorSet0.support_buffer));
        int3 _2197 = int3(_488, _494, 1);
        float3 _496 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2197.xy), uint(_2197.z), 0).xyz;
        float _498 = _496.x;
        float _500 = _496.y;
        float _502 = _496.z;
        int _504 = _66;
        int _506 = 1;
        int _508 = _56(_504, _506, (*spvDescriptorSet0.support_buffer));
        int _510 = as_type<int>(_454);
        int _512 = 1;
        int _514 = _56(_510, _512, (*spvDescriptorSet0.support_buffer));
        int3 _2215 = int3(_508, _514, 0);
        float3 _516 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2215.xy), uint(_2215.z), 0).xyz;
        float _518 = _516.x;
        float _520 = _516.y;
        float _522 = _516.z;
        int _524 = _66;
        int _526 = 1;
        int _528 = _56(_524, _526, (*spvDescriptorSet0.support_buffer));
        int _530 = as_type<int>(_462);
        int _532 = 1;
        int _534 = _56(_530, _532, (*spvDescriptorSet0.support_buffer));
        int3 _2233 = int3(_528, _534, 0);
        float3 _536 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2233.xy), uint(_2233.z), 0).xyz;
        float _538 = _536.x;
        float _540 = _536.y;
        float _542 = _536.z;
        int _544 = _66;
        int _546 = 1;
        int _548 = _56(_544, _546, (*spvDescriptorSet0.support_buffer));
        int _550 = as_type<int>(_454);
        int _552 = 1;
        int _554 = _56(_550, _552, (*spvDescriptorSet0.support_buffer));
        int3 _2251 = int3(_548, _554, 2);
        float3 _556 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2251.xy), uint(_2251.z), 0).xyz;
        float _558 = _556.x;
        float _560 = _556.y;
        float _562 = _556.z;
        int _564 = _66;
        int _566 = 1;
        int _568 = _56(_564, _566, (*spvDescriptorSet0.support_buffer));
        int _570 = as_type<int>(_462);
        int _572 = 1;
        int _574 = _56(_570, _572, (*spvDescriptorSet0.support_buffer));
        int3 _2269 = int3(_568, _574, 2);
        float3 _576 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2269.xy), uint(_2269.z), 0).xyz;
        float _578 = _576.x;
        float _580 = _576.y;
        float _582 = _576.z;
        int _584 = _101 + 24;
        uint _586 = uint(int(uint(_584) >> uint(2)));
        uint _588 = uint(int(uint(int(_586)) >> uint(2)));
        int _590 = int(_586) & 3;
        float _592 = (*spvDescriptorSet0.cp_c5)._m0[int(_588)][_590];
        int _594 = int(_586) + 1;
        uint _596 = uint(int(uint(_594) >> uint(2)));
        int _598 = _594 & 3;
        float _600 = (*spvDescriptorSet0.cp_c5)._m0[int(_596)][_598];
        int _602 = _101 + 20;
        uint _604 = uint(int(uint(_602) >> uint(2)));
        uint _606 = uint(int(uint(int(_604)) >> uint(2)));
        int _608 = int(_604) & 3;
        float _610 = (*spvDescriptorSet0.cp_c5)._m0[int(_606)][_608];
        float _612 = -_482;
        float _614 = _612 + _502;
        float _616 = -_478;
        float _618 = _616 + _498;
        float _620 = fma(_614, _592, _482);
        float _622 = fma(_618, _592, _478);
        float _624 = _620 * _600;
        float _626 = _622 * _600;
        float _628 = fma(_394, _610, _624);
        float _630 = -_480;
        float _632 = _630 + _500;
        float _634 = fma(_396, _610, _626);
        float _636 = _628 * 0.15915493667125701904296875;
        float _638 = fma(_632, _592, _480);
        float _640 = _634 * 0.15915493667125701904296875;
        float _642 = _636 * 6.283185482025146484375;
        float _644 = sin(_642);
        float _646 = _638 * _600;
        float _648 = fma(_398, _610, _646);
        float _650 = _640 * 6.283185482025146484375;
        float _652 = sin(_650);
        float _654 = _648 * 0.15915493667125701904296875;
        float _656 = _640 * 6.283185482025146484375;
        float _658 = cos(_656);
        float _660 = _636 * 6.283185482025146484375;
        float _662 = cos(_660);
        float _664 = _654 * 6.283185482025146484375;
        float _666 = sin(_664);
        float _668 = _644 * _658;
        float _670 = -_518;
        float _672 = _670 + _538;
        float _674 = _652 * _644;
        float _676 = -_522;
        float _678 = _676 + _542;
        float _680 = fma(_672, _592, _518);
        float _682 = _654 * 6.283185482025146484375;
        float _684 = cos(_682);
        float _686 = _658 * _662;
        float _688 = _652 * _662;
        float _690 = -_562;
        float _692 = _690 + _582;
        float _694 = fma(_678, _592, _522);
        float _696 = fma(_692, _592, _562);
        float _698 = _652 * _666;
        float _700 = _696 * _600;
        float _702 = fma(_400, _610, _700);
        float _704 = _684 * _662;
        float _706 = _644 * _684;
        float _708 = -_668;
        float _710 = fma(_662, _698, _708);
        float _712 = fma(_644, _698, _686);
        float _714 = -_520;
        float _716 = _714 + _540;
        float _718 = _658 * _684;
        float _720 = _652 * _684;
        float _722 = fma(_666, _686, _674);
        float _724 = fma(_716, _592, _520);
        float _726 = -_688;
        float _728 = fma(_666, _668, _726);
        float _730 = _680 * _600;
        float _732 = -_560;
        float _734 = _732 + _580;
        float _736 = -_558;
        float _738 = _736 + _578;
        float _740 = _724 * _600;
        float _742 = fma(_402, _610, _730);
        float _744 = fma(_734, _592, _560);
        float _746 = fma(_738, _592, _558);
        float _748 = _694 * _600;
        float _750 = fma(_404, _610, _740);
        float _752 = _744 * _600;
        float _754 = _746 * _600;
        float _756 = fma(_406, _610, _748);
        float _758 = fma(_408, _610, _752);
        float _760 = fma(_410, _610, _754);
        float _762 = -_666;
        float _764 = _762 + (-0.0);
        _432 = _742;
        _766 = _704;
        _768 = _706;
        _770 = _764;
        _772 = _750;
        _774 = _710;
        _776 = _712;
        _778 = _720;
        _780 = _756;
        _782 = _722;
        _784 = _728;
        _786 = _718;
        _788 = as_type<int>(_760);
        _434 = as_type<int>(_758);
        _436 = as_type<int>(_702);
        _790 = _666;
        _792 = _674;
        _438 = _622;
        _794 = true;
    }
    else
    {
        float _796 = _396 * 2.0;
        float _798 = _394 * _412;
        float _800 = _398 * _412;
        float _802 = _396 * _412;
        float _804 = _398 * _398;
        float _806 = _396 * _396;
        float _808 = -_798;
        float _810 = fma(_796, _398, _808);
        float _812 = fma(_796, _398, _798);
        float _814 = fma(_796, _394, _800);
        float _816 = -_800;
        float _818 = fma(_796, _394, _816);
        float _820 = _398 * 2.0;
        float _822 = _394 * _394;
        float _824 = fma(_804, -2.0, 1.0);
        float _826 = fma(_806, -2.0, 1.0);
        float _828 = -_802;
        float _830 = fma(_820, _394, _828);
        float _832 = fma(_820, _394, _802);
        float _834 = fma(_822, -2.0, _824);
        float _836 = fma(_822, -2.0, _826);
        float _838 = fma(_804, -2.0, _826);
        _766 = _834;
        _768 = _812;
        _770 = _818;
        _772 = _404;
        _774 = _810;
        _776 = _836;
        _778 = _832;
        _780 = _406;
        _782 = _814;
        _784 = _830;
        _786 = _838;
        _788 = as_type<int>(_410);
        _790 = _802;
        _792 = 0.0;
    }
    _794 = false;
    float _840 = _432;
    float _842 = _766;
    float _844 = _768;
    float _846 = _770;
    float _848 = _772;
    float _850 = _774;
    float _852 = _776;
    float _854 = _778;
    float _856 = _780;
    float _858 = _782;
    float _860 = _784;
    float _862 = _786;
    int _864 = _788;
    int _866 = _434;
    int _868 = _436;
    float _870 = _790;
    float _872 = _792;
    float _874 = _438;
    float _876 = _840 * _842;
    float _878 = _840 * _844;
    float _880 = _840 * _846;
    float _882 = _848 * _850;
    float _884 = _848 * _852;
    float _886 = _848 * _854;
    int _888 = _66 * 48;
    float _890 = _856 * _858;
    float _892 = _856 * _860;
    float _894 = _856 * _862;
    bool _896 = _66 != 0;
    uint _898 = uint(int(uint(_888) >> uint(2)));
    _37[int(_898)] = as_type<uint>(_876);
    int _900 = _888 + 4;
    uint _902 = uint(int(uint(_900) >> uint(2)));
    _37[int(_902)] = as_type<uint>(_882);
    int _904 = _888 + 8;
    uint _906 = uint(int(uint(_904) >> uint(2)));
    _37[int(_906)] = as_type<uint>(_890);
    int _908 = _888 + 12;
    uint _910 = uint(int(uint(_908) >> uint(2)));
    _37[int(_910)] = uint(_864);
    int _912 = _66 * 112;
    int _914 = _888 + 16;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    _37[int(_916)] = as_type<uint>(_878);
    int _918 = _888 + 20;
    uint _920 = uint(int(uint(_918) >> uint(2)));
    _37[int(_920)] = as_type<uint>(_884);
    int _922 = _888 + 24;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    _37[int(_924)] = as_type<uint>(_892);
    int _926 = _888 + 28;
    uint _928 = uint(int(uint(_926) >> uint(2)));
    _37[int(_928)] = uint(_866);
    int _930 = _888 + 32;
    uint _932 = uint(int(uint(_930) >> uint(2)));
    _37[int(_932)] = as_type<uint>(_880);
    int _934 = _888 + 36;
    uint _936 = uint(int(uint(_934) >> uint(2)));
    _37[int(_936)] = as_type<uint>(_886);
    int _938 = _888 + 40;
    uint _940 = uint(int(uint(_938) >> uint(2)));
    _37[int(_940)] = as_type<uint>(_894);
    int _942 = _888 + 44;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    _37[int(_944)] = uint(_868);
    float _946 = _874;
    float _948 = _872;
    float _950 = _870;
    float _952 = _840;
    float _954 = _856;
    float _956 = _848;
    float _958 = _886;
    float _960 = _894;
    float _962 = as_type<float>(_868);
    if (!_896)
    {
        _946 = _876;
    }
    float _964 = _946;
    float _966 = _964;
    if (!_896)
    {
        _948 = _882;
    }
    float _968 = _948;
    float _970 = _968;
    if (!_896)
    {
        _950 = _890;
    }
    float _972 = _950;
    float _974 = _972;
    if (!_896)
    {
        _440 = as_type<float>(_864);
    }
    float _976 = _440;
    float _978 = _976;
    if (!_896)
    {
        _952 = _878;
    }
    float _980 = _952;
    float _982 = _980;
    if (!_896)
    {
        _442 = _884;
    }
    float _984 = _442;
    float _986 = _984;
    if (!_896)
    {
        _954 = _892;
    }
    float _988 = _954;
    float _990 = _988;
    if (!_896)
    {
        _444 = as_type<float>(_866);
    }
    float _992 = _444;
    float _994 = _992;
    if (!_896)
    {
        _956 = _880;
    }
    float _996 = _956;
    bool _998 = !_896;
    float _1000 = _996;
    if (!_998)
    {
        bool _1002 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1004 = !_1002;
        if (!_1004)
        {
            uint _1006 = uint(int(uint(_912) >> uint(2)));
            uint _1008 = uint(int(uint(int(_1006)) >> uint(2)));
            int _1010 = int(_1006) & 3;
            float _1012 = (*spvDescriptorSet0.cp_c6)._m0[int(_1008)][_1010];
            int _1014 = as_type<int>(_1012) * 48;
            int _1016 = 0;
            bool _1018;
            float _1114;
            float _1118;
            float _1122;
            float _1126;
            float _1140;
            float _1142;
            float _1154;
            float _1164;
            float _1166;
            float _1168;
            float _1170;
            float _1172;
            do
            {
                int _1020 = _1016;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1022 = uint(int(uint(_1014) >> uint(2)));
                float _1024 = as_type<float>(_37[int(_1022)]);
                int _1026 = _1014 + 4;
                uint _1028 = uint(int(uint(_1026) >> uint(2)));
                float _1030 = as_type<float>(_37[int(_1028)]);
                int _1032 = _1014 + 8;
                uint _1034 = uint(int(uint(_1032) >> uint(2)));
                float _1036 = as_type<float>(_37[int(_1034)]);
                int _1038 = _1014 + 12;
                uint _1040 = uint(int(uint(_1038) >> uint(2)));
                float _1042 = as_type<float>(_37[int(_1040)]);
                int _1044 = _1020 + 1;
                int _1046 = _1014 + 16;
                uint _1048 = uint(int(uint(_1046) >> uint(2)));
                float _1050 = as_type<float>(_37[int(_1048)]);
                int _1052 = _1014 + 20;
                uint _1054 = uint(int(uint(_1052) >> uint(2)));
                float _1056 = as_type<float>(_37[int(_1054)]);
                int _1058 = _1014 + 24;
                uint _1060 = uint(int(uint(_1058) >> uint(2)));
                float _1062 = as_type<float>(_37[int(_1060)]);
                int _1064 = _1014 + 28;
                uint _1066 = uint(int(uint(_1064) >> uint(2)));
                float _1068 = as_type<float>(_37[int(_1066)]);
                bool _1070 = uint(_1044) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1072 = _1014 + 32;
                uint _1074 = uint(int(uint(_1072) >> uint(2)));
                float _1076 = as_type<float>(_37[int(_1074)]);
                int _1078 = _1014 + 36;
                uint _1080 = uint(int(uint(_1078) >> uint(2)));
                float _1082 = as_type<float>(_37[int(_1080)]);
                int _1084 = _1014 + 40;
                uint _1086 = uint(int(uint(_1084) >> uint(2)));
                float _1088 = as_type<float>(_37[int(_1086)]);
                int _1090 = _1014 + 44;
                uint _1092 = uint(int(uint(_1090) >> uint(2)));
                float _1094 = as_type<float>(_37[int(_1092)]);
                float _1096 = _1030 * as_type<float>(_866);
                float _1098 = _878 * _1030;
                float _1100 = _884 * _1030;
                float _1102 = _892 * _1030;
                float _1104 = fma(_1024, as_type<float>(_864), _1096);
                float _1106 = fma(_876, _1024, _1098);
                float _1108 = fma(_882, _1024, _1100);
                float _1110 = fma(_890, _1024, _1102);
                float _1112 = fma(_1036, as_type<float>(_868), _1104);
                _1114 = fma(_880, _1036, _1106);
                float _1116 = _878 * _1056;
                _1118 = fma(_894, _1036, _1110);
                float _1120 = _1056 * as_type<float>(_866);
                _1122 = _1042 + _1112;
                float _1124 = _884 * _1056;
                _1126 = fma(_886, _1036, _1108);
                float _1128 = fma(_1050, as_type<float>(_864), _1120);
                float _1130 = fma(_876, _1050, _1116);
                float _1132 = fma(_882, _1050, _1124);
                float _1134 = _892 * _1056;
                float _1136 = fma(_1062, as_type<float>(_868), _1128);
                float _1138 = _1082 * as_type<float>(_866);
                _1140 = fma(_880, _1062, _1130);
                _1142 = fma(_886, _1062, _1132);
                float _1144 = _878 * _1082;
                float _1146 = _884 * _1082;
                float _1148 = _892 * _1082;
                float _1150 = fma(_1076, as_type<float>(_864), _1138);
                float _1152 = fma(_890, _1050, _1134);
                _1154 = _1068 + _1136;
                float _1156 = fma(_876, _1076, _1144);
                float _1158 = fma(_882, _1076, _1146);
                float _1160 = fma(_890, _1076, _1148);
                float _1162 = fma(_1088, as_type<float>(_868), _1150);
                _1164 = fma(_894, _1062, _1152);
                _1166 = fma(_880, _1088, _1156);
                _1168 = fma(_886, _1088, _1158);
                _1170 = fma(_894, _1088, _1160);
                _1172 = _1094 + _1162;
                uint _1174 = uint(int(uint(_888) >> uint(2)));
                _37[int(_1174)] = as_type<uint>(_1114);
                int _1176 = _888 + 4;
                uint _1178 = uint(int(uint(_1176) >> uint(2)));
                _37[int(_1178)] = as_type<uint>(_1126);
                int _1180 = _888 + 8;
                uint _1182 = uint(int(uint(_1180) >> uint(2)));
                _37[int(_1182)] = as_type<uint>(_1118);
                int _1184 = _888 + 12;
                uint _1186 = uint(int(uint(_1184) >> uint(2)));
                _37[int(_1186)] = as_type<uint>(_1122);
                int _1188 = _888 + 16;
                uint _1190 = uint(int(uint(_1188) >> uint(2)));
                _37[int(_1190)] = as_type<uint>(_1140);
                int _1192 = _888 + 20;
                uint _1194 = uint(int(uint(_1192) >> uint(2)));
                _37[int(_1194)] = as_type<uint>(_1142);
                int _1196 = _888 + 24;
                uint _1198 = uint(int(uint(_1196) >> uint(2)));
                _37[int(_1198)] = as_type<uint>(_1164);
                int _1200 = _888 + 28;
                uint _1202 = uint(int(uint(_1200) >> uint(2)));
                _37[int(_1202)] = as_type<uint>(_1154);
                int _1204 = _888 + 32;
                uint _1206 = uint(int(uint(_1204) >> uint(2)));
                _37[int(_1206)] = as_type<uint>(_1166);
                int _1208 = _888 + 36;
                uint _1210 = uint(int(uint(_1208) >> uint(2)));
                _37[int(_1210)] = as_type<uint>(_1168);
                int _1212 = _888 + 40;
                uint _1214 = uint(int(uint(_1212) >> uint(2)));
                _37[int(_1214)] = as_type<uint>(_1170);
                int _1216 = _888 + 44;
                uint _1218 = uint(int(uint(_1216) >> uint(2)));
                _37[int(_1218)] = as_type<uint>(_1172);
                _1018 = !_1070;
                _1016 = _1044;
            } while (_1018);
            _958 = _1168;
            _970 = _1126;
            _986 = _1142;
            _1000 = _1166;
            _966 = _1114;
            _982 = _1140;
            _990 = _1164;
            _960 = _1170;
            _974 = _1118;
            _994 = _1154;
            _978 = _1122;
            _962 = _1172;
            _1220 = true;
        }
        else
        {
            _958 = 0.0;
            _970 = 0.0;
            _986 = 0.0;
            _1000 = 0.0;
            _966 = 0.0;
            _982 = 0.0;
            _990 = 0.0;
            _960 = 0.0;
            _974 = 0.0;
            _994 = 0.0;
            _978 = 0.0;
            _962 = 0.0;
        }
    }
    _1220 = false;
    float _1222 = _958;
    float _1224 = _970;
    float _1226 = _986;
    float _1228 = _1000;
    float _1230 = _966;
    float _1232 = _982;
    float _1234 = _990;
    float _1236 = _960;
    float _1238 = _974;
    float _1240 = _994;
    float _1242 = _978;
    float _1244 = _962;
    int _1246 = _912 + 80;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    uint _1250 = uint(int(uint(int(_1248)) >> uint(2)));
    int _1252 = int(_1248) & 3;
    float _1254 = (*spvDescriptorSet0.cp_c6)._m0[int(_1250)][_1252];
    int _1256 = int(_1248) + 1;
    uint _1258 = uint(int(uint(_1256) >> uint(2)));
    int _1260 = _1256 & 3;
    float _1262 = (*spvDescriptorSet0.cp_c6)._m0[int(_1258)][_1260];
    int _1264 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1266 = _1264 + _66;
    int _1268 = _912 + 64;
    uint _1270 = uint(int(uint(_1268) >> uint(2)));
    uint _1272 = uint(int(uint(int(_1270)) >> uint(2)));
    int _1274 = int(_1270) & 3;
    float _1276 = (*spvDescriptorSet0.cp_c6)._m0[int(_1272)][_1274];
    int _1278 = int(_1270) + 1;
    uint _1280 = uint(int(uint(_1278) >> uint(2)));
    int _1282 = _1278 & 3;
    float _1284 = (*spvDescriptorSet0.cp_c6)._m0[int(_1280)][_1282];
    int _1286 = _1266 * 48;
    int _1288 = _912 + 88;
    uint _1290 = uint(int(uint(_1288) >> uint(2)));
    uint _1292 = uint(int(uint(int(_1290)) >> uint(2)));
    int _1294 = int(_1290) & 3;
    float _1296 = (*spvDescriptorSet0.cp_c6)._m0[int(_1292)][_1294];
    int _1298 = int(_1290) + 1;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    int _1302 = _1298 & 3;
    float _1304 = (*spvDescriptorSet0.cp_c6)._m0[int(_1300)][_1302];
    int _1306 = _912 + 72;
    uint _1308 = uint(int(uint(_1306) >> uint(2)));
    uint _1310 = uint(int(uint(int(_1308)) >> uint(2)));
    int _1312 = int(_1308) & 3;
    float _1314 = (*spvDescriptorSet0.cp_c6)._m0[int(_1310)][_1312];
    int _1316 = int(_1308) + 1;
    uint _1318 = uint(int(uint(_1316) >> uint(2)));
    int _1320 = _1316 & 3;
    float _1322 = (*spvDescriptorSet0.cp_c6)._m0[int(_1318)][_1320];
    int _1324 = _912 + 96;
    uint _1326 = uint(int(uint(_1324) >> uint(2)));
    uint _1328 = uint(int(uint(int(_1326)) >> uint(2)));
    int _1330 = int(_1326) & 3;
    float _1332 = (*spvDescriptorSet0.cp_c6)._m0[int(_1328)][_1330];
    int _1334 = int(_1326) + 1;
    uint _1336 = uint(int(uint(_1334) >> uint(2)));
    int _1338 = _1334 & 3;
    float _1340 = (*spvDescriptorSet0.cp_c6)._m0[int(_1336)][_1338];
    int _1342 = _912 + 104;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    uint _1346 = uint(int(uint(int(_1344)) >> uint(2)));
    int _1348 = int(_1344) & 3;
    float _1350 = (*spvDescriptorSet0.cp_c6)._m0[int(_1346)][_1348];
    int _1352 = int(_1344) + 1;
    uint _1354 = uint(int(uint(_1352) >> uint(2)));
    int _1356 = _1352 & 3;
    float _1358 = (*spvDescriptorSet0.cp_c6)._m0[int(_1354)][_1356];
    float _1360 = _1222 * _1254;
    int _1362 = _912 + 16;
    uint _1364 = uint(int(uint(_1362) >> uint(2)));
    uint _1366 = uint(int(uint(int(_1364)) >> uint(2)));
    int _1368 = int(_1364) & 3;
    float _1370 = (*spvDescriptorSet0.cp_c6)._m0[int(_1366)][_1368];
    int _1372 = int(_1364) + 1;
    uint _1374 = uint(int(uint(_1372) >> uint(2)));
    int _1376 = _1372 & 3;
    float _1378 = (*spvDescriptorSet0.cp_c6)._m0[int(_1374)][_1376];
    float _1380 = _1224 * _1254;
    float _1382 = _1226 * _1254;
    float _1384 = _1226 * _1262;
    float _1386 = fma(_1228, _1276, _1360);
    float _1388 = _1222 * _1262;
    int _1390 = _912 + 32;
    uint _1392 = uint(int(uint(_1390) >> uint(2)));
    uint _1394 = uint(int(uint(int(_1392)) >> uint(2)));
    int _1396 = int(_1392) & 3;
    float _1398 = (*spvDescriptorSet0.cp_c6)._m0[int(_1394)][_1396];
    int _1400 = int(_1392) + 1;
    uint _1402 = uint(int(uint(_1400) >> uint(2)));
    int _1404 = _1400 & 3;
    float _1406 = (*spvDescriptorSet0.cp_c6)._m0[int(_1402)][_1404];
    float _1408 = fma(_1230, _1276, _1380);
    float _1410 = fma(_1232, _1276, _1382);
    float _1412 = fma(_1232, _1284, _1384);
    float _1414 = _1224 * _1262;
    float _1416 = fma(_1228, _1284, _1388);
    float _1418 = _1224 * _1296;
    float _1420 = _1226 * _1296;
    int _1422 = _912 + 48;
    uint _1424 = uint(int(uint(_1422) >> uint(2)));
    uint _1426 = uint(int(uint(int(_1424)) >> uint(2)));
    int _1428 = int(_1424) & 3;
    float _1430 = (*spvDescriptorSet0.cp_c6)._m0[int(_1426)][_1428];
    int _1432 = int(_1424) + 1;
    uint _1434 = uint(int(uint(_1432) >> uint(2)));
    int _1436 = _1432 & 3;
    float _1438 = (*spvDescriptorSet0.cp_c6)._m0[int(_1434)][_1436];
    float _1440 = _1224 * _1304;
    float _1442 = _1226 * _1304;
    float _1444 = _1222 * _1296;
    float _1446 = _1222 * _1304;
    float _1448 = fma(_1230, _1284, _1414);
    float _1450 = fma(_1232, _1314, _1420);
    float _1452 = fma(_1232, _1322, _1442);
    int _1454 = _912 + 24;
    uint _1456 = uint(int(uint(_1454) >> uint(2)));
    uint _1458 = uint(int(uint(int(_1456)) >> uint(2)));
    int _1460 = int(_1456) & 3;
    float _1462 = (*spvDescriptorSet0.cp_c6)._m0[int(_1458)][_1460];
    int _1464 = int(_1456) + 1;
    uint _1466 = uint(int(uint(_1464) >> uint(2)));
    int _1468 = _1464 & 3;
    float _1470 = (*spvDescriptorSet0.cp_c6)._m0[int(_1466)][_1468];
    float _1472 = fma(_1230, _1314, _1418);
    float _1474 = fma(_1230, _1322, _1440);
    float _1476 = fma(_1228, _1314, _1444);
    float _1478 = fma(_1228, _1322, _1446);
    float _1480 = fma(_1234, _1332, _1410);
    float _1482 = fma(_1234, _1340, _1412);
    int _1484 = _912 + 40;
    uint _1486 = uint(int(uint(_1484) >> uint(2)));
    uint _1488 = uint(int(uint(int(_1486)) >> uint(2)));
    int _1490 = int(_1486) & 3;
    float _1492 = (*spvDescriptorSet0.cp_c6)._m0[int(_1488)][_1490];
    int _1494 = int(_1486) + 1;
    uint _1496 = uint(int(uint(_1494) >> uint(2)));
    int _1498 = _1494 & 3;
    float _1500 = (*spvDescriptorSet0.cp_c6)._m0[int(_1496)][_1498];
    float _1502 = fma(_1236, _1332, _1386);
    float _1504 = fma(_1238, _1332, _1408);
    float _1506 = fma(_1238, _1340, _1448);
    float _1508 = fma(_1236, _1340, _1416);
    float _1510 = fma(_1234, _1350, _1450);
    float _1512 = fma(_1234, _1358, _1452);
    int _1514 = _912 + 56;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    uint _1518 = uint(int(uint(int(_1516)) >> uint(2)));
    int _1520 = int(_1516) & 3;
    float _1522 = (*spvDescriptorSet0.cp_c6)._m0[int(_1518)][_1520];
    int _1524 = int(_1516) + 1;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    int _1528 = _1524 & 3;
    float _1530 = (*spvDescriptorSet0.cp_c6)._m0[int(_1526)][_1528];
    float _1532 = fma(_1238, _1350, _1472);
    float _1534 = fma(_1238, _1358, _1474);
    float _1536 = _1512 + _1240;
    float _1538 = fma(_1236, _1358, _1478);
    float _1540 = fma(_1236, _1350, _1476);
    float _1542 = _1534 + _1242;
    float _1544 = _1536 * _1378;
    float _1546 = _1538 + _1244;
    float _1548 = _1480 * _1378;
    float _1550 = _1482 * _1378;
    float _1552 = fma(_1542, _1370, _1544);
    float _1554 = _1510 * _1378;
    float _1556 = fma(_1504, _1370, _1548);
    float _1558 = fma(_1506, _1370, _1550);
    float _1560 = _1480 * _1406;
    float _1562 = _1536 * _1406;
    float _1564 = _1482 * _1406;
    float _1566 = _1510 * _1406;
    float _1568 = fma(_1504, _1398, _1560);
    float _1570 = fma(_1542, _1398, _1562);
    float _1572 = fma(_1532, _1370, _1554);
    float _1574 = fma(_1532, _1398, _1566);
    float _1576 = _1480 * _1438;
    float _1578 = _1536 * _1438;
    float _1580 = _1482 * _1438;
    float _1582 = _1510 * _1438;
    float _1584 = fma(_1504, _1430, _1576);
    float _1586 = fma(_1542, _1430, _1578);
    float _1588 = fma(_1506, _1430, _1580);
    float _1590 = fma(_1532, _1430, _1582);
    float _1592 = fma(_1546, _1462, _1552);
    float _1594 = fma(_1506, _1398, _1564);
    float _1596 = fma(_1508, _1462, _1558);
    float _1598 = fma(_1502, _1462, _1556);
    float _1600 = _1592 + _1470;
    float _1602 = fma(_1540, _1462, _1572);
    float _1604 = fma(_1546, _1492, _1570);
    float _1606 = fma(_1502, _1492, _1568);
    float _1608 = fma(_1540, _1492, _1574);
    float _1610 = fma(_1508, _1492, _1594);
    float _1612 = _1604 + _1500;
    float _1614 = fma(_1546, _1522, _1586);
    float _1616 = fma(_1502, _1522, _1584);
    float _1618 = fma(_1508, _1522, _1588);
    float _1620 = fma(_1540, _1522, _1590);
    int _1622 = _1286 + 16;
    float _1624 = _1614 + _1530;
    int _1626 = _1286 + 32;
    int _1628 = _1286 + 48;
    uint _1630 = uint(int(uint(_1622) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1630)] = as_type<uint>(_1598);
    int _1632 = _1622 + 4;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1634)] = as_type<uint>(_1596);
    int _1636 = _1622 + 8;
    uint _1638 = uint(int(uint(_1636) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1638)] = as_type<uint>(_1602);
    int _1640 = _1622 + 12;
    uint _1642 = uint(int(uint(_1640) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1642)] = as_type<uint>(_1600);
    uint _1644 = uint(int(uint(_1626) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1644)] = as_type<uint>(_1606);
    int _1646 = _1626 + 4;
    uint _1648 = uint(int(uint(_1646) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1648)] = as_type<uint>(_1610);
    int _1650 = _1626 + 8;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1652)] = as_type<uint>(_1608);
    int _1654 = _1626 + 12;
    uint _1656 = uint(int(uint(_1654) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1656)] = as_type<uint>(_1612);
    uint _1658 = uint(int(uint(_1628) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1658)] = as_type<uint>(_1616);
    int _1660 = _1628 + 4;
    uint _1662 = uint(int(uint(_1660) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1662)] = as_type<uint>(_1618);
    int _1664 = _1628 + 8;
    uint _1666 = uint(int(uint(_1664) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1666)] = as_type<uint>(_1620);
    int _1668 = _1628 + 12;
    uint _1670 = uint(int(uint(_1668) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1670)] = as_type<uint>(_1624);
}

