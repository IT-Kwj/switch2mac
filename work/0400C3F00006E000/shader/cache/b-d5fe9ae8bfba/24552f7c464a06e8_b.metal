#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T>
inline T spvSubgroupShuffle(T value, ushort lane)
{
    return simd_shuffle(value, lane);
}

template<>
inline bool spvSubgroupShuffle(bool value, ushort lane)
{
    return !!simd_shuffle((ushort)value, lane);
}

template<uint N>
inline vec<bool, N> spvSubgroupShuffle(vec<bool, N> value, ushort lane)
{
    return (vec<bool, N>)simd_shuffle((vec<ushort, N>)value, lane);
}

template<>
inline ulong spvSubgroupShuffle(ulong value, ushort lane)
{
    return as_type<ulong>(spvSubgroupShuffle(as_type<uint2>(value), lane));
}

template<>
inline ulong2 spvSubgroupShuffle(ulong2 value, ushort lane)
{
    return ulong2(spvSubgroupShuffle(value.x, lane), spvSubgroupShuffle(value.y, lane));
}

inline ulong3 spvSubgroupShuffle(ulong3 value, ushort lane)
{
    return ulong3(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.z, lane));
}

inline ulong4 spvSubgroupShuffle(ulong4 value, ushort lane)
{
    return ulong4(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.zw, lane));
}

template<uint N>
inline vec<long, N> spvSubgroupShuffle(vec<long, N> value, ushort lane)
{
    return vec<long, N>(spvSubgroupShuffle(vec<ulong, N>(value), lane));
}

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
    texture2d_array<float> cp_t_tcb_A [[id(6)]];
    sampler cp_t_tcb_ASmplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_8 [[id(8)]];
    sampler cp_t_tcb_8Smplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _54(thread const int& _3775, thread const int& _3776, constant _10& support_buffer)
{
    int _3779 = 1 + _3776;
    float _3781 = support_buffer._m5[_3779].x;
    bool _3783 = _3781 == 1.0;
    if (_3783)
    {
        return _3775;
    }
    float _3785 = float(_3775);
    float _3787 = _3785 * _3781;
    int _3789 = int(_3787);
    return _3789;
}

