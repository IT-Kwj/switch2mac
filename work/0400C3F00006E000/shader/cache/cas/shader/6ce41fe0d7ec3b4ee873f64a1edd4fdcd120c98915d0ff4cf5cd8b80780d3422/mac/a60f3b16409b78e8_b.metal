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
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_A [[id(7)]];
    sampler cp_t_tcb_ASmplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_8 [[id(9)]];
    sampler cp_t_tcb_8Smplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _3963, thread const int& _3964, constant _10& support_buffer)
{
    int _3967 = 1 + _3964;
    float _3969 = support_buffer._m5[_3967].x;
    bool _3971 = _3969 == 1.0;
    if (_3971)
    {
        return _3963;
    }
    float _3973 = float(_3963);
    float _3975 = _3973 * _3969;
    int _3977 = int(_3975);
    return _3977;
}

static inline __attribute__((always_inline))
int _58(thread const int& _3998, thread const int& _3999, thread const int& _4000, thread int& _4001, thread uint& gl_SubgroupInvocationID)
{
    int _4004 = _4000 & 31;
    uint _4006 = uint(int(uint(_4000) >> uint(8)));
    int _4008 = int(_4006) & 31;
    float _4010 = as_type<float>(gl_SubgroupInvocationID);
    int _4012 = as_type<int>(_4010) & _4008;
    int _4014 = ~_4008;
    int _4016 = _4004 & _4014;
    int _4018 = _4016 | _4012;
    int _4020 = ~_4008;
    int _4022 = _3999 & _4020;
    int _4024 = _4022 | _4012;
    bool _4026 = uint(_4024) <= uint(_4018);
    _4001 = _4026 ? (-1) : 0;
    float _4028 = spvSubgroupShuffle(as_type<float>(_3998), uint(_4024));
    uint _4030 = uint(_4026 ? as_type<int>(_4028) : _3998);
    return int(_4030);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _1210 = false;
    bool _720 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_72)
    {
        return;
    }
    int _74 = _68 & 31;
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
    int _103 = _101 + 36;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = _101 + 32;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    uint _117 = uint(int(uint(int(_115)) >> uint(2)));
    int _119 = int(_115) & 3;
    float _121 = (*spvDescriptorSet0.cp_c5)._m0[int(_117)][_119];
    int _123 = as_type<int>(_99) & as_type<int>(_111);
    bool _125 = _123 != 0;
    int _127 = as_type<int>(_99) & as_type<int>(_121);
    bool _129 = _127 != 0;
    int _131 = 0;
    float _133 = _99;
    if (_125)
    {
        int _135 = _101 + 8;
        uint _137 = uint(int(uint(_135) >> uint(2)));
        uint _139 = uint(int(uint(int(_137)) >> uint(2)));
        int _141 = int(_137) & 3;
        float _143 = (*spvDescriptorSet0.cp_c5)._m0[int(_139)][_141];
        _131 = as_type<int>(_143);
    }
    int _145 = _131;
    float _147 = 0.0;
    if (_125)
    {
        _147 = 1.4012984643248170709237295832899e-45;
    }
    float _149 = _147;
    if (_125)
    {
        _133 = 2.8025969286496341418474591665798e-45;
    }
    float _151 = _133;
    int _153 = 0;
    if (_129)
    {
        uint _155 = uint(int(uint(_101) >> uint(2)));
        uint _157 = uint(int(uint(int(_155)) >> uint(2)));
        int _159 = int(_155) & 3;
        float _161 = (*spvDescriptorSet0.cp_c5)._m0[int(_157)][_159];
        _153 = as_type<int>(_161);
    }
    int _163 = _153;
    float _165 = 0.0;
    if (_129)
    {
        _165 = 1.4012984643248170709237295832899e-45;
    }
    float _167 = _165;
    float _169 = _149;
    float _171 = as_type<float>(_68);
    float _173 = 0.0;
    float _175 = as_type<float>(_145);
    if (_125)
    {
        int _177 = _68;
        int _179 = 0;
        int _181 = _56(_177, _179, (*spvDescriptorSet0.support_buffer));
        int _183 = _145;
        int _185 = 0;
        int _187 = _56(_183, _185, (*spvDescriptorSet0.support_buffer));
        int3 _1862 = int3(_181, _187, as_type<int>(_149));
        float3 _191 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1862.xy), uint(_1862.z), 0).xyz;
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
    float _207 = as_type<float>(_68);
    float _209 = 0.0;
    if (_125)
    {
        int _211 = _68;
        int _213 = 0;
        int _215 = _56(_211, _213, (*spvDescriptorSet0.support_buffer));
        int _217 = _145;
        int _219 = 0;
        int _221 = _56(_217, _219, (*spvDescriptorSet0.support_buffer));
        int3 _1890 = int3(_215, _221, 0);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1890.xy), uint(_1890.z), 0).xyz;
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
    float _237 = _151;
    float _239 = as_type<float>(_68);
    float _241 = 0.0;
    if (_125)
    {
        int _243 = _68;
        int _245 = 0;
        int _247 = _56(_243, _245, (*spvDescriptorSet0.support_buffer));
        int _249 = _145;
        int _251 = 0;
        int _253 = _56(_249, _251, (*spvDescriptorSet0.support_buffer));
        int3 _1921 = int3(_247, _253, as_type<int>(_151));
        float3 _255 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1921.xy), uint(_1921.z), 0).xyz;
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
    float _271 = as_type<float>(_68);
    float _273 = 0.0;
    if (_129)
    {
        int _275 = _68;
        int _277 = 1;
        int _279 = _56(_275, _277, (*spvDescriptorSet0.support_buffer));
        int _281 = _163;
        int _283 = 1;
        int _285 = _56(_281, _283, (*spvDescriptorSet0.support_buffer));
        int3 _1949 = int3(_279, _285, 0);
        float3 _287 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1949.xy), uint(_1949.z), 0).xyz;
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
    if (_129)
    {
        int _309 = _68;
        int _311 = 1;
        int _313 = _56(_309, _311, (*spvDescriptorSet0.support_buffer));
        int _315 = _163;
        int _317 = 1;
        int _319 = _56(_315, _317, (*spvDescriptorSet0.support_buffer));
        int3 _1977 = int3(_313, _319, as_type<int>(_167));
        float4 _322 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1977.xy), uint(_1977.z), 0).xyzw;
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
    if (!_129)
    {
        _340 = 0.0;
    }
    float _342 = _340;
    float _344 = 0.0;
    float _346 = 0.0;
    float _348 = _342;
    if (!_129)
    {
        _344 = 0.0;
        _346 = 0.0;
    }
    float _350 = _344;
    float _352 = _346;
    float _354 = 0.0;
    float _356 = 0.0;
    float _358 = _350;
    float _360 = _352;
    if (!_129)
    {
        _354 = 0.0;
        _356 = 0.0;
    }
    float _362 = _354;
    float _364 = _356;
    float _366 = 0.0;
    float _368 = _364;
    float _370 = _362;
    if (!_129)
    {
        _366 = 0.0;
    }
    float _372 = _366;
    float _374 = 0.0;
    float _376 = _372;
    if (!_129)
    {
        _175 = 0.0;
        _374 = 0.0;
    }
    float _378 = _175;
    float _380 = _374;
    float _382 = 0.0;
    float _384 = _378;
    float _386 = _380;
    if (!_129)
    {
        _382 = 0.0;
    }
    float _388 = _382;
    float _390 = 0.0;
    float _392 = _388;
    if (!_129)
    {
        _390 = 0.0;
    }
    float _394 = _390;
    bool _396 = !_129;
    float _398 = _394;
    if (!_396)
    {
        int _400 = _68;
        int _402 = 1;
        int _404 = _56(_400, _402, (*spvDescriptorSet0.support_buffer));
        int _406 = _163;
        int _408 = 1;
        int _410 = _56(_406, _408, (*spvDescriptorSet0.support_buffer));
        int3 _2058 = int3(_404, _410, 2);
        float3 _412 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2058.xy), uint(_2058.z), 0).xyz;
        float _414 = _412.x;
        float _416 = _412.y;
        float _418 = _412.z;
        float _420 = _338 * 2.0;
        _376 = _332;
        _392 = _334;
        _368 = _336;
        _398 = _420;
        _358 = _297;
        _384 = _414;
        _386 = _416;
        _370 = _418;
        _348 = _295;
        _360 = _299;
    }
    float _422 = _376;
    float _424 = _392;
    float _426 = _368;
    float _428 = _398;
    float _430 = _358;
    float _432 = _384;
    float _434 = _386;
    float _436 = _370;
    float _438 = _348;
    float _440 = _360;
    bool _442 = !_125;
    float _444 = _434;
    float _446 = _436;
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
    float _718;
    if (!_442)
    {
        float _448 = _422 * 0.15915493667125701904296875;
        float _450 = _424 * 0.15915493667125701904296875;
        float _452 = _426 * 0.15915493667125701904296875;
        float _454 = _201 * 0.15915493667125701904296875;
        float _456 = _448 * 6.283185482025146484375;
        float _458 = cos(_456);
        float _460 = _203 * 0.15915493667125701904296875;
        float _462 = _199 * 0.15915493667125701904296875;
        int _464 = _101 + 28;
        uint _466 = uint(int(uint(_464) >> uint(2)));
        uint _468 = uint(int(uint(int(_466)) >> uint(2)));
        int _470 = int(_466) & 3;
        float _472 = (*spvDescriptorSet0.cp_c5)._m0[int(_468)][_470];
        float _474 = _450 * 6.283185482025146484375;
        float _476 = cos(_474);
        float _478 = _452 * 6.283185482025146484375;
        float _480 = sin(_478);
        float _482 = _452 * 6.283185482025146484375;
        float _484 = cos(_482);
        float _486 = _235 * _472;
        float _488 = _448 * 6.283185482025146484375;
        float _490 = sin(_488);
        float _492 = _480 * _476;
        float _494 = _450 * 6.283185482025146484375;
        float _496 = sin(_494);
        int _498 = _101 + 20;
        uint _500 = uint(int(uint(_498) >> uint(2)));
        uint _502 = uint(int(uint(int(_500)) >> uint(2)));
        int _504 = int(_500) & 3;
        float _506 = (*spvDescriptorSet0.cp_c5)._m0[int(_502)][_504];
        float _508 = _458 * _484;
        float _510 = _476 * _484;
        float _512 = _454 * 6.283185482025146484375;
        float _514 = cos(_512);
        float _516 = _480 * _458;
        float _518 = _490 * _484;
        float _520 = _460 * 6.283185482025146484375;
        float _522 = sin(_520);
        float _524 = _490 * _496;
        float _526 = -_518;
        float _528 = fma(_496, _516, _526);
        float _530 = -_516;
        float _532 = fma(_484, _524, _530);
        float _534 = _460 * 6.283185482025146484375;
        float _536 = cos(_534);
        float _538 = _462 * 6.283185482025146484375;
        float _540 = cos(_538);
        float _542 = _462 * 6.283185482025146484375;
        float _544 = sin(_542);
        float _546 = _454 * 6.283185482025146484375;
        float _548 = sin(_546);
        float _550 = _540 * _514;
        float _552 = _522 * _540;
        float _554 = _550 * _472;
        float _556 = _544 * _514;
        float _558 = _458 * _476;
        float _560 = _490 * _480;
        float _562 = _490 * _476;
        float _564 = fma(_480, _524, _508);
        float _566 = _514 * _536;
        float _568 = fma(_496, _508, _560);
        float _570 = _522 * _514;
        float _572 = _540 * _536;
        float _574 = _544 * _548;
        float _576 = _544 * _536;
        float _578 = _544 * _522;
        float _580 = _566 * _472;
        float _582 = fma(_522, _574, _572);
        float _584 = -_576;
        float _586 = fma(_548, _552, _584);
        float _588 = -_552;
        float _590 = fma(_536, _574, _588);
        float _592 = fma(_548, _572, _578);
        float _594 = _582 * _472;
        float _596 = _586 * _472;
        float _598 = _570 * _472;
        float _600 = _556 * _472;
        float _602 = _590 * _472;
        float _604 = _592 * _472;
        float _606 = fma(_564, _506, _594);
        float _608 = fma(_528, _506, _596);
        float _610 = fma(_492, _506, _598);
        float _612 = fma(_510, _506, _580);
        float _614 = fma(_562, _506, _600);
        float _616 = fma(_532, _506, _602);
        float _618 = fma(_568, _506, _604);
        float _620 = _606 * _606;
        float _622 = _608 * _608;
        float _624 = _496 * _506;
        float _626 = _610 * _610;
        float _628 = fma(_616, _616, _620);
        float _630 = fma(_558, _506, _554);
        float _632 = fma(_618, _618, _622);
        float _634 = -_548;
        float _636 = -_624;
        float _638 = fma(_634, _472, _636);
        float _640 = fma(_612, _612, _626);
        float _642 = fma(_614, _614, _628);
        float _644 = fma(_630, _630, _632);
        float _646 = _233 * _472;
        float _648 = fma(_638, _638, _640);
        float _650 = _231 * _472;
        float _652 = _263 * _472;
        float _654 = rsqrt(_642);
        float _656 = _265 * _472;
        float _658 = _267 * _472;
        float _660 = fma(_430, _506, _646);
        float _662 = fma(_432, _506, _652);
        float _664 = fma(_434, _506, _656);
        float _666 = fma(_436, _506, _658);
        float _668 = rsqrt(_648);
        float _670 = rsqrt(_644);
        float _672 = fma(_438, _506, _650);
        float _674 = fma(_440, _506, _486);
        float _676 = _616 * _654;
        float _678 = _606 * _654;
        float _680 = _614 * _654;
        float _682 = _638 * _668;
        float _684 = _612 * _668;
        float _686 = _610 * _668;
        float _688 = _618 * _670;
        float _690 = _608 * _670;
        float _692 = _630 * _670;
        _694 = _660;
        _696 = _678;
        _698 = _672;
        _700 = _684;
        _702 = _686;
        _704 = _682;
        _706 = _676;
        _708 = _680;
        _710 = _674;
        _712 = _688;
        _714 = _690;
        _716 = _692;
        _718 = _662;
        _444 = _664;
        _446 = _666;
        _720 = true;
    }
    else
    {
        float _722 = _422 * 2.0;
        float _724 = _426 * _428;
        float _726 = _424 * _428;
        float _728 = _422 * _428;
        float _730 = -_724;
        float _732 = fma(_722, _424, _730);
        float _734 = fma(_722, _424, _724);
        float _736 = fma(_722, _426, _726);
        float _738 = -_726;
        float _740 = fma(_722, _426, _738);
        float _742 = _424 * _424;
        float _744 = _422 * _422;
        float _746 = _424 * 2.0;
        float _748 = _426 * _426;
        float _750 = fma(_742, -2.0, 1.0);
        float _752 = fma(_744, -2.0, 1.0);
        float _754 = -_728;
        float _756 = fma(_746, _426, _754);
        float _758 = fma(_746, _426, _728);
        float _760 = fma(_748, -2.0, _750);
        float _762 = fma(_748, -2.0, _752);
        float _764 = fma(_742, -2.0, _752);
        _694 = _430;
        _696 = _762;
        _698 = _438;
        _700 = _760;
        _702 = _734;
        _704 = _740;
        _706 = _732;
        _708 = _758;
        _710 = _440;
        _712 = _736;
        _714 = _756;
        _716 = _764;
        _718 = _432;
    }
    _720 = false;
    float _766 = _694;
    float _768 = _696;
    float _770 = _698;
    float _772 = _700;
    float _774 = _702;
    float _776 = _704;
    float _778 = _706;
    float _780 = _708;
    float _782 = _710;
    float _784 = _712;
    float _786 = _714;
    float _788 = _716;
    float _790 = _718;
    float _792 = _444;
    float _794 = _446;
    float _796 = _766 * _768;
    bool _798 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _800 = _770 * _772;
    bool _802 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _804 = _770 * _774;
    float _806 = _770 * _776;
    float _808 = _766 * _778;
    float _810 = _766 * _780;
    float _812 = _782 * _784;
    float _814 = _782 * _786;
    float _816 = _782 * _788;
    if (!_802)
    {
        int _818 = _68 * 48;
        int _820 = _818 + 16;
        uint _822 = uint(int(uint(_818) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_822)] = as_type<uint>(_800);
        int _824 = _818 + 4;
        uint _826 = uint(int(uint(_824) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_826)] = as_type<uint>(_808);
        int _828 = _818 + 8;
        uint _830 = uint(int(uint(_828) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_830)] = as_type<uint>(_812);
        int _832 = _818 + 12;
        uint _834 = uint(int(uint(_832) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_834)] = as_type<uint>(_790);
        int _836 = _818 + 32;
        uint _838 = uint(int(uint(_820) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_838)] = as_type<uint>(_804);
        int _840 = _820 + 4;
        uint _842 = uint(int(uint(_840) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_842)] = as_type<uint>(_796);
        int _844 = _820 + 8;
        uint _846 = uint(int(uint(_844) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_846)] = as_type<uint>(_814);
        int _848 = _820 + 12;
        uint _850 = uint(int(uint(_848) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_850)] = as_type<uint>(_792);
        uint _852 = uint(int(uint(_836) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_852)] = as_type<uint>(_806);
        int _854 = _836 + 4;
        uint _856 = uint(int(uint(_854) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_856)] = as_type<uint>(_810);
        int _858 = _836 + 8;
        uint _860 = uint(int(uint(_858) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_860)] = as_type<uint>(_816);
        int _862 = _836 + 12;
        uint _864 = uint(int(uint(_862) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_864)] = as_type<uint>(_794);
    }
    int _866 = _68 * 112;
    bool _868 = !_798;
    float _1186;
    float _1188;
    float _1190;
    float _1192;
    float _1194;
    float _1196;
    float _1198;
    float _1200;
    float _1202;
    float _1204;
    float _1206;
    float _1208;
    if (!_868)
    {
        int _870 = 0;
        float _872 = _800;
        float _874 = _808;
        float _876 = _812;
        float _878 = _790;
        float _880 = _804;
        float _882 = _796;
        float _884 = _814;
        float _886 = _792;
        float _888 = _806;
        float _890 = _810;
        float _892 = _816;
        float _894 = _794;
        bool _896;
        int _944;
        int _954;
        int _964;
        int _974;
        int _984;
        int _994;
        int _1004;
        int _1014;
        int _1024;
        int _1034;
        int _1044;
        int _1054;
        int _1162;
        int _1166;
        int _1168;
        int _1172;
        int _1174;
        int _1176;
        int _1180;
        int _1182;
        int _1184;
        do
        {
            int _898 = _870;
            int _900 = as_type<int>(_872);
            int _902 = as_type<int>(_874);
            int _904 = as_type<int>(_876);
            int _906 = as_type<int>(_878);
            int _908 = as_type<int>(_880);
            int _910 = as_type<int>(_882);
            int _912 = as_type<int>(_884);
            int _914 = as_type<int>(_886);
            int _916 = as_type<int>(_888);
            int _918 = as_type<int>(_890);
            int _920 = as_type<int>(_892);
            int _922 = as_type<int>(_894);
            uint _924 = uint(int(uint(_866) >> uint(2)));
            uint _926 = uint(int(uint(int(_924)) >> uint(2)));
            int _928 = int(_924) & 3;
            float _930 = (*spvDescriptorSet0.cp_c6)._m0[int(_926)][_928];
            bool _932 = _68 != 0;
            int _934 = _898 + 1;
            bool _936 = uint(_934) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _938 = _900;
            int _940 = as_type<int>(_930);
            int _942 = 31;
            int _2821 = _58(_938, _940, _942, _944, gl_SubgroupInvocationID);
            int _946 = _2821;
            int _948 = _902;
            int _950 = as_type<int>(_930);
            int _952 = 31;
            int _2825 = _58(_948, _950, _952, _954, gl_SubgroupInvocationID);
            int _956 = _2825;
            int _958 = _904;
            int _960 = as_type<int>(_930);
            int _962 = 31;
            int _2829 = _58(_958, _960, _962, _964, gl_SubgroupInvocationID);
            int _966 = _2829;
            int _968 = _906;
            int _970 = as_type<int>(_930);
            int _972 = 31;
            int _2833 = _58(_968, _970, _972, _974, gl_SubgroupInvocationID);
            int _976 = _2833;
            int _978 = _908;
            int _980 = as_type<int>(_930);
            int _982 = 31;
            int _2837 = _58(_978, _980, _982, _984, gl_SubgroupInvocationID);
            int _986 = _2837;
            int _988 = _910;
            int _990 = as_type<int>(_930);
            int _992 = 31;
            int _2841 = _58(_988, _990, _992, _994, gl_SubgroupInvocationID);
            int _996 = _2841;
            int _998 = _912;
            int _1000 = as_type<int>(_930);
            int _1002 = 31;
            int _2845 = _58(_998, _1000, _1002, _1004, gl_SubgroupInvocationID);
            int _1006 = _2845;
            int _1008 = _914;
            int _1010 = as_type<int>(_930);
            int _1012 = 31;
            int _2849 = _58(_1008, _1010, _1012, _1014, gl_SubgroupInvocationID);
            int _1016 = _2849;
            int _1018 = _916;
            int _1020 = as_type<int>(_930);
            int _1022 = 31;
            int _2853 = _58(_1018, _1020, _1022, _1024, gl_SubgroupInvocationID);
            int _1026 = _2853;
            int _1028 = _918;
            int _1030 = as_type<int>(_930);
            int _1032 = 31;
            int _2857 = _58(_1028, _1030, _1032, _1034, gl_SubgroupInvocationID);
            int _1036 = _2857;
            int _1038 = _920;
            int _1040 = as_type<int>(_930);
            int _1042 = 31;
            int _2861 = _58(_1038, _1040, _1042, _1044, gl_SubgroupInvocationID);
            int _1046 = _2861;
            int _1048 = _922;
            int _1050 = as_type<int>(_930);
            int _1052 = 31;
            int _2865 = _58(_1048, _1050, _1052, _1054, gl_SubgroupInvocationID);
            int _1056 = _2865;
            bool _1058 = !_932;
            _870 = _934;
            int _1060 = _900;
            int _1062 = _902;
            int _1064 = _904;
            int _1066 = _906;
            int _1068 = _908;
            int _1070 = _910;
            int _1072 = _912;
            int _1074 = _914;
            int _1076 = _916;
            int _1078 = _918;
            int _1080 = _920;
            int _1082 = _922;
            if (!_1058)
            {
                float _1084 = as_type<float>(_956) * _792;
                float _1086 = _804 * as_type<float>(_956);
                float _1088 = _796 * as_type<float>(_956);
                float _1090 = _814 * as_type<float>(_956);
                float _1092 = as_type<float>(_996) * _792;
                float _1094 = _804 * as_type<float>(_996);
                float _1096 = fma(as_type<float>(_946), _790, _1084);
                float _1098 = fma(_800, as_type<float>(_946), _1086);
                float _1100 = fma(_808, as_type<float>(_946), _1088);
                float _1102 = fma(_812, as_type<float>(_946), _1090);
                float _1104 = _796 * as_type<float>(_996);
                float _1106 = _814 * as_type<float>(_996);
                float _1108 = fma(as_type<float>(_986), _790, _1092);
                float _1110 = as_type<float>(_1036) * _792;
                float _1112 = fma(_800, as_type<float>(_986), _1094);
                float _1114 = _796 * as_type<float>(_1036);
                float _1116 = _804 * as_type<float>(_1036);
                float _1118 = fma(_808, as_type<float>(_986), _1104);
                float _1120 = fma(_812, as_type<float>(_986), _1106);
                float _1122 = _814 * as_type<float>(_1036);
                float _1124 = fma(as_type<float>(_1026), _790, _1110);
                float _1126 = fma(_808, as_type<float>(_1026), _1114);
                float _1128 = fma(_800, as_type<float>(_1026), _1116);
                float _1130 = fma(_810, as_type<float>(_966), _1100);
                float _1132 = fma(_816, as_type<float>(_966), _1102);
                float _1134 = fma(_806, as_type<float>(_966), _1098);
                float _1136 = fma(_806, as_type<float>(_1006), _1112);
                float _1138 = fma(_810, as_type<float>(_1006), _1118);
                float _1140 = fma(_816, as_type<float>(_1006), _1120);
                float _1142 = fma(_812, as_type<float>(_1026), _1122);
                float _1144 = fma(as_type<float>(_966), _794, _1096);
                float _1146 = fma(as_type<float>(_1006), _794, _1108);
                float _1148 = fma(as_type<float>(_1046), _794, _1124);
                float _1150 = fma(_810, as_type<float>(_1046), _1126);
                float _1152 = fma(_806, as_type<float>(_1046), _1128);
                float _1154 = fma(_816, as_type<float>(_1046), _1142);
                float _1156 = as_type<float>(_976) + _1144;
                float _1158 = as_type<float>(_1016) + _1146;
                float _1160 = as_type<float>(_1056) + _1148;
                _1060 = as_type<int>(_1134);
                _1062 = as_type<int>(_1130);
                _1064 = as_type<int>(_1132);
                _1066 = as_type<int>(_1156);
                _1068 = as_type<int>(_1136);
                _1070 = as_type<int>(_1138);
                _1072 = as_type<int>(_1140);
                _1074 = as_type<int>(_1158);
                _1076 = as_type<int>(_1152);
                _1078 = as_type<int>(_1150);
                _1080 = as_type<int>(_1154);
                _1082 = as_type<int>(_1160);
            }
            _1162 = _1060;
            int _1164 = _1062;
            _1166 = _1064;
            _1168 = _1066;
            int _1170 = _1068;
            _1172 = _1070;
            _1174 = _1072;
            _1176 = _1074;
            int _1178 = _1076;
            _1180 = _1078;
            _1182 = _1080;
            _1184 = _1082;
            _896 = !_936;
            _872 = as_type<float>(_1162);
            _874 = as_type<float>(_1164);
            _876 = as_type<float>(_1166);
            _878 = as_type<float>(_1168);
            _880 = as_type<float>(_1170);
            _882 = as_type<float>(_1172);
            _884 = as_type<float>(_1174);
            _886 = as_type<float>(_1176);
            _888 = as_type<float>(_1178);
            _890 = as_type<float>(_1180);
            _892 = as_type<float>(_1182);
            _894 = as_type<float>(_1184);
            _1186 = as_type<float>(_1164);
            _1188 = as_type<float>(_1170);
            _1190 = as_type<float>(_1178);
        } while (_896);
        _1192 = as_type<float>(_1172);
        _1194 = as_type<float>(_1180);
        _1196 = as_type<float>(_1162);
        _1198 = as_type<float>(_1166);
        _1200 = as_type<float>(_1174);
        _1202 = as_type<float>(_1182);
        _1204 = as_type<float>(_1176);
        _1206 = as_type<float>(_1184);
        _1208 = as_type<float>(_1168);
        _1210 = true;
    }
    else
    {
        _1186 = _808;
        _1192 = _796;
        _1194 = _810;
        _1196 = _800;
        _1188 = _804;
        _1190 = _806;
        _1198 = _812;
        _1200 = _814;
        _1202 = _816;
        _1204 = _792;
        _1206 = _794;
        _1208 = _790;
    }
    _1210 = false;
    float _1212 = _1186;
    float _1214 = _1192;
    float _1216 = _1194;
    float _1218 = _1196;
    float _1220 = _1188;
    float _1222 = _1190;
    float _1224 = _1198;
    float _1226 = _1200;
    float _1228 = _1202;
    float _1230 = _1204;
    float _1232 = _1206;
    float _1234 = _1208;
    int _1236 = _866 + 80;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    uint _1240 = uint(int(uint(int(_1238)) >> uint(2)));
    int _1242 = int(_1238) & 3;
    float _1244 = (*spvDescriptorSet0.cp_c6)._m0[int(_1240)][_1242];
    int _1246 = int(_1238) + 1;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    int _1250 = _1246 & 3;
    float _1252 = (*spvDescriptorSet0.cp_c6)._m0[int(_1248)][_1250];
    int _1254 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1256 = _1254 + _68;
    int _1258 = _866 + 64;
    uint _1260 = uint(int(uint(_1258) >> uint(2)));
    uint _1262 = uint(int(uint(int(_1260)) >> uint(2)));
    int _1264 = int(_1260) & 3;
    float _1266 = (*spvDescriptorSet0.cp_c6)._m0[int(_1262)][_1264];
    int _1268 = int(_1260) + 1;
    uint _1270 = uint(int(uint(_1268) >> uint(2)));
    int _1272 = _1268 & 3;
    float _1274 = (*spvDescriptorSet0.cp_c6)._m0[int(_1270)][_1272];
    int _1276 = _1256 * 48;
    int _1278 = _866 + 88;
    uint _1280 = uint(int(uint(_1278) >> uint(2)));
    uint _1282 = uint(int(uint(int(_1280)) >> uint(2)));
    int _1284 = int(_1280) & 3;
    float _1286 = (*spvDescriptorSet0.cp_c6)._m0[int(_1282)][_1284];
    int _1288 = int(_1280) + 1;
    uint _1290 = uint(int(uint(_1288) >> uint(2)));
    int _1292 = _1288 & 3;
    float _1294 = (*spvDescriptorSet0.cp_c6)._m0[int(_1290)][_1292];
    int _1296 = _866 + 72;
    uint _1298 = uint(int(uint(_1296) >> uint(2)));
    uint _1300 = uint(int(uint(int(_1298)) >> uint(2)));
    int _1302 = int(_1298) & 3;
    float _1304 = (*spvDescriptorSet0.cp_c6)._m0[int(_1300)][_1302];
    int _1306 = int(_1298) + 1;
    uint _1308 = uint(int(uint(_1306) >> uint(2)));
    int _1310 = _1306 & 3;
    float _1312 = (*spvDescriptorSet0.cp_c6)._m0[int(_1308)][_1310];
    int _1314 = _866 + 96;
    uint _1316 = uint(int(uint(_1314) >> uint(2)));
    uint _1318 = uint(int(uint(int(_1316)) >> uint(2)));
    int _1320 = int(_1316) & 3;
    float _1322 = (*spvDescriptorSet0.cp_c6)._m0[int(_1318)][_1320];
    int _1324 = int(_1316) + 1;
    uint _1326 = uint(int(uint(_1324) >> uint(2)));
    int _1328 = _1324 & 3;
    float _1330 = (*spvDescriptorSet0.cp_c6)._m0[int(_1326)][_1328];
    int _1332 = _866 + 104;
    uint _1334 = uint(int(uint(_1332) >> uint(2)));
    uint _1336 = uint(int(uint(int(_1334)) >> uint(2)));
    int _1338 = int(_1334) & 3;
    float _1340 = (*spvDescriptorSet0.cp_c6)._m0[int(_1336)][_1338];
    int _1342 = int(_1334) + 1;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    int _1346 = _1342 & 3;
    float _1348 = (*spvDescriptorSet0.cp_c6)._m0[int(_1344)][_1346];
    float _1350 = _1212 * _1244;
    float _1352 = _1214 * _1244;
    float _1354 = _1216 * _1244;
    int _1356 = _866 + 16;
    uint _1358 = uint(int(uint(_1356) >> uint(2)));
    uint _1360 = uint(int(uint(int(_1358)) >> uint(2)));
    int _1362 = int(_1358) & 3;
    float _1364 = (*spvDescriptorSet0.cp_c6)._m0[int(_1360)][_1362];
    int _1366 = int(_1358) + 1;
    uint _1368 = uint(int(uint(_1366) >> uint(2)));
    int _1370 = _1366 & 3;
    float _1372 = (*spvDescriptorSet0.cp_c6)._m0[int(_1368)][_1370];
    float _1374 = _1212 * _1252;
    float _1376 = _1216 * _1252;
    float _1378 = fma(_1218, _1266, _1350);
    float _1380 = fma(_1220, _1266, _1352);
    float _1382 = fma(_1222, _1266, _1354);
    float _1384 = _1214 * _1252;
    int _1386 = _866 + 32;
    uint _1388 = uint(int(uint(_1386) >> uint(2)));
    uint _1390 = uint(int(uint(int(_1388)) >> uint(2)));
    int _1392 = int(_1388) & 3;
    float _1394 = (*spvDescriptorSet0.cp_c6)._m0[int(_1390)][_1392];
    int _1396 = int(_1388) + 1;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    int _1400 = _1396 & 3;
    float _1402 = (*spvDescriptorSet0.cp_c6)._m0[int(_1398)][_1400];
    float _1404 = fma(_1218, _1274, _1374);
    float _1406 = fma(_1222, _1274, _1376);
    float _1408 = fma(_1220, _1274, _1384);
    float _1410 = _1212 * _1286;
    float _1412 = _1214 * _1286;
    float _1414 = _1212 * _1294;
    float _1416 = _1214 * _1294;
    int _1418 = _866 + 48;
    uint _1420 = uint(int(uint(_1418) >> uint(2)));
    uint _1422 = uint(int(uint(int(_1420)) >> uint(2)));
    int _1424 = int(_1420) & 3;
    float _1426 = (*spvDescriptorSet0.cp_c6)._m0[int(_1422)][_1424];
    int _1428 = int(_1420) + 1;
    uint _1430 = uint(int(uint(_1428) >> uint(2)));
    int _1432 = _1428 & 3;
    float _1434 = (*spvDescriptorSet0.cp_c6)._m0[int(_1430)][_1432];
    float _1436 = _1216 * _1286;
    float _1438 = _1216 * _1294;
    float _1440 = fma(_1218, _1304, _1410);
    float _1442 = fma(_1220, _1304, _1412);
    float _1444 = fma(_1218, _1312, _1414);
    float _1446 = fma(_1220, _1312, _1416);
    int _1448 = _866 + 24;
    uint _1450 = uint(int(uint(_1448) >> uint(2)));
    uint _1452 = uint(int(uint(int(_1450)) >> uint(2)));
    int _1454 = int(_1450) & 3;
    float _1456 = (*spvDescriptorSet0.cp_c6)._m0[int(_1452)][_1454];
    int _1458 = int(_1450) + 1;
    uint _1460 = uint(int(uint(_1458) >> uint(2)));
    int _1462 = _1458 & 3;
    float _1464 = (*spvDescriptorSet0.cp_c6)._m0[int(_1460)][_1462];
    float _1466 = fma(_1222, _1304, _1436);
    float _1468 = fma(_1222, _1312, _1438);
    float _1470 = fma(_1224, _1322, _1378);
    float _1472 = fma(_1224, _1330, _1404);
    float _1474 = fma(_1226, _1322, _1380);
    float _1476 = fma(_1226, _1330, _1408);
    int _1478 = _866 + 40;
    uint _1480 = uint(int(uint(_1478) >> uint(2)));
    uint _1482 = uint(int(uint(int(_1480)) >> uint(2)));
    int _1484 = int(_1480) & 3;
    float _1486 = (*spvDescriptorSet0.cp_c6)._m0[int(_1482)][_1484];
    int _1488 = int(_1480) + 1;
    uint _1490 = uint(int(uint(_1488) >> uint(2)));
    int _1492 = _1488 & 3;
    float _1494 = (*spvDescriptorSet0.cp_c6)._m0[int(_1490)][_1492];
    float _1496 = fma(_1228, _1322, _1382);
    float _1498 = fma(_1228, _1330, _1406);
    float _1500 = fma(_1224, _1340, _1440);
    float _1502 = fma(_1226, _1348, _1446);
    float _1504 = fma(_1224, _1348, _1444);
    float _1506 = fma(_1228, _1348, _1468);
    int _1508 = _866 + 56;
    uint _1510 = uint(int(uint(_1508) >> uint(2)));
    uint _1512 = uint(int(uint(int(_1510)) >> uint(2)));
    int _1514 = int(_1510) & 3;
    float _1516 = (*spvDescriptorSet0.cp_c6)._m0[int(_1512)][_1514];
    int _1518 = int(_1510) + 1;
    uint _1520 = uint(int(uint(_1518) >> uint(2)));
    int _1522 = _1518 & 3;
    float _1524 = (*spvDescriptorSet0.cp_c6)._m0[int(_1520)][_1522];
    float _1526 = fma(_1226, _1340, _1442);
    float _1528 = _1502 + _1230;
    float _1530 = fma(_1228, _1340, _1466);
    float _1532 = _1506 + _1232;
    float _1534 = _1504 + _1234;
    float _1536 = _1474 * _1372;
    float _1538 = _1476 * _1372;
    float _1540 = _1526 * _1372;
    float _1542 = _1528 * _1372;
    float _1544 = fma(_1470, _1364, _1536);
    float _1546 = fma(_1472, _1364, _1538);
    float _1548 = fma(_1500, _1364, _1540);
    float _1550 = fma(_1534, _1364, _1542);
    float _1552 = _1528 * _1402;
    float _1554 = _1474 * _1402;
    float _1556 = _1476 * _1402;
    float _1558 = _1526 * _1402;
    float _1560 = fma(_1534, _1394, _1552);
    float _1562 = fma(_1470, _1394, _1554);
    float _1564 = fma(_1472, _1394, _1556);
    float _1566 = fma(_1500, _1394, _1558);
    float _1568 = _1528 * _1434;
    float _1570 = _1474 * _1434;
    float _1572 = _1476 * _1434;
    float _1574 = _1526 * _1434;
    float _1576 = fma(_1534, _1426, _1568);
    float _1578 = fma(_1470, _1426, _1570);
    float _1580 = fma(_1472, _1426, _1572);
    float _1582 = fma(_1500, _1426, _1574);
    float _1584 = fma(_1532, _1456, _1550);
    float _1586 = fma(_1496, _1456, _1544);
    float _1588 = fma(_1498, _1456, _1546);
    float _1590 = fma(_1530, _1456, _1548);
    float _1592 = _1584 + _1464;
    int _1594 = _1276 + 32;
    float _1596 = fma(_1532, _1486, _1560);
    float _1598 = fma(_1496, _1486, _1562);
    float _1600 = fma(_1498, _1486, _1564);
    int _1602 = _1276 + 16;
    float _1604 = fma(_1530, _1486, _1566);
    float _1606 = _1596 + _1494;
    int _1608 = _1276 + 48;
    float _1610 = fma(_1532, _1516, _1576);
    float _1612 = fma(_1496, _1516, _1578);
    float _1614 = fma(_1498, _1516, _1580);
    float _1616 = fma(_1530, _1516, _1582);
    float _1618 = _1610 + _1524;
    uint _1620 = uint(int(uint(_1602) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1620)] = as_type<uint>(_1586);
    int _1622 = _1602 + 4;
    uint _1624 = uint(int(uint(_1622) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1624)] = as_type<uint>(_1588);
    int _1626 = _1602 + 8;
    uint _1628 = uint(int(uint(_1626) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1628)] = as_type<uint>(_1590);
    int _1630 = _1602 + 12;
    uint _1632 = uint(int(uint(_1630) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1632)] = as_type<uint>(_1592);
    uint _1634 = uint(int(uint(_1594) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1634)] = as_type<uint>(_1598);
    int _1636 = _1594 + 4;
    uint _1638 = uint(int(uint(_1636) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1638)] = as_type<uint>(_1600);
    int _1640 = _1594 + 8;
    uint _1642 = uint(int(uint(_1640) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1642)] = as_type<uint>(_1604);
    int _1644 = _1594 + 12;
    uint _1646 = uint(int(uint(_1644) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1646)] = as_type<uint>(_1606);
    uint _1648 = uint(int(uint(_1608) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1648)] = as_type<uint>(_1612);
    int _1650 = _1608 + 4;
    uint _1652 = uint(int(uint(_1650) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1652)] = as_type<uint>(_1614);
    int _1654 = _1608 + 8;
    uint _1656 = uint(int(uint(_1654) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1656)] = as_type<uint>(_1616);
    int _1658 = _1608 + 12;
    uint _1660 = uint(int(uint(_1658) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1660)] = as_type<uint>(_1618);
}

