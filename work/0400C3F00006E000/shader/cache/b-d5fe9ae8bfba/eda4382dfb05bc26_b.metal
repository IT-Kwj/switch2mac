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
int _56(thread const int& _3939, thread const int& _3940, constant _10& support_buffer)
{
    int _3943 = 1 + _3940;
    float _3945 = support_buffer._m5[_3943].x;
    bool _3947 = _3945 == 1.0;
    if (_3947)
    {
        return _3939;
    }
    float _3949 = float(_3939);
    float _3951 = _3949 * _3945;
    int _3953 = int(_3951);
    return _3953;
}

static inline __attribute__((always_inline))
int _58(thread const int& _3974, thread const int& _3975, thread const int& _3976, thread int& _3977, thread uint& gl_SubgroupInvocationID)
{
    int _3980 = _3976 & 31;
    uint _3982 = uint(int(uint(_3976) >> uint(8)));
    int _3984 = int(_3982) & 31;
    float _3986 = as_type<float>(gl_SubgroupInvocationID);
    int _3988 = as_type<int>(_3986) & _3984;
    int _3990 = ~_3984;
    int _3992 = _3980 & _3990;
    int _3994 = _3992 | _3988;
    int _3996 = ~_3984;
    int _3998 = _3975 & _3996;
    int _4000 = _3998 | _3988;
    bool _4002 = uint(_4000) <= uint(_3994);
    _3977 = _4002 ? (-1) : 0;
    float _4004 = spvSubgroupShuffle(as_type<float>(_3974), uint(_4000));
    uint _4006 = uint(_4002 ? as_type<int>(_4004) : _3974);
    return int(_4006);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
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
    float _151 = 0.0;
    if (_125)
    {
        _151 = 2.8025969286496341418474591665798e-45;
    }
    float _153 = _151;
    int _155 = 0;
    if (_129)
    {
        uint _157 = uint(int(uint(_101) >> uint(2)));
        uint _159 = uint(int(uint(int(_157)) >> uint(2)));
        int _161 = int(_157) & 3;
        float _163 = (*spvDescriptorSet0.cp_c5)._m0[int(_159)][_161];
        _155 = as_type<int>(_163);
    }
    int _165 = _155;
    if (_129)
    {
        _133 = 1.4012984643248170709237295832899e-45;
    }
    float _167 = _133;
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
        int3 _1860 = int3(_181, _187, as_type<int>(_149));
        float3 _191 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1860.xy), uint(_1860.z), 0).xyz;
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
        int3 _1888 = int3(_215, _221, 0);
        float3 _223 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1888.xy), uint(_1888.z), 0).xyz;
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
        int3 _1919 = int3(_247, _253, as_type<int>(_153));
        float3 _255 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_1919.xy), uint(_1919.z), 0).xyz;
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
        int _281 = _165;
        int _283 = 1;
        int _285 = _56(_281, _283, (*spvDescriptorSet0.support_buffer));
        int3 _1947 = int3(_279, _285, 0);
        float3 _287 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1947.xy), uint(_1947.z), 0).xyz;
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
        int _315 = _165;
        int _317 = 1;
        int _319 = _56(_315, _317, (*spvDescriptorSet0.support_buffer));
        int3 _1975 = int3(_313, _319, as_type<int>(_167));
        float4 _322 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1975.xy), uint(_1975.z), 0).xyzw;
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
    if (!_129)
    {
        _340 = 0.0;
        _342 = 0.0;
    }
    float _344 = _340;
    float _346 = _342;
    float _348 = 0.0;
    float _350 = _344;
    float _352 = _346;
    if (!_129)
    {
        _348 = 0.0;
    }
    float _354 = _348;
    float _356 = 0.0;
    float _358 = 0.0;
    float _360 = _354;
    if (!_129)
    {
        _356 = 0.0;
        _358 = 0.0;
    }
    float _362 = _356;
    float _364 = _358;
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
        int _406 = _165;
        int _408 = 1;
        int _410 = _56(_406, _408, (*spvDescriptorSet0.support_buffer));
        int3 _2056 = int3(_404, _410, 2);
        float3 _412 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2056.xy), uint(_2056.z), 0).xyz;
        float _414 = _412.x;
        float _416 = _412.y;
        float _418 = _412.z;
        float _420 = _338 * 2.0;
        _376 = _332;
        _392 = _334;
        _368 = _336;
        _398 = _420;
        _370 = _418;
        _350 = _295;
        _360 = _299;
        _352 = _297;
        _384 = _414;
        _386 = _416;
    }
    float _422 = _376;
    float _424 = _392;
    float _426 = _368;
    float _428 = _398;
    float _430 = _370;
    float _432 = _350;
    float _434 = _360;
    float _436 = _352;
    float _438 = _384;
    float _440 = _386;
    bool _442 = !_125;
    float _444 = _432;
    float _446 = _430;
    float _448 = _440;
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
        float _450 = _422 * 0.15915493667125701904296875;
        float _452 = _424 * 0.15915493667125701904296875;
        float _454 = _426 * 0.15915493667125701904296875;
        float _456 = _201 * 0.15915493667125701904296875;
        float _458 = _450 * 6.283185482025146484375;
        float _460 = cos(_458);
        float _462 = _203 * 0.15915493667125701904296875;
        float _464 = _199 * 0.15915493667125701904296875;
        int _466 = _101 + 28;
        uint _468 = uint(int(uint(_466) >> uint(2)));
        uint _470 = uint(int(uint(int(_468)) >> uint(2)));
        int _472 = int(_468) & 3;
        float _474 = (*spvDescriptorSet0.cp_c5)._m0[int(_470)][_472];
        float _476 = _452 * 6.283185482025146484375;
        float _478 = cos(_476);
        float _480 = _454 * 6.283185482025146484375;
        float _482 = sin(_480);
        float _484 = _454 * 6.283185482025146484375;
        float _486 = cos(_484);
        float _488 = _235 * _474;
        float _490 = _267 * _474;
        float _492 = _231 * _474;
        float _494 = _233 * _474;
        float _496 = _450 * 6.283185482025146484375;
        float _498 = sin(_496);
        float _500 = _482 * _478;
        float _502 = _452 * 6.283185482025146484375;
        float _504 = sin(_502);
        int _506 = _101 + 20;
        uint _508 = uint(int(uint(_506) >> uint(2)));
        uint _510 = uint(int(uint(int(_508)) >> uint(2)));
        int _512 = int(_508) & 3;
        float _514 = (*spvDescriptorSet0.cp_c5)._m0[int(_510)][_512];
        float _516 = _460 * _486;
        float _518 = _478 * _486;
        float _520 = _456 * 6.283185482025146484375;
        float _522 = cos(_520);
        float _524 = _482 * _460;
        float _526 = _498 * _486;
        float _528 = _462 * 6.283185482025146484375;
        float _530 = sin(_528);
        float _532 = _498 * _504;
        float _534 = -_526;
        float _536 = fma(_504, _524, _534);
        float _538 = -_524;
        float _540 = fma(_486, _532, _538);
        float _542 = _462 * 6.283185482025146484375;
        float _544 = cos(_542);
        float _546 = fma(_430, _514, _490);
        float _548 = fma(_432, _514, _492);
        float _550 = _464 * 6.283185482025146484375;
        float _552 = cos(_550);
        float _554 = _464 * 6.283185482025146484375;
        float _556 = sin(_554);
        float _558 = _456 * 6.283185482025146484375;
        float _560 = sin(_558);
        float _562 = _552 * _522;
        float _564 = _530 * _552;
        float _566 = _562 * _474;
        float _568 = _556 * _522;
        float _570 = _460 * _478;
        float _572 = _498 * _482;
        float _574 = _498 * _478;
        float _576 = fma(_482, _532, _516);
        float _578 = _522 * _544;
        float _580 = fma(_504, _516, _572);
        float _582 = _530 * _522;
        float _584 = _552 * _544;
        float _586 = _556 * _560;
        float _588 = _556 * _544;
        float _590 = _556 * _530;
        float _592 = _578 * _474;
        float _594 = fma(_530, _586, _584);
        float _596 = -_588;
        float _598 = fma(_560, _564, _596);
        float _600 = -_564;
        float _602 = fma(_544, _586, _600);
        float _604 = _582 * _474;
        float _606 = fma(_560, _584, _590);
        float _608 = _594 * _474;
        float _610 = _598 * _474;
        float _612 = _568 * _474;
        float _614 = fma(_500, _514, _604);
        float _616 = _602 * _474;
        float _618 = _606 * _474;
        float _620 = fma(_576, _514, _608);
        float _622 = fma(_536, _514, _610);
        float _624 = fma(_518, _514, _592);
        float _626 = _504 * _514;
        float _628 = fma(_574, _514, _612);
        float _630 = _614 * _614;
        float _632 = fma(_540, _514, _616);
        float _634 = fma(_580, _514, _618);
        float _636 = _620 * _620;
        float _638 = _622 * _622;
        float _640 = -_560;
        float _642 = -_626;
        float _644 = fma(_640, _474, _642);
        float _646 = fma(_624, _624, _630);
        float _648 = fma(_632, _632, _636);
        float _650 = fma(_570, _514, _566);
        float _652 = fma(_634, _634, _638);
        float _654 = fma(_644, _644, _646);
        float _656 = fma(_628, _628, _648);
        float _658 = _263 * _474;
        float _660 = fma(_650, _650, _652);
        float _662 = _265 * _474;
        float _664 = fma(_434, _514, _488);
        float _666 = rsqrt(_654);
        float _668 = fma(_436, _514, _494);
        float _670 = fma(_438, _514, _658);
        float _672 = fma(_440, _514, _662);
        float _674 = rsqrt(_656);
        float _676 = rsqrt(_660);
        float _678 = _644 * _666;
        float _680 = _624 * _666;
        float _682 = _614 * _666;
        float _684 = _632 * _674;
        float _686 = _620 * _674;
        float _688 = _628 * _674;
        float _690 = _634 * _676;
        float _692 = _622 * _676;
        float _694 = _650 * _676;
        _444 = _548;
        _696 = _680;
        _698 = _682;
        _700 = _678;
        _702 = _664;
        _704 = _692;
        _706 = _668;
        _708 = _684;
        _710 = _686;
        _712 = _688;
        _714 = _690;
        _716 = _694;
        _446 = _546;
        _448 = _672;
        _718 = _670;
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
        _696 = _760;
        _698 = _734;
        _700 = _740;
        _702 = _434;
        _704 = _756;
        _706 = _436;
        _708 = _732;
        _710 = _762;
        _712 = _758;
        _714 = _736;
        _716 = _764;
        _718 = _438;
    }
    _720 = false;
    float _766 = _444;
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
    float _790 = _446;
    float _792 = _448;
    float _794 = _718;
    bool _796 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _798 = _766 * _768;
    float _800 = _766 * _770;
    float _802 = _766 * _772;
    float _804 = _774 * _776;
    float _806 = _778 * _780;
    float _808 = _778 * _782;
    float _810 = _778 * _784;
    float _812 = _774 * _786;
    float _814 = _774 * _788;
    int _816 = _68 * 112;
    bool _818 = !_796;
    float _820 = _798;
    float _822 = _806;
    float _824 = _812;
    float _826 = _794;
    float _828 = _800;
    float _830 = _808;
    float _832 = _804;
    float _834 = _792;
    float _836 = _802;
    float _838 = _810;
    float _840 = _814;
    float _842 = _790;
    if (!_818)
    {
        int _844 = 0;
        float _846 = _798;
        float _848 = _806;
        float _850 = _812;
        float _852 = _794;
        float _854 = _800;
        float _856 = _808;
        float _858 = _804;
        float _860 = _792;
        float _862 = _802;
        float _864 = _810;
        float _866 = _814;
        float _868 = _790;
        bool _870;
        int _918;
        int _928;
        int _938;
        int _948;
        int _958;
        int _968;
        int _978;
        int _988;
        int _998;
        int _1008;
        int _1018;
        int _1028;
        float _1136;
        float _1138;
        float _1140;
        int _1142;
        float _1144;
        int _1146;
        int _1148;
        int _1150;
        int _1152;
        float _1154;
        float _1156;
        float _1158;
        do
        {
            int _872 = _844;
            float _874 = _846;
            float _876 = _848;
            float _878 = _850;
            int _880 = as_type<int>(_852);
            float _882 = _854;
            int _884 = as_type<int>(_856);
            int _886 = as_type<int>(_858);
            int _888 = as_type<int>(_860);
            int _890 = as_type<int>(_862);
            float _892 = _864;
            float _894 = _866;
            float _896 = _868;
            uint _898 = uint(int(uint(_816) >> uint(2)));
            uint _900 = uint(int(uint(int(_898)) >> uint(2)));
            int _902 = int(_898) & 3;
            float _904 = (*spvDescriptorSet0.cp_c6)._m0[int(_900)][_902];
            bool _906 = _68 != 0;
            int _908 = _872 + 1;
            bool _910 = uint(_908) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _912 = as_type<int>(_874);
            int _914 = as_type<int>(_904);
            int _916 = 31;
            int _2690 = _58(_912, _914, _916, _918, gl_SubgroupInvocationID);
            int _920 = _2690;
            int _922 = as_type<int>(_876);
            int _924 = as_type<int>(_904);
            int _926 = 31;
            int _2695 = _58(_922, _924, _926, _928, gl_SubgroupInvocationID);
            int _930 = _2695;
            int _932 = as_type<int>(_878);
            int _934 = as_type<int>(_904);
            int _936 = 31;
            int _2700 = _58(_932, _934, _936, _938, gl_SubgroupInvocationID);
            int _940 = _2700;
            int _942 = _880;
            int _944 = as_type<int>(_904);
            int _946 = 31;
            int _2704 = _58(_942, _944, _946, _948, gl_SubgroupInvocationID);
            int _950 = _2704;
            int _952 = as_type<int>(_882);
            int _954 = as_type<int>(_904);
            int _956 = 31;
            int _2709 = _58(_952, _954, _956, _958, gl_SubgroupInvocationID);
            int _960 = _2709;
            int _962 = _884;
            int _964 = as_type<int>(_904);
            int _966 = 31;
            int _2713 = _58(_962, _964, _966, _968, gl_SubgroupInvocationID);
            int _970 = _2713;
            int _972 = _886;
            int _974 = as_type<int>(_904);
            int _976 = 31;
            int _2717 = _58(_972, _974, _976, _978, gl_SubgroupInvocationID);
            int _980 = _2717;
            int _982 = _888;
            int _984 = as_type<int>(_904);
            int _986 = 31;
            int _2721 = _58(_982, _984, _986, _988, gl_SubgroupInvocationID);
            int _990 = _2721;
            int _992 = _890;
            int _994 = as_type<int>(_904);
            int _996 = 31;
            int _2725 = _58(_992, _994, _996, _998, gl_SubgroupInvocationID);
            int _1000 = _2725;
            int _1002 = as_type<int>(_892);
            int _1004 = as_type<int>(_904);
            int _1006 = 31;
            int _2730 = _58(_1002, _1004, _1006, _1008, gl_SubgroupInvocationID);
            int _1010 = _2730;
            int _1012 = as_type<int>(_894);
            int _1014 = as_type<int>(_904);
            int _1016 = 31;
            int _2735 = _58(_1012, _1014, _1016, _1018, gl_SubgroupInvocationID);
            int _1020 = _2735;
            int _1022 = as_type<int>(_896);
            int _1024 = as_type<int>(_904);
            int _1026 = 31;
            int _2740 = _58(_1022, _1024, _1026, _1028, gl_SubgroupInvocationID);
            int _1030 = _2740;
            bool _1032 = !_906;
            _844 = _908;
            float _1034 = _874;
            float _1036 = _876;
            float _1038 = _878;
            int _1040 = _880;
            float _1042 = _882;
            int _1044 = _884;
            int _1046 = _886;
            int _1048 = _888;
            int _1050 = _890;
            float _1052 = _892;
            float _1054 = _894;
            float _1056 = _896;
            if (!_1032)
            {
                float _1058 = as_type<float>(_930) * _792;
                float _1060 = _800 * as_type<float>(_930);
                float _1062 = _808 * as_type<float>(_930);
                float _1064 = _804 * as_type<float>(_930);
                float _1066 = fma(as_type<float>(_920), _794, _1058);
                float _1068 = _800 * as_type<float>(_970);
                float _1070 = _808 * as_type<float>(_970);
                float _1072 = _804 * as_type<float>(_970);
                float _1074 = as_type<float>(_970) * _792;
                float _1076 = fma(_798, as_type<float>(_920), _1060);
                float _1078 = fma(_806, as_type<float>(_920), _1062);
                float _1080 = fma(_812, as_type<float>(_920), _1064);
                float _1082 = fma(_798, as_type<float>(_960), _1068);
                float _1084 = fma(_806, as_type<float>(_960), _1070);
                float _1086 = fma(_812, as_type<float>(_960), _1072);
                float _1088 = _800 * as_type<float>(_1010);
                float _1090 = as_type<float>(_1010) * _792;
                float _1092 = fma(as_type<float>(_960), _794, _1074);
                float _1094 = _804 * as_type<float>(_1010);
                float _1096 = _808 * as_type<float>(_1010);
                float _1098 = fma(_798, as_type<float>(_1000), _1088);
                float _1100 = fma(as_type<float>(_1000), _794, _1090);
                float _1102 = fma(_812, as_type<float>(_1000), _1094);
                float _1104 = fma(_814, as_type<float>(_940), _1080);
                float _1106 = fma(_806, as_type<float>(_1000), _1096);
                float _1108 = fma(_802, as_type<float>(_940), _1076);
                float _1110 = fma(_810, as_type<float>(_940), _1078);
                float _1112 = fma(_810, as_type<float>(_980), _1084);
                float _1114 = fma(as_type<float>(_940), _790, _1066);
                float _1116 = fma(_802, as_type<float>(_980), _1082);
                float _1118 = fma(_814, as_type<float>(_980), _1086);
                float _1120 = fma(as_type<float>(_980), _790, _1092);
                float _1122 = fma(as_type<float>(_1020), _790, _1100);
                float _1124 = fma(_810, as_type<float>(_1020), _1106);
                float _1126 = fma(_802, as_type<float>(_1020), _1098);
                float _1128 = fma(_814, as_type<float>(_1020), _1102);
                float _1130 = as_type<float>(_950) + _1114;
                float _1132 = as_type<float>(_990) + _1120;
                float _1134 = as_type<float>(_1030) + _1122;
                _1034 = _1108;
                _1036 = _1110;
                _1038 = _1104;
                _1040 = as_type<int>(_1130);
                _1042 = _1116;
                _1044 = as_type<int>(_1112);
                _1046 = as_type<int>(_1118);
                _1048 = as_type<int>(_1132);
                _1050 = as_type<int>(_1126);
                _1052 = _1124;
                _1054 = _1128;
                _1056 = _1134;
            }
            _1136 = _1034;
            _1138 = _1036;
            _1140 = _1038;
            _1142 = _1040;
            _1144 = _1042;
            _1146 = _1044;
            _1148 = _1046;
            _1150 = _1048;
            _1152 = _1050;
            _1154 = _1052;
            _1156 = _1054;
            _1158 = _1056;
            _870 = !_910;
            _846 = _1136;
            _848 = _1138;
            _850 = _1140;
            _852 = as_type<float>(_1142);
            _854 = _1144;
            _856 = as_type<float>(_1146);
            _858 = as_type<float>(_1148);
            _860 = as_type<float>(_1150);
            _862 = as_type<float>(_1152);
            _864 = _1154;
            _866 = _1156;
            _868 = _1158;
        } while (_870);
        _820 = _1136;
        _822 = _1138;
        _824 = _1140;
        _826 = as_type<float>(_1142);
        _828 = _1144;
        _830 = as_type<float>(_1146);
        _832 = as_type<float>(_1148);
        _834 = as_type<float>(_1150);
        _836 = as_type<float>(_1152);
        _838 = _1154;
        _840 = _1156;
        _842 = _1158;
    }
    float _1160 = _820;
    float _1162 = _822;
    float _1164 = _824;
    float _1166 = _826;
    float _1168 = _828;
    float _1170 = _830;
    float _1172 = _832;
    float _1174 = _834;
    float _1176 = _836;
    float _1178 = _838;
    float _1180 = _840;
    float _1182 = _842;
    int _1184 = _816 + 80;
    uint _1186 = uint(int(uint(_1184) >> uint(2)));
    uint _1188 = uint(int(uint(int(_1186)) >> uint(2)));
    int _1190 = int(_1186) & 3;
    float _1192 = (*spvDescriptorSet0.cp_c6)._m0[int(_1188)][_1190];
    int _1194 = int(_1186) + 1;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    int _1198 = _1194 & 3;
    float _1200 = (*spvDescriptorSet0.cp_c6)._m0[int(_1196)][_1198];
    bool _1202 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1204 = _816 + 64;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    uint _1208 = uint(int(uint(int(_1206)) >> uint(2)));
    int _1210 = int(_1206) & 3;
    float _1212 = (*spvDescriptorSet0.cp_c6)._m0[int(_1208)][_1210];
    int _1214 = int(_1206) + 1;
    uint _1216 = uint(int(uint(_1214) >> uint(2)));
    int _1218 = _1214 & 3;
    float _1220 = (*spvDescriptorSet0.cp_c6)._m0[int(_1216)][_1218];
    int _1222 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1224 = _1222 + _68;
    int _1226 = _816 + 88;
    uint _1228 = uint(int(uint(_1226) >> uint(2)));
    uint _1230 = uint(int(uint(int(_1228)) >> uint(2)));
    int _1232 = int(_1228) & 3;
    float _1234 = (*spvDescriptorSet0.cp_c6)._m0[int(_1230)][_1232];
    int _1236 = int(_1228) + 1;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    int _1240 = _1236 & 3;
    float _1242 = (*spvDescriptorSet0.cp_c6)._m0[int(_1238)][_1240];
    int _1244 = _816 + 72;
    uint _1246 = uint(int(uint(_1244) >> uint(2)));
    uint _1248 = uint(int(uint(int(_1246)) >> uint(2)));
    int _1250 = int(_1246) & 3;
    float _1252 = (*spvDescriptorSet0.cp_c6)._m0[int(_1248)][_1250];
    int _1254 = int(_1246) + 1;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    int _1258 = _1254 & 3;
    float _1260 = (*spvDescriptorSet0.cp_c6)._m0[int(_1256)][_1258];
    int _1262 = _816 + 96;
    uint _1264 = uint(int(uint(_1262) >> uint(2)));
    uint _1266 = uint(int(uint(int(_1264)) >> uint(2)));
    int _1268 = int(_1264) & 3;
    float _1270 = (*spvDescriptorSet0.cp_c6)._m0[int(_1266)][_1268];
    int _1272 = int(_1264) + 1;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    int _1276 = _1272 & 3;
    float _1278 = (*spvDescriptorSet0.cp_c6)._m0[int(_1274)][_1276];
    int _1280 = _816 + 104;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    uint _1284 = uint(int(uint(int(_1282)) >> uint(2)));
    int _1286 = int(_1282) & 3;
    float _1288 = (*spvDescriptorSet0.cp_c6)._m0[int(_1284)][_1286];
    int _1290 = int(_1282) + 1;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    int _1294 = _1290 & 3;
    float _1296 = (*spvDescriptorSet0.cp_c6)._m0[int(_1292)][_1294];
    int _1298 = _816 + 16;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    uint _1302 = uint(int(uint(int(_1300)) >> uint(2)));
    int _1304 = int(_1300) & 3;
    float _1306 = (*spvDescriptorSet0.cp_c6)._m0[int(_1302)][_1304];
    int _1308 = int(_1300) + 1;
    uint _1310 = uint(int(uint(_1308) >> uint(2)));
    int _1312 = _1308 & 3;
    float _1314 = (*spvDescriptorSet0.cp_c6)._m0[int(_1310)][_1312];
    if (!_1202)
    {
        int _1316 = _68 * 48;
        int _1318 = _1316 + 16;
        uint _1320 = uint(int(uint(_1316) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1320)] = as_type<uint>(_1160);
        int _1322 = _1316 + 4;
        uint _1324 = uint(int(uint(_1322) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1324)] = as_type<uint>(_1162);
        int _1326 = _1316 + 8;
        uint _1328 = uint(int(uint(_1326) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1328)] = as_type<uint>(_1164);
        int _1330 = _1316 + 12;
        uint _1332 = uint(int(uint(_1330) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1332)] = as_type<uint>(_1166);
        int _1334 = _1316 + 32;
        uint _1336 = uint(int(uint(_1318) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1336)] = as_type<uint>(_1168);
        int _1338 = _1318 + 4;
        uint _1340 = uint(int(uint(_1338) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1340)] = as_type<uint>(_1170);
        int _1342 = _1318 + 8;
        uint _1344 = uint(int(uint(_1342) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1344)] = as_type<uint>(_1172);
        int _1346 = _1318 + 12;
        uint _1348 = uint(int(uint(_1346) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1348)] = as_type<uint>(_1174);
        uint _1350 = uint(int(uint(_1334) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1350)] = as_type<uint>(_1176);
        int _1352 = _1334 + 4;
        uint _1354 = uint(int(uint(_1352) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1354)] = as_type<uint>(_1178);
        int _1356 = _1334 + 8;
        uint _1358 = uint(int(uint(_1356) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1358)] = as_type<uint>(_1180);
        int _1360 = _1334 + 12;
        uint _1362 = uint(int(uint(_1360) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1362)] = as_type<uint>(_1182);
    }
    float _1364 = _1178 * _1192;
    float _1366 = _1162 * _1192;
    float _1368 = _1170 * _1192;
    int _1370 = _816 + 32;
    uint _1372 = uint(int(uint(_1370) >> uint(2)));
    uint _1374 = uint(int(uint(int(_1372)) >> uint(2)));
    int _1376 = int(_1372) & 3;
    float _1378 = (*spvDescriptorSet0.cp_c6)._m0[int(_1374)][_1376];
    int _1380 = int(_1372) + 1;
    uint _1382 = uint(int(uint(_1380) >> uint(2)));
    int _1384 = _1380 & 3;
    float _1386 = (*spvDescriptorSet0.cp_c6)._m0[int(_1382)][_1384];
    float _1388 = fma(_1176, _1212, _1364);
    float _1390 = _1162 * _1200;
    float _1392 = fma(_1160, _1212, _1366);
    float _1394 = fma(_1168, _1212, _1368);
    float _1396 = _1170 * _1200;
    float _1398 = fma(_1160, _1220, _1390);
    float _1400 = _1162 * _1234;
    float _1402 = _1162 * _1242;
    float _1404 = _1178 * _1200;
    int _1406 = _816 + 48;
    uint _1408 = uint(int(uint(_1406) >> uint(2)));
    uint _1410 = uint(int(uint(int(_1408)) >> uint(2)));
    int _1412 = int(_1408) & 3;
    float _1414 = (*spvDescriptorSet0.cp_c6)._m0[int(_1410)][_1412];
    int _1416 = int(_1408) + 1;
    uint _1418 = uint(int(uint(_1416) >> uint(2)));
    int _1420 = _1416 & 3;
    float _1422 = (*spvDescriptorSet0.cp_c6)._m0[int(_1418)][_1420];
    float _1424 = _1170 * _1234;
    float _1426 = _1170 * _1242;
    float _1428 = fma(_1168, _1220, _1396);
    float _1430 = fma(_1176, _1220, _1404);
    float _1432 = _1178 * _1234;
    float _1434 = _1178 * _1242;
    float _1436 = fma(_1160, _1252, _1400);
    float _1438 = fma(_1160, _1260, _1402);
    float _1440 = fma(_1168, _1252, _1424);
    int _1442 = _816 + 24;
    uint _1444 = uint(int(uint(_1442) >> uint(2)));
    uint _1446 = uint(int(uint(int(_1444)) >> uint(2)));
    int _1448 = int(_1444) & 3;
    float _1450 = (*spvDescriptorSet0.cp_c6)._m0[int(_1446)][_1448];
    int _1452 = int(_1444) + 1;
    uint _1454 = uint(int(uint(_1452) >> uint(2)));
    int _1456 = _1452 & 3;
    float _1458 = (*spvDescriptorSet0.cp_c6)._m0[int(_1454)][_1456];
    float _1460 = fma(_1168, _1260, _1426);
    float _1462 = fma(_1176, _1260, _1434);
    float _1464 = fma(_1176, _1252, _1432);
    float _1466 = fma(_1164, _1270, _1392);
    float _1468 = fma(_1172, _1296, _1460);
    float _1470 = fma(_1172, _1270, _1394);
    float _1472 = fma(_1180, _1270, _1388);
    int _1474 = _816 + 40;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    uint _1478 = uint(int(uint(int(_1476)) >> uint(2)));
    int _1480 = int(_1476) & 3;
    float _1482 = (*spvDescriptorSet0.cp_c6)._m0[int(_1478)][_1480];
    int _1484 = int(_1476) + 1;
    uint _1486 = uint(int(uint(_1484) >> uint(2)));
    int _1488 = _1484 & 3;
    float _1490 = (*spvDescriptorSet0.cp_c6)._m0[int(_1486)][_1488];
    float _1492 = fma(_1164, _1278, _1398);
    float _1494 = fma(_1164, _1288, _1436);
    float _1496 = fma(_1164, _1296, _1438);
    float _1498 = fma(_1172, _1278, _1428);
    float _1500 = fma(_1172, _1288, _1440);
    float _1502 = fma(_1180, _1296, _1462);
    float _1504 = _1468 + _1174;
    int _1506 = _816 + 56;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    uint _1510 = uint(int(uint(int(_1508)) >> uint(2)));
    int _1512 = int(_1508) & 3;
    float _1514 = (*spvDescriptorSet0.cp_c6)._m0[int(_1510)][_1512];
    int _1516 = int(_1508) + 1;
    uint _1518 = uint(int(uint(_1516) >> uint(2)));
    int _1520 = _1516 & 3;
    float _1522 = (*spvDescriptorSet0.cp_c6)._m0[int(_1518)][_1520];
    float _1524 = fma(_1180, _1278, _1430);
    float _1526 = fma(_1180, _1288, _1464);
    float _1528 = _1502 + _1182;
    float _1530 = _1496 + _1166;
    float _1532 = _1470 * _1314;
    float _1534 = _1498 * _1314;
    float _1536 = _1500 * _1314;
    float _1538 = _1504 * _1314;
    float _1540 = fma(_1466, _1306, _1532);
    float _1542 = fma(_1492, _1306, _1534);
    float _1544 = fma(_1494, _1306, _1536);
    float _1546 = fma(_1530, _1306, _1538);
    float _1548 = _1504 * _1386;
    float _1550 = _1470 * _1386;
    float _1552 = _1498 * _1386;
    float _1554 = _1500 * _1386;
    float _1556 = fma(_1530, _1378, _1548);
    float _1558 = fma(_1466, _1378, _1550);
    float _1560 = fma(_1492, _1378, _1552);
    float _1562 = fma(_1494, _1378, _1554);
    int _1564 = _1224 * 48;
    float _1566 = _1504 * _1422;
    float _1568 = _1470 * _1422;
    float _1570 = _1498 * _1422;
    float _1572 = _1500 * _1422;
    float _1574 = fma(_1530, _1414, _1566);
    float _1576 = fma(_1466, _1414, _1568);
    float _1578 = fma(_1492, _1414, _1570);
    float _1580 = fma(_1494, _1414, _1572);
    float _1582 = fma(_1528, _1450, _1546);
    float _1584 = fma(_1524, _1450, _1542);
    float _1586 = fma(_1472, _1450, _1540);
    float _1588 = fma(_1526, _1450, _1544);
    float _1590 = _1582 + _1458;
    float _1592 = fma(_1528, _1482, _1556);
    float _1594 = fma(_1472, _1482, _1558);
    float _1596 = fma(_1524, _1482, _1560);
    float _1598 = fma(_1526, _1482, _1562);
    float _1600 = _1592 + _1490;
    int _1602 = _1564 + 16;
    int _1604 = _1564 + 32;
    float _1606 = fma(_1528, _1514, _1574);
    float _1608 = fma(_1472, _1514, _1576);
    float _1610 = fma(_1524, _1514, _1578);
    float _1612 = fma(_1526, _1514, _1580);
    float _1614 = _1606 + _1522;
    int _1616 = _1564 + 48;
    uint _1618 = uint(int(uint(_1602) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1618)] = as_type<uint>(_1586);
    int _1620 = _1602 + 4;
    uint _1622 = uint(int(uint(_1620) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1622)] = as_type<uint>(_1584);
    int _1624 = _1602 + 8;
    uint _1626 = uint(int(uint(_1624) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1626)] = as_type<uint>(_1588);
    int _1628 = _1602 + 12;
    uint _1630 = uint(int(uint(_1628) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1630)] = as_type<uint>(_1590);
    uint _1632 = uint(int(uint(_1604) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1632)] = as_type<uint>(_1594);
    int _1634 = _1604 + 4;
    uint _1636 = uint(int(uint(_1634) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1636)] = as_type<uint>(_1596);
    int _1638 = _1604 + 8;
    uint _1640 = uint(int(uint(_1638) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1640)] = as_type<uint>(_1598);
    int _1642 = _1604 + 12;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1644)] = as_type<uint>(_1600);
    uint _1646 = uint(int(uint(_1616) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1646)] = as_type<uint>(_1608);
    int _1648 = _1616 + 4;
    uint _1650 = uint(int(uint(_1648) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1650)] = as_type<uint>(_1610);
    int _1652 = _1616 + 8;
    uint _1654 = uint(int(uint(_1652) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1654)] = as_type<uint>(_1612);
    int _1656 = _1616 + 12;
    uint _1658 = uint(int(uint(_1656) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1658)] = as_type<uint>(_1614);
}