static inline __attribute__((always_inline))
int _56(thread const int& _3810, thread const int& _3811, thread const int& _3812, thread int& _3813, thread uint& gl_SubgroupInvocationID)
{
    int _3816 = _3812 & 31;
    uint _3818 = uint(int(uint(_3812) >> uint(8)));
    int _3820 = int(_3818) & 31;
    float _3822 = as_type<float>(gl_SubgroupInvocationID);
    int _3824 = as_type<int>(_3822) & _3820;
    int _3826 = ~_3820;
    int _3828 = _3816 & _3826;
    int _3830 = _3828 | _3824;
    int _3832 = ~_3820;
    int _3834 = _3811 & _3832;
    int _3836 = _3834 | _3824;
    bool _3838 = uint(_3836) <= uint(_3830);
    _3813 = _3838 ? (-1) : 0;
    float _3840 = spvSubgroupShuffle(as_type<float>(_3810), uint(_3836));
    uint _3842 = uint(_3838 ? as_type<int>(_3840) : _3810);
    return int(_3842);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1158 = false;
    bool _718 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_70)
    {
        return;
    }
    int _72 = _66 & 31;
    bool _74 = _72 == 0;
    bool _76 = uint(_72) < 32u;
    int _78 = 32 - _72;
    int _80 = _72 - 32;
    int _82 = 1 << _72;
    uint _85 = uint(int(uint(0) >> uint(_78)));
    int _87 = _82 | int(_85);
    int _89 = _74 ? 1 : _87;
    bool _91 = uint(_80) < 32u;
    int _93 = 0 << _80;
    int _95 = _91 ? _93 : 0;
    float _97 = _76 ? as_type<float>(_89) : as_type<float>(_95);
    int _99 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _101 = _99 + 36;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.cp_c5)._m0[int(_105)][_107];
    int _111 = _99 + 32;
    uint _113 = uint(int(uint(_111) >> uint(2)));
    uint _115 = uint(int(uint(int(_113)) >> uint(2)));
    int _117 = int(_113) & 3;
    float _119 = (*spvDescriptorSet0.cp_c5)._m0[int(_115)][_117];
    int _121 = as_type<int>(_97) & as_type<int>(_109);
    bool _123 = _121 != 0;
    int _125 = as_type<int>(_97) & as_type<int>(_119);
    bool _127 = _125 != 0;
    int _129 = 0;
    float _131 = _97;
    float _133 = _109;
    if (_123)
    {
        int _135 = _99 + 8;
        uint _137 = uint(int(uint(_135) >> uint(2)));
        uint _139 = uint(int(uint(int(_137)) >> uint(2)));
        int _141 = int(_137) & 3;
        float _143 = (*spvDescriptorSet0.cp_c5)._m0[int(_139)][_141];
        _129 = as_type<int>(_143);
    }
    int _145 = _129;
    float _147 = 0.0;
    if (_123)
    {
        _147 = 1.4012984643248170709237295832899e-45;
    }
    float _149 = _147;
    float _151 = 0.0;
    if (_123)
    {
        _151 = 2.8025969286496341418474591665798e-45;
    }
    float _153 = _151;
    int _155 = 0;
    if (_127)
    {
        uint _157 = uint(int(uint(_99) >> uint(2)));
        uint _159 = uint(int(uint(int(_157)) >> uint(2)));
        int _161 = int(_157) & 3;
        float _163 = (*spvDescriptorSet0.cp_c5)._m0[int(_159)][_161];
        _155 = as_type<int>(_163);
    }
    int _165 = _155;
    if (_127)
    {
        _131 = 1.4012984643248170709237295832899e-45;
    }
    float _167 = _131;
    float _169 = _149;
    float _171 = as_type<float>(_66);
    float _173 = 0.0;
    float _175 = as_type<float>(_145);
    if (_123)
    {
        int _177 = _66;
        int _179 = 0;
        int _181 = _54(_177, _179, (*spvDescriptorSet0.support_buffer));
        int _183 = _145;
        int _185 = 0;
        int _187 = _54(_183, _185, (*spvDescriptorSet0.support_buffer));
        int3 _1811 = int3(_181, _187, as_type<int>(_149));
        float3 _191 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1811.xy), uint(_1811.z), 0).xyz;
        float _193 = _191.x;
        float _195 = _191.y;
        float _197 = _191.z;
        _169 = _193;
        _171 = _195;
        _173 = _197;
    }
    float _199 = _169;
    float _201 = _171;
    float _203 = _173;
    float _205 = 0.0;
    float _207 = as_type<float>(_66);
    float _209 = 0.0;
    if (_123)
    {
        int _211 = _66;
        int _213 = 0;
        int _215 = _54(_211, _213, (*spvDescriptorSet0.support_buffer));
        int _217 = _145;
        int _219 = 0;
        int _221 = _54(_217, _219, (*spvDescriptorSet0.support_buffer));
        int3 _1839 = int3(_215, _221, 0);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1839.xy), uint(_1839.z), 0).xyz;
        float _225 = _223.x;
        float _227 = _223.y;
        float _229 = _223.z;
        _205 = _225;
        _207 = _227;
        _209 = _229;
    }
    float _231 = _205;
    float _233 = _207;
    float _235 = _209;
    float _237 = _153;
    float _239 = as_type<float>(_66);
    float _241 = 0.0;
    if (_123)
    {
        int _243 = _66;
        int _245 = 0;
        int _247 = _54(_243, _245, (*spvDescriptorSet0.support_buffer));
        int _249 = _145;
        int _251 = 0;
        int _253 = _54(_249, _251, (*spvDescriptorSet0.support_buffer));
        int3 _1870 = int3(_247, _253, as_type<int>(_153));
        float3 _255 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1870.xy), uint(_1870.z), 0).xyz;
        float _257 = _255.x;
        float _259 = _255.y;
        float _261 = _255.z;
        _237 = _257;
        _239 = _259;
        _241 = _261;
    }
    float _263 = _237;
    float _265 = _239;
    float _267 = _241;
    float _269 = 0.0;
    float _271 = as_type<float>(_66);
    float _273 = 0.0;
    if (_127)
    {
        int _275 = _66;
        int _277 = 1;
        int _279 = _54(_275, _277, (*spvDescriptorSet0.support_buffer));
        int _281 = _165;
        int _283 = 1;
        int _285 = _54(_281, _283, (*spvDescriptorSet0.support_buffer));
        int3 _1898 = int3(_279, _285, 0);
        float3 _287 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1898.xy), uint(_1898.z), 0).xyz;
        float _289 = _287.x;
        float _291 = _287.y;
        float _293 = _287.z;
        _269 = _289;
        _271 = _291;
        _273 = _293;
    }
    float _295 = _269;
    float _297 = _271;
    float _299 = _273;
    float _301 = 0.0;
    float _303 = 0.0;
    float _305 = 0.0;
    float _307 = 0.0;
    if (_127)
    {
        int _309 = _66;
        int _311 = 1;
        int _313 = _54(_309, _311, (*spvDescriptorSet0.support_buffer));
        int _315 = _165;
        int _317 = 1;
        int _319 = _54(_315, _317, (*spvDescriptorSet0.support_buffer));
        int3 _1926 = int3(_313, _319, as_type<int>(_167));
        float4 _322 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1926.xy), uint(_1926.z), 0).xyzw;
        float _324 = _322.x;
        float _326 = _322.y;
        float _328 = _322.z;
        float _330 = _322.w;
        _301 = _324;
        _303 = _326;
        _305 = _328;
        _307 = _330;
    }
    float _332 = _301;
    float _334 = _303;
    float _336 = _305;
    float _338 = _307;
    float _340 = 0.0;
    float _342 = 0.0;
    if (!_127)
    {
        _340 = 0.0;
        _342 = 0.0;
    }
    float _344 = _340;
    float _346 = _342;
    float _348 = 0.0;
    float _350 = 0.0;
    float _352 = _344;
    float _354 = _346;
    if (!_127)
    {
        _348 = 0.0;
        _350 = 0.0;
    }
    float _356 = _348;
    float _358 = _350;
    float _360 = 0.0;
    float _362 = _358;
    float _364 = _356;
    if (!_127)
    {
        _360 = 0.0;
    }
    float _366 = _360;
    float _368 = 0.0;
    float _370 = _366;
    if (!_127)
    {
        _368 = 0.0;
    }
    float _372 = _368;
    float _374 = _372;
    if (!_127)
    {
        _175 = 0.0;
        _133 = 0.0;
    }
    float _376 = _175;
    float _378 = _133;
    float _380 = 0.0;
    float _382 = _376;
    float _384 = _378;
    if (!_127)
    {
        _380 = 0.0;
    }
    float _386 = _380;
    float _388 = 0.0;
    float _390 = _386;
    if (!_127)
    {
        _388 = 0.0;
    }
    float _392 = _388;
    bool _394 = !_127;
    float _396 = _392;
    if (!_394)
    {
        int _398 = _66;
        int _400 = 1;
        int _402 = _54(_398, _400, (*spvDescriptorSet0.support_buffer));
        int _404 = _165;
        int _406 = 1;
        int _408 = _54(_404, _406, (*spvDescriptorSet0.support_buffer));
        int3 _2007 = int3(_402, _408, 2);
        float3 _410 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2007.xy), uint(_2007.z), 0).xyz;
        float _412 = _410.x;
        float _414 = _410.y;
        float _416 = _410.z;
        float _418 = _338 * 2.0;
        _370 = _332;
        _374 = _334;
        _390 = _336;
        _396 = _418;
        _352 = _297;
        _354 = _295;
        _362 = _299;
        _382 = _412;
        _384 = _414;
        _364 = _416;
    }
    float _420 = _370;
    float _422 = _374;
    float _424 = _390;
    float _426 = _396;
    float _428 = _352;
    float _430 = _354;
    float _432 = _362;
    float _434 = _382;
    float _436 = _384;
    float _438 = _364;
    bool _440 = !_123;
    float _442 = _434;
    float _690;
    float _692;
    float _694;
    float _696;
    float _698;
    float _700;
    float _702;
    float _704;
    float _706;
    float _708;
    float _710;
    float _712;
    float _714;
    float _716;
    if (!_440)
    {
        float _444 = _420 * 0.15915493667125701904296875;
        float _446 = _422 * 0.15915493667125701904296875;
        float _448 = _424 * 0.15915493667125701904296875;
        float _450 = _201 * 0.15915493667125701904296875;
        float _452 = _444 * 6.283185482025146484375;
        float _454 = cos(_452);
        float _456 = _203 * 0.15915493667125701904296875;
        float _458 = _199 * 0.15915493667125701904296875;
        int _460 = _99 + 28;
        uint _462 = uint(int(uint(_460) >> uint(2)));
        uint _464 = uint(int(uint(int(_462)) >> uint(2)));
        int _466 = int(_462) & 3;
        float _468 = (*spvDescriptorSet0.cp_c5)._m0[int(_464)][_466];
        float _470 = _446 * 6.283185482025146484375;
        float _472 = cos(_470);
        float _474 = _448 * 6.283185482025146484375;
        float _476 = sin(_474);
        float _478 = _448 * 6.283185482025146484375;
        float _480 = cos(_478);
        float _482 = _231 * _468;
        float _484 = _233 * _468;
        float _486 = _235 * _468;
        float _488 = _267 * _468;
        float _490 = _444 * 6.283185482025146484375;
        float _492 = sin(_490);
        float _494 = _476 * _454;
        float _496 = _476 * _472;
        float _498 = _446 * 6.283185482025146484375;
        float _500 = sin(_498);
        int _502 = _99 + 20;
        uint _504 = uint(int(uint(_502) >> uint(2)));
        uint _506 = uint(int(uint(int(_504)) >> uint(2)));
        int _508 = int(_504) & 3;
        float _510 = (*spvDescriptorSet0.cp_c5)._m0[int(_506)][_508];
        float _512 = _454 * _480;
        float _514 = _472 * _480;
        float _516 = _450 * 6.283185482025146484375;
        float _518 = sin(_516);
        float _520 = _492 * _472;
        float _522 = _492 * _480;
        float _524 = _456 * 6.283185482025146484375;
        float _526 = sin(_524);
        float _528 = _456 * 6.283185482025146484375;
        float _530 = cos(_528);
        float _532 = _458 * 6.283185482025146484375;
        float _534 = cos(_532);
        float _536 = _458 * 6.283185482025146484375;
        float _538 = sin(_536);
        float _540 = _450 * 6.283185482025146484375;
        float _542 = cos(_540);
        float _544 = _534 * _530;
        float _546 = _538 * _530;
        float _548 = _454 * _472;
        float _550 = _492 * _500;
        float _552 = _492 * _476;
        float _554 = -_494;
        float _556 = fma(_480, _550, _554);
        float _558 = fma(_476, _550, _512);
        float _560 = fma(_500, _512, _552);
        float _562 = _526 * _534;
        float _564 = _538 * _518;
        float _566 = _534 * _542;
        float _568 = _526 * _542;
        float _570 = _542 * _530;
        float _572 = _538 * _526;
        float _574 = _538 * _542;
        float _576 = -_522;
        float _578 = fma(_500, _494, _576);
        float _580 = -_562;
        float _582 = fma(_530, _564, _580);
        float _584 = fma(_526, _564, _544);
        float _586 = _500 * _510;
        float _588 = fma(_518, _544, _572);
        float _590 = _570 * _468;
        float _592 = _574 * _468;
        float _594 = -_546;
        float _596 = fma(_518, _562, _594);
        float _598 = -_518;
        float _600 = -_586;
        float _602 = fma(_598, _468, _600);
        float _604 = _568 * _468;
        float _606 = fma(_514, _510, _590);
        float _608 = fma(_520, _510, _592);
        float _610 = _584 * _468;
        float _612 = fma(_496, _510, _604);
        float _614 = _582 * _468;
        float _616 = _263 * _468;
        float _618 = fma(_558, _510, _610);
        float _620 = _596 * _468;
        float _622 = fma(_556, _510, _614);
        float _624 = _588 * _468;
        float _626 = _612 * _612;
        float _628 = fma(_578, _510, _620);
        float _630 = _265 * _468;
        float _632 = fma(_560, _510, _624);
        float _634 = _566 * _468;
        float _636 = _628 * _628;
        float _638 = fma(_606, _606, _626);
        float _640 = _618 * _618;
        float _642 = fma(_548, _510, _634);
        float _644 = fma(_632, _632, _636);
        float _646 = fma(_602, _602, _638);
        float _648 = fma(_622, _622, _640);
        float _650 = fma(_428, _510, _484);
        float _652 = fma(_642, _642, _644);
        float _654 = rsqrt(_646);
        float _656 = fma(_608, _608, _648);
        float _658 = fma(_430, _510, _482);
        float _660 = fma(_432, _510, _486);
        float _662 = fma(_434, _510, _616);
        float _664 = fma(_436, _510, _630);
        float _666 = fma(_438, _510, _488);
        float _668 = rsqrt(_656);
        float _670 = rsqrt(_652);
        float _672 = _606 * _654;
        float _674 = _612 * _654;
        float _676 = _602 * _654;
        float _678 = _622 * _668;
        float _680 = _618 * _668;
        float _682 = _608 * _668;
        float _684 = _632 * _670;
        float _686 = _628 * _670;
        float _688 = _642 * _670;
        _690 = _650;
        _692 = _680;
        _694 = _660;
        _696 = _684;
        _698 = _686;
        _700 = _688;
        _702 = _658;
        _704 = _672;
        _706 = _674;
        _708 = _676;
        _710 = _678;
        _712 = _682;
        _714 = _666;
        _716 = _664;
        _442 = _662;
        _718 = true;
    }
    else
    {
        float _720 = _420 * 2.0;
        float _722 = _424 * _426;
        float _724 = _422 * _426;
        float _726 = _420 * _426;
        float _728 = _422 * _422;
        float _730 = -_722;
        float _732 = fma(_720, _422, _730);
        float _734 = fma(_720, _422, _722);
        float _736 = fma(_720, _424, _724);
        float _738 = -_724;
        float _740 = fma(_720, _424, _738);
        float _742 = _420 * _420;
        float _744 = _422 * 2.0;
        float _746 = _424 * _424;
        float _748 = fma(_728, -2.0, 1.0);
        float _750 = fma(_742, -2.0, 1.0);
        float _752 = -_726;
        float _754 = fma(_744, _424, _752);
        float _756 = fma(_744, _424, _726);
        float _758 = fma(_746, -2.0, _748);
        float _760 = fma(_746, -2.0, _750);
        float _762 = fma(_728, -2.0, _750);
        _690 = _428;
        _692 = _760;
        _694 = _432;
        _696 = _736;
        _698 = _754;
        _700 = _762;
        _702 = _430;
        _704 = _758;
        _706 = _734;
        _708 = _740;
        _710 = _732;
        _712 = _756;
        _714 = _438;
        _716 = _436;
    }
    _718 = false;
    float _764 = _690;
    float _766 = _692;
    float _768 = _694;
    float _770 = _696;
    float _772 = _698;
    float _774 = _700;
    float _776 = _702;
    float _778 = _704;
    float _780 = _706;
    float _782 = _708;
    float _784 = _710;
    float _786 = _712;
    float _788 = _714;
    float _790 = _716;
    float _792 = _442;
    bool _794 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _796 = _764 * _766;
    float _798 = _768 * _770;
    float _800 = _768 * _772;
    float _802 = _768 * _774;
    float _804 = _776 * _778;
    float _806 = _776 * _780;
    float _808 = _776 * _782;
    float _810 = _764 * _784;
    float _812 = _764 * _786;
    int _814 = _66 * 112;
    bool _816 = !_794;
    float _1134;
    float _1136;
    float _1138;
    float _1140;
    float _1142;
    float _1144;
    float _1146;
    float _1148;
    float _1150;
    float _1152;
    float _1154;
    float _1156;
    if (!_816)
    {
        int _818 = 0;
        float _820 = _804;
        float _822 = _810;
        float _824 = _798;
        float _826 = _792;
        float _828 = _806;
        float _830 = _796;
        float _832 = _800;
        float _834 = _790;
        float _836 = _808;
        float _838 = _812;
        float _840 = _802;
        float _842 = _788;
        bool _844;
        int _892;
        int _902;
        int _912;
        int _922;
        int _932;
        int _942;
        int _952;
        int _962;
        int _972;
        int _982;
        int _992;
        int _1002;
        int _1110;
        int _1114;
        int _1116;
        int _1120;
        float _1122;
        int _1124;
        float _1128;
        int _1130;
        int _1132;
        do
        {
            int _846 = _818;
            int _848 = as_type<int>(_820);
            int _850 = as_type<int>(_822);
            int _852 = as_type<int>(_824);
            int _854 = as_type<int>(_826);
            int _856 = as_type<int>(_828);
            int _858 = as_type<int>(_830);
            float _860 = _832;
            int _862 = as_type<int>(_834);
            int _864 = as_type<int>(_836);
            float _866 = _838;
            int _868 = as_type<int>(_840);
            int _870 = as_type<int>(_842);
            uint _872 = uint(int(uint(_814) >> uint(2)));
            uint _874 = uint(int(uint(int(_872)) >> uint(2)));
            int _876 = int(_872) & 3;
            float _878 = (*spvDescriptorSet0.cp_c6)._m0[int(_874)][_876];
            bool _880 = _66 != 0;
            int _882 = _846 + 1;
            bool _884 = uint(_882) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _886 = _848;
            int _888 = as_type<int>(_878);
            int _890 = 31;
            int _2633 = _56(_886, _888, _890, _892, gl_SubgroupInvocationID);
            int _894 = _2633;
            int _896 = _850;
            int _898 = as_type<int>(_878);
            int _900 = 31;
            int _2637 = _56(_896, _898, _900, _902, gl_SubgroupInvocationID);
            int _904 = _2637;
            int _906 = _852;
            int _908 = as_type<int>(_878);
            int _910 = 31;
            int _2641 = _56(_906, _908, _910, _912, gl_SubgroupInvocationID);
            int _914 = _2641;
            int _916 = _854;
            int _918 = as_type<int>(_878);
            int _920 = 31;
            int _2645 = _56(_916, _918, _920, _922, gl_SubgroupInvocationID);
            int _924 = _2645;
            int _926 = _856;
            int _928 = as_type<int>(_878);
            int _930 = 31;
            int _2649 = _56(_926, _928, _930, _932, gl_SubgroupInvocationID);
            int _934 = _2649;
            int _936 = _858;
            int _938 = as_type<int>(_878);
            int _940 = 31;
            int _2653 = _56(_936, _938, _940, _942, gl_SubgroupInvocationID);
            int _944 = _2653;
            int _946 = as_type<int>(_860);
            int _948 = as_type<int>(_878);
            int _950 = 31;
            int _2658 = _56(_946, _948, _950, _952, gl_SubgroupInvocationID);
            int _954 = _2658;
            int _956 = _862;
            int _958 = as_type<int>(_878);
            int _960 = 31;
            int _2662 = _56(_956, _958, _960, _962, gl_SubgroupInvocationID);
            int _964 = _2662;
            int _966 = _864;
            int _968 = as_type<int>(_878);
            int _970 = 31;
            int _2666 = _56(_966, _968, _970, _972, gl_SubgroupInvocationID);
            int _974 = _2666;
            int _976 = as_type<int>(_866);
            int _978 = as_type<int>(_878);
            int _980 = 31;
            int _2671 = _56(_976, _978, _980, _982, gl_SubgroupInvocationID);
            int _984 = _2671;
            int _986 = _868;
            int _988 = as_type<int>(_878);
            int _990 = 31;
            int _2675 = _56(_986, _988, _990, _992, gl_SubgroupInvocationID);
            int _994 = _2675;
            int _996 = _870;
            int _998 = as_type<int>(_878);
            int _1000 = 31;
            int _2679 = _56(_996, _998, _1000, _1002, gl_SubgroupInvocationID);
            int _1004 = _2679;
            bool _1006 = !_880;
            _818 = _882;
            int _1008 = _848;
            int _1010 = _850;
            int _1012 = _852;
            int _1014 = _854;
            int _1016 = _856;
            int _1018 = _858;
            float _1020 = _860;
            int _1022 = _862;
            int _1024 = _864;
            float _1026 = _866;
            int _1028 = _868;
            int _1030 = _870;
            if (!_1006)
            {
                float _1032 = _806 * as_type<float>(_904);
                float _1034 = _796 * as_type<float>(_904);
                float _1036 = _800 * as_type<float>(_944);
                float _1038 = _800 * as_type<float>(_904);
                float _1040 = fma(_804, as_type<float>(_894), _1032);
                float _1042 = fma(_810, as_type<float>(_894), _1034);
                float _1044 = _806 * as_type<float>(_944);
                float _1046 = _796 * as_type<float>(_944);
                float _1048 = as_type<float>(_904) * _790;
                float _1050 = as_type<float>(_944) * _790;
                float _1052 = fma(_804, as_type<float>(_934), _1044);
                float _1054 = fma(_810, as_type<float>(_934), _1046);
                float _1056 = fma(_798, as_type<float>(_934), _1036);
                float _1058 = _806 * as_type<float>(_984);
                float _1060 = _796 * as_type<float>(_984);
                float _1062 = _800 * as_type<float>(_984);
                float _1064 = as_type<float>(_984) * _790;
                float _1066 = fma(_798, as_type<float>(_894), _1038);
                float _1068 = fma(as_type<float>(_894), _792, _1048);
                float _1070 = fma(as_type<float>(_934), _792, _1050);
                float _1072 = fma(_804, as_type<float>(_974), _1058);
                float _1074 = fma(_810, as_type<float>(_974), _1060);
                float _1076 = fma(_798, as_type<float>(_974), _1062);
                float _1078 = fma(as_type<float>(_974), _792, _1064);
                float _1080 = fma(_802, as_type<float>(_914), _1066);
                float _1082 = fma(_808, as_type<float>(_914), _1040);
                float _1084 = fma(_812, as_type<float>(_914), _1042);
                float _1086 = fma(_808, as_type<float>(_954), _1052);
                float _1088 = fma(_812, as_type<float>(_954), _1054);
                float _1090 = fma(_802, as_type<float>(_954), _1056);
                float _1092 = fma(as_type<float>(_914), _788, _1068);
                float _1094 = fma(as_type<float>(_954), _788, _1070);
                float _1096 = fma(as_type<float>(_994), _788, _1078);
                float _1098 = fma(_808, as_type<float>(_994), _1072);
                float _1100 = fma(_812, as_type<float>(_994), _1074);
                float _1102 = fma(_802, as_type<float>(_994), _1076);
                float _1104 = as_type<float>(_924) + _1092;
                float _1106 = as_type<float>(_964) + _1094;
                float _1108 = as_type<float>(_1004) + _1096;
                _1008 = as_type<int>(_1082);
                _1010 = as_type<int>(_1084);
                _1012 = as_type<int>(_1080);
                _1014 = as_type<int>(_1104);
                _1016 = as_type<int>(_1086);
                _1018 = as_type<int>(_1088);
                _1020 = _1090;
                _1022 = as_type<int>(_1106);
                _1024 = as_type<int>(_1098);
                _1026 = _1100;
                _1028 = as_type<int>(_1102);
                _1030 = as_type<int>(_1108);
            }
            _1110 = _1008;
            int _1112 = _1010;
            _1114 = _1012;
            _1116 = _1014;
            int _1118 = _1016;
            _1120 = _1018;
            _1122 = _1020;
            _1124 = _1022;
            int _1126 = _1024;
            _1128 = _1026;
            _1130 = _1028;
            _1132 = _1030;
            _844 = !_884;
            _820 = as_type<float>(_1110);
            _822 = as_type<float>(_1112);
            _824 = as_type<float>(_1114);
            _826 = as_type<float>(_1116);
            _828 = as_type<float>(_1118);
            _830 = as_type<float>(_1120);
            _832 = _1122;
            _834 = as_type<float>(_1124);
            _836 = as_type<float>(_1126);
            _838 = _1128;
            _840 = as_type<float>(_1130);
            _842 = as_type<float>(_1132);
            _1134 = as_type<float>(_1112);
            _1136 = as_type<float>(_1118);
            _1138 = as_type<float>(_1126);
        } while (_844);
        _1140 = as_type<float>(_1120);
        _1142 = _1128;
        _1144 = as_type<float>(_1110);
        _1146 = _1122;
        _1148 = as_type<float>(_1124);
        _1150 = as_type<float>(_1114);
        _1152 = as_type<float>(_1130);
        _1154 = as_type<float>(_1116);
        _1156 = as_type<float>(_1132);
        _1158 = true;
    }
    else
    {
        _1134 = _810;
        _1140 = _796;
        _1142 = _812;
        _1144 = _804;
        _1136 = _806;
        _1138 = _808;
        _1146 = _800;
        _1148 = _790;
        _1150 = _798;
        _1152 = _802;
        _1154 = _792;
        _1156 = _788;
    }
    _1158 = false;
    float _1160 = _1134;
    float _1162 = _1140;
    float _1164 = _1142;
    float _1166 = _1144;
    float _1168 = _1136;
    float _1170 = _1138;
    float _1172 = _1146;
    float _1174 = _1148;
    float _1176 = _1150;
    float _1178 = _1152;
    float _1180 = _1154;
    float _1182 = _1156;
    int _1184 = _814 + 80;
    uint _1186 = uint(int(uint(_1184) >> uint(2)));
    uint _1188 = uint(int(uint(int(_1186)) >> uint(2)));
    int _1190 = int(_1186) & 3;
    float _1192 = (*spvDescriptorSet0.cp_c6)._m0[int(_1188)][_1190];
    int _1194 = int(_1186) + 1;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    int _1198 = _1194 & 3;
    float _1200 = (*spvDescriptorSet0.cp_c6)._m0[int(_1196)][_1198];
    int _1202 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1204 = _1202 + _66;
    int _1206 = _814 + 64;
    uint _1208 = uint(int(uint(_1206) >> uint(2)));
    uint _1210 = uint(int(uint(int(_1208)) >> uint(2)));
    int _1212 = int(_1208) & 3;
    float _1214 = (*spvDescriptorSet0.cp_c6)._m0[int(_1210)][_1212];
    int _1216 = int(_1208) + 1;
    uint _1218 = uint(int(uint(_1216) >> uint(2)));
    int _1220 = _1216 & 3;
    float _1222 = (*spvDescriptorSet0.cp_c6)._m0[int(_1218)][_1220];
    int _1224 = _1204 * 48;
    int _1226 = _814 + 88;
    uint _1228 = uint(int(uint(_1226) >> uint(2)));
    uint _1230 = uint(int(uint(int(_1228)) >> uint(2)));
    int _1232 = int(_1228) & 3;
    float _1234 = (*spvDescriptorSet0.cp_c6)._m0[int(_1230)][_1232];
    int _1236 = int(_1228) + 1;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    int _1240 = _1236 & 3;
    float _1242 = (*spvDescriptorSet0.cp_c6)._m0[int(_1238)][_1240];
    int _1244 = _814 + 72;
    uint _1246 = uint(int(uint(_1244) >> uint(2)));
    uint _1248 = uint(int(uint(int(_1246)) >> uint(2)));
    int _1250 = int(_1246) & 3;
    float _1252 = (*spvDescriptorSet0.cp_c6)._m0[int(_1248)][_1250];
    int _1254 = int(_1246) + 1;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    int _1258 = _1254 & 3;
    float _1260 = (*spvDescriptorSet0.cp_c6)._m0[int(_1256)][_1258];
    int _1262 = _814 + 104;
    uint _1264 = uint(int(uint(_1262) >> uint(2)));
    uint _1266 = uint(int(uint(int(_1264)) >> uint(2)));
    int _1268 = int(_1264) & 3;
    float _1270 = (*spvDescriptorSet0.cp_c6)._m0[int(_1266)][_1268];
    int _1272 = int(_1264) + 1;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    int _1276 = _1272 & 3;
    float _1278 = (*spvDescriptorSet0.cp_c6)._m0[int(_1274)][_1276];
    int _1280 = _814 + 96;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    uint _1284 = uint(int(uint(int(_1282)) >> uint(2)));
    int _1286 = int(_1282) & 3;
    float _1288 = (*spvDescriptorSet0.cp_c6)._m0[int(_1284)][_1286];
    int _1290 = int(_1282) + 1;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    int _1294 = _1290 & 3;
    float _1296 = (*spvDescriptorSet0.cp_c6)._m0[int(_1292)][_1294];
    float _1298 = _1160 * _1192;
    float _1300 = _1162 * _1192;
    float _1302 = _1164 * _1192;
    int _1304 = _814 + 16;
    uint _1306 = uint(int(uint(_1304) >> uint(2)));
    uint _1308 = uint(int(uint(int(_1306)) >> uint(2)));
    int _1310 = int(_1306) & 3;
    float _1312 = (*spvDescriptorSet0.cp_c6)._m0[int(_1308)][_1310];
    int _1314 = int(_1306) + 1;
    uint _1316 = uint(int(uint(_1314) >> uint(2)));
    int _1318 = _1314 & 3;
    float _1320 = (*spvDescriptorSet0.cp_c6)._m0[int(_1316)][_1318];
    float _1322 = _1164 * _1200;
    float _1324 = fma(_1166, _1214, _1298);
    float _1326 = fma(_1168, _1214, _1300);
    float _1328 = fma(_1170, _1214, _1302);
    float _1330 = _1160 * _1200;
    int _1332 = _814 + 32;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    uint _1336 = uint(int(uint(int(_1334)) >> uint(2)));
    int _1338 = int(_1334) & 3;
    float _1340 = (*spvDescriptorSet0.cp_c6)._m0[int(_1336)][_1338];
    int _1342 = int(_1334) + 1;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    int _1346 = _1342 & 3;
    float _1348 = (*spvDescriptorSet0.cp_c6)._m0[int(_1344)][_1346];
    float _1350 = _1162 * _1200;
    float _1352 = fma(_1170, _1222, _1322);
    float _1354 = fma(_1166, _1222, _1330);
    float _1356 = _1160 * _1234;
    float _1358 = _1160 * _1242;
    float _1360 = _1162 * _1234;
    float _1362 = _1162 * _1242;
    int _1364 = _814 + 48;
    uint _1366 = uint(int(uint(_1364) >> uint(2)));
    uint _1368 = uint(int(uint(int(_1366)) >> uint(2)));
    int _1370 = int(_1366) & 3;
    float _1372 = (*spvDescriptorSet0.cp_c6)._m0[int(_1368)][_1370];
    int _1374 = int(_1366) + 1;
    uint _1376 = uint(int(uint(_1374) >> uint(2)));
    int _1378 = _1374 & 3;
    float _1380 = (*spvDescriptorSet0.cp_c6)._m0[int(_1376)][_1378];
    float _1382 = _1164 * _1234;
    float _1384 = _1164 * _1242;
    float _1386 = fma(_1168, _1222, _1350);
    float _1388 = fma(_1166, _1252, _1356);
    float _1390 = fma(_1166, _1260, _1358);
    float _1392 = fma(_1168, _1252, _1360);
    float _1394 = fma(_1168, _1260, _1362);
    int _1396 = _814 + 24;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    uint _1400 = uint(int(uint(int(_1398)) >> uint(2)));
    int _1402 = int(_1398) & 3;
    float _1404 = (*spvDescriptorSet0.cp_c6)._m0[int(_1400)][_1402];
    int _1406 = int(_1398) + 1;
    uint _1408 = uint(int(uint(_1406) >> uint(2)));
    int _1410 = _1406 & 3;
    float _1412 = (*spvDescriptorSet0.cp_c6)._m0[int(_1408)][_1410];
    float _1414 = fma(_1170, _1252, _1382);
    float _1416 = fma(_1170, _1260, _1384);
    float _1418 = fma(_1172, _1278, _1394);
    int _1420 = _814 + 40;
    uint _1422 = uint(int(uint(_1420) >> uint(2)));
    uint _1424 = uint(int(uint(int(_1422)) >> uint(2)));
    int _1426 = int(_1422) & 3;
    float _1428 = (*spvDescriptorSet0.cp_c6)._m0[int(_1424)][_1426];
    int _1430 = int(_1422) + 1;
    uint _1432 = uint(int(uint(_1430) >> uint(2)));
    int _1434 = _1430 & 3;
    float _1436 = (*spvDescriptorSet0.cp_c6)._m0[int(_1432)][_1434];
    float _1438 = _1418 + _1174;
    float _1440 = fma(_1176, _1288, _1324);
    float _1442 = fma(_1172, _1288, _1326);
    float _1444 = fma(_1178, _1288, _1328);
    float _1446 = fma(_1176, _1296, _1354);
    int _1448 = _814 + 56;
    uint _1450 = uint(int(uint(_1448) >> uint(2)));
    uint _1452 = uint(int(uint(int(_1450)) >> uint(2)));
    int _1454 = int(_1450) & 3;
    float _1456 = (*spvDescriptorSet0.cp_c6)._m0[int(_1452)][_1454];
    int _1458 = int(_1450) + 1;
    uint _1460 = uint(int(uint(_1458) >> uint(2)));
    int _1462 = _1458 & 3;
    float _1464 = (*spvDescriptorSet0.cp_c6)._m0[int(_1460)][_1462];
    float _1466 = fma(_1176, _1270, _1388);
    float _1468 = fma(_1176, _1278, _1390);
    float _1470 = fma(_1178, _1278, _1416);
    float _1472 = fma(_1172, _1296, _1386);
    float _1474 = fma(_1172, _1270, _1392);
    float _1476 = fma(_1178, _1270, _1414);
    float _1478 = _1468 + _1180;
    float _1480 = _1470 + _1182;
    float _1482 = _1438 * _1320;
    float _1484 = _1442 * _1320;
    float _1486 = _1472 * _1320;
    float _1488 = _1474 * _1320;
    float _1490 = fma(_1478, _1312, _1482);
    float _1492 = fma(_1440, _1312, _1484);
    float _1494 = fma(_1446, _1312, _1486);
    float _1496 = _1438 * _1348;
    float _1498 = fma(_1466, _1312, _1488);
    float _1500 = _1442 * _1348;
    float _1502 = fma(_1178, _1296, _1352);
    float _1504 = _1472 * _1348;
    float _1506 = _1474 * _1348;
    float _1508 = fma(_1478, _1340, _1496);
    float _1510 = fma(_1440, _1340, _1500);
    float _1512 = _1438 * _1380;
    float _1514 = _1442 * _1380;
    float _1516 = _1472 * _1380;
    float _1518 = _1474 * _1380;
    float _1520 = fma(_1478, _1372, _1512);
    float _1522 = fma(_1446, _1340, _1504);
    float _1524 = fma(_1466, _1340, _1506);
    float _1526 = fma(_1440, _1372, _1514);
    float _1528 = fma(_1480, _1404, _1490);
    float _1530 = fma(_1446, _1372, _1516);
    float _1532 = fma(_1466, _1372, _1518);
    float _1534 = fma(_1444, _1404, _1492);
    float _1536 = _1528 + _1412;
    float _1538 = fma(_1502, _1404, _1494);
    float _1540 = fma(_1476, _1404, _1498);
    float _1542 = fma(_1480, _1428, _1508);
    float _1544 = fma(_1444, _1428, _1510);
    float _1546 = fma(_1502, _1428, _1522);
    int _1548 = _1224 + 16;
    float _1550 = fma(_1476, _1428, _1524);
    float _1552 = _1542 + _1436;
    int _1554 = _1224 + 32;
    float _1556 = fma(_1480, _1456, _1520);
    float _1558 = fma(_1444, _1456, _1526);
    float _1560 = fma(_1502, _1456, _1530);
    float _1562 = fma(_1476, _1456, _1532);
    float _1564 = _1556 + _1464;
    int _1566 = _1224 + 48;
    uint _1568 = uint(int(uint(_1548) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1568)] = as_type<uint>(_1534);
    int _1570 = _1548 + 4;
    uint _1572 = uint(int(uint(_1570) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1572)] = as_type<uint>(_1538);
    int _1574 = _1548 + 8;
    uint _1576 = uint(int(uint(_1574) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1576)] = as_type<uint>(_1540);
    int _1578 = _1548 + 12;
    uint _1580 = uint(int(uint(_1578) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1580)] = as_type<uint>(_1536);
    uint _1582 = uint(int(uint(_1554) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1582)] = as_type<uint>(_1544);
    int _1584 = _1554 + 4;
    uint _1586 = uint(int(uint(_1584) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1586)] = as_type<uint>(_1546);
    int _1588 = _1554 + 8;
    uint _1590 = uint(int(uint(_1588) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1590)] = as_type<uint>(_1550);
    int _1592 = _1554 + 12;
    uint _1594 = uint(int(uint(_1592) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1594)] = as_type<uint>(_1552);
    uint _1596 = uint(int(uint(_1566) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1596)] = as_type<uint>(_1558);
    int _1598 = _1566 + 4;
    uint _1600 = uint(int(uint(_1598) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1600)] = as_type<uint>(_1560);
    int _1602 = _1566 + 8;
    uint _1604 = uint(int(uint(_1602) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1604)] = as_type<uint>(_1562);
    int _1606 = _1566 + 12;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1608)] = as_type<uint>(_1564);
}

